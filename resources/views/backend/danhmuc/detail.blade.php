<!--Kế thừa cha-->
@extends('backend.master')
<!--Vị trí kế thừa-->
@section('pagename')
Chi tiết danh mục
@endsection
@section('content')
<div class="card">
    <div class="card-header"><h3>Thông tin danh mục</h3></div>
    <div class="card-body">
        <form class="forms-sample">
            <div class="form-group">
                <label for="name">Tên danh mục</label>
                <input type="text" class="form-control" id="name" placeholder="Tên sản phẩm">
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="sku">Mã sản phẩm</label>
                        <input type="email" class="form-control" id="sku" placeholder="Mã sản phẩm">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="category">Loại sản phẩm</label>
                        <select class="form-control" id="category">
                            <option>SP1</option>
                            <option>SP2</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="price">Giá</label>
                <input type="password" class="form-control" id="price" placeholder="Giá">
            </div>

            <div class="form-group">
                <label>Hình ảnh</label>
                <input type="file" name="img[]" class="file-upload-default">
                <div class="input-group col-xs-12">
                    <input type="text" class="form-control file-upload-info" disabled="" placeholder="Upload Image">
                    <span class="input-group-append">
                    <button class="file-upload-browse btn btn-primary" type="button">Tải lên</button>
                    </span>
                </div>
            </div>
            <div class="form-group">
                <label for="exampleTextarea1">Textarea</label>
                <textarea class="form-control" id="exampleTextarea1" rows="4"></textarea>
            </div>
            <button type="submit" class="btn btn-primary mr-2">Submit</button>
            <button class="btn btn-light">Cancel</button>
        </form>
    </div>
</div>
@endsection
