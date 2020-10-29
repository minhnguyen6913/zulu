<?php
namespace App\Controllers\Smeq;

use App\Controllers\SmeqController;
use App\Models\Smeq\NewsModel;

class News extends SmeqController
{
    private $model_news;
    function __construct()
    {
        $this->upload_url = '/uploads/images/';
        $this->module = 'news/';
        $noimage = '/assets/ext/image/imagenotfound.png';
        service('SmartyEngine')->assign('noimage', $noimage);
        service('SmartyEngine')->assign('module',$this->module);
        service('SmartyEngine')->assign('upload_url', $this->upload_url);
        $this->model_news = new NewsModel();
        helper('text');
    }
	public function index()
	{
	    $id = $this->request->getVar('id');
	    $page = $this->request->getVar('page');
        $category = $this->model_news->_get_category();
        $category_array = array();
        foreach ($category as $item) {
            $category_array[$item['id']] = $item['name'];
        }
	    if ($id) {
            if ($page) {
                $news = $this->model_news->_get_news_category($id, $page);
            } else {
                $news = $this->model_news->_get_news_category($id,1);
            }
            $count_news = $this->model_news->_countnews($id);
        } else {
	        if ($page) {
                $news = $this->model_news->_gets($page);
            } else {
                $news = $this->model_news->_gets(1);
            }
	        $count_news = $this->model_news->_countnews();
        }
        service('SmartyEngine')->assign('category_id', ($id) ? $id : 0);
        service('SmartyEngine')->assign('page', ($page) ? $page : 1);
        service('SmartyEngine')->assign('count_news', $count_news);
        service('SmartyEngine')->assign('sub_category', ($id) ? $category_array[$id] : false);
        service('SmartyEngine')->assign('news', $news);

        return service('SmartyEngine')->view('smeq/blog/news.tpl');
	}
    function detail()
    {
        $id = $this->request->getVar('id');
        $news = $this->model_news->_get($id);
        $category = $this->model_news->_get_category();
        $category_array = array();
        foreach ($category as $item) {
            $category_array[$item['id']] = $item['name'];
        }
        $get_news_new = $this->model_news->_get_news_new($news['category_id']);
        $news_new = array();
        if ($get_news_new) {
            foreach ($get_news_new as $nnew) {
                if ($nnew['src'] != '') {
                    $src = $this->upload_url . $nnew['cat_image'] . '/' . $nnew['src'];
                    $fileParts = pathinfo($src);
                    $nnew['thumbnail'] = $fileParts['filename'] . "_thumbnail." . $fileParts['extension'];
                } else {
                    $nnew['thumbnail'] = '';
                }
                $news_new[] = $nnew;
            }
        }
        service('SmartyEngine')->assign('category_id', $news['category_id']);
        service('SmartyEngine')->assign('article', $news);
        service('SmartyEngine')->assign('category', $category);
        service('SmartyEngine')->assign('articlenew', $news_new);
        service('SmartyEngine')->assign('sub_category', $category_array[$news['category_id']]);
        service('SmartyEngine')->assign('model', 'Tin tức - Sự kiện');
        service('SmartyEngine')->assign('setting_banner', 'news_banner');
        return service('SmartyEngine')->view('smeq/blog/detail.tpl');
    }
    function search()
    {
        $input_key = $this->request->getVar('input_key');
        $page = $this->request->getVar('page');
        if ($input_key != '') {
            $key = url_title(convert_accented_characters($input_key), '-', true);
            if ($page) {
                $result = $this->model_news->_search($key, $page);
            } else {
                $result = $this->model_news->_search($key, 1);
            }
            $count_result = $this->model_news->_count_search_result($key);
        } else {
            if ($page) {
                $result = $this->model_news->_gets($page);
            } else {
                $result = $this->model_news->_gets(1);
            }
            $count_result = $this->model_news->_countnews();
        }
        $category = $this->model_news->_get_category();
        $get_articlenew = $this->model_news->_get_news_new();
        $articlenew = array();
        if ($get_articlenew) {
            foreach ($get_articlenew as $nnew) {
                if ($nnew['src'] != '') {
                    $src = $this->upload_url . $nnew['cat_image'] . '/' . $nnew['src'];
                    $fileParts = pathinfo($src);
                    $nnew['thumbnail'] = $fileParts['filename'] . "_thumbnail." . $fileParts['extension'];
                } else {
                    $nnew['thumbnail'] = '';
                }
                $articlenew[] = $nnew;
            }
        }
        $output = array(
            'page' => ($page) ? $page : 1,
            'count_result' => $count_result,
            'result' => $result,
            'category' => $category,
            'articlenew' => $articlenew,
            'key' => $key,
            'model' => 'Tin tức - Sự kiện'
        );
        service('SmartyEngine')->assign('output', $output);
        service('SmartyEngine')->assign('setting_banner', 'news_banner');
        return service('SmartyEngine')->view('smeq/blog/search.tpl');
    }
}
