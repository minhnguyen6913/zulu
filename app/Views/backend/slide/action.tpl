{extends file='backend/master.tpl'}
{block name='css'}
    <link href="/assets/ample/css/animate.css" rel="stylesheet">
    <link href="/assets/ample/css/style.css" rel="stylesheet">
    <link href="/assets/ample/plugins/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
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

            {if $edit} _is_edit();{/if}
        });
        function _add_submit() {
            if (validate()) {
                $.ajax({
                    url: "{$pathRoot}slide/ajax_add",
                    type: "POST",
                    data:  $('#form').serialize(),
                    dataType: "JSON",
                    success: function (data) {

                        if (data == '0') {
                            swal("Cảnh báo","Tiêu đề quảng cáo đã tồn tại" , "warning");
                        } else {
                            swal("Thành công","Thêm dữ liệu thành công !!!" , "success");
                            document.location.href='{$pathRoot}slide';
                        }
                    }
                });
            }
        }
        function validate() {
            if ($("#name").val() == "") {
                swal("Cảnh báo","Tiêu đề quảng cáo không được để trống" , "warning");
                return false;
            }
            return true;
        }
        function _is_edit() {
            $.ajax({
                url: "{$pathRoot}slide/getslide",
                type: "POST",
                data: { id : "{$id}" },
                dataType: "JSON",
                success: function (data) {

                    _getImage(data.image,'image',false);
                    _getImage(data.image,'icon',false);
                }
            });

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
                                    url: "{$pathRoot}slide/ajax_edit",
                                    data: $('#form').serialize(),
                                    dataType: "JSON",
                                    success: function (data) {
                                        if (data == '0') {
                                            swal("Cảnh báo","Tiêu đề quảng cáo đã tồn tại" , "warning");
                                        } else {
                                            swal("Thành công","Sửa dữ liệu thành công !!!" , "success");
                                            document.location.href='{$pathRoot}slide';
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
    </script>
{/block}
{block name='body'}
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                {if $add}<h4 class="page-title">THÊM MỚI SLIDE QUẢNG CÁO</h4> {/if}
                {if $edit}<h4 class="page-title">SỬA SLIDE QUẢNG CÁO</h4> {/if}

            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="{$pathRoot}/slide">Quản lý Slide quảng cáo</a></li>
                    <li class="active">Thao tác</li>
                </ol>
            </div>
        </div>
        <form id="form" method="post" class="form-horizontal">
            <input type="hidden" value="OK" id="isSent" name="isSent" />
            <input type="hidden" id="id" name="id" value="{$id}"/>

            <div class="row"> 

                <div class="col-md-8">
                    <div class="white-box">
                        <div class="panel-group" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingNine">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseNine" aria-expanded="true" aria-controls="collapseNine" class="font-bold">
                                            Thông tin chung
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseNine" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingNine">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label class="col-md-12">Tiêu đề quảng cáo:</label>
                                            <div class="col-md-12">
                                                <input type="text" class="form-control form-control-line" id="name" name="name" value="{$data['name']}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-12">Liên kết đến:</label>
                                            <div class="col-md-12">
                                                <input type="text" class="form-control form-control-line" id="link" name="link" value="{$data['link']}">
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
                                            Hình ảnh
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseFive" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingSix">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <input type="hidden" id="image" name="image" />
                                            <label class="col-sm-12">Chọn hình banner <button type="button" class="btn btn-primary waves-effect fa fa-image" id="btnEdit" onclick="_add_image('image')"></button></label>
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
