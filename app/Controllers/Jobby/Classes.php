<?php
namespace App\Controllers\Jobby;

use App\Controllers\SmeqController;
class Classes extends SmeqController
{
    public function index()
    {
        return service('SmartyEngine')->view('jobby/classes/grid.tpl');
    }
    public function detail()
    {
        return service('SmartyEngine')->view('jobby/classes/detail.tpl');
    }
    public function schedule()
    {
        return service('SmartyEngine')->view('jobby/classes/schedule.tpl');
    }
}
