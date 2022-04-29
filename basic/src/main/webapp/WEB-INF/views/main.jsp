<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="./resources/js/jquery-3.3.1.min.js"></script>
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
<link rel="stylesheet" href="./resources/css/style4.css" type="text/css">

<style type="text/css">

header.header--normal{
	padding-left: 1%;
}

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

	<!-- Hero Section Begin 즐겨찾기 베스트-->
	<section class="hero set-bg"
		data-setbg="./resources/img/main/foodbackground2.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="hero__text">
						<div class="section-title">
							<h2>오늘은 무엇을 먹으러 갈까요?</h2>
							<p>나만의 맛집을 리스트로 ! 아.. 이걸 내가 먹어보았나?</p>
						</div>
						<div class="hero__search__form">
							<form action="listing.do">
								<input type="text" name="query" id="mainsearch" placeholder="지역,식당 또는 음식">
								
								<button type="submit" class="btn btn-danger">검색</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->


	<!-- Most Search Section Begin -->
	<section class="most-search spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>공개 맛집 리스트 Best</h2>
						<p>테마별 나만의 맛집을 추천해 드립니다.</p>
					</div>
				</div>
			</div>

			<div class="tab-content">
				<div class="tab-pane active" id="tabs-1" role="tabpanel">
					<div class="row">
						<c:forEach items="${fileName }" var="bookmark" begin="0" end="5">
							<div class="col-lg-4 col-md-6">
								<div class="listing__item">
									<a href="bookmarkDetail.do?listNumber=${bookmark.listNumber}&page=1">
									<div class="listing__item__pic set-bg" data-setbg="./resources/manager/upload/${bookmark.shopRealfname}"></div>
									</a>
									<div class="listing__item__pic__btns"></div>

									<div class="listing__item__text">
										<div class="listing__item__text__inside">
											<h5>${bookmark.listName }</h5>
											<div class="listing__item__text__rating">

												<span class="glyphicon glyphicon-heart"> 좋아요 수:
													${bookmark.listLike }</span>
											</div>
											<div>작성자: ${bookmark.memberNickname }</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Most Search Section End -->

<hr/>
<!-- Footer Section Begin -->
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
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery.nice-select.min.js"></script>
	<script src="./resources/js/jquery-ui.min.js"></script>
	<script src="./resources/js/jquery.nicescroll.min.js"></script>
	<script src="./resources/js/jquery.barfiller.js"></script>
	<script src="./resources/js/jquery.magnific-popup.min.js"></script>
	<script src="./resources/js/jquery.slicknav.js"></script>
	<script src="./resources/js/owl.carousel.min.js"></script>
	<script src="./resources/js/main.js"></script>
	<script src="https://kit.fontawesome.com/2173f645ed.js"></script>
</body>

</html>