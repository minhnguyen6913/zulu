{*    {extends file='backend/master.tpl'}*}
{block name='css'}
    <link href="/assets/ample/plugins/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.css" rel="stylesheet" type="text/css">
    <link href="/assets/ample/plugins/bower_components/dropzone-master/dist/dropzone.css" rel="stylesheet" type="text/css" />
    <style>
        #image {
            width: 80px;
            height: 80px;
        }
        .text {
            display: block;
            width: 100px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
    </style>
{/block}
{block name='script'}

    <script id="image" src="/assets/ample/plugins/bower_components/sweetalert/sweetalert.min.js"></script>
    <script id="image" src="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.js"></script>
    <script id="image" src="/assets/ample/plugins/bower_components/sweetalert/jquery.sweet-alert.custom.js"></script>
    <script id="image" src="/assets/ample/js/jasny-bootstrap.js"></script>
    <script id="image" src="/assets/ample/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
    <script id="image" src="/assets/ample/plugins/bower_components/dropzone-master/dist/dropzone.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {

        });
    </script>
{/block}
{block name='body'}

    <div class="container-fluid">

        <div class="row">
            {if $list}
                {foreach from=$list item=img}
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 .p-0   ">
                    <div class="white-box">
                        <div class="product-img">
                            <img id="image" src="{$img['thumbnail']}"/>
                            <div class="pro-img-overlay">
                                <a href="javascript:_chooseImage('{$img['id']}', '{$img['inputName']}', '{$img['forTextArea']}')" class="bg-info"><i class="fa fa-check"></i></a>
                            </div>
                        </div>
                        <div class="product-text">
                            <h3 class="box-title m-b-0 text" style="font-size:9pt ">{$img['name']}</h3>
                        </div>
                    </div>
                </div>
                {/foreach}
            {else}

                No image
            {/if}
        </div>

    </div>
{/block}
