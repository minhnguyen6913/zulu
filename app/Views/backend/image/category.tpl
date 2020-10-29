{extends file='backend/master.tpl'}
{block name='css'}
    <link href="/assets/ample/plugins/bower_components/datatables/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="/assets/ample/plugins/bower_components/treetable/jquery.treetable.css" rel="stylesheet" />
    <link href="/assets/ample/plugins/bower_components/treetable/jquery.treetable.theme.css" rel="stylesheet" />
    <link href="/assets/ample/plugins/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.css" rel="stylesheet" type="text/css">
    <style> 
    
    </style>
{/block}
{block name='script'}
    <script src="/assets/ample/plugins/bower_components/treetable/jquery.treetable.js"></script>
    <script src="/assets/ample/plugins/bower_components/sweetalert/sweetalert.min.js"></script>
    <script src="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.js"></script>
    <script src="/assets/ample/plugins/bower_components/sweetalert/jquery.sweet-alert.custom.js"></script>
    <script type="application/javascript">
        $(document).ready(function() {
            $("#table").treetable({ expandable: true });

        });
        function _add(parent = 0) {
            $('#form')[0].reset(); // reset form on modals
            $('.form-group').removeClass('has-error'); // clear error class
            $('.help-block').empty(); // clear error string
            $("#parent").val(parent);
            $('#modal_form').modal('show'); // show bootstrap modal
            $('.modal-title').text('Thêm danh mục'); // Set Title to Bootstrap modal title
            $("#btnEdit").hide();
            $("#btnAdd").show();
        }
        function _add_submit() {
            if ($("#name").val().trim() == "") {
                swal("Cảnh báo","Tên không được trống" , "warning");
            } else {
                $.ajax({
                    url: "{$pathRoot}category/ajax_add",
                    type: "POST",
                    data: $('#form').serialize(),
                    dataType: "text",
                    success: function (data) {
                        if (data == 0) {
                            swal("Thất bại", "Danh mục này đã có", "error");
                        } else {
                            $('#modal_form').modal('hide');
                            swal("Thành công", "Thêm thành công", "success");
                            location.reload();
                        }
                    }
                });
            }
        }

        function _edit(id) {
            $('#form')[0].reset(); // reset form on modals
            $('.form-group').removeClass('has-error'); // clear error class
            $('.help-block').empty(); // clear error string
            $('#modal_form').modal('show'); // show bootstrap modal
            $('.modal-title').text('Sửa danh mục');
            $.ajax({
                url: "{$pathRoot}category/edit",
                type: "POST",
                data: { id : id },
                dataType: "JSON",
                success: function (data) {
                    $("#id").val(data.id);
                    $("#name").val(data.name);
                    $("#parent").val(data.parent);
                }
            });
            $("#btnEdit").show();
            $("#btnAdd").hide();
        }
        function _edit_submit() {
            if ($("#name").val().trim() == "") {
                swal("Cảnh báo","Tên không được trống" , "warning");
            } else {
                $.confirm({
                    title: 'Xác nhận',
                    content: 'Bạn có chắn chắn muốn sửa?',
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
                                    url: "{$pathRoot}category/ajax_edit",
                                    data: $('#form').serialize(),
                                    dataType: "text",
                                    success: function (data) {
                                        if (data == 0) {
                                            swal("Thất bại", "Danh mục này đã có", "error");
                                        } else {
                                            $('#modal_form').modal('hide'); 
                                            swal("Thành công", "Sửa thành công", "success");
                                            location.reload();
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
        }
        function _delete(id) {
            $.confirm({
                title: 'Xác nhận',
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
                                url: "{$pathRoot}category/ajax_delete",
                                data: {
                                    id : id, isSent : 'OK'
                                },
                                datatype: "text",
                                success: function (data) {

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
                <h4 class="page-title">Danh mục hình ảnh</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="#">Quản lý hình ảnh</a></li>
                    <li class="active">Danh mục hình ảnh</li>
                </ol>
            </div>
        </div>
        
        <div class="white-box">
            <div class="table-responsive">
                <table id="table" class="table table-hover table-bordered color-table info-table">
                    <thead>
                        <tr>
                            <th style="width:90px !important;"> 
                                <button type="button" class="btn btn-xs btn-warning" onclick="_add()" data-toggle="modal" data-target="#exampleModal"  data-toggle="tooltip" title="{$lang.label.add} {$lang.label.matrix_parent}"><i class="fa fa-plus"></i></button>
                                <button type="button" class="btn btn-xs btn-default" onclick="jQuery('#table').treetable('expandAll'); return false;" data-toggle="tooltip" title="{$lang.label.expand}"><i class="fa fa-expand"></i></button>
                                <button type="button" class="btn btn-xs btn-default" onclick="jQuery('#table').treetable('collapseAll'); return false;" data-toggle="tooltip" title="{$lang.label.collapse}"><i class="fa  fa-compress"></i></button>
                            </th>
                            <th>Tiêu đề</th>
                            <th>Loại</th>
                            <th>Thứ tự</th>
                        </tr>
                    </thead>

                    <tbody>
                        {$treeTable}
                    </tbody>
                </table>
            </div>
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
                    <form id="form" matrix="post" class="form-material form-horizontal">
                        <input type="hidden" value="OK" id="isSent" name="isSent" />
                        <input type="hidden" id="id" name="id" />
                        <input type="hidden" id="parent" name="parent" />
                        <div class="form-group">
                            <label class="col-md-12">Tiêu đề:</label>
                            <div class="col-md-12">
                                <input type="arti" class="form-control" id="name" name="name">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary waves-effect" id="btnAdd" onclick="_add_submit()">Thêm mới</button>
                    <button type="button" class="btn btn-primary waves-effect" id="btnEdit" onclick="_edit_submit()">Cập nhật</button>
                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Hủy</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal end -->
{/block}
