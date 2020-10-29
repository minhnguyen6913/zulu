<?php
namespace App\Controllers\Jobby;

use App\Controllers\SmeqController;
class Page extends SmeqController
{
    public function index()
    {
        return service('SmartyEngine')->view('jobby/page/aboutus.tpl');
    }
    public function aboutus()
    {
        return service('SmartyEngine')->view('jobby/page/aboutus.tpl');
    }
    public function program()
    {
        return service('SmartyEngine')->view('jobby/page/program.tpl');
    }
    public function gallery()
    {
        return service('SmartyEngine')->view('jobby/page/gallery.tpl');
    }
    public function event()
    {
        return service('SmartyEngine')->view('jobby/page/event.tpl');
    }
    public function coming()
    {
        return service('SmartyEngine')->view('jobby/page/coming.tpl');
    }
    public function error()
    {
        return service('SmartyEngine')->view('jobby/page/error.tpl');
    }
    public function contact()
    {
        return service('SmartyEngine')->view('jobby/page/contact.tpl');
    }
}
