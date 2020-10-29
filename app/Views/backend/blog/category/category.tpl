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
            document.location.href='{$pathRoot}category/add?parent=' + parent;
        }
        function _edit(id) {
            document.location.href='{$pathRoot}category/edit?id=' + id;
        }
        function _show(id) {
            document.location.href='{$pathRoot}category/detailcategory?id=' + id;
        }
        function _image(id) {
            document.location.href='{$pathRoot}category/edit?id=' + id;
        }

        function _delete(id) {
            $.confirm({
                title: 'Xác nhận',
                content: 'Bạn có chắc chắn xóa danh mục này?',
                icon: 'fa fa-question',
                theme: 'modern',
                closeIcon: true,
                autoClose: 'cancel|10000',
                animation: 'scale',
                type: 'orange',
                buttons: {
                    'Đồng ý': {
                        btnClass: 'btn-primary',
                        action: function () {
                            $.ajax({
                                type: "POST",
                                url: "{$pathRoot}category/ajax_delete",
                                data: {
                                    id : id
                                },
                                datatype: "text",
                                success: function (data) {
                                    swal("Thành công", "Xóa danh mục thành công", "success");
                                    location.reload();
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
    </script>
{/block}
{block name='body'}
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">MỤC NỘI DUNG</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="#">Mục nội dung</a></li>
                    <li class="active">Danh sách</li>
                </ol>
            </div>
        </div>

        <div class="white-box">
            <div class="table-responsive">
                <table id="table" class="table table-hover table-bordered color-table info-table">
                    <thead>
                    <tr>
                        <th style="width:90px !important;">
                            <button type="button" class="btn btn-xs btn-warning" onclick="_add()" data-toggle="modal" data-target="#exampleModal"  data-toggle="tooltip" title="Thêm"><i class="fa fa-plus"></i></button>
                            <button type="button" class="btn btn-xs btn-default" onclick="jQuery('#table').treetable('expandAll'); return false;" data-toggle="tooltip" title="Mở rộng"><i class="fa fa-expand"></i></button>
                            <button type="button" class="btn btn-xs btn-default" onclick="jQuery('#table').treetable('collapseAll'); return false;" data-toggle="tooltip" title="Thu hẹp"><i class="fa  fa-compress"></i></button>
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
{/block}
