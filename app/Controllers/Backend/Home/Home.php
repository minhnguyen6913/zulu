<?php
namespace App\Controllers\Backend\Home;

use App\Controllers\BackendController;
use App\Models\Backend\Home\HomeModel;
use DateTime;

class Home extends BackendController
{
    private $homeModel;
    private $imageRoot;

    public function __construct() 
    {
        $this->imageRoot = site_url().'backend/image/'; //for call image controller in ajax
        $this->pathRoot = site_url().'backend/home/';
        service('SmartyEngine')->assign('pathRoot', $this->pathRoot);
        service('SmartyEngine')->assign('imageRoot', $this->imageRoot);
        $this->homeModel = new HomeModel();
        helper('text');
    }
    public function index() {
        return service('SmartyEngine')->view('backend/home/list.tpl');
    }
	public function ajax_list() {
        if ($this->request->isAJAX()) {
            $type = $this->request->getVar('type');
            $this->homeModel->type = $type;
            switch ($type) {
                case 1:
                    $this->homeModel->joinTable = "activities";
                    $this->homeModel->column = array('homepage.id', 'homepage.id', 'activities.name');
                    break;
                case 2:
                    $this->homeModel->joinTable = "news";
                    $this->homeModel->column = array('homepage.id', 'homepage.id', 'news.name');
                    break;
                case 3:
                    $this->homeModel->joinTable = "document";
                    $this->homeModel->column = array('homepage.id', 'homepage.id', 'document.name');
                    break;
                case 4:
                    $this->homeModel->joinTable = "program";
                    $this->homeModel->column = array('homepage.id', 'homepage.id', 'program.name');
                    break;
            }
            $list = $this->homeModel->_getDatatables();
            $data = array();
            $no = @$_POST['start'];

            foreach ($list as $item) {
                $row = array();
                $row[] = ++ $no;
                $button = '';
                $button .= '<button class="btn btn-xs btn-danger" onclick="_delete(' . $item->id . ',' . $item->type . ')" data-toggle="tooltip" title="Xóa"><i class="fa fa-trash-o"></i></button> ';
                $row[] = "<div style='text-align:center'>{$button}</div>";
                $row[] = $item->name;
                $data[] = $row;
            }
            $output = array(
                "draw" => @ $_POST['draw'],
                "recordsTotal" => $this->homeModel->_countAll(),
                "recordsFiltered" => $this->homeModel->_countFiltered(),
                "data" => $data,
            );
            echo json_encode($output);
        }
    }
    public function ajax_add(){
        if ($this->request->isAJAX()) {
            $input = $this->request->getPost();
            if (isset($input['article_id'])) {
                foreach ($input['article_id'] as $item) {
                    $data_insert = array(
                        'article_id' => $item,
                        'type' => $input['type'],
                    );
                    $home_id = $this->homeModel->_insertData($data_insert);
                }
            }
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
            $check = $this->homeModel->_deleteData($where);
            echo $check;
        }
        echo '0';
    }
    public function getArticle () {
        if ($this->request->isAJAX()) {
            $input = $this->request->getPost();
            switch ($input['type']) {
                case 1:
                    $table = "activities";
                    break;
                case 2:
                    $table = "news";
                    break;
                case 3:
                    $table = "document";
                    break;
                case 4:
                    $table = "program";
                    break;
            }
            $article = $this->homeModel->_getArticle($table, $input['type']);
            $output = '';
            foreach ($article as $item) {
                $output .=   '<option value="'.$item['id'].'">'.$item['name'].'</option>';
            }
            echo $output;
        }
    }
}
