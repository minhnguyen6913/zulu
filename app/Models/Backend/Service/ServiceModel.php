<?php
namespace App\Models\Backend\Service;
use App\Models\BaseModel;


class ServiceModel extends BaseModel
{
    protected $table = 'program';
    protected $primaryKey = 'id';
    public $column = array('id', 'id', 'name', 'code'); //set column field database for order and search
    public $order = array('id' => 'ASC'); // default order
    //Datatable

    private function _getDatatablesQuery()
    {
        $this->builder($this->table);
        $i = 0;
        foreach ($this->column as $item) {
            $value = trim(@$_POST['search']['value']);
            if ($value) {
                if ($i === 0) {
                    $this->builder->groupStart();
                    $this->builder->like($item, $value);
                } else {
                    $this->builder->orLike($item, $value);
                }
                if (count($this->column) - 1 == $i) {
                    $this->builder->groupEnd();
                }

            }
            $column[$i] = $item;
            $i++;
        }
        if (isset($_POST['order'])) {
            $this->builder->orderBy($column[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
        } elseif (isset($this->order)) {
            $order = $this->order;
            $this->builder->orderBy(key($order), $order[key($order)]);
        }

    }
    public function _getDatatables()
    {
        $this->_getDatatablesQuery();
        if (@$_POST['length'] != -1) {
            $this->builder->limit(@$_POST['length'], @$_POST['start']);
        }
        $query = $this->builder->get();
        return $query->getResult();
    }
    public function _countFiltered()
    {
        $this->_getDatatablesQuery();
        return $this->builder->countAllResults();
    }
    public function _countAll()
    {
        $this->builder($this->table);
        $query = $this->builder->get()->getResult();
        return  $query ? count($query) : 0;
    }


    function _get($id = false)
    {
        $sql = "select * from {$this->table}";
        if($id) $sql .= " where id = {$id}";
        $query = $this->db->query($sql);
        return ($id) ? $query->getRowArray():$query->getResult('array') ;
    }


    function _updateData ($id, $data)
    {
        $this->builder($this->table);
        $this->builder->where('id', $id);
        $query   = $this->builder->update($data);
        return $query;
    }
    function _insertData ($data)
    {
        $this->builder($this->table);
        $query   = $this->builder->insert($data);
        return $query->connID->insert_id;
    }
    function _deleteData($where = false) {
        $this->builder($this->table);
        if ($where) {
            foreach ($where as $field => $value) {
                if (is_array($value)) {
                    $this->builder->whereIn($field, $value);
                } else {
                    $this->builder->where($field, $value);
                }
            }
            $query   = $this->builder->delete();
            return true;
        }else return false;
    }
    function _getTagService($service_id) {
        $this->builder('tag');
        $this->builder->select('*');
        $this->builder->join('tag_program', 'tag.id = tag_program.tag_id');
        $this->builder->where('tag_program.program_id', $service_id);
        $query   = $this->builder->get()->getResult('array');
        return (count($query) > 0 ) ?  $query : false ;
    }
    function _getTag($id = false)
    {
        $sql = "select * from tag";
        if($id) $sql .= " where id = {$id}";
        $query = $this->db->query($sql);
        return ($id) ? $query->getRowArray():$query->getResult('array') ;
    }
    function _checkTag($slug)
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('tag');
        $builder->where('slug', $slug);
        $query   = $builder->get()->getResult('array');
        return (count($query) > 0 ) ? $query[0]['id'] : false ;
    }

    function _insertTag ($data)
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('tag');
        $query   = $builder->insert($data);
        return $query->connID->insert_id;
    }
    function _insertTagService ($data)
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('tag_program');
        $query   = $builder->insert($data);

        return $query->connID->insert_id;
    }
    function _deleteTagService ($id)
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('tag_program');
        $builder->where('program_id', $id);
        $builder->delete();
        return true;
    }
}
