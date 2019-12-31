<!--Kế thừa cha-->
@extends('backend.masterlogin')
<!--Vị trí kế thừa-->
@section('content')
<div class="auth-wrapper">
    <div class="container-fluid h-100">
        <div class="row flex-row h-100 bg-white">
            <div class="col-xl-8 col-lg-6 col-md-5 p-0 d-md-block d-lg-block d-sm-none d-none">
                <div class="lavalite-bg" style="background-image: url('{{asset('/public/backend/assets')}}/img/auth/login-bg.jpg')">
                    <div class="lavalite-overlay"></div>
                </div>
            </div>
            <div class="col-xl-4 col-lg-6 col-md-7 my-auto p-0">
                <div class="authentication-form mx-auto">
                    <div class="logo-centered">
                        <a href="../index.html"><img src="{{asset('/public/backend/assets')}}/src/img/brand.svg" alt=""></a>
                    </div>
                    <h3>Đăng nhập vào admin</h3>
                    {{-- <p>Happy to see you again!</p> --}}
                    <form action="{{route('user.loginpost')}}" method="post">
                        @csrf()
                        @if (session('msg'))
                        <div class="alert alert-{{session('type')}}">{{session('msg')}}</div>
                        @endif
                        <div class="form-group">
                            <input type="text" class="form-control" name="username" placeholder="Username" required=""
                                value="">
                            <i class="ik ik-user"></i>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="password" placeholder="Password" required=""
                                value="">
                            <i class="ik ik-lock"></i>
                        </div>
                        <div class="row">
                            <div class="col text-left">
                                <label class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="item_checkbox" name="rememberlogin" value="1">
                                    <span class="custom-control-label">&nbsp;Ghi nhớ đăng nhập</span>
                                </label>
                            </div>
                        </div>
                        <div class="sign-btn text-center">
                            <button class="btn btn-theme">Đăng nhập</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
