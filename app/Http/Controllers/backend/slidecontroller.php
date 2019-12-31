<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\slide;
use Illuminate\Http\Request;

class slidecontroller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ds = slide::orderBy('id', 'desc')
        ->where('slide_status','!=','0')
        ->paginate(10);
        return view('backend.slide.index',['ds'=>$ds]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.slide.form',[
            'title'=>'Thêm hình quảng cáo',
            'button'=>'Thêm',
            'linkaction'=> route('slide.store'),
            'method'=>'POST',
            'breadcrumb'=> route('slide.index'),
            'namepage' => 'Hình ảnh quảng cáo'
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
            'slide_name' => 'required',
        ],[
            'slide_name.required' => 'Tên không được để trống',
            'slide_image' => ['sometimes','image','mimes:jpg,jpeg,jfif,bmp,svg,png','max:10000']
        ]);
        $data = array(
            'slide_name'=>$request->slide_name,
            'date_create'=>date('Y-m-d H:i:s'),
            'date_update'=>date('Y-m-d H:i:s'),
        );
        
        if($request->file('slide_image')){
            $imagepath = public_path('/uploads/slide/');
            $imagestore= '/public/uploads/slide/';
            $image = $this->imagehandle($request->file('slide_image'),$imagepath,$imagestore);
            $data['slide_image'] = $image;
        }
        slide::insert($data);
        return redirect()->route('slide.index')->with(['msg'=>'Thêm thành công','type'=>'success']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return view('backend.slide.detail');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $slide = slide::where('id',$id)
        ->where('slide_status','!=',0)
        ->first();
        return view('backend.slide.form',[
            'title'=>'Sửa hình ảnh quảng cáo',
            'button'=>'Cập nhật',
            'slide'=>$slide,
            'linkaction'=> route('slide.update',$slide->id),
            'method'=>'PUT',
            'breadcrumb'=> route('slide.index'),
            'namepage' => 'Hình ảnh quảng cáo'
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
        $slide = slide::where('id',$id)
        ->where('slide_status','!=',0)
        ->first();
        $date_create = $slide->date_create;
        $request->validate([
            'slide_name' => 'required',
        ],[
            'slide_name.required' => 'Tên không được để trống',
            'slide_image' => ['sometimes','image','mimes:jpg,jpeg,jfif,bmp,svg,png','max:10000']
        ]);
        $data = array(
            'slide_name'=>$request->slide_name,
            'date_create'=>$date_create,
            'date_update'=>date('Y-m-d H:i:s'),
        );
        
        if($request->file('slide_image')){
            $imagepath = public_path('/uploads/slide/');
            $imagestore= '/public/uploads/slide/';
            $image = $this->imagehandle($request->file('slide_image'),$imagepath,$imagestore);
            $data['slide_image'] = $image;
        }
        slide::where('id',$id)->update($data);
        return redirect()->route('slide.edit', $id)->with(['msg'=>'Cập nhật thành công','type'=>'success']);
    }

    
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = array('slide_status'=> '0');
        if(slide::where('id',$id)->update($data))
        {
            return redirect()->route('slide.index', $id)->with(['msg'=>'Xóa thành công','type'=>'success']);
        }
        return redirect()->route('slide.index', $id)->with(['msg'=>'Xóa không thành công','type'=>'unsuccess']);
    }
}