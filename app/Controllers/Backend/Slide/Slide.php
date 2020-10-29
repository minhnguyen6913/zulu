<?php
namespace App\Controllers\Backend\Slide;

use App\Controllers\BackendController;
use App\Models\Backend\Slide\SlideModel;

class Slide extends BackendController
{
    private $slideModel;
    private $imageRoot;

    public function __construct()
    {
        $this->imageRoot = site_url().'backend/image/'; //for call image controller in ajax
        $this->pathRoot = site_url().'backend/slide/';
        service('SmartyEngine')->assign('pathRoot', $this->pathRoot);
        service('SmartyEngine')->assign('imageRoot', $this->imageRoot);
        $this->slideModel = new SlideModel();
        helper('text');
    }
    public function index() {
        return service('SmartyEngine')->view('backend/slide/list.tpl');
    }
    public function ajax_list() {
        if ($this->request->isAJAX()) {
            $list = $this->slideModel->_getDatatables();
            $data = array();
            $no = @$_POST['start'];

            foreach ($list as $item) {
                $row = array();
                $row[] = ++ $no;
                $button = '';
                $button .= '<button class="btn btn-xs btn-info" onclick="_edit(' . $item->id . ')" data-toggle="tooltip" title="Sửa"><i class="fa fa-pencil"></i></button> ';
                $button .= '<button class="btn btn-xs btn-danger" onclick="_delete(' . $item->id . ')" data-toggle="tooltip" title="Xóa"><i class="fa fa-trash-o"></i></button> ';
                $row[] = "<div style='text-align:center'>{$button}</div>";
                $href = $this->pathRoot.'slide/detail?id='.$item->id;
                $row[] = "<a href='{$href}'>" . $item->name . "</a>";
                $data[] = $row;
            }
            $output = array(
                "draw" => @ $_POST['draw'],
                "recordsTotal" => $this->slideModel->_countAll(),
                "recordsFiltered" => $this->slideModel->_countFiltered(),
                "data" => $data,
            );
            echo json_encode($output);
        }
    }
    public function ajax_add(){
        if ($this->request->isAJAX()) {
            $input = $this->request->getPost();
            $slug = url_title(convert_accented_characters($input['name']), '-', true);
            // Validate
            $validate = $this->slideModel->_checkUnique('slide', 'name', $input['name']);
            if ($validate) {
                echo '0';die;
            }
            $data_insert = array(
                'slug' => $slug,
                'name' => trim($input['name']),
                'image' => ($input['image'] > 0) ? $input['image'] : 1,
                'link' => trim($input['link']),
            );
            $slide_id = $this->slideModel->_insertData($data_insert);
            echo '1';
        }
        echo '0';
    }
    public function ajax_edit(){
        if ($this->request->isAJAX()) {
            $input = $this->request->getPost();
            $id = $input['id'];
            $slug = url_title(convert_accented_characters($input['name']), '-', true);
            $validate = $this->slideModel->_checkUnique('slide', 'name', $input['name'], $id);
            if ($validate) {
                echo '0';die;
            }
           $data = array(
                'slug' => $slug,
                'name' => trim($input['name']),
                'image' => ($input['image'] > 0) ? $input['image'] : 1,
                'link' => trim($input['link']),
            );
            $check = $this->slideModel->_updateData($id,$data);
            echo '1';
        }
        echo '1';
    }
    public function ajax_delete(){
        if ($this->request->isAJAX()) {
            $input = $this->request->getPost();
            // Validate
            $where = array(
                'id' => $input['id']
            );
            $check = $this->slideModel->_deleteData($where);
            echo $check;
        }
        echo '0';
    }
    public function getSlide() {
        if ($this->request->isAJAX()) {
            $id = $this->request->getPost('id');
            $slide = $this->slideModel->_get($id);
            echo json_encode($slide);
        }
    }
    public function add()
    {
        service('SmartyEngine')->assign('add', true);
        return service('SmartyEngine')->view('backend/slide/action.tpl');
    }
    public function edit()
    {
        $id = $this->request->getVar('id');
        $slide = $this->slideModel->_get($id);
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('data', $slide);
        service('SmartyEngine')->assign('edit', true);
        return service('SmartyEngine')->view('backend/slide/action.tpl');
    }
    public function detail()
    {
        $id = $this->request->getVar('id');
        $slide = $this->slideModel->_get($id);
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('data', $slide);
        service('SmartyEngine')->assign('edit', true);
        return service('SmartyEngine')->view('backend/slide/detail.tpl');
    }
}
