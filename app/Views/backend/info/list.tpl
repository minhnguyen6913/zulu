{extends file='backend/master.tpl'}
{block name='css'}
    <link href="/assets/ample/css/animate.css" rel="stylesheet">
    <link href="/assets/ample/css/style.css" rel="stylesheet">
    <link href="/assets/ample/plugins/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/datatables/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="/assets/ample/plugins/bower_components/custom-select/custom-select.css" rel="stylesheet" type="text/css" />
    <link href="/assets/ample/plugins/bower_components/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <link href="/assets/ample/plugins/bower_components/x-editable/dist/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" />
    <link href="/assets/ample/plugins/bower_components/switchery/dist/switchery.min.css" rel="stylesheet" />
    <style>
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
    <script src="/assets/ample/plugins/bower_components/custom-select/custom-select.min.js" type="text/javascript"></script>
    <script src="/assets/ample/plugins/bower_components/moment/moment.js"></script>
    <script src="/assets/ample/plugins/bower_components/x-editable/dist/bootstrap3-editable/js/bootstrap-editable.min.js" type="text/javascript"></script>
    <script src="/assets/ample/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
    <script src="/assets/ample/plugins/bower_components/switchery/dist/switchery.min.js"></script>
    <script type="application/javascript">
        $(document).ready(function() {
            // _load();
            _editable();
            $('.selectpicker').selectpicker();
            var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
            $('.js-switch').each(function() {
                new Switchery($(this)[0], $(this).data());
            });
        });
        function _editable () {
            var source = '{$select_data}';
            //inline
            {foreach from=$data item=edit}
                {if $edit['type'] == 'char'}
                    $('#value-{$edit['id']}').editable({
                        type: 'text',
                        pk: '{$edit['id']}',
                        value: '{$edit['value']}',
                        url: "{$pathRoot}info/ajax_update",
                        mode: 'inline',
                    });
                {elseif $edit['type'] == 'int'}
                    $('#value-{$edit['id']}').editable({
                        type: 'text',
                        pk: '{$edit['id']}',
                        value: '{$edit['value']}',
                        url: "{$pathRoot}info/ajax_update",
                        mode: 'inline',
                    });
                {elseif $edit['type'] == 'list'}
                    $('#value-{$edit['id']}').editable({
                        type: 'select',
                        pk: '{$edit['id']}',
                        source: source,
                        value: '{$edit['value']}',
                        url: "{$pathRoot}info/ajax_update",
                        mode: 'inline',
                    });
                {/if}
            {/foreach}
        }

        function _load() {
            table = $('#myTable').DataTable({
                "processing": true,
                "language": {
                    "processing": "Đang tải",
                },
                "serverSide": true,
                "order": [],
                "ajax": {
                    "url": "{$pathRoot}info/ajax_list",
                    "type": "POST"
                },
                "columnDefs": [{
                    "targets": [0,1], //last column
                    "orderable": false, //set not orderable
                }]
            });
        }

        function _add() {
            $('#form')[0].reset(); // reset form on modals
            $('.form-group').removeClass('has-error'); // clear error class
            $('.help-block').empty(); // clear error string
            $('#modal_form').modal('show'); // show bootstrap modal
            $('.modal-title').text('Thêm cài đặt'); // Set Title to Bootstrap modal title
            $("#btnEdit").hide();
            $("#btnAdd").show();
        }

        function _edit(id) {
            $('#form')[0].reset(); // reset form on modals
            $('.form-group').removeClass('has-error'); // clear error class
            $('.help-block').empty(); // clear error string
            $.ajax({
                type: "POST",
                url: "{$pathRoot}info/getinfo",
                data: {
                    id : id
                },
                datatype: "JSON",
                success: function (data) {
                    var info = jQuery.parseJSON(data);
                    $('#id').val(info.id);
                    $('#name').val(info.name);
                    $('#define').val(info.define);
                    // console.log(info.type);
                    $("#type option[value="+info.type+"]").attr('selected','selected');
                    updateInput();
                    switch (info.type) {
                        case 'list':
                            $("#value option[value="+info.value+"]").attr('selected','selected');
                            break;
                        case 'boolean':
                            if (info.value == 1) {
                                $("#value").prop('checked', true);
                            }
                            break;
                        default:
                            $('#value').val(info.value);
                            break;
                    }
                }
            });
            $('#modal_form').modal('show'); // show bootstrap modal
            $('.modal-title').text('Thêm cài đặt'); // Set Title to Bootstrap modal title
            $("#btnEdit").show();
            $("#btnAdd").hide();
        }
        function _delete(id) {
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
                                url: "{$pathRoot}info/ajax_delete",
                                data: {
                                    id : id
                                },
                                datatype: "text",
                                success: function (data) {
                                    swal("Thành công", "Xóa dữ liệu thành công", "success");
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
        function _updateStatus(id) {
            var clickCheckbox = document.querySelector('#status-'+id);
            $.ajax({
                type: "POST",
                url: "{$pathRoot}info/ajax_update",
                data: {
                    id : id,
                    status: clickCheckbox.checked,
                },
                datatype: "text",
                success: function (data) {
                    location.reload();
                }
            });
        }
        function updateInput(){
            var type = $("#type").children("option:selected").val();
            $('#input').empty();
            switch (type) {
                case 'int':
                    $('#input').html(
                        '<input class="form-control" type="number" name="value"  id="value" />'
                    );
                    break;

                case 'boolean':
                    $('#input').html(
                        '<input class="form-control" type="checkbox" name="value"  id="value" />'
                    );
                    break;
                case 'list':
                    var input = '<select   class="form-control" data-style="form-control"  id="value" name="value">'
                                        +'<option value="LANGUAGE">Danh sách ngôn ngữ</option>'
                                +'</select>';
                    $('#input').html(input);

                    break;
                default:
                    $('#input').html(
                        '<input class="form-control" type="text" name="value"  id="value" />'
                    );
                    break;
            }
        }
        function validate() {
            if ($("#name").val() == "") {
                swal("Cảnh báo","Tên không được để trống !!!" , "warning");
                return false;
            }
            if ($("#define").val() == "") {
                swal("Cảnh báo","Định nghĩa không được để trống !!!" , "warning");
                return false;
            }
            if ($("#type").val() == "") {
                swal("Cảnh báo","Vui lòng chọn kiểu dữ liệu !!!" , "warning");
                return false;
            }
            return true;
        }
        function _add_submit() {
            if (validate()) {
                $.ajax({
                    url: "{$pathRoot}info/ajax_add",
                    type: "POST",
                    data:  $('#form').serialize(),
                    dataType: "JSON",
                    success: function (data) {

                        if (data == '0') {
                            swal("Cảnh báo","Có lỗi xảy ra" , "warning");
                        } else {
                            swal("Thành công","Thêm dữ liệu thành công !!!" , "success");
                            $('#modal_form').modal('hide');
                            location.reload();
                        }
                    }
                });
            }

        }


        function _edit_submit() {
            if (validate()) {
                $.ajax({
                    url: "{$pathRoot}info/ajax_edit",
                    type: "POST",
                    data:  $('#form').serialize(),
                    dataType: "JSON",
                    success: function (data) {

                        if (data == '0') {
                            swal("Cảnh báo","Có lỗi xảy ra" , "warning");
                        } else {
                            swal("Thành công","Thêm dữ liệu thành công !!!" , "success");
                            $('#modal_form').modal('hide');
                            reload_table();
                        }
                    }
                });
            }

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
                <h4 class="page-title">Danh sách cài đặt</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="{$pathRoot}/info">Danh sách cài đặt</a></li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="white-box">
                    <h3 class="box-title m-b-0">Danh sách cài đặt

                    </h3>
                    <p class="text-muted m-b-30"></p>
                    <div class="table-responsive">
                        <table style="clear: both" class="table table-bordered table-striped" id="user">
                            <thead>
                                <tr>
                                    <th width="5%" style="text-align: center;">
                                        <button class="btn btn-outline btn-default waves-effect waves-light" onclick="_add()"> <i class="fa fa-plus"></i> {$lang.label.add}</button>
                                    </th>
                                    <th width="20%">Tên cài đặt</th>
                                    <th width="10%">Định nghĩa</th>
                                    <th width="10%">Loại</th>
                                    <th width="35%">Giá trị</th>
                                </tr>
                            </thead>
                            <tbody>
                            {assign "stt" "1"}
                            {foreach from=$data item=item}
                                <tr>
                                    <td style="text-align: center;">{$stt++}</td>
                                    <td>{$item['name']}</td>
                                    <td>{$item['define']}</td>
                                    <td>{$item['type_name']}</td>
                                    <td>
                                        {if $item['type'] == 'boolean'}
                                            <input type="checkbox" {if $item['value'] == '1'} checked {/if} class="js-switch" data-color="#13dafe" data-size="small" id="status-{$item['id']}" name="value" onchange="_updateStatus({$item['id']})"/>

                                        {elseif $item['type'] == 'list'}
                                            <a href="#"
                                               id="value-{$item['id']}"
                                               data-pk="{$item['id']}"
                                            >
                                                {$select[$item['value']]['text']}
                                            </a>
                                        {else}
                                            <a href="#"
                                               id="value-{$item['id']}"
                                               data-pk="{$item['id']}"
                                            >
                                                {$item['value']}
                                            </a>
                                        {/if}
                                    </td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--
    <tfoot>
    <tr>
        <th colspan="6"><button class="btn btn-outline btn-default waves-effect waves-light" onclick="_add()"> <i class="fa fa-plus"></i> {$lang.label.add}</button></th>
    </tr>
    </tfoot>
    -->
    <!-- Modal begin -->
    <div class="modal fade" id="modal_form" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel1"></h4>
                </div>
                <div class="modal-body">
                    <form id="form" matrix="post" class="form-horizontal">
                        <input type="hidden" value="OK" id="isSent" name="isSent" />
                        <input type="hidden" id="id" name="id" />
                        <div class="form-group">
                            <label class="col-md-12">Tên cài đặt:</label>
                            <div class="col-md-12">
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Định nghĩa:</label>
                            <div class="col-md-12">
                                <input type="text" class="form-control" id="define" name="define" ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Kiểu dữ liệu:</label>
                            <div class="col-md-12">
                                <select class="form-control" data-style="form-control" onchange="updateInput()" id="type" name="type">
                                    <option value="">Chọn kiểu dữ liệu</option>
                                    <option value="int">Dạng số</option>
                                    <option value="char">Dạng chuỗi</option>
                                    <option value="boolean">Logic</option>
                                    <option value="list">Danh sách</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-12">Nội dung:</label>
                            <div class="col-md-12" id="input">

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
