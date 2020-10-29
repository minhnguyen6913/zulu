<?php
namespace App\Controllers\Jobby;

use App\Controllers\SmeqController;
class Teacher extends SmeqController
{
    public function index()
    {
        return service('SmartyEngine')->view('jobby/teacher/grid.tpl');
    }
    public function detail()
    {
        return service('SmartyEngine')->view('jobby/teacher/detail.tpl');
    }
}
