{extends file='backend/master.tpl'}
{block name='css'}
    <link href="/assets/ample/css/animate.css" rel="stylesheet">
    <link href="/assets/ample/css/style.css" rel="stylesheet">
    <link href="/assets/ext/summernote/summernote.css" rel="stylesheet" />
    <link href="/assets/ample/plugins/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
    <link href="/assets/ample/plugins/bower_components/custom-select/custom-select.css" rel="stylesheet" type="text/css" />
    
    <style>

        .modal-body

            background-color: transparent;
        }
    </style>
{/block}
{block name='script'}
    <script src="/assets/ext/summernote/summernote.min.js"></script>
    <script src="/assets/ample/plugins/bower_components/sweetalert/sweetalert.min.js"></script>
    <script src="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.js"></script>
    <script src="/assets/ample/plugins/bower_components/sweetalert/jquery.sweet-alert.custom.js"></script>
    <script src="/assets/ample/js/jquery.slimscroll.js"></script>
    <script src="/assets/ample/js/custom.min.js"></script>
    <script src="/assets/ample/js/jasny-bootstrap.js"></script>
    <script src="/assets/ample/js/waves.js"></script>
    <script src="/assets/ample/plugins/bower_components/custom-select/custom-select.min.js" type="text/javascript"></script>
    <script src="/assets/ample/plugins/bower_components/bootstrap-select/bootstrap-select.min.js" type="text/javascript"></script>
    <script type="application/javascript">
        const imageBtn = function (context) {
            var ui = $.summernote.ui;
            // create button
            var button = ui.button({
                contents: '<i class="fa fa-file-image-o"/>',
                tooltip: 'Image',
                click: function () {
                    _add_image('content', 'true');
                }
            });

            return button.render();   // return button as jquery object
        };
        $(document).ready(function() {
            $(".select2").select2();

            $('#content').summernote({
                height: 300, // set editor height
                minHeight: null, // set minimum height of editor
                maxHeight: null, // set maximum height of editor
                focus: false, // set focus to editable area after initializing summernote
                toolbar: [
                    ['style', ['style']],
                    ['font', ['bold', 'underline', 'clear','strikethrough', 'superscript', 'subscript']],
                    ['fontname', ['fontname']],
                    ['color', ['color']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['table', ['table']],
                    ['insert', ['link', 'imageBtn', 'video','hr']],
                    ['view', ['fullscreen', 'codeview', 'help']],
                ],
                buttons: {
                    imageBtn: imageBtn,
                },

            });

            {if $edit} _is_edit();{/if}

        });





        function _add_image(inputName, forTextArea) {
            $('.form-group').removeClass('has-error'); // clear error class
            $('.help-block').empty(); // clear error string
            $('#modal_form').modal('show'); // show bootstrap modal
            $('.modal-title').text('Chọn hình ảnh'); // Set Title to Bootstrap modal title
            $.ajax({
                url: "{$imageRoot}selectImage/showimagecategory",
                type: "POST",
                data: {
                    inputName: inputName,
                    forTextArea : forTextArea,
                },
                dataType: "text",
                success: function (data) {
                    $('#show').html(data);

                }
            });
        }
        function _chooseImage(id=false, inputId, forTextArea) {

            if (forTextArea != 'true') {
                $("#"+inputId).val(id);
            }
            _getImage(id,inputId, forTextArea);
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
        function _add_submit() {
            if ($("#name").val().trim() == "") {
                swal("Cảnh báo","Tiêu đề không được để trống !!!" , "warning");
            } else {
                $.ajax({
                    url: "{$pathRoot}category/ajax_add",
                    type: "POST",
                    data:  $('#form').serialize(),
                    dataType: "text",
                    success: function (data) {
                        if (data == '0') {
                            swal("Cảnh báo","Tiêu đề đã tồn tại" , "warning");
                        } else {
                            swal("Thành công","Thêm dữ liệu thành công !!!" , "success");
                            document.location.href='{$pathRoot}category';
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
                    if (data.content) {
                        $('#content_area').empty();
                        var html = "<textarea id='content' class='summernote' name='content'>"+data.content_eng+"</textarea>";
                        $('#content_area').append(html);
                    }

                    $('#content').summernote({
                        height: 300, // set editor height
                        minHeight: null, // set minimum height of editor
                        maxHeight: null, // set maximum height of editor
                        focus: false, // set focus to editable area after initializing summernote
                        toolbar: [
                            ['style', ['style']],
                            ['font', ['bold', 'underline', 'clear','strikethrough', 'superscript', 'subscript']],
                            ['fontname', ['fontname']],
                            ['color', ['color']],
                            ['para', ['ul', 'ol', 'paragraph']],
                            ['table', ['table']],
                            ['insert', ['link', 'imageBtn', 'video','hr']],
                            ['view', ['fullscreen', 'codeview', 'help']],
                        ],
                        buttons: {
                            imageBtn: imageBtn,
                        },

                    });
                    _getImage(data.image,'image',false);

                }
            });
            
        }

        function validate() {
            if ($("#name").val() == "") {
                swal("Cảnh báo","Tiêu đề không được để trống" , "warning");
                return false;
            }
            return true;
        }
        function _edit_submit() {
            if(validate()) {
                $.confirm({
                    title: 'Xác nhận',
                    content: 'Bạn có xác nhận sửa?',
                    icon: 'fa fa-question',
                    theme: 'modern',
                    closeIcon: true,
                    autoClose: 'cancel|10000',
                    animation: 'scale',
                    type: 'orange',
                    buttons: {
                        'Xác nhận': {
                            btnClass: 'btn-primary',
                            action: function () {
                                $.ajax({
                                    type: "POST",
                                    url: "{$pathRoot}category/ajax_edit",
                                    data: $('#form').serialize(),
                                    dataType: "JSON",
                                    success: function (data) {
                                        if (data == '0') {
                                            swal("Cảnh báo","Tiêu đề đã tồn tại" , "warning");
                                        } else {
                                            swal("Thành công","Sửa dữ liệu thành công !!!" , "success");
                                            document.location.href='{$pathRoot}category';
                                        }
                                    }
                                });
                            }
                        },
                        cancel: {
                            text: 'Hủy',
                            btnClass: 'btn-danger',
                            action: function () {
                                // lets the user close the modal.
                            }
                        }
                    }
                });
            }
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
        <form id="form" method="post" class="form-material form-horizontal">
            <input type="hidden" value="OK" id="isSent" name="isSent" />
            <input type="hidden" id="id" name="id" value="{$id}"/>
            <input type="hidden" id="parent" name="parent" value="{$parent}"/>

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
                                                <input type="text" class="form-control" id="name" name="name" value="{$category['name']}">
                                                <div id="treeFolder" class=""></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12" id="content_area">
                                                <textarea id="content" class="summernote" name="content">{$category['content']}</textarea>
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
                                                <select class="form-control" name="type">
                                                    <option value="1" {if $category['type'] == '1'} selected="selected"{/if}>Bài viết</option>
                                                    <option value="2" {if $category['type'] == '2'} selected="selected"{/if}>Tin tức</option>
                                                    <option value="3" {if $category['type'] == '3'} selected="selected"{/if}>Văn bản pháp quy</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-12">Cách hiển thị:</label>
                                            <div class="col-md-12">
                                                <select class="form-control" name="style">
                                                    <option value="1" {if $category['style'] == '1'} selected="selected" {/if}>Danh sách</option>
                                                    <option value="2" {if $category['style'] == '2'} selected="selected" {/if} >Dạng lưới</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-12">Sắp xếp:</label>
                                            <div class="col-md-12">
                                                <input class="form-control" id="sort" type="number" value="{$category.sort}" name="sort">
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
                                            <label class="col-sm-12">Chọn hình đại diện <button type="button" class="btn btn-primary waves-effect fa fa-image" id="btnEdit" onclick="_add_image('image')"></button></label>
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
        <div class="modal-footer">
        {if $add} 
            <button type="button" class="btn btn-primary waves-effect" id="btnAdd" onclick="_add_submit()">Thêm mới</button>
        {/if}
        {if $edit} 
            <button type="button" class="btn btn-primary waves-effect" id="btnEdit" onclick="_edit_submit()">Cập nhật</button>
        {/if}
            <button type="button" class="btn btn-default waves-effect" onclick="window.history.go(-1); return false;">Back</button>
        </div>
    </div>
    <!-- Modal begin -->
    <div class="modal fade" id="modal_form" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel1"></h4>
                </div>
                <div class="modal-body">
                    <div id="show"></div>
                </div>
                <div class="modal-footer">

                </div>
            </div>
        </div>
    </div>
    <!-- Modal end -->
{/block}
