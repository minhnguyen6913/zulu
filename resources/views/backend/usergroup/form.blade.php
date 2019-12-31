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
                <h3>Thông tin nhóm user</h3>
            </div>
            <div class="card-body">
                <form class="forms-sample" action="{{$linkaction}}" method="POST">
                    <input type="hidden" name="_token" value="{{ csrf_token()}}"/>
                    @method($method)
                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label for="name">Tên nhóm</label>
                            <input type="text" name="name" id="name" class="form-control" placeholder="name" value="{{$usergroup->name??''}}">
                        </div>
                        <div class="col-sm-6">
                            <label for="status">Trạng thái</label>
                            <select class="form-control" name="status" id="status">
                                <option @if (isset($usergroup) && $usergroup->status==1) selected  @endif value="1">Hiện</option>
                                <option @if (isset($usergroup) && $usergroup->status!=1) selected  @endif value="2">Ẩn</option>
                            </select>
                        </div>
                        <div class="col-sm-12 mt-3">
                            <label for="description">Mô tả</label>
                            <textarea class="form-control" name="description" id="description"
                                rows="3" placeholder="Mô tả">{{$usergroup->description??''}}</textarea>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mr-2">
                        {{$button}}
                    </button>
                    <a href="{{route('usergroup.index')}}" class="btn btn-light">Quay về</a>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
