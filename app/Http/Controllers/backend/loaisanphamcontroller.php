<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\producttype;
use Illuminate\Http\Request;

class loaisanphamcontroller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ds = producttype::orderBy('id', 'desc')
        ->where('producttype.status','!=',0)
        ->paginate(10);
        return view('backend.loaisanpham.index',['ds'=>$ds]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $protypes = producttype::select('id','name')->get();
        return view('backend.loaisanpham.form',[
            'title'=>'Thêm loại sản phẩm',
            'button'=>'Thêm',
            'protypes'=>$protypes,
            'linkaction'=> route('loaisanpham.store'),
            'method'=>'POST',
            'breadcrumb'=> route('loaisanpham.index'),
            'namepage' => 'Loại sản phẩm'
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
        ],[
            'name.required' => 'Tên danh mục không được để trống',
            'image' => ['sometimes','image','mimes:icon,jpg,jpeg,jfif,bmp,svg,png','max:10000']
        ]);
        $data = array(
            'name'=>$request->name,
            'description'=>$request->description,
            'status'=>$request->status,
            'id_parent'=>$request->id_parent,
            'meta_key'=>$request->meta_key,
            'meta_desc'=>$request->meta_desc,
            'alias'=>$request->alias,
            'date_create'=>date('Y-m-d H:i:s'),
            'date_update'=>date('Y-m-d H:i:s'),
        );
        if($request->file('icon')){
            $imagepath = public_path('/uploads/loaisanpham/');
            $imagestore= '/public/uploads/loaisanpham/';
            $icon = $this->imagehandle($request->file('icon'),$imagepath,$imagestore);
            $data['icon'] = $icon;
        }
        if($request->file('img_share')){
            $imagepath = public_path('/uploads/loaisanpham/');
            $imagestore= '/public/uploads/loaisanpham/';
            $icon = $this->imagehandle($request->file('img_share'),$imagepath,$imagestore);
            $data['img_share'] = $icon;
        }
        producttype::insert($data);
        return redirect()->route('loaisanpham.index')->with(['msg'=>'Thêm thành công','type'=>'success']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return view('backend.loaisanpham.detail');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $producttype = producttype::where('id',$id)
        ->where('status','!=',0)
        ->first();
      
        $protypes  = producttype::select('id','name')->get();
        return view('backend.loaisanpham.form',[
            'title'=>'Sửa loại sản phẩm',
            'button'=>'Cập nhật',
            'producttype'=>$producttype,
            'protypes'=>$protypes,
            'linkaction'=> route('loaisanpham.update',$producttype->id),
            'method'=>'PUT',
            'breadcrumb'=> route('loaisanpham.index'),
            'namepage' => 'Loại sản phẩm'
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $producttype = producttype::where('id',$id)
        ->where('status','!=',0)
        ->first();
        $date_create = $producttype->date_create;
        $request->validate([
            'name' => 'required',
        ],[
            'name.required' => 'Tên danh mục không được để trống',
            'image' => ['sometimes','image','mimes:icon,jpg,jpeg,jfif,bmp,svg,png','max:10000']
        ]);
        //dd($request->file('icon'));
        $data = array(
            'name'=>$request->name,
            'description'=>$request->description,
            'status'=>$request->status,
            'id_parent'=>$request->id_parent,
            'meta_key'=>$request->meta_key,
            'meta_desc'=>$request->meta_desc,
            'alias'=>$request->alias,
            'date_create'=>$date_create,
            'date_update'=>date('Y-m-d H:i:s'),
        );
        if($request->file('icon')){
            $imagepath = public_path('/uploads/loaisanpham/');
            $imagestore= '/public/uploads/loaisanpham/';
            $icon = $this->imagehandle($request->file('icon'),$imagepath,$imagestore);
            $data['icon'] = $icon;
        }
        if($request->file('img_share')){
            $imagepath = public_path('/uploads/loaisanpham/');
            $imagestore= '/public/uploads/loaisanpham/';
            $icon = $this->imagehandle($request->file('img_share'),$imagepath,$imagestore);
            $data['img_share'] = $icon;
        }
        producttype::where('id',$id) ->update($data);
        return redirect()->route('loaisanpham.edit', $id)->with(['msg'=>'Cập nhật thành công','type'=>'success']);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = array('status'=> '0');
        if(producttype::where('id',$id)->update($data))
        {
            return redirect()->route('loaisanpham.index', $id)->with(['msg'=>'Xóa thành công','type'=>'success']);
        }
        return redirect()->route('loaisanpham.index', $id)->with(['msg'=>'Xóa không thành công','type'=>'unsuccess']);
    }
}