<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String number=request.getParameter("listNumber"); %>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Directing Template">
<meta name="keywords" content="Directing, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!--제이쿼리 라이브러리  -->
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
<link rel="stylesheet" href="./resources/css/style.css" type="text/css">
<link rel="stylesheet" href="./resources/css/eun-bookmarkDetail.css"
	type="text/css">


<style type="text/css">
</style>
<script type="text/javascript">

//로그인 한 상태에서 하트를 클릭했을 때 (로그인한 상태인 하트의 <a></a> class명: heart-click)
$(document).ready(function() {
	var no = <%=number%>;
	var heartCheak = false;
	
	 $.ajax({
         url : 'heartTotalCount.do',
         type : 'post',
         data : {
             listNumber : no,
         },
     	contentType : 'application/x-www-form-urlencoded;charset=utf-8',
         success : function(result) {
        	 /* $('#heart'+no).text(result); */
        	 $('.hwana').text(result);
         },
         error : function(err) {
             //alert('서버 에러');
             //console.log(err);
         }
     });
	
	 $.ajax({
         url : 'heartCheak.do',
         type : 'post',
         data : {
             listNumber : no,
         },
     	contentType : 'application/x-www-form-urlencoded;charset=utf-8',
         success : function(result) {
        	 if(result == "yes"){
	        	 $('.heart').attr('class','glyphicon glyphicon-heart');
	        	 heartCheak = true;
        	 }
        	 
         },
         error : function(err) {
             //alert('서버 에러');
             //console.log(err);
         }
     });
	
	
	$(".heart-click").click(function() {
	
	    // 게시물 번호(no)를 idx로 전달받아 저장합니다.
	    let no = $(this).attr('id');
	    console.log("heart-click");
	    
	    // 빈하트를 눌렀을때
	    if(!heartCheak){
	        console.log("빈하트 클릭" + no);
	
	        $.ajax({
	            url : 'saveHeart.do',
	            type : 'get',
	            data : {
	                listNumber : no,
	            },
	        	contentType : 'application/x-www-form-urlencoded;charset=utf-8',
	            success : function(likeCount) {
	                //페이지 새로고침
						//alert(likeCount);
	                /* let heart = likeCount.listLike; */
	
	                // 페이지에 하트수 갱신
	                
	                /* $('#heart'+no).text(likeCount); */
	                $('.hwana').text(likeCount);
	                console.log("하트추가 성공");
	                console.log(likeCount);
	            },
	            error : function(err) {
	                //alert('서버 에러');
	               // console.log(err);
	            }
	        });
	        console.log("꽉찬하트로 바껴라!");
	
	        // 꽉찬하트로 바꾸기
	        $(this).children('span').attr('class','glyphicon glyphicon-heart')
	        heartCheak = true;
	        
	    // 꽉찬 하트를 눌렀을 때
	    }else if($(this).children('span').attr('class') == "glyphicon glyphicon-heart"){
	        console.log("꽉찬하트 클릭" + no);
	
	        $.ajax({
	            url : 'removeHeart.do',
	            type : 'get',
	            data : {
	            	listNumber : no,
	            },
	        	contentType : 'application/x-www-form-urlencoded;charset=utf-8',
	            success : function(likeCount) {
	                //페이지 새로고침
	                //document.location.reload(true);
					//alert(likeCount);
	                /* let heart = likeCount.listLike; */
	                // 페이지에 하트수 갱신
	                if(likeCount <= 0){
		              /*   $('#heart'+no).text(""); */
		                $('.hwana').text("");
	                }else{
		               /*  $('#heart'+no).text(likeCount); */
		                $('.hwana').text(likeCount);
	                }
	
	                console.log("하트삭제 성공");
	            },
	            error : function(err) {
	               // alert('서버 에러');
	                //console.log(err);
	            }
	        });
	        console.log("빈하트로 바껴라!");
	
	        // 빈하트로 바꾸기
	        $(this).children('span').attr('class','glyphicon glyphicon-heart-empty')
	        heartCheak = false;
	    }
	
	
	
	});
	
	
	// 로그인 안한 상태에서 하트를 클릭하면 로그인해야한다는 알림창이 뜹니다.
	// (로그인한 상태인 하트의 <a></a> class명: heart-notlogin)
	$(".heart-notlogin").unbind('click');
	$(".heart-notlogin ").click(function() {
	    alert('로그인 하셔야 하트를 누를수 있습니다!');
	   
	});
});
</script>
</head>
<body >
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



	<!-- Listing Section Begin -->
	<section class=" nice-scroll nuguri">
		
		<!-------------------------------------------------------------------------------------------------------  -->
		<c:forEach var="tmp" items="${bookmarkList }" begin='0' end='0'>
			<c:choose>
				<%-- 로그인 상태일때 - 하트 클릭 되게 --%>
				<c:when test="${not empty sessionScope.lognick}">
					<c:choose>
						<c:when test="${empty tmp.hno}">
							<%-- 빈 하트일때 --%>
							<div class='haha'>좋아요 클릭 수 : <span class="hwana"></span>
								<a id="${tmp.listNumber }" href="javascript:"
									class="heart-click heart_icon${tmp.listNumber }"><span
									class="heart glyphicon glyphicon-heart-empty"
									aria-hidden="true">${tmp.hno }</span></a>
							</div>
						</c:when>
						<c:otherwise>
							<%-- 꽉찬 하트일때 --%>
							<div class='haha'>좋아요 클릭 수 : <span class="hwana"></span>
								<a id="${tmp.listNumber }" href="javascript:"
									class="heart-click heart_icon${tmp.listNumber }"><span
									class="glyphicon glyphicon-heart" aria-hidden="true"></span></a>
							</div>
						</c:otherwise>
					</c:choose>
				</c:when>
				<%-- 로그인 상태가 아닐때  - 하트클릭 안되게 --%>
				<c:otherwise>
					<div class='haha'>좋아요 클릭 수 : <span class="hwana"></span>
						<a href="javascript:" class="heart-notlogin"> <span
							class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
						</a>
					</div>
				</c:otherwise>
			</c:choose>
			<%-- <div class="haha" ><span class="hidden" id="heart${tmp.listNumber }">${tmp.hno }</span></div> --%>
		</c:forEach>
		<!--------------------------------------------------------------------------------------------------------------  -->
		<section class="blog-section spad">
			<div class="container">
				<h4 id="listTitle">리스트 제목: ${BookmarkVO.listName }</h4>
				<hr/>
				<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<c:choose>
								<c:when test="${listCount eq 0 }">
								
									<div class="listing__item dogdog">
										<!--리뷰 목록 시작-->
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
							
							<c:forEach items="${bookmarkList }" var="bookmark"
								varStatus="status">

								<div class="col-lg-6 col-md-6">
									<div class="blog__item">
										<a href="listingDetails.do?shopNumber=${bookmark.shopNumber }"><div
												class="blog__item__pic set-bg"
												data-setbg="./resources/manager/upload/${bookmark.shopRealfname }"></div></a>
										<div class="blog__item__text">
											<ul class="blog__item__tags">
												<li><i class="fa-solid fa-utensils"></i></span>${bookmark.shopAddressSi}</li>
												<li>${bookmark.shopFood}</li>
											</ul>
											<h5>${bookmark.shopTitle}<a href="#"></a>
											</h5>
											<ul class="blog__item__widget">
												<li><i class="fa-solid fa-square-phone"></i>
													${bookmark.shopTel}</li>
												<li><i class="fa-solid fa-won-sign"></i></i>
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
									href="bookmarkDetail.do?listNumber=<%=number %>&page=${paging.page-1 }"></i>
									Pre</a>
							</c:if>
							<c:forEach begin="1" end="${paging.pageTotalCount  }"
								var="pageNum">
								<a
									href="bookmarkDetail.do?listNumber=<%=number %>&page=${pageNum }">${pageNum }</a>
							</c:forEach>
							<c:if test="${paging.page <paging.pageTotalCount}">
								<a
									href="bookmarkDetail.do?listNumber=<%=number %>&page=${paging.page+1 }">Next<i
									class="fa fa-long-arrow-right"></i></a>
							</c:if>
						</div>
					</div>

				</div>
			</div>
		</section>
	</section>

	<!-- Js Plugins -->
	<script src="https://kit.fontawesome.com/2173f645ed.js"></script>
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

</body>
</html>