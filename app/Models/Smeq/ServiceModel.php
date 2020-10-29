<?php
namespace App\Models\Smeq;

use App\Models\BaseModel;

class ServiceModel extends BaseModel
{
    function _get_services($page = false)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('program');
        $builder->select('program.*, image.src, image.category_id as cat_image');
        $builder->join('image', 'image.id = program.image', 'left');
        $query = ($page) ? $builder->get(5, ($page - 1) * 5)->getResult('array') :$builder->get()->getResult('array');
        return (count($query) > 0) ? $query : false;
    }
    function _get_service($id)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('program');
        $builder->select('program.*, image.src, image.category_id as cat_image');
        $builder->join('image', 'image.id = program.image', 'left');
        $builder->where('program.id', $id);
        $query = $builder->get();
        return $query->getRowArray();
    }
    function _countservice()
    {
        $db = \Config\Database::connect();
        $builder = $db->table('program');
        $query = $builder->get()->getResult('array');
        return (count($query) > 0) ? count($query) : 0;
    }
    function _search($key, $page)
    {
        $this->builder('tag');
        $this->builder->select('program.*, image.src, image.category_id as cat_image');
        $this->builder->join('tag_program', 'tag_program.tag_id = tag.id');
        $this->builder->join('program', 'program.id = tag_program.program_id');
        $this->builder->join('image', 'image.id = program.image', 'left');
        $this->builder->like('tag.slug', $key);
        $query = $this->builder->get(5, ($page - 1) * 5)->getResult('array');
        return (count($query) > 0) ? $query : false;
    }
    function _count_search_result($key)
    {
        $this->builder('tag');
        $this->builder->select('program.*, image.src, image.category_id as cat_image');
        $this->builder->join('tag_program', 'tag_program.tag_id = tag.id');
        $this->builder->join('program', 'program.id = tag_program.program_id');
        $this->builder->join('image', 'image.id = program.image', 'left');
        $this->builder->like('tag.slug', $key);
        $query = $this->builder->get()->getResult('array');
        return (count($query) > 0) ? count($query) : 0;
    }
}
