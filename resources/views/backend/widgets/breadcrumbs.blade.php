@if (isset($breadcrumb) && $breadcrumb!='')
<div class="page-header">
    <div class="row align-items-end">
        <div class="col-lg-8">
            <div class="page-header-title">
                <i class="ik ik-layers bg-blue"></i>
                <div class="d-inline">
                    {{-- Kế thừa name bên index --}}
                    <h5>@yield('pagename')</h5>
                    <span>Bạn hiện đang ở trang @yield('pagename')</span>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <nav class="breadcrumb-container" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="../index.html"><i class="ik ik-home"></i></a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="{{$breadcrumb}}">{{$namepage}}</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">@yield('pagename')</li>
                </ol>
            </nav>
        </div>
    </div>
</div>
@endif
