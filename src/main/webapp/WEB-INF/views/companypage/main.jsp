<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 아이콘 -->
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<%@ include file="../include/header.jsp" %>
<style>
a {
    color: black !important;
    text-decoration: none; /* 밑줄 없애기 (선택사항) */
}

a:hover {
    color: black !important; /* 마우스 올려도 색 유지 */ !important
}

.mainContent-header{
color: pink;
display:flex;
}

.content-body{
display:flex;
}
</style>
<!-- 모든 페이지에 이거 추가해야함 -->
<div class="content-wrapper">
	<!--     Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/companypage/main">companypage</a></li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
			<div class="row">

			          <div class="col-12 col-sm-6 col-md-3">
			          <a href="/companypage/orderManage">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">주문</span>
                <span class="info-box-number">760</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            </a>
            <!-- /.info-box -->
          </div>

                    <div class="col-12 col-sm-6 col-md-3">
            <a href="/companypage/managemembership">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-users"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">멤버십</span>
                <span class="info-box-number">2,000</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            </a>
            <!-- /.info-box -->
          </div>

          <div class="col-12 col-sm-6 col-md-3">
           <a href="/companypage">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-1"><i class="fa-solid fa-comment-dots"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">댓글</span>
                <span class="info-box-number">
                  18,124
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            </a>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
           <a href="/companypage/auditionList">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-danger elevation-1"><i class="fa-solid fa-file-video"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">오디션</span>
                <span class="info-box-number">41,410</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            </a>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>


          <!-- /.col -->

          <!-- /.col -->
        </div>
			<div class="row">
          <div class="col-lg-6">
                      <div class="card">
               <div class="card-header" style="border-bottom: 1px solid rgba(0, 0, 0, .125);">
                <h3 class="card-title" style="font-weight:bold;">주문</h3>
                <div class="card-tools">
                  <a href="#" class="btn btn-tool btn-sm">
                    <i class="fas fa-download"></i>
                  </a>
                  <a href="#" class="btn btn-tool btn-sm">
                    <i class="fas fa-bars"></i>
                  </a>
                </div>
              </div>
              <div class="card-body table-responsive p-0">
                <table class="table table-striped table-valign-middle">
                  <thead>
                  <tr>
                    <th>상품</th>
                    <th>가격</th>
                    <th>판매량</th>
                    <th>더보기</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>
                      <img src="/resources/upload/2025/01/23/0735b90b-14d1-4602-8043-8dade9c80363_Newjeans앨범.jpg" alt="Product 1" class="img-size-32 mr-2">
                      How Sweet (Standard ver.)
                    </td>
                    <td>97,800원</td>
                    <td>
                      <small class="text-success mr-1">
                        <i class="fas fa-arrow-up"></i>
                        12%
                      </small>
                      12,000 Sold
                    </td>
                    <td>
                      <a href="#" class="text-muted">
                        <i class="fas fa-search"></i>
                      </a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <img src="/resources/upload/2025/01/23/3fcda085-ee14-4773-81ec-9091ae4a6dec_아이브앨범.jpg" alt="Product 1" class="img-size-32 mr-2">
                      I've IVE [Jewel Ver.]
                    </td>
                    <td>15,600원</td>
                    <td>
                      <small class="text-warning mr-1">
                        <i class="fas fa-arrow-down"></i>
                        0.5%
                      </small>
                      123,234 Sold
                    </td>
                    <td>
                      <a href="#" class="text-muted">
                        <i class="fas fa-search"></i>
                      </a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <img src="/resources/upload/2025/01/25/d4288fb4-75e4-4040-ac7c-f7f1dbb22556_riize앨범.png" alt="Product 1" class="img-size-32 mr-2">
                      1st Mini Album [RIIZING]
                    </td>
                    <td>22,700원</td>
                    <td>
                      <small class="text-danger mr-1">
                        <i class="fas fa-arrow-down"></i>
                        3%
                      </small>
                      198 Sold
                    </td>
                    <td>
                      <a href="#" class="text-muted">
                        <i class="fas fa-search"></i>
                      </a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <img src="/resources/upload/2025/01/25/9be9d52d-7e48-4ef6-abb1-75b7d4dbdd70_베이비몬스터앨범.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                      st FULL ALBUM [DRIP]
                      <span class="badge bg-danger">NEW</span>
                    </td>
                    <td>14,800원</td>
                    <td>
                      <small class="text-success mr-1">
                        <i class="fas fa-arrow-up"></i>
                        63%
                      </small>
                      87 Sold
                    </td>
                    <td>
                      <a href="#" class="text-muted">
                        <i class="fas fa-search"></i>
                      </a>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>

                                  <div class="card">
              <div class="card-header" style="border-bottom: 1px solid rgba(0, 0, 0, .125);">
                <h3 class="card-title" style="font-weight:bold;">설문조사</h3>
                <div class="card-tools">
                  <a href="#" class="btn btn-tool btn-sm">
                    <i class="fas fa-download"></i>
                  </a>
                  <a href="#" class="btn btn-tool btn-sm">
                    <i class="fas fa-bars"></i>
                  </a>
                </div>
              </div>
              <div class="card-body table-responsive p-0">
                <table class="table table-striped table-valign-middle">
                  <thead>
                  <tr>
                    <th>상태</th>
                    <th>제목</th>
                    <th>결과</th>
                    <th></th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td>
                    <small class="text-success mr-1">
                      진행 중
                      </small>
                    </td>
                    <td>케이팝 연말결산 설문조사</td>
                    <td>
                      <i class="fas fa-search"></i>
                    </td>
                    <td>
                      <ion-icon name="ellipsis-vertical-outline"></ion-icon>
                    </td>
                  </tr>
                  <tr>
                    <td>
                    <small class="text-success mr-1">
                      진행 중
                      </small>
                    </td>
                    <td>내가 가장 선호하는 디지털 멤버십 혜택은?</td>
                    <td>
                      <i class="fas fa-search"></i>
                    </td>
                    <td>
                      <ion-icon name="ellipsis-vertical-outline"></ion-icon>
                    </td>
                  </tr>
                  <tr>
                    <td>
                    <small class="text mr-1">
                      종료
                      </small>
                    </td>
                    <td>케이팝 연말결산 설문조사</td>
                    <td>
                      <i class="fas fa-search"></i>
                    </td>
                    <td>
                      <ion-icon name="ellipsis-vertical-outline"></ion-icon>
                    </td>
                  </tr>
                  <!--
                  <tr>
                    <td>
                      Another Product
                    </td>
                    <td>$29 USD</td>
                    <td>
                      <small class="text-warning mr-1">
                        <i class="fas fa-arrow-down"></i>
                        0.5%
                      </small>
                      123,234 Sold
                    </td>
                    <td>
                      <a href="#" class="text-muted">
                        <i class="fas fa-search"></i>
                      </a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Amazing Product
                    </td>
                    <td>$1,230 USD</td>
                    <td>
                      <small class="text-danger mr-1">
                        <i class="fas fa-arrow-down"></i>
                        3%
                      </small>
                      198 Sold
                    </td>
                    <td>
                      <a href="#" class="text-muted">
                        <i class="fas fa-search"></i>
                      </a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Perfect Item
                      <span class="badge bg-danger">NEW</span>
                    </td>
                    <td>$199 USD</td>
                    <td>
                      <small class="text-success mr-1">
                        <i class="fas fa-arrow-up"></i>
                        63%
                      </small>
                      87 Sold
                    </td>
                    <td>
                      <a href="#" class="text-muted">
                        <i class="fas fa-search"></i>
                      </a>
                    </td>
                  </tr>
                   -->
                  </tbody>
                </table>
              </div>
            </div>

            <div class="card">
              <div class="card-header border-0">
                <div class="d-flex justify-content-between">
                  <h3 class="card-title">Online Store Visitors</h3>
                  <a href="javascript:void(0);">View Report</a>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex">
                  <p class="d-flex flex-column">
                    <span class="text-bold text-lg">820</span>
                    <span>Visitors Over Time</span>
                  </p>
                  <p class="ml-auto d-flex flex-column text-right">
                    <span class="text-success">
                      <i class="fas fa-arrow-up"></i> 12.5%
                    </span>
                    <span class="text-muted">Since last week</span>
                  </p>
                </div>
                <!-- /.d-flex -->

                <div class="position-relative mb-4"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                  <canvas id="visitors-chart" height="250" style="display: block; height: 200px; width: 572px;" width="715" class="chartjs-render-monitor"></canvas>
                </div>

                <div class="d-flex flex-row justify-content-end">
                  <span class="mr-2">
                    <i class="fas fa-square text-primary"></i> This Week
                  </span>

                  <span>
                    <i class="fas fa-square text-gray"></i> Last Week
                  </span>
                </div>
              </div>
            </div>
            <!-- /.card -->


            <!-- /.card -->
          </div>
          <!-- /.col-md-6 -->
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header border-0">
                <div class="d-flex justify-content-between">
                  <h3 class="card-title">카테고리별 매출</h3>
                  <a href="javascript:void(0);">View Report</a>
                </div>
              </div>
              <div class="card-body">

                <!-- /.d-flex -->

                <div class="container1">
                            <div class="box">
                            <canvas id="salesChart">
                            </canvas></div>
                        </div>
              </div>
            </div>
            <!-- /.card -->

            <div class="card">
              <div class="card-header border-0">
                <h3 class="card-title">Online Store Overview</h3>
                <div class="card-tools">
                  <a href="#" class="btn btn-sm btn-tool">
                    <i class="fas fa-download"></i>
                  </a>
                  <a href="#" class="btn btn-sm btn-tool">
                    <i class="fas fa-bars"></i>
                  </a>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                  <p class="text-success text-xl">
                    <i class="ion ion-ios-refresh-empty"></i>
                  </p>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                      <i class="ion ion-android-arrow-up text-success"></i> 12%
                    </span>
                    <span class="text-muted">CONVERSION RATE</span>
                  </p>
                </div>
                <!-- /.d-flex -->
                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                  <p class="text-warning text-xl">
                    <i class="ion ion-ios-cart-outline"></i>
                  </p>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                      <i class="ion ion-android-arrow-up text-warning"></i> 0.8%
                    </span>
                    <span class="text-muted">SALES RATE</span>
                  </p>
                </div>
                <!-- /.d-flex -->
                <div class="d-flex justify-content-between align-items-center mb-0">
                  <p class="text-danger text-xl">
                    <i class="ion ion-ios-people-outline"></i>
                  </p>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                      <i class="ion ion-android-arrow-down text-danger"></i> 1%
                    </span>
                    <span class="text-muted">REGISTRATION RATE</span>
                  </p>
                </div>
                <!-- /.d-flex -->
              </div>
            </div>
          </div>
          <!-- /.col-md-6 -->
        </div>
		</div>
		<!-- /.container-fluid -->
	</div>
<div>
<!--
<div class="mainContent" style="border: 1px;">
<div class="mainContent-header">
<div class="title">제목</div>
<div class="date"> 등록일</div>
</div>
<div class="content-body">
<div class="contentTitle">d</div>
<div class="contentDate">d</div>
</div>
</div>
 -->
</div>
<!-- ///// content 시작 ///// -->
<section class="d-flex vh-100">
  <div class="container-fluid row justify-content-center align-content-center">
    <div class="card bg-dark" style="border-radius: 1rem;">
    </div>
  </div>
</section>

<!-- ///// content 끝 ///// -->


<script>

let categorySalesChart;
$(document).ready(function () {
    // 페이지 로드 시 그룹 목록 불러오기
    fetchGroupList();

    // 초기 상태

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
        url: "http://localhost/api/goods-data/groups",
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
                let rawNo   = group.GROUPNO   || group.groupNo;

                // 콘솔로 확인
                console.log(`group item => name=\${rawName}, no=\${rawNo}`);

                let groupName = String(rawName || "❌ 데이터 없음");
                let groupValue = String(rawNo   || "❌ 데이터 없음");

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
    let requestUrl = `http://localhost/api/goods-data/top-5-selling-goods/group/\${groupNo}`;
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
    fetchData("http://localhost/api/goods-data/category-sales", "카테고리별 매출", "CATEGORYNAME", "CATEGORYNO");
}

function fetchGroupSalesData() {
    fetchData("http://localhost/api/goods-data/group-sales", "그룹별 매출", "GROUPNAME", "GROUPNO");
}

function fetchTotalSalesData() {
    fetchData("http://localhost/api/goods-data/total-sales", "전체 매출 (월별)", "MONTH", null);
}

function fetchTopSellingGoods() {
    fetch("http://localhost/api/goods-data/top-selling-goods")
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

    let requestUrl = `http://localhost/api/goods-data/top-5-selling-goods/group/\${groupNo}`;
    console.log("📤 AJAX 요청 URL:", requestUrl);

    $("#loading-indicator").show();

    $.ajax({
        url: requestUrl,
        type: "GET",
        dataType: "json",
        success: function (data) {
            console.log(`✅ 특정 그룹 (${groupNo}) 내 판매율 높은 5개 상품 응답:`, data);

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
        url: "http://localhost/api/goods-data/categories",
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

    let requestUrl = `http://localhost/api/goods-data/top-5-selling-goods/category/\${categoryNo}`;
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


    console.log("판매율 높은 5개 상품->data : ", data);

    let labels = [];
    let values = [];

    $.each(data,function(idx,item){
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



</script>
<%@ include file="../include/footer.jsp" %>
