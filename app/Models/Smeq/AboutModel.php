<?php
namespace App\Models\Smeq;

use App\Models\BaseModel;

class AboutModel extends BaseModel
{
    function _gets($page = false)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('category');
        $builder->select('category.*, image.src, image.category_id as cat_image');
        $builder->join('image', 'image.id = category.image','left');
        $builder->where('category.type', 1);
        $builder->orderBy('category.date_create', 'DESC');
        $query   = ($page) ? $builder->get(5, ($page -1) * 5)->getResult('array') : $builder->get()->getResult('array');
        return (count($query)>0) ? $query : false;
    }
    function _get($id)
    {
        $this->builder('category');
        $this->builder->select('category.*, image.src, image.category_id as cat_image');
        $this->builder->join('image', 'image.id = category.image', 'left');
        $this->builder->where('category.id', $id);
        $query   = $this->builder->get();
        return $query->getRowArray() ;
    }

    function _get_about_new()
    {
        $db = \Config\Database::connect();
        $builder = $db->table('category');
        $builder->select('category.*, image.src, image.category_id as cat_image');
        $builder->join('image', 'image.id = category.image', 'left');
        $builder->where('category.type', 1);
        $builder->orderBy('category.date_create', 'DESC');
        $query   = $builder->get(5,0)->getResult('array');
        return (count($query) > 0 ) ?  $query : false ;
    }
    function _countabout()
    {
        $this->builder('category');
        $this->builder->where('type',  1);
        $query = $this->builder->get()->getResult('array');
        return (count($query) > 0) ? count($query) : 0;
    }
    function _search($key, $page)
    {
        $this->builder('tag');
        $this->builder->select('category.*, image.src, image.category_id as cat_image');
        $this->builder->join('tag_category', 'tag_category.tag_id = tag.id');
        $this->builder->join('category', 'category.id = tag_category.category_id');
        $this->builder->join('image', 'image.id = category.image', 'left');
        $this->builder->like('tag.slug', $key);
        $query = $this->builder->get(5, ($page - 1) * 5)->getResult('array');
        return (count($query) > 0) ? $query : false;
    }
    function _count_search_result($key)
    {
        $this->builder('tag');
        $this->builder->select('category.*, image.src, image.category_id as cat_image');
        $this->builder->join('tag_category', 'tag_category.tag_id = tag.id');
        $this->builder->join('category', 'category.id = tag_category.category_id');
        $this->builder->join('image', 'image.id = category.image', 'left');
        $this->builder->like('tag.slug', $key);
        $query = $this->builder->get()->getResult('array');
        return (count($query) > 0) ? count($query) : false;
    }
}
