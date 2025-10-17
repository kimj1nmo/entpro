<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- ///// header 시작 ///// -->
<jsp:include page="../include/header_user.jsp"></jsp:include>
<c:if test="${not empty groupNo}">
<jsp:include page="../include/nav.jsp"></jsp:include>

</c:if>
<!-- ///// header 끝 ///// -->

<!-- 추가한 CSS 시작 -->
<link href="/directlyCss/shop_main.css" rel="stylesheet">
<link href="/assets2/css/shopmain.css" rel="stylesheet">
<!-- Favicons -->
<link href="/assets2/img/favicon.png" rel="icon">
<link href="/assets2/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<!-- <link href="/assets2/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <link href="/assets2/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"> -->
<!-- <link href="/assets2/vendor/aos/aos.css" rel="stylesheet"> -->
<!-- <link href="/assets2/vendor/glightbox/css/glightbox.min.css" rel="stylesheet"> -->
<!-- <link href="/assets2/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"> -->

<!-- Main CSS File -->
<!-- <link href="/assets2/css/main.css" rel="stylesheet"> -->
<!-- <link href="https://unpkg.com/swiper/swiper-bundle.min.css" rel="stylesheet"> -->
<!-- 추가한 CSS 끝 -->

<!-- 추가한 JS 시작 -->
<!-- Vendor JS Files -->
<script src="/assets2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets2/vendor/php-email-form/validate.js"></script>
<script src="/assets2/vendor/aos/aos.js"></script>
<script src="/assets2/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="/assets2/vendor/glightbox/js/glightbox.min.js"></script>
<script src="/assets2/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
<script src="/assets2/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="/assets2/vendor/swiper/swiper-bundle.min.js"></script>
<script src="/assets2/js/shopmain.js?v=1.0" defer></script>
<!-- Main JS File -->
<script src="/assets2/js/main.js"></script>
<!-- 추가한 JS 끝 -->

<div class="section swiper-container" style="padding-top: 0 !important;">
	<!-- Swiper Wrapper -->
	<div class="swiper-wrapper">
		<c:forEach var="goods" items="${goodsList}">
			<div class="swiper-slide">
				<div class="goods-info">
					<h4>${goods.gdsNm}</h4>
					<p>가격:
						<fmt:formatNumber value="${goods.gdsPrice}" type="number" />
					</p>

					<!-- ✅ 대표 이미지 한 장만 표시 -->
					<c:set var="imageSrc" value="/upload/shop/앨범1.png" /> <!-- 기본 이미지 -->
					<c:if test="${not empty goods.fileDetailVOList}">
						<c:forEach var="file" items="${goods.fileDetailVOList}">
							<c:if test="${file.fileSn == 1}">
								<c:set var="imageSrc" value="${file.fileSaveLocate}" />
							</c:if>
						</c:forEach>
					</c:if>

					<!-- ✅ 이미지 클릭 시 상세 페이지로 이동 -->
					<img src="${imageSrc}" alt="${goods.gdsNm}" style="cursor: pointer;"
						onclick="window.location.href='/shop/detail?gdsNo=${goods.gdsNo}'" />


					<!-- 상세 보기 버튼 제거 -->
				</div>
			</div>
		</c:forEach>
	</div>

	<!-- 이전/다음 버튼 -->
	<div class="swiper-button-prev"></div>
	<div class="swiper-button-next"></div>

	<!-- 하단 페이지네이션 -->
	<div class="swiper-pagination"></div>
</div>

<section id="portfolio" class="portfolio section py-5 bg-light">
	<div class="container-fluid text-center categoryGoods">
		<!-- 섹션 제목 -->
		<h2 class="section-title fw-bold">카테고리 굿즈</h2>
	</div>

	<!-- Portfolio Filters -->
	<div class="container-fluid text-center categoryGoods">
		<ul class="nav nav-pills justify-content-center mb-4" id="portfolio-filters">
			<li class="nav-item">
				<button class="nav-link active" data-filter="*">전체 굿즈 모아보기</button>
			</li>
			<c:forEach var="category" items="${categoryList}">
				<li class="nav-item">
					<button class="nav-link" data-filter=".filter-${category.gdsCtgryNo}">
						${category.gdsCtgryNm} 모아보기
					</button>
				</li>
			</c:forEach>
		</ul>
	</div>

	<!-- Portfolio Grid -->
	<div class="row g-4 mx-auto" id="portfolio-items" style="max-width: 1200px;">
		<c:forEach var="goods" items="${goodsList}">
			<!-- ✅ 카테고리 ID를 동적으로 추가 -->
			<div class="col-lg-3 col-md-6 portfolio-item isotope-item filter-${goods.ctgryNo}">
				<div class="card shadow-sm h-100">
					<!-- ✅ 대표 이미지 설정 -->
					<c:set var="imageSrc" value="/upload/shop/앨범1.png" />
					<c:if test="${not empty goods.fileDetailVOList}">
						<c:forEach var="file" items="${goods.fileDetailVOList}">
							<c:if test="${file.fileSn == 1}">
								<c:set var="imageSrc" value="${file.fileSaveLocate}" />
							</c:if>
						</c:forEach>
					</c:if>

					<!-- ✅ 이미지 클릭 시 상세 페이지로 이동 -->
					<img src="${imageSrc}" class="card-img-top img-fluid" alt="${goods.gdsNm}" style="cursor: pointer;"
						onclick="window.location.href='/shop/detail?gdsNo=${goods.gdsNo}'" />

					<div class="card-body">
						<h5 class="card-title">${goods.gdsNm}</h5>

						<p class="card-price text-primary fw-bold">₩
							<fmt:formatNumber value="${goods.gdsPrice}" />
						</p>
						<!-- 상세 보기 버튼 제거 -->
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</section>




<section id="event-section" class="notice section py-5 bg-white">
	<div class="container-fluid text-center goodsNotice">
		<h2 class="section-title fw-bold">이벤트 게시판</h2>
		<p class="text-muted">최근 이벤트를 확인하세요.</p>
	</div>

	<!-- ✅ 이벤트 목록 -->
	<div class="container">
		<div class="list-group">
			<c:forEach var="event" items="${eventList}" end="3">

				<a href="/detail?evtBoardNo=${event.evtBoardNo}" class="list-group-item list-group-item-action">
					<h5 class="mb-1">${event.evtBoardTtl}</h5>
					<small class="text-muted">${event.evtBoardDate}</small>
				</a>
			</c:forEach>
		</div>
	</div>
</section>

<!-- 테스트 끝 -->