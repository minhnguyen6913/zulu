{extends file='backend/master.tpl'}
{block name='css'}
    <link href="/assets/ample/plugins/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.css" rel="stylesheet" type="text/css">
    <link href="/assets/ext/dropzone/dist/dropzone.css" rel="stylesheet" type="text/css" />
    <style>
        .text {
            display: block;
            max-width:100%;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
    </style>
{/block}
{block name='script'}
    <div class="modal fade" id="modal_form" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel1"></h4> </div>
                <div class="modal-body">
                    <form id="form" action="{$pathRoot}image/add?id={$id}" class="dropzone">
                        <input type="hidden" value="OK" id="isSent" name="isSent" />
                        <input type="hidden" id="id" name="id" />
                        <div class="fallback">
                            <input type="file" id="files" name="files" multiple />
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnAdd" onclick="_add_submit()">Hoàn Thành</button>
                </div>
            </div>
        </div>
    </div>
    <script src="/assets/ample/plugins/bower_components/sweetalert/sweetalert.min.js"></script>
    <script src="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.js"></script>
    <script src="/assets/ample/plugins/bower_components/sweetalert/jquery.sweet-alert.custom.js"></script>
    <script src="/assets/ample/js/jasny-bootstrap.js"></script>
    <script src="/assets/ample/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
    <script src="/assets/ext/dropzone/dist/dropzone.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {

            // Dropzone.autoDiscover = false;
        });



        function _copy(url) {
            var $temp = $("<input>");
            $("body").append($temp);
            $temp.val(url).select();
            document.execCommand("copy");
            $temp.remove();
            swal("Thành Công", "Copy đường đẫn vào Clipboard thành công", "success");
        }
        Dropzone.options.form = {
            maxFilesize : 2,
            acceptedFiles : ".png, .jpg, .jpeg, .bmp"
        };
        function _add() {
            $('#form')[0].reset(); // reset form on modals
            $('.form-group').removeClass('has-error'); // clear error class
            $('.help-block').empty(); // clear error string
            $('#modal_form').modal('show'); // show bootstrap modal
            $('.modal-title').text('Thêm hình ảnh'); // Set Title to Bootstrap modal title
            $('#id').val({$id});
        }
        function _add_submit() {
            location.reload();
        }
        function _delete(id)
        {
            $.confirm({
                title: 'Xác Nhận',
                content: 'Bạn có chắc chắn xóa?',
                icon: 'fa fa-question',
                theme: 'modern',
                closeIcon: true,
                autoClose: 'cancel|10000',
                animation: 'scale',
                type: 'orange',
                buttons: {
                    'Có': {
                        btnClass: 'btn-primary',
                        action: function () {
                            $.ajax({
                                type: "POST",
                                url: "{$pathRoot}image/delete",
                                data: {
                                    id: id
                                },
                                datatype: "text",
                                success: function (data) {
                                    if (data == 1) {
                                        swal("Thành Công", "Xóa thành công", "success");
                                        location.reload();
                                    } else {
                                        swal("Thất bại", "Có lỗi xảy ra", "error");
                                    }
                                }
                            });
                        }
                    },
                    cancel: {
                        text: 'Không',
                        btnClass: 'btn-danger',
                        action: function () {
                            // lets the user close the modal.
                        }
                    }
                }
            });
        }
    </script>
{/block}
{block name='body'}
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Quản lý hình ảnh</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="{$pathRoot}category">Quản lý hình ảnh</a></li>
                    <li class="active">Hình ảnh</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="white-box">
                    <div class="product-img" style="height: 250px">
                        <img style="height: 240px; max-width:100%; max-height:100%;" src="/assets/ext/image/add.png" />
                        <div class="pro-img-overlay">
                            <a href="javascript:void(0)" class="bg-info" onclick="_add()"><i class="fa fa-plus"></i></a>
                        </div>

                    </div>
                    <div class="product-text">
                        <h3 class="box-title m-b-0 text">Thêm hình</h3>
                    </div>
                </div>
            </div>
            {foreach from=$list item=img}
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="white-box">
                    <div class="product-img" style="height: 250px">
                        <img style="height: 240px; max-width:100%; max-height:100%;" src="{$upload_url}{$id}/{$img['src']}" />
                        <div class="pro-img-overlay">
                            <a href="javascript:void(0)" class="bg-danger" onclick="_delete({$img['id']})"><i class="ti-trash"></i></a>
                            <a href="javascript:void(0)" class="bg-info" onclick="_copy('{site_url()}{$upload_url}{$id}/{$img['src']}')"><i class="ti-link"></i></a>
                        </div>
                    </div>
                    <div class="product-text">
                        <h3 class="box-title m-b-0 text">{$img['name']}</h3>
                    </div>
                </div>
            </div>
            {/foreach}
        </div>
    </div>
{/block}
