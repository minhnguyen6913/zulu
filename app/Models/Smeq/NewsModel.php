<?php
namespace App\Models\Smeq;

use App\Models\BaseModel;

class NewsModel extends BaseModel
{
    function _gets($page)
    {
        $this->builder('news');
        $this->builder->select('news.*, image.src, image.category_id as cat_image');
        $this->builder->join('image', 'image.id = news.image',  'left');
        $this->builder->orderBy('news.date_create', 'DESC');
        $query   = $this->builder->get(9, ($page -1) * 9);
        return $query->getResult('array') ;
    }
    function _get($id)
    {
        $this->builder('news');
        $this->builder->select('news.*, image.src, image.category_id as cat_image');
        $this->builder->join('image', 'image.id = news.image','left');
        $this->builder->where('news.id', $id);
        $query   = $this->builder->get();
        return $query->getRowArray() ;
    }
    function _get_news_category($id, $page)
    {
        $this->builder('news');
        $this->builder->select('news.*, image.src, image.category_id as cat_image');
        $this->builder->join('image', 'image.id = news.image','left');
        $this->builder->where('news.category_id', $id);
        $this->builder->orderBy('news.date_create', 'DESC');
        $query   = $this->builder->get(9,($page - 1)* 9)->getResult('array');
        return (count($query) > 0 ) ?  $query : false ;
    }
    function _get_category()
    {
        $sql = "select id, name from category where type = 2";
        $query = $this->db->query($sql);
        return $query->getResult('array');
    }
    function _get_news_new($id = false)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('news');
        $builder->select('news.*, image.src, image.category_id as cat_image');
        $builder->join('image', 'image.id = news.image', 'left');
        if ($id) $builder->where('news.category_id', $id);
        $builder->orderBy('news.date_create', 'DESC');
        $query   = $builder->get(5,0)->getResult('array');
        return (count($query) > 0 ) ?  $query : false ;
    }
    function _countnews($id= false)
    {
        $this->builder('news');
        if ($id) $this->builder->where('category_id', $id);
        $query = $this->builder->get()->getResult('array');
        return (count($query) > 0) ? count($query) : 0;
    }
    function _search($key, $page)
    {
        $this->builder('tag');
        $this->builder->select('news.*, image.src, image.category_id as cat_image');
        $this->builder->join('tag_news', 'tag_news.tag_id = tag.id');
        $this->builder->join('news', 'news.id = tag_news.news_id');
        $this->builder->join('image', 'image.id = news.image', 'left');
        $this->builder->like('tag.slug', $key);
        $query = $this->builder->get(5, ($page - 1) * 5)->getResult('array');
        return (count($query) > 0) ? $query : false;
    }
    function _count_search_result($key)
    {
        $this->builder('tag');
        $this->builder->select('news.*, image.src, image.category_id as cat_image');
        $this->builder->join('tag_news', 'tag_news.tag_id = tag.id');
        $this->builder->join('news', 'news.id = tag_news.news_id');
        $this->builder->join('image', 'image.id = news.image', 'left');
        $this->builder->like('tag.slug', $key);
        $query = $this->builder->get()->getResult('array');
        return (count($query) > 0) ? count($query) : false;
    }
}
