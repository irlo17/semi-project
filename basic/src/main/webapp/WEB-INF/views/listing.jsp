<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<!DOCTYPE html>
<html lang="zxx">
  <head>
    <meta charset="UTF-8" />
    <meta name="description" content="Directing Template" />
    <meta name="keywords" content="Directing, unica, creative, html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Directing | Template</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Google Font -->
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700;800&display=swap"
      rel="stylesheet"
    />

    <!-- Css Styles -->
    <link
      rel="stylesheet"
      href="./resources/css/bootstrap.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="./resources/css/font-awesome.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="./resources/css/elegant-icons.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="./resources/css/flaticon.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="./resources/css/nice-select.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="./resources/css/barfiller.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="./resources/css/magnific-popup.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="./resources/css/jquery-ui.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="./resources/css/owl.carousel.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="./resources/css/slicknav.min.css"
      type="text/css"
    />
    <link rel="stylesheet" href="./resources/css/style.css" type="text/css" />

    <style>
      ul {
        list-style: none;
        padding-left: 0px;
      }
    </style>

    <style>
      .customoverlay {
        position: relative;
        bottom: 85px;
        border-radius: 6px;
        border: 1px solid #ccc;
        border-bottom: 2px solid #ddd;
        float: left;
      }

      .customoverlay:nth-of-type(n) {
        border: 0;
        box-shadow: 0px 1px 2px #888;
      }

      .customoverlay a {
        display: block;
        text-decoration: none;
        color: #000;
        text-align: center;
        border-radius: 6px;
        font-size: 14px;
        font-weight: bold;
        overflow: hidden;
        background: #ed7a64;
        background: #ed7a64
          url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
          no-repeat right 14px center;
      }
      
        .customoverlay a:hover {
        display: block;
        text-decoration: none;
        color: #000;
        text-align: center;
        border-radius: 6px;
        font-size: 14px;
        font-weight: bold;
        overflow: hidden;
        background: #d6524f;
        background: #d6524f
          url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
          no-repeat right 14px center;
      }

      .customoverlay .title {
        display: block;
        text-align: center;
        background: #fff;
        margin-right: 35px;
        padding: 10px 15px;
        font-size: 14px;
        font-weight: bold;
      }

      .customoverlay:after {
        content: "";
        position: absolute;
        margin-left: -12px;
        left: 50%;
        bottom: -12px;
        width: 22px;
        height: 12px;
        background: url("https://t1.daumcdn.net/local./resources/img/localimages/07/mapapidoc/vertex_white.png");
      }
      header.header--normal{
			padding-left: 1%;
	  }
    </style>
  </head>

  <!--직접 만든 css-->
  <link rel="stylesheet" href="./resources/css/yang.css" type="text/css" />
  <!-- 모달창 슬라이드 기능  -->
  <link rel="stylesheet" href="./resources/css/slide2.css" />

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
              <a href="main.do"
                ><img id="shopListLogo" src="./resources/images/mucksanglogo.png" alt=""
              /></a>
            </div>
          </div>
          <div class="col-lg-9 col-md-9">
            <div class="header__nav">
              <div class="header__menu__right">
                <a href="totalbookmark.do?page=1" class="primary-btn"><i class="fa-solid fa-utensils"></i>&nbsp;&nbsp;맛집 리스트</a>
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
    <div class="filter nice-scroll">
      <div class="filter__title">
        <h5>
          <i class="fa fa-filter"></i>
          <span id="filter-modal-open">Filter</span>
        </h5>
      </div>
      <hr />
      <form action="listingFilter2.do">
      <div class="filter__search">
        <input
          id="search"
          name="query2"
          type="text"
          placeholder="검색어를 입력하세요"
          value="${param.query}"
        />
      </div>
      <div class="filter__location">
        <input id="myLocation" type="text" placeholder="내 위치" readonly="readonly"/>
        <i class="fa fa-map-marker"></i>
      </div>
      
      <div class="filter__radius">
        <p>반경 :</p>
        <div class="price-range-wrap">
          <div
            class="price-range-radius ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
          >
            <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
            <span
              tabindex="0"
              class="ui-slider-handle ui-corner-all ui-state-default"
            ></span>
          </div>
          <div class="range-slider">
            <div class="price-input">
              <input type="text" id="radius"/>
            </div>
          </div>
        </div>
      </div>

      <div class="filter__tags">
        <h6>선택</h6>
 
        <label for="parking">
          주차 <input type="checkbox" id="parking"/>
          <span class="checkmark"></span>
        </label>
        <!-- <label for="open">
          영업중 <input type="checkbox" id="open"/>
          <span class="checkmark"></span>
        </label> -->
      </div>
      
		<div class="filter__btns">
			<button id="filter-search" type="submit" class="filter__reset">
				검색
			</button>
		</div>
		
      <input id="myLat" name="myLat" hidden="hidden"/>
      <input id="myLon" name="myLon" hidden="hidden"/>
      <input id="radiusInput" name= "radiusInput" hidden="hidden"/>
      <input name="koreanFood" value="${param.koreanFood}" hidden="hidden"/>
      <input name="japaneseFood" value="${param.japaneseFood}" hidden="hidden"/>
      <input name="chineseFood" value="${param.chineseFood}" hidden="hidden"/>
      <input name="westernFood" value="${param.westernFood}" hidden="hidden"/>
      <input name="worldFood" value="${param.worldFood}" hidden="hidden"/>
      <input name="buffet" value="${param.buffet}" hidden="hidden"/>
      <input name="cafe" value="${param.cafe}" hidden="hidden"/>
      <input name="pup" value="${param.pup}" hidden="hidden"/>
    
      <!--가격대 value 들어가는 곳-->
      <input name="manwonLess" value="${param.manwonLess}" hidden="hidden"/> 
      <input name="manwonMore" value="${param.manwonMore}" hidden="hidden"/>
      <input name="threeManwonMore" value="${param.threeManwonMore}" hidden="hidden"/>
      <input name="fiveManwonMore"  value="${param.fiveManwonMore}" hidden="hidden"/>
      
      <!-- 주소 value 들어가는곳 -->
      <input name="shopAddressSi"  value="${param.shopAddressSi}" hidden="hidden"/>
      <input name="shopAddressGu"  value="${param.shopAddressGu}" hidden="hidden"/>
      <input name="parking" id="parkingInput" hidden="hidden"/>
      <input name="open" id="openInput" hidden="hidden"/>
      </form>
      <div class="filter__btns">
        <a href="listingCancel.do"><button type="submit" class="filter__reset">전체 선택 취소</button></a>
      </div>
    </div>
    <!-- Filter End -->

    <!-- Listing Section Begin -->
    <section class="listing nice-scroll">
      <!--필터 모달창-->
      <div class="filter-modal">
        <div class="modal_body">
          <img id="closeImg" src="./resources/img/modal/closeImg.jpg" />
          <div>
            <h4>나만의 맛집 고르기</h4>
            <hr />
            <div class="food_kind_all">
              <img
                id="koreanFood"
                class="food_kind"
                src="./resources/img/modal/koreanFood.png"
                value="한식"
              />
              <img
                id="japaneseFood"
                class="food_kind"
                src="./resources/img/modal/japaneseFood.png"
                value="일식"
              />
              <img
                id="chineseFood"
                class="food_kind"
                src="./resources/img/modal/chineseFood.png"
                value="중식"
              />
              <img
                id="westernFood"
                class="food_kind"
                src="./resources/img/modal/westernFood.png"
                value="양식"
              />
              <img
                id="worldFood"
                class="food_kind"
                src="./resources/img/modal/worldFood.png"
                value="세계음식"
              />
              <img
                id="buffet"
                class="food_kind"
                src="./resources/img/modal/buffet.png"
                value="뷔페"
              />
              <img
                id="cafe"
                class="food_kind"
                src="./resources/img/modal/cafe.png"
                value="카페"
              />
              <img
                id="pup"
                class="food_kind"
                src="./resources/img/modal/pup.png"
                value="주점"
              />
            </div>
            <hr />
            <!-- 가격대 -->
            <div class="foodPrice">
              <img
                id="manwonLess"
                class="food_price"
                src="./resources/img/modal/manwonLess.png"
                value="1만원이하"
              />
              <img
                id="manwonMore"
                class="food_price"
                src="./resources/img/modal/manwonMore.png"
                value="1만원이상"
              />
              <img
                id="threeManwonMore"
                class="food_price"
                src="./resources/img/modal/threeManwonMore.png"
                value="3만원이상"
              />
              <img
                id="fiveManwonMore"
                class="food_price"
                src="./resources/img/modal/fiveManwonMore.png"
                value="5만원이상"
              />
            </div>
            <hr />
            <!--모달창 지역 구분-->
            <div
              class="horizontal-scroll-wrapper squares pop-up-area-container addressSi"
            >
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="seoul"
                  type="button"
                  value="서울"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="gyeonggido"
                  type="button"
                  value="경기도"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="incheon"
                  type="button"
                  value="인천"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="daegu"
                  type="button"
                  value="대구"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="busan"
                  type="button"
                  value="부산"
                />
              </div>

              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="jeju"
                  type="button"
                  value="제주"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="daejeon"
                  type="button"
                  value="대전"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="gwangju"
                  type="button"
                  value="광주"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="gangwondo"
                  type="button"
                  value="강원도"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="gyeongsangnamdo"
                  type="button"
                  value="경상남도"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="gyeongsangbukdo"
                  type="button"
                  value="경상북도"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="jeollanamdo"
                  type="button"
                  value="전라남도"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="jeollabukdo"
                  type="button"
                  value="전라북도"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="chungcheongnamdo"
                  type="button"
                  value="충청남도"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="chungcheongbukdo"
                  type="button"
                  value="충청북도"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="ulsan"
                  type="button"
                  value="울산"
                />
              </div>

              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="sejong"
                  type="button"
                  value="세종"
                />
              </div>
            </div>

            <br />

            <hr />
            <div class="addressGu" id="addressGu">
              <div class="seoul">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="종로구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="중구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="용산구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="성동구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="광진구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="동대문구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="중랑구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="성북구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강북구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="도봉구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="노원구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="은평구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="서대문구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="마포구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="양천구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강서구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="구로구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="금천구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="영등포구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="동작구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="관악구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="송파구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="서초구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강남구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강동구"
                />
              </div>
              <div class="gyeonggido">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="가평군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="고양시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="과천시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="광명시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="광주시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="구리시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="군포시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="김포시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="남양주시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="동두천시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="부천시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="성남시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="수원시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="시흥시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="안산시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="안성시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="안양시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="양주시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="양평시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="여주시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="연천시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="오산시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="용인시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="의왕시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="의정부시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="이천시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="파주시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="평택시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="포천시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="하남시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="화성시"
                />
              </div>
              <div class="incheon">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="인천 강화군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="인천 계양구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="인천 남동구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="인천 동구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="인천 미추홀구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="인천 부평구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="인천 서구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="인천 연수구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="인천 옹진군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="인천 중구"
                />
              </div>
              <div class="daegu">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="대구 남구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="대구 달서구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="대구 달성군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="대구 동구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="대구 북구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="대구 서구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="대구 수성구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="대구 중구"
                />
              </div>

              <div class="busan">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="부산 강서구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="부산 금정구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="부산 기장군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="부산 남구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="부산 동구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="부산 동래구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="부산 부산진구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="부산 북구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="부산 사상구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="부산 사하구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="부산 서구"
                />
              </div>
              <div class="jeju">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="제주 모슬포/화순"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="제주 서귀포시내"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="제주 성산/우도"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="제주 제주시내"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="제주 중문단지"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="제주 표선/성읍"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="제주 한림/애월"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="제주 함덕/김녕"
                />
              </div>
              <div class="daejeon">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="대전 대덕구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="대전 동구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="대전 서구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="대전 유성구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="대전 중구"
                />
              </div>
              <div class="gwangju">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="광주 광산구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="광주 남구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="광주 동구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="광주 북구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="광주 서구"
                />
              </div>
              <div class="gangwondo">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 강릉시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 고성군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 동해시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 삼척시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 속초시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 양구군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 양양군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 영월군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 원주시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 인제군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 정선군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 철원군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 춘천시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 태백시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 평창군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 홍천군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 화천군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="강원 횡성군"
                />
              </div>
              <div class="gyeongsangnamdo">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 거제시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 거창군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 고성군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 김해시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 남해군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 밀양시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 사천시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 산청군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 양산시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 의령군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 진주시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 창녕군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 창원시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 통영시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 하동군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 함안군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 함양군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경남 합천군"
                />
              </div>

              <div class="gyeongsangbukdo">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 경산시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 경주시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 고령군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 구미시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 군위군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 김천시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 문경시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 봉화군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 상주시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 성주군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 안동시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 영덕군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 영양군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 영주시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 영천시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 예천군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 울릉군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 울진군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 의성군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 청도군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 청송군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 칠곡군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="경북 포항시"
                />
              </div>

              <div class="jeollanamdo">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 강진군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 고흥군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 곡성군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 광양시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 구례군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 나주시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 담양군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 목포시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 무안군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 보성군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 순천시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 신안군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 여수시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 영광군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 영암군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 완도군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 장성군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 장흥군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 진도군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 함평군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 해남군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전남 화순군"
                />
              </div>

              <div class="jeollabukdo">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전북 고창군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전북 군산시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전북 김제시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전북 남원시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전북 무주군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전북 부안군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전북 순창군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전북 완주군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전북 익산시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전북 임실군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전북 장수군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전북 전주시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전북 정읍시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="전북 진안군"
                />
              </div>

              <div class="chungcheongnamdo">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충남 계룡시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충남 공주시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충남 금산군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충남 논산시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충남 당진시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충남 보령시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충남 부여군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충남 서산시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충남 서천군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충남 아산시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충남 예산군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충남 천안시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충남 청양군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충남 태안군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충남 홍성군"
                />
              </div>
              <div class="chungcheongbukdo">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충북 괴산군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충북 단양군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충북 보은군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충북 영동군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충북 옥천군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충북 음성군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충북 제천시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충북 증평군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충북 진천군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충북 청주시"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="충북 충주시"
                />
              </div>
              <div class="ulsan">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="울산 남구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="울산 동구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="울산 북구"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="울산 울주군"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="울산 중구"
                />
              </div>
              <div class="sejong">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="세종시"
                />
              </div>
            </div>

            <hr />
            <form action="listingFilter.do">
              <input
                id="query"
                name="query"
                value="${param.query}"
                hidden="hidden"
              />
              <input
                type="submit"
                class="btn btn-pop-up pop-up-search"
                value="검색"
              />
              <input id="koreanFoodInput" name="koreanFood" hidden="hidden" />
              <input
                id="japaneseFoodInput"
                name="japaneseFood"
                hidden="hidden"
              />
              <input id="chineseFoodInput" name="chineseFood" hidden="hidden" />
              <input id="westernFoodInput" name="westernFood" hidden="hidden" />
              <input id="worldFoodInput" name="worldFood" hidden="hidden" />
              <input id="buffetInput" name="buffet" hidden="hidden" />
              <input id="cafeInput" name="cafe" hidden="hidden" />
              <input id="pupInput" name="pup" hidden="hidden" />
              <!-- 주소 value 들어가는 곳 -->
              <input
                id="addressSi"
                name="shopAddressSi"
                hidden="hidden"
              />
              <input id="addressGu" name="shopAddressGu" hidden="hidden" />
              <!--가격대 value 들어가는 곳-->
              <input id="manwonLessInput" name="manwonLess" hidden="hidden" />
              <input id="manwonMoreInput" name="manwonMore" hidden="hidden" />
              <input
                id="threeManwonMoreInput"
                name="threeManwonMore"
                hidden="hidden"
              />
              <input
                id="fiveManwonMoreInput"
                name="fiveManwonMore"
                hidden="hidden"
              />
            </form>
          </div>
        </div>
      </div>

      <div class="listing__text__top">
        <div class="listing__text__top__left">
          <h5>Restaurants</h5>
           
          
        </div>
        <div class="listing__text__top__right">
          <!-- Nearby <i class="fa fa-sort-amount-asc"></i> -->
          검색 수 : <input id="listSize" value="${listSize}"/>
        </div>
      </div>
      
      <!-- <input type="button" id="locate" value="변환" /> -->

      <div class="listing__list">
        <c:forEach items="${shopPageList}" var="shop">
        	
          <div class="listing__item shopClick">
            <!-- 여기에 img값 가지고와야함 동적으로 -->
            <div
              class="listing__item__pic set-bg"
              data-setbg="./resources/manager/upload/${shop.shopRealfname}"
            >
              
            </div>
            <div class="listing__item__text">
              <div class="listing__item__text__inside">
                <h5 class="shopTitle">${shop.shopTitle}</h5>
                <div class="listing__item__text__rating">
                  <div class="listing__item__text__info__left">
                  	<span>${shop.shopFood} </span>
                  </div>
                  <!-- 가격대 가지고와야함-->
                  <h6>${shop.shopPriceRange}</h6>
                </div>
                <ul>
                  <!--주소 이름 가지고와야함 ㅅㅂ-->
                  <li class="shopAddress">
                    <span class="icon_pin_alt"></span>${shop.shopAddress}
                  </li>
                  <li><span class="icon_phone"></span> ${shop.shopTel}</li>
                </ul>
              </div>
              <div class="listing__item__text__info">
                <div class="listing__item__text__info__left">      
                  <span class="shopPark">${shop.shopPark} </span>
                </div>
                <div class="listing__item__text__info__right">
                  <span >${shop.shopTime} </span>
                </div>
              </div>
            </div>
            <input value="${shop.shopNumber}" hidden="hidden"/>
            <input class="shopLat" value="${shop.shopLat}" hidden="hidden"/>
            <input class="shopLon" value="${shop.shopLon}" hidden="hidden"/>
          </div>
          
          
          
        </c:forEach>
        
      </div>
    </section>
    
    <!-- Listing Section End -->

    <!--카카오 지도 연결-->
    <!-- Map Begin -->
    <div class="listing__map">
      <div id="map" style="width: 100%; height: 60em"></div>
    </div>
    <!-- Map End -->

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

    <!--직접 만든 js-->
    <script src="./resources/js/yang.js"></script>
    <!-- <script src="./resources/js/kakaoMap.js"></script> -->

    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=50853ea4c563d3b84d44fed07758d510&libraries=services"
    ></script>
    <script src="https://kit.fontawesome.com/2173f645ed.js"></script>
    <script>
      var mapContainer = document.getElementById("map");
      mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5, // 지도의 확대 레벨
      };

      var map = new daum.maps.Map(mapContainer, mapOption);

      // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
      if (navigator.geolocation) {
        // GeoLocation을 이용해서 현재 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function (position) {
          var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
            
          var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
          console.log("myLat " + lat);
          console.log("myLon " + lon);
          $("#myLat").val(lat);
          $("#myLon").val(lon);
          // 마커와 인포윈도우를 표시합니다
          displayMarker(locPosition, message);
        });
        
        
      } else {
        // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
          message = "geolocation을 사용할수 없어요..";

        displayMarker(locPosition, message);
      }
      //마커 이미지
      // var imageSrc =
      //     "https://t1.daumcdn.net/local./resources/img/localimages/07/mapapidoc/markerStar.png", // 마커이미지의 주소입니다
      //   imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
      //   imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
       
	  
      //현재 좌표를 구해와서 주소값으로 변환
	  navigator.geolocation.getCurrentPosition(function(position) { // 좌표추출
    	var geocoder = new kakao.maps.services.Geocoder();

    	let callback = function(result, status) {
        	if (status === kakao.maps.services.Status.OK) {
            	let loc = result[0].address_name; // 좌표를 지역이름으로 변경
            	$("#myLocation").val(loc);
      			      	
        	}
    	};

    	 geocoder.coord2RegionCode(position.coords.longitude, position.coords.latitude, callback); // 현재위치 좌표 가져오기
	}); 
	

      var geocoder = new daum.maps.services.Geocoder();

      var listData = [];
      var listShop = [];
      var listLat = [];
      var listLon = [];

      //DB에 있는 shopAddress가 들어옴
      $(".shopAddress").each(function name(params) {
        var shopName = $(this).text();

        listData.push(shopName);
      });

      //DB에 있는 shopTitle이 들어옴
      $(".shopTitle").each(function name(params) {
        var shopTitle = $(this).html();

        listShop.push(shopTitle);
      });
      
      //DB에 있는 shopLat이 들어옴
      $(".shopLat").each(function name(params) {
          var shopLat = $(this).val();

          listLat.push(shopLat);
        });
      
      //DB에 있는 shopLon이 들어옴
      $(".shopLon").each(function name(params) {
          var shopLon = $(this).val();

          listLon.push(shopLon);
        });
     
      listData.forEach(function (addr, index) {
        geocoder.addressSearch(addr, function (result, status) {
          if (status === daum.maps.services.Status.OK) {
            // var markerImage = new kakao.maps.MarkerImage(
            //   imageSrc,
            //   imageSize,
            //   imageOption
            // );
            var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		
            console.log(result)
            console.log(result[0].y);
            var marker = new daum.maps.Marker({
              map: map,
              position: coords,
              //image: markerImage,
            });
            //마커 위에 올라가는 입력창 초기 이미지
            // var infowindow = new daum.maps.InfoWindow({
            //   content:
            //   '<div style="width:150px;text-align:center;padding:6px 0;">' +
            //   listShop[index] +
            //   "</div>",
            //   disableAutoPan: true,
            // });
            //infowindow.open(map, marker);

            map.setCenter(coords);

            // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
            var content =
              '<div class="customoverlay">' +
              '  <a href="https://map.kakao.com/link/map/'
              +listShop[index]+','+listLat[index]+','+listLon[index]+'">' + 
              '    <span class="title">' +
              listShop[index] +
              "</span>" +
              "  </a>" +
              "</div>";
            

            var position = new kakao.maps.LatLng(result[0].y, result[0].x);
            // 커스텀 오버레이를 생성합니다
            var customOverlay = new kakao.maps.CustomOverlay({
              map: map,
              position: position,
              content: content,
              yAnchor: 0.2,
            });
          }
        });
      });
     
    </script>

	<!-- 반경거리에서 숫자와 특수문자만 뽑는 정규식 -->
	<script>
		$("#filter-search").click(function name(params) {
			var regex = /[^0-9.;\-]/g;
			var result = $("#radius").val().replace(regex, "");
			$("#radiusInput").val(result);
		});
	</script>


	<script type="text/javascript">
    	$(".shopClick").each(function() {
    		$(this).click(function() {
    			const shopNumber = $(this).find('input[hidden]').val();
    			location.href="listingDetails.do?shopNumber="+shopNumber;	
			})	
		})
    </script>
    	<!-- form tag 지연시간 설정 -->
	<script type="text/javascript">
		$('form').submit(function(e) {
			var form = this;
			e.preventDefault();
			setTimeout(function() {
				form.submit();
			}, 1000); //1초 설정
		});
	</script>
	
  </body>
</html>
