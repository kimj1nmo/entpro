<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Index - Arsha Bootstrap Template</title>
<meta name="description" content="">
<meta name="keywords" content="">

<!-- 다른bootstrap CSS 시작 -->
<!-- Favicons -->
<link href="/assets3/img/favicon.png" rel="icon">
<link href="/assets3/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/assets3/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/assets3/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/assets3/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="/assets3/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="/assets3/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="/assets3/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/assets3/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/assets3/css/style.css" rel="stylesheet">
<!-- 다른bootstrap CSS 끝 -->

<!-- Favicons -->
<link href="/assets/img/favicon.png" rel="icon">
<link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Main CSS File -->
<link href="/assets/css/main.css" rel="stylesheet">

<!-- 직접 추가한 CDN -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">

<!-- =======================================================
* Template Name: Arsha
* Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/
* Updated: Aug 07 2024 with Bootstrap v5.3.3
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
======================================================== -->
</head>

<body class="index-page">

<header id="header" class="header d-flex align-items-center fixed-top ">
	<div id="divMargin1" class="container-fluid container-xl position-relative d-flex align-items-center">

		<a href="/" class="logo d-flex align-items-center">
			<!-- Uncomment the line below if you also wish to use an image logo -->
			<!-- <img src="assets/img/logo.png" alt=""> -->
			<h1 class="sitename">Entertainment</h1>
		</a>

		<nav id="navmenu" class="navmenu">

			<ul>
				<!-- /// 메인 시작 /// -->
				<div class="search-bar killHeight1">
					<div class="search-form d-flex align-items-center" >
						<input id="searchName1" type="text" name="searchName1" placeholder="Search" value="" />
						<button id="search" type="button" title="Search"><i class="bi bi-search"></i></button>
					</div>
				</div>
				<!-- 					<li class="dropdown"><a href="#"><span id="giup">알립니다</span> -->
				<!-- 							<i class="bi bi-chevron-down toggle-dropdown"></i></a> -->
				<!-- 						<ul> -->
				<!-- 			                     <li><a href="/main/companyDetail">기업정보</a></li> -->
				<!-- 비로그인 시 아이콘 -->
				<sec:authorize access="isAnonymous()">
					<!-- 공지사항 아이콘 -->
					<li class="liMove1">
						<i class="bi bi-megaphone me-2" onclick="location.href='/notice'"
							style="font-size: 30px; cursor: pointer;"></i>
					</li>
					<!-- 굿즈샵 아이콘 -->
					<li class="liMove2">
						<i class="bi bi-shop me-2 fs-3" onclick="location.href='/shop/main'" style="cursor: pointer;"></i>
					</li>
				</sec:authorize>

				<!-- 로그인 시 아이콘 -->
				<sec:authorize access="isAuthenticated()">
					<!-- 공지사항 아이콘 -->
					<li class="liMove3">
						<i class="bi bi-megaphone me-2" onclick="location.href='/notice'"
							style="font-size: 30px; cursor: pointer;"></i>
					</li>
					<!-- 굿즈샵 아이콘 -->
					<li class="liMove4">
						<i class="bi bi-shop me-2 fs-3" onclick="location.href='/shop/main'" style="cursor: pointer;"></i>
					</li>
					<!-- 장바구니 아이콘 -->
					<li class="liMove4">
						<i class="bi bi-cart me-2 fs-3" onclick="location.href='/shop/cart'" style="cursor: pointer;"></i>
					</li>
					<!-- 유저 아이콘 -->
					<li class="liMove4">
						<i class="bi bi-person me-3 fs-3" onclick="location.href='/mypage'" style="cursor: pointer;"></i>
					</li>
					<!-- 알림 아이콘 -->
					<!-- <nav class="header-nav ms-auto">
						<ul class="d-flex align-items-center">
							Notification Dropdown
							<li class="nav-item dropdown">
								<a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
									<i class="bi bi-bell me-2 fs-3"></i>
									<span class="badge bg-primary badge-number">4</span>
								</a>End Notification Icon

								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
									<li class="dropdown-header">
										You have 4 new notifications
										<a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
									</li>
									<li>
										<hr class="dropdown-divider">
									</li>

									<li class="notification-item">
										<i class="bi bi-exclamation-circle text-warning"></i>
										<div>
											<h4>System Alert</h4>
											<p>System maintenance scheduled</p>
											<p>10 min. ago</p>
										</div>
									</li>
									<li>
										<hr class="dropdown-divider">
									</li>

									<li class="notification-item">
										<i class="bi bi-x-circle text-danger"></i>
										<div>
											<h4>Error Report</h4>
											<p>Application crash detected</p>
											<p>1 hr. ago</p>
										</div>
									</li>
									<li>
										<hr class="dropdown-divider">
									</li>

									<li class="notification-item">
										<i class="bi bi-check-circle text-success"></i>
										<div>
											<h4>Update Complete</h4>
											<p>System update completed</p>
											<p>2 hrs. ago</p>
										</div>
									</li>
									<li>
										<hr class="dropdown-divider">
									</li>

									<li class="notification-item">
										<i class="bi bi-info-circle text-primary"></i>
										<div>
											<h4>Information</h4>
											<p>New feature added</p>
											<p>4 hrs. ago</p>
										</div>
									</li>
									<li>
										<hr class="dropdown-divider">
									</li>
									<li class="dropdown-footer">
										<a href="#">Show all notifications</a>
									</li>
								</ul>End Notification Dropdown
							</li>
						</ul>
					</nav> -->
				</sec:authorize>

			</ul>
			</li>
			<!-- /// 메인 종료 /// -->
			<!-- /// 마이페이지 시작 /// -->
			<!-- 					<li class="dropdown"><a href="#"><span id="giup">마이페이지</span> -->
			<!-- 							<i class="bi bi-chevron-down toggle-dropdown"></i></a> -->
			<!-- 						<ul> -->
			<!-- 							<li class="dropdown"><a href="#"><span	>마이페이지 메인</span> <i -->
			<!-- 									class="bi bi-chevron-down toggle-dropdown"></i></a> -->
			<!-- 								<ul> -->
			<!-- 									<li><a href="/mypage/main">개인정보수정</a></li> -->
			<!-- 									<li><a href="/mypage/main">가상화폐 충전</a></li> -->
			<!-- 									<li><a href="/mypage/main">알림 설정</a></li> -->
			<!-- 								</ul></li> -->
			<!-- 							<li><a href="/mypage/mypageListview">구독정보</a></li> -->
			<!-- 							<li><a href="/mypage/main">작성댓글</a></li> -->
			<!-- 							<li><a href="/mypage/main">컬렉션</a></li> -->
			<!-- 							<li><a href="/mypage/buyList">구매내역</a></li> -->
			<!-- 						</ul></li> -->
			<!-- /// 마이페이지 종료 /// -->
			<!-- /// 아티스트 시작 /// -->
			<!--                <li class="dropdown"> -->
			<!--                   <a href="#"><span id="giup">그</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a> -->
			<!--                   <ul> -->
			<!--                      <li><a href="#">프로필</a></li> -->
			<!--                      <li><a href="#">라이브</a></li> -->
			<!--                      <li><a href="#">굿즈삽</a></li> -->
			<!--                      <li class="dropdown"><a href="#"><span>아티스트 커뮤니티</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a> -->
			<!--                         <ul> -->
			<!--                            <li><a href="#">아티스트</a></li> -->
			<!--                            <li><a href="#">캘린더</a></li> -->
			<!--                            <li><a href="#">멤버십</a></li> -->
			<!--                            <li><a href="#">라이브</a></li> -->
			<!--                            <li><a href="#">샵</a></li> -->
			<!--                         </ul> -->
			<!--                      </li> -->
			<!--                   </ul> -->
			<!--                </li> -->
			<!-- /// 아티스트 종료 /// -->
			</ul>
			<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
		</nav>
			<sec:authorize access="isAnonymous()">
				<!-- 로그인 안했을 때 시작 -->

				<!-- div 추가 최윤호 -->
				<div class="loginMove">
					<button type="button" onclick="location.href='/login'" class="btn btn-block btn-info text-white px-3 loginBtn">로그인</button>
				</div>
			</sec:authorize>
		<!-- 로그인 안했을 때 끝 -->
		<sec:authorize access="isAuthenticated()">
			<!-- 로그인 했을 때 시작 -->
			<sec:authentication property="principal.member" var="memberVO" />

			<!-- <div style="padding: 0 0 0 15vw;"> -->
				<!-- ${memberVO.memName}님로그인상태 -->
			<!-- </div> -->

			<!-- 접속한 페이지에 따라 다른 폼 나오기(페이지따라 버튼높이가 달라서ㅠㅠ) -->
			<c:set var="currentUri" value="${pageContext.request.requestURI}" />

			<c:choose>
			<c:when test="${currentUri == '/WEB-INF/views/main/main.jsp' or currentUri == '/WEB-INF/views/mypage/main.jsp' }">
				<form action="/logout" method="post">
			</c:when>
				<c:otherwise>
								<form class="formHeight1" action="/logout" method="post">
				</c:otherwise>
			</c:choose>
<%-- 			<c:if test="${currentUri == '/WEB-INF/views/notice/notice.jsp'}"> --%>
<!-- 				<form class="formHeight1" action="/logout" method="post"> -->
<%-- 			</c:if> --%>

<%-- 			<c:if test="${currentUri eq '/WEB-INF/views/main/main.jsp'}"> --%>
<!-- 				<form action="/logout" method="post"> -->
<%-- 			</c:if> --%>
				<c:choose>
					<c:when test="${currentUri == '/WEB-INF/views/notice/question.jsp'}">
						<button id="logOutMove3" type="submit" class="btn btn-block btn-outline-info">로그아웃</button>
					</c:when>
					<c:otherwise>
						<button id="logOutMove1" type="submit" class="btn btn-block btn-outline-info">로그아웃</button>
					</c:otherwise>
				</c:choose>
				<!-- <sec:csrfInput/> -->
				</form>
		</sec:authorize>
		<!-- 로그인 했을떄 끝 -->
		<script type="text/javascript">
		$("#search").on('click', function () {
		    let searchName = $("#searchName1").val();
		    console.log("searchName=", searchName);

		    location.href = "/search?searchName=" + searchName;
		});

		// 엔터 키 이벤트 추가
		$("#searchName1").on("keypress", function (event) {
		    if (event.key === "Enter") {
		        $("#search").click(); // 검색 버튼 클릭 이벤트 실행
		    }
		});

		</script>
	</div>

</header>
<div style="height: 100px;">
</div>

<!-- Vendor JS Files -->
<script src="/assets3/vendor/apexcharts/apexcharts.min.js"></script>
<script src="/assets3/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets3/vendor/chart.js/chart.umd.js"></script>
<script src="/assets3/vendor/echarts/echarts.min.js"></script>
<script src="/assets3/vendor/quill/quill.js"></script>
<script src="/assets3/vendor/simple-datatables/simple-datatables.js"></script>
<script src="/assets3/vendor/tinymce/tinymce.min.js"></script>
<script src="/assets3/vendor/php-email-form/validate.js"></script>
<!-- Bootstrap Bundle (JS와 Popper 포함) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


<!-- Template Main JS File -->
<script src="/assets3/js/main.js"></script>
<script>
	let url = `${currentUri}`;
	console.log("나오닝?", url);
</script>