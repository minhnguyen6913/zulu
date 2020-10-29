<?php
namespace App\Controllers\Backend\Introduction;

use App\Controllers\BackendController;
use App\Models\Backend\Introduction\IntroductionModel;
use DateTime;

class Introduction extends BackendController
{
    private $introductionModel;
    private $imageRoot;

    public function __construct() 
    {
        $this->imageRoot = site_url().'backend/image/'; //for call image controller in ajax
        $this->pathRoot = site_url().'backend/introduction/';
        service('SmartyEngine')->assign('pathRoot', $this->pathRoot);
        service('SmartyEngine')->assign('imageRoot', $this->imageRoot);
        $this->introductionModel = new IntroductionModel();
        helper('text');
    }
    public function index() {
        return service('SmartyEngine')->view('backend/introduction/list.tpl');
    }
	public function ajax_list() {
        if ($this->request->isAJAX()) {
            $list = $this->introductionModel->_getDatatables();
            $data = array();
            $no = @$_POST['start'];

            foreach ($list as $item) {
                $row = array();
                $row[] = ++ $no;
                $button = '';
                $button .= '<button class="btn btn-xs btn-info" onclick="_edit(' . $item->id . ')" data-toggle="tooltip" title="Sửa"><i class="fa fa-pencil"></i></button> ';
                $button .= '<button class="btn btn-xs btn-danger" onclick="_delete(' . $item->id . ')" data-toggle="tooltip" title="Xóa"><i class="fa fa-trash-o"></i></button> ';
                $row[] = "<div style='text-align:center'>{$button}</div>";
                $href = $this->pathRoot.'introduction/detail?id='.$item->id;
                $row[] = "<a href='{$href}'>" . $item->name . "</a>";
                if ($item->status == '2') {
                    $status =  '<input type="checkbox" checked class="js-switch" data-color="#13dafe" data-size="small" id="status-'.$item->id.'" onchange="_updateStatus('.$item->id.')"/>';
                } else{
                    $status =  '<input type="checkbox" class="js-switch" data-color="#13dafe" data-size="small" id="status-'.$item->id.'" onchange="_updateStatus('.$item->id.')"/>';
                }

                $row[] = $status;
                $data[] = $row;
            }
            $output = array(
                "draw" => @ $_POST['draw'],
                "recordsTotal" => $this->introductionModel->_countAll(),
                "recordsFiltered" => $this->introductionModel->_countFiltered(),
                "data" => $data,
            );
            echo json_encode($output);
        }
    }
    public function updateStatus () {
        if ($this->request->isAJAX()) {
            $input = $this->request->getPost();
            $id = $input['id'];
            $data = array(
                'status' => '1'
            );
            $this->introductionModel->_updateStatus(false, $data);
            if ($input['status'] == 'true') {
                $data = array(
                    'status' => '2'
                );
                $this->introductionModel->_updateStatus($id, $data);
            }
            echo '1';
        }

    }
    function changeStatus () {

    }
    public function ajax_add(){
        if ($this->request->isAJAX()) {
            $input = $this->request->getPost();
            $slug = url_title(convert_accented_characters($input['name']), '-', true);
            // Validate
            $validate = $this->introductionModel->_checkUnique('openletter', 'name', $input['name']);
            if ($validate) {
                echo '0';die;
            }
            $data_insert = array(
                'slug' => $slug,
                'name' => trim($input['name']),
                'content' => $input['content'],
                'image1' => ($input['image1'] > 0) ? $input['image1'] : 1,
                'image2' => ($input['image2'] > 0) ? $input['image2'] : 1,
                'background' => ($input['background'] > 0) ? $input['background'] : 1,
                'youtube' => trim($input['youtube']),
            );
            $introduction_id = $this->introductionModel->_insertData($data_insert);
            echo '1';
        }
        echo '0';
    }
    public function ajax_edit(){
        if ($this->request->isAJAX()) {
            $input = $this->request->getPost();
            $id = $input['id'];
            $slug = url_title(convert_accented_characters($input['name']), '-', true);
            $validate = $this->introductionModel->_checkUnique('openletter', 'name', $input['name'], $id);
            if ($validate) {
                echo '0';die;
            }
            $data = array(
                'slug' => $slug,
                'name' => trim($input['name']),
                'content' => $input['content'],
                'image1' => ($input['image1'] > 0) ? $input['image1'] : 1,
                'image2' => ($input['image2'] > 0) ? $input['image2'] : 1,
                'background' => ($input['background'] > 0) ? $input['background'] : 1,
                'youtube' => trim($input['youtube']),
            );

            $check = $this->introductionModel->_updateData($id,$data);
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
            $check = $this->introductionModel->_deleteData($where);
            echo $check;
        }
        echo '0';
    }
    public function getIntroduction() {
        if ($this->request->isAJAX()) {
            $id = $this->request->getPost('id');
            $introduction = $this->introductionModel->_get($id);
            echo json_encode($introduction);
        }
    }
    public function add() 
    {
        service('SmartyEngine')->assign('add', true);
        return service('SmartyEngine')->view('backend/introduction/action.tpl');
    }
    public function edit() 
    {  
        $id = $this->request->getVar('id'); 
        $introduction = $this->introductionModel->_get($id);
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('data', $introduction);
        service('SmartyEngine')->assign('edit', true);
        return service('SmartyEngine')->view('backend/introduction/action.tpl');
    }
    public function detail()
    {
        $id = $this->request->getVar('id');
        $introduction = $this->introductionModel->_get($id);
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('data', $introduction);
        service('SmartyEngine')->assign('edit', true);
        return service('SmartyEngine')->view('backend/introduction/detail.tpl');
    }
}
