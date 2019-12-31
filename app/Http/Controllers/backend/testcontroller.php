<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class testcontroller extends Controller
{
    public function action1(){
        return view('backend.action1');
    }
    public function action2(){
        return view('backend.action2');
    }
    public function action3(){

    }
    public function action4(){

    }
}
