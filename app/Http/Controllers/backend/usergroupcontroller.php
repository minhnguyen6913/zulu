<?php

namespace App\Http\Controllers\backend;

use App\Models\usergroup;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class usergroupcontroller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ds = usergroup::where('usergroup.status','!=',0)
        ->orderBy('id', 'desc')
        ->paginate(10);
        return view('backend.usergroup.index',['ds'=>$ds]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.usergroup.form',[
            'title'=>'Thêm nhóm user',
            'button'=>'Thêm',
            'linkaction'=> route('usergroup.store'),
            'method'=>'POST',
            'breadcrumb'=> route('usergroup.index'),
            'namepage' => 'Usergroup'
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
        usergroup::insert([
            'name'=>$request->name,
            'description'=>$request->description,
            'status'=>$request->status,
            'date_create'=>date('Y-m-d H:i:s'),
            'date_update'=>date('Y-m-d H:i:s'),
        ]);
        return redirect()->route('usergroup.index')->with(['msg'=>'Thêm thành công','type'=>'success']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return view('backend.usergroup.detail');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $usergroup = usergroup::where('id',$id)
        ->where('status','!=',0)
        ->first();
        return view('backend.usergroup.form',[
            'title'=>'Sửa nhóm user',
            'button'=>'Cập nhật',
            'usergroup'=>$usergroup,
            'linkaction'=> route('usergroup.update',$usergroup->id),
            'method'=>'PUT',
            'breadcrumb'=> route('usergroup.index'),
            'namepage' => 'Usergroup'
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
        $usergroup = usergroup::where('id',$id)
        ->where('status','!=',0)
        ->first();
        $date_create = $usergroup->date_create;
        usergroup::where('id',$id)
        ->update([
            'name'=>$request->name,
            'description'=>$request->description,
            'status'=>$request->status,
            'date_create'=>$date_create,
            'date_update'=>date('Y-m-d H:i:s'),
        ]);
        return redirect()->route('usergroup.edit', $id)->with(['msg'=>'Cập nhật thành công','type'=>'success']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        usergroup::where('id',$id)
        ->update([
            'status'=> '0'
        ]);
        return redirect()->route('usergroup.destroy', $id)->with(['msg'=>'Xóa thành công','type'=>'success']);
    }
}
