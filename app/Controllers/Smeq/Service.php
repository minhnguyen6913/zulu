<?php
namespace App\Controllers\Smeq;

use App\Controllers\SmeqController;
use App\Models\Smeq\ServiceModel;

class Service extends SmeqController
{
    private $model_service;
    private $module;
    function __construct()
    {
        $this->upload_url = '/uploads/images/';
        $this->module = 'service/';
        $noimage = '/assets/ext/image/imagenotfound.png';
        service('SmartyEngine')->assign('noimage', $noimage);
        service('SmartyEngine')->assign('module',$this->module);
        service('SmartyEngine')->assign('upload_url', $this->upload_url);
        $this->model_service = new ServiceModel();
        helper('text');
    }
    function detail()
    {
        $id = $this->request->getVar('id');
        $service = $this->model_service->_get_service($id);
        $list_service = $this->model_service->_get_services();
        service('SmartyEngine')->assign('article', $service);
        service('SmartyEngine')->assign('list_service', $list_service);
        service('SmartyEngine')->assign('model', 'Dịch Vụ');
        service('SmartyEngine')->assign('setting_banner', 'service_banner');
        return service('SmartyEngine')->view('smeq/blog/detail.tpl');
    }
    function search()
    {
        $input_key = $this->request->getVar('input_key');
        $page = $this->request->getVar('page');
        if ($input_key != '') {
            $key = url_title(convert_accented_characters($input_key), '-', true);
            if ($page) {
                $result = $this->model_service->_search($key, $page);
            } else {
                $result = $this->model_service->_search($key, 1);
            }
            $count_result = $this->model_service->_count_search_result($key);
        } else {
            if ($page) {
                $result = $this->model_service->_get_services($page);
            } else {
                $result = $this->model_service->_get_services(1);
            }
            $count_result = $this->model_service->_countservice();
        }
        $list_servie = $this->model_service->_get_services();
        $output = array(
            'page' => ($page) ? $page : 1,
            'count_result' => $count_result,
            'result' => ($result) ? $result : false,
            'category' => false,
            'articlenew' => false,
            'list_servie' => $list_servie,
            'key' => $key,
            'model' => 'Dịch Vụ'
        );
        service('SmartyEngine')->assign('output', $output);

        service('SmartyEngine')->assign('setting_banner', 'service_banner');
        return service('SmartyEngine')->view('smeq/blog/search.tpl');
    }
}
