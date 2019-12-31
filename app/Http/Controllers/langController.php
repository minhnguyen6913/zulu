<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class langController extends Controller
{
    public $ngonngu = ["vi","en"];
    public function change($lang)
    {
        if(in_array($lang,$this->ngonngu)){
            session(['lang'=>$lang]);
        }
        return redirect()->route('home');
    }
}
