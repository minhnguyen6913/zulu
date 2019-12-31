<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\products;
use Illuminate\Http\Request;

class productcontroller extends Controller
{
    public function index()
    {
        return view('frontend.pro.index');
    }
    public function detail($alias,$id)
    {
        $product = products::where([
            ['alias','=',$alias],
            ['id','=',$id]
        ])->first();
        // if($alias != $product->alias){
        //     $url = $product->alias.'-'.$id;
        //     return redirect($url);
        // }
        $data = [
            'title' => 'chi tiết',
            'product' => $product
        ];
        dd($product);
        return view('frontend.pro.detail',$data);
    }
}
