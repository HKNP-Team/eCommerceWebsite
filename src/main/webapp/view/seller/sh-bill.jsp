<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
   <%@ include file="../../common/meta-info.jsp" %>
   <title>eCommerce Website - Seller</title>
   <%@ include file="../../common/link-css.jsp" %>
</head>

<body>
<!--Left side nav-->
<jsp:include page="sh--side-nav.jsp">
   <jsp:param name="selectedIndex" value="2"/>
</jsp:include>

<!-- Main content -->
<div class="main-content" id="panel">
   <!--Top navigation-->
   <%@include file="./sh--top-nav.jsp" %>

   <!-- Page content -->
   <div class="container-fluid">
      <!-- Breadcrumb -->
      <div class="row mt-4">
         <div class="col-md-10 ml-auto mr-auto">
            <nav aria-label="breadcrumb" role="navigation">
               <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/admin"><i class="fa fa-home mr-2"></i>Trang chủ</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Danh sách đơn hàng</li>
               </ol>
            </nav>
         </div>
      </div>

      <!--Title-->
      <div class="row">
         <div class="col-md-10 ml-auto mr-auto">
            <h2 class="display-3 text-center text-uppercase my-5">Danh sách đơn hàng</h2>
         </div>
      </div>

      <div class="col-md-2 form-group">
         <label for="status" class="form-control-label">Trạng thái</label>
         <div>
            <select class="form-control" id="status" name="status" required>
               <option value="1">Đợi duyệt</option>
               <option value="2">Đã duyệt</option>
               <option value="3">Đang giao</option>
               <option value="4">Đã giao xong</option>
            </select>
         </div>

      <!-- From add product-category -->
      <%@ include file="../../common/form-add-product-category.jsp" %>
   </div>
   <!-- Table -->
   <div class="row">
      <div class="col ml--3 table-responsive">
         <table class="table">
            <thead>
            <tr>
               <th scope="col" class="text-center">Mã đơn hàng</th>
               <th scope="col" class="text-center">Tên khách hàng</th>
               <th scope="col" class="text-center">Số điện thoại</th>
               <th scope="col" class="text-center">Địa chỉ</th>
               <th scope="col" class="text-center">Tổng giá trị</th>
            </tr>
            </thead>
            <tbody class="list" id="tb-list">
            </tbody>
         </table>
      </div>
   </div>
   <!-- Footer -->
   <%@ include file="../../common/footer.jsp" %>
</div>
</div>

<!--Javascript-->
<%@ include file="../../common/import-js.jsp" %>
<script>
  $(document).ready(function () {
    const apiUrl = "/api/deliverybill";

    $.ajax({
      url: apiUrl,
      method: 'GET',
      data: {
        page: '1',
        status: '2',
      },
      success: function (data, textStatus, jqXHR) {
        let list = $.parseJSON(data);
        console.log(list);

        $.each(list, function (index, item) {
          let html =
            '<tr id="hay'+item.id+'">' +
            '<td>' + item.id + '</td>' +
            '<td>' + item.fullName + '</td>' +
            '<td>' + item.phone + '</td>' +
            '<td>' + item.fullAddress + '</td>' +
            '<td>' + item.total + '</td>' +
            '<td class="td-actions text-center">' +
            '<button class="btn btn-primary pl-2 pr-1" onclick="GetBill('+ item.id +')">Nhận đơn</button>'
          '</td>' +
          '</tr>';
          console.log(html);
          $('#tb-list').append(html);
        });
      },
      cache: false
    });
  });
</script>
<script>
  function GetBill(billId){
    let paras = JSON.stringify({
      'id': billId.toString(),
      'status': 3
    })
    $.ajax({
      url: "/api/bill/view/detail",
      method: 'PUT',
      async: false,
      cache: false,
      data: paras,
      success: function (){
        $("#hay" + billId).remove();
      }
    })
    alert("Nhận đơn thành công!");
  }
</script>
<script src="../../assets/js/validate/load-bill-by-status-for-seller.js"></script>
</body>
</html>