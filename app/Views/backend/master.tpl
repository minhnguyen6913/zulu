<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cenlab</title>
    <!-- Bootstrap Core CSS -->
    <link href="/assets/ample/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="/assets/ample/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="/assets/ample/css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/assets/ample/css/style.css" rel="stylesheet">
    {block name='css'}{/block}
    <!-- color CSS -->
    <link href="/assets/ample/css/colors/blue-dark.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="fix-header">
<!-- ============================================================== -->
<!-- Preloader -->
<!-- ============================================================== -->
<div class="preloader">
    <svg class="circular" viewBox="25 25 50 50">
        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
    </svg>
</div>
<!-- ============================================================== -->
<!-- Wrapper -->
<!-- ============================================================== -->
<div id="wrapper">
    {include file='backend/header.tpl'}
    {include file='backend/menu.tpl'}
    <div id="page-wrapper">
        {block name='body'}{/block}
        {block name='right-sidebar'}{/block}
        <footer class="footer text-center"> 2020 &copy; Cenlab </footer>
    </div>
</div>
<!-- /#wrapper -->
<!-- jQuery -->
<script src="/assets/ample/plugins/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/assets/ample/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Menu Plugin JavaScript -->
<script src="/assets/ample/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
<!--slimscroll JavaScript -->
<script src="/assets/ample/js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="/assets/ample/js/waves.js"></script>
<!-- Custom Theme JavaScript -->
<script src="/assets/ample/js/custom.min.js"></script>
{block name='script'}{/block}
</body>

</html>
