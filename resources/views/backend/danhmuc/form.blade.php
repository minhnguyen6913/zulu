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
                            <label for="name">Tên danh mục</label>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Tên danh mục" value="{{$productcategory->name??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="alias">Alias</label>
                            <input type="text" name="alias" id="alias" class="form-control" placeholder="Alias" value="{{$productcategory->alias??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="id_parent">Danh mục cha</label>
                            <select class="form-control" name="id_parent" id="id_parent">
                                @foreach ($procates as $procatesitem)
                                <option @if (isset($productcategory) && $productcategory->id_parent==$procatesitem->id) selected @endif value="{{$procatesitem->id}}">{{$procatesitem->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="status">Trạng thái</label>
                            <select class="form-control" name="status" id="status">
                                <option @if (isset($productcategory) && $productcategory->status==1) selected  @endif value="1">Hiện</option>
                                <option @if (isset($productcategory) && $productcategory->status!=1) selected  @endif value="2">Ẩn</option>
                            </select>
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="image">Hình ảnh</label>
                            <input type="file" name="image" id="image" class="form-control" placeholder="Hình ảnh" value="{{$productcategory->image??''}}">
                            @if (isset($productcategory))
                            <img src="{{asset($productcategory->image)}}" alt="{{$productcategory->name??''}}" class="img-fluid img-200">
                            @endif
                        </div>
                        <div class="col-sm-12 mt-3">
                            <label for="description">Mô tả</label>
                            <textarea class="form-control" name="description" id="description"
                                rows="3" placeholder="Mô tả">{{$productcategory->description??''}}</textarea>
                                <script type="text/javascript">CKEDITOR.replace('txtLSPIntro'); </script>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mr-2">
                        {{$button}}
                    </button>
                    <a href="{{route('danhmuc.index')}}" class="btn btn-light">Quay về</a>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
