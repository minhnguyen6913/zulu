<?php
namespace App\Controllers\Backend\Image;

use App\Controllers\BackendController;
use App\Models\Backend\Image\CategoryModel;

class Category extends BackendController
{
    private $tree;
    private $treeTable;
    private $mod_category;
    function __construct()
    {
        $this->pathRoot = site_url().'backend/image/';
        $this->upload_path = './uploads/images/';
        service('SmartyEngine')->assign('pathRoot', $this->pathRoot);
        $this->mod_category = new CategoryModel();
        helper('text');
    }
    public function index()
    {
        $rs = $this->mod_category->_get();
        foreach ($rs as $rec) {
            $rec['parent'] = ($rec['parent'] != null) ? $rec['parent'] : '0';
            $this->tree[$rec['parent']][$rec['id']] = $rec;
        }
        $this->createTableTree();
        service('SmartyEngine')->assign('treeTable', $this->treeTable);
        return service('SmartyEngine')->view('backend/image/category.tpl');
    }
    public function ajax_add()
    {
        if ($this->request->getVar('isSent') == 'OK') {
            $input = $this->request->getPost();
            $slug = url_title(convert_accented_characters($input['name']), '-', true);
            $validate = $this->mod_category->_check_unique('slug', $slug);
            if ($validate) {
                echo '0';
            }
            $parent = NULL;
            if (isset($input['parent']) && $input['parent'] > 0) {
                $category_parent = $this->mod_category->_get($input['parent']);
                $ref = $category_parent['ref'].$input['parent']."-";
                $parent = $input['parent'];
            } else {
                $ref = '-';
            }
            $data_insert = array(
                'slug' => $slug,
                'name' => trim($input['name']),
                'parent' => $parent,
                'ref' => $ref,
            );
            $check = $this->mod_category->insert($data_insert);
            //create folder

            if ($check > 0) {
                $path =$this->upload_path.$check;
                if (!file_exists($path)) {
                    mkdir($path, 0644);
                    chmod($path, 0644);
                }
            }
            echo $check;
        }
    }
    public function edit()
    {
        $id = $this->request->getPost('id');
        $category = $this->mod_category->_get($id);
        echo json_encode($category);
    }
    public function ajax_edit()
    {
        if ($this->request->getVar('isSent') == 'OK') {
            $input = $this->request->getPost();
            $slug = url_title(convert_accented_characters($input['name']), '-', true);
            $validate = $this->mod_category->_check_unique('slug', $slug, $input['id']);
            if ($validate) {
                echo '0';
            }
            $parent = NULL;
            if (isset($input['parent']) && $input['parent'] > 0) {
                $category_parent = $this->mod_category->_get($input['parent']);
                $ref = $category_parent['ref'].$input['parent']."-";
                $parent = $input['parent'];
            } else {
                $ref = '-';
            }
            $data_update = array(
                'slug' => $slug,
                'name' => trim($input['name']),
                'parent' => $parent,
                'ref' => $ref,
            );
            $check = $this->mod_category->__update($input['id'], $data_update);
            echo $check;
        }
    }
    public function ajax_delete()
    {
        if ($this->request->getVar('isSent') == 'OK') {
            $id = $this->request->getVar('id');
            $list = $this->mod_category->__getChildren($id);
            $data = array();
            if ($list) {
                foreach ($list as $item) {
                    array_push($data, $item['id']);
                }
            }
            array_push($data, $id);
            $list_image = $this->mod_category->__get_images($data);
            if ($list_image) {
                foreach ($list_image as $img) {
                    unlink($this->upload_path.$id."/".$img['src']);
                }
            }
            $this->mod_category->__delete_image($data);
            $this->mod_category->__delete_category($data);
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

            $this->treeTable .= "
                <td class='button' nowrap='nowrap'>{$button}</td>
                <td><a href='{$this->pathRoot}image?id={$value['id']}'>{$value['name']}</a></td>
                <td>{$value['type']}</td>
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
    public function baseImage() {

    }
}

