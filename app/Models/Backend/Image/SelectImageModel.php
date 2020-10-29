<?php
namespace App\Models\Backend\Image;

use App\Models\BaseModel;

class SelectImageModel extends BaseModel
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
    function _getImages($id = false, $category_id = false)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('image');
        if($id) $builder->where('id', $id);
        if($category_id) $builder->where('category_id', $category_id);
        $query = $builder->get()->getResult('array');
        return (count($query) > 0) ? $query : false;
    }

}
