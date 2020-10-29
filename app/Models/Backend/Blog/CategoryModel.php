<?php
namespace App\Models\Backend\Blog;


use App\Models\BaseModel;

class CategoryModel extends BaseModel
{
    protected $table = 'category';
    protected $primaryKey = 'id';


    function _get($id = false)
    {
        $sql = "select * from category";
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

    function _deleteChildren ($parent){
        $ref = "-".$parent."-";
        $this->builder($this->table);
        $this->builder->like('ref',$ref, 'both');
        $query   = $this->builder->delete();

        return true;
    }

}
