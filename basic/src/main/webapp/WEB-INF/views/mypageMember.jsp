<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="memberFile"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Directing Template">
<meta name="keywords" content="Directing, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<title>Directing | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/flaticon.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/barfiller.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/style.css"
	type="text/css">

<!-- member/css 추가 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./resources/member/fonts/icomoon/style.css">
<link rel="stylesheet" href="./resources/member/css/owl.carousel.min.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="./resources/member/css/bootstrap.min.css">
<!-- Style -->
<link rel="stylesheet" href="./resources/member/css/style.css">
<!-- userStyle : 안정은 -->
<link rel="stylesheet" href="./resources/member/css/userStyle.css">


</head>

<body class="ov-hid">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<header class="header header--normal">

		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3 col-md-3 ">
					<div class="header__logo mucksanglogo" id="mucksanglogo">
						<a href="main.do"><img id="logoImg"src="./resources/images/mucksanglogo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-9 col-md-9">
					<div class="header__nav">

						<div class="header__menu__right">
							<a href="totalbookmark.do?page=1" class="primary-btn btn-danger"><i class="fa-solid fa-utensils"></i>&nbsp;&nbsp;맛집 리스트</a>
			 			<a href="login.do" class="login-btn"><i class="fa fa-user"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div id="mobile-menu-wrap"></div>
		</div>
	</header>
	<!-- Header Section End -->

	<!-- Filter Begin -->
	<div class="filter nice-scroll ">
		<div class="filter__title">
			<div class="box">
				<memberFile:choose>
					<memberFile:when test="${ empty MemberVO.memberFname }">
						<img class="memberFile" src="./resources/upload/KakaoTalk_20220107_103421413_01.jpg">
					</memberFile:when>
					<memberFile:otherwise>
						<img class="memberFile" src="./resources/upload/${MemberVO.memberRealfname }">
					</memberFile:otherwise>
				</memberFile:choose>
			
			</div>
			<h5 class="nick">
				${sessionScope.lognick }
			</h5>
		</div>
		
	
	<div id="realNav">
		<div class="categori" id="check">
			<h4>
				<a href="mypageMember.do">회원정보</a>
			</h4>
		</div>
		<hr />


		<div class="categori">
			<h4><a href='mylist.do?page=1'>즐겨찾기</a></h4>

		</div>
		<hr />

		<div class="categori">
			<h4>
				<a href="review.do">리뷰관리</a>
		</h4>

		</div>
	</div>
			<div class="categori" id="outlog">
			<hr />
				<!--  <h4>로그아웃</h4>-->
				<a href="logout.do">로그아웃</a>

			</div>

	</div>
	<!-- Filter End -->

	<!-- Listing Section Begin -->
	<section class=" nice-scroll nuguri col-md-12">
		<div class="frm">
			<div class="form-block formBlock">
				<h1 class="memberTitle">내 정보 수정</h1>

				<!-- FORM -->
				<form action="memberUpdate.do" method="post" id="memberUpdateForm" name="memberUpdateForm" enctype="multipart/form-data">
					
					
					<!-- 프로필 사진 -->
					<div class="form-group first memberFileForm">
						<div class="box" >
							<memberFile:choose>
								<memberFile:when test="${ empty MemberVO.memberFname }">
									<img class="memberFile" src="./resources/upload/KakaoTalk_20220107_103421413_01.jpg">
								</memberFile:when>
								<memberFile:otherwise>
									<img class="memberFile" src="./resources/upload/${MemberVO.memberRealfname }">
								</memberFile:otherwise>
							</memberFile:choose>
						</div>
							<label class="label mFile btn-danger" for="memberFile">프로필 사진 수정</label> 
							<input type="file" class="form-control formInt" id="memberFile" name="memberFile" required> <span class="error_box"></span>
					</div>
					
					<!-- NICKNAME -->
					<div class="form-group first field--not-empty">
						<label class="label" for="memberNickname">닉네임&nbsp; &nbsp; &nbsp;&nbsp;<span class="error_box"></span></label> 
						<input type="text" class="form-control form_nick formInt" id="memberNickname" name="memberNickname" value="${MemberVO.memberNickname }" >
					</div>

					<!-- EMAIL -->
					<div class="form-group first field--not-empty">
						<label class="label" for="memberEmail">이메일</label> 
						<input type="text" class="form-control formInt" id="memberEmail" name="memberEmail" value="${MemberVO.memberEmail }" readonly>
					</div>

					<!-- PW -->
					<div class="form-group first field--not-empty">
						<label class="label" for="memberPassword">비밀번호 변경&nbsp; &nbsp; &nbsp;&nbsp;<span class="error_box"></span></label> 
						<input type="password" class="form-control formInt" id="memberPassword" name="memberPassword">
					</div>

					<!-- PW CHECK -->
					<div class="form-group first field--not-empty">
						<label class="label" for="passwordCheck">변경된 비밀번호 재확인 &nbsp; &nbsp; &nbsp;&nbsp;<span class="error_box"></span></label> 
						<input type="password" class="form-control formInt" id="passwordCheck">
					</div>

					<!-- NAME -->
					<div class="form-group first field--not-empty">
						<label class="label" for="memberName">이름&nbsp; &nbsp; &nbsp; &nbsp;<span class="error_box"></span></label> 
						<input type="text" class="form-control formInt" id="memberName" name="memberName" value="${MemberVO.memberName }" readonly> 
					</div>

					<!-- BIRTH -->
					<div class="form-group first field--not-empty">
						<label class="label" for="memberBirth">생년월일&nbsp; &nbsp; &nbsp; &nbsp;<span class="error_box"></span></label> 
						<input type="date" class="form-control formInt" id="memberBirth" name="memberBirth" value="${MemberVO.memberBirth }" readonly> 
					</div>


					<!-- TEL -->
					<div class="form-group first field--not-empty">
						<label class="label" for="memberTel">휴대전화&nbsp; &nbsp; &nbsp; &nbsp;<span class="error_box"></span></label> 
						<input type="tel" class="form-control formInt" id="memberTel" name="memberTel" value="${MemberVO.memberTel }"> 
					</div>
					

				
					<input type="button" value="회원정보수정" id="btnMemberUpdate" class="btn btn-pill text-white btn-block btn-danger">
					
					<hr/>
					<br/>
				</form>
				<form action="memberDelete.do" method="post" id="memberDelete" name="memberDelete">
					<input type="hidden" class="memberEmail" name="memberEmail" value="${MemberVO.memberEmail }">
					<input type="hidden" class="memberPassword" name="memberPassword" value="${MemberVO.memberPassword }">
					<div class="btnMemberDelete">
					<input type="button" value="회원탈퇴" id="btnMemberDelete" name="btnMemberDelete">
					</div>
				</form>
			</div>
		</div>

	</section>
	<!-- Listing Section End -->


	<!-- Js Plugins -->
	<script src="https://kit.fontawesome.com/2173f645ed.js" ></script>
	
	<script src="./resources/js/jquery-3.3.1.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery.nice-select.min.js"></script>
	<script src="./resources/js/jquery-ui.min.js"></script>
	<script src="./resources/js/jquery.nicescroll.min.js"></script>
	<script src="./resources/js/jquery.barfiller.js"></script>
	<script src="./resources/js/jquery.magnific-popup.min.js"></script>
	<script src="./resources/js/jquery.slicknav.js"></script>
	<script src="./resources/js/owl.carousel.min.js"></script>
	<script src="./resources/js/main.js"></script>

	<!-- member.js -->
	<script src="./resources/member/js/jquery-3.3.1.min.js"></script>
    <script src="./resources/member/js/popper.min.js"></script>
    <script src="./resources/member/js/bootstrap.min.js"></script>
    <script src="./resources/member/js/main.js"></script>
    <script src="./resources/member/js/member.js"></script>
</body>

</html>