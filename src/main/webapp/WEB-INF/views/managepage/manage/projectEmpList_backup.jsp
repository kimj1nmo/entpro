<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
		
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- css -->
<link href="/directlyCss/projectEmpList.css" rel="stylesheet">

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- sweetAlert -->
<link rel="stylesheet" href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>

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
					<li class="breadcrumb-item"><a href="/managepage/manage/list">프로젝트 리스트</a></li>
					<li class="breadcrumb-item"><a href="/managepage/manage/detail/${proNo}">프로젝트 상세페이지</a></li>
					<li class="breadcrumb-item active">담당자 배정</li>
				</ol>
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
</div>
<!-- 프로젝트 명 -->
<div class="d-flex justify-content-center align-items-center">
	<div class="callout callout-info col-md-6 d-flex align-items-center" onclick="location.href=`/managepage/manage/detail/${proNo}`" style="cursor: pointer;">
		<i class="fas fa-arrow-circle-left me-2 fa-2x"></i>
		<h2 class="flex-grow-1 text-center" style="text-align: center;">${projectVO.proTtl}</i></h2>
	</div>
</div>	
<!-- ///// content 시작 ///// -->

<section class="content">
	<div class="container-fluid">
		<!-- ///// content 시작 ///// -->
		<h3>직원 현황</h3>
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<div class="row">
							<div class="col-12 table-responsive">
								<div>
									<table class="table" id="postTable">
										<thead>
											<tr>
												<th><input type="checkbox" id="checkAll">&nbsp;&nbsp;전체 선택</th>
												<th>이름</th>
												<th>부서</th>
												<th>수행중인 세부 과업</th>
												<th>참여일</th>
											</tr>
										</thead>
										<tbody id="postTableBody">
											<c:forEach var="departmentVO" items="${departmentVOList}">
												<tr>
													<td><input type="checkbox" class="deleteCheckbox" data-emp-list-id="${departmentVO.memId}"
															value="${departmentVO.departNo}"></td>
													<td>${departmentVO.memName}</td>
													<td>${departmentVO.departName}</td>
													<td>${departmentVO.proJobNm}</td>
													<td>${departmentVO.regDate}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- /.col -->
						</div>
						<div class="col-12 d-flex justify-content-end" style="gap: 18px;">
							<button id="empReg" type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-lg">직원 등록</button>
							<button id="deleteEmp" class="btn btn-danger">직원 삭제</button>
						</div>
					</div>
				</div>
				<div class="card-body table-responsive p-0" id="divDetailArea"></div>
			</div>
			<!-- /.card -->
				
		</div>
		
		<!-- ///// content 끝 ///// -->
	</div>
	<!-- /.container-fluid -->
</section>
<!-- ///// content 끝 ///// -->

<!-- 모달 시작 -->
<div class="modal fade show" id="modal-lg" style="display: none; padding-right: 17px;" aria-modal="true" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">프로젝트 직원 추가</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<section class="content">
					<div class="container-fluid">
						<!-- ///// content 시작 ///// -->

						<!-- 직원 현황 검색창 묶기 -->
						<div class="d-flex justify-content-between align-items-center mb-4">
							<h3 class="mb-0">직원 현황</h3>

							<!-- 검색 창 -->
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

						<!-- 본문 -->
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-header">
										<div class="row">
											<div class="col-12 table-responsive">
												<div>
													<!-- 게시글 리스트 -->
													<table class="table" id="postTable">
														<thead>
															<tr>
																<th><input type="checkbox" id="regCheckAll">&nbsp;&nbsp;전체 선택</th>
																<th>이름</th>
																<th>부서</th>
																<th>참여일</th>
															</tr>
														</thead>
														<tbody id="tby">
															<!-- 컨텐츠 나올 곳 -->
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="card-body table-responsive p-0" id="divDetailArea"></div>
								<div class="card-footer" id="divPagingArea"></div>
							</div>
							<!-- /.card -->
						</div>
						<!-- <div class="col-12" style="justify-content: right; display: flex;">
							<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-lg">직원 등록</button>
							<button id="deleteSelected" class="btn btn-danger">삭제</button>
						</div> -->
						<!-- ///// content 끝 ///// -->
					</div>
					<!-- /.container-fluid -->
				</section>
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
	// pathVariable
	var proNo = `${projectVO.proNo}`;
	console.log("pathVariable 변수(proNo) : ", proNo);

	// data-emp-list-id
	var memId = $("[data-emp-list-id]").map(function(){
		return $(this).data("empListId");
	}).get();
	console.log("체킁(memId) : ", memId);
		
	// null 처리
	function nvl(expr1, expr2) {
		if (expr1 === undefined || expr1 == null || expr1 == "") {
				expr1 = expr2;
		}
		return expr1;
	}
	
// 모달 내 전체 직원 리스트 띄우기
// $("#empReg").on("click", function(){
	function getEmpList(currentPage, keyword, memId) {
		let data = {
			"currentPage": nvl(currentPage, "1"),
			"keyword": nvl(keyword, ""),
			"memId" : nvl(memId, "")
		};
		console.log("요청 데이터(data) : ", data);

		// 직원 등록 버튼 클릭 시
		$.ajax({
			url :"/managepage/manage/getEmpList",
			contentType: "application/json;charset=utf-8",
			data: JSON.stringify(data),
			type : "post",
			dataType : "json",
			success : function(articlePage){
				// console.log("모달 내 띄울 데이터(articlePage) : ", articlePage);
				// console.log("모달 내 띄울 리스트(articlePage.content) : ", articlePage.content);

				// 담을 테이블 만들기
				let str = "";

				// 멤버이름 담기
				let empName = [];
				let empId = [];
				$.each(articlePage.content, function (idx, departmentVO) {
					// console.log("반복문 1번째 매개변수(idx) : ", idx);
					// console.log("반복문 2번째 매개변수(departmentVO) : ", departmentVO);
					// console.log("반복문 2번째 매개변수 프로젝트 번호(departmentVO.proNo) : ", departmentVO.proNo);
					// console.log("memberVOList길이(departmentVO.memberVOList.length) : ", departmentVO.memberVOList.length);
					// console.log("반복문 2번째 매개변수안 리스트(departmentVO.memberVOList) : ", departmentVO.memberVOList);
					// console.log("반복문 2번째 매개변수안 리스트 안 리스트(departmentVO.memberVOList.projectEmpVOList) : ", departmentVO.memberVOList.projectEmpVOList);
					
					// 변수 멤버 이름 뽑기
					$.each(departmentVO.memberVOList, function(index, e) {
							// console.log("반복문 번호(index) : ", index);
							console.log("되니?(e) : ", e);
							empName.push(e.memName);
					});

					// 변수 멤버 아이디 뽑기
					$.each(departmentVO.memberVOList, function(index, e) {
							empId.push(e.memId);
					});
					
					// 모달 영역 이름 넣기
					str += `<tr>
										<td><input type="checkbox" class="regCheckbox"
																value="\${departmentVO.memberVOList}" data-mem-name="\${empName[idx]}" data-mem-id="\${empId[idx]}">
																&nbsp;&nbsp;&nbsp;\${departmentVO.rnum}
										</td>
										<td>`+nvl(empName[idx], "")+`</td>
										<td>`+nvl(departmentVO.departName, "")+`</td>
										<td><button type="button" class="btn btn-block btn-info" onclick="location.href='/managepage/manage/gantt/\${proNo}'">직원 일정 확인</button></td>
									</tr>`;	// end each

					$("#tby").html(str);
					// 페이징 처리
					$("#divPagingArea").html(articlePage.pagingArea);
				})
			}
		});
	}
	// 최초 호출
	getEmpList("1", "", memId);

	// 페이징 영역 클릭
	$(document).on("click", ".clsPagingArea", function(){

		// 클릭한 것은 하나
		let currentPage = $(this).data("currentPage"); // 2
		let keyword = $(this).data("keyword"); // ""

		// console.log("페이지 클릭 처리(currentPage) : " + currentPage);
		// console.log("페이지 클릭 처리(keyword) : " + keyword);

		// 회원 목록 호출
		getEmpList(currentPage, keyword, memId);
	});

	// 검색
	$("#btnSearch").on("click", function(){
		let keyword = $("input[name='keyword']").val();
		console.log("검색어(keyword) : ", keyword);

		// 전역 함수 호출
		getEmpList("1", keyword, memId);
	});

	// 검색 엔터키 처리
	$("input[name='keyword']").on("keydown", function(event) {
		if (event.key === 'Enter') {
			$("#btnSearch").trigger("click");
			console.log('엔터키를 눌렀습니다.');
		}
	});

	// 직원 전체 선택/해제
	$("#checkAll").on("click", function () {
		// console.log("this가 뭐양?(this) : ", this);
		$(".deleteCheckbox").prop("checked", this.checked);
	});

	// 모달창 직원 전체 선택/해제
	$("#regCheckAll").on("click", function () {
		// console.log("this가 뭐양?(this) : ", this);
		$(".regCheckbox").prop("checked", this.checked);
	});

	// 직원 추가
	const selBox = [];
	$('#createEmp').click(function () {
		$(".regCheckbox:checked").each(function () {
			selBox.push({memName : $(this).data("memName"), memId : $(this).data("memId"), proNo : proNo});
		});
		console.log("체크된 대상값(selBox)(전) : ", selBox);

		if (selBox.length === 0) {
			Swal.fire("선택된 항목이 없습니다.", "", "warning");
			return;
		}

		Swal.fire({
			title: "선택한 직원을 프로젝트에 추가하시겠습니까?",
			icon: "warning",
			showCancelButton: true,
			confirmButtonText: "추가",
			cancelButtonText: "취소"
		}).then((result) => {
			console.log("추가하기 실행(result) : ", result);
			if (result.isConfirmed) {
				$.ajax({
					url: "/managepage/manage/createEmp",
					type: "post",
					contentType: "application/json;charset=utf-8",
					data: JSON.stringify(selBox),
					dataType: "json",
					success: function (resp) {
						console.log("성공 데이터(resp) : ", resp);
						Swal.fire("추가 완료", "", "success").then(() => {
							location.reload();
						});
					},
					error: function () {
						Swal.fire("추가 실패", "다시 시도해주세요.", "error");
					}
				});
			}
		});
	});

	// 직원 삭제
	const delBox = [];
	$("#deleteEmp").on("click", function(){
		$(".deleteCheckbox:checked").each(function () {
			delBox.push({memId : $(this).data("empId")});
		})
		console.log("직원 삭제 리스트(delBox) : ", delBox);

		Swal.fire({
			title: "선택한 직원을 프로젝트에서 삭제하시겠습니까?",
			icon: "warning",
			showCancelButton: true,
			confirmButtonText: "삭제",
			cancelButtonText: "취소"
		}).then((result) => {
			console.log("삭제하기 실행(result) : ", result);
			if (result.isConfirmed) {
				$.ajax({
					url : "/managepage/manage/deleteEmp",
					type: "delete",
					contentType: "application/json;charset=utf-8",
					data: JSON.stringify(delBox),
					dataType: "json",
					success: function (resp) {
						console.log("삭제 성공 데이터(resp) : ", resp);
						Swal.fire("삭제 완료", "", "success").then(() => {
							location.reload();
						});
					},
					error: function () {
						Swal.fire("추가 실패", "다시 시도해주세요.", "error");
					}
				});
			}
		});
	});
	
		// let currentGroupNo = 0; // 현재 선택된 그룹 번호 (기본값: 전체 보기)

		// 드롭다운 선택 이벤트
		/*
		$('.dropdown-item').click(function (e) {
			e.preventDefault(); // 기본 동작 방지
			currentGroupNo = $(this).data('group-no'); // 선택한 그룹 번호
			const selectedGroupName = $(this).text(); // 선택한 그룹 이름

			// AJAX 요청: 그룹별 게시글 조회
			$.ajax({
				url: '/companypage/group',
				type: 'GET',
				data: { groupNo: currentGroupNo },
				success: function (response) {
					// 테이블 업데이트
					updateTable(response);

					// 드롭다운 버튼 텍스트 변경
					$('#groupDropdown').text(selectedGroupName);
				},
				error: function () {
					Swal.fire('오류', '데이터를 가져오는 중 문제가 발생했습니다.', 'error');
				}
			});
		});
		*/

		// 삭제 버튼 클릭 이벤트
		/*
		$('#deleteSelected').click(function () {
			const selectedIds = [];
			$('.deleteCheckbox:checked').each(function () {
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

		// 테이블 업데이트 함수
		/*
		function updateTable(data) {
			const tbody = $('#postTableBody');
			tbody.empty(); // 기존 데이터 제거

			if (data.length === 0) {
				tbody.append('<tr><td colspan="5">게시글이 없습니다.</td></tr>');
				return;
			}

			data.forEach(post => {
				const truncatedCommCn = post.commCn.length > 30
					? post.commCn.substring(0, 30) + "..."
					: post.commCn;

				const row = `
										<tr>
												<td><input type="checkbox" class="deleteCheckbox" value="${post.commNo}"></td>
												<td>\${post.groupName}</td>
												<td>
													<a href="/\${post.groupNo}/detailmanage?commNo=\${post.commNo}" 
														style="text-decoration: none; color: inherit;" 
														title="\${post.commCn}">
														\${truncatedCommCn}
													</a>
												</td>
												<td>\${post.commRegNick} (\${post.memId})</td>
												<td>\${post.commWriteDate}</td>
										</tr>
								`;
				tbody.append(row);
			});
		}
		*/
</script>

<%@ include file="../../include/footer.jsp" %>