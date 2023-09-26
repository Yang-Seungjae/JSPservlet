<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>거래내역</title>

    <!-- Custom fonts for this template -->
    <link href="accountassets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="accountassets/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="accountassets/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>
<style>

#cardbody {
margin-top : 150px;
}
</style>
<body>

 <!-- ======= Header ======= -->
  
 	<div>
     <jsp:include page="topMenu.jsp"/>
    </div>
    
    <!-- End Header -->
<!-- DataTales Example -->
                    <div class="card shadow mb-4" id="cardbody">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">거래내역</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>입출금</th>
                                            <th>거래상대</th>
                                            <th>거래금액</th>
                                            <th>시간</th>
                                            <th>메세지</th>
                                            <th>잔액</th>
                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>입출금</th>
                                            <th>거래상대</th>
                                            <th>거래금액</th>
                                            <th>시간</th>
                                            <th>메세지</th>
                                            <th>잔액</th>
                                            
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="recordList" items="${recordList}">
                                        <tr>
                                            <td>${recordList.rc_type }</td>
                                            <td>${recordList.rc_name }</td>
                                            <td>${recordList.rc_money }</td>
                                            <td>${recordList.rc_time }</td>
                                            <td>${recordList.rc_text }</td>
                                            <td>${recordList.rc_balance }</td>
                                            
                                        </tr>
                                      </c:forEach> 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

               
                <!-- /.container-fluid -->
                <!-- ======= footer ======= -->
  
 	<div>
     <jsp:include page="bottomMenu.jsp"/>
    </div>
    
    <!-- End footer -->
                
                 <!-- Bootstrap core JavaScript-->
    <script src="accountassets/vendor/jquery/jquery.min.js"></script>
    <script src="accountassets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="accountassets/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="accountassets/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="accountassets/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="accountassets/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="accountassets/js/demo/datatables-demo.js"></script>

</body>
</html>