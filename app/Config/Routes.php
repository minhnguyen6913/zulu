<?php
namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php'))
{
	require SYSTEMPATH . 'Config/Routes.php';
}

/**
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(true);

/**
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */
// We get a performance increase by specifying the default
// route since we don't have to scan directories.
//$routes->group('admin', function($routes) {
//    $routes->group('blog', function($routes) {
//        $routes->add('', 'Backend\Blog\Category::index');
//        $routes->group('category', function($routes) {
//            $routes->add('', 'Backend\Blog\Category::index');
//            $routes->add('add', 'Backend\Blog\Category::add');
//            $routes->add('edit', 'Backend\Blog\Category::edit');
//            $routes->add('detail', 'Backend\Blog\Category::detail');
//            $routes->add('ajax_add', 'Backend\Blog\Category::ajax_add');
//            $routes->add('ajax_edit', 'Backend\Blog\Category::ajax_edit');
//            $routes->add('ajax_delete', 'Backend\Blog\Category::ajax_delete');
//            $routes->add('(:any)', 'Backend\Blog\Category::index');
//        });
//        $routes->group('news', function($routes) {
//            $routes->add('', 'Backend\Blog\Category::index');
//            $routes->add('add', 'Backend\Blog\News::add');
//            $routes->add('edit', 'Backend\Blog\News::edit');
//            $routes->add('detail', 'Backend\Blog\News::detail');
//            $routes->add('ajax_add', 'Backend\Blog\News::ajax_add');
//            $routes->add('ajax_edit', 'Backend\Blog\News::ajax_edit');
//            $routes->add('ajax_list', 'Backend\Blog\News::ajax_list');
//            $routes->add('ajax_delete', 'Backend\Blog\News::ajax_delete');
//            $routes->add('get_news', 'Backend\Blog\News::get_news');
//            $routes->add('(:any)', 'Backend\Blog\Category::index');
//        });
//        $routes->group('document', function($routes) {
//            $routes->add('', 'Backend\Blog\Category::index');
//            $routes->add('add', 'Backend\Blog\Document::add');
//            $routes->add('edit', 'Backend\Blog\Document::edit');
//            $routes->add('detail', 'Backend\Blog\Document::detail');
//            $routes->add('ajax_add', 'Backend\Blog\Document::ajax_add');
//            $routes->add('ajax_edit', 'Backend\Blog\Document::ajax_edit');
//            $routes->add('ajax_list', 'Backend\Blog\Document::ajax_list');
//            $routes->add('ajax_delete', 'Backend\Blog\Document::ajax_delete');
//            $routes->add('get_news', 'Backend\Blog\Document::get_document');
//            $routes->add('(:any)', 'Backend\Blog\Category::index');
//        });
//    });
//    $routes->group('image', function($routes) {
//        $routes->add('', 'Backend\Image\Category::index');
//        $routes->group('image', function ($routes) {
//            $routes->add('', 'Backend\Image\Category::index');
//            $routes->add('add', 'Backend\Image\Image::add');
//            $routes->add('delete', 'Backend\Image\Image::delete');
//            $routes->add('(:any)', 'Backend\Image\Image::index');
//        });
//        $routes->group('category', function ($routes) {
//            $routes->add('', 'Backend\Image\Category::index');
//            $routes->add('ajax_add', 'Backend\Image\Category::ajax_add');
//            $routes->add('edit', 'Backend\Image\Category::edit');
//            $routes->add('ajax_edit', 'Backend\Image\Category::ajax_edit');
//            $routes->add('ajax_delete','Backend\Image\Category::ajax_delete');
//            $routes->add('(:any)', 'Backend\Image\Image::index');
//        });
//    });
//});

/**
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php'))
{
	require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
