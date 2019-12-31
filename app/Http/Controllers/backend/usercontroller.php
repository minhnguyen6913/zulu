<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\user;
use App\Models\usergroup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class usercontroller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //Đầu tiên gọi tên model ra để app user tự thêm vào
        $ds = user::join('usergroup','user.id_usergroup','=','usergroup.id')
        ->select('user.*', 'usergroup.name as tennhom')
        ->where('user.status','!=',0)
        ->where('user.id_usergroup','!=',8)
        ->orderBy('user.id', 'asc')
        ->paginate(10);
        return view('backend.user.index',['ds'=>$ds]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $usergroup = usergroup::select('id','name')->where('id','!=',8)->get();
        return view('backend.user.form',[
            'title'=>'Thêm user',
            'button'=>'Thêm',
            'linkaction'=> route('usergroup.store'),
            'usergroup'=> $usergroup,
            'method'=>'POST',
            'breadcrumb'=> route('usergroup.index'),
            'namepage' => 'User'
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
        $genPw = Hash::make($request->password);
        $data = array(
            'username'=>$request->username,
            'password'=>$genPw,
            'phone'=>$request->phone,
            'status'=>$request->status,
            'id_usergroup'=>$request->id_usergroup,
            'fullname'=>$request->fullname,
            'date_create'=>date('Y-m-d H:i:s'),
            'date_update'=>date('Y-m-d H:i:s'),
        );
        if($request->file('image')){
            $imagepath = public_path('/uploads/user/');
            $imagestore= '/public/uploads/user/';
            $image = $this->imagehandle($request->file('image'),$imagepath,$imagestore);
            $data['image'] = $image;
        }
        user::insert($data);
        return redirect()->route('user.index')->with(['msg'=>'Thêm thành công','type'=>'success']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return view('backend.user.detail');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = user::where('id',$id)
        ->where('status','!=',0)
        ->first();
        $usergroup = usergroup::select('id','name')->get();
        return view('backend.user.form',[
            'title'=>'Sửa user',
            'button'=>'Cập nhật',
            'user'=>$user,
            'usergroup'=>$usergroup,
            'linkaction'=> route('user.update',$user->id),
            'method'=>'PUT',
            'breadcrumb'=> route('usergroup.index'),
            'namepage' => 'User'
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
        $user = user::where('id',$id)
            ->where('status','!=',0)
            ->first();
        if($request->password){
            $genPw = Hash::make($request->password);
        }
        else{
            $genPw = $user->password;
        }
        $date_create = $user->date_create;
        $data = array(
            'username'=>$request->username,
            'password'=>$genPw,
            'phone'=>$request->phone,
            'status'=>$request->status,
            'id_usergroup'=>$request->id_usergroup,
            'fullname'=>$request->fullname,
            'date_create'=>$date_create,
            'date_update'=>date('Y-m-d H:i:s'),
        );
        if($request->file('image')){
            $imagepath = public_path('/uploads/user/');
            $imagestore= '/public/uploads/user/';
            $image = $this->imagehandle($request->file('image'),$imagepath,$imagestore);
            $data['image'] = $image;
        }
        user::where('id',$id)->update($data);
        return redirect()->route('user.edit', $id)->with(['msg'=>'Cập nhật thành công','type'=>'success']);
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
        if(user::where('id',$id)->update($data))
        {
            return redirect()->route('user.index', $id)->with(['msg'=>'Xóa thành công','type'=>'success']);
        }
        return redirect()->route('user.index', $id)->with(['msg'=>'Xóa không thành công','type'=>'unsuccess']);
    }

    public function login()
    {
        $username = session('username');
        $rememberlogin = session('rememberlogin');
        if(isset($username) && ($rememberlogin == 1)){
            return redirect()->route('home.index');
        }else{
            return view('backend.user.login');
        }
    }

    public function loginpost(Request $request)
    {
        //dd($request);
        if(Auth::guard('backend')->attempt(['username' => $request->username, 'password' => $request->password]))
        {
            session([
                    'username' => $request->username,
                    'rememberlogin' => $request->rememberlogin
                    ]);
            return redirect()->route('home.index');
        }else{
            return redirect()->back()->with(['msg'=>'Tài khoản không hợp lệ','type'=>'danger']);
        }
    }

    public function logout()
    {
        Auth::guard('backend')->logout();
        session()->forget(['username', 'rememberlogin']);
        return redirect()->route('user.login')->with(['msg'=>'Bạn vừa đăng xuất khỏi hệ thống','type'=>'warning']);
    }

    // public function createpassword(){
    //     $pw = '123456';
    //     $bien = Hash::make($pw);
    //     $bien2 = Hash::make($pw);
    //     if(Hash::check($pw, $bien2)){
    //         dd('bằng');
    //     }else{
    //         dd('không bằng');
    //     }
    // }
}