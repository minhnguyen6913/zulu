{extends file='backend/master.tpl'}
{block name='css'}
    <link href="/assets/ample/css/animate.css" rel="stylesheet">
    <link href="/assets/ample/css/style.css" rel="stylesheet">
    <link href="/assets/ample/plugins/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/bootstrap-tagsinput/dist/bootstrap-tagsinput.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />

    <style>
    </style>
{/block}
{block name='script'}
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
    <script src="/assets/ample/plugins/bower_components/sweetalert/sweetalert.min.js"></script>
    <script src="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.js"></script>
    <script src="/assets/ample/plugins/bower_components/sweetalert/jquery.sweet-alert.custom.js"></script>
    <script src="/assets/ample/js/jquery.slimscroll.js"></script>
    <script src="/assets/ample/js/custom.min.js"></script>
    <script src="/assets/ample/js/jasny-bootstrap.js"></script>
    <script src="/assets/ample/js/waves.js"></script>
    <script src="/assets/ample/plugins/bower_components/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
    <script type="application/javascript">
        $(document).ready(function() {

            $('#tag').select2({
                tags: true,
                tokenSeparators: [",", " "],

            });
            $(".js-example-tokenizer").select2({
                tags: true,
                tokenSeparators: [',', ' ']
            })



            {if $edit} _is_edit();{/if}
        });

        function _is_edit() {
            $.ajax({
                url: "{$pathRoot}document/getdocument",
                type: "POST",
                data: { id : "{$id}" },
                dataType: "JSON",
                success: function (data) {

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
        function _edit() {
            document.location.href='{$pathRoot}document/edit?id={$id}';
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
                <h4 class="page-title">THÔNG TIN VĂN BẢN PHÁP QUY</h4>
            </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="#">Văn bản pháp quy</a></li>
                    <li class="active">Chi tiết</li>
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
                                                <p>{$data['name']}</p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-12">Mô tả:</label>
                                            <div class="col-md-12">
                                               <p>{$data['intro']}</p>
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
                                            <div class="col-md-12">
                                                <p>{$data['content']}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a class="collapsed font-bold" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne" >
                                            File đính kèm
                                        </a>
                                    </h4>
                                </div>

                                <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body table-responsive">
                                        <input type="hidden" id="number" value="0"/>
                                        <table class="table table-hover">
                                            <thead>
                                            <tr>
                                                <th></th>
                                                <th>#</th>
                                                <th>Tên file</th>
                                            </tr>
                                            </thead>
                                            <tbody class="form-clone">
                                            {if $files}
                                                {assign "stt" "1"}
                                                {foreach from=$files item=file}
                                                    <tr class="row">
                                                        <td>{$stt++}</td>
                                                        <td>
                                                            <a download="{$file['name']}" href="{site_url()}{$upload_url}{$file['src']}">
                                                                {$file['name']}
                                                            </a>
                                                        </td>
                                                    </tr>
                                                {/foreach}
                                            {else}
                                                <tr class="row">
                                                    <td colspan="3" style="text-align: center;">No file</td>
                                                </tr>
                                            {/if}
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
                                            Thông tin
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseFive" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingSix">
                                    <div class="panel-body">
                                        <div class="input-group m-b-30">
                                            <span class="input-group-addon">Tags</span>
                                            <select class="form-control js-example-tokenizer" multiple="multiple" name="tag[]" disabled>
                                                {foreach from=$tag item=t }
                                                    <option value="{$t['slug']}" {if $t['checked']}selected="selected" {/if}>{$t['name']}</option>
                                                {/foreach}
                                            </select>

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
                                            <label class="col-sm-12">Chọn hình đại diện </label>
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
            <button type="button" class="btn btn-primary waves-effect" id="btnEdit" onclick="_edit()">Cập nhật</button>
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
