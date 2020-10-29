<?php
namespace App\Controllers\Smeq;

use App\Controllers\SmeqController;
use App\Models\Smeq\AboutModel;

class About extends SmeqController
{
    private $model_about;
    private $module;
    function __construct()
    {
        $this->upload_url = '/uploads/images/';
        $this->module = 'about/';
        $noimage = '/assets/ext/image/imagenotfound.png';
        service('SmartyEngine')->assign('noimage', $noimage);
        service('SmartyEngine')->assign('module',$this->module);
        service('SmartyEngine')->assign('upload_url', $this->upload_url);
        $this->model_about = new AboutModel();
        helper('text');
    }
	public function index()
	{
	    $page = $this->request->getVar('page');
	    if ($page) {
            $about = $this->model_about->_gets($page);
        } else {
	        $about = $this->model_about->_gets(1);
        }
	    $count_about = $this->model_about->_countabout();
        service('SmartyEngine')->assign('page', ($page) ? $page : 1);
        service('SmartyEngine')->assign('count_about', $count_about);
        service('SmartyEngine')->assign('list_about', $this->model_about->_gets());
        service('SmartyEngine')->assign('about', $about);
        return service('SmartyEngine')->view('smeq/blog/about.tpl');
	}
    function detail()
    {
        $id = $this->request->getVar('id');
        $about = $this->model_about->_get($id);
        $get_acticelnew = $this->model_about->_get_about_new();
        $acticelnew = array();
        if ($get_acticelnew) {
            foreach ($get_acticelnew as $acticel) {
                if ($acticel['src'] != '') {
                    $src = $this->upload_url . $acticel['cat_image'] . '/' . $acticel['src'];
                    $fileParts = pathinfo($src);
                    $acticel['thumbnail'] = $fileParts['filename'] . "_thumbnail." . $fileParts['extension'];
                } else {
                    $acticel['thumbnail'] = '';
                }
                $acticelnew[] = $acticel;
            }
        }
        service('SmartyEngine')->assign('article', $about);
        service('SmartyEngine')->assign('articlenew', $acticelnew);
        service('SmartyEngine')->assign('model', 'Giới Thiệu');
        service('SmartyEngine')->assign('setting_banner', 'about_banner');
        return service('SmartyEngine')->view('smeq/blog/detail.tpl');
    }
    function search()
    {
        $input_key = $this->request->getVar('input_key');
        $page = $this->request->getVar('page');
        if ($input_key != '') {
            $key = url_title(convert_accented_characters($input_key), '-', true);
            if ($page) {
                $result = $this->model_about->_search($key, $page);
            } else {
                $result = $this->model_about->_search($key, 1);
            }
            $count_result = $this->model_about->_count_search_result($key);
        } else {
            if ($page) {
                $result = $this->model_about->_gets($page);
            } else {
                $result = $this->model_about->_gets(1);
            }
            $count_result = $this->model_about->_countabout();
        }
        $get_acticelnew = $this->model_about->_get_about_new();
        $articlenew = array();
        if ($get_acticelnew) {
            foreach ($get_acticelnew as $acticel) {
                if ($acticel['src'] != '') {
                    $src = $this->upload_url . $acticel['cat_image'] . '/' .$acticel['src'];
                    $fileParts = pathinfo($src);
                    $acticel['thumbnail'] = $fileParts['filename'] . "_thumbnail." . $fileParts['extension'];
                } else {
                    $acticel['thumbnail'] = '';
                }
                $acticelnew[] = $acticel;
            }
        }
        $output = array(
            'page' => ($page) ? $page : 1,
            'count_result' => $count_result,
            'result' => ($result) ? $result : false,
            'category' => false,
            'articlenew' => $articlenew,
            'key' => $key,
            'model' => 'Giới Thiệu'
        );
        service('SmartyEngine')->assign('output', $output);
        service('SmartyEngine')->assign('setting_banner', 'about_banner');
        return service('SmartyEngine')->view('smeq/blog/search.tpl');
    }
}
