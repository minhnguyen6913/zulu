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
                <h3>Thông tin nhà cung cấp</h3>
            </div>
            <div class="card-body">
                <form class="forms-sample" action="{{$linkaction}}" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="_token" value="{{ csrf_token()}}"/>
                    @method($method)
                    @csrf
                    <div class="form-group row">
                        <div class="col-sm-12">
                            <label for="name">Tên nhà cung cấp</label>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Tên nhà cung cấp" value="{{$suppliers->name??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="image">Hình ảnh</label>
                            <input type="file" name="image" id="image" class="form-control" placeholder="Hình ảnh" value="{{$suppliers->image??''}}">
                            @if (isset($suppliers))
                            <img src="{{asset($suppliers->image)}}" alt="{{$suppliers->name??''}}" class="img-fluid img-100">
                            @endif
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="phone">Số điện thoại</label>
                            <input type="number" name="phone" id="phone" class="form-control" placeholder="Số điện thoại" value="{{$suppliers->phone??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="address">Địa chỉ</label>
                            <input type="text" name="address" id="address" class="form-control" placeholder="Địa chỉ" value="{{$suppliers->address??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="alias">Alias</label>
                            <input type="text" name="alias" id="alias" class="form-control" placeholder="Alias" value="{{$suppliers->alias??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="status">Trạng thái</label>
                            <select class="form-control" name="status" id="status">
                                <option @if (isset($suppliers) && $suppliers->status==1) selected  @endif value="1">Hiện</option>
                                <option @if (isset($suppliers) && $suppliers->status!=1) selected  @endif value="2">Ẩn</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mr-2">
                        {{$button}}
                    </button>
                    <a href="{{route('nhacungcap.index')}}" class="btn btn-light">Quay về</a>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
