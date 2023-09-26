<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
</head>
<style>

#accountlist {

 margin-bottom: 100px;
  display: flex;
  flex-direction: column;
align-items: center;
  justify-content: center;
  text-align: center;

}
#accountlist .d-flex {
  flex-direction: column;
}

.image-container {
  display: flex;
  flex-wrap: wrap;
}


.image-item {
  width: 50%;
  box-sizing: border-box;
  padding: 10px;
}

.image-item img {
  width: 100px;
  height: 100px;
  border: none; /* 보더 제거 */
  margin: 10px;
  cursor: pointer;
  transition: opacity 0.3s; /* 투명도 변화를 통한 눌림 효과 */
}




</style>

<script>
function showAccountInfo(number, name, balance) {
	  document.getElementById("accountNumber").value = number;
	  document.getElementById("accountName").value = name;
	  document.getElementById("accountMoney").value = balance;
	}
	
</script>
<body>
 <!-- ======= Header ======= -->
  
 	<div>
     <jsp:include page="topMenu.jsp"/>
    </div>
    
    <!-- End Header -->
<section id="hero">
<div class="container" id="transferbody">
        
         
         
           
			  <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
			    <div class="swiper-wrapper">
			      <c:forEach var="Accounts" items="${Accounts}">
			        <div class="swiper-slide">
			          <div class="testimonial-item" id="t_item">
			            <div class="row icon-boxes" id="accountlist" data-aos="zoom-im" data-aos-delay="100">
			              
			              
			             	 <div class="number">
			                         <a href="javascript:void(0)" onclick="showAccountInfo('${Accounts.ac_number }','${Accounts.pd_name}', '${Accounts.ac_money}')">${Accounts.ac_number}</a>
			                    </div>
			                    <div class="d-flex align-items-center justify-content-between">
			                        <small><span class="fw-bold">Expire date:</span><span>${Accounts.ac_ed_date }</span></small>
			                        <small><span class="fw-bold">상품이름:</span><span>${Accounts.pd_name }</span></small>
			                        <small><span class="fw-bold">Balance:</span><span>${Accounts.ac_money }</span></small>
			                    </div>
			                
			          
			            </div>
			          </div>
			        </div>
			      </c:forEach>
			    </div>
			    <div class="swiper-pagination" id="swiperbar"></div>
			  </div>
         
         
			
				      
            <div class="col-12 mt-4">
                <div class="card p-3">
                    <p class="mb-0 fw-bold h4">계좌이체</p>
                </div>
            </div>
            <div class="col-12">
                <div class="card p-3" id="card">
                   
                    <div class="card-body border p-0">
                        <p>
                            <a class="btn btn-primary p-2 w-100 h-100 d-flex align-items-center justify-content-between"
                                data-bs-toggle="collapse"  role="button" aria-expanded="true"
                                aria-controls="collapseExample">
                                <span class="fw-bold">이체 정보</span>
                                <span class="">
                                    <span class="fab fa-cc-amex"></span>
                                    <span class="fab fa-cc-mastercard"></span>
                                    <span class="fab fa-cc-discover"></span>
                                </span>
                            </a>
                        </p>
                        <div class="collapse show p-3 pt-0" id="collapseExample">
                            <div class="row">
                                <div class="col-lg-5 mb-lg-0 mb-3">
								  <div class="image-container">
								  <div class="image-item" >
								    <img src="assets/img/logo1.jpg" alt="POLO BANK" style="width: 100px; height: 100px;">
								  </div>
								  <div class="image-item"  >
								    <img src="assets/img/logo2.png" alt="밤하늘 은행" style="width: 100px; height: 100px;">
								  </div>
								  <div class="image-item">
								    <img src="assets/img/logo3.png" alt="BH BANK" style="width: 100px; height: 100px;">
								  </div>
								  <div class="image-item"  >
								    <img src="assets/img/logo4.png" alt="JOOBANK" style="width: 100px; height: 100px;">
								  </div>
								</div>

								</div>
                                <div class="col-lg">
                                    <form action="/BankMVC/openbanktransfer.do" method="post" id="transferForm" class="form">
                                        <div class="row">
                                        
                                        	<div class="col-12">
												  <p class="mb-0">
												    <label for="accountNumber" class="fw-bold">내 계좌 번호:</label>
												    <input type="text" class="form-control" id="accountNumber" name="accountNumber" readonly>
												  </p>
												  <br/>
												  <p class="mb-0">
												    <label for="accountName" class="fw-bold">내 계좌 이름:</label>
												    <input type="text" class="form-control" id="accountName" name="accountName" readonly>
												  </p>
												  <br/>
												  <p class="mb-0">
												    <label for="accountMoney" class="fw-bold">내 계좌 잔액:</label>
												    <input type="text" class="form-control" id="accountMoney" name="accountMoney" readonly>
												  </p>
												  <br/>
												</div>
											<div class="col-12">
											  <div class="form__div">
											    <select class="form-control" name="selectedBank" id="selectedBank">
											        <option value="" selected disabled>선택한 은행</option>
											        <option value="616">POLO BANK</option>
											        <option value="159">밤하늘 은행</option>
											        <option value="111">BH BANK</option>
											        <option value="204">JOOBANK</option>
											    </select>
											    <label for="selectedBank" class="form__label"></label>
											</div>

											</div>
                                            
                                            <div class="col-12">
                                                <div class="form__div">
                                                    <input type="text" class="form-control" name="rc_number" placeholder="계좌 번호">
                                                    <label for="" class="form__label"></label>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form__div">
                                                    <input type="text" class="form-control" name="rc_money"placeholder="이체할 금액">
                                                    <label for="" class="form__label"></label>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form__div">
                                                    <input type="password" class="form-control" name="ac_pw" placeholder="계좌 비밀번호">
                                                    <label for="" class="form__label"></label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form__div">
                                                    <input type="text" class="form-control" name="rc_text" placeholder="입금 코멘트">
                                                    <label for="" class="form__label"></label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                            	<input type="hidden" name="rc_type" value="출금">
                                                <button type="submit" class="btn btn-primary w-100" >이체</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
 </section>   
   
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