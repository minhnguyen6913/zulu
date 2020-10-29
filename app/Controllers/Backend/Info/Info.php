<?php
namespace App\Controllers\Backend\Info;

use App\Controllers\BackendController;
use App\Models\Backend\Info\InfoModel;

class Info extends BackendController
{
    private $infoModel;
    private $imageRoot;

    public function __construct() 
    {
        $this->imageRoot = site_url().'backend/image/'; //for call image controller in ajax
        $this->pathRoot = site_url().'backend/info/';
        service('SmartyEngine')->assign('pathRoot', $this->pathRoot);
        service('SmartyEngine')->assign('imageRoot', $this->imageRoot);
        $this->infoModel = new InfoModel();
        helper('text');
    }
    public function index() {
        $list = $this->infoModel->_get();
        $data = array();

        $select_data = $select = array();
        $select_data[] = $select['LANGUAGE'] =  [
                'value' => 'LANGUAGE',
                'text' => 'Danh sách ngôn ngữ'
            ];
        $no = 0;
        foreach ($list as $item) {
            $data[$no] = $item;
            switch ($item['type']) {
                case 'int':
                    $data[$no]['type_name'] = 'Dạng số';
                    break;
                case 'list':
                    $data[$no]['type_name'] = 'Dạng danh sách';
                    break;
                case 'char':
                    $data[$no]['type_name'] = 'Dạng chuỗi';
                    break;
                case 'boolean':
                    $data[$no]['type_name'] = 'Dạng logic';
                    break;
            }
            $no++;
        }
        service('SmartyEngine')->assign('select', $select);
        service('SmartyEngine')->assign('select_data', json_encode($select_data));
        service('SmartyEngine')->assign('data', $data);
        return service('SmartyEngine')->view('backend/info/list.tpl');
    }

	public function ajax_list() {
        if ($this->request->isAJAX()) {
            $list = $this->infoModel->_getDatatables();
            $data = array();
            $no = @$_POST['start'];

            foreach ($list as $item) {
                $row = array();
                $row[] = ++ $no;
                $button = '';
                $button .= '<button class="btn btn-xs btn-info" onclick="_edit(' . $item->id . ')" data-toggle="tooltip" title="Sửa"><i class="fa fa-pencil"></i></button> ';
                $button .= '<button class="btn btn-xs btn-danger" onclick="_delete(' . $item->id . ')" data-toggle="tooltip" title="Xóa"><i class="fa fa-trash-o"></i></button> ';
                $row[] = "<div style='text-align:center'>{$button}</div>";

                $row[] = $item->name;
                $row[] = $item->define;
                $type = $value = '';
                switch ($item->type) {
                    case 'char':
                        $type = 'Dạng chuỗi';
                        $value = $item->value;
                        break;
                    case 'int':
                        $type = 'Dạng số';
                        $value = $item->value;
                        break;
                    case 'boolean':
                        $type = 'Dạng logic';
                        if ($item->value == '1') {
                            $value = '<i class="fa fa-check-circle"></i>';
                        } else {
                            $value = '<i class="fa fa-circle-o"></i>';
                        }
                        break;
                    case 'list':
                        $type = 'Dạng danh sách';
                        $value = $item->value;
                        switch ($item->value) {
                            case 'LANGUAGE':
                                $value = "Danh sách ngôn ngữ";
                                break;
                        }
                        break;
                }
                $row[] = $type;
                $row[] = $value;
                $data[] = $row;
            }
            $output = array(
                "draw" => @ $_POST['draw'],
                "recordsTotal" => $this->infoModel->_countAll(),
                "recordsFiltered" => $this->infoModel->_countFiltered(),
                "data" => $data,
            );
            echo json_encode($output);
        }
    }
    public function ajax_add(){
        if ($this->request->isAJAX()) {
            $input = $this->request->getPost();
            // Validate
            $validate = $this->infoModel->_checkUnique('info', 'define', $input['define']);
            if ($validate) {
                echo '0';die;
            }
             $data_insert = array(
                'name' => trim($input['name']),
                'define' => $input['define'],
                'type' => $input['type']
            );
            if ($input['type'] == 'boolean') {
                $data_insert['value'] = (isset($input['value'])) ? 1 : 0;
            } else {
                $data_insert['value'] = $input['value'];
            }
            $info_id = $this->infoModel->_insertData($data_insert);
            echo '1';
        }
        echo '0';
    }
    public function ajax_edit(){
        if ($this->request->isAJAX()) {
            $input = $this->request->getPost();

            $id = $input['id'];
            // Validate
            $validate = $this->infoModel->_checkUnique('info', 'define', $input['define'], $id);
            if ($validate) {
                echo '0';die;
            }
            $data = array(
                'name' => trim($input['name']),
                'define' => $input['define'],
                'type' => $input['type']
            );
            if ($input['type'] == 'boolean') {
                $data['value'] = (isset($input['value'])) ? 1 : 0;
            } else {
                $data['value'] = $input['value'];
            }

            $check = $this->infoModel->_updateData($id,$data);
            echo '1';
        }
        echo '1';
    }
    public function ajax_update () {
        if ($this->request->isAJAX()) {
            $input = $this->request->getPost();
            if (isset($input['pk'])) {
                $id = $input['pk'];
            }
            if (isset($input['id'])) {
                $id = $input['id'];
            }
            $info = $this->infoModel->_get($id);

            if ($info['type'] == 'boolean' ) {
                $data = array(
                    'value' => ($input['status'] == 'true') ? 1 : 0,
                );
            } else {
                $data = array(
                    'value' => $input['value']
                );
            }
            $check = $this->infoModel->_updateData($id,$data);
            echo '1';
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
            $check = $this->infoModel->_deleteData($where);
            echo $check;
        }
        echo '0';
    }
    public function getInfo() {
        if ($this->request->isAJAX()) {
            $id = $this->request->getPost('id');
            $info = $this->infoModel->_get($id);
            echo json_encode($info);
        }
    }
    public function add() 
    {
        service('SmartyEngine')->assign('add', true);
        return service('SmartyEngine')->view('backend/info/action.tpl');
    }
    public function edit() 
    {  
        $id = $this->request->getVar('id'); 
        $info = $this->infoModel->_get($id);
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('data', $info);
        service('SmartyEngine')->assign('edit', true);
        return service('SmartyEngine')->view('backend/info/action.tpl');
    }

}
