@extends('backend.master')
@section('title')
    <h3 class="page-header ">
        Lịch sử mua hàng của khách hàng: <b><i></i></b>
        
    </h3>
@stop
@section('content')                 
<div class="panel panel-default">
<div class="panel-heading">
    <b><i>Danh sách đơn hàng</i></b>
    <a href="#" class="btn btn-default">Quay lại</a>
</div>
<!-- .panel-heading -->
<div class="panel-body">
    <div class="panel-group" id="accordion">
        
        <div class="panel panel-red">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse" ><p ><b>Đơn hàng số  | <i>Tình trạng:</i> </b></p></a>

                </h4>
            </div>
            <div id="collapse" class="panel-collapse collapse">
                <div class="panel-body">
                    <div class="row">
                    <div class="col-lg-6">
                    <div class="panel panel-default">
                      <div class="panel-heading">
                        <h3 class="panel-title">Thông tin khách hàng</h3>
                      </div>
                      <div class="panel-body">
                      <div class="table-responsive">
                          <table class="table table-hover">
                              <tbody>
                                  <tr>
                                      <td><b>Tên khách hàng</b></td>
                                      <td></td>
                                  </tr>
                                  <tr>
                                      <td><b>Số điện thoại</b></td>
                                      <td></td>
                                  </tr>
                                  <tr>
                                      <td><b>Email</b></td>
                                      <td></td>
                                  </tr>
                                  <tr>
                                      <td><b>Địa chỉ</b></td>
                                      <td></td>
                                  </tr>
                              </tbody>
                          </table>
                      </div>    
                    </div>
                    </div>
                    </div>
                    <div class="col-lg-6">
                    <div class="panel panel-default">
                      <div class="panel-heading">
                        <h3 class="panel-title">Thông tin giao hàng</h3>
                      </div>
                      <div class="panel-body">
                      <div class="table-responsive">
                          <table class="table table-hover">

                              <tbody>
                                  <tr>
                                      <td><b>Người nhận hàng</b></td>
                                      <td></td>
                                  </tr>
                                  <tr>
                                      <td><b>Số điện thoại</b></td>
                                      <td></td>
                                  </tr>
                                  <tr>
                                      <td><b>Email</b></td>
                                      <td></td>
                                  </tr>
                                  <tr>
                                      <td><b>Địa chỉ</b></td>
                                      <td></td>
                                  </tr>
                                  <tr>
                                      <td><b>Ghi chú</b></td>
                                      <td>
                                      
                                        
                                      </td>
                                  </tr>
                              </tbody>
                          </table>
                      </div>
                      </div>
                    </div> 
                    </div>
                    </div>
                    
                    <hr>
                    <div class="row">
                        <div class="col-lg-12">
                        <div class="panel panel-default" >
                          <div class="panel-heading">
                            <h2 class="panel-title" ><b>Danh sách sản phẩm</b></h2>
                          </div>
                          <div class="panel-body">
                            <div class="col-lg-12" >
                                <div class="table-responsive">
                                    <table class="table table-hovered" >
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Sản phẩm</th>
                                                <th>Đơn giá</th>
                                                <th>Số lượng</th>
                                                <th>Thành tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
                                    </table>
                                </div>
                            </div>
                          </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- .panel-body -->
</div>
<!-- /.panel -->

@stop