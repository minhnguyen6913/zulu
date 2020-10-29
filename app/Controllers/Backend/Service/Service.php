<?php
namespace App\Controllers\Backend\Service;

use App\Controllers\BackendController;
use App\Models\Backend\Service\ServiceModel;
use DateTime;

class Service extends BackendController
{
    private $serviceModel;
    private $imageRoot;

    public function __construct()
    {
        $this->imageRoot = site_url().'backend/image/'; //for call image controller in ajax
        $this->pathRoot = site_url().'backend/service/';
        service('SmartyEngine')->assign('pathRoot', $this->pathRoot);
        service('SmartyEngine')->assign('imageRoot', $this->imageRoot);
        $this->serviceModel = new ServiceModel();
        helper('text');
    }
    public function index() {
        return service('SmartyEngine')->view('backend/service/list.tpl');
    }
    public function ajax_list() {
        if ($this->request->isAJAX()) {
            $list = $this->serviceModel->_getDatatables();
            $data = array();
            $no = @$_POST['start'];
            foreach ($list as $item) {
                $row = array();
                $row[] = ++ $no;
                $button = '';
                $button .= '<button class="btn btn-xs btn-info" onclick="_edit(' . $item->id . ')" data-toggle="tooltip" title="Sửa"><i class="fa fa-pencil"></i></button> ';
                $button .= '<button class="btn btn-xs btn-danger" onclick="_delete(' . $item->id . ')" data-toggle="tooltip" title="Xóa"><i class="fa fa-trash-o"></i></button> ';
                $row[] = "<div style='text-align:center'>{$button}</div>";
                $href = $this->pathRoot.'service/detail?id='.$item->id;
                $row[] = "<a href='{$href}'>" . $item->name . "</a>";
                $data[] = $row;
            }
            $output = array(
                "draw" => @ $_POST['draw'],
                "recordsTotal" => $this->serviceModel->_countAll(),
                "recordsFiltered" => $this->serviceModel->_countFiltered(),
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

            $validate = $this->serviceModel->_checkUnique('program', 'name', $input['name']);
            if ($validate) {
                echo '0';die;
            }
            $data_insert = array(
                'slug' => $slug,
                'name' => trim($input['name']),
                'content' => $input['content'],
                'image' => ($input['image'] > 0) ? $input['image'] : 1,
                'icon' => ($input['icon'] > 0) ? $input['icon'] : 1,
                'intro' => $input['intro'],
            );
            $service_id = $this->serviceModel->_insertData($data_insert);

            if (isset($input['tag'])) {
                if ($service_id && (count($input['tag']) > 0 )) {
                    foreach ($input['tag'] as $item) {

                        $tag_slug = url_title(convert_accented_characters($item), '-', true);

                        $tag_id = $this->serviceModel->_checkTag($tag_slug);


                        if (!$tag_id) {
                            $inset_tag = array(
                                'name' => $item,
                                'slug' => $tag_slug,
                            );
                            $tag_id = $this->serviceModel->_insertTag($inset_tag);

                        }
                        $insert_tag_service = array(
                            'program_id' => $service_id,
                            'tag_id' => $tag_id
                        );
                        $check = $this->serviceModel->_insertTagService($insert_tag_service);
                    }
                }
            }
            echo '1';
        }
        echo '0';
    }
    public function ajax_edit(){
        if ($this->request->isAJAX()) {
            $input = $this->request->getPost();
            $id = $input['id'];
            $slug = url_title(convert_accented_characters($input['name']), '-', true);
            $validate = $this->serviceModel->_checkUnique('program', 'name', $input['name'], $id);

            if ($validate) {

                echo '0';die;
            }
            $data = array(
                'slug' => $slug,
                'name' => trim($input['name']),
                'content' => $input['content'],
                'image' => ($input['image'] > 0) ? $input['image'] : 1,
                'icon' => ($input['icon'] > 0) ? $input['icon'] : 1,
                'intro' => $input['intro'],
            );
            $check = $this->serviceModel->_updateData($id,$data);
            $service_id = $id;
            $this->serviceModel->_deleteTagService($id);
            if (isset($input['tag'])) {
                if ($service_id && (count($input['tag']) > 0 )) {
                    foreach ($input['tag'] as $item) {
                        $tag_slug = url_title(convert_accented_characters($item), '-', true);
                        $tag_id = $this->serviceModel->_checkTag($tag_slug);
                        if (!$tag_id) {
                            $inset_tag = array(
                                'name' => $item,
                                'slug' => $tag_slug,
                            );
                            $tag_id = $this->serviceModel->_insertTag($inset_tag);
                        }
                        $insert_tag_service = array(
                            'program_id' => $service_id,
                            'tag_id' => $tag_id
                        );
                        $check = $this->serviceModel->_insertTagService($insert_tag_service);
                    }
                }
            }
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

            $check = $this->serviceModel->_deleteData($where);
            $this->serviceModel->_deleteTagService($input['id']);
            echo $check;
        }
        echo '0';
    }
    public function getService() {
        if ($this->request->isAJAX()) {
            $id = $this->request->getPost('id');
            $service = $this->serviceModel->_get($id);
            echo json_encode($service);
        }
    }
    public function add()
    {
        $tag = $this->serviceModel->_getTag();
        service('SmartyEngine')->assign('tag', $tag);
        service('SmartyEngine')->assign('add', true);
        return service('SmartyEngine')->view('backend/service/action.tpl');
    }
    public function edit()
    {
        $id = $this->request->getVar('id');
        $service = $this->serviceModel->_get($id);
        $old_tag = $this->serviceModel->_getTagService($id);
        $tag_service = array(0);
        if ($old_tag){
            $tag_service = array_column($old_tag, 'tag_id');
        }

        $tag = $this->serviceModel->_getTag();
        foreach ($tag as $t) {

            if (in_array($t['id'],$tag_service)) {
                $t['checked'] = true;
            } else {
                $t['checked'] = false;
            }
            $data_tag[] = $t;
        }
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('data', $service);
        service('SmartyEngine')->assign('tag', $data_tag);
        service('SmartyEngine')->assign('edit', true);
        return service('SmartyEngine')->view('backend/service/action.tpl');
    }
    public function detail()
    {
        $id = $this->request->getVar('id');
        $service = $this->serviceModel->_get($id);
        $old_tag = $this->serviceModel->_getTagService($id);
        $tag_service = array(0);
        if ($old_tag){
            $tag_service = array_column($old_tag, 'tag_id');
        }

        $tag = $this->serviceModel->_getTag();
        foreach ($tag as $t) {

            if (in_array($t['id'],$tag_service)) {
                $t['checked'] = true;
            } else {
                $t['checked'] = false;
            }
            $data_tag[] = $t;
        }
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('data', $service);
        service('SmartyEngine')->assign('tag', $data_tag);
        service('SmartyEngine')->assign('edit', true);
        return service('SmartyEngine')->view('backend/service/detail.tpl');
    }
}
