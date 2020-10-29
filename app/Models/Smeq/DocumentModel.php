<?php
namespace App\Models\Smeq;

use App\Models\BaseModel;

class DocumentModel extends BaseModel
{
    function _gets($page)
    {
        $this->builder('document');
        $this->builder->select('document.*, image.src, image.category_id as cat_image');
        $this->builder->join('image', 'image.id = document.image', 'left');
        $this->builder->orderBy('date_create', 'DESC');
        $query   = $this->builder->get(5, ($page - 1) * 5);
        return $query->getResult('array') ;
    }
    function _get($id)
    {
        $this->builder('document');
        $this->builder->select('document.*, image.src, image.category_id as cat_image');
        $this->builder->join('image', 'image.id = document.image','left');
        $this->builder->where('document.id', $id);
        $query   = $this->builder->get();
        return $query->getRowArray() ;
    }
    function _get_document_category($id, $page)
    {
        $this->builder('document');
        $this->builder->select('document.*, image.src, image.category_id as cat_image');
        $this->builder->join('image', 'image.id = document.image','left');
        $this->builder->where('document.category_id', $id);
        $this->builder->orderBy('date_create', 'DESC');
        $query   = $this->builder->get(5, ($page - 1) * 5)->getResult('array');
        return (count($query) > 0 ) ?  $query : false ;
    }
    function _get_category($id = false)
    {
        $sql = "select id, name from category where type = 3";
        if ($id) $sql .= " and id = {$id}";
        $query = $this->db->query($sql);
        return $query->getResult('array');
    }
    function _get_documentnew($id = false)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('document');
        $builder->select('document.*, image.src, image.category_id as cat_image');
        $builder->join('image', 'image.id = document.image', 'left');
        if ($id) $builder->where('document.category_id', $id);
        $builder->orderBy('date_create', 'DESC');
        $query   = $builder->get(5,0)->getResult('array');
        return (count($query) > 0 ) ?  $query : false ;
    }
    function _countdocument($id= false)
    {
        $this->builder('document');
        if ($id) $this->builder->where('category_id', $id);
        $query = $this->builder->get()->getResult('array');
        return (count($query) > 0) ? count($query) : 0;
    }
    function _search($key, $page)
    {
        $this->builder('tag');
        $this->builder->select('document.*, image.src, image.category_id as cat_image');
        $this->builder->join('tag_document', 'tag_document.tag_id = tag.id');
        $this->builder->join('document', 'document.id = tag_document.document_id');
        $this->builder->join('image', 'image.id = document.image', 'left');
        $this->builder->like('tag.slug', $key);
        $query = $this->builder->get(5, ($page - 1) * 5)->getResult('array');
        return (count($query) > 0) ? $query : false;
    }
    function _count_search_result($key)
    {
        $this->builder('tag');
        $this->builder->select('document.*, image.src, image.category_id as cat_image');
        $this->builder->join('tag_document', 'tag_document.tag_id = tag.id');
        $this->builder->join('document', 'document.id = tag_document.document_id');
        $this->builder->join('image', 'image.id = document.image', 'left');
        $this->builder->like('tag.slug', $key);
        $query = $this->builder->get()->getResult('array');
        return (count($query) > 0) ? count($query) : 0;
    }
}
