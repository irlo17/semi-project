<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String listNumber2 = request.getParameter("listNumber");
		
%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Directing Template">
<meta name="keywords" content="Directing, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Directing | Template</title>

<!-제이쿼리 라이브러리-  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
<link rel="stylesheet" href="./resources/member/css/userStyle.css">
<link rel="stylesheet" href="./resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="./resources/css/style.css" type="text/css">
<link rel="stylesheet" href="./resources/css/eun-detailModify.css"
	type="text/css">

<script type="text/javascript">
$(function(){
	//모달 창 띄우기
    $("#popbutton").click(function(){
        $('div.modal').modal();
    });
    
    // 가게 이동 버튼이 눌렸을 때 -> 가게 번호와 리스트 번호를 모달창 안으로 넘긴다
    var chk_arr = [];
	$('#btnShopList').click(function(){
   		 $(".shopNumber:checked").each(function(){
   		 var chk = $(this).val();
   		 console.log(chk);
   		 chk_arr.push(chk);
   		 }) 
	});
	$("#listMove").click(function name() {
   		 for( var snum of chk_arr ){
			var lnum= $("#listNumber:checked").val();	
			$(location).attr('href', "mylistUpdate.do?shopNumber="+snum+"&listNumber="+lnum+"&listNumber2="+<%=listNumber2%>);
	 	 
   		 
   		 }  
   		
   	 
   		
   		 
	});
	
	$("#btnDelete").click(function(){
		 var chk_arr = [];
		 $(".shopNumber:checked").each(function(){
			 var chk = $(this).val();
			 chk_arr.push(chk);
		 });
		 for( var snum of chk_arr ){
			 $(location).attr('href', "mylistDelete.do?shopNumber="+snum+"&listNumber="+<%=listNumber2%>);
		 }
	});
	
	  
})

</script>
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
						<a href="main.do"><img
							src="./resources/images/mucksanglogo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-9 col-md-9">
					<div class="header__nav">

						<div class="header__menu__right">
							<a href="totalbookmark.do?page=1" class="primary-btn btn-danger"><i
								class="fa-solid fa-utensils"></i>&nbsp;&nbsp;맛집 리스트</a> <a
								href="login.do" class="login-btn"><i class="fa fa-user"></i></a>
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
				<c:choose>
					<c:when test="${ empty MemberVO.memberFname }">
						<img class="memberFile"
							src="./resources/upload/KakaoTalk_20220107_103421413_01.jpg">
					</c:when>
					<c:otherwise>
						<img class="memberFile"
							src="./resources/upload/${MemberVO.memberRealfname }">
					</c:otherwise>
				</c:choose>

			</div>
			<h5 class="nick">${sessionScope.lognick }</h5>
		</div>

		<div id="realNav">
			<div class="categori">
				<h4>
					<a href="mypageMember.do">회원정보</a>
				</h4>
			</div>
			<hr />
			<div class="categori" id="check">
				<h4>
					<a href="mylist.do?page=1">즐겨찾기</a>
				</h4>
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
	<section class=" nice-scroll nuguri">
		<div id='btnl'>
			<button id="btnDelete" class='btn btn-warning'>가게목록 삭제</button>
			<button class="btn btn-danger" id="btnShopList"
				data-target="#layerpop" data-toggle="modal">가게목록 이동</button>
		</div>
		<section class="blog-section spad">
			<div class="container">
				<h4 id="listTitle">리스트 제목: ${BookmarkVO.listName }</h4>
				<hr />
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<c:choose>
								<c:when test="${listCount eq 0 }">
									<div class="listing__item dogdog">
										<div>
											<div style="font-weight: bold; font-size: 3em;"
												class="shop_name noReview">
												<img id="jjanggu" src="./resources/images/jjanggu2.PNG" />
												<div id="addcoment">
													추가하신 맛집이 없습니다.<br />&nbsp;&nbsp;&nbsp;맛집을 추가해주세요!
												</div>
											</div>
										</div>
									</div>
								</c:when>
							</c:choose>
							<c:forEach items="${bookmarkModify }" var="bookmark"
								varStatus="status">

								<div class="col-lg-6 col-md-6">
									<input type="checkbox" class="shopNumber" name="shopNumber"
										value="${bookmark.shopNumber}">
									<div class="blog__item">
										<a
											href="listingDetails.do?shopNumber=${bookmark.shopNumber }&page=1">
											<div class="blog__item__pic set-bg"
												data-setbg="./resources/manager/upload/${bookmark.shopRealfname }"></div>
										</a>
										<div class="blog__item__text">
											<ul class="blog__item__tags">
												<li><i class="fa-solid fa-utensils"></i>${bookmark.shopAddressSi}</li>
												<li>${bookmark.shopFood}</li>
											</ul>
											<h5>${bookmark.shopTitle}<a href="#"></a>
											</h5>
											<ul class="blog__item__widget">
												<li><i class="fa-solid fa-square-phone"></i>
													${bookmark.shopTel}</li>
												<li><i class="fa-solid fa-won-sign"></i>
													${bookmark.shopPriceRange }</li>
											</ul>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						
						
						<div class="blog__pagination">
							<c:if test="${paging.page > 1 }">
								<a
									href="detailModify.do?listNumber=<%=listNumber2 %>&page=${paging.page-1 }"></i>
									Pre</a>
							</c:if>
							<c:forEach begin="1" end="${paging.pageTotalCount  }"
								var="pageNum">
								<a
									href="detailModify.do?listNumber=<%=listNumber2 %>&page=${pageNum }">${pageNum }</a>
							</c:forEach>
							<c:if test="${paging.page <paging.pageTotalCount}">
								<a
									href="detailModify.do?listNumber=<%=listNumber2 %>&page=${paging.page+1 }">Next<i
									class="fa fa-long-arrow-right"></i></a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</section>
	</section>

	<!--modal------------------------------------------------------------------------------>
	<div class="modal fade" id="layerpop">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->

				<div class="modal-header">
					<!-- header title -->
					<h5 class="modal-title">
						<i class="fa-solid fa-star"></i> 나의 즐겨찾기 리스트
					</h5>
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<!-- body -->
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th>선택</th>
								<th>번호</th>
								<th>리스트제목</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${bookmarkList }" var="bookmark"
								varStatus="status">
								<tr class="active">
									<th scope="row">&nbsp;&nbsp;<input type="radio"
										id="listNumber" name="listNumber"
										value='${bookmark.listNumber }'></th>
									<td>${bookmark.listNumber }</td>
									<td>${bookmark.listName}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<!-- modal Footer -->
				<div class="modal-footer">
					<input type="button" id="listMove" value="이동"
						class="btn btn-warning" />
				</div>
			</div>
		</div>
	</div>

	<!-- Js Plugins -->
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
	<script src="./resources/js/en-detailModify.js"></script>
	<script src="https://kit.fontawesome.com/2173f645ed.js"></script>


</body>

</html>