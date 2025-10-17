<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- ///// header 시작 ///// -->
<jsp:include page="../include/header_user.jsp"></jsp:include>

<!-- 자리 잡으면 삭제 -->
<link rel="stylesheet" href="/directlyCss/groupNotice.css">
<!-- 직접추가한 CSS -->
<link rel="stylesheet" href="/directlyCss/question.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="/adminlte/plugins/fontawesome-free/css/all.min.css">
<!-- Bootstrap 4 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<div class="content-wrapper">
	<!--     Content Header (Page header) -->
	<div class="content-header">
			<div class="container-fluid">
					<div class="row mb-2">
							<div class="col-sm-6"></div>
					</div>
			</div>
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
						<h3>고객센터</h3>

						<!-- 검색창 -->
						<div class="input-group input-group-sm" style="width: 150px;">
							<input type="text" name="keyword" value="${param.keyword}" class="form-control float-right"
								placeholder="검색어 입력" />
							<div class="input-group-append">
								<button type="button" id="btnSearch" class="btn btn-default">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="row">
							<div class="col-12">
									<div class="card">
											<div class="card-header">
													<div class="row">
														<!-- 드롭다운 메뉴 -->
														<div class="dropdown mb-3">
																<button class="btn btn-primary dropdown-toggle"
																		type="button" id="groupDropdown" data-toggle="dropdown"
																		aria-haspopup="true" aria-expanded="false">
																		전체 보기 <!-- 기본 텍스트 -->
																</button>
																<div class="dropdown-menu" aria-labelledby="groupDropdown">
																		<!-- 전체 보기 -->
																		<a class="dropdown-item" href="#" data-qstn-ctgry-no="0">전체
																				보기</a>
																		<!-- 카테고리 목록 -->
																		<c:forEach var="questionVO" items="${questionVOList}">
																			<a class="dropdown-item" href="#"
																					data-qstn-ctgry-no="${questionVO.qstnCtgryNo}">
																					${questionVO.qstnCtgryNm}
																			</a>
																		</c:forEach>
																</div>
														</div>
														<div class="col-12 table-responsive" style="padding: 0 0 0 0 !important;">
																<div>
																		<!-- 게시글 리스트 -->
																		<table class="table" id="postTable">
																				<thead>
																						<tr>
																							<th>번호</th>
																							<th>분류</th>
																							<th>제목</th>
																							<th>답변상태</th>
																							<th>작성자</th>
																							<th style="padding-left: 20px;">작성일</th>
																						</tr>
																				</thead>
																				<tbody id="postTableBody">
																					<!-- 스크립트로 나올곳 -->
																				</tbody>
																		</table>
																</div>
														</div>
														<!-- /.col -->
													</div>
											</div>
										</div>
									<!-- /.card-header -->

									<!-- <div class="card-body table-responsive p-0" id="divDetailArea"></div> -->
									<!-- /.card-body -->
									<!-- card-footer 시작 -->
									<!-- card-footer 끝 -->
									
									<!-- 페이징, 버튼 영역 -->
									<div class="col-12 d-flex justify-content-between align-items-center">
										<div class="card-footer" id="divPagingArea"></div>
										<div class="d-flex" style="gap: 15px;">
											<button id="regBtn" data-toggle="modal" data-target="#modal-lg" class="btn btn-primary me-2">등록</button>
											<!-- <button id="deleteSelected" class="btn btn-danger">삭제</button> -->
										</div>
									</div>
							</div>
							<!-- /.card -->

					</div>
					



					<!-- ///// content 끝 ///// -->
			</div>
			<!-- /.container-fluid -->
	</section>
</div>
<!-- ///// content 끝 ///// -->

<!-- 모달 시작 -->
<div class="modal fade show" id="modal-lg" style="display: none; padding-right: 17px;" aria-modal="true" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="card card-primary col-12 p-0 m-0">
				<div class="card-header">
					<h3 class="card-title">문의 등록</h3>
				</div>
					<div class="card-body">
						<div class="form-group" style="display: none;">
							<label for="qstnNo">문의 번호</label>
							<textarea id="qstnNo" class="form-control" rows="6"></textarea>
						</div>
						<div class="form-group">
							<label for="qstnCtgryNo">문의 종류</label>
							<select id="qstnCtgryNo" class="form-control custom-select">
								<option value="">선택</option>
								<c:forEach var="questionVO" items="${questionVOList}" varStatus="stat">
									<option class="optionSel" data-qstn-ctgry-no="${questionVO.qstnCtgryNo}" value="${questionVO.qstnCtgryNo}">
										${questionVO.qstnCtgryNm}
									</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="qstnTtl">제목</label>
							<input type="text" id="qstnTtl" class="form-control" value="" required />
						</div>
						<div class="form-group">
							<label for="qstnCn">내용</label>
							<textarea id="qstnCn" class="form-control" rows="8" required></textarea>
						</div>
						<!-- 관리자 답변 -->
						<div id="title" class="form-group">
							<label for="ansTtl">제목</label>
							<input type="text" id="ansTtl" class="form-control" value="" readonly required />
						</div>
						<div id="answer" class="form-group">
							<label for="ansCn">답변</label>
							<textarea id="ansCn" class="form-control" rows="8" readonly required></textarea>
						</div>
						<div id="answerDate" class="form-group">
							<label for="ansDate">답변 날짜</label>
							<input type="date" id="ansDate" class="form-control" value="" readonly />
						</div>
						<!-- <div id="projectReg" class="col-12">
							<button type="button" id="btnSubmit" class="btn btn-primary btn-user">등록</button>
						</div> -->
					</div>
			</div>
				
			<div class="modal-footer justify-content-between">
				<button id="createEmp" type="button" class="btn btn-primary">추가</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- 모달 끝 -->
<script>
// 전역변수
// 현재 선택된 고객센터 번호 (기본값: 환불)
var qstnCtgryNo = 1; 
// 현재 페이지
var currentPage = 1;
// 검색어
var keyword = "";
// 로그인한 회원 받아오기
let loginMemId="";
$.ajax({
	url: "/api/userInfo",
	method: "GET",
	success: function(data) {
			console.log("로그인 정보: ", data)//memId 와 authName의 authList가들어잇음
			loginMemId = data.memId; // 서버에서 받은 사용자 정보를 전역 정보에 입력 가능 
	},
	error: function(xhr, status, error) {
			console.error('로그인 정보 가져오기 실패:', error);
	}
});


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
		"qstnCtgryNo" : qstnCtgryNo,
		"currentPage": nvl(currentPage, "1"),
		"keyword": nvl(keyword, "")
	}
	console.log("리스트 넘길 데이터(data) : ", data);

	// 고객센터 리스트 데이터 받아오기
	$.ajax({
		url: "/notice/questionList",
		type: "post",
		contentType: "application/json;charset=utf-8",
		dataType: "json",
		data: JSON.stringify(data),
		success: function (articlePage) {
			// console.log("고객센터 리스트 요청 결과(articlePage) : ", articlePage);
			// console.log("고객센터 리스트 요청 결과 콘텐츠(articlePage.content) : ", articlePage.content);

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

	// 선택한 카테고리 번호
	currentCtgryNo = $(this).data('qstn-ctgry-no');
	// console.log("선택한 번호(currentCtgryNo) : ", currentCtgryNo);

	// 선택한 그룹 이름
	const selectedGroupName = $(this).text();
	
	let data = {
		"qstnCtgryNo" : currentCtgryNo,
		"currentPage": nvl(currentPage, "1"),
		"keyword": nvl(keyword, "")
	}
	// console.log("통신에 보낼 데이터(data) : ", data);

	// 그룹별 게시글 조회
	$.ajax({
			url: "/notice/questionList",
			type: "post",
			contentType: "application/json;charset=utf-8",
			dataType: "json",
			data: JSON.stringify(data),
			success: function (articlePage) {
				// console.log("그룹 요청 결과(articlePage) : ", articlePage);
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

// 최초 실행 & 드롭다운 선택 시 테이블 업데이트 함수
function updateTable(articlePage) {
	// console.log("콜백->테이블생성 데이터(articlePage) : ", articlePage);
	// console.log("콜백->테이블생성 데이터 콘텐츠(articlePage.content) : ", articlePage.content);
	const tbody = $('#postTableBody');
	tbody.empty(); // 기존 데이터 제거

	// 빈 게시물 처리
	if (!articlePage) {
		tbody.append('<tr><td colspan="5">게시글이 없습니다.</td></tr>');
		return;
	}

	let str = ""
	$.each(articlePage.content, function (idx, questionVO) {
		// console.log("반복문 안 1번째 매개변수(idx) : ", idx);
		// console.log("반복문 안 2번째 매개변수(questionVO) : ", questionVO);
		// console.log("반복문 안 회원정보(questionVO.memId) : ", questionVO.memId);
		// console.log("반복문 안 로그인 정보(loginMemId) : ", loginMemId);
			if(questionVO.memId == loginMemId){
				str += `
								<tr>
									<td>\${questionVO.rnum}</td>
									<td>\${questionVO.qstnCtgryNm}</td>
									<td data-toggle="modal" data-target="#modal-lg" class="hoverText"
										data-qstn-ttl="\${questionVO.qstnTtl}" data-qstn-ctgry-no="\${questionVO.qstnCtgryNo}" data-qstn-cn="\${questionVO.qstnCn}" data-qstn-no="\${questionVO.qstnNo}">\${questionVO.qstnTtl}</td>
									<td>\${questionVO.qstnYn == '1' ? '<i class="fas fa-check-circle text-success">답변완료</i>' : '<i class="fas fa-clock text-warning">답변예정</i>'}</td>
									<td>\${questionVO.memId}</td>
									<td>\${questionVO.qstnDate}</td>
								</tr>
							 `;
			}
	})
	tbody.html('<tr><td colspan="5">게시글이 없습니다.</td></tr>');
	// 로그인 정보 같으면 목록 나오기
	if(str) tbody.html(str);
	$("#divPagingArea").html(articlePage.pagingArea);

	// 상세 모달창 띄우기
	$(".hoverText").on("click", function(){
		// 제목
		$("#qstnTtl").val($(this).text());
		// 내용
		$("#qstnCn").val($(this).data("qstnCn"));
		$("#qstnCtgryNo").val($(this).data("qstn-ctgry-no"));
		$("#createEmp").css("display", "none");
		
		$("#ansTtl").val("");
		$("#ansCn").val("");
		$("#ansDate").val("");
		
		// 관리자 답변 받아오기
		let qstnNo = $(this).data("qstn-no");
		let answerData = {
			"qstnNo" : qstnNo
		}
		console.log("관리자 답변 통신데이터(answerData) : ", answerData);

		$.ajax({
			url: "/notice/answerQuestion",
			type: "post",
			contentType: "application/json;charset=utf-8",
			dataType: "json",
			data: JSON.stringify(answerData),
			success: function (resp) {
				console.log("그룹 요청 결과(resp) : ", resp);

				// 컬럼 업데이트
				$("#ansTtl").val(resp.ansTtl);
				$("#ansCn").val(resp.ansCn);
				$("#ansDate").val(resp.ansDate);
			}
	});

		$("#title").css("display", "block");
		$("#answer").css("display", "block");
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

/*
// 전체 선택/해제
$("#checkAll").click(function () {
	$(".selCheckbox").prop("checked", this.checked);
});
*/

// 등록
$("#createEmp").on("click", function(){
	let qstnCtgryNo = $(".optionSel").data("qstn-ctgry-no");
	// console.log("그룹번호(groupNo) : ", groupNo);
	let qstnTtl = $("#qstnTtl").val();
	let qstnCn = $("#qstnCn").val();

	let data = {
		"qstnCtgryNo" : qstnCtgryNo,
		"qstnTtl" : qstnTtl,
		"qstnCn" : qstnCn,
		"memId" : loginMemId
	}
	console.log("통신 전 데이터(data) : ", data);

	$.ajax({
		url : "/notice/createQuestion",
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

/*
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
*/

// 등록창을 복귀 시키기
$("#regBtn").on("click", function(){
	$("#qstnCtgryNo").val("");
	$("#qstnTtl").val("");
	$("#qstnCn").val("");
	$("#createEmp").css("display", "block");
	$("#title").css("display", "none");
	$("#answer").css("display", "none");
});

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
<jsp:include page="../include/header_user.jsp"></jsp:include>