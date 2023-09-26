<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="loginassets/fonts/icomoon/style.css">
  <link rel="stylesheet" href="loginassets/css/owl.carousel.min.css">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="loginassets/css/bootstrap.min.css">
  
  <!-- Style -->
  <link rel="stylesheet" href="loginassets/css/style.css">

  <title>ȸ������</title>
  
  <style>
.half {
  display: flex;
  flex-wrap: wrap;
  margin-top: 50px;
  margin-bottom: 50px;
  
}

.half > div {
  flex: 1 1 50%;
}

#join {
  margin-top: 50px;
  margin-bottom: 50px;
  transform : scale(1);
 
}

#join .row > div {
  margin-top: 10px;
   border-radius:50%;
}
#postcode[readonly], #address[readonly]{
background-color:#ffffff;
}

#submitbtn {

margin-top : 50px;

}
.half .contents .form-group, .half .bg .form-group {
    overflow: hidden;
    margin-bottom: 0;
    border: 2px solid #efefef;
    padding: 15px 15px;
    /* border-bottom: none; */
    position: relative;
    margin-bottom: 10px; 
    height: 60px;
   
}

#submitbtn {

}



</style>
    
    <script>
        // ���̵� ��ȿ�� �˻� �Լ�
        function validateId() {
            var id = $("#id").val();
            var idRegex = /^[a-zA-Z0-9]{1,16}$/;
            if (!idRegex.test(id)) {
                $("#id").addClass("is-invalid");
                return false;
            } else {
                $("#id").removeClass("is-invalid");
                return true;
            }
        }

        // ��й�ȣ ��ȿ�� �˻� �Լ�
        function validatePassword() {
            var password = $("#password").val();
            var passwordRegex = /^[a-zA-Z0-9]{1,16}$/;
            if (!passwordRegex.test(password)) {
                $("#password").addClass("is-invalid");
                return false;
            } else {
                $("#password").removeClass("is-invalid");
                return true;
            }
        }

        function checkSubmit() {
            var id = $("#id").val();
            // ��ȿ�� �˻� ����
            if (validateId() && validatePassword()) {
                // ��ȿ�� �˻� ��� �� AJAX ��û
                console.log('duplicate check start...')
                $.ajax({
                    url: "/BankMVC/checkduplicateid.do", // �ߺ� ���̵� Ȯ���� ���� ���� ��û URL
                    method: "POST",
                    data: {id: id}, // �� ������ ����ȭ�Ͽ� ����
                    success: function(response) {
                        response = response.trim();
                        if (response === "duplicate") {
                            alert("�ߺ��� ���̵��Դϴ�. �ٸ� ���̵� ������ּ���.");
                        } else if (response === "success") {
                            // ��ȿ�� �˻�� �ߺ� ���̵� Ȯ�� ��� ��� �� ȸ������ ����
                            $("#signupForm")[0].submit();
                        }
                    }
                });
            }
            return false;
        }

        $(document).ready(function() {
            // ���̵�� ��й�ȣ �Է� �ʵ��� ��ȿ�� �˻�
            $("#id").on("input", function() {
                validateId();
            });

            $("#password").on("input", function() {
                validatePassword();
            });

            // ȸ������ ��� ���� �� ��ȿ�� �˻�
            $("#signupForm").on("submit", function(event) {
                event.preventDefault(); // �⺻ ���� ���� ����
            });
        });
        
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                    // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                    // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                    var addr = ''; // �ּ� ����
                    var extraAddr = ''; // �����׸� ����

                    //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                    if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                        addr = data.roadAddress;
                    } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                        addr = data.jibunAddress;
                    }

                    // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                    if(data.userSelectedType === 'R'){
                        // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                        // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                        if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                        document.getElementById("extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("extraAddress").value = '';
                    }

                    // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    $('#postcode').parent().addClass('field--not-empty')
                    $('#address').parent().addClass('field--not-empty')
                    $('#detailAddress').parent().addClass('field--not-empty')
                    $('#extraAddress').parent().addClass('field--not-empty')
                    // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                    document.getElementById("detailAddress").focus();
                }
            }).open();
        }
        
      
     
      /*  
        $(document).ready(function() {
        	$('#postbtn').click(function() {
        		$('#postcode').parent().addClass('field--not-empty')
        		alert('!!')
        	
        	})
        })
        */
        
        	//	if($('#postcode').val() != '')
        	//		$('#postcode').parent().addClass('field--not-empty')
        
        
    </script>
</head>
<body>
<!-- ======= Header ======= -->
<div>
 <jsp:include page="topMenu.jsp"/>
</div>
<!-- End Header -->
<div class="container" >
  <div class="d-lg-flex half">
    <div class="contents order-2 order-md-1">
      
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7" id="join">
            <div class="mb-4">
              <h3>ȸ������</h3>
              <p class="mb-4"></p>
            </div>
            <form action="/BankMVC/insertUserProcess.do" method="post" name="inputForm" id="signupForm" onsubmit="return checkSubmit()">
              <div class="row" id="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="username">ID</label>
                    <input type="text" class="form-control" id="id" name="id">
                  </div>
                  <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password">
                  </div>
                  <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email">
                  </div>
                  <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name">
                  </div>
                  <div class="form-group">
                    <label for="jumin">�ֹι�ȣ</label>
                    <input type="text" class="form-control" id="jumin" name="usercode">
                  </div>
                   <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone">
                  </div>
                  
                </div>
                <div class="col-md-6" id="rightbar">
                  
                  <div class="form-group">
                    <label for="postcode"><b>�����ȣã��</b></label>
                    <input type="button" class="form-control" id="postbtn" value='' onclick="execDaumPostcode()">
                  </div>
                  <div class="form-group">
                    <label for="postcode">�����ȣ</label>
                    <input type="text" name="postcode" class="form-control" id="postcode" placeholder="" readonly required>
                  </div>
                  <div class="form-group">
                    <label for="address">�ּ�</label>
                    <input type="text" name="address" class="form-control" id="address"  placeholder="" readonly required>
                  </div>
                  <div class="form-group">
                    <label for="detailAddress">���ּ�</label>
                    <input type="text" name="detailAddress" class="form-control" id="detailAddress" placeholder="" required>
                  </div>
                  <div class="form-group">
                    <label for="extraAddress">�����׸�</label>
                    <input type="text" name="extraAddress" id="extraAddress" class="form-control" placeholder="">
                  </div>
                  <input type="hidden" id="fulladdress" name="fulladdress" value="">
                  
                  <div class="form-group">
                    <label for="adminKey">������ ��ȣ Ű</label>
                    <input type="text" class="form-control" id="adminKey" name="usertype">
                  </div>
                </div>
              </div>
              <input type="submit" id="submitbtn" value="ȸ������" class="btn btn-block btn-primary">
            </form>
          </div>
        </div>
      
    </div>
  </div>
  
</div>
<!-- ======= footer ======= -->
  
 	<div>
     <jsp:include page="bottomMenu.jsp"/>
    </div>
    
    <!-- End footer -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="loginassets/js/jquery-3.3.1.min.js"></script>
<script src="loginassets/js/popper.min.js"></script>
<script src="loginassets/js/bootstrap.min.js"></script>
<script src="loginassets/js/main.js"></script>
</body>
</html>
