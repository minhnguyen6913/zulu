<?php
namespace App\Libraries;

require_once APPPATH.'ThirdParty/Smarty/Autoloader.php';

use \Smarty_Autoloader;

Smarty_Autoloader::register();

use \Smarty;

class CISmarty extends Smarty
{
    public function __construct()
    {
        parent::__construct();

        parent::setTemplateDir(APPPATH . 'Views/');
        parent::setCompileDir(WRITEPATH . 'smarty/compiled/')->setCacheDir(WRITEPATH . 'smarty/cache/');

    }

    public function view($tpl_name) {
        if (substr($tpl_name, -4) != '.tpl'){
            $tpl_name.='.tpl';
        }

        parent::display($tpl_name);
    }
}
