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
                <h3>Thông tin thương hiệu</h3>
            </div>
            <div class="card-body">
                <form class="forms-sample" action="{{$linkaction}}" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="_token" value="{{ csrf_token()}}"/>
                    @method($method)
                    @csrf
                    <div class="form-group row">
                        <div class="col-sm-12">
                            <label for="name">Tên thương hiệu</label>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Tên thương hiệu" value="{{$brands->name??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="image">Hình ảnh</label>
                            <input type="file" name="image" id="image" class="form-control" placeholder="Hình ảnh" value="{{$brands->image??''}}">
                            @if (isset($brands))
                            <img src="{{asset($brands->image)}}" alt="{{$brands->name??''}}" class="img-fluid img-200">
                            @endif
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="alias">Alias</label>
                            <input type="text" name="alias" id="alias" class="form-control" placeholder="Alias" value="{{$brands->alias??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="status">Trạng thái</label>
                            <select class="form-control" name="status" id="status">
                                <option @if (isset($brands) && $brands->status==1) selected  @endif value="1">Hiện</option>
                                <option @if (isset($brands) && $brands->status!=1) selected  @endif value="2">Ẩn</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mr-2">
                        {{$button}}
                    </button>
                    <a href="{{route('thuonghieu.index')}}" class="btn btn-light">Quay về</a>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
