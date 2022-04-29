<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 파일 연동시키기 위한 코드 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자페이지 - 가게리스트 - 가게추가</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <!-- 파일 내 CSS 연결 -->
        <link href="${path}/resources/manager/css/styles.css" rel="stylesheet" />
        <!-- 내부 CSS 연결 -->
        <style type="text/css">
        	.jb-600 {
        		font-weight: 600;
        	}
        	.jb-1000 {
        		font-weight: 1000;
        	}
        	.ps-2 {
        		padding: 2%;
        	}
        </style>
        
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-light bg-light">
            <!-- navbar 로고 -- 이미지파일 연결 -->
            <a class="navbar-brand px-sm-4" href="main.do"><img src="${path}/resources/manager/img/logo.png" alt="" width="100%" height="50px"></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        </nav>
        <!-- 왼쪽 슬라이드 네비바 -->
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">메인</div>
                            <a class="nav-link" href="dashboardManager.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                대시보드
                            </a>
                            <div class="sb-sidenav-menu-heading">목차</div>
                            <a class="nav-link" href="chartManagers.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                차트
                            </a>
                            <a class="nav-link" href="memberListManager.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                회원리스트
                            </a>
                            <a class="nav-link" href="shopListManager.do" id="check">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                가게리스트
                            </a>
                            <a class="nav-link" href="reportListManager.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                신고리스트
                            </a>
                        </div>
                    </div>
                    <!-- 맨 아래 로그인 확인 창 -->
                    <div class="sb-sidenav-footer">
                        <a href="logout.do">로그아웃</a>
                    </div>
                </nav>
            </div>
            <!-- 메인 -->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                	<!-- 위쪽 타이틀 -->
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4 jb-1000">가게 추가</h3></div>
                                    <div class="card-body">
                                    	<!-- form
                                    		요청 : shopInsertManager.do
                                    		사용 : 파일 업로드 추가
                                    	-->
                                        <form action="shopInsertManager.do" method="post" enctype="multipart/form-data">
                                        	<!-- 각 항목에 name 추가 (= ShopVO의 멤버변수와 이름 동일) -->
                                        	<div class="form-floating mb-3">
                                                <input class="form-control" id="inputShopName" type="text" placeholder="상호명" name="shopTitle"/>
                                                <label for="inputShopName">상호명</label>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-9">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="sample4_postcode" type="text" placeholder="우편번호" readonly="readonly"/>
                                                        <label for="inputFirstName">우편번호</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                	<!-- 주소 Api 연결 버튼 -->
                                                    <div class="d-grid"><a id="jusoSearch" class="btn btn-success btn-lg btn-block" onclick="sample4_execDaumPostcode()">주소찾기</a></div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="sample4_roadAddress" type="text" placeholder="도로명주소" name="shopAddrDoroManager" readonly="readonly"/>
                                                <label for="inputShopAddressDtail">도로명주소</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="sample4_jibunAddress" type="text" placeholder="지번주소" name="shopAddrJibunManager" readonly="readonly"/>
                                                <label for="inputShopAddressDtail">지번주소</label>
                                            </div>
                                            <span id="guide" style="color:#999;display:none"></span>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="sample4_detailAddress" type="text" placeholder="상세주소" name="shopAddrDetailManager" />
                                                <label for="inputShopAddressDtail">상세주소</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="sample4_extraAddress" type="text" placeholder="참고항목" name="shopAddressDong" readonly="readonly"/>
                                                <label for="inputShopAddressDtail">참고항목</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputShopTel" type="tel" name="shopTel" placeholder="전화번호"/>
                                                <label for="inputShopTel">전화번호</label>
                                            </div>
                                            <div class="mb-3">
                                                <select class="form-select ps-2" name="shopPriceRange">
                                                	<option value="0" selected="selected">가격대</option>
                                                	<option value="1만원 미만">1만원 미만</option>
                                                	<option value="1만원 이상">1만원 이상</option>
                                                	<option value="3만원 이상">3만원 이상</option>
                                                	<option value="5만원 이상">5만원 이상</option>
                                                </select>
                                            </div>
                                            <div class="row mb-3">
                                                <label class="radio-inline" for="shopFood">
                                                <label class="jb-600">음식유형</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                                <input type="radio" name="shopFood" value="한식"/> 한식&nbsp;&nbsp;&nbsp;
	                                                <input type="radio" name="shopFood" value="양식"/> 양식&nbsp;&nbsp;&nbsp;
	                                                <input type="radio" name="shopFood" value="중식"/> 중식&nbsp;&nbsp;&nbsp;
	                                                <input type="radio" name="shopFood" value="일식"/> 일식&nbsp;&nbsp;&nbsp;
	                                                <input type="radio" name="shopFood" value="세계음식"/> 세계음식&nbsp;&nbsp;&nbsp;
	                                                <input type="radio" name="shopFood" value="뷔페"/> 뷔페&nbsp;&nbsp;&nbsp;
	                                                <input type="radio" name="shopFood" value="카페"/> 카페&nbsp;&nbsp;&nbsp;
	                                                <input type="radio" name="shopFood" value="주점"/> 주점&nbsp;&nbsp;&nbsp;
                                                </label>
                                            </div>
                                            <div class="mb-3">
                                                <select class="form-select ps-2" name="shopPark">
                                                	<option value="0" selected="selected">주차</option>
                                                	<option value="주차 가능">주차 가능</option>
                                                	<option value="주차 불가능">주차 불가능</option>
                                                </select>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputShopTime" type="text" name="shopTime" placeholder="영업시간"/>
                                                <label for="inputShopTime">영업시간</label>
                                            </div>
                                            <div class="row mb-3">
                                            	<div class="col-md-10 col-md-offset-10">
                                                <label class="radio-inline" for="holiday">
                                                	<label class="jb-600">휴일</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                                <input type="checkbox" name="shopHoliday" value="월"/> 월&nbsp;&nbsp;&nbsp;&nbsp;
	                                                <input type="checkbox" name="shopHoliday" value="화"/> 화&nbsp;&nbsp;&nbsp;&nbsp;
	                                                <input type="checkbox" name="shopHoliday" value="수"/> 수&nbsp;&nbsp;&nbsp;&nbsp;
	                                                <input type="checkbox" name="shopHoliday" value="목"/> 목&nbsp;&nbsp;&nbsp;&nbsp;
	                                                <input type="checkbox" name="shopHoliday" value="금"/> 금&nbsp;&nbsp;&nbsp;&nbsp;
	                                                <input type="checkbox" name="shopHoliday" value="토"/> 토&nbsp;&nbsp;&nbsp;&nbsp;
	                                                <input type="checkbox" name="shopHoliday" value="일"/> 일&nbsp;&nbsp;&nbsp;&nbsp;
	                                                <input type="checkbox" name="shopHoliday" value="없음"/> 없음&nbsp;&nbsp;&nbsp;&nbsp;
                                                </label>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <textarea class="form-control" id="content" style="height: 100px" name="shopContent" placeholder="설명"></textarea>
                                                <label for="content">설명</label>
                                            </div>
                                            <div class="form-group mb-3">
											    <label class="jb-600" for="exampleInputFile">파일 업로드</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											    <input type="file" id="exampleInputFile" name="shopFile">
											    <input id="shopLat" name="shopLat" hidden="hidden"/>
											    <input id="shopLon" name="shopLon" hidden="hidden"/>
									
											</div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><button id="shopAdd" value="추가" class="btn btn-success btn-block">추가</button></div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <!-- footer -->
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        

				<!-- 카카오 맵 출력 -->
    		<div id="map" style="width: 100%; height: 350px" hidden="hidden"></div>





		<!-- 제이 쿼리 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<!-- 부트스트랩 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!-- 파일 내 스크립트 연동 -->
        <script src="${path}/resources/manager/js/scripts.js"></script>
        <!-- datatable 연동 -->
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <!-- 파일 내 테이블 연동 -->
        <script src="${path}/resources/manager/js/datatables-simple-demo.js"></script>
        <!-- 주소 Api연동 -->
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <!-- 파일 내 주소 스크립트 연동 -->
        <script src="${path}/resources/manager/js/addressApiEx.js"></script>
        <!-- 카카오맵 가지고오기 위한 키 값 -->
        <script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=05fe72ea73cecbaa3ca941aad15b2755&libraries=services"></script>
        <!-- 위도경도 값 가지고 오기 위한 카카오 맵 연동 -->
        <script src="${path}/resources/manager/js/shopInsertKakaoMap.js"></script>

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
