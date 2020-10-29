<?php
namespace App\Controllers\Smeq;

use App\Controllers\SmeqController;
use App\Models\Smeq\DocumentModel;
class Document extends SmeqController
{
    private $model_document;
    function __construct()
    {
        $this->upload_url = '/uploads/images/';
        $this->module = 'document/';
        $noimage = '/assets/ext/image/imagenotfound.png';
        service('SmartyEngine')->assign('noimage', $noimage);
        service('SmartyEngine')->assign('module',$this->module);
        service('SmartyEngine')->assign('upload_url', $this->upload_url);
        $this->model_document = new DocumentModel();
        helper('text');
    }
	public function index()
	{
	    $id = $this->request->getVar('id');
	    $page = $this->request->getVar('page');
        $category = $this->model_document->_get_category();
        $category_array = array();
        foreach ($category as $item) {
            $category_array[$item['id']] = $item['name'];
        }
        if ($id) {
            if($page) {
                $document = $this->model_document->_get_document_category($id, $page);
            } else {
                $document = $this->model_document->_get_document_category($id, 1);
            }
            $get_documentnew = $this->model_document->_get_documentnew($id);
            $count_document = $this->model_document->_countdocument($id);
        } else {
            if ($page) {
                $document = $this->model_document->_gets($page);
            } else {
                $document = $this->model_document->_gets(1);
            }
            $get_documentnew = $this->model_document->_get_documentnew();
            $count_document = $this->model_document->_countdocument();
        }
        $documentnew = array();
        if ($get_documentnew) {
            foreach ($get_documentnew as $docnew) {
                if ($docnew['src'] != '') {
                    $src = $this->upload_url . $docnew['cat_image'] . '/' . $docnew['src'];
                    $fileParts = pathinfo($src);
                    $docnew['thumbnail'] = $fileParts['filename'] . "_thumbnail." . $fileParts['extension'];
                } else {
                    $docnew['thumbnail'] = '';
                }
                $documentnew[] = $docnew;
            }
        }
        service('SmartyEngine')->assign('category_id', ($id) ? $id : 0);
        service('SmartyEngine')->assign('page', ($page) ? $page : 1);
        service('SmartyEngine')->assign('document', $document);
        service('SmartyEngine')->assign('documentnew', $documentnew);
        service('SmartyEngine')->assign('category', $category);
        service('SmartyEngine')->assign('sub_category', ($id) ? $category_array[$id] : false);
        service('SmartyEngine')->assign('count_document', $count_document);
        return service('SmartyEngine')->view('smeq/blog/document.tpl');
	}
    function detail()
    {
        $id = $this->request->getVar('id');
        $document = $this->model_document->_get($id);
        $category = $this->model_document->_get_category();
        $category_array = array();
        foreach ($category as $item) {
            $category_array[$item['id']] = $item['name'];
        }
        $get_documentnew = $this->model_document->_get_documentnew($document['category_id']);
        $documentnew = array();
        if ($get_documentnew) {
            foreach ($get_documentnew as $docnew) {
                if ($docnew['src'] != '') {
                    $src = $this->upload_url . $docnew['cat_image'] . '/' . $docnew['src'];
                    $fileParts = pathinfo($src);
                    $docnew['thumbnail'] = $fileParts['filename'] . "_thumbnail." . $fileParts['extension'];
                } else {
                    $docnew['thumbnail'] = '';
                }
                $documentnew[] = $docnew;
            }
        }
        service('SmartyEngine')->assign('category_id', $document['category_id']);
        service('SmartyEngine')->assign('article', $document);
        service('SmartyEngine')->assign('category', $category);
        service('SmartyEngine')->assign('articlenew', $documentnew);
        service('SmartyEngine')->assign('sub_category', ($document['category_id']) ? $category_array[$document['category_id']] : false);
        service('SmartyEngine')->assign('model', 'Văn bản pháp quy');
        service('SmartyEngine')->assign('setting_banner', 'document_banner');
        return service('SmartyEngine')->view('smeq/blog/detail.tpl');
    }
    function search()
    {
        $input_key = $this->request->getVar('input_key');
        $page = $this->request->getVar('page');
        if ($input_key != '') {
            $key = url_title(convert_accented_characters($input_key), '-', true);
            if ($page) {
                $result = $this->model_document->_search($key, $page);
            } else {
                $result = $this->model_document->_search($key, 1);
            }
            $count_result = $this->model_document->_count_search_result($key);
        } else {
            if ($page) {
                $result = $this->model_document->_gets($page);
            } else {
                $result = $this->model_document->_gets(1);
            }
            $count_result = $this->model_document->_countdocument();
        }
        $category = $this->model_document->_get_category();
        $get_articlenew = $this->model_document->_get_documentnew();
        $articlenew = array();
        if ($get_articlenew) {
            foreach ($get_articlenew as $docnew) {
                if ($docnew['src'] != '') {
                    $src = $this->upload_url . $docnew['cat_image'] . '/' . $docnew['src'];
                    $fileParts = pathinfo($src);
                    $docnew['thumbnail'] = $fileParts['filename'] . "_thumbnail." . $fileParts['extension'];
                } else {
                    $docnew['thumbnail'] = '';
                }
                $articlenew[] = $docnew;
            }
        }
        $output = array(
            'page' => ($page) ? $page : 1,
            'count_result' => $count_result,
            'result' => $result,
            'category' => $category,
            'articlenew' => $articlenew,
            'key' => $key,
            'model' =>  'Văn bản pháp quy'
        );
        service('SmartyEngine')->assign('output', $output);
        service('SmartyEngine')->assign('setting_banner', 'document_banner');
        return service('SmartyEngine')->view('smeq/blog/search.tpl');
    }
}
