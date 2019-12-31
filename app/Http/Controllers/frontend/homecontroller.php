<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\productcategory;
use App\Models\slide;
use Illuminate\Http\Request;
use App\Models\products;

class homecontroller extends Controller
{
    public function index()
    {
        //get thông tin
        $newproducts = products::where('status',1)->orderBy('id','DESC')->limit(8)->get();
        $procategory = productcategory::where('status',1)->get();
        $allproducts = products::where('status',1)->orderBy('id','DESC')->limit(8)->get();
        $slide = slide::where('slide_status',1)->orderBy('id','DESC')->get();
        
        $data = [
            'title' => 'Trang chủ',
            'newproducts' => $newproducts,
            'procategory' => $procategory,
            'allproducts' => $allproducts,
            'slide'=>$slide,
            ];
        return view('frontend.home.index',$data);
    }
    public function contact()
    {
        $data = [
            'title' => 'Liên hệ',
        ];
        return view('frontend.home.contact',$data);
    }
}