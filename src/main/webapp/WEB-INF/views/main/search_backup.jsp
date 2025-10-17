<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 헤더 빠짐 시작 -->
<jsp:include page="../include/header_user.jsp"></jsp:include>
<!-- 헤더 빠짐 끝 -->

<section id="team" class="team section">
	<div style="height: 50px"></div>
	<!-- Section Title -->
	<!-- <div class="container section-title aos-init aos-animate"
		data-aos="fade-up">
		<%-- <h1>"${searchName}"의 검색 결과입니다</h1>
		<h1>"${artistVOList}"</h1>
		<h1>"${groupsVOList}"</h1>
		<h1>"${goodsVOList}"</h1> --%>

	</div> -->
	<!-- End Section Title -->

	<div class="container">

		<div class="row gy-2" style="margin:5%">
			<h3>아티스트</h3>
			<c:forEach var="artistVO" items="${artistVOList}" varStatus="stat">
				<div class="col-lg-12 aos-init aos-animate" data-aos="fade-up"
					data-aos-delay="100">
					<div class="team-member d-flex align-items-start">
						<div class="pic" style="height:150px">
							<img src="${artistVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}" class="img-fluid" alt="">
						</div>
						<div class="member-info">
							<h4>${artistVO.artistName}</h4>
							<span>${artistVO.groupName}</span>
							<p>${artistVO.artistProfile}</p>
							<div class="social">
								<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i
									class="bi bi-facebook"></i></a> <a href=""><i
									class="bi bi-instagram"></i></a> <a href=""> <i
									class="bi bi-linkedin"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
<c:if test="${empty artistVOList}">
<div class="col-lg-12 aos-init aos-animate" data-aos="fade-up"
					data-aos-delay="100">
					<div class="team-member d-flex align-items-start">
						<div class="pic">
							<img src="assets/img/team/team-1.jpg" class="img-fluid" alt="">
						</div>
						<div class="member-info">
							<h4>해당하는 아티스트가 없습니다</h4>
							<span>${artistVO.groupName}</span>
							<p>${artistVO.artistProfile}</p>

						</div>
					</div>
				</div></c:if>
		</div>
		<!-- 아티스트 검색 종료  -->
		<!-- 그륩 검색 시작  -->
		<div class="row gy-2" style="margin:5%">
		<div>
			<h2>그룹</h2>
		</div>
			<c:forEach var="groupsVO" items="${groupsVOList}" varStatus="stat">
				<div class="col-lg-12 aos-init aos-animate" data-aos="fade-up"
					data-aos-delay="100">
					<div class="team-member d-flex align-items-start">
						<div class="pic">
							<img src="${groupsVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}" class="img-fluid" alt="assets/img/team/team-1.jpg">
						</div>
						<div class="member-info">
							<h4>${groupsVO.groupName}</h4>
<%-- 							<span>${artistVO.groupIntrcn}</span> --%>
							<p>${artistVO.groupIntrcn}</p>
							<div class="social">
								<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i
									class="bi bi-facebook"></i></a> <a href=""><i
									class="bi bi-instagram"></i></a> <a href=""> <i
									class="bi bi-linkedin"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
<c:if test="${empty groupsVOList}">
<div class="col-lg-12 aos-init aos-animate" data-aos="fade-up"
					data-aos-delay="100">
					<div class="team-member d-flex align-items-start">
						<div class="pic">
							<img src="assets/img/team/team-1.jpg" class="img-fluid" alt="">
						</div>
						<div class="member-info">
							<h4>해당하는 그룹이 없습니다</h4>
							<span>${artistVO.groupName}</span>
							<p>${artistVO.artistProfile}</p>

						</div>
					</div>
				</div></c:if>
		</div>
		<!-- 그륩 검색 종료  -->
		<!-- 굿즈 검색 시작  -->
		<div class="row gy-2" style="margin:5%">
			<h3>굿즈</h3>
			<c:forEach var="goodsVO" items="${goodsVOList}" varStatus="stat">
				<div class="col-lg-12 aos-init aos-animate" data-aos="fade-up"
					data-aos-delay="100">
					<div class="team-member d-flex align-items-start">
						<div class="pic">
							<img src="${goodsVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}" class="img-fluid" alt="">
						</div>
						<div class="member-info">
							<h4>${goodsVO.gdsNm}</h4>
							<span>${goodsVO.ctgryNo}</span>
							<p>${goodsVO.gdsDc}</p>
							<div class="social">
								<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i
									class="bi bi-facebook"></i></a> <a href=""><i
									class="bi bi-instagram"></i></a> <a href=""> <i
									class="bi bi-linkedin"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
<c:if test="${empty goodsVOList}">
<div class="col-lg-12 aos-init aos-animate" data-aos="fade-up"
					data-aos-delay="100">
					<div class="team-member d-flex align-items-start">
						<div class="pic">
							<img src="assets/img/team/team-1.jpg" class="img-fluid" alt="">
						</div>
						<div class="member-info">
							<h4>해당하는 굿즈가 없습니다</h4>
							<span>${artistVO.groupName}</span>
							<p>${artistVO.artistProfile}</p>

						</div>
					</div>
				</div></c:if>
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
</script>
<jsp:include page="../include/footer_user.jsp"></jsp:include>
<!-- footer 이사감 -->