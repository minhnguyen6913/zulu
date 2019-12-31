<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
    public function imagehandle($file,$imagepath,$imagestore)
    {
            $imageuploaded = $file;
            $imagename = time().'.'.$imageuploaded->getClientOriginalExtension();
            $imageuploaded->move($imagepath,$imagename);
            $image = $imagestore.$imagename;
            return $image; //result: /public/uploads/products/1576677542.png
    }
}