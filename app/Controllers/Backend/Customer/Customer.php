<?php
namespace App\Controllers\Backend\Customer;

use App\Controllers\BackendController;
use App\Models\Backend\Customer\CustomerModel;
use DateTime;

class Customer extends BackendController
{
    private $customerModel;
    private $imageRoot;

    public function __construct()
    {
        $this->imageRoot = site_url().'backend/image/'; //for call image controller in ajax
        $this->pathRoot = site_url().'backend/customer/';
        service('SmartyEngine')->assign('pathRoot', $this->pathRoot);
        service('SmartyEngine')->assign('imageRoot', $this->imageRoot);
        $this->customerModel = new CustomerModel();
        helper('text');
    }
    public function index() {
        return service('SmartyEngine')->view('backend/customer/list.tpl');
    }
    public function ajax_list() {
        if ($this->request->isAJAX()) {
            $list = $this->customerModel->_getDatatables();
            $data = array();
            $no = @$_POST['start'];

            foreach ($list as $item) {
                $row = array();
                $row[] = ++ $no;
                $button = '';
                $button .= '<button class="btn btn-xs btn-info" onclick="_edit(' . $item->id . ')" data-toggle="tooltip" title="Sửa"><i class="fa fa-pencil"></i></button> ';
                $button .= '<button class="btn btn-xs btn-danger" onclick="_delete(' . $item->id . ')" data-toggle="tooltip" title="Xóa"><i class="fa fa-trash-o"></i></button> ';
                $row[] = "<div style='text-align:center'>{$button}</div>";
                $href = $this->pathRoot.'customer/detail?id='.$item->id;
                $row[] = "<a href='{$href}'>" . $item->name . "</a>";
                $data[] = $row;
            }
            $output = array(
                "draw" => @ $_POST['draw'],
                "recordsTotal" => $this->customerModel->_countAll(),
                "recordsFiltered" => $this->customerModel->_countFiltered(),
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
            $validate = $this->customerModel->_checkUnique('customer', 'name', $input['name']);
            if ($validate) {
                echo '0';die;
            }
            $data_insert = array(
                'slug' => $slug,
                'name' => trim($input['name']),
                'content' => $input['content'],
                'logo' => ($input['logo'] > 0) ? $input['logo'] : 1,
                'link' => trim($input['link']),
                'type' => trim($input['type']),
            );
            $customer_id = $this->customerModel->_insertData($data_insert);
            echo '1';
        }
        echo '0';
    }
    public function ajax_edit(){
        if ($this->request->isAJAX()) {
            $input = $this->request->getPost();
            $id = $input['id'];
            $slug = url_title(convert_accented_characters($input['name']), '-', true);
            $validate = $this->customerModel->_checkUnique('customer', 'name', $input['name'], $id);
            if ($validate) {
                echo '0';die;
            }
            $data = array(
                'slug' => $slug,
                'name' => trim($input['name']),
                'content' => $input['content'],
                'logo' => ($input['logo'] > 0) ? $input['logo'] : 1,
                'link' => trim($input['link']),
                'type' => trim($input['type']),
            );

            $check = $this->customerModel->_updateData($id,$data);
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
            $check = $this->customerModel->_deleteData($where);
            echo $check;
        }
        echo '0';
    }
    public function getCustomer() {
        if ($this->request->isAJAX()) {
            $id = $this->request->getPost('id');
            $customer = $this->customerModel->_get($id);
            echo json_encode($customer);
        }
    }
    public function add()
    {
        service('SmartyEngine')->assign('add', true);
        return service('SmartyEngine')->view('backend/customer/action.tpl');
    }
    public function edit()
    {
        $id = $this->request->getVar('id');
        $customer = $this->customerModel->_get($id);
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('data', $customer);
        service('SmartyEngine')->assign('edit', true);
        return service('SmartyEngine')->view('backend/customer/action.tpl');
    }
    public function detail()
    {
        $id = $this->request->getVar('id');
        $customer = $this->customerModel->_get($id);
        service('SmartyEngine')->assign('id', $id);
        service('SmartyEngine')->assign('data', $customer);
        service('SmartyEngine')->assign('edit', true);
        return service('SmartyEngine')->view('backend/customer/detail.tpl');
    }
}
