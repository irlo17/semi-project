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
        <title>관리자페이지 - 가게리스트 - 가게수정</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <!-- 파일 내 CSS 연결 -->
        <link href="${path}/resources/manager/css/styles.css" rel="stylesheet" />
        
        <!-- 내부 CSS -->
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
        <!-- JQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- 내부 JS -->
        <script type="text/javascript">
        	function menuInsertManager(sNum) {
        		//alert("확인");
        		//var param = {shopNumber : sNum, menuName : $("#inputMenuName").val(), menuPrice : $("#inputMenuPrice").val()};
        		var mName = $("#inputMenuName").val();
        		var mPrice = $("#inputMenuPrice").val();
        		
        		location.href = "menuInsertManager.do?shopNumber=" + sNum + "&menuName=" + mName + "&menuPrice=" + mPrice;
        		
        		/* $.ajax({
        			type : 'post',
        			data : { shopNumber : sNum,
        					menuName : mName, 
        					menuPrice : mPrice },
        			url : 'menuInsertManager.do',
        			dataType : 'text',
        			success : function(data) {
        				alert("ok");
        				console.log(data);
        				
        				var obj = JSON.parse(data);
        				
        				console.log(obj[1].shopNumber);
        				console.log(obj[1].menuName);
        				console.log(obj[1].menuPrice);
        				
        				var value = '<div class="row mb-3"><div class="col-md-1"><label class="jb-600"></label></div>';
                       	value += '<div class="col-md-5"><div class="form-floating mb-3 mb-md-0">';
                       	value += '<input class="form-control menuName" type="text" placeholder="메뉴명" value=';
                       	value += $('#inputMenuName').val();
                       	value += '/><label for="inputMenuName">메뉴명</label></div></div>';
                       	value += '<div class="col-md-4"><div class="form-floating mb-3 mb-md-0"><input class="form-control menuPrice" type="text" placeholder="메뉴가격" value=';
                       	value += $('#inputMenuPrice').val();
                       	value += '/><label for="inputMenuPrice">메뉴가격</label></div></div>';
                       	value += '<div class="col-md-2"><div class="d-grid"><a class="btn btn-warning btn-lg btn-block" href="menuDeleteManager.do?shopNumber=${ shopManger.shopNumber }&menuName=${ menuManager.menuName }">삭제</a></div>';
                       	value += '</div></div>';
        				
        				$('.menuInner').append(value);
        				
        				
        			},
        			error : function(err){
        				alert("err");
        				console.log(err);
        			}
        		}); */
        		
        	}
        	
        	
        	
        	/* function menuDeleteManager(sNum, mName) {
        		if(confirm("삭제하시겠습니까?")) {
        			location.href="menuDeleteManager.do?shopNumber="+ sNum +"&menuName=" + mName;
        			alert("메뉴가 삭제되었습니다.");
        		} else {
        			return;
        		}
        		
        	} */
        	
        	
        	
        	$(document).ready(function(){
        		
        		// 가게 수정 시, 가격대/음식유형/주차/휴일 선택지 골라져있도록 설정
        		
        		// Controller에서 받아온 값을 변수에 저장
        		let shopPriceRange = "${shopManager.shopPriceRange}";
            	let shopFood = "${shopManager.shopFood}";
            	let shopPark = "${shopManager.shopPark}";
            	let shopHoliday = "${shopManager.shopHoliday}";
            	
            	// 휴일은 여러개가 들어갈 수 있기 때문에 ','로 잘라줌
            	let shopHolidayList = shopHoliday.split(",");
            	
            	// 확인작업
            	console.log("가격대 : " + shopPriceRange); // 확인
            	console.log("음식유형 : " + shopFood); // 확인
            	console.log("주차 : " + shopPark); // 확인
            	console.log("휴일 : " + shopHoliday); // 확인
            	
            	console.log("휴일이 여러개일 경우 : " + shopHolidayList[0]);
            	console.log("휴일이 여러개일 경우 : " + shopHolidayList[1]);
            	
            	// 각 value값에 맞춰 설정
            	$('select[name="shopPriceRange"]').val(shopPriceRange);
            	$('input:radio[name="shopFood"]:radio[value='+shopFood+']').prop('checked',true);
            	$('select[name="shopPark"]').val(shopPark);
            	
            	for(let i=0; i<shopHolidayList.length; i++) {
            		$('input:checkbox[name="shopHoliday"]:checkbox[value='+shopHolidayList[i]+']').prop('checked',true);
            	}
            	
        	});
        	
        </script>
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
                            <a class="nav-link" href="chartsManager.do">
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4 jb-1000">가게 수정</h3></div>
                                    <div class="card-body">
                                    	<!-- form -->
                                        <form action="shopUpdateManager.do?shopNumber=${ shopManager.shopNumber }" method="post" enctype="multipart/form-data">
                                        	<div class="form-floating mb-3">
                                                <input class="form-control" id="inputShopName" type="text" placeholder="상호명" name="shopTitle" value="${ shopManager.shopTitle }"/>
                                                <label for="inputShopName">상호명</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputShopTel" type="tel" placeholder="전화번호" name="shopTel" value="${ shopManager.shopTel }"/>
                                                <label for="inputShopTel">전화번호</label>
                                            </div>
                                            <div class="mb-3">
                                                <select class="form-select ps-2" name="shopPriceRange">
                                                	<option value="0">가격대</option>
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
                                                	<option>주차</option>
                                                	<option>주차 가능</option>
                                                	<option>주차 불가능</option>
                                                </select>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputShopTime" type="text" placeholder="영업시간" name="shopTime" value="${ shopManager.shopTime }"/>
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
                                                <textarea class="form-control" id="content" placeholder="설명" style="height: 100px" name="shopContent">${ shopManager.shopContent }</textarea>
                                                <label for="content">설명</label>
                                            </div>
                                            <div class="form-group mb-3">
											    <label for="exampleInputFile" class="jb-600">파일 업로드</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											    <input type="file" id="exampleInputFile" name="shopFile">
											</div>
											<!-- 메뉴 -->
											<div class="row mb-3">
												<div class="col-md-1">
													<label class="jb-600">메뉴</label>
												</div>
                                                <div class="col-md-5">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputMenuName" type="text" placeholder="메뉴명" />
                                                        <label for="inputMenuName">메뉴명</label>
                                                    </div>
                                                </div>
                                                 <div class="col-md-4">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputMenuPrice" type="text" placeholder="메뉴가격" />
                                                        <label for="inputMenuPrice">메뉴가격</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="d-grid"><input type="button" value="추가" class="btn btn-warning btn-lg btn-block" onclick="menuInsertManager(${ shopManager.shopNumber })"/></div>
                                                </div>
                                            </div>
	                                           <c:forEach items="${ menuListManager }" var="menuManager">
	                                           <div class="row mb-3">
												<div class="col-md-1">
													<label class="jb-600"><input type="hidden" value="${ menuManager.shopNumber }"/></label>
												</div>
	                                               <div class="col-md-5">
	                                                   <div class="form-floating mb-3 mb-md-0">
	                                                       <input class="form-control menuName" type="text" placeholder="메뉴명" value="${ menuManager.menuName }" readonly="readonly"/>
	                                                       <label for="inputMenuName">메뉴명</label>
	                                                   </div>
	                                               </div>
	                                                <div class="col-md-4">
	                                                   <div class="form-floating mb-3 mb-md-0">
	                                                       <input class="form-control menuPrice" type="text" placeholder="메뉴가격" value="${ menuManager.menuPrice }" readonly="readonly"/>
	                                                       <label for="inputMenuPrice">메뉴가격</label>
	                                                   </div>
	                                               </div>
	                                               <div class="col-md-2">
	                                                   <div class="d-grid"><a class="btn btn-warning btn-lg btn-block" href="menuDeleteManager.do?shopNumber=${menuManager.shopNumber}&menuName=${ menuManager.menuName }">삭제</a></div>
	                                               </div>
	                                           </div>
	                                           </c:forEach>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><input type="submit" value="수정" class="btn btn-warning btn-block" /></div>
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
        <!-- 부트스트랩 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!-- 파일 내 스크립트 연동 -->
        <script src="${path}/resources/manager/js/scripts.js"></script>
        <!-- datatable 연동 -->
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <!-- 파일 내 테이블 연동 -->
        <script src="${path}/resources/manager/js/datatables-simple-demo.js"></script>
    </body>
</html>
