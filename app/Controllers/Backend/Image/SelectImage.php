<?php
namespace App\Controllers\Backend\Image;

use App\Controllers\BackendController;
use App\Models\Backend\Image\SelectImageModel;

class SelectImage extends BackendController
{
    private $selectImageModel;

    function __construct()
    {
        $this->pathRoot = site_url().'backend/image/';
        $this->upload_url = site_url().'/uploads/images/';
        service('SmartyEngine')->assign('pathRoot', $this->pathRoot);
        service('SmartyEngine')->assign('upload_url', $this->upload_url);
        $this->selectImageModel = new SelectImageModel();
        helper('text');

    }

    public function showImageCategory ()
    {
        $input = $this->request->getPost();

        $list = $this->selectImageModel->_get();

        if($list) {
            $data = $this->createTree($list);

        }else {
            $data = [
                [
                    'text'=>'No data'
                ],
            ];
        }
        $tree = json_encode($data, JSON_PRETTY_PRINT);
        service('SmartyEngine')->assign('inputName', $input['inputName']);
        service('SmartyEngine')->assign('forTextArea', $input['forTextArea']);
        service('SmartyEngine')->assign('tree',$tree);
        return service('SmartyEngine')->view('backend/image/select_image.tpl');
    }
    function showImage () {
        $category_id = $this->request->getPost('id');
        $input = $this->request->getPost();
        $list = $this->selectImageModel->_getImages(false, $category_id);
        $outPut= array();
        if($list) {
            foreach ($list as $item) {
                $src = $this->upload_url.$item['category_id']."/".$item['src'];
                $fileParts = pathinfo($src);
                $thumbnail = $fileParts['filename']."_thumbnail.".$fileParts['extension'];
                $data = $item;
                $data['src'] = $src;
                $data['thumbnail'] =$this->upload_url.$item['category_id']."/".$thumbnail;
                $data['inputName'] = $input['inputName'];
                $data['forTextArea'] = $input['forTextArea'];
                $outPut[] = $data;
            }
        }
        service('SmartyEngine')->assign('id', $category_id);
        service('SmartyEngine')->assign('list', $outPut);
        return service('SmartyEngine')->view('backend/image/show_image.tpl');
    }
    public function getImage ()
    {
        $id = $this->request->getPost('id');
        $image = $this->selectImageModel->_getImages($id);
        if($image) {
            foreach ($image as $item) {
                $src = $this->upload_url.$item['src'];

                $fileParts = pathinfo($src);
                $thumbNail = $fileParts['filename']."_thumbnail.".$fileParts['extension'];
                $data = $item;
                $data['src'] = $this->upload_url.$item['category_id']."/".$item['src'];

                $data['thumbnail'] = $this->upload_url.$item['category_id']."/".$thumbNail;
            }
            echo json_encode($data);
        }

    }
    private function createTree($list) {
        $data = array();
        foreach ($list as $item ) {
            $subData['id'] = $item['id'];
            $subData ['name'] = $item['name'];
            $subData ['text'] = $item['name'];
            $subData['href'] = "javascript:_show(".$item['id'].")";
            $subData ['parent'] = ($item['parent'])?$item['parent']:$item['parent'];
            $data[] = $subData;
        }

        foreach ($data as $key => &$value) {
            $output[$value['id']] = &$value;
        }

        foreach ($data as $key => &$value) {
            if ($value['parent'] && isset($output[$value['parent']])) {
                $output[$value['parent']]["nodes"][] = &$value;
            }
        }

        foreach ($data as $key => &$value) {
            if ($value['parent'] && isset($output[$value['parent']])) {
                unset($data[$key]);
            }
        }

        array_multisort($data, SORT_ASC);
        return $data;
    }
}

