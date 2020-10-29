{*{extends file='backend/master.tpl'}*}
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
    <script src="/assets/ample/plugins/bower_components/bootstrap-treeview-master/dist/bootstrap-treeview.min.js"></script>
    <script src="/assets/ample/plugins/bower_components/bootstrap-treeview-master/dist/bootstrap-treeview-init.js"></script>

    <script type="application/javascript">
        var data = {$tree};

        $(document).ready(function() {

            $('#treeview').treeview({
                levels: 1,
                selectedBackColor: "#03a9f3",
                onhoverColor: "rgba(0, 0, 0, 0.05)",
                expandIcon: 'ti-plus',
                collapseIcon: 'ti-minus',
                levels: 5,
                nodeIcon: 'fa fa-folder',
                data: data,
                enableLinks: true
            });
        });
        function _show (id) {
            var inputName = "{$inputName}";
            var forTextArea = "{$forTextArea}";
            $('#showImage').empty();
            $.ajax({
                type: "POST",
                url: "{$pathRoot}selectImage/showimage",
                data: {
                    id : id,
                    inputName: inputName,
                    forTextArea: forTextArea,
                },
                datatype: "text",
                success: function (data) {
                    $('#showImage').html(data);
                }
            });
        }


    </script>
{/block}
{block name='body'}
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3 col-lg-3 col-sm-5">
            <div class="panel panel-info">
                <div class="panel-heading">Thư mục</div>
                <div id="treeview" class=""></div>
            </div>
        </div>

        <div class="col-md-9 col-lg-9 col-sm-7">
            <div class="panel panel-info">
                <div class="panel-heading"> Hình ảnh</div>
                <div class="panel-wrapper collapse in" aria-expanded="true">
                    <div class="panel-body">
                        <div id="showImage">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{/block}
