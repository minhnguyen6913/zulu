<?php
namespace App\Controllers\Backend\Activity;

use App\Controllers\BackendController;
use App\Models\Backend\Activity\ActivityModel;
use DateTime;

class Activity extends BackendController
{
    private $activityModel;
    private $imageRoot;

    public function __construct() 
    {
        $this->imageRoot = site_url().'backend/image/'; //for call image controller in ajax
        $this->pathRoot = site_url().'backend/activity/';
        service('SmartyEngine')->assign('pathRoot', $this->pathRoot);
        service('SmartyEngine')->assign('imageRoot', $this->imageRoot);
        $this->activityModel = new ActivityModel();
        helper('text');
    }
    public function index() {
        return service('SmartyEngine')->view('backend/activity/list.tpl');
    }
	public function ajax_list() {
        if ($this->request->isAJAX()) {
            $list = $this->activityModel->_getDatatables();
            $data = array();
            $no = @$_POST['start'];

            foreach ($list as $item) {
                $row = array();
                $row[] = ++ $no;
                $button = '';
                $button .= '<button class="btn btn-xs btn-info" onclick="_edit(' . $item->id . ')" data-toggle="tooltip" title="Sửa"><i class="fa fa-pencil"></i></button> ';
                $button .= '<button class="btn btn-xs btn-danger" onclick="_delete(' . $item->id . ')" data-toggle="tooltip" title="Xóa"><i class="fa fa-trash-o"></i></button> ';
                $row[] = "<div style='text-align:center'>{$button}</div>";
                $href = $this->pathRoot.'activity/detail?id='.$item->id;
                $row[] = "<a href='{$href}'>" . $item->name . "</a>";
                $data[] = $row;
            }
            $output = array(
                "draw" => @ $_POST['draw'],
                "recordsTotal" => $this->activityModel->_countAll(),
                "recordsFiltered" => $this->activityModel->_countFiltered(),
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
            $validate = $this->activityModel->_checkUnique('activities', 'name', $input['name']);
            if ($validate) {
                echo '0';die;
            }
            if (isset($input['open']))$open = DateTime::createFromFormat('d/m/Y H:i', trim($input['open']))->format("Y-m-d H:i:s");
            $data_insert = array(
                'slug' => $slug,
                'open' => $open,
                'name' => trim($input['name']),
                'content' => $input['content'],
                'image' => ($input['image'] > 0) ? $input['image'] : 1,
                'icon' => ($input['icon'] > 0) ? $input['icon'] : 1,
                'youtube' => trim($input['youtube']),
            );
            $activity_id = $this->activityModel->_insertData($data_insert);
            echo '1';
        }
        echo '0';
    }
    public function ajax_edit(){
        if ($this->request->isAJAX()) {
            $input = $this->request->getPost();
            $id = $input['id'];
            $slug = url_title(convert_accented_characters($input['name']), '-', true);
            $validate = $this->activityModel->_checkUnique('activities', 'name', $input['name'], $id);
            if ($validate) {
                echo '0';die;
            }
            if (isset($input['open']))$open = DateTime::createFromFormat('d/m/Y H:i', trim($input['open']))->format("Y-m-d H:i:s");
            $data = array(
                'slug' => $slug,
                'open' => $open,
                'name' => trim($input['name']),
                'content' => $input['content'],
                'image' => ($input['image'] > 0) ? $input['image'] : 1,
                'icon' => ($input['icon'] > 0) ? $input['icon'] : 1,
                'youtube' => trim($input['youtube']),
            );

            $check = $this->activityModel->_updateData($id,$data);
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
            $check = $this->activityModel->_deleteData($where);
            echo $check;
        }
        echo '0';
    }
    public function getActivity() {
        if ($this->request->isAJAX()) {
            $id = $this->request->getPost('id');
            $activity = $this->activityModel->_get($id);
            echo json_encode($activity);
        }
    }
    public function add() 
    {
        service('SmartyEngine')->assign('add', true);
        return service('SmartyEngine')->view('backend/activity/action.tpl');
    }
    public function edit() 
    {  
        $id = $this->request->getVar('id'); 
        $activity = $this->activityModel->_get($id);
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('data', $activity);
        service('SmartyEngine')->assign('edit', true);
        return service('SmartyEngine')->view('backend/activity/action.tpl');
    }
    public function detail()
    {
        $id = $this->request->getVar('id');
        $activity = $this->activityModel->_get($id);
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('data', $activity);
        service('SmartyEngine')->assign('edit', true);
        return service('SmartyEngine')->view('backend/activity/detail.tpl');
    }
}
