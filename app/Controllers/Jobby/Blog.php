<?php
namespace App\Controllers\Jobby;

use App\Controllers\SmeqController;
class Blog extends SmeqController
{
    public function index()
    {
        return service('SmartyEngine')->view('jobby/blog/grid.tpl');
    }
    public function leftbar()
    {
        return service('SmartyEngine')->view('jobby/blog/leftbar.tpl');
    }
    public function rightbar()
    {
        return service('SmartyEngine')->view('jobby/blog/rightbar.tpl');
    }
    public function detail()
    {
        return service('SmartyEngine')->view('jobby/blog/detail.tpl');
    }
}
