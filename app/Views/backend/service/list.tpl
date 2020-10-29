{extends file='backend/master.tpl'}
{block name='css'}
    <link href="/assets/ample/css/animate.css" rel="stylesheet">
    <link href="/assets/ample/css/style.css" rel="stylesheet">
    <link href="/assets/ample/plugins/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/datatables/jquery.dataTables.min.css" rel="stylesheet" />
    <style>
    </style>
{/block}
{block name='script'}
    <script src="/assets/ample/plugins/bower_components/datatables/jquery.dataTables.min.js"></script>
    <script src="/assets/ample/plugins/bower_components/sweetalert/sweetalert.min.js"></script>
    <script src="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.js"></script>
    <script src="/assets/ample/plugins/bower_components/sweetalert/jquery.sweet-alert.custom.js"></script>
    <script src="/assets/ample/js/jquery.slimscroll.js"></script>
    <script src="/assets/ample/js/custom.min.js"></script>
    <script src="/assets/ample/js/jasny-bootstrap.js"></script>
    <script src="/assets/ample/js/waves.js"></script>
   <script src="/assets/ample/plugins/bower_components/bootstrap-select/bootstrap-select.min.js" type="text/javascript"></script>

    <script type="application/javascript">
        $(document).ready(function() {
            _load();
        });
        function _load() {
            table = $('#myTable').DataTable({
                "processing": true,
                "language": {
                    "processing": "Đang tải",
                },
                "serverSide": true,
                "order": [],
                "ajax": {
                    "url": "{$pathRoot}service/ajax_list",
                    "type": "POST"
                },
                "columnDefs": [{
                    "targets": [0,1], //last column
                    "orderable": false, //set not orderable
                }]
            });
        }

        function _add() {
            document.location.href='{$pathRoot}service/add';
        }

        function _edit(id) {
            document.location.href='{$pathRoot}service/edit?id='+id;
        }
        function _delete(id) {
            $.confirm({
                title: 'Xác nhận',
                content: 'Bạn có chắc chắn xóa dịch vụ này?',
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
                                url: "{$pathRoot}service/ajax_delete",
                                data: {
                                    id : id
                                },
                                datatype: "text",
                                success: function (data) {
                                    swal("Thành công", "Xóa danh mục thành công", "success");
                                    reload_table()
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
        function reload_table() {
            table.ajax.reload(null, false); //reload datatable ajax
        }
    </script>
{/block}
{block name='body'}
    <div class="container-fluid">

        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Danh sách dịch vụ</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="{$pathRoot}/service">Danh sách dịch vụ</a></li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="white-box">
                    <h3 class="box-title m-b-0">Danh sách dịch vụ</h3>
                    <p class="text-muted m-b-30"></p>
                    <div class="table-responsive">
                        <table id="myTable" class="tablesaw table-striped table-hover table-bordered table color-table info-table" data-tablesaw-mode="columntoggle">
                            <thead>
                            <tr>
                                <th scope="col" data-tablesaw-sortable-col data-tablesaw-priority="persist" width="10"></th>
                                <th scope="col" data-tablesaw-sortable-col data-tablesaw-priority="persist" width="40"></th>
                                <th scope="col" data-tablesaw-sortable-col data-tablesaw-priority="1">Tên dịch vụ</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th colspan="3"><button class="btn btn-outline btn-default waves-effect waves-light" onclick="_add()"> <i class="fa fa-plus"></i> {$lang.label.add}</button></th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

{/block}
