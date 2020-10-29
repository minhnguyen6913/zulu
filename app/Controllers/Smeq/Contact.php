<?php
namespace App\Controllers\Smeq;

use App\Controllers\SmeqController;

class Contact extends SmeqController
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
        helper('text');
    }
	public function index()
	{
        return service('SmartyEngine')->view('smeq/home/contact.tpl');
	}
}
