<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- ///// header 시작 ///// -->
<jsp:include page="../include/header_user2.jsp"></jsp:include>
<!-- ///// header 끝 ///// -->

<!-- 공통 CSS -->
<!-- <link href="/assets2/css/main.css" rel="stylesheet">
<link href="/assets2/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->

<!-- 공통 JS -->
<script src="/assets2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- detail.jsp 전용 JS -->
<script src="/assets2/js/detail.js"></script>

<!-- detail.jsp 전용 CSS -->
<link href="/assets2/css/detail.css" rel="stylesheet">

<% session.setAttribute("csrf", "12345" ); %>
<div class="container mt-5">
	<div class="row align-items-center">
		<!-- 왼쪽: 상품 이미지 공간 -->
		<div class="col-md-6">
			<div class="product-image">
				<img src="<c:choose>
									<c:when test='${not empty goodsVO.fileDetailVOList}'>
											${goodsVO.fileDetailVOList[0].fileSaveLocate}
									</c:when>
									<c:otherwise>/upload/404.jpg</c:otherwise>
								</c:choose>" alt="${goodsVO.gdsNm}" class="img-fluid">
			</div>
		</div>

		<!-- 오른쪽: 상품 정보 -->
		<div class="col-md-6 product-details">
			<h3>${goodsVO.gdsNm}</h3>

			<!-- 수량 입력 -->
			<div class="form-group mb-3">
				<label for="cartQuantity">수량</label>
				<input type="number" id="cartQuantity" value="1" min="1" required class="form-control quantity-input">
			</div>

			<p>상품 가격: <span class="text-primary fw-bold">₩
					<fmt:formatNumber value="${goodsVO.gdsPrice}" type="number" />
				</span></p>

			<!-- 구매 및 장바구니 버튼 -->
			<div class="product-actions d-flex justify-content-center align-items-center gap-5 mt-3">
				<form action="/shop/payment" method="POST" class="quantity-check-form">
					<input type="hidden" name="gdsNos" value="${goodsVO.gdsNo}">
					<input type="hidden" name="quantities" id="paymentQuantity" value="1">
					<button type="submit" class="btn btn-primary">바로 구매</button>
				</form>

				<form action="/shop/cart" method="POST" class="quantity-check-form">
					<input type="hidden" name="gdsNo" value="${goodsVO.gdsNo}">
					<input type="hidden" name="orderListQy" id="cartHiddenQuantity" value="1">
					<button type="submit" class="btn btn-default">카트 추가</button>
				</form>
			</div>
		</div>
	</div>
</div>




<div class="additional-images mt-5">
	<h4 class="text-center">상품 소개</h4>
	<hr>
	<div class="additional-images-container">
		<c:choose>
			<c:when test="${not empty goodsVO.fileDetailVOList}">
				<c:forEach var="file" items="${goodsVO.fileDetailVOList}">
					<div>
						<img src="${file.fileSaveLocate}" alt="상품 이미지" class="img-fluid additional-image imgSet">
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<!-- 상품 이미지가 없을 경우 기본 이미지 표시 -->
				<div>
					<img src="/upload/404.jpg" alt="기본 이미지" class="img-fluid additional-image">
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>



<!-- 상품 유의사항 -->
<pre class="text-muted text-center" style="font-size: 18px;">${goodsVO.gdsDc}</pre>
<div class="mt-5 text-center">
	<h4>상품 유의사항</h4>
	<ul class="list-unstyled">
		<li>사이즈와 구성은 제작사의 사정에 따라 변경될 수 있습니다. 미리 양해 바랍니다.</li>
		<li>소재의 특성상 크랙과 변색, 이염 등이 있을 수 있습니다.</li>
		<li>아웃박스의 타공 부위는 소재 특성상 갈라짐 현상이 발생할 수 있습니다. 양해 부탁드립니다.</li>
		<li>아웃박스는 본 상품을 보호하기 위한 보호제로, 유통과정에서 생길 수 있는 오염이나 훼손으로 인한 교환 및 환불은 되지 않습니다.</li>
	</ul>
</div>

<!-- ✅ 리뷰 섹션 -->
<div class="review-section mt-5" style="background-color: rgb(252, 252, 252);">
	<h4>리뷰 작성</h4>
	<div class="review-form mb-4 col-md-8 mx-auto">
		<input type="hidden" id="gdsNo" value="${goodsVO.gdsNo}"> <!-- 상품 ID 추가 -->

		<textarea id="reviewContent" rows="3" placeholder="리뷰 내용을 입력하세요" class="form-control mb-2"></textarea>

		<!-- ✅ 이미지 파일 업로드 추가 -->
		<label for="reviewImage" class="form-label">이미지 업로드</label>
		<input type="file" id="reviewImage" class="form-control mb-2" multiple accept="image/*">

		<!-- ✅ 이미지 미리보기 -->
		<div id="previewContainer" class="mt-2"></div>

		<button class="btn btn-primary" onclick="addReview()">리뷰 등록</button>
	</div>


	<h4>리뷰 목록</h4>
	<!-- ✅ 리뷰 목록 출력 -->
	<div id="reviewList" class="row justify-content-center mx-auto" style="max-width: 65vw;">
		<c:forEach var="review" items="${reviewList}">
			<div class="col-md-6 mb-4">
				<div class="review-item mb-3" id="review-${review.reNo}">
					<h5>${review.memId}님의 리뷰</h5>

					<!-- ✅ 기존 리뷰 내용 (기본적으로 보이는 부분) -->
					<div class="review-content-view">
						<p class="review-content">${review.reContent}</p>
					</div>

					<!-- ✅ 수정할 때 보여지는 부분 (기본적으로 숨김) -->
					<div class="review-edit-form d-none">
						<textarea class="form-control review-edit-textarea">${review.reContent}</textarea>

						<!-- ✅ 이미지 업로드 -->
						<label for="reviewImage-${review.reNo}" class="form-label mt-2">이미지 업로드</label>
						<input type="file" id="reviewImage-${review.reNo}" class="form-control review-edit-image" multiple
							accept="image/*">
						<div id="previewContainer-${review.reNo}" class="mt-2 review-image-preview"></div>

						<button class="btn btn-success mt-2 save-review-btn" data-reNo="${review.reNo}">저장</button>
						<button class="btn btn-secondary mt-2 cancel-review-btn">취소</button>
					</div>

					<!-- ✅ 업로드된 이미지 표시 -->
					<div class="review-images">
						<c:forEach var="file" items="${review.fileDetailVOList}">
							<img src="${file.fileSaveLocate}" alt="리뷰 이미지" class="img-thumbnail review-image"
								style="width: 100px; height: 100px;">
						</c:forEach>
					</div>

					<!-- ✅ 리뷰 수정 및 삭제 버튼 -->
					<c:if test="${not empty loggedInUserId and loggedInUserId eq review.memId}">
						<button class="btn btn-default mt-2 update-review-btn" data-reNo="${review.reNo}">수정</button>
						<button class="btn btn-danger mt-2 delete-review-btn" data-reNo="${review.reNo}">삭제</button>
					</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
</body>
</html>