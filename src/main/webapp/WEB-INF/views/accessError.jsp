<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 헤더 포함 -->
<jsp:include page="./include/header_user2.jsp"></jsp:include>
<link href="/directlyCss/join.css" rel="stylesheet">
<!-- 나중에 옮길것 -->

<!-- Bootstrap CSS (필요 시 유지)
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">-->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 아이콘 -->
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<!-- Bootstrap JS (필요 시 유지) -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<div class="container">

	<section
		class="section error-404 min-vh-100 d-flex flex-column align-items-center justify-content-center">
		<h1 style="font-size: 112px;">권한 오류</h1>
		<h3></h3>
		<h2>권한이 없습니다.</h2>
		<a class="btn" href="/">돌아가기</a> <img src="/assets3/img/not-found.svg"
			class="img-fluid py-5" alt="Page Not Found">
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
		</div>
	</section>

</div>



<!-- footer 포함 -->
<jsp:include page="./include/footer.jsp"></jsp:include>
