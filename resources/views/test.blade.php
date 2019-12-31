<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="{{asset('/public/backend')}}/ckeditor/ckeditor.js"></script>
    <script src="{{asset('/public/backend')}}/ckfinder/ckfinder.js"></script>
    <script src="{{asset('/public/backend')}}/script.js"></script>
    <script>var DOMAIN = '{{asset('/public/backend')}}';</script>
</head>

<body>
    <div class="container">
        <div class="form-group">
            <label for="">Input 1</label>
            <input type="text" onchange="stralias('ten','alias')" class="form-control" name="" id="ten" placeholder="">
        </div>
        <div class="form-group">
            <label for="">Input 2</label>
            <input type="text" class="form-control" name="alias" id="alias" placeholder="">
        </div>
        <div class="form-group">
            <label for="">Hình đại diện</label>
            <img width="100" />
            <input type="hidden" class="form-control" name="image" id="hinh" placeholder="">
            <a href="#" title="up hình" onclick="openPopup('hinh')" class="btn btn-success">Up load hình</a>
        </div>
        <div class="form-group">
            <label for="">Input 4</label>
            <textarea class="form-control" name="noidung" id="" rows="3"></textarea>
            <script>CKEDITOR.replace('noidung')</script>
        </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js">
    </script>
</body>

</html>
