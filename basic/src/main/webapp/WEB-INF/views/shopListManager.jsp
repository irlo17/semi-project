<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 파일 연동시키기 위한 코드 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자페이지 - 가게리스트</title>
        <!-- datatable CSS -->
        <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet" />
        <!-- 파일 내 CSS 연결 -->
        <link href="${path}/resources/manager/css/styles.css" rel="stylesheet" />
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
                	<!-- 메인 위쪽 타이틀 -->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">가게리스트</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="dashboardManager.do">대시보드</a></li>
                            <li class="breadcrumb-item active">가게리스트</li>
                        </ol>
                        <!-- 가게 추가 버튼 -->
                        <div class="row mb-3">
	                        <div class="col-md-10"></div>
	                        <div class="col-md-2">
	                            <div class="d-grid"><a class="btn btn-success btn-block" href="shopInsertFormManager.do">가게추가</a></div>
	                        </div>
                        </div>
                        <!-- 테이블 -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                가게 전체 리스트
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple" class="stripe hover row-border">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>상호명</th>
                                            <th>설명</th>
                                            <th>생성날짜</th>
                                            <th>수정날짜</th>
                                            <th>주소</th>
                                            <th>수정/삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <!-- Controller에서 보내온 가게 리스트 출력할 반복문
                                    	items은 보낸 값, var는 출력할 객체변수 -->
                                    <c:forEach items="${ shopListManager }" var="shopManager">
                                        <tr>
                                            <td id="number">${ shopManager.shopNumber }</td>
                                            <td>${ shopManager.shopTitle }</td>
                                            <td>${ shopManager.shopContent }</td>
                                            <td>
                                            	<fmt:setLocale value="en_US" scope="session"/>
	                                            <fmt:parseDate value="${ shopManager.shopCreateDate }" var="dateValueCreate" pattern="E MMM dd HH:mm:ss z yyyy"/>
												<fmt:formatDate value="${dateValueCreate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                            </td>
                                            <td>
                                            	<fmt:setLocale value="en_US" scope="session"/>
                                            	<fmt:parseDate value="${ shopManager.shopModifyDate }" var="dateValueModify" pattern="E MMM dd HH:mm:ss z yyyy"/>
												<fmt:formatDate value="${dateValueModify}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                            </td>
                                            <td>${ shopManager.shopAddress }</td>
                                            <td>
                                            	<a class="btn btn-warning btn-sm" href="shopModifyFormManager.do?shopNumber=${ shopManager.shopNumber }">수정</a>
                                            	<input type="button" value="삭제" onclick="removeBtn(${ shopManager.shopNumber })" class="btn btn-danger btn-sm"/>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
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
        <!-- JQuery -->
    	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <!-- 부트스트랩 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!-- 파일 내 스크립트 연동 -->
        <script src="${path}/resources/manager/js/scripts.js"></script>
        <!-- 내부 script -->
        <script type="text/javascript">
        	// 삭제 버튼이 눌렸을 때 (보내진 shopNumber를 받아옴)
        	function removeBtn(num) {
        		// num이 받아졌는지 확인
        		console.log(num);
        		// 확인/취소 alert창 띄우기
        		if(confirm("정말 삭제하시겠습니까?") == true) {
        			// 확인을 누를 경우 요청과 함께 값을 보내기
        			location.href="shopDeleteManager.do?shopNumber=" + num;
        			// 삭제 확인 메세지 띄우기
    				alert("삭제되었습니다.");
    			} else {
    				// 취소를 누를 경우 리턴
    				return;
    			}
        	}
        </script>
        <!-- datatable 연동 -->
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <!-- 파일 내 테이블 연동 -->
        <script src="${path}/resources/manager/js/datatables-simple-demo.js"></script>
    </body>
</html>
