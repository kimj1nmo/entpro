<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp" %>

<style>
/* 테이블 헤더 글자 크기 줄이기 */
th {
    font-size: 12px;  /* 글자 크기를 12px로 설정 */
    padding: 5px;     /* 셀 안의 여백 조절 */
}

/* 정렬 가능한 헤더 스타일 */
th.sortable {
    cursor: pointer;
    font-size: 12px;  /* 정렬 가능한 헤더 글자 크기 줄이기 */
}

th.sortable:after {
    content: ' ⇅';
    font-size: 10px;  /* 정렬 아이콘 크기도 줄이기 */
}

/* 테이블 본문 글자 크기 조절 */
.table-striped tbody td {
    font-size: 12px;  /* 본문 글자 크기 */
    padding: 5px;     /* 여백 조정 */
}
.card-title {
	white-space: nowrap;
	/* 줄바꿈 방지 */
	display: flex;
	/* 가로 정렬 */
	align-items: center;
	/* 수직 가운데 정렬 */
	gap: 10px;
	/* 아이콘과 텍스트 사이 간격 */
}

/* 마우스 오버 시 행의 배경색 변경 */
.table-striped tbody tr:hover {
	background-color: #f0f0f0;
	/* 배경색 (원하는 색으로 변경 가능) */
	cursor: pointer;
	/* 마우스 커서를 포인터로 변경 */
}

/* 검색 입력란 스타일 */
.search-container {
	margin-bottom: 20px;
	display: flex;
	justify-content: space-between;
}

.search-input {
	width: 100%;
	max-width: 300px;
	padding: 5px;
	font-size: 14px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

/* 정렬 헤더 스타일 */
th.sortable {
	cursor: pointer;
}

th.sortable:after {
	content: ' ⇅';
	font-size: 12px;
}

/* 사이드바 본문 간격 */
.content-wrapper {
	padding-left: 1.5vw !important;
}
.row {
	margin-left: -1.2vw !important;
}

</style>

<div class="content-wrapper">
<!-- Content Header -->
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>상품 관리</h1>
			</div>



		</div>


		<div class="row">
    <!-- ✅ 카테고리 개수 & 리스트 -->
    <div class="col-lg-6 col-md-6 col-sm-12">
        <div class="card bg-info text-white">
            <div class="card-body">
                <!-- ✅ 전체 클릭 가능한 영역으로 수정 -->
                <div class="d-flex justify-content-between align-items-center toggle-area" 
                     onclick="toggleVisibility('categoryList')">
                    <p class="card-text">카테고리 (<strong>${fn:length(categoryList)}</strong>)</p>
                    <span class="toggle-btn">∨</span>
                </div>

                <!-- ✅ 스크롤 가능한 카테고리 목록 -->
                <div class="scroll-container" id="categoryList" style="display: none;">
                    <ul class="category-list">
                        <li class="category-item" onclick="filterByCategory('all')">
                            <strong>카테고리 전체 보기</strong>
                        </li>
                        <c:forEach var="category" items="${categoryList}">
                            <li class="category-item" onclick="filterByCategory('${category.gdsCtgryNo}')">
                                ${category.gdsCtgryNm}
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- ✅ 그룹 개수 & 리스트 -->
    <div class="col-lg-6 col-md-6 col-sm-12">
        <div class="card bg-secondary text-white">
            <div class="card-body">
                <!-- ✅ 전체 클릭 가능한 영역으로 수정 -->
                <div class="d-flex justify-content-between align-items-center toggle-area" 
                     onclick="toggleVisibility('groupList')">
                    <p class="card-text">그룹 (<strong>${fn:length(groupList)}</strong>)</p>
                    <span class="toggle-btn">∨</span>
                </div>

                <!-- ✅ 그룹 목록 -->
                <div class="scroll-container" id="groupList" style="display: none;">
                    <ul class="group-list">
                        <li class="group-item" onclick="filterByGroup('all')">
                            <strong>그룹 전체 보기</strong>
                        </li>
                        <c:forEach var="group" items="${groupList}">
                            <li class="group-item" onclick="filterByGroup('${group.groupNo}')">
                                ${group.groupName}
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>



	</div>
</div>

<!-- Content Section -->
<div class="goods-list-container">
	<h2>상품 목록</h2>

	<!-- 검색 및 등록 버튼 -->
	<div class="search-container">
		<input type="text" id="searchInput" class="search-input" placeholder="검색어를 입력하세요...">
		<a data-toggle="modal" data-target="#modalAdd" class="btn btn-primary">등록</a>
	</div>

	<c:choose>

		<c:when test="${not empty goodsList}">
			<table border="1" class="table table-striped" id="goodsTable">
				<thead>
					<tr>
						<th class="sortable" onclick="sortTable(0)">상품 번호</th>
						<th class="sortable" onclick="sortTable(1)">이미지</th>
						<th class="sortable" onclick="sortTable(2)">그룹</th>
						<th class="sortable" onclick="sortTable(3)">상품 이름</th>
						<th class="sortable" onclick="sortTable(4)">가격</th>
						<th class="sortable" onclick="sortTable(5)">등록인</th>
						<th class="sortable" onclick="sortTable(6)">등록일</th>
						<th class="sortable" onclick="sortTable(7)">카테고리</th>


						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="goods" items="${goodsList}">
						<tr onclick="openUpdateModal('${goods.gdsNo}', '${goods.fileGroupNo}', 
'${goods.gdsNm}', '${goods.gdsPrice}', '${goods.memId}', 
'${goods.gdsDate}')" data-category-id="${goods.gdsCtgry.gdsCtgryNo}"
							data-group-id="${goods.groups.groupNo}">

							<td>${goods.gdsNo}</td>
							<td>

								<c:choose>
									<c:when test="${not empty goods.fileDetailVOList}">
										<c:forEach var="file" items="${goods.fileDetailVOList}">
											<c:if test="${file.fileSn == 1}">
												<img src="${file.fileSaveLocate}" alt="대표 이미지" width="50">
											</c:if>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<span>이미지 없음</span>
									</c:otherwise>
								</c:choose>


							</td>
							<td>${goods.groups.groupName}</td>
							<td>${goods.gdsNm}</td>
							<td>
								<fmt:formatNumber value="${goods.gdsPrice}" type="currency" />
							</td>
							<td>${goods.memId}</td>
							<td>
								<fmt:formatDate value="${goods.gdsDate}" pattern="yyyy-MM-dd" />
							</td>
							<td>${goods.gdsCtgry.gdsCtgryNm}</td>



							<td>
								<button type="button" class="btn btn-warning btn-sm" data-gds-no="${goods.gdsNo}"
									data-gds-name="${goods.gdsNm}" data-gds-price="${goods.gdsPrice}"
									data-gds-desc="${goods.gdsDc}" data-group-no="${goods.groups.groupNo}"
									data-ctgry-no="${goods.gdsCtgry.gdsCtgryNo}" data-file-urls="
<c:forEach var='file' items='${goods.fileDetailVOList}' varStatus='status'>
${file.fileSaveLocate}<c:if test='${!status.last}'>,</c:if>
</c:forEach>
" onclick="openUpdateModal(this)">
									수정
								</button>

							</td>


							<td>
								<form action="/companypage/deleteGoods" method="post" onsubmit="return confirmDelete()">
									<input type="hidden" name="gdsNo" value="${goods.gdsNo}">
									<button type="submit" class="btn btn-danger btn-sm">
										삭제
									</button>
								</form>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>

		<c:otherwise>
			<p>현재 표시할 상품이 없습니다.</p>
		</c:otherwise>
	</c:choose>
</div>

<!-- 상품 등록 모달 (초기 상태: 숨김) -->
<div id="modalAdd" class="modal fade" tabindex="-1" aria-labelledby="modalAddLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">상품 등록</h4>
				<button type="button" class="close" id="closeModalButton">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="addGoodsForm" action="/companypage/goodsRegister" method="post"
					enctype="multipart/form-data">
					<input type="hidden" id="memId" name="memId" value="${sessionScope.loggedInUserId}" />

					<div class="form-group">
						<label for="goodsCtgry">카테고리</label>
						<select class="form-control" id="goodsCtgry" name="ctgryNo">
							<option value="">카테고리를 선택하세요</option>
							<c:forEach var="category" items="${categoryList}">
								<option value="${category.gdsCtgryNo}">${category.gdsCtgryNm}
								</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label for="goodsGroup">그룹</label>
						<select class="form-control" id="goodsGroup" name="groupNo">
							<option value="">그룹을 선택하세요</option>
							<c:forEach var="group" items="${groupList}">
								<option value="${group.groupNo}">${group.groupName}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label for="goodsName">상품명</label>
						<input type="text" class="form-control" id="goodsName" name="gdsNm" required>
					</div>

					<div class="form-group">
						<label for="goodsDesc">설명</label>
						<textarea class="form-control" id="goodsDesc" name="gdsDc" rows="10" required></textarea>
					</div>

					<div class="form-group">
						<label for="goodsPrice">가격</label>
						<input type="number" class="form-control" id="goodsPrice" name="gdsPrice" required>
					</div>

					<!-- ✅ 이미지 업로드 필드 -->

					<div class="form-group">
						<label for="uploadFile">이미지 업로드</label>
						<input type="file" class="form-control" id="uploadFile" name="uploadFiles" accept="image/*"
							multiple>
						<div id="previewImages" style="margin-top: 10px;"></div>
						<!-- 이미지 미리보기 영역 -->
					</div>

					<div class="modal-footer">
					   <button type="button" class="btn btn-info" id="autoFillButton">자동 입력</button>
						<button type="button" class="btn btn-secondary" id="closeModalButtonFooter">닫기</button>
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>




<!-- ✅ 상품 수정 모달 -->
<!-- ✅ 상품 수정 모달 -->
<div class="modal fade" id="modalUpdate" tabindex="-1" aria-labelledby="modalUpdateLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">상품 수정</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="updateGoodsForm" action="/companypage/goodsUpdate" method="post"
					enctype="multipart/form-data">
					<input type="hidden" id="updateGoodsId" name="gdsNo">

					<!-- ✅ 카테고리 선택 -->
					<div class="form-group">
						<label for="updateGoodsCtgry">카테고리</label>
						<select class="form-control" id="updateGoodsCtgry" name="ctgryNo">
							<option value="">카테고리를 선택하세요</option>
							<c:forEach var="category" items="${gdsCtgryList}">
								<option value="${category.gdsCtgryNo}">${category.gdsCtgryNm}
								</option>
							</c:forEach>
						</select>
					</div>

					<!-- ✅ 그룹 선택 -->
					<div class="form-group">
						<label for="updateGoodsGroup">그룹</label>
						<select class="form-control" id="updateGoodsGroup" name="groupNo">
							<option value="">그룹을 선택하세요</option>
							<c:forEach var="group" items="${groupList}">
								<option value="${group.groupNo}">${group.groupName}</option>
							</c:forEach>
						</select>
					</div>

					<!-- ✅ 상품명 -->
					<div class="form-group">
						<label for="updateGoodsName">상품명</label>
						<input type="text" class="form-control" id="updateGoodsName" name="gdsNm" required>
					</div>

					<!-- ✅ 설명 -->
					<div class="form-group">
						<label for="updateGoodsDesc">설명</label>
						<textarea class="form-control" id="updateGoodsDesc" name="gdsDc" rows="10" required></textarea>

					</div>

					<!-- ✅ 가격 -->
					<div class="form-group">
						<label for="updateGoodsPrice">가격</label>
						<input type="number" class="form-control" id="updateGoodsPrice" name="gdsPrice" required>
					</div>

					<!-- ✅ 기존 이미지 미리보기 (다중 가능) -->
					<div class="form-group">
						<label>현재 이미지</label>
						<div id="updatePreviewImages" class="d-flex flex-wrap"></div>
					</div>

					<!-- ✅ 새 이미지 업로드 -->
					<div class="form-group">
						<label for="updateUploadFile">이미지 변경 (다중 선택 가능)</label>
						<input type="file" class="form-control" id="updateUploadFile" name="uploadFiles"
							accept="image/*" multiple>
					</div>

					<!-- ✅ 수정 버튼 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>







<script type="text/javascript">
<!-- ✅ 자동 입력 스크립트 -->

    $(document).ready(function () {
        $("#autoFillButton").on("click", function () {
            // 기본 값 설정
            $("#goodsName").val("뉴진스 2nd EP 《Get Up》");
            $("#goodsDesc").val("품명\nNew Jeans 『1st EP』 [Limited Edition]\n\n레이블\nADOR / HYBE Labels\n\n발매일\n2024.08.01\n\n타이틀\nAttention\n\n구성\n포토북, 포토카드, 가사지, 스티커, 포스터 등 (상세페이지 참고)\n\n트랙리스트\n\nAttention\nHype Boy\nCookie\nHurt\nAttention (Instrumental)\n\n제작자 또는 공급자\nYG PLUS");

            $("#goodsPrice").val(54000);

            // 카테고리와 그룹을 자동 선택 (첫 번째 항목 선택)
            $("#goodsCtgry option:eq(1)").prop("selected", true);
            $("#goodsGroup option:eq(1)").prop("selected", true);
        });
    });


	//✅ 클릭하면 보이거나 숨김 기능 추가
	function toggleVisibility(id) {
		let element = document.getElementById(id);
		if (element.style.display === "none") {
			element.style.display = "block";
		} else {
			element.style.display = "none";
		}
	}
	//✅ 카테고리 필터링 함수 (데이터 속성 활용)
	// ✅ 선택된 카테고리와 그룹을 저장할 변수
	let selectedCategory = null;
	let selectedGroup = null;

	// ✅ 카테고리 필터링 함수
	function filterByCategory(categoryId) {
		if (categoryId === "all") {
			selectedCategory = null; // 카테고리 전체 보기 선택 시 필터 해제
		} else {
			selectedCategory = selectedCategory === categoryId ? null : categoryId;
		}
		applyFilters();
	}

	// ✅ 그룹 필터링 함수
	function filterByGroup(groupId) {
		if (groupId === "all") {
			selectedGroup = null; // 그룹 전체 보기 선택 시 필터 해제
		} else {
			selectedGroup = selectedGroup === groupId ? null : groupId;
		}
		applyFilters();
	}

	// ✅ 필터 적용 함수 (카테고리 & 그룹 동시 적용 가능)
	function applyFilters() {
		document.querySelectorAll("#goodsTable tbody tr").forEach(row => {
			const rowCategoryId = row.dataset.categoryId;
			const rowGroupId = row.dataset.groupId;

			// ✅ 필터 조건 확인
			const matchesCategory = selectedCategory ? rowCategoryId === selectedCategory : true;
			const matchesGroup = selectedGroup ? rowGroupId === selectedGroup : true;

			// ✅ 두 조건을 모두 만족하는 경우에만 표시
			row.style.display = matchesCategory && matchesGroup ? "" : "none";
		});
	}

	// ✅ 문서 로드 시 데이터 속성 확인용 로그 (테스트용)
	document.addEventListener("DOMContentLoaded", function () {
		console.log("📢 DOM 로드 완료, 데이터 속성 확인");

		document.querySelectorAll("#goodsTable tbody tr").forEach(row => {
			console.log(`🎯 상품: ${row.querySelector("td:nth-child(4)").textContent.trim()} | 카테고리 ID: ${row.dataset.categoryId} | 그룹 ID: ${row.dataset.groupId}`);
		});
	});


	// ✅ 문서 로드 시 테이블에 데이터 속성 자동 추가 (안 해도 되지만, 혹시 몰라서 유지)
	document.addEventListener("DOMContentLoaded", function () {
		console.log("📢 DOM 로드 완료, 데이터 속성 확인");

		document.querySelectorAll("#goodsTable tbody tr").forEach(row => {
			console.log(`🎯 상품: ${row.querySelector("td:nth-child(4)").textContent.trim()} | 카테고리 ID: ${row.dataset.categoryId} | 그룹 ID: ${row.dataset.groupId}`);
		});
	});



	document.addEventListener("DOMContentLoaded", function () {
		console.log("📢 DOM 로드 완료, 스크립트 실행");

		// ✅ 이미지 미리보기 기능 추가
		document.getElementById('uploadFile').addEventListener('change', function (event) {
			const previewContainer = document.getElementById('previewImages');
			previewContainer.innerHTML = ""; // 기존 이미지 초기화

			const files = event.target.files;
			if (files.length > 0) {
				Array.from(files).forEach(file => {
					const reader = new FileReader();
					reader.onload = function (e) {
						const img = document.createElement('img');
						img.src = e.target.result;
						img.style.width = '100px';
						img.style.marginRight = '10px';
						img.style.border = '1px solid #ccc';
						img.style.padding = '5px';
						previewContainer.appendChild(img);
					};
					reader.readAsDataURL(file);
				});
			}
		});

		// ✅ 상품 수정 모달 열기




		// ✅ 검색 기능
		document.getElementById('searchInput').addEventListener('input', function () {
			const searchValue = this.value.toLowerCase();
			const rows = document.querySelectorAll('#goodsTable tbody tr');

			rows.forEach(row => {
				const rowData = Array.from(row.cells).map(cell => cell.textContent.toLowerCase());
				const match = rowData.some(data => data.includes(searchValue));

				row.style.display = match ? '' : 'none';
			});
		});

		// ✅ 테이블 정렬 기능
		document.querySelectorAll(".sortable").forEach((header, index) => {
			header.addEventListener("click", function () {
				sortTable(index);
			});
		});

	});

	// ✅ 테이블 정렬 기능
	document.addEventListener("DOMContentLoaded", function () {
		console.log("📢 DOM 로드 완료, 스크립트 실행");

		// 모든 정렬 가능한 헤더에 클릭 이벤트 추가
		document.querySelectorAll(".sortable").forEach((header, index) => {
			header.addEventListener("click", function () {
				sortTable(index);
			});
		});
	});

	function sortTable(columnIndex) {
		const table = document.getElementById("goodsTable");
		const tbody = table.querySelector("tbody");
		const rows = Array.from(tbody.querySelectorAll("tr"));

		// 현재 정렬 상태 확인 및 전환
		let isDescending = table.dataset.sortColumn === columnIndex.toString()
			? table.dataset.sortOrder !== "desc" // 첫 클릭시 내림차순, 두번째 클릭시 오름차순
			: true;

		table.dataset.sortOrder = isDescending ? "desc" : "asc";
		table.dataset.sortColumn = columnIndex;

		// 정렬 로직 (숫자, 날짜, 문자열 지원)
		rows.sort((a, b) => {
			let aText = a.cells[columnIndex].textContent.trim();
			let bText = b.cells[columnIndex].textContent.trim();

			// 숫자로 변환 가능하면 숫자로 정렬
			let aNum = parseFloat(aText.replace(/[^0-9.-]/g, ""));
			let bNum = parseFloat(bText.replace(/[^0-9.-]/g, ""));

			if (!isNaN(aNum) && !isNaN(bNum)) {
				return isDescending ? bNum - aNum : aNum - bNum;
			}

			// 날짜 형식인지 확인 후 정렬 (YYYY-MM-DD)
			let aDate = Date.parse(aText);
			let bDate = Date.parse(bText);
			if (!isNaN(aDate) && !isNaN(bDate)) {
				return isDescending ? bDate - aDate : aDate - bDate;
			}

			// 기본적으로 문자열 정렬 (한글 지원)
			return isDescending ? bText.localeCompare(aText, 'ko-KR') : aText.localeCompare(bText, 'ko-KR');
		});

		// 정렬된 행을 다시 추가
		rows.forEach(row => tbody.appendChild(row));
	}





	function confirmDelete() {
		return confirm("정말 삭제하시겠습니까?");
	}

	function openUpdateModal(button) {
		const gdsNo = button.getAttribute("data-gds-no");
		const ctgryNo = button.getAttribute("data-ctgry-no");
		const groupNo = button.getAttribute("data-group-no");
		const gdsName = button.getAttribute("data-gds-name");
		const gdsPrice = button.getAttribute("data-gds-price");
		const gdsDesc = button.getAttribute("data-gds-desc");
		const fileUrls = button.getAttribute("data-file-urls"); // ✅ 기존 이미지 URL 가져오기

		document.getElementById("updateGoodsId").value = gdsNo;
		document.getElementById("updateGoodsName").value = gdsName;
		document.getElementById("updateGoodsPrice").value = gdsPrice;
		document.getElementById("updateGoodsDesc").value = gdsDesc;

		// ✅ 기존 카테고리 선택값 유지
		if (ctgryNo) {
			let categorySelect = document.getElementById("updateGoodsCtgry");
			let option = categorySelect.querySelector("option[value='" + ctgryNo + "']");
			if (option) {
				option.selected = true;
			}
		}

		// ✅ 기존 그룹 선택값 유지
		if (groupNo) {
			let groupSelect = document.getElementById("updateGoodsGroup");
			let option = groupSelect.querySelector("option[value='" + groupNo + "']");
			if (option) {
				option.selected = true;
			}
		}

		// ✅ 기존 이미지 미리보기 (여러 개 가능)
		const imagePreviewContainer = document.getElementById("updatePreviewImages");
		imagePreviewContainer.innerHTML = ""; // 기존 이미지 초기화

		if (fileUrls) {
			const images = fileUrls.split(","); // 여러 개의 이미지 URL이 있을 경우
			images.forEach(fileUrl => {
				if (fileUrl.trim() !== "") {
					const img = document.createElement("img");
					img.src = fileUrl.trim();
					img.alt = "기존 이미지";
					img.width = 100;
					img.style.marginRight = "10px";
					img.style.border = "1px solid #ccc";
					img.style.padding = "5px";
					imagePreviewContainer.appendChild(img);
				}
			});
		} else {
			imagePreviewContainer.innerHTML = "<span>기존 이미지 없음</span>";
		}

		// ✅ 새 이미지 업로드 시 미리보기 추가 (다중 파일 가능)
		document.getElementById("updateUploadFile").addEventListener("change", function (event) {
			const files = event.target.files;
			if (files.length > 0) {
				Array.from(files).forEach(file => {
					const reader = new FileReader();
					reader.onload = function (e) {
						const img = document.createElement("img");
						img.src = e.target.result;
						img.width = 100;
						img.style.marginRight = "10px";
						img.style.border = "1px solid #ccc";
						img.style.padding = "5px";
						imagePreviewContainer.appendChild(img);
					};
					reader.readAsDataURL(file);
				});
			}
		});

		$("#modalUpdate").modal("show");
	}



</script>
<!-- ✅ Ensure script is at the bottom of the page -->



</body>

</html>


<%@ include file="../include/footer.jsp" %>