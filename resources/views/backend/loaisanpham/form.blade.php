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
                <h3>Thông tin danh mục</h3>
            </div>
            <div class="card-body">
                <form class="forms-sample" action="{{$linkaction}}" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="_token" value="{{ csrf_token()}}"/>
                    @method($method)
                    @csrf
                    <div class="form-group row">
                        <div class="col-sm-12">
                            <label for="name">Tên loại</label>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Tên loại" value="{{$producttype->name??''}}">
                        </div>
                        
                        <div class="col-sm-6 mt-3">
                            <label for="icon">Icon</label>
                            <input type="file" name="icon" id="icon" class="form-control" placeholder="Hình ảnh" value="{{$producttype->icon??''}}">
                            @if (isset($producttype))
                            <img src="{{asset($producttype->icon)}}" alt="{{$producttype->name??''}}" class="img-fluid img-100">
                            @endif
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="img_share">Image share</label>
                            <input type="file" name="img_share" id="img_share" class="form-control" placeholder="Hình ảnh" value="{{$producttype->img_share??''}}">
                            @if (isset($producttype))
                            <img src="{{asset($producttype->img_share)}}" alt="{{$producttype->name??''}}" class="img-fluid img-100">
                            @endif
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="alias">Alias</label>
                            <input type="text" name="alias" id="alias" class="form-control" placeholder="Alias" value="{{$producttype->alias??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="meta_key">Meta key</label>
                            <input type="text" name="meta_key" id="meta_key" class="form-control" placeholder="meta_key" value="{{$producttype->meta_key??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="meta_desc">Meta description</label>
                            <input type="text" name="meta_desc" id="meta_desc" class="form-control" placeholder="meta_desc" value="{{$producttype->meta_desc??''}}">
                        </div>
                        
                        <div class="col-sm-6 mt-3">
                            <label for="id_parent">Danh mục cha</label>
                            <select class="form-control" name="id_parent" id="id_parent">
                                @foreach ($protypes as $protypesitem)
                                <option @if (isset($producttype) && $producttype->id_parent==$protypesitem->id) selected @endif value="{{$protypesitem->id}}">{{$protypesitem->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="status">Trạng thái</label>
                            <select class="form-control" name="status" id="status">
                                <option @if (isset($producttype) && $producttype->status==1) selected  @endif value="1">Hiện</option>
                                <option @if (isset($producttype) && $producttype->status!=1) selected  @endif value="2">Ẩn</option>
                            </select>
                        </div>
                        <div class="col-sm-12 mt-3">
                            <label for="description">Mô tả</label>
                            <textarea class="form-control" name="description" id="description"
                                rows="3" placeholder="Mô tả">{{$producttype->description??''}}</textarea>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mr-2">
                        {{$button}}
                    </button>
                    <a href="{{route('loaisanpham.index')}}" class="btn btn-light">Quay về</a>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
