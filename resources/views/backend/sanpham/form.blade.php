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
                <h3>Thông tin sản phẩm</h3>
            </div>
            <div class="card-body">
                <form class="forms-sample" action="{{$linkaction}}" method="POST" enctype="multipart/form-data">
                    @method($method)
                    @csrf
                    <input type="hidden" name="_token" value="{{ csrf_token()}}"/>
                    <div class="form-group row">
                        <div class="col-sm-12">
                            <label for="name">Tên sản phẩm</label>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Tên sản phẩm" value="{{$product->name??''}}">
                            @error('name')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>
                        <div class="col-sm-12 mt-3">
                            <label for="img_social">Hình avartar</label>
                            <input type="file" name="img_social" id="img_social" class="form-control" placeholder="image social" value="{{$product->img_social??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="image">Hình ảnh</label>
                            <input type="file" name="image" id="image" class="form-control" placeholder="Hình ảnh" value="{{$product->image??''}}">
                            @if (isset($product))
                            <img src="{{asset($product->image)}}" alt="{{$product->name??''}}" class="img-fluid img-200">
                            @endif
                        </div>
                        
                        <div class="col-sm-6 mt-3">
                            <label for="alias">Alias</label>
                            <input type="text" name="alias" id="alias" class="form-control" placeholder="Alias" value="{{$product->alias??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="price">Giá</label>
                            <input type="number" name="price" id="price" class="form-control" placeholder="Giá" value="{{$product->price??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="qty">Số lượng</label>
                            <input type="number" name="qty" id="qty" class="form-control" placeholder="Số lượng" value="{{$product->qty??''}}">
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="id_type">Loại sản phẩm</label>
                            <select class="form-control" name="id_type" id="id_type">
                                @foreach ($types as $typeitem)
                                <option @if (isset($product) && $product->id_type==$typeitem->id) selected @endif value="{{$typeitem->id}}">{{$typeitem->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="id_category">Danh mục</label>
                            <select class="form-control" name="id_category" id="id_category">
                                @foreach ($cats as $catitem)
                                <option @if (isset($product) && $product->id_category == $catitem->id) selected @endif value="{{$catitem->id}}">{{$catitem->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="id_brand">Thương hiệu</label>
                            <select class="form-control" name="id_brand" id="">
                                @foreach ($brands as $branditem)
                                <option @if (isset($product) && $product->id_brand==$branditem->id) selected @endif value="{{$branditem->id}}">{{$branditem->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="id_supplier">Nhà cung cấp</label>
                            <select class="form-control" name="id_supplier" id="id_supplier">
                                @foreach ($sups as $supitem)
                                <option @if (isset($product) && $product->id_supplier==$supitem->id) selected  @endif value="{{$supitem->id}}">{{$supitem->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-sm-6 mt-3">
                            <label for="status">Trạng thái</label>
                            <select class="form-control" name="status" id="status">
                                <option @if (isset($product) && $product->status==1) selected  @endif value="1">Hiện</option>
                                <option @if (isset($product) && $product->status!=1) selected  @endif value="2">Ẩn</option>
                            </select>
                        </div>
                        <div class="col-sm-12 mt-3">
                            <label for="meta_key">meta key</label>
                            <input type="text" name="meta_key" id="meta_key" class="form-control" placeholder="meta key"  value="{{$product->meta_key??''}}">
                        </div>
                        <div class="col-sm-12 mt-3">
                            <label for="meta_desc">meta description</label>
                            <input type="text" name="meta_desc" id="meta_desc" class="form-control" placeholder="meta description" value="{{$product->meta_desc??''}}">
                        </div>
                        
                        <div class="col-sm-12 mt-3">
                            <label for="description">Mô tả</label>
                            <textarea class="form-control" name="description" id="description"
                                rows="3" placeholder="Mô tả">{{$product->description??''}}</textarea>
                        </div>
                        <div class="col-sm-12 mt-3">
                            <label for="detail">Chi tiết sản phẩm</label>
                            <textarea class="form-control html-editor" name="detail" id="detail" rows="10" placeholder="Nhập nội dung">
                                {{$product->detail??''}}
                            </textarea>
                            
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mr-2">
                        {{$button}}
                    </button>
                    <a href="{{route('sanpham.index')}}" class="btn btn-light">Quay về</a>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
