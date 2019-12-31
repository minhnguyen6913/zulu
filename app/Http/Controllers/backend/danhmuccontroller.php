<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\productcategory;
use Illuminate\Http\Request;

class danhmuccontroller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ds = productcategory::orderBy('id', 'desc')
        ->where('productcategory.status','!=',0)
        ->paginate(10);
        return view('backend.danhmuc.index',['ds'=>$ds]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $procates  = productcategory::select('id','name')->get();
        return view('backend.danhmuc.form',[
            'title'=>'Thêm danh mục',
            'button'=>'Thêm',
            'procates'=>$procates,
            'linkaction'=> route('danhmuc.store'),
            'method'=>'POST',
            'breadcrumb'=> route('danhmuc.index'),
            'namepage' => 'Danh mục'
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
            'image' => ['sometimes','image','mimes:jpg,jpeg,jfif,bmp,svg,png','max:10000']
        ]);
        $data = array(
            'name'=>$request->name,
            'alias'=>$request->alias,
            'status'=>$request->status,
            'description'=>$request->description,
            'id_parent'=>$request->id_parent,
            'date_create'=>date('Y-m-d H:i:s'),
            'date_update'=>date('Y-m-d H:i:s'),
        );
        if($request->file('image')){
            $imagepath = public_path('/uploads/productcategory/');
            $imagestore= '/public/uploads/productcategory/';
            $image = $this->imagehandle($request->file('image'),$imagepath,$imagestore);
            $data['image'] = $image;
        }
        productcategory::insert($data);
        return redirect()->route('danhmuc.index')->with(['msg'=>'Thêm thành công','type'=>'success']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        
        $productcategory = productcategory::where('id',$id)
        ->where('status','!=',0)
        ->first();
        $procates = productcategory::select('id','name')->get();
        
        return view('backend.danhmuc.form',[
            'title'=>'Sửa danh mục',
            'button'=>'Cập nhật',
            'productcategory'=>$productcategory,
            'procates'=>$procates,
            'linkaction'=> route('danhmuc.update',$productcategory->id),
            'method'=>'PUT',
            'breadcrumb'=> route('danhmuc.index'),
            'namepage' => 'Danh mục'
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
        $productcategory = productcategory::where('id',$id)
        ->where('status','!=',0)
        ->first();
        $date_create = $productcategory->date_create;
        $request->validate([
            'name' => 'required',
        ],[
            'name.required' => 'Tên danh mục không được để trống',
            'image' => ['sometimes','image','mimes:jpg,jpeg,jfif,bmp,svg,png','max:10000']
        ]);
        
        $data = array(
            'name'=>$request->name,
            'alias'=>$request->alias,
            'status'=>$request->status,
            'description'=>$request->description,
            'id_parent'=>$request->id_parent,
            'date_create'=>$date_create,
            'date_update'=>date('Y-m-d H:i:s'),
        );
        if($request->file('image')){
            $imagepath = public_path('/uploads/productcategory/');
            $imagestore= '/public/uploads/productcategory/';
            $image = $this->imagehandle($request->file('image'),$imagepath,$imagestore);
            $data['image'] = $image;
        }
        productcategory::where('id',$id)
        ->update($data);
        return redirect()->route('danhmuc.edit', $id)->with(['msg'=>'Cập nhật thành công','type'=>'success']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        productcategory::where('id',$id)
        ->update([
            'status'=> '0'
        ]);
        return redirect()->route('danhmuc.index', $id)->with(['msg'=>'Xóa thành công','type'=>'success']);
    }
}