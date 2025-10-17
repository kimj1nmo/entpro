<%-- <%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isErrorPage="true" %>>

<section class="content">

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<!--
../ : views폴더(부모)
 -->
<!-- ///// header 시작 ///// -->
<jsp:include page="../include/header_user.jsp"></jsp:include>
<!-- ///// header 끝 ///// -->

<!-- Main content -->
	<div class="error-page">
		<h2 class="headline text-warning">404</h2>
		<div class="error-content">
			<h3>
		 <%=exception.getMessage()%>
		 <%=exception.printStackTrace(new PrintWriter(out))%>

 	<i class="fas fa-exclamation-triangle text-warning"></i> Page Not Found
			</h3>
			<p>
				요청한 문서를 찾지 못했습니다. 만약, 메인으로 이동하고자 하면
				<a href="/">메인</a> 을 클릭해주세요.
			</p>
			<form class="search-form">
				<div class="input-group">
					<input type="text" name="search" class="form-control"
						placeholder="Search">
					<div class="input-group-append">
						<button type="submit" name="submit" class="btn btn-warning">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>

			</form>
		</div>

	</div>

</section>
<!-- ///// footer 시작 ///// -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- ///// footer 끝 ///// -->
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 헤더 포함 -->
<jsp:include page="../include/header_user2.jsp"></jsp:include>
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

      <section class="section error-404 min-vh-100 d-flex flex-column align-items-center justify-content-center">
        <h1>400</h1>
        <h3></h3>
        <h2>잘못된 URL입니다.</h2>
        <a class="btn" href="/">돌아가기</a>
        <img src="/assets3/img/not-found.svg" class="img-fluid py-5" alt="Page Not Found">
        <div class="credits">
          <!-- All the links in the footer should remain intact. -->
          <!-- You can delete the links only if you purchased the pro version. -->
          <!-- Licensing information: https://bootstrapmade.com/license/ -->
          <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
        </div>
      </section>

    </div>



<!-- footer 포함 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
