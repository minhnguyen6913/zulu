<?php
namespace App\Controllers\Backend\Blog;

use App\Controllers\BackendController;
use App\Models\Backend\Blog\CategoryModel;

class Category extends BackendController
{
    private $tree;
    private $treeTable;
    private $categoryModel;
    private $imageRoot;

    function __construct()
    {
        $this->pathRoot = site_url().'backend/blog/';
        $this->imageRoot = site_url().'backend/image/'; //for call image controller in ajax
        service('SmartyEngine')->assign('pathRoot', $this->pathRoot);
        service('SmartyEngine')->assign('imageRoot', $this->imageRoot);
        $this->categoryModel = new CategoryModel();
        helper('text');
    }
    public function index()
    {
        $rs = $this->categoryModel->_get();
        foreach ($rs as $rec) {
            $rec['parent'] = ($rec['parent'] != null) ? $rec['parent'] : '0';
            $this->tree[$rec['parent']][$rec['id']] = $rec;
        }
        $this->createTableTree();
        service('SmartyEngine')->assign('treeTable', $this->treeTable);
        return service('SmartyEngine')->view('backend/blog/category/category.tpl');
    }
    public function ajax_add(){
        
        if ($this->request->isAJAX()) {

            $input = $this->request->getPost();
            
            $slug = url_title(convert_accented_characters($input['name']), '-', true);
            // Validate

            $validate = $this->categoryModel->_checkUnique('category', 'name', $input['name']);

            if ($validate) {
                echo '0';die;
            }
            $parent = null;
            if (isset($input['parent']) && $input['parent'] > 0) {
                $category_parent = $this->categoryModel->_get($input['parent']);
                $ref = $category_parent['ref'].$input['parent']."-";
                $parent = $input['parent'];
            } else {
                $ref = '-';
            }
            $data_insert = array(
                'slug' => $slug,
                'parent' => $parent,
                'ref' => $ref,
                'name' => trim($input['name']),
                'content' => $input['content'],
                'type' => $input['type'],
                'sort' => $input['sort'],
                'image' => ($input['image'] > 0) ? $input['image'] : 1,
                'style' => $input['style'],
            );

            $check = $this->categoryModel->_insertData($data_insert);
            echo $check;
        }
        echo '0';
    }
    public function ajax_delete(){

        if ($this->request->isAJAX()) {

            $input = $this->request->getPost();
            // Validate
            $where = array(
                'id' => $input['id']
            );
            $check = $this->categoryModel->_deleteData($where);

            $delete_children = $this->categoryModel->_deleteChildren($input['id']);
            echo $check;
        }
        echo '0';
    }
    public function ajax_edit(){

        if ($this->request->isAJAX()) {
            $input = $this->request->getPost();
            $validate = $this->categoryModel->_checkUnique('category','name',$input['name'], $input['id']);
            if ($validate) {
                echo '0';die;
            }
            $data = array(
                'slug' => url_title(convert_accented_characters($input['name']), '-', true),
                'name' => trim($input['name']),
                'content' => $input['content'],
                'type' => $input['type'],
                'sort' => $input['sort'],
                'image' => ($input['image'] > 0) ? $input['image'] : 1,
                'style' => $input['style'],
            );

            $check = $this->categoryModel->_updateData($input['id'],$data);
            echo $check;
        }
        echo '1';
    }
    public function getCategory() {
        if ($this->request->isAJAX()) {
            $id = $this->request->getPost('id');
            $category = $this->categoryModel->_get($id);
            echo json_encode($category);
        }
    }
    private function createTableTree($cid = '0', $parentNo = '', $level = 1)
    {
        if (!isset($this->tree[$cid]))
        {
            return false;
        }
        $no = 0;

        foreach ($this->tree[$cid] as $key => $value)
        {
            $no++;
            if ($parentNo != '')
            {
                $this->treeTable .= "<tr data-tt-id='$parentNo-$no' data-tt-parent-id='$parentNo'>";
            } else {
                $this->treeTable .= "<tr data-tt-id='$no'>";
            }

            $button = '';
            $button .= '<button class="btn btn-xs btn-warning" onclick="_add(' . $value['id'] . ')" data-toggle="tooltip" title="Thêm"><i class="ace-icon fa fa-plus bigger-110"></i></button>';
            $button .= ' <button class="btn btn-xs btn-info" onclick="_edit(' . $value['id'] . ')" data-toggle="tooltip" title="Cập nhật"><i class="ace-icon fa fa-pencil bigger-110"></i></button>';
            $button .= ' <button class="btn btn-xs btn-danger" onclick="_delete(' . $value['id'] . ')" data-toggle="tooltip" title="Xóa"><i class="ace-icon fa fa-trash-o bigger-110"></i></button>';
            $button .= ' <button class="btn btn-xs btn-success" onclick="_show(' . $value['id'] . ')" data-toggle="tooltip" title="Xem chi tiết"><i class="ace-icon fa fa-search bigger-110"></i></button>';
            switch ($value['type']) {
                case '1':
                    $type="Bài viết";
                    break;
                case '2':
                    $type="Tin tức";
                    break;
                case '3':
                    $type="Văn bản pháp quy";
                    break;
            }
            $this->treeTable .= "
                <td class='button' nowrap='nowrap'>{$button}</td>
                <td><a href='" . $this->pathRoot. "category/detail?id={$value['id']}'>{$value['name']}</a></td>
                <td>{$type}</td>
                <td>{$value['sort']}</td>
            ";
            $this->treeTable .= "</tr>\n";
            if ($parentNo != '')
            {
                $this->createTableTree($key, $parentNo . '-' . $no, $level + 1);
            } else {
                $this->createTableTree($key, $no, $level + 1);
            }
        }
    }
    public function add()
    {
        $parent = $this->request->getVar('parent');
        service('SmartyEngine')->assign('parent', $parent);
        service('SmartyEngine')->assign('id', '');
        service('SmartyEngine')->assign('add', true);
        return service('SmartyEngine')->view('backend/blog/category/action.tpl');
    }
    public function edit()
    {
        $id = $this->request->getVar('id');
        $category = $this->categoryModel->_get($id);
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('category', $category);
        service('SmartyEngine')->assign('edit', true);
        return service('SmartyEngine')->view('backend/blog/category/action.tpl');
    }
    public function detail()
    {
        $id = $this->request->getVar('id');
        $category = $this->categoryModel->_get($id);
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('category', $category);
        switch ($category['type']) {
            case 1:
                return service('SmartyEngine')->view('backend/blog/category/detail.tpl');
                break;
            case 2:
                return service('SmartyEngine')->view('backend/blog/category/category_news.tpl');
                break;
            case 3:
                return service('SmartyEngine')->view('backend/blog/category/category_document.tpl');
                break;
        }
    }
    public function detailCategory()
    {
        $id = $this->request->getVar('id');
        $category = $this->categoryModel->_get($id);
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('category', $category);
        return service('SmartyEngine')->view('backend/blog/category/detail.tpl');
    }
}

