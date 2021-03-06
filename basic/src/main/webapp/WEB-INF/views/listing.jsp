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

  <!--?????? ?????? css-->
  <link rel="stylesheet" href="./resources/css/yang.css" type="text/css" />
  <!-- ????????? ???????????? ??????  -->
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
                <a href="totalbookmark.do?page=1" class="primary-btn"><i class="fa-solid fa-utensils"></i>&nbsp;&nbsp;?????? ?????????</a>
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
          placeholder="???????????? ???????????????"
          value="${param.query}"
        />
      </div>
      <div class="filter__location">
        <input id="myLocation" type="text" placeholder="??? ??????" readonly="readonly"/>
        <i class="fa fa-map-marker"></i>
      </div>
      
      <div class="filter__radius">
        <p>?????? :</p>
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
        <h6>??????</h6>
 
        <label for="parking">
          ?????? <input type="checkbox" id="parking"/>
          <span class="checkmark"></span>
        </label>
        <!-- <label for="open">
          ????????? <input type="checkbox" id="open"/>
          <span class="checkmark"></span>
        </label> -->
      </div>
      
		<div class="filter__btns">
			<button id="filter-search" type="submit" class="filter__reset">
				??????
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
    
      <!--????????? value ???????????? ???-->
      <input name="manwonLess" value="${param.manwonLess}" hidden="hidden"/> 
      <input name="manwonMore" value="${param.manwonMore}" hidden="hidden"/>
      <input name="threeManwonMore" value="${param.threeManwonMore}" hidden="hidden"/>
      <input name="fiveManwonMore"  value="${param.fiveManwonMore}" hidden="hidden"/>
      
      <!-- ?????? value ??????????????? -->
      <input name="shopAddressSi"  value="${param.shopAddressSi}" hidden="hidden"/>
      <input name="shopAddressGu"  value="${param.shopAddressGu}" hidden="hidden"/>
      <input name="parking" id="parkingInput" hidden="hidden"/>
      <input name="open" id="openInput" hidden="hidden"/>
      </form>
      <div class="filter__btns">
        <a href="listingCancel.do"><button type="submit" class="filter__reset">?????? ?????? ??????</button></a>
      </div>
    </div>
    <!-- Filter End -->

    <!-- Listing Section Begin -->
    <section class="listing nice-scroll">
      <!--?????? ?????????-->
      <div class="filter-modal">
        <div class="modal_body">
          <img id="closeImg" src="./resources/img/modal/closeImg.jpg" />
          <div>
            <h4>????????? ?????? ?????????</h4>
            <hr />
            <div class="food_kind_all">
              <img
                id="koreanFood"
                class="food_kind"
                src="./resources/img/modal/koreanFood.png"
                value="??????"
              />
              <img
                id="japaneseFood"
                class="food_kind"
                src="./resources/img/modal/japaneseFood.png"
                value="??????"
              />
              <img
                id="chineseFood"
                class="food_kind"
                src="./resources/img/modal/chineseFood.png"
                value="??????"
              />
              <img
                id="westernFood"
                class="food_kind"
                src="./resources/img/modal/westernFood.png"
                value="??????"
              />
              <img
                id="worldFood"
                class="food_kind"
                src="./resources/img/modal/worldFood.png"
                value="????????????"
              />
              <img
                id="buffet"
                class="food_kind"
                src="./resources/img/modal/buffet.png"
                value="??????"
              />
              <img
                id="cafe"
                class="food_kind"
                src="./resources/img/modal/cafe.png"
                value="??????"
              />
              <img
                id="pup"
                class="food_kind"
                src="./resources/img/modal/pup.png"
                value="??????"
              />
            </div>
            <hr />
            <!-- ????????? -->
            <div class="foodPrice">
              <img
                id="manwonLess"
                class="food_price"
                src="./resources/img/modal/manwonLess.png"
                value="1????????????"
              />
              <img
                id="manwonMore"
                class="food_price"
                src="./resources/img/modal/manwonMore.png"
                value="1????????????"
              />
              <img
                id="threeManwonMore"
                class="food_price"
                src="./resources/img/modal/threeManwonMore.png"
                value="3????????????"
              />
              <img
                id="fiveManwonMore"
                class="food_price"
                src="./resources/img/modal/fiveManwonMore.png"
                value="5????????????"
              />
            </div>
            <hr />
            <!--????????? ?????? ??????-->
            <div
              class="horizontal-scroll-wrapper squares pop-up-area-container addressSi"
            >
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="seoul"
                  type="button"
                  value="??????"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="gyeonggido"
                  type="button"
                  value="?????????"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="incheon"
                  type="button"
                  value="??????"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="daegu"
                  type="button"
                  value="??????"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="busan"
                  type="button"
                  value="??????"
                />
              </div>

              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="jeju"
                  type="button"
                  value="??????"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="daejeon"
                  type="button"
                  value="??????"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="gwangju"
                  type="button"
                  value="??????"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="gangwondo"
                  type="button"
                  value="?????????"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="gyeongsangnamdo"
                  type="button"
                  value="????????????"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="gyeongsangbukdo"
                  type="button"
                  value="????????????"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="jeollanamdo"
                  type="button"
                  value="????????????"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="jeollabukdo"
                  type="button"
                  value="????????????"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="chungcheongnamdo"
                  type="button"
                  value="????????????"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="chungcheongbukdo"
                  type="button"
                  value="????????????"
                />
              </div>
              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="ulsan"
                  type="button"
                  value="??????"
                />
              </div>

              <div>
                <input
                  class="btn btn-pop-up pop-up-area"
                  id="sejong"
                  type="button"
                  value="??????"
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
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="????????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="????????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="????????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
              </div>
              <div class="gyeonggido">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="????????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="????????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="????????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
                />
              </div>
              <div class="incheon">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ????????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
              </div>
              <div class="daegu">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
              </div>

              <div class="busan">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ????????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
              </div>
              <div class="jeju">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????/??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ???????????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????/??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ????????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ????????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????/??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????/??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????/??????"
                />
              </div>
              <div class="daejeon">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
              </div>
              <div class="gwangju">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
              </div>
              <div class="gangwondo">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
              </div>
              <div class="gyeongsangnamdo">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
              </div>

              <div class="gyeongsangbukdo">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
              </div>

              <div class="jeollanamdo">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
              </div>

              <div class="jeollabukdo">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
              </div>

              <div class="chungcheongnamdo">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
              </div>
              <div class="chungcheongbukdo">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
              </div>
              <div class="ulsan">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ?????????"
                />
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????? ??????"
                />
              </div>
              <div class="sejong">
                <input
                  class="btn btn-pop-up pop-up-dongnae"
                  type="button"
                  value="?????????"
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
                value="??????"
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
              <!-- ?????? value ???????????? ??? -->
              <input
                id="addressSi"
                name="shopAddressSi"
                hidden="hidden"
              />
              <input id="addressGu" name="shopAddressGu" hidden="hidden" />
              <!--????????? value ???????????? ???-->
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
          ?????? ??? : <input id="listSize" value="${listSize}"/>
        </div>
      </div>
      
      <!-- <input type="button" id="locate" value="??????" /> -->

      <div class="listing__list">
        <c:forEach items="${shopPageList}" var="shop">
        	
          <div class="listing__item shopClick">
            <!-- ????????? img??? ?????????????????? ???????????? -->
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
                  <!-- ????????? ??????????????????-->
                  <h6>${shop.shopPriceRange}</h6>
                </div>
                <ul>
                  <!--?????? ?????? ?????????????????? ??????-->
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

    <!--????????? ?????? ??????-->
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

    <!--?????? ?????? js-->
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
        center: new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
        level: 5, // ????????? ?????? ??????
      };

      var map = new daum.maps.Map(mapContainer, mapOption);

      // HTML5??? geolocation?????? ????????? ??? ????????? ???????????????
      if (navigator.geolocation) {
        // GeoLocation??? ???????????? ?????? ????????? ???????????????
        navigator.geolocation.getCurrentPosition(function (position) {
          var lat = position.coords.latitude, // ??????
            lon = position.coords.longitude; // ??????
            
          var locPosition = new kakao.maps.LatLng(lat, lon), // ????????? ????????? ????????? geolocation?????? ????????? ????????? ???????????????
            message = '<div style="padding:5px;">????????? ?????????????!</div>'; // ?????????????????? ????????? ???????????????
          console.log("myLat " + lat);
          console.log("myLon " + lon);
          $("#myLat").val(lat);
          $("#myLon").val(lon);
          // ????????? ?????????????????? ???????????????
          displayMarker(locPosition, message);
        });
        
        
      } else {
        // HTML5??? GeoLocation??? ????????? ??? ????????? ?????? ?????? ????????? ??????????????? ????????? ???????????????

        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
          message = "geolocation??? ???????????? ?????????..";

        displayMarker(locPosition, message);
      }
      //?????? ?????????
      // var imageSrc =
      //     "https://t1.daumcdn.net/local./resources/img/localimages/07/mapapidoc/markerStar.png", // ?????????????????? ???????????????
      //   imageSize = new kakao.maps.Size(64, 69), // ?????????????????? ???????????????
      //   imageOption = { offset: new kakao.maps.Point(27, 69) }; // ?????????????????? ???????????????. ????????? ????????? ???????????? ????????? ???????????? ????????? ???????????????.
      
       
	  
      //?????? ????????? ???????????? ??????????????? ??????
	  navigator.geolocation.getCurrentPosition(function(position) { // ????????????
    	var geocoder = new kakao.maps.services.Geocoder();

    	let callback = function(result, status) {
        	if (status === kakao.maps.services.Status.OK) {
            	let loc = result[0].address_name; // ????????? ?????????????????? ??????
            	$("#myLocation").val(loc);
      			      	
        	}
    	};

    	 geocoder.coord2RegionCode(position.coords.longitude, position.coords.latitude, callback); // ???????????? ?????? ????????????
	}); 
	

      var geocoder = new daum.maps.services.Geocoder();

      var listData = [];
      var listShop = [];
      var listLat = [];
      var listLon = [];

      //DB??? ?????? shopAddress??? ?????????
      $(".shopAddress").each(function name(params) {
        var shopName = $(this).text();

        listData.push(shopName);
      });

      //DB??? ?????? shopTitle??? ?????????
      $(".shopTitle").each(function name(params) {
        var shopTitle = $(this).html();

        listShop.push(shopTitle);
      });
      
      //DB??? ?????? shopLat??? ?????????
      $(".shopLat").each(function name(params) {
          var shopLat = $(this).val();

          listLat.push(shopLat);
        });
      
      //DB??? ?????? shopLon??? ?????????
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
            //?????? ?????? ???????????? ????????? ?????? ?????????
            // var infowindow = new daum.maps.InfoWindow({
            //   content:
            //   '<div style="width:150px;text-align:center;padding:6px 0;">' +
            //   listShop[index] +
            //   "</div>",
            //   disableAutoPan: true,
            // });
            //infowindow.open(map, marker);

            map.setCenter(coords);

            // ????????? ??????????????? ????????? ???????????? HTML ??????????????? document element??? ???????????????
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
            // ????????? ??????????????? ???????????????
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

	<!-- ?????????????????? ????????? ??????????????? ?????? ????????? -->
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
    	<!-- form tag ???????????? ?????? -->
	<script type="text/javascript">
		$('form').submit(function(e) {
			var form = this;
			e.preventDefault();
			setTimeout(function() {
				form.submit();
			}, 1000); //1??? ??????
		});
	</script>
	
  </body>
</html>
