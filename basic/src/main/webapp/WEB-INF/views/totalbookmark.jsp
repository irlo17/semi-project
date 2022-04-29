<%@page import="com.team04.dao.BookmarkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.team04.dao.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Directing Template">
<meta name="keywords" content="Directing, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
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
<link rel="stylesheet" href="./resources/css/style3.css" type="text/css">
<link rel="icon" type="image/png"
	href="../resources/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="./resources/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="./resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="./resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="./resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="./resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css" href="./resources/css/util.css">
<link rel="stylesheet" type="text/css"
	href="./resources/css/ehmainabout.css">
<link rel="stylesheet" type="text/css"
	href="./resources/css/eun-total.css">
<style type="text/css">
</style>

</head>

<body>
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

	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-area set-bg"
		data-setbg="img/breadcrumb/bookmark.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>
							공개 맛집 리스트 <i class="fa-solid fa-bowl-food"></i>
						</h2>
						<div class="breadcrumb__option">
							<a href="main.do"><i class="fa fa-home"></i> Home</a> <span>맛집
								리스트</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!--table------------------------------------->

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">


				<div class="table100 ver2 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">번호</th>
									<th class="cell100 column2">리스트 제목</th>
									<th class="cell100 column3">닉네임</th>
									<th class="cell100 column4">좋아요 수</th>

								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>



								<c:forEach items="${bookmarkList }" var="bookmark"
									varStatus="status">
									<tr class="row100 body">
										<td class="cell100 column1">
											${status.count+((paging.page-1)*10)}</td>
										<td class="cell100 column2"><a
											href="bookmarkDetail.do?listNumber=${bookmark.listNumber}&page=1">${bookmark.listName }</a></td>
										<td class="cell100 column3">${bookmark.memberNickname }</td>
										<td class="cell100 column4">${bookmark.listLike }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<!-- 검색버튼 -->

				<form class="form" action="totalbookmark.do">

					<div>
						<select name='searchCondition'>
							<option value="list_name">제목</option>
							<option value="member_nickname">닉네임</option>
						</select> <span class=col-md-2><input type='text'
							name='searchKeyword' id='search'></span> <input type="hidden"
							name="page" value="1" /> <span class=col-md-4><input
							type='submit' value='검색' id='searchb' class='btn btn-danger'></span>
					</div>

				</form>
				
				<div class="blog__pagination">
					<c:if test="${empty searchKeyword}">
						<c:if test="${paging.page > 1 }">
							<a href="totalbookmark.do?page=${paging.page-1 }"></i> Pre</a>
						</c:if>
						<c:forEach begin="1" end="${paging.pageTotalCount  }"
							var="pageNum">
							<a href="totalbookmark.do?page=${pageNum }">${pageNum }</a>
						</c:forEach>
						<c:if test="${paging.page < paging.pageTotalCount}">
							<a href="totalbookmark.do?page=${paging.page+1 }">Next<i
								class="fa fa-long-arrow-right"></i></a>
						</c:if>
					</c:if>
					<c:if test="${not empty searchKeyword}">
						<c:if test="${paging.page > 1 }">
							<a
								href="totalbookmark.do?page=${paging.page-1 }&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}"></i>
								Pre</a>
						</c:if>
						<c:forEach begin="1" end="${paging.pageTotalCount  }"
							var="pageNum">
							<a
								href="totalbookmark.do?page=${pageNum }&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${pageNum }</a>
						</c:forEach>
						<c:if test="${paging.page <paging.pageTotalCount}">
							<a
								href="totalbookmark.do?page=${paging.page+1 }&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">Next<i
								class="fa fa-long-arrow-right"></i></a>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>
	</div>


	<!-- Footer Section Begin -->
	<hr/>
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="main.do"><img
								src="resources/pageSpinner/logo/logo.png" width="100%" height="70px" alt=""></a>
						</div>
						<p> Eat, Share, Be Happy.

						</p>
					</div>
				</div>
				<div class="col-lg-4 offset-lg-1 col-md-6">
					<div class="footer__address">
						<ul>
							<li><span>전화번호:</span>
								<p>02-2025-8523</p></li>
							<li><span>Email:</span>
								<p>info.colorlib@gmail .com</p></li>
							<li><span>주소:</span>
								<p>서울 금천구 가산디지털2로 123 월드메르디앙벤처센터II 4층 413호</p></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 offset-lg-1 col-md-6">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								 KOSMO. All rights reserved
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<div class="footer__copyright__links">
							<!-- <a href="#">Terms</a> <a href="#">Privacy Policy</a> <a href="#">Cookie
								Policy</a> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

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
	<script src="./resources/js/main2.js"></script>
	<script src="./resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/popper.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="./resources/vendor/select2/select2.min.js"></script>
	<script src="./resources/js/eun-total.js"></script>
	<script
		src="./resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script type="text/javascript">

	</script>
	<script src="./resources/js/table.js"></script>
	<script src="https://kit.fontawesome.com/2173f645ed.js"></script>

</body>

</html>