<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cenlab</title>
    {block name='css'}
        <link href="/assets/ample/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="/assets/ample/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
        <link href="/assets/ample/css/animate.css" rel="stylesheet">
        <link href="/assets/ample/css/style.css" rel="stylesheet">
        <link href="/assets/ample/css/colors/blue-dark.css" id="theme" rel="stylesheet">
        <link href="/assets/ample/plugins/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
        <link href="/assets/ample/plugins/bower_components/jquery-confirm/jquery-confirm.css" rel="stylesheet" type="text/css">

    {/block}

    {block name='script'}
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <script src="/assets/ample/plugins/bower_components/jquery/dist/jquery.min.js"></script>
        <script src="/assets/ample/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="/assets/ample/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
        <script src="/assets/ample/js/jquery.slimscroll.js"></script>
        <script src="/assets/ample/js/waves.js"></script>
        <script src="/assets/ample/js/custom.min.js"></script>
        <script type="application/javascript">
            $('#form').submit(function (evt) {
                evt.preventDefault();
                window.history.back();
            });

        </script>
    {/block}
</head>

<body class="fix-header">
<div class="preloader">
    <div class="cssload-speeding-wheel"></div>
</div>
<section id="wrapper" class="login-register">
    <div class="login-box">
        <div class="white-box">
            <form id="form" method="post" class="form-horizontal  form-material" action="{$pathRoot}/login/login">
                <a href="javascript:void(0)" class="text-center db">
                    <img src="/assets/smeq/logo.png" alt="Home" /><br/>
                    <div class="form-group m-t-40">
                        <div class="col-xs-12">
                            <input class="form-control" type="text" required="" placeholder="Username" name="username">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <input class="form-control" type="password" required="" placeholder="Password" name="password">
                        </div>
                    </div>
            </form>
            <div class="form-group text-center m-t-20">
                <div class="col-xs-12">
                    <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" onclick="_submit()">Log In</button>
                </div>
            </div>
        </div>
    </div>
</section>
</body>

</html>
