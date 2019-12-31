<div class="app-sidebar colored">
    <div class="sidebar-header">
        <a class="header-brand" href="index.html">
            <div class="logo-img">
               <img src="{{asset('/public/backend/assets')}}/src/img/brand-white.svg" class="header-brand-img" alt="lavalite">
            </div>
            <span class="text">Nguyen</span>
        </a>
        <button type="button" class="nav-toggle"><i data-toggle="expanded" class="ik ik-toggle-right toggle-icon"></i></button>
        <button id="sidebarClose" class="nav-close"><i class="ik ik-x"></i></button>
    </div>

    <div class="sidebar-content">
        <div class="nav-container">
            <nav id="main-menu-navigation" class="navigation-main">
                <div class="nav-lavel">Navigation</div>
                <div class="nav-item active">
                    <a href="{{route('home.index')}}"><i class="ik ik-bar-chart-2"></i><span>Trang tổng quan</span></a>
                </div>
                <div class="nav-item has-sub">
                    <a href="javascript:void(0)"><i class="ik ik-shopping-bag"></i><span>Quản lý bán hàng</span> </a>
                    <div class="submenu-content">
                        <a href="{{route('khachhang.index')}}" class="menu-item">Danh sách khách hàng</a>
                        <a href="{{route('baocao.index')}}" class="menu-item">Báo cáo</a>
                    </div>
                </div>
                <div class="nav-item has-sub">
                    <a href="javascript:void(0)"><i class="ik ik-shopping-bag"></i><span>Quản lý trang chủ</span> </a>
                    <div class="submenu-content">
                        <a href="{{route('slide.index')}}" class="menu-item">Hình quảng cáo</a>
                    </div>
                </div>
                <div class="nav-item has-sub">
                    <a href="javascript:void(0)"><i class="ik ik-package"></i><span>Quản lý sản xuất</span> </a>
                    <div class="submenu-content">
                        <a href="{{route('sanpham.index')}}" class="menu-item">Danh sách sản phẩm</a>
                        <a href="{{route('danhmuc.index')}}" class="menu-item">Danh sách danh mục</a>
                        <a href="{{route('loaisanpham.index')}}" class="menu-item">Danh sách loại sản phẩm</a>
                        <a href="{{route('nhacungcap.index')}}" class="menu-item">Danh sách nhà cung cấp</a>
                        <a href="{{route('thuonghieu.index')}}" class="menu-item">Danh sách thương hiệu</a>
                    </div>
                </div>
                <div class="nav-item has-sub">
                    <a href="javascript:void(0)"><i class="ik ik-users"></i><span>Quản lý user</span> </a>
                    <div class="submenu-content">
                        <a href="{{route('user.index')}}" class="menu-item">Danh sách user</a>
                        <a href="{{route('usergroup.index')}}" class="menu-item">Danh sách nhóm user</a>
                        {{-- <a href="{{route('permission.index')}}" class="menu-item">Phân quyền user</a> --}}
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
