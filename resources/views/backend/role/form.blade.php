<!--Kế thừa cha-->
@extends('backend.master')
<!--Vị trí kế thừa-->
@section('pagename')
{{$title}}
@endsection
@section('pagetitle')
{{$title}}
@endsection
@section('content')
@if (session('msg'))
<div class="alert alert-{{session('type')}}">{{session('msg')}}</div>
@endif
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h3>Thông tin user</h3>
            </div>
            <div class="card-body">
                <form class="forms-sample" action="{{$linkaction}}" method="POST">
                    <input type="hidden" name="_token" value="{{ csrf_token()}}"/>
                    @method($method)
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label for="username">Username</label>
                            <input type="text" name="username" id="username" class="form-control" placeholder="username" value="{{$user->username??''}}">
                        </div>
                        <div class="col-sm-6">
                            <label for="password">Password</label>
                            <input type="password" name="password" id="password" class="form-control" placeholder="password" value="">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="fullname">Họ và tên</label>
                            <input type="text" name="fullname" id="fullname" class="form-control" placeholder="fullname" value="{{$user->fullname??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="phone">Số điện thoại</label>
                            <input type="text" name="phone" id="phone" class="form-control" placeholder="phone" value="{{$user->phone??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="image">Hình ảnh</label>
                            <input type="text" name="image" id="image" class="form-control" placeholder="image" value="{{$user->image??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="id_usergroup">Nhóm user</label>
                            <select class="form-control" name="id_usergroup" id="id_usergroup">
                                @foreach ($usergroup as $usergroupitem)
                                <option @if (isset($user) && $user->id_usergroup==$usergroupitem->id) selected  @endif value="{{$usergroupitem->id}}">{{$usergroupitem->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="status">Trạng thái</label>
                            <select class="form-control" name="status" id="status">
                                <option @if (isset($user) && $user->status==1) selected  @endif value="1">Hiện</option>
                                <option @if (isset($user) && $user->status!=1) selected  @endif value="2">Ẩn</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mr-2">
                        {{$button}}
                    </button>
                    <a href="{{route('user.index')}}" class="btn btn-light">Quay về</a>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
