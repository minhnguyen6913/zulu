<?php
namespace App\Controllers\Jobby;

use App\Controllers\SmeqController;
class Home extends SmeqController
{
	public function index()
	{
        return service('SmartyEngine')->view('jobby/home/home.tpl');
	}

}
