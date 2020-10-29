<?php
namespace App\Controllers\Admin;

use App\Controllers\BaseController;

class Login extends BaseController
{

    private $pathRoot;
    private $session;

    public function __construct()
    {
        $this->pathRoot = site_url().'admin/';
        service('SmartyEngine')->assign('pathRoot', $this->pathRoot);
        $this->session = session();
        helper('text');
    }
    public function index() {
        if(session()->get('isLoggedIn')){
            return redirect()->to('/backend/home/home');
        }
        return service('SmartyEngine')->view('backend/admin/login.tpl');
    }
    public function login () {
        $input = $this->request->getPost();
        $username = $input['username'];
        $password = $input['password'];
        $rightPassword = 'gacoi';
        $rightUsername = 'admin';
        $salt = "qp5ivlh2gmc3j1n";
        md5(md5($password).$salt);
        $data = [
            'name' => 'Administrator',
            'email' => 'admin@gmail.com',
            'isLoggedIn' => true,
        ];

        if ($username === $rightUsername && md5(md5($password).$salt) === md5(md5($rightPassword).$salt)) {
            session()->set($data);
            return redirect()->to('/backend/home/home');
        }else {
            return redirect()->to('/admin/login');
        }

    }
    public function logout () {
        $this->session->destroy();
        return redirect()->to('/admin/login');
    }
}
