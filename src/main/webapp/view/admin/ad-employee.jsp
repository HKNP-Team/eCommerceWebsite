<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
   <%@ include file="../../common/meta-info.jsp" %>
   <title>eCommerce Website - Admin</title>
   <%@ include file="../../common/link-css.jsp" %>
</head>

<body>
<%@ include file="../../common/ad-side-nav.jsp" %>

<jsp:include page="../../common/ad-side-nav.jsp" >
   <jsp:param name="selectedIndex" value="1" />
</jsp:include>

<!-- Main content -->
<div class="main-content" id="panel">
   <!--Top navigation-->
   <%@include file="../../common/ad-top-nav.jsp" %>

   <!-- Page content -->
   <div class="container-fluid">
      <!-- Breadcrumb -->
      <div class="row mt-4">
         <div class="col-md-10 ml-auto mr-auto">
            <nav aria-label="breadcrumb" role="navigation">
               <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/admin"><i class="fa fa-home mr-2"></i>Trang chủ</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Nhân viên</li>
               </ol>
            </nav>
         </div>
      </div>

      <!--Title-->
      <div class="row">
         <div class="col-md-10 ml-auto mr-auto">
            <h2 class="display-3 page-title">Danh sách nhân viên</h2>
         </div>
      </div>

      <!--Button thêm-->
      <div class="row">
         <div class="col-md-10 ml-auto mr-auto text-right">
            <a href="#" class="text-uppercase btn btn-primary pl-4 pr-4 mb-4">Thêm nhân viên</a>
         </div>
      </div>

      <!-- Table -->
      <div class="row">
         <div class="col-md-10 ml-auto mr-auto table-responsive">
            <table class="table align-items-center">
               <thead class="thead-light">
               <tr>
                  <th scope="col" class="sort text-center">Ảnh</th>
                  <th scope="col" class="sort text-center">Mã</th>
                  <th scope="col" class="sort text-center">Họ và tên</th>
                  <th scope="col" class="sort text-center">Giới tính</th>
                  <th scope="col" class="sort text-center">Ngày sinh</th>
                  <th scope="col" class="sort text-center">Số điện thoại</th>
                  <th scope="col" class="sort text-center">Email</th>
                  <th scope="col" class="sort text-center">Lương</th>
                  <th scope="col" class="sort text-center">Tùy chọn</th>
               </tr>
               </thead>
               <tbody class="list">
               <tr>
                  <td>
                     <a href="#" class="media align-items-center avatar rounded-circle">
                        <img alt="Image placeholder" src="../../assets/img/theme/bootstrap.jpg">
                     </a>
                  </td>
                  <td>10000</td>
                  <td>Huỳnh Thị Thúy Vy</td>
                  <td>Nữ</td>
                  <td>20/05/2000</td>
                  <td>000000000000</td>
                  <td>huynhthithuyvy@gmail.com</td>
                  <td>100000</td>
                  <td class="td-actions text-center">
                     <a href="#" class="btn btn-success px-2 py-1" data-toggle="tooltip" data-placement="top" title="Chỉnh sửa thông tin">
                        <i class="fa fa-edit"></i>
                     </a>
                     <a href="#" class="btn btn-danger px-2 py-1" data-toggle="tooltip" data-placement="top" title="Thôi việc">
                        <i class="fa fa-user-slash"></i>
                     </a>
                     </a>
                     <a href="#" class="btn btn-default px-2 py-1" data-toggle="tooltip" data-placement="top" title="Làm việc lại">
                        <i class="fa fa-user-check"></i>
                     </a>
                  </td>
               </tr>
               </tbody>
            </table>
         </div>
      </div>

      <!-- Pagination -->
      <nav aria-label="...">
         <ul class="pagination justify-content-center mt-5">
            <li class="page-item disabled text-default">
               <a class="page-link" href="#" tabindex="-1">
                  <i class="fa fa-angle-left"></i>
                  <span class="sr-only">Previous</span>
               </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item active">
               <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
            </li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
               <a class="page-link" href="#">
                  <i class="fa fa-angle-right"></i>
                  <span class="sr-only">Next</span>
               </a>
            </li>
         </ul>
      </nav>

      <!-- Footer -->
      <%@ include file="../../common/footer.jsp" %>
   </div>
</div>

<!--Javascript-->
<%@ include file="../../common/import-js.jsp" %>
</body>
</html>
