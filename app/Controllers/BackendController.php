<?php
namespace App\Controllers;

class BackendController extends BaseController
{
	/**
	 * Constructor.
	 */
	protected $pathRoot;
    protected $upload_path;
    protected $upload_url;
    protected $session;
	public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
	{
		// Do Not Edit This Line
        parent::initController($request, $response, $logger);
        $this->checkLogin();
		//--------------------------------------------------------------------
		// Preload any models, libraries, etc, here.
		//--------------------------------------------------------------------
		// E.g.:
		// $this->session = \Config\Services::session();
	}
	public function checkLogin()
    {
        if(!session()->get('isLoggedIn')){
            header('location:/admin/login');
            exit();
        }
    }
}
