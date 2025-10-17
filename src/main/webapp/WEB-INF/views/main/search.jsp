<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 헤더 빠짐 시작 -->
<jsp:include page="../include/header_user.jsp"></jsp:include>
<!-- 헤더 빠짐 끝 -->

<section id="team" class="team section">
	<!-- <div style="height: 50px"></div> -->
	<!-- Section Title -->
	<!-- <div class="container section-title aos-init aos-animate"
data-aos="fade-up"-->
<%-- 	<h1>"${searchName}"의 검색 결과입니다</h1> --%>
<%-- 	<h1>"${artistVOList}"</h1> --%>
<%-- 	<h1>"${groupsVOList}"</h1> --%>
<%-- 	<h1>"${goodsVOList}"</h1> --%>

<!-- 	</div> -->

	<!-- End Section Title -->
	<div class="container containerMargin">
		<div class="row gy-2 mx-auto p-5">
			<h3>아티스트</h3>
			<div class="row">
				<c:forEach var="artistVO" items="${artistVOList}" varStatus="stat">
					<div class="col-md-6 mb-3">
						<div class="card" style="max-width: 100%; max-height: 200px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img
										src="${artistVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}"
										class="rounded-image img-fluid" alt="...">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title display-6 d-inline">${artistVO.artistName}</h5>
										<!-- <p class="card-text display-8 fw-bold d-inline">&nbsp;르세라핌</p>↓↓ 실 사용시 아래 주석 해제 후 사용 -->
										<c:forEach var="groupVO" items="${artistVO.groupVOList}"
											varStatus="stat">
<%-- 											<p class="card-text display-8 fw-bold d-inline">&nbsp;${groupVO.groupName}</p> --%>
											<c:choose>
												<c:when test="stat !=0">
													<!-- 조건1이 true일 때 실행할 내용 -->
											<p class="card-text display-8 fw-bold d-inline">,&nbsp;${groupVO.groupName}</p>
												</c:when>
												<c:otherwise>
											<p class="card-text display-8 fw-bold d-inline">&nbsp;${groupVO.groupName}</p>
												</c:otherwise>
											</c:choose>

										</c:forEach>


										<p class="card-text display-8 mt-4 artistProfileSubstr">&nbsp;${artistVO.artistProfile}</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<c:if test="${empty artistVOList}">
				<div class="card mb-3 p-4">
					<div class="row g-0">
						<div class="col-md-8">
							<div class="card-body">
								<h6 class="card-title display-6">해당하는 아티스트를 찾을 수 없습니다</h6>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</div>
		<!-- 아티스트 검색 종료  -->
		<!-- 그룹 검색 시작  -->
		<div class="row gy-2 mx-auto p-5">
			<h2>그룹</h2>
			<div class="row">
				<c:forEach var="groupsVO" items="${groupsVOList}" varStatus="stat">
					<div class="col-md-6 mb-3">
						<div class="card" style="max-width: 100%; max-height: 200px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img
										src="${groupsVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}"
										class="rounded-image img-fluid" alt="...">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title display-6 d-inline">${groupsVO.groupName}</h5>
										<!-- <p class="card-text display-8 fw-bold d-inline">&nbsp;${artistVO.groupIntrcn}</p> -->
										<p class="card-text display-8 mt-4 groupIntrcnSubstr">&nbsp;${artistVO.groupIntrcn}</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<c:if test="${empty groupsVOList}">
				<div class="card mb-3 p-4">
					<div class="row g-0">
						<div class="col-md-8">
							<div class="card-body">
								<h6 class="card-title display-6">해당하는 그룹을 찾을 수 없습니다</h6>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</div>
		<!-- 그륩 검색 종료  -->
		<!-- 굿즈 검색 시작  -->
		<div class="row gy-2 mx-auto p-5">
			<h3>굿즈</h3>
			<div class="row">
				<c:forEach var="goodsVO" items="${goodsVOList}" varStatus="stat">
					<div class="col-md-6 mb-3">
						<div class="card" style="max-width: 100%; max-height: 200px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img
										src="${goodsVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}"
										class="rounded-image img-fluid" alt="...">
								</div>
								<div class="col-md-8">
									<div class="card-body"
										style="max-width: 100%; max-height: 50%;">
										<p class="card-title display-6 d-inline titleSubstr"
											style="font-size: 20px !important;">${goodsVO.gdsNm}</p>
										<!-- <p class="card-text display-8 fw-bold d-inline" style="font-size: 20px !important;">&nbsp;르세라핌</p>↓↓ 실 사용시 아래 주석 해제 후 사용 -->
										<!-- br태그 추가 -->
										<br>
										<p class="card-text display-8 fw-bold d-inline">&nbsp;${goodsVO.categoryName}</p>
										<p class="card-text display-8 mt-4 contentSubstr">&nbsp;${goodsVO.gdsDc}</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<c:if test="${empty goodsVOList}">
				<div class="card mb-3 p-4">
					<div class="row g-0">
						<div class="col-md-8">
							<div class="card-body">
								<h6 class="card-title display-6">해당하는 굿즈를 찾을 수 없습니다</h6>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</div>
		<!-- 굿즈 검색 종료  -->
	</div>
</section>

<!-- /Contact Section -->
<!-- footer 이사감 -->
<script>

	//화면 조절용
	function syncBoxSize() {
		const headBox = document.getElementById('head');
		const dynamicBox = document.getElementById('headerfil');

		// head 박스의 크기 가져오기
		const headWidth = headBox.offsetWidth;
		const headHeight = headBox.offsetHeight;

		//크기 지정
		dynamicBox.style.width = headWidth + 'px';
		dynamicBox.style.height = headHeight + 'px';
	}

	//변경시마다 크기 병경
	window.onload = syncBoxSize;
	window.onresize = syncBoxSize;

	// 굿즈 검색결과 문자열 자르기
	// 요소 지정
	const titles = document.querySelectorAll(".titleSubstr");
	const contents = document.querySelectorAll(".contentSubstr");
	const artistProfiles = document.querySelectorAll(".artistProfileSubstr");
	const groupIntrcns = document.querySelectorAll(".groupIntrcnSubstr");
	// console.log("체킁", titles);

	// 굿즈명 자른 문자열 담기
	titles.forEach(e => {
		e.innerText = e.innerText.substring(0, 20).concat("...")
	});

	// 굿즈 설명 자른 문자열 담기
	contents.forEach(e => {
		e.innerText = e.innerText.substring(0, 70).concat("...")
	});

	// 아티스트 설명 자른 문자열 담기
	artistProfiles.forEach(e => {
		e.innerText = e.innerText.substring(0, 70).concat("...")
	});

	// 그룹 설명 자른 문자열 담기
	groupIntrcns.forEach(e => {
		e.innerText = e.innerText.substring(0, 70).concat("...")
	});


</script>
<jsp:include page="../include/footer_user.jsp"></jsp:include>
<!-- footer 이사감 -->