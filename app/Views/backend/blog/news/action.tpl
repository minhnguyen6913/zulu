{extends file='backend/master.tpl'}
{block name='css'}
    <link href="/assets/ample/css/animate.css" rel="stylesheet">
    <link href="/assets/ample/css/style.css" rel="stylesheet">
    <link href="/assets/ext/summernote/summernote.css" rel="stylesheet" />
    <link href="/assets/ample/plugins/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/bootstrap-tagsinput/dist/bootstrap-tagsinput.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />

    <style>
    </style>
{/block}
{block name='script'}
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
    <script src="/assets/ext/summernote/summernote.min.js"></script>
    <script src="/assets/ample/plugins/bower_components/sweetalert/sweetalert.min.js"></script>
    <script src="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.js"></script>
    <script src="/assets/ample/plugins/bower_components/sweetalert/jquery.sweet-alert.custom.js"></script>
    <script src="/assets/ample/js/jquery.slimscroll.js"></script>
    <script src="/assets/ample/js/custom.min.js"></script>
    <script src="/assets/ample/js/jasny-bootstrap.js"></script>
    <script src="/assets/ample/js/waves.js"></script>
    <script src="/assets/ample/plugins/bower_components/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
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

            $(".js-example-tokenizer").select2({
                tags: true,
            })

            $('#intro').summernote({
                height: 100, // set editor height
                minHeight: null, // set minimum height of editor
                maxHeight: null, // set maximum height of editor
                focus: false, // set focus to editable area after initializing summernote
                toolbar: [
                    ['style', ['style']],
                    ['font', ['bold', 'underline', 'clear']],
                    ['fontname', ['fontname']],
                    ['view', ['fullscreen', 'codeview', 'help']],
                ],
            });
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
        function clone_block() {
            var num = parseInt($("#number").val());
            num++;
            $("#number").val(num);

            var newel = '<tr class="clone-block row">'
                +'<td>'
                +    '<button class="btn btn-xs btn-danger" id="btnDel" onclick="$(this).parent().parent().remove();" data-toggle="tooltip" title="">'
                +        '<i class="ace-icon fa fa-trash-o bigger-120" ></i>'
                +    '</button>'
                +'</td>'
                +'<td><input class="form-control" type="text" id="file_name-'+num+'" name="file_name[]" autocomplete="off" /></td>'
                +'<td><input class="form-control" type="file" id="file-'+num+'" name="file-'+num+'"/></td>'
                +'</tr>'
            // Add after last <div class='input-form'>
            $(newel).appendTo(".form-clone");
            $("#btnDel").show();
        }
        function _add_submit() {

            var form = $('#form').serializeArray().reduce(function(obj, item) {
                if(item.name.includes('[]')) {
                    res =  item.name.replace("[]", "");
                    if (obj[res] == undefined) {
                        obj[res] = new Array();
                        obj[res].push( item.value );
                    } else {
                        obj[res].push( item.value );
                    }
                } else{
                    obj[item.name] = item.value;
                }
                return obj;
            }, { });


            var form_data = new FormData();
            var file;
            var file_check = true;
            var num = parseInt($("#number").val());
            form['file_name'] = new Array();
            for (var i = 0; i <= num; i++) {
                if ($('#file-' + i).prop('files') != undefined) {
                    if ($('#file-' + i).prop('files').length > 0) {

                        if (form['file_name'] == undefined ) {
                            form['file_name'] = new Array();
                        }
                        file = $('#file-' + i).prop('files')[0];
                        if (validate_file(file)) {
                            form_data.append("files[]", file);
                            form['file_name'].push( $('#file_name-'+i).val() );
                        } else {
                            file_check = false;
                        }
                    }
                }

            }
            form_data.append("form", JSON.stringify(form));

            if (validate() && (file_check == true))  {
                $.ajax({
                    url: "{$pathRoot}news/ajax_add",
                    type: "POST",
                    contentType:false,
                    processData:false,
                    data: form_data,
                    dataType: "JSON",
                    success: function (data) {

                        if (data == '0') {
                            swal("Cảnh báo","Tiêu đề tin đã tồn tại" , "warning");
                        } else {
                            swal("Thành công","Thêm dữ liệu thành công !!!" , "success");
                            document.location.href='{$pathRoot}category/detail?id={$category_id}';
                        }
                    }
                });
            }

        }
        function validate_file(file) {
            if (file != undefined) {
                var file_name = file.name;
                const ext = ['.doc', '.docx', '.pdf']; // File hợp lệ
                const size = 4000000; //4 mb
                //check file type

                if (file.size > size) {
                    swal("Cảnh báo","Trọng lượng file tối đa không qua 4 mb !!!" , "warning");
                    return false;
                }
                // if (!ext.some(el => file_name.toLowerCase().endsWith(el))) {
                //     swal("Cảnh báo","Loại file upload không hợp lệ !!!" , "warning");
                //     return false;
                // }
                return true;
            }
            return true;

        }
        function _is_edit() {
            $.ajax({
                url: "{$pathRoot}news/getNews",
                type: "POST",
                data: { id : "{$id}" },
                dataType: "JSON",
                success: function (data) {
                    if (data.intro) {
                        $('#intro_area').empty();
                        var html = "<textarea id='intro' class='summernote' name='intro'>"+data.content_eng+"</textarea>";
                        $('#intro_area').append(html);
                    }
                    $('#intro').summernote({
                        height: 100, // set editor height
                        minHeight: null, // set minimum height of editor
                        maxHeight: null, // set maximum height of editor
                        focus: false, // set focus to editable area after initializing summernote
                        toolbar: [
                            ['style', ['style']],
                            ['font', ['bold', 'underline', 'clear']],
                            ['fontname', ['fontname']],
                            ['view', ['fullscreen', 'codeview', 'help']],
                        ],
                    });
                    if (data.content) {
                        $('#content_eng').empty();
                        var html = "<textarea id='content' class='summernote' name='content'>"+data.content_eng+"</textarea>";
                        $('#content_eng').append(html);
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
            var form = $('#form').serializeArray().reduce(function(obj, item) {
                if(item.name.includes('[]')) {
                    res =  item.name.replace("[]", "");
                    if (obj[res] == undefined) {
                        obj[res] = new Array();
                        obj[res].push( item.value );
                    } else {
                        obj[res].push( item.value );
                    }
                } else{
                    obj[item.name] = item.value;
                }
                return obj;
            }, { });


            var form_data = new FormData();
            var file;
            let file_check = true;
            var num = parseInt($("#number").val());
            form['file_name'] = new Array();
            for (var i = 0; i <= num; i++) {
                if ($('#file-' + i).prop('files') != undefined) {
                    if ($('#file-' + i).prop('files').length > 0) {

                        if (form['file_name'] == undefined ) {
                            form['file_name'] = new Array();
                        }

                        file = $('#file-' + i).prop('files')[0];

                        if (validate_file(file)) {
                            form_data.append("files[]", file);
                            form['file_name'].push( $('#file_name-'+i).val() );
                        } else {
                            file_check = false;
                        }
                    }
                }

            }
            form_data.append("form", JSON.stringify(form));
            if (file_check) {
                if (validate())  {
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
                                        url: "{$pathRoot}news/ajax_edit",
                                        data: form_data,
                                        contentType:false,
                                        processData:false,
                                        dataType: "JSON",
                                        success: function (data) {
                                            if (data == '0') {
                                                swal("Cảnh báo","Tiêu đề tin đã tồn tại" , "warning");
                                            } else {
                                                swal("Thành công","Sửa dữ liệu thành công !!!" , "success");
                                                document.location.href='{$pathRoot}category/detail?id={$category_id}';
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
                <h4 class="page-title">TIN TỨC</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="#">Tin tức</a></li>
                    {if $edit}<li class="active">Sửa tin tức</li> {/if}
                    {if $add}<li class="active">Thêm tin tức</li> {/if}
                </ol>
            </div>
        </div>
        <form id="form" method="post" class="form-material form-horizontal">
            <input type="hidden" value="OK" id="isSent" name="isSent" />
            <input type="hidden" id="id" name="id" value="{$id}"/>
            <input type="hidden" id="category_id" name="category_id" value="{$category_id}"/>

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
                                            <label class="col-md-12">Tiêu đề:</label>
                                            <div class="col-md-12">
                                                <input type="text" class="form-control" id="name" name="name" value="{$data['name']}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-12">Mô tả:</label>
                                            <div class="col-md-12">
                                                <textarea class="form-control" rows="5" id="intro" name="intro">{$data['intro']}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingNine">
                                    <h4 class="panel-title"> 
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="true" aria-controls="collapseSix" class="font-bold"> 
                                            Nội dung
                                        </a> 
                                    </h4> 
                                </div>
                                <div id="collapseSix" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingSix">
                                    <div class="panel-body"> 
                                        <div class="form-group">
                                            <div class="col-md-12" id="content_area">
                                                <textarea id="content" class="summernote" name="content">{$data['content']}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed font-bold" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" >
                                            File đính kèm
                                        </a>
                                    </h4>
                                </div>

                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                    <div class="panel-body table-responsive">
                                        <input type="hidden" id="number" value="0"/>
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th width="20%">
                                                        <button type="button" class="btn btn-xs btn-purple" onclick="clone_block()" data-toggle="tooltip" id='but_add'><i class="ace-icon fa fa-plus bigger-110"></i>
                                                        </button>
                                                    </th>
                                                    <th>Tên file</th>
                                                    <th>File</th>
                                                </tr>
                                            </thead>
                                            <tbody class="form-clone">
                                            {if $edit}
                                                {if $files}
                                                    {foreach from=$files item=file}
                                                        <tr class="row">
                                                            <td>
                                                            </td>
                                                            <td colspan="2">
                                                                <input class="form-control" type="hidden" id="file_upload_src" name="file_upload_src[]" value="{$file['src']}"/>
                                                                <input class="form-control" type="hidden" id="file_upload_name" name="file_upload_name[]" value="{$file['name']}"/>
                                                                <a download="{$file['name']}" href="{site_url()}{$upload_url}{$file['src']}">
                                                                    {$file['name']}
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    {/foreach}
                                                {/if}
                                            {/if}
                                                <tr class="clone-block row">
                                                    <td>
                                                        <button class="btn btn-xs btn-danger" id="btnDel" onclick="$(this).parent().parent().remove();" data-toggle="tooltip" title="">
                                                            <i class="ace-icon fa fa-trash-o bigger-120" ></i>
                                                        </button>
                                                    </td>
                                                    <td><input class="form-control" type="text" id="file_name-0" name="file_name[]" autocomplete="off" />
                                                    </td>
                                                    <td><input class="form-control" type="file" id="file-0" name="file-0" multiple/>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
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
                                            Từ khóa
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseFive" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingSix">
                                    <div class="panel-body">
                                        <div class="input-group m-b-30">
                                            <span class="input-group-addon">Tags</span>
                                            <select class="form-control js-example-tokenizer" multiple="multiple" name="tag[]">
                                                {foreach from=$tag item=t }
                                                    <option value="{$t['slug']}" {if $t['checked']}selected="selected" {/if}>{$t['name']}</option>
                                                {/foreach}
                                            </select>

                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingSeven">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="true" aria-controls="collapseSeven" class="font-bold">
                                            Hình ảnh
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseSeven" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingSix">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <input type="hidden" id="image" name="image" />
                                            <label class="col-sm-12">Chọn hình đại diện <button type="button" class="btn btn-primary waves-effect fa fa-image" id="btnEdit" onclick="_add_image('image')"></button></label>
                                            <div class="text-center">
                                                <img src="/assets/ext/image/noimage.png" id="image_show" class="img-responsive img-thumbnail">
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
