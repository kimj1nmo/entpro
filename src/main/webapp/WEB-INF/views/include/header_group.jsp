<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Main CSS File -->
<link href="/assets/css/main.css" rel="stylesheet">


<!-- =======================================================
  * Template Name: Arsha
  * Template URL: https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->

<!-- adminlte css -->
<link rel="stylesheet"
	href="/adminlte/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- AdminLTE CSS -->
<link rel="stylesheet" href="/adminlte/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="/adminlte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="/adminlte/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="/adminlte/plugins/summernote/summernote-bs4.min.css">
</head>
<style>
header.header {
    background-color: #000000; /* 검은색 배경 */
    color: #ffffff; /* 텍스트를 흰색으로 변경 */
}

header.header .sitename {
   color: #8fefef !important; /* 민트색, !important로 우선 적용 */
    font-weight: bold; /* 텍스트 강조 */
    transition: color 0.3s ease; /* 색상 전환 효과 */
}
header.header .sitename:hover {
    color: #34a17a !important; /* 호버 시 색상 변경 */
}

header.header a {
    color: #ffffff; /* 헤더 내 링크 색상 */
}

/* header.header a:hover { */
/*     color: #cccccc; /* 링크 호버 시 색상 */ */
/* } */
</style>

<body class="index-page">

	<header id="header" class="header d-flex align-items-center fixed-top ">
		<div id="divMargin2" class="container-fluid container-xl position-relative d-flex align-items-center">

			<a href="/"
				class="logo d-flex align-items-center mainName"> <!-- Uncomment the line below if you also wish to use an image logo -->
				<!-- <img src="assets/img/logo.png" alt=""> -->
				<h1 class="sitename">Entertainment</h1>
			</a>

			<%-- 			<a href="/${groupNo}/feed" class="logo d-flex align-items-center"> --%>
			<%-- 				<p>${groupName}</p> --%>
			<!-- 				</a> -->

			<sec:authorize access="isAuthenticated()">
				<div id="headerDiv" class="HeaderCommunityDropdownWrapperView_community__5e7o-"
				aria-expanded="false">
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				<div id="logoutHeaderDiv" class="HeaderCommunityDropdownWrapperView_community__5e7o-"
				aria-expanded="false">
			</sec:authorize>
				<h2 class="select_wrap">
					<button type="button"
						class="HeaderCommunityDropdownWrapperView_select__9B0P3"
						aria-haspopup="listbox">
						<span id="groupNameSetting" class="HeaderCommunityDropdownWrapperView_name__FZXsx">${groupName}</span>
					</button>
				</h2>
				<div class="HeaderCommunityDropdownWrapperView_header_layer__diWh6">
					<a href="/"
						class="HeaderCommunityDropdownWrapperView_link_more__WIBDk">새로운
						아티스트를 만나보세요!</a>
				</div>
			</div>

			<nav id="navmenu" class="navmenu">
				<ul>
					<!-- /// 메인 시작 /// -->
					<div class="search-bar killHeight2">
						<form class="search-form d-flex align-items-center" method="POST" action="#">
							<input type="text" name="query" placeholder="Search" title="Enter search keyword">
							<button type="submit" title="Search"><i class="bi bi-search"></i></button>
						</form>
					</div>
					<!--
					<li class="dropdown">

							<form action="/search" method="post" class="php-email-form">
              <div class="newsletter-form">
              <input type="text" name="searchName1" id="searchName1">
              <input type="button" id="search" value="ad">
              </div>

            </form>-->
					</li>
<!-- 					<li class="dropdown"><a href="#"><span id="giup">알립니다</span> -->
<!-- 							<i class="bi bi-chevron-down toggle-dropdown"></i></a> -->
<!-- 						<ul> -->
<!-- 			                     <li><a href="/main/companyDetail">기업정보</a></li> -->
        <!-- 비로그인시 아이콘 -->
				<sec:authorize access="isAnonymous()">
					<!-- 공지사항 아이콘 -->
					<li class="liMove5">
						<i class="bi bi-megaphone me-2" onclick="location.href='/notice'"
							style="font-size: 30px; cursor: pointer;"></i>
					</li>
					<!-- 굿즈샵 아이콘 -->
					<li class="liMove6">
						<i class="bi bi-shop me-2 fs-3" onclick="location.href='/shop/main'" style="cursor: pointer;"></i>
					</li>
				</sec:authorize>

				<!-- 로그인시 아이콘 -->
				<sec:authorize access="isAuthenticated()">
					<!-- 공지사항 아이콘 -->
					<li class="liMove7">
						<i class="bi bi-megaphone me-2" onclick="location.href='/notice'"
							style="font-size: 30px; cursor: pointer;"></i>
					</li>
					<!-- 굿즈샵 아이콘 -->
					<li class="liMove8">
						<i class="bi bi-shop me-2 fs-3" onclick="location.href='/shop/main'" style="cursor: pointer;"></i>
					</li>
					<!-- 장바구니 아이콘 -->
					<li class="liMove9">
						<i class="bi bi-cart me-2 fs-3" onclick="location.href='/shop/main'" style="cursor: pointer;"></i>
					</li>
					<!-- 유저 아이콘 -->
					<li class="liMove10">
						<i class="bi bi-person me-3 fs-3 iconSize" onclick="location.href='/mypage'" style="cursor: pointer;"></i>
					</li>
					<!-- 알림 아이콘 -->
					<!-- <nav class="header-nav ms-auto liMove11">
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

<!--                      <li><a href="#">알림(협의필요/아이콘처리)</a></li> -->
						</ul></li>
					<!-- /// 메인 종료 /// -->
					<!-- /// 마이페이지 시작 /// -->
<!-- 					<li class="dropdown"><a href="#"><span id="giup">마이페이지</span> -->
<!-- 							<i class="bi bi-chevron-down toggle-dropdown"></i></a> -->
<!-- 						<ul> -->
<!-- 							<li class="dropdown"><a href="#"><span>마이페이지 메인</span> <i -->
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

			</nav>
			<sec:authorize access="isAnonymous()">
				<!-- 로그인 안했을떄시작 -->
				<!-- div 추가 최윤호 -->
				<div class="loginMove2">
					<button type="button" onclick="location.href='/login'" class="btn btn-block btn-info text-white px-3 loginBtn">로그인</button>
				</div>
			</sec:authorize>
			<!-- 로그인 안했을떄 끝ㄴ -->
			<sec:authorize access="isAuthenticated()">
				<!-- 로그인 했을떄 시작 -->
				<sec:authentication property="principal.member" var="memberVO" />

				<%-- <div>${memberVO.memName}님로그인상태</div> --%>
				<form class="formHeight2" action="/logout" method="post">
					<button id="logOutMove2" type="submit" class="btn btn-block btn-outline-info">로그아웃</button>
					<!-- <sec:csrfInput/> -->
				</form>
			</sec:authorize>
			<!-- 로그인 했을떄 끝 -->

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

<script type="text/javascript">
$("#search").on('click',function(){
	let searchName =$("#searchName1").val();
	console.log("searchName=",searchName);

	location.href="/search?searchName="+searchName;
})
</script>
		</div>

	</header>
		<div style="height: 100px;">
</div>