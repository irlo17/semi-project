<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="./resources/member/fonts/icomoon/style.css">

    <link rel="stylesheet" href="./resources/member/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./resources/member/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="./resources/member/css/style.css">
    
    <!-- userStyle : 안정은 -->
    <link rel="stylesheet" href="./resources/member/css/userStyle.css">

    <title>비밀번호 찾기</title>
  </head>
  <body>
  	
  <div class="content">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-12">
              <div class="form-block">
                  <div class="mb-4">
                  <h3 id="titleCenter"><strong>비밀번호 찾기</strong></h3>
                  <div class="errorBox">
                  <strong><span class="error_box pwSearch"></span></strong>
                  </div>
                  <p class="mb-4"></p>
                </div>
                <form id="pwSearchForm" action="pwSearch.do" method="post" name="pwSearchForm">
                
                  <!-- EMAIL -->
                  <div class="form-group first field--not-empty">
                  	<div class="email_check col-md-9">
                    	<label for="memberEmail">이메일&nbsp; &nbsp; &nbsp; &nbsp;<span class="error_box"></span></label>
                    	<input type="email" class="form-control" id="memberEmail" name="memberEmail">
                    </div>
                    <!-- email_check는 css에서 사용됨 -->
                    <div class='email_Send col-md-3'>
                    	<!-- emailCheck.do로 넘어간다. -->
                    	<button type="button" id="btn_emailSend"class="btn_check btn-pill btn-danger"><span class="text-white btn_text">인증번호</span></button>
                   	</div>
                  </div>
                  
                 <!--  -->
                  <div class="form-group first field--not-empty">
                    <label for="authenticationNumber">인증번호 확인&nbsp; &nbsp; &nbsp; &nbsp;<span class="error_box"></span></label>
                    <input type="text" class="form-control" id="authenticationNumber" >
                  </div>
                  

                  
                  <!-- BTN PW CHANGE -->              
                  <input type="button" id="btnPwSearch" value="비밀번호 찾기" class="btn btn-pill text-white btn-block btn-danger">
                  <div class="d-flex mb-5 align-items-center" id="homeGO">
                    <label class="control control--checkbox mb-0">
                    	<span class="caption"></span>
                    </label>
                    
                    <!-- BTN LOGIN -->
                 <span class=""><a href="main.do" class="forgot-pass">홈 화면으로 가기</a></span>
                 <span class="ml-auto"><a href="loginForm.do" class="forgot-pass">로그인 하기</a></span> 
                  </div>

                </form>
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
    </div>
  </div>


  
  
    <script src="./resources/member/js/jquery-3.3.1.min.js"></script>
    <script src="./resources/member/js/popper.min.js"></script>
    <script src="./resources/member/js/bootstrap.min.js"></script>
    <script src="./resources/member/js/main.js"></script>
    <script src="./resources/member/js/member.js"></script>
  </body>
</html>