{extends file='backend/master.tpl'}
{block name='css'}
    <link href="/assets/ample/css/animate.css" rel="stylesheet">
    <link href="/assets/ample/css/style.css" rel="stylesheet">
    <link href="/assets/ample/plugins/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
    <link href="/assets/ample/plugins/bower_components/custom-select/custom-select.css" rel="stylesheet" type="text/css" />
    <style>
    </style>
{/block}
{block name='script'}
    <script src="/assets/ample/plugins/bower_components/sweetalert/sweetalert.min.js"></script>
    <script src="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.js"></script>
    <script src="/assets/ample/plugins/bower_components/sweetalert/jquery.sweet-alert.custom.js"></script>
    <script src="/assets/ample/js/jquery.slimscroll.js"></script>
    <script src="/assets/ample/js/custom.min.js"></script>
    <script src="/assets/ample/js/jasny-bootstrap.js"></script>
    <script src="/assets/ample/js/waves.js"></script>
    <script type="application/javascript">
        $(document).ready(function() {
            _is_edit();
        });
        function _add_submit() {
            if ($("#name").val().trim() == "") {
                swal("Cảnh báo","Tiêu đề không được để trống !!!" , "warning");
            } else {
                $.ajax({
                    url: "{$pathRoot}category/ajax_add",
                    type: "POST",
                    data:  $('#form').serialize(),
                    dataType: "JSON",
                    success: function (data) {
                        console.log(data);
                        if (data == '0') {
                            swal("Cảnh báo","Có lỗi xảy ra !!!" , "warning");
                        } else {
                            swal("Thành công","Thêm dữ liệu thành công !!!" , "success");
                            location.reload();
                        }
                    }
                });
            }
        }
        function _getImage (id, inputId=false, forTextArea=false) {
            if (id > 0) {
                $.ajax({
                    url: "{$imageRoot}selectImage/getimage",
                    type: "POST",
                    data:  {
                        id : id
                    },
                    dataType: "JSON",
                    success: function (data) {
                        // alert(inputId);
                        if (forTextArea == 'true') {
                            $('#content').summernote('insertImage', data.src, 'picture');
                            $('#modal_form').modal('hide');
                        }else {
                            $("#" + inputId).attr('src', '');
                            $("#" + inputId + "_show").attr('src', data.thumbnail);
                            $('#modal_form').modal('hide');
                        }

                    }
                });
            }

        }
        function _is_edit() {
            $.ajax({
                url: "{$pathRoot}category/getCategory",
                type: "POST",
                data: { id : "{$id}" },
                dataType: "JSON",
                success: function (data) {
                    _getImage(data.image,'image',false);
                }
            });
            
        }
        function _edit() {
            document.location.href='{$pathRoot}category/edit?id={$id}';
        }

    </script>
{/block}
{block name='body'}
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">THÊM MỤC NỘI DUNG</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="#">Mục nội dung</a></li>
                    <li class="active">Thêm mục</li>
                </ol>
            </div>
        </div>
        <form id="form" matrix="post" class="form-material form-horizontal">
            <div class="row">
                <div class="col-md-8">
                    <div class="white-box">
                        <div class="panel-group" role="tablist" aria-multiselectable="true">

                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingSix">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="true" aria-controls="collapseSix" class="font-bold">
                                            Thông tin chung
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseSix" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingSix">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label class="col-md-12">Tiêu đề:</label>
                                            <div class="col-md-12">
                                               <p>{$category['name']}</p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-12">Nội dung:</label>
                                            <div class="col-md-12" id="content">
                                                {$category['content']}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="white-box">
                        <div class="panel-group" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingFive">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="true" aria-controls="collapseFive" class="font-bold">
                                            Thông tin chung
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseFive" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingSix">
                                    <div class="panel-body">


                                        <div class="form-group">
                                            <label class="col-md-12">Loại:</label>
                                            <div class="col-md-12">
                                                <select class="form-control" name="type" disabled>
                                                    <option value="1" {if $category['type'] == '1'} selected="selected"{/if}>Bài viết</option>
                                                    <option value="2" {if $category['type'] == '2'} selected="selected"{/if}>Tin tức</option>
                                                    <option value="3" {if $category['type'] == '3'} selected="selected"{/if}>Văn bản pháp quy</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-12">Cách hiển thị:</label>
                                            <div class="col-md-12">
                                                <select class="form-control" name="style" disabled>
                                                    <option value="1" {if $category['style'] == '1'} selected="selected" {/if}>Danh sách</option>
                                                    <option value="2" {if $category['style'] == '2'} selected="selected" {/if} >Dạng lưới</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-12">Sắp xếp:</label>
                                            <div class="col-md-12">
                                                <p>{$category.sort}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed font-bold" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" >
                                            Hình ảnh
                                        </a>
                                    </h4>
                                </div>

                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <input type="hidden" id="image" name="image" />
                                            <label class="col-sm-12">Hình đại diện</label>
                                            <div class="white-box text-center">
                                                <img  id="image_show" class="img-responsive img-thumbnail" src="/assets/ext/image/noimage.png" style="width: 150px; height: 150px;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div>

        </form>
        </form>
        <div class="modal-footer">
            <button type="button" class="btn btn-primary waves-effect" id="btnAdd" onclick="_edit()">Sửa</button>
            <button type="button" class="btn btn-default waves-effect" onclick="window.history.go(-1); return false;">Back</button>
        </div>
    </div>
{/block}
