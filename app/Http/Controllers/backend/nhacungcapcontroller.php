<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\suppliers;
use Illuminate\Http\Request;

class nhacungcapcontroller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ds = suppliers::orderBy('id', 'desc')
        ->where('suppliers.status','!=',0)
        ->paginate(10);
        return view('backend.nhacungcap.index',['ds'=>$ds]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.nhacungcap.form',[
            'title'=>'Thêm nhà cung cấp',
            'button'=>'Thêm',
            'linkaction'=> route('nhacungcap.store'),
            'method'=>'POST',
            'breadcrumb'=> route('nhacungcap.index'),
            'namepage' => 'Nhà cung cấp'
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
            'name.required' => 'Tên nhà cung cấp không được để trống',
            'image' => ['sometimes','image','mimes:jpg,jpeg,jfif,bmp,svg,png','max:10000']
        ]);
        $data = array(
            'name'=>$request->name,
            'image'=>$request->image,
            'phone'=>$request->phone,
            'address'=>$request->address,
            'status'=>$request->status,
            'alias'=>$request->alias,
            'date_create'=>date('Y-m-d H:i:s'),
            'date_update'=>date('Y-m-d H:i:s'),
        );
        if($request->file('image')){
            $imagepath = public_path('/uploads/suppliers/');
            $imagestore= '/public/uploads/suppliers/';
            $image = $this->imagehandle($request->file('image'),$imagepath,$imagestore);
            $data['image'] = $image;
        }
        suppliers::insert($data);
        return redirect()->route('nhacungcap.index')->with(['msg'=>'Thêm thành công','type'=>'success']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return view('backend.nhacungcap.detail');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $suppliers = suppliers::where('id',$id)
        ->where('status','!=',0)
        ->first();
        return view('backend.nhacungcap.form',[
            'title'=>'Sửa nhà cung cấp',
            'button'=>'Cập nhật',
            'suppliers'=>$suppliers,
            'linkaction'=> route('nhacungcap.update',$suppliers->id),
            'method'=>'PUT',
            'breadcrumb'=> route('nhacungcap.index'),
            'namepage' => 'Nhà cung cấp'
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
        $suppliers = suppliers::where('id',$id)
        ->where('status','!=',0)
        ->first();
        $date_create = $suppliers->date_create;
        $request->validate([
            'name' => 'required',
        ],[
            'name.required' => 'Tên nhà cung cấp không được để trống',
            'image' => ['sometimes','image','mimes:jpg,jpeg,jfif,bmp,svg,png','max:10000']
        ]);
        $data = array(
            'name'=>$request->name,
            'phone'=>$request->phone,
            'address'=>$request->address,
            'status'=>$request->status,
            'alias'=>$request->alias,
            'date_create'=>$date_create,
            'date_update'=>date('Y-m-d H:i:s'),
        );
        if($request->file('image')){
            $imagepath = public_path('/uploads/suppliers/');
            $imagestore= '/public/uploads/suppliers/';
            $image = $this->imagehandle($request->file('image'),$imagepath,$imagestore);
            $data['image'] = $image;
        }
        suppliers::where('id',$id)->update($data);
        return redirect()->route('nhacungcap.edit', $id)->with(['msg'=>'Cập nhật thành công','type'=>'success']);
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
        if(suppliers::where('id',$id)->update($data))
        {
            return redirect()->route('nhacungcap.index', $id)->with(['msg'=>'Xóa thành công','type'=>'success']);
        }
        return redirect()->route('nhacungcap.index', $id)->with(['msg'=>'Xóa không thành công','type'=>'unsuccess']);
    }
}