<?php
namespace App\Controllers;

use App\Models\ExampleModel;
class Home extends BaseController
{
	public function index()
	{
	    $example = new ExampleModel();
        echo "<pre>";
        print_r($example->orderBy('id', 'DESC')->findAll());
        echo "</pre>";

        service('SmartyEngine')->assign('user', 'Bao Lue');
        service('SmartyEngine')->assign('info', ['tel'=> '0903334221', 'email' => 'dinhhoaibao@gmail.com', 'dob' => '21/10/1979']);
        return service('SmartyEngine')->view('smarty_template');
		//return view('welcome_message');
	}

}
