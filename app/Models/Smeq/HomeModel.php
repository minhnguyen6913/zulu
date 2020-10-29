<?php
namespace App\Models\Smeq;

use App\Models\BaseModel;

class HomeModel extends BaseModel
{
    function _get_activity()
    {
        $this->builder('homepage');
        $this->builder->select('activities.*, image.src, image.category_id as cat_image');
        $this->builder->join('activities','activities.id = homepage.article_id');
        $this->builder->join('image', 'image.id = activities.image', 'left');
        $this->builder->where('homepage.type ', '1');
        $this->builder->orderBy('homepage.id', 'DESC');
        $query   = $this->builder->get()->getResult('array');
        return (count($query)>0) ? $query : false;
    }
    function _get_news()
    {
        $this->builder('homepage');
        $this->builder->select('news.*, image.src, image.category_id as cat_image');
        $this->builder->join('news','news.id = homepage.article_id');
        $this->builder->join('image', 'image.id = news.image', 'left');
        $this->builder->where('homepage.type ', '2');
        $this->builder->orderBy('homepage.id', 'DESC');
        $query   = $this->builder->get(3, 0)->getResult('array');
        return (count($query)>0) ? $query : false;
    }
    function _get_documents()
    {
        $this->builder('homepage');
        $this->builder->select('document.*, image.src, image.category_id as cat_image');
        $this->builder->join('document','document.id = homepage.article_id');
        $this->builder->join('image', 'image.id = document.image', 'left');
        $this->builder->where('homepage.type ', '3');
        $this->builder->orderBy('homepage.id', 'DESC');
        $query   = $this->builder->get()->getResult('array');
        return (count($query)>0) ? $query : false;
    }
    function _get_slides()
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('slide');
        $builder->select('slide.*, image.src, image.category_id as cat_image');
        $builder->join('image', 'image.id = slide.image', 'left');
        $query   = $builder->get()->getResult('array');
        return (count($query)>0) ? $query : false;
    }
    function _get_info()
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('info');
        $builder->select('*');
        $query   = $builder->get()->getResult('array');
        return (count($query)>0) ? $query : false;
    }
    function _get_customers()
    {
        $db = \Config\Database::connect();
        $builder = $db->table('customer');
        $builder->select('customer.*, image.src, image.category_id as cat_image');
        $builder->join('image', 'image.id  = customer.logo', 'left');
        $query = $builder->get()->getResult('array');
        return (count($query) > 0) ? $query : false;
    }
}
