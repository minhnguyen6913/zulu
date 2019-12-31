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
                <h3>Hình ảnh quảng cáo</h3>
            </div>
            <div class="card-body">
                <form class="forms-sample" action="{{$linkaction}}" method="POST" enctype="multipart/form-data">
                    @method($method)
                    @csrf
                    <input type="hidden" name="_token" value="{{ csrf_token()}}"/>
                    <div class="form-group row">
                        <div class="col-sm-12">
                            <label for="slide_name">Tên hình ảnh</label>
                            <input type="text" name="slide_name" id="slide_name" class="form-control" placeholder="Tên sản phẩm" value="{{$slide->slide_name??''}}">
                            @error('name')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="slide_image">Hình ảnh</label>
                            <input type="file" name="slide_image" id="slide_image" class="form-control" placeholder="Hình ảnh" value="{{$slide->slide_image??''}}">
                            @if (isset($slide))
                            <img src="{{asset($slide->slide_image)}}" alt="{{$slide->slide_name??''}}" class="img-fluid img-200">
                            @endif
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="slide_status">Trạng thái</label>
                            <select class="form-control" name="slide_status" id="slide_status">
                                <option @if (isset($slide) && $slide->slide_status==1) selected  @endif value="1">Hiện</option>
                                <option @if (isset($slide) && $slide->slide_status!=1) selected  @endif value="2">Ẩn</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mr-2">
                        {{$button}}
                    </button>
                    <a href="{{route('slide.index')}}" class="btn btn-light">Quay về</a>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
