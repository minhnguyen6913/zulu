<?php
namespace App\Models\Backend\Image;

use CodeIgniter\Model;
class ImageModel extends Model
{
    protected $table = 'image';
    protected $primaryKey = 'id';

    protected $returnType     = 'array';
    protected $useSoftDeletes = true;

    protected $allowedFields = ['name', 'category_id', 'src'];

    protected $useTimestamps = false;

    function __get_images($cat_id)
    {
        $this->builder($this->table);
        $this->builder->where('category_id', $cat_id);
        $this->builder->where('id !=', '1');
        $this->builder->where('category_id !=', '1');
        $query = $this->builder->get();
        return $query->getResult('array');
    }

    function __get_image($id)
    {
        $sql = "select * from image where id = {$id}";
        $query = $this->db->query($sql);
        return $query->getRowArray();
    }
    function __delete($id)
    {
        $this->builder($this->table);
        $this->builder->where('id', $id);
        $this->builder->delete();
        return true;
    }
 }
