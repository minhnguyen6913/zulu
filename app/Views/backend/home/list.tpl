{extends file='backend/master.tpl'}
{block name='css'}
    <link href="/assets/ample/css/animate.css" rel="stylesheet">
    <link href="/assets/ample/css/style.css" rel="stylesheet">
    <link href="/assets/ample/plugins/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/datatables/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />

    <style>
        select + .select2-container {
            width: 100% !important;
        }
    </style>
{/block}
{block name='script'}
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
    <script src="/assets/ample/plugins/bower_components/datatables/jquery.dataTables.min.js"></script>
    <script src="/assets/ample/plugins/bower_components/sweetalert/sweetalert.min.js"></script>
    <script src="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.js"></script>
    <script src="/assets/ample/plugins/bower_components/sweetalert/jquery.sweet-alert.custom.js"></script>
    <script src="/assets/ample/js/jquery.slimscroll.js"></script>
    <script src="/assets/ample/js/custom.min.js"></script>
    <script src="/assets/ample/js/jasny-bootstrap.js"></script>
    <script src="/assets/ample/js/waves.js"></script>
   <script src="/assets/ample/plugins/bower_components/bootstrap-select/bootstrap-select.min.js" type="text/javascript"></script>
    <script src="/assets/ample/js/cbpFWTabs.js"></script>
    <script type="application/javascript">
        (function() {
            [].slice.call(document.querySelectorAll('.sttabs')).forEach(function(el) {
                new CBPFWTabs(el);
            });
        })();
        $(document).ready(function() {
            _load(1);
            _load(2);
            _load(3);
            _load(4);

        });
        function _load(type=1) {

            var table = $('#myTable-' + type).DataTable({
                "processing": true,
                "language": {
                    "processing": "Đang tải",
                },
                "serverSide": true,
                "order": [],
                "ajax": {
                    "url": "{$pathRoot}home/ajax_list?type=" + type,
                    "type": "POST"
                },
                "columnDefs": [{
                    "targets": [0, 1], //last column
                    "orderable": false, //set not orderable
                }]
            });
            switch (type) {
                case 1:
                    table1 = table;
                    break;
                case 2:
                    table2 = table;
                    break;
                case 3:
                    table3 = table;
                    break;
                case 4:
                    table4 = table;
                    break;
            }

        }

        function _add(type = 0) {
            $('#form')[0].reset(); // reset form on modals
            $('.form-group').removeClass('has-error'); // clear error class
            $('.help-block').empty(); // clear error string
            $("#type").val(type);
            $.ajax({
                type: "POST",
                url: "{$pathRoot}home/getarticle",
                data: {
                    type : type
                },
                datatype: "text",
                success: function (data) {
                    $('#article_id').html(data);
                    $('#article_id').trigger("chosen:updated");
                    $("#article_id").select2({
                        dropdownAutoWidth : true,
                        width: 'auto'
                    });
                }
            });
            $('#modal_form').modal('show'); // show bootstrap modal
            switch(type) {
                case 1:
                    $('.modal-title').text('Thêm hoạt động nổi bật'); // Set Title to Bootstrap modal title
                    break;
                case 2:
                    $('.modal-title').text('Thêm tin tức nổi bật'); // Set Title to Bootstrap modal title
                    break;
                case 3:
                    $('.modal-title').text('Thêm văn bản pháp quy nổi bật'); // Set Title to Bootstrap modal title
                    break;
                case 4:
                    $('.modal-title').text('Thêm dịch vụ nổi bật'); // Set Title to Bootstrap modal title
                    break;

            }

            $("#btnEdit").hide();
            $("#btnAdd").show();
        }
        function _add_submit() {
            var type_input =parseInt($('#type').val());
            $.ajax({
                url: "{$pathRoot}home/ajax_add",
                type: "POST",
                data:  $('#form').serialize(),
                dataType: "JSON",
                success: function (data) {

                    if (data == '0') {
                        swal("Cảnh báo","Có lỗi xảy ra" , "warning");
                    } else {
                        swal("Thành công","Thêm dữ liệu thành công !!!" , "success");
                        $('#modal_form').modal('hide');
                        reload_table(type_input);
                    }
                }
            });
        }
        function _delete(id,type) {
            $.confirm({
                title: 'Xác nhận',
                content: 'Bạn có chắc chắn xóa dữ liệu này?',
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
                                url: "{$pathRoot}home/ajax_delete",
                                data: {
                                    id : id
                                },
                                datatype: "text",
                                success: function (data) {
                                    swal("Thành công", "Xóa dữ liệu thành công", "success");
                                    reload_table(type);
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
        function reload_table(type) {
            switch (type) {
                case 1:
                    table1.ajax.reload(null, false); //reload datatable ajax
                    break;
                case 2:
                    table2.ajax.reload(null, false); //reload datatable ajax
                    break;
                case 3:
                    table3.ajax.reload(null, false); //reload datatable ajax
                    break;
                case 4:
                    table4.ajax.reload(null, false); //reload datatable ajax
                    break;
            }

        }
    </script>
{/block}
{block name='body'}
    <div class="container-fluid">

        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Quản lý trang chủ</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="{$pathRoot}/home">Trang chủ</a></li>
                </ol>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="white-box">
                    <svg class="hidden">
                        <defs>
                            <path id="tabshape" d="M80,60C34,53.5,64.417,0,0,0v60H80z" />
                        </defs>
                    </svg>
                    <section>
                        <div class="sttabs tabs-style-line">
                            <nav>
                                <ul>
                                    <li><a href="javascript:_changeTab(1)">
                                            Hoạt động nổi bật
                                        </a>

                                    </li>
                                    <li>
                                        <a href="javascript:_changeTab(2)">
                                           Tin tức nổi bật
                                        </a>
                                    </li>
                                    <li>
                                        <a href=javascript:_changeTab(3)">
                                            Văn bản pháp quy nổi bật
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:_changeTab(4)">
                                            Dịch vụ nổi bật
                                        </a>
                                    </li>

                                </ul>
                            </nav>
                            <div class="content-wrap">
                                <section id="section-line-1">
                                    <div class="table-responsive">
                                        <table id="myTable-1" class="tablesaw table-striped table-hover table-bordered table color-table info-table">
                                            <thead>
                                            <tr>
                                                <th width="10"></th>
                                                <th width="40"></th>
                                                <th >Tên hoạt động</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th colspan="3"><button class="btn btn-outline btn-default waves-effect waves-light" onclick="_add(1)"> <i class="fa fa-plus"></i> {$lang.label.add}</button></th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </section>
                                <section id="section-line-2">
                                    <div class="table-responsive">
                                        <table id="myTable-2" class="tablesaw table-striped table-hover table-bordered table color-table info-table">
                                            <thead>
                                            <tr>
                                                <th width="10"></th>
                                                <th width="40"></th>
                                                <th >Tên tin tức</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th colspan="3"><button class="btn btn-outline btn-default waves-effect waves-light" onclick="_add(2)"> <i class="fa fa-plus"></i> {$lang.label.add}</button></th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </section>
                                <section id="section-line-3">
                                    <div class="table-responsive">
                                        <table id="myTable-3" class="tablesaw table-striped table-hover table-bordered table color-table info-table">
                                            <thead>
                                            <tr>
                                                <th width="10"></th>
                                                <th width="40"></th>
                                                <th >Tên văn bản</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th colspan="3"><button class="btn btn-outline btn-default waves-effect waves-light" onclick="_add(3)"> <i class="fa fa-plus"></i> {$lang.label.add}</button></th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </section>
                                <section id="section-line-4">
                                    <div class="table-responsive">
                                        <table id="myTable-4" class="tablesaw table-striped table-hover table-bordered table color-table info-table">
                                            <thead>
                                            <tr>
                                                <th width="10"></th>
                                                <th width="40"></th>
                                                <th >Tên dịch vụ</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th colspan="3"><button class="btn btn-outline btn-default waves-effect waves-light" onclick="_add(4)"> <i class="fa fa-plus"></i> {$lang.label.add}</button></th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </section>
                            </div>
                            <!-- /content -->
                        </div>
                        <!-- /tabs -->
                    </section>
                </div>
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
                        <input type="hidden" id="type" name="type" />
                        <div class="form-group">
                            <label class="col-md-12">Tiêu đề:</label>
                            <div class="col-md-12">
                                <select class="select2 " id="article_id" multiple="multiple" name="article_id[]">

                                </select>
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
