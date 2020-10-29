<?php
namespace App\Models\Backend\Image;

use CodeIgniter\Model;
class CategoryModel extends Model
{
    protected $table = 'image_category';
    protected $primaryKey = 'id';

    protected $returnType     = 'array';
    protected $useSoftDeletes = true;

    protected $allowedFields = ['name', 'parent', 'ref', 'slug'];

    protected $useTimestamps = false;
    protected $updatedField  = 'date_update';
    protected $deletedField  = 'date_update';

    function _get($id = false)
    {
        $this->builder($this->table);
        if($id) $this->builder->where('id', $id);
        $this->builder->where('id !=', '1');
        $query = $this->builder->get();
        return ($id) ? $query->getRowArray() : $query->getResult('array');
    }
    function _check_unique($field, $value, $id = false)
    {
        $this->builder($this->table);
        $this->builder->where($field, $value);
        if($id)$this->builder->where('id !=', $id);
        $query = $this->builder->get()->getResult();
        return (count($query) > 0 ) ? true : false ;
    }
    function __update($id, $data)
    {
        $this->builder($this->table);
        $this->builder->where('id', $id);
        $query = $this->builder->update($data);
        return $query;
    }
    function __getChildren($id)
    {
        $this->builder($this->table);
        $this->builder->like('ref', $id, 'both');
        $query = $this->builder->get()->getResult('array');
        return (count($query) > 0) ? $query : false;
    }
    function __get_images($data)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('image');
        $builder->whereIn('category_id', $data);
        $query = $builder->get()->getResult('array');
        return (count($query) > 0) ? $query : false;
    }
    function __delete_image($cat_id)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('image');
        $builder->whereIn('category_id', $cat_id);
        $builder->delete();
        return true;
    }
    function __delete_category($cat_id)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('image_category');
        $builder->whereIn('id', $cat_id);
        $builder->delete();
        return true;
    }
}
