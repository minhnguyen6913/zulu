<?php
namespace App\Controllers;
use App\Models\Smeq\HomeModel;

class SmeqController extends BaseController
{
	/**
	 * Constructor.
	 */
    protected $pathRoot;
    //protected $model_home;
	public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
	{
		// Do Not Edit This Line
		parent::initController($request, $response, $logger);
        $model_home = new HomeModel();
        $list_customers = $model_home->_get_customers();
        $list_setting = $model_home->_get_info();
        if ($list_setting) {
            foreach ($list_setting as $item) {
                $settings[$item['define']] = $item;
            }
        }
        $this->pathRoot = site_url().'smeq/';
        service('SmartyEngine')->assign('settings', $settings);
        service('SmartyEngine')->assign('list_customers', $list_customers);
        service('SmartyEngine')->assign('pathRoot', $this->pathRoot);

		//--------------------------------------------------------------------
		// Preload any models, libraries, etc, here.
		//--------------------------------------------------------------------
		// E.g.:
		// $this->session = \Config\Services::session();
        /*
        // Tạo menu
        $navigation = new NavigationModel();
        $menu = [];
        $rs = $navigation->_get();
        if ($rs)
        {
            foreach ($rs as $rec)
            {
                $menu[$rec['parent']][$rec['id']] = $rec;
            }
        }
        echo "<pre>";
        print_r($menu);
        echo "</pre>";
        exit();
        service('SmartyEngine')->assign('navigation', $menu);
        */
	}
}
