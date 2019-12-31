<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\brands;
use Illuminate\Http\Request;

class thuonghieucontroller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ds = brands::orderBy('id', 'desc')
        ->where('brands.status','!=',0)
        ->paginate(10);
        return view('backend.thuonghieu.index',['ds'=>$ds]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.thuonghieu.form',[
            'title'=>'Thêm thương hiệu',
            'button'=>'Thêm',
            'linkaction'=> route('thuonghieu.store'),
            'method'=>'POST',
            'breadcrumb'=> route('thuonghieu.index'),
            'namepage' => 'Thương hiệu'
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
            'name.required' => 'Tên thương hiệu không được để trống',
            'image' => ['sometimes','image','mimes:jpg,jpeg,jfif,bmp,svg,png','max:10000']
        ]);
        $data = array(
            'name'=>$request->name,
            'status'=>$request->status,
            'alias'=>$request->alias,
            'date_create'=>date('Y-m-d H:i:s'),
            'date_update'=>date('Y-m-d H:i:s'),
        );
        
        if($request->file('image')){
            $imagepath = public_path('/uploads/brands/');
            $imagestore= '/public/uploads/brands/';
            $image = $this->imagehandle($request->file('image'),$imagepath,$imagestore);
            $data['image'] = $image;
        }
        brands::insert($data);
        return redirect()->route('thuonghieu.index')->with(['msg'=>'Thêm thành công','type'=>'success']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return view('backend.thuonghieu.detail');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $brands = brands::where('id',$id)
        ->where('status','!=',0)
        ->first();
        return view('backend.thuonghieu.form',[
            'title'=>'Sửa thương hiệu',
            'button'=>'Cập nhật',
            'brands'=>$brands,
            'linkaction'=> route('thuonghieu.update',$brands->id),
            'method'=>'PUT',
            'breadcrumb'=> route('thuonghieu.index'),
            'namepage' => 'Thương hiệu'
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
        $brands = brands::where('id',$id)
        ->where('status','!=',0)
        ->first();
        $date_create = $brands->date_create;
        $request->validate([
            'name' => 'required',
        ],[
            'name.required' => 'Tên thương hiệu không được để trống',
            'image' => ['sometimes','image','mimes:jpg,jpeg,jfif,bmp,svg,png','max:10000']
        ]);
        $data = array(
            'name'=>$request->name,
            'status'=>$request->status,
            'alias'=>$request->alias,
            'date_create'=>$date_create,
            'date_update'=>date('Y-m-d H:i:s'),
        );
        if($request->file('image')){
            $imagepath = public_path('/uploads/brands/');
            $imagestore= '/public/uploads/brands/';
            $image = $this->imagehandle($request->file('image'),$imagepath,$imagestore);
            $data['image'] = $image;
        }
        brands::where('id',$id)->update($data);
        return redirect()->route('thuonghieu.edit', $id)->with(['msg'=>'Cập nhật thành công','type'=>'success']);
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
        if(brands::where('id',$id)->update($data))
        {
            return redirect()->route('thuonghieu.index', $id)->with(['msg'=>'Xóa thành công','type'=>'success']);
        }
        return redirect()->route('thuonghieu.index', $id)->with(['msg'=>'Xóa không thành công','type'=>'unsuccess']);
    }
}