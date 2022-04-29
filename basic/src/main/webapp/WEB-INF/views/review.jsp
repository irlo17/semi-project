<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	/* 세션값 가져오기 (닉네임) */
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("lognick"); 
	request.getSession().setAttribute("id", id);  
	System.out.println(id);
%>





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
<link rel="stylesheet" href="resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/flaticon.css" type="text/css">
<link rel="stylesheet" href="resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/barfiller.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<link rel="stylesheet" href="resources/pageSpinner/review.css" type="text/css">
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
				<div class="col-lg-3 col-md-3">
					<div class="header__logo">
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
	<!--왼쪽 네비바-->
	<div class="filter nice-scroll col-md-3 categori">
		<div class="filter__title">
         <div class="box">
            <c:choose>
               <c:when test="${ empty MemberVO.memberFname }">
                  <img class="memberFile profile" src="./resources/upload/KakaoTalk_20220107_103421413_01.jpg">
               </c:when>
               <c:otherwise>
                  <img class="memberFile profile" src="./resources/upload/${MemberVO.memberRealfname }">
               </c:otherwise>
            </c:choose>
         	
         </div>
        
         <h5 class="nick">
            ${sessionScope.lognick }
         </h5>
      </div>
	<div id="realNav">
			<div class="categori">
				<!-- <h4>회원정보</h4>-->
			<h4><a href="mypageMember.do">회원정보</a></h4>
			</div>
			<hr />


			<div class="categori">
				<!--   <h4>즐겨찾기</h4>-->
			<h4><a href="mylist.do?page=1">즐겨찾기</a></h4>
			</div>
			<hr />

			<div class="categori" id="check">
				<!--   <h4>리뷰관리</h4>-->
				<h4><a href="review.do">리뷰관리</a></h4>
			</div>
	</div>

			<div class="categori" id="outlog">
			<hr />
				<a href="logout.do">로그아웃</a>
			</div>
	

	</div>
	<!-- Filter End -->

	<!-- Listing Section Begin -->
	<section class=" nice-scroll nuguri">
		<div class="listing__text__top col-md-12 dogdog">
			<div class="listing__text__top__left fa fa-pencil-square fa-2x">
				<h5></h5>

			</div>
		</div>
		
		
		<div class="listing__text__top col-md-12 dogdog">
			<div class="listing__text__top__left fa fa-pencil-square fa-2x">
				<h5>리뷰 관리</h5>

			</div>
		</div>

		<c:forEach items="${reviewList }" var="review">
		
		<div class="listing__list">
		
			<c:set var="listCount" value="${listCount }"/>
			
				<c:choose>
					<c:when test="${  listCount >0}">
			
				<div class="listing__item dogdog"> <!--리뷰 목록 시작-->

					<div class="col-md-4 inline-block">
						<div style="font-weight: bold; font-size: 1.5em;"
							class="shop_name">가게명: ${review.SHOPTITLE}</div>
						<div class="review_img">
						
						<c:set var="email" value="${sessionScope.logemail}" />
                                    <c:choose>
                                    	<c:when test="${sessionScope.logemail eq review.MEMBEREMAIL}">
                                        <img width="350" height="300"   src="resources/reviewUpload/${review.REVIEWREALFNAME }">
                                        </c:when>
                                        <c:otherwise>
                                      	 <img width="350" height="300"   src="resources/reviewUpload/${review.REVIEWREALFNAME }">
                                      	
                                        </c:otherwise>
                                   </c:choose>
						
							
							
						</div>
					</div>
					<div class="col-md-3 inline-block max-width1">
						<form action= 'reviewUpdate.do?reviewNumber=${review.REVIEWNUMBER }' method="post">
							<!-- to-do 이미지 사용자마다 다르게 해야함 -->
							<div class="text-left img_button">
								<div>
								
								
									<div class="listing__details__comment__item__rating">
													${review.REVIEWGRADE }
													<c:if test="${review.REVIEWGRADE eq '맛있어요' }">
														<i class="fa fa-thumbs-up tasteGrade" aria-hidden="true"></i>
													</c:if>
													<c:if test="${review.REVIEWGRADE eq '보통이에요' }">
														<i class="fa fa-meh-o tasteGrade" aria-hidden="true"></i>
													</c:if>
													<c:if test="${review.REVIEWGRADE eq '맛없어요' }">
														<i class="fa fa-thumbs-down" aria-hidden="true"></i>
													</c:if>


												</div>
								</div>

								<div>
								 <button type="submit" 
									class="btn btn-primary modi_dele_button1 modi_dele_button modify_button" > 수정</button> 
									 <a href="reviewDelete.do?reviewNumber=${review.REVIEWNUMBER }"><input type='button'class="btn btn-danger modi_dele_button delete_button" size='6' value="삭제"></a>
									 </div>
							</div>

							<textarea class=" hb300" name = 'reviewContent'>${review.REVIEWCONTENT}</textarea>
							
						</form>
						
					</div>
				</div>		<!--리뷰 목록 끝-->
				</c:when>
				</c:choose>
		</div>
		
	</c:forEach>
	
	
	
	<c:choose>
		<c:when test="${listCount eq 0 }">
				
									<div class="listing__item dogdog"> <!--리뷰 목록 시작-->

					<div class="col-md-8 inline-block">
						<div style="font-weight: bold; font-size: 3em;"
							class="shop_name noReview" ><img id="jjanggu" src="./resources/images/jjanggu2.PNG"/> <div id="addcoment">등록하신 리뷰가 없습니다.<br/>&nbsp;&nbsp;&nbsp;리뷰를 등록해주세요!</div></div>
							</div>
							</div>
							
							
							
						
							
							
					</c:when>	
	</c:choose>








	</section>


	<!-- Js Plugins -->
	<script src="https://kit.fontawesome.com/2173f645ed.js" ></script>
	
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.nice-select.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script src="resources/js/jquery.nicescroll.min.js"></script>
	<script src="resources/js/jquery.barfiller.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/jquery.slicknav.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/main.js"></script>
	<script src="resources/pageSpinner/review.js"></script>
	
</body>

</html>