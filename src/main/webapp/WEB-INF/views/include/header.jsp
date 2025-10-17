<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | Dashboard</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="/adminlte/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet" href="/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<!--   <link rel="stylesheet" href="/adminlte/plugins/jqvmap/jqvmap.min.css"> -->
<!-- Theme style -->
<link rel="stylesheet" href="/adminlte/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="/adminlte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="/adminlte/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="/adminlte/plugins/summernote/summernote-bs4.min.css">

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- 아이콘 CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- 직접 추가한 CSS -->
<link rel="stylesheet" href="/directlyCss/header.css">


</head>

<style>

</style>

<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

	<!-- Preloader -->
	<div class="preloader flex-column justify-content-center align-items-center">
		<img class="animation__shake" src="/adminlte/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60"
			width="60">
	</div>

	<!-- Navbar -->
	<nav class="main-header navbar navbar-expand navbar-white navbar-light">
		<!-- Left navbar links -->
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
			</li>
			<sec:authorize access="isAuthenticated()">
				<sec:authorize access="hasAnyRole('ROLE_MANAGER')">

					<li class="d-none d-sm-inline-block">
						<a href="/managepage/manage/list" class="nav-link hello">프로젝트</a>
					</li>
					<li class="d-none d-sm-inline-block">
						<a href="/managepage/appr/all" class="nav-link">전자결재</a>
					</li>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('ROLE_COMPANY')">

					<!-- <li class="nav-item d-none d-sm-inline-block">
						<a href="/companypage/goodsManage" class="nav-link">상품관리</a>
					</li> -->
					<!-- <li class="nav-item d-none d-sm-inline-block">
						<a href="/companypage/SurveyList" class="nav-link">설문관리</a>
					</li> -->
				</sec:authorize>
			</sec:authorize>
		</ul>

		<!-- Right navbar links -->
		<ul class="navbar-nav ml-auto">
			<!--      Navbar Search -->
			<!--      <li class="nav-item"> -->
			<!--        <a class="nav-link" data-widget="navbar-search" href="#" role="button"> -->
			<!--          <i class="fas fa-search"></i> -->
			<!--        </a> -->
			<!--        <div class="navbar-search-block"> -->
			<!--          <form class="form-inline"> -->
			<!--            <div class="input-group input-group-sm"> -->
			<!--              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search"> -->
			<!--              <div class="input-group-append"> -->
			<!--                <button class="btn btn-navbar" type="submit"> -->
			<!--                  <i class="fas fa-search"></i> -->
			<!--                </button> -->
			<!--                <button class="btn btn-navbar" type="button" data-widget="navbar-search"> -->
			<!--                  <i class="fas fa-times"></i> -->
			<!--                </button> -->
			<!--              </div> -->
			<!--            </div> -->
			<!--          </form> -->
			<!--        </div> -->
			<!--      </li> -->

			<!--      Messages Dropdown Menu -->
			<!--      <li class="nav-item dropdown"> -->
			<!--        <a class="nav-link" data-toggle="dropdown" href="#"> -->
			<!--          <i class="far fa-comments"></i> -->
			<!--          <span class="badge badge-danger navbar-badge">3</span> -->
			<!--        </a> -->
			<!--        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right"> -->
			<!--          <a href="#" class="dropdown-item"> -->
			<!-- <!--            Message Start -->
			<!--            <div class="media"> -->
			<!--              <img src="/admienlte/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle"> -->
			<!--              <div class="media-body"> -->
			<!--                <h3 class="dropdown-item-title"> -->
			<!--                  Brad Diesel -->
			<!--                  <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span> -->
			<!--                </h3> -->
			<!--                <p class="text-sm">Call me whenever you can...</p> -->
			<!--                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p> -->
			<!--              </div> -->
			<!--            </div> -->
			<!-- <!--            Message End -->
			<!--          </a> -->
			<!--          <div class="dropdown-divider"></div> -->
			<!--          <a href="#" class="dropdown-item"> -->
			<!-- <!--            Message Start -->
			<!--            <div class="media"> -->
			<!--              <img src="/adminlte/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3"> -->
			<!--              <div class="media-body"> -->
			<!--                <h3 class="dropdown-item-title"> -->
			<!--                  John Pierce -->
			<!--                  <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span> -->
			<!--                </h3> -->
			<!--                <p class="text-sm">I got your message bro</p> -->
			<!--                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p> -->
			<!--              </div> -->
			<!--            </div> -->
			<!-- <!--            Message End -->
			<!--          </a> -->
			<!--          <div class="dropdown-divider"></div> -->
			<!--          <a href="#" class="dropdown-item"> -->
			<!-- <!--            Message Start -->
			<!--            <div class="media"> -->
			<!--              <img src="/adminlte/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3"> -->
			<!--              <div class="media-body"> -->
			<!--                <h3 class="dropdown-item-title"> -->
			<!-- <!--                  Nora Silvester -->
			<!--                  <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span> -->
			<!--                </h3> -->
			<!--                <p class="text-sm">The subject goes here</p> -->
			<!--                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p> -->
			<!--              </div> -->
			<!--            </div> -->
			<!-- <!--            Message End -->
			<!--          </a> -->
			<!--          <div class="dropdown-divider"></div> -->
			<!--          <a href="#" class="dropdown-item dropdown-footer">See All Messages</a> -->
			<!--        </div> -->
			<!--      </li> -->
			<!--      Notifications Dropdown Menu -->
			<!-- <li class="nav-item dropdown">
<a class="nav-link" data-toggle="dropdown" href="#">
	<i class="far fa-bell"></i>
	<span class="badge badge-warning navbar-badge">15</span>
</a>
<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
	<span class="dropdown-item dropdown-header">15 Notifications</span>
	<div class="dropdown-divider"></div>
	<a href="#" class="dropdown-item">
		<i class="fas fa-envelope mr-2"></i> 4 new messages
		<span class="float-right text-muted text-sm">3 mins</span>
	</a>
	<div class="dropdown-divider"></div>
	<a href="#" class="dropdown-item">
		<i class="fas fa-users mr-2"></i> 8 friend requests
		<span class="float-right text-muted text-sm">12 hours</span>
	</a>
	<div class="dropdown-divider"></div>
	<a href="#" class="dropdown-item">
		<i class="fas fa-file mr-2"></i> 3 new reports
		<span class="float-right text-muted text-sm">2 days</span>
	</a>
	<div class="dropdown-divider"></div>
	<a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
</div>
</li> -->
			<a href="/logout"><button type="button" class="btn btn-info btn-sm"
					style="background-color: rgb(71, 178, 228); border-color:rgb(71, 178, 228); color: white;">로그아웃</button></a>
		</ul>
	</nav>
	<!-- /.navbar -->

	<!-- Main Sidebar Container -->
	<aside class="main-sidebar elevation-4 sidebar-light-lime">
		<!-- Brand Logo -->
		<a href="/" class="brand-link">
			<!--       <img src="/adminlte/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"> -->
			<!--       <span class="brand-text font-weight-light">Entertainment</span> -->
			<span class="brand-text font-weight-light"
				style="font-size: 30px; font-weight: 500; color: rgb(71, 178, 228); letter-spacing: 2px; text-transform: uppercase;">
				Entertainment
				<!-- </span> -->
		</a>

		<!-- Sidebar -->
		<div class="sidebar">
			<!-- Sidebar user panel (optional) -->
			<!-- ///로그인 안했을 때 시작 /// -->
			<sec:authorize access="isAnonymous()">
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<form action="/login" method="post">
						<input class="form-control" type="text" name="username" placeholder="아이디" required />
						<input class="form-control" type="password" name="password" placeholder="비밀번호" required />
						<button class="btn btn-info btn-sm" type="submit"
							style="background-color:rgb(71, 178, 228); border-color:rgb(71, 178, 228); color:white;">로그인</button>
						<button class="btn btn-warning btn-sm" type="button"
							style="background-color:rgb(208, 208, 208); border-color:rgb(208, 208, 208); color:white;"
							onclick="location.href='/signup'">회원가입</button>
					</form>
				</div>
			</sec:authorize>
			<!-- ///로그인 안했을 때 시작 /// -->
			<!-- ///로그인 했을 때 시작 /// -->
			<sec:authorize access="isAuthenticated()">
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<p>
						<!-- 인증 제공자     유저  상세정보         select 후 MemberVO
		1. authProvider.setUserDetailsService(userServiceImpl);

		2. UserDetailServiceImpl(우리꺼) implements DetailServiceImpl(스프링 시큐리티)
			- MemberVO memberVO = this.memberMapper.read(username);

		3. CustomUser(우리꺼) extends User(스프링 시큐리티)
			- super(username,password,authorities);
				(this : CustomUser)
				(CustomUser = jsp의 principal)
				(CustomUser.member = jsp의 principal.member)
	- this.member = memberVO;
		-->
						<sec:authentication property="principal.member" var="memberVO" />
					</p>
					<div class="image">
						<%-- <img src="${memberVO.fileSaveLocate}" class="img-circle elevation-2" alt="User Image"> --%>
							<%-- <img src="${memberVO.fileSaveLocate}" class="img-circle elevation-2" alt="User Image"> --%>
					</div>
					<div class="info">
						<a href="#" class="d-block">${memberVO.memName}
							<c:forEach var="authList" items="${memberVO.authList}" varStatus="stat">
								<c:if test="${authList.authName eq 'ROLE_COMPANY'}">
									관리자님
								</c:if>
								<c:if test="${authList.authName eq 'ROLE_MANAGER'}">
									직원님
								</c:if>
							</c:forEach>
						</a>
						<!-- 로그아웃 폼페이지 시작 -->
						<%-- <form action="/logout" method="post">
							<button type="submit"
								class="btn btn-block btn-outline-primary btn-xs btn-hover-effect">로그아웃</button>
							<sec:csrfInput />
							</form> --%>
							<!-- 로그아웃 폼페이지 시작 -->
					</div>
				</div>
			</sec:authorize>
			<!-- ///로그인 했을 때 끝 /// -->


			<!-- Sidebar Menu -->
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
					data-accordion="false">
					<!-- /// ROLE_COMPANY 권한 시작 /// -->

					<sec:authorize access="isAuthenticated()">
						<sec:authorize access="hasAnyRole('ROLE_COMPANY')">

							<!-- /// 관리자 메뉴 시작 /// -->
							<li class="nav-header">관리자</li>

							<!-- / 굿즈샵관리 시작 / -->
							<li class="nav-item menu-open">
								<a href="#" class="nav-link colorSet">
									<i class="nav-icon fas fa-dollar-sign"></i>
									<p>
										굿즈샵관리
										<i class="fas fa-angle-left right"></i>
									</p>
								</a>

								<ul class="nav nav-treeview">
									<li class="nav-item">
										<a href="/companypage/noticeManage" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>굿즈샵 공지사항</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/companypage/orderManage" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>주문관리</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/companypage/stockManage" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>재고관리</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/companypage/goodsManage" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>상품관리</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/companypage/goodsData" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>굿즈샵 통계</p>
										</a>
									</li>
								</ul>
							</li>
							<!-- / 굿즈샵관리 끝 / -->
							<!-- / 그룹관리 시작 / -->

							<li class="nav-item menu-open">
								<a href="#" class="nav-link colorSet">
									<i class="nav-icon fas fa-users"></i>
									<p>
										그룹관리
										<i class="fas fa-angle-left right"></i>
									</p>
								</a>
								<ul class="nav nav-treeview">
								<li class="nav-item">
										<a href="/companypage/manageArtist" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>아티스트 관리</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/companypage/manageGroup" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>그룹관리</p>
										</a>
									</li>

									<!-- 	              <li class="nav-item"> -->
									<!-- 	                <a href="/companypage/manageAlbum" class="nav-link"> -->
									<!-- 	                  <i class="far fa-circle nav-icon"></i> -->
									<!-- 	                  <p>앨범관리</p> -->
									<!-- 	                </a> -->
									<!-- 	              </li> -->
									<!-- 	              <li class="nav-item"> -->
									<!-- 	                <a href="/companypage/artistData" class="nav-link"> -->
									<!-- 	                  <i class="far fa-circle nav-icon"></i> -->
									<!-- 	                  <p>아티스트 통계</p> -->
									<!-- 	                </a> -->
									<!-- 	              </li> -->
								</ul>
							</li>
							<!-- / 그룹관리 끝 / -->
							<!-- / 커뮤니티관리 시작 / -->
							<li class="nav-item menu-open">
								<a href="#" class="nav-link colorSet">
									<i class="nav-icon fas fa-sitemap"></i>
									<p>
										커뮤니티관리
										<i class="fas fa-angle-left right"></i>
									</p>
								</a>
								<ul class="nav nav-treeview">
									<li class="nav-item">
										<a href="/companypage/manageMember" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>회원관리</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/companypage/manageComm" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>게시글 관리</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/companypage/managemembership" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>멤버십 관리</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/companypage/manageVod" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>동영상/라이브 관리</p>
										</a>
									</li>
								</ul>
							</li>
							<!-- / 커뮤니티관리 끝 / -->
							<!-- / 기업관리 시작 / -->
							<li class="nav-item menu-open colorSet">
								<a href="#" class="nav-link colorSet">
									<i class="nav-icon fas fa-building"></i>
									<p>
										기업관리
										<i class="fas fa-angle-left right"></i>
									</p>
								</a>
								<ul class="nav nav-treeview" ">
<!-- 			  <li class=" nav-item"> -->
									<!-- 				<a href="/companypage/companyArchives" class="nav-link"> -->
									<!-- 				  <i class="far fa-circle nav-icon"></i> -->
									<!-- 				  <p>자료실</p> -->
									<!-- 				</a> -->
									<!-- 			  </li> -->
									<li class="nav-item menu-open">
										<a href="/companypage/companyEmpManage" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>직원 관리</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/companypage/notice" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>공지사항 관리</p>
										</a>
									</li>
								</ul>
							</li>

							<!-- / 기업관리 끝 / -->
							<!-- / 설문조사 시작 / -->
							<li class="nav-item menu-open">
								<a href="#" class="nav-link colorSet">
									<i class="nav-icon fas fa-clipboard"></i>
									<p>
										설문조사
										<i class="fas fa-angle-left right"></i>
									</p>
								</a>
								<ul class="nav nav-treeview">
								<li class="nav-item">
										<a href="/companypage/SurveyCreate" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>설문 만들기</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="/companypage/SurveyList" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>설문조사 리스트</p>
										</a>
									</li>
									

								</ul>
							</li>
							<!-- / 설문조사 끝 / -->
							<hr class="ePayment-hr" />
							<li class="nav-item">
								<a href="/companypage/reportReply" class="nav-link">
									<i class="nav-icon fas fa-ban"></i>
									<p>
										신고관리
									</p>
								</a>
							</li>
							<!-- / 오디션관리 시작 / -->
							<li class="nav-item">
								<a href="/companypage/auditionList" class="nav-link">
									<i class="nav-icon fas fa-video"></i>
									<p>
										오디션관리
									</p>
								</a>
							</li>
							<!-- / 오디션관리 끝 / -->
							<!-- / 고객센터관리 시작 / -->
							<li class="nav-item">
								<a href="/companypage/FAQ" class="nav-link">
									<i class="nav-icon fas fa-phone"></i>
									<p>
										고객센터관리
									</p>
								</a>
							</li>
							<div style="height: 50px;"></div>
							<!-- / 고객센터관리 끝 / -->
							<!-- /// 관리자 메뉴 끝 /// -->
						</sec:authorize>
					</sec:authorize>

					<!-- /// ROLE_COMPANY 권한 끝 /// -->
					<!-- /// 2.사용자 메뉴 시작 /// -->
					<!-- /// ROLE_MANAGER 권한 시작 /// -->

					<sec:authorize access="isAuthenticated()">
						<sec:authorize access="hasAnyRole('ROLE_MANAGER')">
							<li class="nav-header">직원</li>
							<!-- / 프로젝트관리 시작 / -->
							<li class="nav-item">
								<a href="/managepage/manage/list" class="nav-link">
									<i class="nav-icon fas fa-book"></i>
									<p>
										프로젝트 관리
									</p>
								</a>
							</li>
							<li class="nav-item">
								<a href="/managepage/projectStats" class="nav-link">
									&nbsp;<i class="fas fa-chart-pie"></i>
									<p>
										&nbsp;&nbsp;&nbsp;프로젝트 통계
									</p>
								</a>
							</li>
							<!-- / 프로젝트관리 끝 / -->
							<!-- / 전자결재 - 진행중인문서 시작 / -->
							<hr class="ePayment-hr" />
							<li class="nav-item">
								<div id="ePayment" class="nav-link">
									<i class="nav-icon fas fa-file"></i>
									<p id="font">
										전자결재
									</p>
								</div>
							</li>
							<li class="nav-item in-font">
								<a href="/managepage/pbox/write" class="nav-link">
									&nbsp;&nbsp;&nbsp;&nbsp;<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
										<path
											d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z" />
									</svg>
									<p>&nbsp;&nbsp;작성하기</p>
								</a>
							</li>
<!-- 							<li class="nav-item in-font menu-open"> -->
<!-- 								<a href="#" class="nav-link colorSet"> -->
<!-- 									<i class="nav-icon fas fa-check-circle"></i> -->
<!-- 									<p> -->
<!-- 										&nbsp;&nbsp;진행 중 -->
<!-- 										<i class="fas fa-angle-left right"></i> -->
<!-- 									</p> -->
<!-- 								</a> -->

<!-- 								<ul class="nav nav-treeview"> -->



									<li class="nav-item">
										<a href="/managepage/appr/all" class="nav-link">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<svg xmlns="http://www.w3.org/2000/svg"
												width="16" height="16" fill="currentColor" class="bi bi-files" viewBox="0 0 16 16">
												<path
													d="M13 0H6a2 2 0 0 0-2 2 2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h7a2 2 0 0 0 2-2 2 2 0 0 0 2-2V2a2 2 0 0 0-2-2m0 13V4a2 2 0 0 0-2-2H5a1 1 0 0 1 1-1h7a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1M3 4a1 1 0 0 1 1-1h7a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1z" />
											</svg>
											<p>&nbsp;&nbsp;진행 중인 문서함</p>
										</a>
									</li>

<!-- 									<li class="nav-item"> -->
<!-- 										<a href="/managepage/appr/wait" class="nav-link"> -->
<!-- 											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<svg xmlns="http://www.w3.org/2000/svg" -->
<!-- 												width="16" height="16" fill="currentColor" class="bi bi-hourglass-split" -->
<!-- 												viewBox="0 0 16 16"> -->
<!-- 												<path -->
<!-- 													d="M2.5 15a.5.5 0 1 1 0-1h1v-1a4.5 4.5 0 0 1 2.557-4.06c.29-.139.443-.377.443-.59v-.7c0-.213-.154-.451-.443-.59A4.5 4.5 0 0 1 3.5 3V2h-1a.5.5 0 0 1 0-1h11a.5.5 0 0 1 0 1h-1v1a4.5 4.5 0 0 1-2.557 4.06c-.29.139-.443.377-.443.59v.7c0 .213.154.451.443.59A4.5 4.5 0 0 1 12.5 13v1h1a.5.5 0 0 1 0 1zm2-13v1c0 .537.12 1.045.337 1.5h6.326c.216-.455.337-.963.337-1.5V2zm3 6.35c0 .701-.478 1.236-1.011 1.492A3.5 3.5 0 0 0 4.5 13s.866-1.299 3-1.48zm1 0v3.17c2.134.181 3 1.48 3 1.48a3.5 3.5 0 0 0-1.989-3.158C8.978 9.586 8.5 9.052 8.5 8.351z" /> -->
<!-- 											</svg> -->
<!-- 											<p>&nbsp;&nbsp;대기</p> -->
<!-- 										</a> -->
<!-- 									</li> -->

<!-- 									<li class="nav-item"> -->
<!-- 										<a href="/managepage/appr/check" class="nav-link"> -->
<!-- 											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<svg xmlns="http://www.w3.org/2000/svg" -->
<!-- 												width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16"> -->
<!-- 												<path -->
<!-- 													d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0" /> -->
<!-- 											</svg> -->
<!-- 											<p>&nbsp;&nbsp;확인</p> -->
<!-- 										</a> -->
<!-- 									</li> -->

<!-- 									<li class="nav-item"> -->
<!-- 										<a href="/managepage/appr/will" class="nav-link"> -->
<!-- 											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<svg xmlns="http://www.w3.org/2000/svg" -->
<!-- 												width="16" height="16" fill="currentColor" class="bi bi-clock-fill" viewBox="0 0 16 16"> -->
<!-- 												<path -->
<!-- 													d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z" /> -->
<!-- 											</svg> -->
<!-- 											<p>&nbsp;&nbsp;예정</p> -->
<!-- 										</a> -->
<!-- 									</li> -->

<!-- 									<li class="nav-item"> -->

<!-- 										<a href="/managepage/appr/process" class="nav-link"> -->
<!-- 											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<svg xmlns="http://www.w3.org/2000/svg" -->
<!-- 												width="16" height="16" fill="currentColor" class="bi bi-arrow-clockwise" -->
<!-- 												viewBox="0 0 16 16"> -->
<!-- 												<path fill-rule="evenodd" -->
<!-- 													d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2z" /> -->
<!-- 												<path -->
<!-- 													d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466" /> -->
<!-- 											</svg> -->
<!-- 											<p>&nbsp;&nbsp;진행</p> -->
<!-- 										</a> -->
<!-- 									</li> -->

<!-- 								</ul> -->
							</li>
							<!-- / 전자결재 - 진행중인문서 끝 / -->
							<!-- / 전자결재 - 문서함 시작 / -->
<!-- 							<li class="nav-item in-font menu-open"> -->
<!-- 								<a href="#" class="nav-link colorSet"> -->
<!-- 									<i class="nav-icon fas fa-folder"></i> -->
<!-- 									<p>&nbsp; -->
<!-- 										종료 -->
<!-- 										<i class="fas fa-angle-left right"></i> -->
<!-- 									</p> -->
<!-- 								</a> -->
<!-- 								<ul class="nav nav-treeview "> -->
									<li class="nav-item">
										<a href="/managepage/pbox/all" class="nav-link">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
												class="bi bi-files" viewBox="0 0 16 16">
												<path
													d="M13 0H6a2 2 0 0 0-2 2 2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h7a2 2 0 0 0 2-2 2 2 0 0 0 2-2V2a2 2 0 0 0-2-2m0 13V4a2 2 0 0 0-2-2H5a1 1 0 0 1 1-1h7a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1M3 4a1 1 0 0 1 1-1h7a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1z" />
											</svg>
											<p>&nbsp;&nbsp;완료된 문서함</p>
										</a>
									</li>
<!-- 									<li class="nav-item"> -->
<!-- 										<a href="/managepage/pbox/draft" class="nav-link"> -->
<!-- 											&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 											<i class="fa-solid fa-pencil"></i> -->
<!-- 											<p>&nbsp;&nbsp;기안</p> -->
<!-- 										</a> -->
<!-- 									</li> -->
<!-- 									<li class="nav-item"> -->
<!-- 										<a href="/managepage/pbox/approve" class="nav-link"> -->
<!-- 											&nbsp;&nbsp;&nbsp; -->
<!-- 											<i class="fa-solid fa-signature"></i> -->
<!-- 											<p>&nbsp;&nbsp;결재</p> -->
<!-- 										</a> -->
<!-- 									</li> -->
<!-- 									<li class="nav-item"> -->
<!-- 										<a href="/managepage/pbox/receive" class="nav-link"> -->
<!-- 											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" -->
<!-- 												class="bi bi-person-fill" viewBox="0 0 16 16"> -->
<!-- 												<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" /> -->
<!-- 											</svg> -->
<!-- 											<p>&nbsp;&nbsp;수신</p> -->
<!-- 										</a> -->
<!-- 									</li> -->
<!-- 									<li class="nav-item"> -->
<!-- 										<a href="/managepage/pbox/viewer" class="nav-link"> -->
<!-- 											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" -->
<!-- 												class="bi bi-person-fill-add" viewBox="0 0 16 16"> -->
<!-- 												<path -->
<!-- 													d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" /> -->
<!-- 												<path -->
<!-- 													d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4" /> -->
<!-- 											</svg> -->
<!-- 											<p>&nbsp;&nbsp;회람/참조</p> -->
<!-- 										</a> -->
<!-- 									</li> -->
<!-- 									<li class="nav-item"> -->
<!-- 										<a href="/managepage/pbox/stop" class="nav-link"> -->
<!-- 											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" -->
<!-- 												class="bi bi-ban" viewBox="0 0 16 16"> -->
<!-- 												<path -->
<!-- 													d="M15 8a6.97 6.97 0 0 0-1.71-4.584l-9.874 9.875A7 7 0 0 0 15 8M2.71 12.584l9.874-9.875a7 7 0 0 0-9.874 9.874ZM16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0" /> -->
<!-- 											</svg> -->
<!-- 											<p>&nbsp;&nbsp;반려</p> -->
<!-- 										</a> -->
<!-- 									</li> -->
<!-- 								</ul> -->
							</li>
							<!-- / 전자결재 - 문서함 끝 / -->
<!-- 							<li class="nav-item in-font"> -->
<!-- 								<a href="\managepage\pbox\stampset" class="nav-link"> -->
<!-- 									&nbsp;&nbsp;&nbsp;&nbsp;<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" -->
<!-- 										fill="currentColor" class="bi bi-gear-fill" viewBox="0 0 16 16"> -->
<!-- 										<path -->
<!-- 											d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z" /> -->
<!-- 									</svg> -->
<!-- 									<p>&nbsp;&nbsp;설정</p> -->
<!-- 								</a> -->
<!-- 							</li> -->
							<!-- / 전자결재 ---- 끝 / -->

							<hr class="ePayment-hr" />
							<!-- / 그룹캘린더 시작 / -->
							<li class="nav-item">
								<a href="/managepage/manage/calendar" class="nav-link">
									<i class="nav-icon far fa-image"></i>
									<p>
										그룹 일정
									</p>
								</a>
							</li>
							<!-- / 그룹캘린더 끝 / -->
							<!-- / 그룹커뮤니티 공지 시작 / -->
							<li class="nav-item">
								<a href="/managepage/groupNotice" class="nav-link">
									<i class="nav-icon far fa-image"></i>
									<p>
										그룹커뮤니티 공지
									</p>
								</a>
							</li>
							
							<div style="height: 50px;"></div>
							<!-- / 그룹커뮤니티 공지 끝 / -->
							<!-- / 전자결재 끝 / -->
							<!-- /// 2.사용자 메뉴 시작 /// -->
						</sec:authorize>
					</sec:authorize>

					<!-- /// ROLE_MANAGER 권한 끝 /// -->
				</ul>
			</nav>
			<!-- /.sidebar-menu -->
		</div>
		<!-- /.sidebar -->
	</aside>
	<!-- Content Wrapper. Contains page content -->

<script>
addEventListener("DOMContentLoaded", (event) => {
	// 누른 사이드바 색상 강조
	const currentUrl = window.location.pathname;
	console.log("이게 뭐양?(currentUrl) : ", currentUrl);
  const activeLinks = document.querySelectorAll(`.nav-item .nav-link[href="\${currentUrl}"]`);
	console.log("메뉴 바 선택(activeLinks) : ", activeLinks);

  activeLinks.forEach(link => {
    link.classList.add("active_");
    link.closest('.nav-item').classList.add("menu-open");
  });
});

</script>