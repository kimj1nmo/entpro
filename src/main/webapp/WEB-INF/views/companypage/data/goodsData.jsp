<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.container1 {
	display: flex;
	justify-content: center;
}

.box {
	width: 70%;
	box-sizing: border-box;
	padding: 10px;
	text-align: center;
}

/* 본문 최소 높이 */
.content-wrapper {
	min-height: 120vh !important;
}
</style>
<%@ include file="../../include/header.jsp" %>
<div class="content-wrapper">
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/companypage/main">managepage</a></li>
						<li class="breadcrumb-item active">Sales Statistics</li>
					</ol>
				</div>
			</div>
		</div>
	</div>

	<!-- 메인 차트 영역 -->
	<section class="content">
		<div class="container-fluid">
			<h3>굿즈 매출 통계</h3>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<button id="category-sales-btn" class="btn btn-primary">카테고리별 매출</button>
							<button id="group-sales-btn" class="btn btn-primary">그룹별 매출</button>
							<button id="total-sales-btn" class="btn btn-secondary">전체 매출 (월별)</button>
							<button id="top-selling-btn" class="btn btn-success">제일 많이 팔린 상품</button>
						</div>

						<!-- 카테고리별 매출 선택 드롭다운 -->
						<div class="container mt-4" id="category-dropdown" style="display: none;">
							<label for="categorySalesDropdown" class="fw-bold">📊 카테고리별 매출 조회</label>
							<br>
							<select id="categorySalesDropdown" class="form-control custom-select" style="max-width: 19vw;">
								<c:forEach var="category" items="${categoryList}">
									<option value="${category.ctgryNo}">${category.gdsCtgryNm}</option>
								</c:forEach>
							</select>
						</div>

						<!-- 그룹별 매출 선택 드롭다운 -->
						<div class="container mt-4" id="group-dropdown" style="display: none;">
							<label for="groupSalesDropdown" class="fw-bold">📊 그룹별 매출 조회</label>
							<br>
							<select id="groupSalesDropdown" class="form-control custom-select" style="max-width: 19vw;">
								<c:forEach var="group" items="${groupList}">
									<option value="${group.no}">${group.name}</option>
								</c:forEach>
							</select>
						</div>


<!-- 특정 카테고리 내 판매율 높은 5개 상품 (차트) -->
						<div class="row mt-4" id="top-category-sales-section" style="display: none;">
							<div class="col-12">
								<h3>🔥 선택한 카테고리 내 판매율 높은 5개 상품</h3>
								<div style="width: 100%; margin: 0 auto;">
									<canvas id="topCategorySalesChart"></canvas>
								</div>
							</div>
						</div>
<!-- 특정 그룹 내 판매율 높은 5개 상품 (차트) -->
						<div class="row mt-4" id="top-group-sales-section" style="display: none;">
							<div class="col-12">
								<h3>🔥 선택한 그룹 내 판매율 높은 5개 상품</h3>
								<div style="width: 100%; margin: 0 auto;">
									<canvas id="topGroupSalesChart"></canvas>
								</div>
							</div>
						</div>
						

						<!-- 그룹별 그래프 -->
						<div class="container1" id="group-sales-chart-section" style="display: none;">
							<div class="box"><canvas id="groupSalesChart"></canvas></div>
						</div>
						
<!-- 메인 그래프 -->
						<div class="container1">
							<div class="box"><canvas id="salesChart"></canvas></div>
						</div>
						

						<!-- 로딩 인디케이터 -->
						<div id="loading-indicator" style="display: none; text-align: center;">
							<p>데이터 로딩 중...</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>



<!-- 외부 라이브러리 (jQuery + Chart.js) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>

	let categorySalesChart;
	$(document).ready(function () {
		// 페이지 로드 시 그룹 목록 불러오기
		fetchGroupList();
		$(document).ready(function () {
			// ✅ 카테고리별 매출 버튼 클릭 시
			$("#category-sales-btn").click(function () {
				hideAllSections();                      // ⭐ 모든 섹션 숨기기
				$("#category-dropdown").show();         // 카테고리 드롭다운 표시
				$("#salesChart").show();                // 메인 차트 표시
				fetchCategorySalesData();
			});

			// ✅ 그룹별 매출 버튼 클릭 시
			$("#group-sales-btn").click(function () {
				hideAllSections();                      // ⭐ 모든 섹션 숨기기
				$("#group-dropdown").show();            // 그룹 드롭다운 표시
				$("#salesChart").show();                // 메인 차트 표시
				fetchGroupSalesData();
			});

			// ✅ 전체 매출 버튼 클릭 시
			$("#total-sales-btn").click(function () {
				hideAllSections();                      // ⭐ 모든 섹션 숨기기
				$("#salesChart").show();                // 메인 차트 표시
				fetchTotalSalesData();
			});

			// ✅ 제일 많이 팔린 상품 버튼 클릭 시
			$("#top-selling-btn").click(function () {
				hideAllSections();                      // ⭐ 모든 섹션 숨기기
				$("#salesChart").show();                // 메인 차트 표시
				fetchTopSellingGoods();
			});
		});
		// 초기 상태
		// ✅ 메인 차트 초기화
		function updateSalesChart(data, title, labelKey, idKey) {
			if (salesChart) {
				salesChart.destroy();  // 기존 차트 삭제
			}

			let ctx = document.getElementById('salesChart').getContext('2d');
			$("#salesChart").show();   // ⭐ 차트 표시

			salesChart = new Chart(ctx, {
				type: 'bar',
				data: {
					labels: data.map(item => item[labelKey]),
					datasets: [{
						label: title,
						data: data.map(item => item["TOTALSALES"]),
						backgroundColor: 'rgba(75, 192, 192, 0.5)',
						borderColor: 'rgba(75, 192, 192, 1)',
						borderWidth: 1
					}]
				},
				options: {
					responsive: true,
					scales: { y: { beginAtZero: true } }
				}
			});
		}

		hideGroupDropdown();
		$("#group-sales-chart-section").hide();
		$("#top-group-sales-section").hide();
		$("#loading-indicator").hide();

		// 버튼 클릭 이벤트
		$("#category-sales-btn").click(function () {
			hideGroupDropdown();
			$("#group-sales-chart-section").hide();
			$("#top-group-sales-section").hide();
			fetchCategorySalesData();
		});

		$("#group-sales-btn").click(function () {
			showGroupDropdown();
			$("#group-sales-chart-section").hide();
			$("#top-group-sales-section").hide();
			fetchGroupSalesData();
		});

		$("#total-sales-btn").click(function () {
			hideGroupDropdown();
			$("#group-sales-chart-section").hide();
			$("#top-group-sales-section").hide();
			fetchTotalSalesData();
		});

		$("#top-selling-btn").click(function () {
			hideGroupDropdown();
			$("#group-sales-chart-section").hide();
			$("#top-group-sales-section").hide();
			fetchTopSellingGoods();
		});

		// ⭐ [추가] 드롭다운에서 그룹 선택 시 => 그룹 월별 매출 가져오기

		$("#groupSalesDropdown").change(function () {
			let selectedGroupNo = $(this).val();
			console.log("🔍 선택된 그룹 번호:", selectedGroupNo);

			if (selectedGroupNo) {
				fetchTop5SellingGoodsInGroup(Number(selectedGroupNo)); // 🚨 숫자로 변환 후 전달
			} else {
				$("#top-group-sales-section").hide();
			}
		});



	});

	// 드롭다운 숨기기
	function hideGroupDropdown() {
		$("#group-dropdown").hide();
		$("label[for='group-dropdown']").hide();
	}

	// 드롭다운 표시
	function showGroupDropdown() {
		$("#group-dropdown").show();
		$("label[for='group-dropdown']").show();
	}

	// ----------------------------------------------------
	// (A) 그룹 목록 불러오기 (+ fallback)
	// 기존 코드에 역슬래시 `\${}` 남겨 둠
	// ----------------------------------------------------
	function fetchGroupList() {
		let dropdown = $("#groupSalesDropdown"); // <== 여기로 변경
		dropdown.empty();
		dropdown.append('그룹을 선택해 주세요'); // 기본 옵션

		$.ajax({
			url: "/api/goods-data/groups",
			type: "GET",
			dataType: "json",
			success: function (data) {
				console.log("📌 그룹 목록 (원본):", data);

				if (!data || data.length === 0) {
					console.warn("⚠️ 그룹 데이터가 비어 있습니다.");
					return;
				}

				// 각 항목에서 GROUPNAME or groupName, GROUPNO or groupNo fallback
				$.each(data, function (index, group) {
					let rawName = group.GROUPNAME || group.groupName;
					let rawNo = group.GROUPNO || group.groupNo;

					// 콘솔로 확인
					console.log(`group item => name=\${rawName}, no=\${rawNo}`);

					let groupName = String(rawName || "❌ 데이터 없음");
					let groupValue = String(rawNo || "❌ 데이터 없음");

					// **역슬래시 `\${}`** 그대로 유지
					// => 실제 JS 변수 치환은 안 되고, 
					// => 최종 HTML엔 <option value="\${groupValue}">\${groupName}</option> 로 들어감
					dropdown.append(`<option value="\${groupValue}">\${groupName}</option>`);
				});

				console.log("✅ 드롭다운 옵션 추가 완료:", dropdown.html());
			},
			error: function (xhr, status, error) {
				console.error(`❌ 그룹 목록 요청 실패: ${xhr.responseText || error}`);
			}
		});
	}

	// ----------------------------------------------------
	// (★추가) 특정 그룹의 "월별 매출" 가져오는 함수
	// => /api/goods-data/group-sales/{groupNo}
	// ----------------------------------------------------
	// 여기서 드롭 다운 클릭시 정보받고 12번 컨트롤러 시행해서 해당 그룹의 굿즈들 순위 띄울거임
	/** ✅ 특정 그룹의 "판매율 높은 5개 굿즈" 가져오는 함수 */
	/** ✅ 특정 그룹의 "판매율 높은 5개 굿즈" 가져오는 함수 */
	function fetchTop5SellingGoodsInGroup(groupNo) {
		console.log(`[DEBUG] 그룹의 굿즈 순위 5개 요청: groupNo = ${groupNo}`);

		// 그룹 번호가 유효한지 확인
		if (!groupNo || isNaN(groupNo)) {
			console.warn("⚠️ 유효하지 않은 그룹 번호. 요청 중단.");
			return;
		}

		// ✅ 올바른 URL 생성 (백슬래시 제거)
		let requestUrl = `/api/goods-data/top-5-selling-goods/group/\${groupNo}`;
		console.log("📤 AJAX 요청 URL:", requestUrl);  // 디버깅 로그 추가

		$("#loading-indicator").show();

		$.ajax({
			url: requestUrl,  // ✅ 수정된 URL
			type: "GET",
			dataType: "json",
			success: function (data) {
				console.log(`✅ 특정 그룹 (${groupNo}) 내 판매율 높은 5개 굿즈 응답:`, data);

				if (!data || data.length === 0) {
					console.warn(`⚠️ 그룹 (${groupNo}) 데이터 없음`);
					$("#top-group-sales-section").hide();
					$("#loading-indicator").hide();
					return;
				}

				updateTopSellingGoodsChart(data, `그룹 ${groupNo} 내 판매율 높은 5개 굿즈`, "GDSNAME", "TOTALSALES");

				$("#top-group-sales-section").show();
				$("#loading-indicator").hide();
			},
			error: function (xhr, status, error) {
				console.error(`❌ 특정 그룹 (${groupNo}) 판매율 높은 굿즈 실패:`, xhr.responseText || error);
				alert("특정 그룹 판매 데이터를 불러오는 데 실패했습니다. 다시 시도해주세요.");
				$("#top-group-sales-section").hide();
				$("#loading-indicator").hide();
			}
		});
	}






	// Chart.js 관련 변수 (기존)
	let salesChart;
	let groupSalesChart;
	let currentChartType = "";
	let currentData = [];

	// 페이지 최초 로딩 시 카테고리별 매출 먼저 호출 (기존)
	fetchCategorySalesData();

	// ----------------------------------------------------
	// (B) 공통 fetchData
	// ----------------------------------------------------
	function fetchData(apiUrl, title, labelKey, idKey) {
		fetch(apiUrl)
			.then(response => {
				if (!response.ok) {
					throw new Error(`HTTP error! Status: ${response.status}`);
				}
				return response.json();
			})
			.then(data => {
				console.log(`📊 ${title} 데이터:`, data);
				currentChartType = title.toLowerCase().replace(/ /g, "-");
				currentData = data;
				updateSalesChart(data, title, labelKey, idKey);
			})
			.catch(error => console.error(`❌ ${title} 불러오기 실패:`, error));
	}

	// ----------------------------------------------------
	// (C) 매출 종류별 함수 (기존 유지)
	// ----------------------------------------------------
	function fetchCategorySalesData() {
		fetchData("/api/goods-data/category-sales", "카테고리별 매출", "CATEGORYNAME", "CATEGORYNO");
	}

	function fetchGroupSalesData() {
		fetchData("/api/goods-data/group-sales", "그룹별 매출", "GROUPNAME", "GROUPNO");
	}

	function fetchTotalSalesData() {
		fetchData("/api/goods-data/total-sales", "전체 매출 (월별)", "MONTH", null);
	}

	function fetchTopSellingGoods() {
		fetch("/api/goods-data/top-selling-goods")
			.then(response => {
				if (!response.ok) {
					throw new Error(`HTTP error! Status: ${response.status}`);
				}
				return response.json();
			})
			.then(data => {
				console.log("🔥 제일 많이 팔린 상품 데이터:", data);
				currentChartType = "top-selling";
				updateSalesChart(data, "제일 많이 팔린 상품", "GDSNAME", "GDSNO");
			})
			.catch(error => console.error("❌ 제일 많이 팔린 상품 불러오기 실패:", error));
	}

	// ----------------------------------------------------
	// (D) 메인 차트 업데이트 (기존 유지)
	// ----------------------------------------------------
	function updateSalesChart(data, title, labelKey, idKey) {
		if (!data || data.length === 0) {
			console.warn("⚠️ 데이터가 없습니다.");
			return;
		}

		let labels = data.map(item => {
			let val = item[labelKey];
			if (val === undefined) {
				val = item[labelKey.toLowerCase()];
			}
			return val !== undefined ? val : "❌";
		});

		let values = data.map(item => {
			let sales = item["TOTALSALES"];
			if (sales === undefined) {
				sales = item["totalSales"];
			}
			return sales !== undefined ? sales : 0;
		});

		let ids = [];
		if (idKey) {
			ids = data.map(item => {
				let idVal = item[idKey];
				if (idVal === undefined) {
					idVal = item[idKey.toLowerCase()];
				}
				return idVal !== undefined ? idVal : "";
			});
		}

		console.log("📌 labels:", labels);
		console.log("📌 ids:", ids);

		if (salesChart) {
			salesChart.destroy();
		}

		let ctx = document.getElementById('salesChart').getContext('2d');
		salesChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: labels,
				datasets: [{
					label: title,
					data: values,
					backgroundColor: 'rgba(75, 192, 192, 0.5)',
					borderColor: 'rgba(75, 192, 192, 1)',
					borderWidth: 1
				}]
			},
			options: {
				responsive: true,
				scales: { y: { beginAtZero: true } },
				onClick: function (event) {
					handleChartClick(event, labels, ids);
				}
			}
		});
	}

	// ----------------------------------------------------
	// (E) 차트 막대 클릭 이벤트 (기존 유지)
	// ----------------------------------------------------
	function handleChartClick(event, labels, ids) {
		if (!salesChart) {
			console.warn("⚠️ Chart 객체가 존재하지 않습니다.");
			return;
		}

		const points = salesChart.getElementsAtEventForMode(event, 'nearest', { intersect: true }, true);
		if (points.length === 0) {
			console.warn(" 클릭된 항목이 없습니다.");
			return;
		}

		const clickedIndex = points[0].index;
		if (clickedIndex === undefined || clickedIndex === null) {
			console.warn(" 클릭한 항목의 index가 undefined입니다.");
			return;
		}

		let clickedLabel = labels[clickedIndex];
		let clickedId = ids.length > clickedIndex ? ids[clickedIndex] : null;

		console.log(`✅ 클릭한 항목: "${clickedLabel}", ID: ${clickedId}`);

		if (!clickedId) {
			console.warn("⚠️ 클릭한 항목의 ID가 없습니다. 요청 중단.");
			return;
		}

		if (currentChartType === "그룹별-매출" && clickedId) {
			fetchTop5SellingGoodsInGroup(clickedId);
		}
	}

	// ----------------------------------------------------
	// (F) 특정 그룹의 상위 5개 상품 조회 (기존 유지)
	// ----------------------------------------------------
	function fetchTop5SellingGoodsInGroup(groupNo) {
		console.log("[DEBUG] 요청 전 확인: groupNo =", groupNo);

		if (!groupNo || groupNo.toString().trim() === "" || isNaN(groupNo)) {
			console.warn("⚠️ 유효하지 않은 그룹 번호. 요청 중단.");
			return;
		}

		groupNo = Number(groupNo);
		console.log("[DEBUG] 변환된 groupNo =", groupNo);

		let requestUrl = `/api/goods-data/top-5-selling-goods/group/\${groupNo}`;
		console.log("📤 AJAX 요청 URL:", requestUrl);

		$("#loading-indicator").show();

		$.ajax({
			url: requestUrl,
			type: "GET",
			dataType: "json",
			success: function (data) {
				console.log(`✅ 특정 그룹 (\${groupNo}) 내 판매율 높은 5개 상품 응답:`, data);

				if (!data || data.length === 0) {
					console.warn(`⚠️ 그룹 (${groupNo}) 데이터 없음`);
					$("#group-sales-chart-section").hide();
					$("#top-group-sales-section").hide();
					$("#loading-indicator").hide();
					return;
				}

				updateGroupSalesChart(data, `그룹 ${groupNo} 내 판매율 높은 5개 상품`, "GDSNAME", "TOTALSALES");

				$("#top-group-sales-section").show();
				$("#loading-indicator").hide();
			},
			error: function (xhr, status, error) {
				console.error(`❌ 특정 그룹 (${groupNo}) 판매율 높은 상품 실패:`, xhr.responseText || error);
				alert("특정 그룹 판매 데이터를 불러오는 데 실패했습니다. 다시 시도해주세요.");
				$("#group-sales-chart-section").hide();
				$("#top-group-sales-section").hide();
				$("#loading-indicator").hide();
			}
		});
	}

	// ----------------------------------------------------
	// (G) 그룹별 차트 (기존 유지)
	// ----------------------------------------------------
	function updateGroupSalesChart(data, title, labelKey, valueKey) {
		if (!data || data.length === 0) {
			console.warn("⚠️ 그룹별 데이터가 없습니다.");
			return;
		}

		let labels = data.map(item => {
			let val = item[labelKey];
			if (val === undefined) {
				val = item[labelKey.toLowerCase()];
			}
			return val !== undefined ? val : "❌";
		});

		let values = data.map(item => {
			let v = item[valueKey];
			if (v === undefined) {
				v = item[valueKey.toLowerCase()];
			}
			return v !== undefined ? v : 0;
		});

		console.log("📌 그룹별 labels:", labels);
		console.log("📌 그룹별 values:", values);

		if (groupSalesChart) {
			groupSalesChart.destroy();
		}

		let ctx = document.getElementById('groupSalesChart').getContext('2d');
		groupSalesChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: labels,
				datasets: [{
					label: title,
					data: values,
					backgroundColor: 'rgba(153, 102, 255, 0.5)',
					borderColor: 'rgba(153, 102, 255, 1)',
					borderWidth: 1
				}]
			},
			options: {
				responsive: true,
				scales: { y: { beginAtZero: true } }
			}
		});

		$("#group-sales-chart-section").show();
	}

	/** ✅ 특정 그룹 내 판매율 높은 5개 굿즈 차트 업데이트 */
	function updateTopSellingGoodsChart(data, title, labelKey, valueKey) {
		if (!data || data.length === 0) {
			console.warn("⚠️ 상위 5개 굿즈 데이터가 없습니다.");
			return;
		}

		let labels = data.map(item => item[labelKey] || "❌");
		let values = data.map(item => item[valueKey] || 0);

		console.log("📌 상위 5개 굿즈 labels:", labels);
		console.log("📌 상위 5개 굿즈 values:", values);

		if (groupSalesChart) {
			groupSalesChart.destroy();
		}

		let ctx = document.getElementById('topGroupSalesChart').getContext('2d');
		groupSalesChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: labels,
				datasets: [{
					label: title,
					data: values,
					backgroundColor: 'rgba(255, 159, 64, 0.5)',
					borderColor: 'rgba(255, 159, 64, 1)',
					borderWidth: 1
				}]
			},
			options: {
				responsive: true,
				scales: { y: { beginAtZero: true } }
			}
		});

		$("#top-group-sales-section").show();
	}
	$(document).ready(function () {
		$("#category-dropdown").hide(); // 기본적으로 숨김

		$("#category-sales-btn").click(function () {
			$("#group-dropdown").hide();  // ✅ 그룹 드롭다운 숨기기
			$("#category-dropdown").toggle(); // ✅ 카테고리 드롭다운 보이기
		});

		// ✅ 카테고리 선택 시 특정 카테고리 내 판매율 높은 5개 상품 차트 표시
		$("#categorySalesDropdown").change(function () {
			let selectedCategoryNo = $(this).val();
			console.log("🔍 선택된 카테고리 번호:", selectedCategoryNo);

			if (selectedCategoryNo) {
				fetchTop5SellingGoodsInCategory(selectedCategoryNo);  // ✅ 올바른 함수 호출
			} else {
				$("#top-category-sales-section").hide();
			}
		});

	});

	//✅ 카테고리 목록을 불러와서 드롭다운에 추가하는 함수
	// ✅ 카테고리 목록을 불러와서 드롭다운에 추가하는 함수
	function fetchCategoryList() {
		let dropdown = $("#categorySalesDropdown");
		dropdown.empty();
		dropdown.append('<option value="">카테고리를 선택하세요</option>'); // 기본 옵션

		$.ajax({
			url: "/api/goods-data/categories",
			type: "GET",
			dataType: "json",
			success: function (response) {
				console.log("📌 API 응답 (카테고리 목록):", response);

				let categoryData = response.data ? response.data : response; // API 응답 구조 확인

				if (!categoryData || categoryData.length === 0) {
					console.warn("⚠️ 카테고리 데이터가 비어 있습니다.");
					return;
				}

				$.each(categoryData, function (index, category) {
					// ✅ 필드명 대소문자 변환 (GDSCTGRYNM → gdsCtgryNm, CTGRYNO → ctgryNo)
					let categoryName = category.GDSCTGRYNM || category.gdsCtgryNm || "❌ 데이터 없음";
					let categoryNo = category.CTGRYNO || category.ctgryNo || "❌";

					console.log(`✅ 추가됨 (카테고리): \${categoryName} (ID: \${categoryNo})`);
					dropdown.append(`<option value="\${categoryNo}">\${categoryName}</option>`);
				});

				console.log("✅ 드롭다운 옵션 추가 완료 (카테고리):", dropdown.html());
			},
			error: function (xhr, status, error) {
				console.error(`❌ 카테고리 목록 요청 실패: ${xhr.responseText || error}`);
			}
		});
	}



	$(document).ready(function () {
		fetchCategoryList();  // ✅ 카테고리 목록 불러오기
		fetchGroupList();     // ✅ 기존 그룹 목록 불러오기
		$("#categorySalesDropdown").change(function () {
			let selectedCategoryNo = $(this).val();
			console.log("🔍 선택된 카테고리 번호:", selectedCategoryNo);

			if (selectedCategoryNo) {
				fetchTop5SellingGoodsInCategory(selectedCategoryNo);  // ✅ 올바른 함수 호출
			} else {
				$("#top-category-sales-section").hide();
			}
		});
	});

	function fetchTop5SellingGoodsInCategory(categoryNo) {
		console.log(`[DEBUG] 카테고리 (${categoryNo}) 내 판매율 높은 5개 굿즈 요청`);

		if (!categoryNo || isNaN(categoryNo)) {
			console.warn("⚠️ 유효하지 않은 카테고리 번호. 요청 중단.");
			return;
		}

		let requestUrl = `/api/goods-data/top-5-selling-goods/category/\${categoryNo}`;
		console.log("📤 AJAX 요청 URL:", requestUrl);

		$("#loading-indicator").show();

		$.ajax({
			url: requestUrl,
			type: "GET",
			dataType: "json",
			success: function (data) {
				console.log(`✅ 특정 카테고리 (${categoryNo}) 내 판매율 높은 5개 굿즈 응답:`, data);

				if (!data || data.length === 0) {
					console.warn(`⚠️ 카테고리 (${categoryNo}) 데이터 없음`);
					$("#top-category-sales-section").hide();
					$("#loading-indicator").hide();
					return;
				}

				updateCategorySalesChart(data, `카테고리 ${categoryNo} 내 판매율 높은 5개 굿즈`, "gdsName", "totalSales");

				$("#top-category-sales-section").show();
				$("#loading-indicator").hide();
			},
			error: function (xhr, status, error) {
				console.error(`❌ 특정 카테고리 (${categoryNo}) 판매율 높은 상품 실패:`, xhr.responseText || error);
				alert("특정 카테고리 판매 데이터를 불러오는 데 실패했습니다. 다시 시도해주세요.");
				$("#top-category-sales-section").hide();
				$("#loading-indicator").hide();
			}
		});
	}


	//✅ 특정 카테고리 내 판매율 높은 5개 상품 차트 업데이트 함수 추가
	function updateCategorySalesChart(data, title, labelKey, valueKey) {
		if (!data || data.length === 0) {
			console.warn("⚠️ 카테고리별 데이터가 없습니다.");
			return;
		}

		/*
		[
		{
				"TOTALQUANTITY": 8,
				"TOTALSALES": 540000,
				"GDSPRICE": 67500,
				"GDSNAME": "4th Mini Album 'CRAZY' (COMPACT ver.) Set",
				"GDSNO": 40
		},
		{
				"TOTALQUANTITY": 6,
				"TOTALSALES": 288000,
				"GDSPRICE": 48000,
				"GDSNAME": "V x Bing Crosby_White Christmas",
				"GDSNO": 36
		},
		{
				"TOTALQUANTITY": 2,
				"TOTALSALES": 195600,
				"GDSPRICE": 97800,
				"GDSNAME": "NewJeans) - How Sweet (Standard ver.) [세트/앨범6종]",
				"GDSNO": 39
		},
		{
				"TOTALQUANTITY": 1,
				"TOTALSALES": 44000,
				"GDSPRICE": 44000,
				"GDSNAME": "KATSEYE (캣츠아이) - SIS (Soft Is Strong)",
				"GDSNO": 43
		},
		{
				"TOTALQUANTITY": 2,
				"TOTALSALES": 29600,
				"GDSPRICE": 14800,
				"GDSNAME": "st FULL ALBUM [DRIP] JEWEL CASE Ver.",
				"GDSNO": 45
		}
]
		*/
		console.log("판매율 높은 5개 상품->data : ", data);

		//     let labels = data.map(item => item[labelKey] || "❌");
		//     let values = data.map(item => item[valueKey] || 0);
		//     let labels = ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'];
		//     let values = [12, 19, 3, 5, 2, 3];

		let labels = [];
		let values = [];

		$.each(data, function (idx, item) {
			labels.push(item.GDSNAME);
			values.push(item.TOTALSALES);
		});

		console.log("📌 카테고리별 labels:", labels);
		console.log("📌 카테고리별 values:", values);

		if (categorySalesChart) {
			categorySalesChart.destroy();
		}

		let ctx = document.getElementById('topCategorySalesChart').getContext('2d');
		categorySalesChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: labels,
				datasets: [{
					label: title,
					data: values,
					backgroundColor: 'rgba(255, 159, 64, 0.5)',
					borderColor: 'rgba(255, 159, 64, 1)',
					borderWidth: 1
				}]
			},
			options: {
				responsive: true,
				scales: { y: { beginAtZero: true } }
			}
		});

		$("#top-category-sales-section").show();
	}

	function hideAllSections() {
		$("#category-dropdown").hide();             // 카테고리 드롭다운
		$("#group-dropdown").hide();                // 그룹 드롭다운
		$("#group-sales-chart-section").hide();     // 그룹 매출 차트
		$("#top-group-sales-section").hide();       // 그룹 상위 5개 상품 차트
		$("#top-category-sales-section").hide();    // 카테고리 상위 5개 상품 차트
		$("#loading-indicator").hide();             // 로딩 인디케이터
		$("#salesChart").hide();                    // 메인 매출 차트
	}

</script>
<%@ include file="../../include/footer.jsp" %>