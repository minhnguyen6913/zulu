<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\user;
use App\Models\usergroup;
use App\Models\role;
use Illuminate\Http\Request;

class rolecontroller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = user::get();
        $ds = role::get();
        return view('backend.role.index',[
            'ds'=>$ds,
            'user'=>$user,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
        $user = user::where([
            ['id','=',$id],
            ['status', '=', '1']
        ])->first();
        // if(isset($user))
        // {
        //     $functions = $this->model->listfuncsparent();
        //     $view = 'view/role/chonquyen.php';
        //     include 'view/master.php';
        // }
        return view('backend.role.form',[
            'title'=>'Phân quyền user',
            'button'=>'Cập nhật',
            'user'=>$user,
            'method'=>'PUT',
            'breadcrumb'=> route('role.index'),
            'namepage' => 'Phân quyền'
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}