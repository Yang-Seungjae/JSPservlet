<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>오픈뱅크웹페이지프로젝트</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: OnePage
  * Updated: May 30 2023 with Bootstrap v5.3.0
  * Template URL: https://bootstrapmade.com/onepage-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<style>


#swiper-pagination2 {
  position: absolute;
  bottom: 0px; /* 아래에서 20px 위치로 조정 */
  left: 1050px; /* 가로 중앙으로 조정 */
  transform: translateX(-50%);
  text-align: center;
  transition: .3s opacity;
  z-index: 10;
}

#testimonial-item2{
min-height : 600px;
position: relative;
left:100px;
}


</style>
<body>

  <!-- ======= Header ======= -->
  
 	<div>
     <jsp:include page="topMenu.jsp"/>
    </div>
    
    <!-- End Header -->
    

<!-- ======= Pricing Section ======= -->
<section id="pricing" class="pricing">
  <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
    <div class="swiper-wrapper">
      <c:forEach var="product" items="${products}">
        <div class="swiper-slide">
          <div class="testimonial-item" id="testimonial-item2">
            <div class="col-lg-4 col-md-6" data-aos="zoom-im" data-aos-delay="100">
              <div class="box">
             	 
                <h3>${product.pd_name}</h3>
                <h4>${product.interest}<sup>&nbsp%</sup><span> / ${product.period }year</span></h4>
                <ul>
                  <li>${product.pd_content}</li>
                  <li>${product.pd_detail}</li>
                </ul>
                <div class="btn-wrap">
                  <a href="/BankMVC/insertaccountprocess.do?productName=${product.pd_name}&amp;productNumber=${product.pd_number}" class="btn-buy">계좌 개설</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
    <div class="swiper-pagination" id="swiper-pagination2"></div>
  </div>
</section>
<!-- End Pricing Section -->

  
  <!-- ======= footer ======= -->
  
 	<div>
     <jsp:include page="bottomMenu.jsp"/>
    </div>
    
    <!-- End footer -->
    
  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  </body>
  </html>
  