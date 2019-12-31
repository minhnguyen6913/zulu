<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
// */
// Route::get('/setlang-{lang}','langcontroller@change')->name('changelang');
// Route::group(['middleware' => 'lang'], function () {
//     Route::get('/',function(){
//         return view('welcome');
//     })->name('home');
// });
Route::group(['namespace' => 'frontend'], function () {
    Route::get('/','homecontroller@index')->name('homepage.index');
    Route::get('/lien-he','homecontroller@contact')->name('homepage.contact');
    Route::get('/san-pham','productcontroller@index')->name('pro.index');
    Route::get('/{alias}-sp-{id}','productcontroller@detail')->name('pro.detail')
    ->where(['alias'=>'^[A-Za-z0-9-]+','id'=> '[0-9]+$']);
    Route::get('/gio-hang','cartcontroller@index')->name('cart.index');
    Route::get('/thanh-toan','cartcontroller@checkout')->name('cart.checkout');
    Route::get('/add-to-cart-{id}','cartcontroller@addto')->name('cart.add');
    Route::post('/update','cartcontroller@update')->name('cart.update');
    Route::get('/delete-{id}','cartcontroller@deleteitem')->name('cart.delete');
    Route::post('/thanh-toan','cartcontroller@checkoutPOST')->name('cart.checkoutP');
    Route::get('/dat-hang','cartcontroller@thankyou')->name('cart.alert');
    Route::get('/tm','cartcontroller@testm')->name('cart.tm');
});

Route::group(['prefix' => 'backend', 'namespace' => 'backend'], function () {
    
    Route::group(['prefix' => 'user'], function () {
        Route::get('login', 'usercontroller@login')->name('user.login');
        Route::post('login', 'usercontroller@loginpost')->name('user.loginpost');
        Route::get('logout', 'usercontroller@logout')->name('user.logout');
        //Route::get('createpassword', 'usercontroller@createpassword')->name('user.createpassword');
    });
    Route::group(['middleware' => ['checklogin']], function () {
        Route::resource('/home', 'homecontroller');
        Route::resource('/sanpham', 'sanphamcontroller');
        Route::resource('/cart', 'cartcontroller');
        Route::resource('/slide', 'slidecontroller');
        Route::resource('/danhmuc', 'danhmuccontroller');
        Route::resource('/nhacungcap', 'nhacungcapcontroller');
        Route::resource('/thuonghieu', 'thuonghieucontroller');
        Route::resource('/loaisanpham', 'loaisanphamcontroller');
        Route::resource('/khachhang', 'khachhangcontroller');
        //Route::resource('/donhang', 'donhangcontroller');
        Route::resource('/user', 'usercontroller');
        Route::resource('/usergroup', 'usergroupcontroller');
        Route::resource('/baocao', 'baocaocontroller');
        Route::resource('/role', 'rolecontroller');
    });
});