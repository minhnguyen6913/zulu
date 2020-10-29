<?php
namespace App\Controllers\Smeq;

use App\Controllers\SmeqController;
use App\Models\Smeq\HomeModel;
use App\Models\Smeq\ServiceModel;

class Home extends SmeqController
{
    private $model_home;
    private $model_service;
    function __construct()
    {
        $this->upload_url = '/uploads/images/';
        $noimage = '/assets/ext/image/imagenotfound.png';
        service('SmartyEngine')->assign('noimage', $noimage);
        service('SmartyEngine')->assign('upload_url', $this->upload_url);
        $this->model_home = new HomeModel();
        $this->model_service = new ServiceModel();
    }
	public function index()
	{

	    $activity = $this->model_home->_get_activity();
	    $news = $this->model_home->_get_news();
	    $documents = $this->model_home->_get_documents();
	    $slide = $this->model_home->_get_slides();
	    $program = $this->model_service->_get_services();
        service('SmartyEngine')->assign('list_programs', $program);
        service('SmartyEngine')->assign('list_activitys', $activity);
        service('SmartyEngine')->assign('list_news', $news);
        service('SmartyEngine')->assign('list_documents', $documents);
        service('SmartyEngine')->assign('list_slides', $slide);
        service('SmartyEngine')->assign('count_slide', @count($slide));

        return service('SmartyEngine')->view('smeq/home/home.tpl');
	}
}
