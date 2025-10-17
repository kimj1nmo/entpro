<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

				<!-- ///// header 시작 ///// -->
<jsp:include page="../include/header.jsp"></jsp:include>

<!-- 직접추가한 CSS -->
<link rel="stylesheet" href="/directlyCss/groupNotice.css">

<!-- 차트 script -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- axios -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>


<div class="content-wrapper">
	<!--     Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<!-- <li class="breadcrumb-item"><a href="/manage/managepage/list">프로젝트 리스트</a></li> -->
						<li class="breadcrumb-item active">/ 프로젝트 통계</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>

	<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
	<!-- sweetAlert -->
	<link rel="stylesheet" href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
	<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
	<!-- ///// content 시작 ///// -->

	<section class="content">
		<div class="container-fluid">
			<!-- ///// content 시작 ///// -->
			<div class="d-flex justify-content-between align-items-center mb-4">
				<h3>프로젝트 통계 현황</h3>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<div class="row">
								<!-- 드롭다운 메뉴 -->
								<div class="dropdown">
									<button class="btn btn-secondary dropdown-toggle" type="button" id="groupDropdown"
										data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										2024년 <!-- 기본 텍스트 -->
									</button>
									<div class="dropdown-menu" aria-labelledby="groupDropdown">
										<!-- 년도 목록 -->
										<button id="2024" class="dropdown-item" href="#" onclick="selButton(2024)" data-year="2024" disabled>
											2024년
										</button>
										<button id="2023" class="dropdown-item" href="#" onclick="selButton(2023)" data-year="2023">
											2023년
										</button>
										<button id="2022" class="dropdown-item" href="#" onclick="selButton(2022)" data-year="2022">
											2022년
										</button>
									</div>
								</div>
							</div>
						</div>

						<!-- 차트부분 -->
						<div class="col-12 col-sm-12">
							<div class="card card-primary card-tabs">
								<div class="card-header p-0 pt-1">
									<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
										<li class="nav-item">
											<a class="nav-link active" id="custom-tabs-one-home-tab" data-toggle="pill"
												href="#custom-tabs-one-home" role="tab" aria-controls="custom-tabs-one-home"
												aria-selected="false">프로젝트 시행 빈도</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="custom-tabs-one-profile-tab" data-toggle="pill"
												href="#custom-tabs-one-profile" role="tab" aria-controls="custom-tabs-one-profile"
												aria-selected="false">그룹 연도별 활동 수</a>
										</li>
										<!-- <li class="nav-item">
											<a class="nav-link" id="custom-tabs-one-messages-tab" data-toggle="pill"
												href="#custom-tabs-one-messages" role="tab" aria-controls="custom-tabs-one-messages"
												aria-selected="true">직원 투입 현황</a>
										</li> -->
									</ul>
								</div>
								<div class="card-body">
									<div class="tab-content d-flex justify-content-center align-items-center"
										id="custom-tabs-one-tabContent">
										<div class="tab-pane fade active show" id="custom-tabs-one-home" role="tabpanel"
											aria-labelledby="custom-tabs-one-home-tab">
											<div style="width:60vw; height:15wh;">
												<canvas id="statsChart"></canvas>
											</div>
										</div>
										<div class="tab-pane fade" id="custom-tabs-one-profile" role="tabpanel"
											aria-labelledby="custom-tabs-one-profile-tab">
											<!-- 차트 크기는 부모 크기를 조절하면 거기에 맞게 자동으로 맹글어짐-->
											<div style="width:60vw; height:15wh;">
												<canvas id="durationChart"></canvas>
											</div>
										</div>
										<div class="tab-pane fade" id="custom-tabs-one-messages" role="tabpanel"
											aria-labelledby="custom-tabs-one-messages-tab">
											<div style="width:35vw; height:20wh;">
												<canvas id="empChart"></canvas>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- card-footer 시작 -->
					<!-- card-footer 끝 -->

					<!-- 페이징, 버튼 영역 -->
					<!-- <div class="col-12 d-flex justify-content-between align-items-center">
						<div class="card-footer" id="divPagingArea"></div>
						<div class="d-flex" style="gap: 15px;">
							<button id="regBtn" data-toggle="modal" data-target="#modal-lg" class="btn btn-primary me-2">등록</button>
							<button id="deleteSelected" class="btn btn-danger">삭제</button>
						</div>
					</div> -->
				</div>
			</div>




			<!-- ///// content 끝 ///// -->
		</div>
		<!-- /.container-fluid -->
	</section>
</div>
<!-- ///// content 끝 ///// -->

<script>
// 전역변수
// 프로젝트 이름
let proTtl = [];
// 프로젝트 횟수
let proTtlCnt = [];
// 작년 프로젝트 횟수
let lastProTtlCnt = [];
// 년도 선택
let selYear = 2024;
// 프로젝트명 중복제거
let uniqueProTtl = [];
// 그룹이름
let groupName = [];
// 그룹 연도별 참여 횟수
let groupNoCntSum = [];
// 프로젝트 시행 빈도 차트
const statsChart = document.querySelector('#statsChart');
// 그룹 연도별 활동 수 차트
const durationChart = document.querySelector('#durationChart');

// 최초 페이지 로드 시
const getProjectList = async () => {

	// 리스트 가져오기
	// await axios.get("/managepage/getProjectList")
	// .then(resp => {
	// console.log("리스트 통신결과(resp) : ", resp);
	// proTtl = resp.data.map(e => e.proTtl);
	// });

	// 프로젝트 시행 빈도
	let year = {
		"year": selYear
		// 1년전
		, "lastYear": selYear - 1
	}
	// console.log("통신할 데이터(year) : ", year);

	// 통신
	await axios.post("/managepage/statsChartCnt", year, {
		headers: {
			"Content-Type": "application/json",
		}
	})
		.then(resp => {
			console.log("연도별 횟수 통신결과(resp) : ", resp);
			// 프로젝트 명
			proTtl = resp.data.map(e => e.proTtl);
			// console.log("프로젝트 명(proTtl) : ", proTtl);

			// 현재년도 갯수
			proTtlCnt = resp.data.filter(e => e.proRegDate == selYear)
				.map(e => e.proTtlCnt + 10);
			// 작년 갯수
			lastProTtlCnt = resp.data.filter(e => e.proRegDate == selYear - 1)
				.map(e => e.proTtlCnt + 4);
			// console.log("갯수(lastProTtlCnt) : ", lastProTtlCnt);

			// 차트만들기 콜백
			startCharts(proTtlCnt, lastProTtlCnt, proTtl);
		});

	// 그룹 연도별 활동 수
	let data = {
		"year" : selYear
	}
	// 통신
	await axios.post("/managepage/groupsCharts", data, {
		headers: {
			"Content-Type": "application/json",
		}
	})
	.then(resp => {
		// console.log("그룹 연도별 활동 수 통신결과(resp) : ", resp);

		// 그룹명
		groupName = resp.data.map(e => e.groupName);
		// console.log("그룹명(groupName) : ", groupName);

		// 그룹 연도별 활동 수
		groupNoCntSum = resp.data.map(e => e.groupNoCntSum);
		// console.log("그룹 연도별 활동 수(groupNoCntSum) : ", groupNoCntSum);

		groupsChartsYear(groupName, groupNoCntSum);
	});
}
// 최초 호출
getProjectList();

// 프로젝트 시행 빈도 통신결과로 차트 만들기
function startCharts(proTtlCnt, lastProTtlCnt, proTtl) {
	console.log("콜백으로 넘어온값(proTtl) : ", proTtl);
	console.log("콜백으로 넘어온값(proTtlCnt) : ", proTtlCnt);
	console.log("콜백으로 넘어온값(lastProTtlCnt) : ", lastProTtlCnt);

	// 프로젝트명 중복제거
	let set = new Set(proTtl);
	uniqueProTtl = [...set];
	console.log("중복제거 됐니?(uniqueProTtl) : ", uniqueProTtl);

	// 프로젝트 시행 빈도
	const setStatsChart = new Chart(statsChart, {
		type: 'line',
		data: {
			labels: uniqueProTtl,
			datasets: [
				{
					label: '작년 시행 수',
					data: lastProTtlCnt,
					backgroundColor: [
						"rgba(0, 0, 255, 0.3)",
					],
					borderWidth: 1
				},
				{
					label: '올해 시행 수',
					data: proTtlCnt,
					backgroundColor: [
						"rgba(255, 0, 0, 0.3)",
					],
					borderWidth: 1
				}
			]
		}
		,
		options: {
			responsive: true,
			scales: {
				yAxes: [{
				ticks: {
					min: 0,
					fontSize : 14,
				}
					,beginAtZero: true
			}]
			}
		},
	});
	console.log("labels:", setStatsChart);
	// console.log("labels:", setStatsChart.data.datasets[0]);
	// console.log("labels:", setStatsChart.data.datasets[1].label);
	// console.log("labels:", setStatsChart.data.datasets[1].data);

	/*
	// 직원 투입별 차트
	const empChart = document.querySelector('#empChart');

	// 만들위치, 설정값객체
	const setEmpChart = new Chart(empChart, {
		type: 'doughnut',  // bar, line, pie, doughnut, radar 등등...
		data: {
			labels: proTtl,
			datasets: [
				{
					label: '작년 매출',
					data: [10, 19, 13, 15, 12, 13, 9],
					borderWidth: 1,
				}
			]
		},
		options: {
			scales: {
				y: {
					beginAtZero: true
				}
			}
		}
	});
	*/
	setStatsChart.update();
}

// 그룹 연도별 활동 수 통신결과로 차트 그리기
function groupsChartsYear(groupName, groupNoCntSum){
	console.log("그룹 연도별 활동 수 콜백(groupName) : ", groupName);
	console.log("그룹 연도별 활동 수 콜백(groupNoCntSum) : ", groupNoCntSum);

	// 그룹 연도별 활동 수 차트 그리기
	const setDurationChart = new Chart(durationChart, {
		type: 'doughnut',  // bar, line, pie, doughnut, radar 등등...
		data: {
			labels: groupName,
			datasets: [
				{
					label: '작년 매출',
					data: groupNoCntSum,
					borderWidth: 1,
					backgroundColor: [
						"rgba(0, 0, 255, 0.3)",
						"rgba(0, 255, 0, 0.3)",
						"rgba(255, 0, 0, 0.3)",
						"rgba(255, 174, 0, 0.3)",
						"rgba(255, 234, 0, 0.3)",
						"rgba(0, 255, 247, 0.3)",
						"rgba(208, 0, 255, 0.3)",
						"rgba(128, 0, 255, 0.3)",
						"rgba(170, 164, 235, 0.3)",
					],
				}
			]
		}
		,
		options: {
			scales: {
				y: {
					beginAtZero: true
				}
			}
		}
	});
	// setDurationChart.pop();
	setDurationChart.update();
}

// 년도 클릭 시
function selButton(oneYear) {
	// 모든 차트 인스턴스의 키를 배열에 담기
	var chartKeys = Object.keys(Chart.instances);
	console.log("차트의 키(chartKeys) : ", chartKeys);

	// 반복문으로 모두 제거
	chartKeys.forEach(function(key) {
		var chart = Chart.instances[key];

		// 이름 초기화
		chart.data.labels = [];

		// 각 데이터셋의 데이터를 초기화합니다.
		chart.data.datasets.forEach(function(dataset) {
				dataset.data = [];
		});

		// 차트 업데이트
		chart.update();
	});
	
	// console.log("이거", test);
	// 선택한 년도 담기
	let data = {
		"year": oneYear
		, "lastYear": oneYear - 1
	}
	console.log("통신에 보낼 데이터(data) : ", data);

	// 통신 보내기
	axios.post("/managepage/statsChartCnt", data, {
	})
		.then(resp => {
			// console.log("통신 결과(resp.data)", resp.data);
			// 프로젝트 명
			proTtl = resp.data.map(e => e.proTtl);
			// 현재년도 갯수
			proTtlCnt = resp.data.filter(e => e.proRegDate == oneYear)
				.map(e => e.proTtlCnt);
			// console.log("현재년도 갯수(proTtlCnt) : ", proTtlCnt);

			// 작년 갯수
			lastProTtlCnt = resp.data.filter(e => e.proRegDate == oneYear - 1)
				.map(e => e.proTtlCnt);
			// console.log("작년 갯수(lastProTtlCnt) : ", lastProTtlCnt);

			// 드롭다운 이름 바꾸기
			const dropdownText = document.querySelector("#groupDropdown");
			dropdownText.textContent = oneYear + "년";

			// 클릭된 드롭다운 메뉴 다시 못누르게
			const dropdownDis = document.querySelectorAll(".dropdown-item");
			dropdownDis.forEach(e => {
				e.disabled = false;
			});
			const dropdownYear = document.getElementById(oneYear);
			dropdownYear.disabled = true;

			// 프로젝트명과 연도별 횟수 콜백
			startCharts(proTtlCnt, lastProTtlCnt, proTtl);
		});

	// 그룹 연도별 활동 수 선택된 년도
	let groupData = {
		"year": oneYear
	}
	console.log("통신에 보낼 데이터(groupData) : ", groupData);
		
	axios.post("/managepage/groupsCharts", groupData, {
	})
	.then(resp => {
		// console.log("그룹 연도별 활동 통신결과(resp) : ", resp);

		// 그룹명
		groupName = resp.data.map(e => e.groupName);
		// console.log("그룹명(groupName) : ", groupName);

		// 그룹 연도별 참여횟수
		groupNoCntSum = resp.data.map(e => e.groupNoCntSum);
		// console.log("그룹 연도별 참여횟수(groupNoCntSum) : ", groupNoCntSum);
		
		groupsChartsYear(groupName, groupNoCntSum);
	});
};


/*
// 전역변수
// 현재 선택된 그룹 번호 (기본값: 전체 보기)
var currentGroupNo = 0;
// 현재 페이지
var currentPage = 1;
// 검색어
var keyword = "";

// null 체크
function nvl(expr1, expr2) {
	if (expr1 === undefined || expr1 == null || expr1 == "") {
			expr1 = expr2;
	}
	return expr1;
}

// 페이지 로드 시 바로 실행되는 함수
function allList(){
	let data = {
		"groupNo" : currentGroupNo,
		"currentPage": nvl(currentPage, "1"),
		"keyword": nvl(keyword, "")
	}

	// 전체&그룹별 리스트 데이터 받아오기
	$.ajax({
		url: "/managepage/groupNoticeList",
		type: "post",
		contentType: "application/json;charset=utf-8",
		dataType: "json",
		data: JSON.stringify(data),
		success: function (articlePage) {
			console.log("그룹 요청 결과(articlePage) : ", articlePage);
			// console.log("그룹 요청 결과 콘텐츠(articlePage.content) : ", articlePage.content);

			// 테이블 업데이트
			updateTable(articlePage);
		},
		error: function () {
			Swal.fire("오류", "데이터를 가져오는 중 문제가 발생했습니다", "error");
		}
	});
}
// 페이지 로드시 바로 데이터 받아오기
allList();

// 드롭다운 선택 이벤트
$('.dropdown-item').click(function (e) {
	// 기본 동작 방지
	e.preventDefault();

	currentGroupNo = $(this).data('group-no'); // 선택한 그룹 번호
	console.log("선택한 번호(currentGroupNo) : ", currentGroupNo);
	const selectedGroupName = $(this).text(); // 선택한 그룹 이름
	let data = {
		"groupNo" : currentGroupNo,
		"currentPage": nvl(currentPage, "1"),
		"keyword": nvl(keyword, "")
	}
	console.log("통신에 보낼 데이터(data) : ", data);

	// 그룹별 게시글 조회
	$.ajax({
			url: '/managepage/groupNoticeList',
			type: 'post',
			contentType: "application/json;charset=utf-8",
			dataType: "json",
			data: JSON.stringify(data),
			success: function (articlePage) {
				console.log("그룹 요청 결과(articlePage) : ", articlePage);
				// console.log("그룹 요청 결과 콘텐츠(articlePage.content) : ", articlePage.content);
				// 테이블 업데이트
					updateTable(articlePage);

					// 드롭다운 버튼 텍스트 변경
					$('#groupDropdown').text(selectedGroupName);
			},
			error: function () {
					Swal.fire('오류', '데이터를 가져오는 중 문제가 발생했습니다.', 'error');
			}
	});
});

// 드롭다운 선택 시 테이블 업데이트 함수
function updateTable(articlePage) {
	console.log("콜백->테이블생성 데이터(articlePage) : ", articlePage);
	// console.log("콜백->테이블생성 데이터 콘텐츠(articlePage.content) : ", articlePage.content);
	const tbody = $('#postTableBody');
	tbody.empty(); // 기존 데이터 제거

	// 빈 게시물 처리
	if (!articlePage) {
		tbody.append('<tr><td colspan="5">게시글이 없습니다.</td></tr>');
		return;
	}

	let str = ""
	$.each(articlePage.content, function (idx, groupNoticeVO) {
		// console.log("반복문 안 1번째 매개변수(idx) : ", idx);
		// console.log("반복문 안 2번째 매개변수(groupNoticeVO) : ", groupNoticeVO);

				str += `
									<tr>
										<td><input type="checkbox" class="selCheckbox" value="\${groupNoticeVO.groupNoticeNo}"></td>
										<td>\${groupNoticeVO.rnum}</td>
										<td data-toggle="modal" data-target="#modal-lg" class="hoverText"
											data-group-notice-cn="\${groupNoticeVO.groupNoticeCn}" data-group-no="\${groupNoticeVO.groupNo}">\${groupNoticeVO.groupNoticeNm}</td>
										<td>관리자</td>
										<td>\${groupNoticeVO.regDate}</td>
									</tr>
								`;
	})
	tbody.html(str);
	$("#divPagingArea").html(articlePage.pagingArea);

	// 상세 모달창 띄우기
	$(".hoverText").on("click", function(){
		$("#groupNoticeNm").val($(this).text());
		$("#groupNoticeCn").val($(this).data("groupNoticeCn"));
		$("#groupName").val($(this).data("groupNo"));
		$("#createEmp").css("display", "none");
	});
}

// 검색
$("#btnSearch").on("click", function(){
	keyword = $("input[name='keyword']").val();
	console.log("검색어(keyword) : ", keyword);

	// 전역 함수 호출
	allList();
});

// 검색 엔터키 처리
$("input[name='keyword']").on("keydown", function(event) {
	if (event.key === "Enter") {
		$("#btnSearch").trigger("click");
		console.log("엔터키를 눌렀습니다");
	}
});

// 전체 선택/해제
$("#checkAll").click(function () {
	$(".selCheckbox").prop("checked", this.checked);
});

// 등록
$("#createEmp").on("click", function(){
	let groupNo = $(".optionSel").data("groupNo");
	// console.log("그룹번호(groupNo) : ", groupNo);
	let groupNoticeNm = $("#groupNoticeNm").val();
	let groupNoticeCn = $("#groupNoticeCn").val();

	let data = {
		"groupNo" : groupNo,
		"groupNoticeNm" : groupNoticeNm,
		"groupNoticeCn" : groupNoticeCn
	}
	console.log("통신 전 데이터(data) : ", data);

	$.ajax({
		url : "/managepage/createGroupNotice",
		contentType : "application/json;charset=utf-8",
		type: "post",
		data : JSON.stringify(data),
		dataType : "json",
		success : function(resp) {
			console.log("통신결과(resp) : ", resp);
			location.href = location.href;
		}
	});
});

// 공지사항 삭제
$('#deleteSelected').click(function () {
	const selectedIds = [];
	$('.selCheckbox:checked').each(function () {
			selectedIds.push({groupNoticeNo : $(this).val()});
	});
	// delBox.push({memId : $(this).data("empId")});
	console.log("몇개야?", selectedIds);

	if (selectedIds.length === 0) {
			Swal.fire('선택된 항목이 없습니다.', '', 'warning');
			return;
	}

	Swal.fire({
			title: '선택된 항목을 삭제하시겠습니까?',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: '삭제',
			cancelButtonText: '취소'
	}).then((result) => {
			if (result.isConfirmed) {
					// AJAX로 서버에 삭제 요청
					$.ajax({
							url: "/managepage/deleteGroupNotice", // 현재 선택된 groupNo를 URL에 추가
							type: 'delete',
							contentType: 'application/json',
							data: JSON.stringify(selectedIds),
							success: function (response) {
									Swal.fire('삭제 완료', '', 'success').then(() => {
										location.href = location.href
									});
							},
							error: function () {
									Swal.fire('삭제 실패', '다시 시도해주세요.', 'error');
							}
					});
			}
	});
});

// 등록창을 복귀 시키기
$("#regBtn").on("click", function(){
	$("#groupName").val("");
	$("#groupNoticeNm").val("");
	$("#groupNoticeCn").val("");
	$("#createEmp").css("display", "block");
});
*/
// 비동기로 생긴 텍스트 선택할 때 쓰기
// $(function(){
// 	// 모달창 상세
// 	$(".hoverText").on("click", function(){
// 		$("#groupNoticeNm").val($(this).text());
// 		$("#groupNoticeCn").val($(this).data("groupNoticeCn"));
// 		$("#groupName").val($(this).data("groupNo"));
// 	});
// })

/*
// 삭제 버튼 클릭 이벤트
$('#deleteSelected').click(function () {
	const selectedIds = [];
	$('.selCheckbox:checked').each(function () {
			selectedIds.push($(this).val());
	});

	if (selectedIds.length === 0) {
			Swal.fire('선택된 항목이 없습니다.', '', 'warning');
			return;
	}

	Swal.fire({
			title: '선택된 항목을 삭제하시겠습니까?',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: '삭제',
			cancelButtonText: '취소'
	}).then((result) => {
			if (result.isConfirmed) {
					// AJAX로 서버에 삭제 요청
					$.ajax({
							url: '/{groupNo}/delete',
							type: 'POST',
							contentType: 'application/json',
							data: JSON.stringify(selectedIds),
							success: function (response) {
									Swal.fire('삭제 완료', '', 'success').then(() => {
											location.reload(); // 페이지 새로고침
									});
							},
							error: function () {
									Swal.fire('삭제 실패', '다시 시도해주세요.', 'error');
							}
					});
			}
	});
});
*/

// 삭제 버튼 클릭 이벤트
/*
$('#deleteSelected').click(function () {
		const selectedIds = [];
		$('.selCheckbox:checked').each(function () {
				selectedIds.push($(this).val());
		});

		if (selectedIds.length === 0) {
				Swal.fire('선택된 항목이 없습니다.', '', 'warning');
				return;
		}

		Swal.fire({
				title: '선택된 항목을 삭제하시겠습니까?',
				icon: 'warning',
				showCancelButton: true,
				confirmButtonText: '삭제',
				cancelButtonText: '취소'
		}).then((result) => {
				if (result.isConfirmed) {
						// AJAX로 서버에 삭제 요청
						$.ajax({
								url: `/\${currentGroupNo}/delete`, // 현재 선택된 groupNo를 URL에 추가
								type: 'POST',
								contentType: 'application/json',
								data: JSON.stringify(selectedIds),
								success: function (response) {
										Swal.fire('삭제 완료', '', 'success').then(() => {
												location.reload(); // 페이지 새로고침
										});
								},
								error: function () {
										Swal.fire('삭제 실패', '다시 시도해주세요.', 'error');
								}
						});
				}
		});
});
*/
</script>

<!-- ///// footer 시작 ///// -->
<jsp:include page="../include/footer.jsp"></jsp:include>