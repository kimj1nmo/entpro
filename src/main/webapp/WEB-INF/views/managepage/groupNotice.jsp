<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- ///// header 시작 ///// -->
<jsp:include page="../include/header.jsp"></jsp:include>

<!-- 직접추가한 CSS -->
<link rel="stylesheet" href="/directlyCss/groupNotice.css">

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- sweetAlert -->
<link rel="stylesheet" href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- ///// content 시작 ///// -->

<div class="content-wrapper" style="background-color: white;">
	<!--     Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item active">그룹커뮤니티 공지</li>
				 </ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>

	<section class="content">
		<h2 class="pageTitle">그룹 커뮤니티 공지</h2>
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<!-- 카드 헤더 -->
						<div class="card-header d-flex justify-content-between align-items-center">
							<!-- 드롭다운 메뉴 -->
							<div class="dropdown">
								<button class="btn btn-primary dropdown-toggle" type="button" id="groupDropdown"
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									전체 보기 <!-- 기본 텍스트 -->
								</button>
								<div class="dropdown-menu" aria-labelledby="groupDropdown">
									<!-- 전체 보기 -->
									<a class="dropdown-item" href="#" data-group-no="0">전체
										보기</a>
									<!-- 그룹 목록 -->
									<c:forEach var="GroupNoticeVO" items="${GroupNoticeVOAll}">
										<a class="dropdown-item" href="#" data-group-no="${GroupNoticeVO.groupNo}">
											${GroupNoticeVO.groupName}
										</a>
									</c:forEach>
								</div>
							</div>
							
							<!-- 검색 폼 -->
							<div class="card-tools">
									<div class="input-group input-group-sm" style="width: 200px;">
										<input 
											type="text" 
											id="krd" 
											name="keyword" 
											value="${param.keyword}" 
											class="form-control float-right" 
											placeholder="검색어 입력" />
										<div class="input-group-append">
											<button 
												type="button" 
												id="btnSearch" 
												class="btn btn-default">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>
							</div>
						</div>
	
						<!-- 카드 바디 -->
						<div class="card-body table-responsive p-0">
							<!--  테이블 시작 -->
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th><input type="checkbox" id="checkAll"> 전체 선택</th>
										<th>번호</th>
										<th>제목</th>
										<th>그룹명</th>
										<th>작성자</th>
										<th style="padding-left: 20px;">작성일</th>
									</tr>
								</thead>
								<tbody id="postTableBody">
									<!-- 스크립트로 나올곳 -->
								</tbody>
							</table>
							<!-- 테이블 종료 -->
						</div>
	
						<!-- 페이징 및 버튼 영역 -->
						<div class="card-footer2 d-flex justify-content-between align-items-center">
							<div id="divPagingArea" style="background-color: white; flex-grow: 1;"></div>
							<div class="d-flex" style="gap: 15px; padding-right: 15px;">
								<button id="regBtn" data-toggle="modal" data-target="#modal-lg" class="btn btn-primary me-2">등록</button>
								<button id="deleteSelected" class="btn btn-danger">삭제</button>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<!-- ///// content 끝 ///// -->

<!-- 모달 시작 -->
<div class="modal fade show" id="modal-lg" style="display: none; padding-right: 17px;" aria-modal="true"
	role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<div class="card card-primary col-12 p-0 m-0">
				<div class="card-header">
					<h3 class="card-title">공지사항 등록</h3>
				</div>
				<div class="card-body">
					<div class="form-group" style="display: none;">
						<label for="groupNo">그룹 번호</label>
						<textarea id="groupNo" class="form-control" rows="6"></textarea>
					</div>
					<div class="form-group">
						<label for="groupName">그룹</label>
						<select id="groupName" class="form-control custom-select">
							<option value="">선택</option>
							<c:forEach var="groupNoticeVO" items="${GroupNoticeVOAll}" varStatus="stat">
								<option class="optionSel" data-group-no="${groupNoticeVO.groupNo}"
									value="${groupNoticeVO.groupNo}">
									${groupNoticeVO.groupName}
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="">제목</label>
						<input type="text" class="form-control" value="관리자" readonly required />
					</div>
					<div class="form-group">
						<label for="groupNoticeCn">제목</label>
						<input type="text" id="groupNoticeNm" class="form-control" value="" required />
					</div>
					<div class="form-group">
						<label for="groupNoticeCn">내용</label>
						<textarea id="groupNoticeCn" class="form-control" rows="10" required></textarea>
					</div>
					<!-- <div id="projectReg" class="col-12">
							<button type="button" id="btnSubmit" class="btn btn-primary btn-user">등록</button>
						</div> -->
				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card -->

			<div class="modal-footer d-flex justify-content-between">
				<button id="createEmp" type="button" class="btn btn-primary">추가</button>
				<div class="ml-auto">
					<button type="button" id="previewBtn" class="btn btn-primary btn-user">시연용</button>
					<button type="button" class="btn btn-default ml-auto" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- 모달 끝 -->
<script>
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
	function allList() {
		let data = {
			"groupNo": currentGroupNo,
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
			"groupNo": currentGroupNo,
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
						<td>\${groupNoticeVO.groupName}</td>
						<td>관리자</td>
						<td>\${groupNoticeVO.regDate}</td>
					</tr>
				`;
		})
		tbody.html(str);
		$("#divPagingArea").html(articlePage.pagingArea);

		// 상세 모달창 띄우기
		$(".hoverText").on("click", function () {
			$("#groupNoticeNm").val($(this).text());
			$("#groupNoticeCn").val($(this).data("groupNoticeCn"));
			$("#groupName").val($(this).data("groupNo"));
			$("#createEmp").css("display", "none");
			$("#groupName").attr("readonly", true);
			$("#groupNoticeNm").attr("readonly", true);
			$("#groupNoticeCn").attr("readonly", true);
			$(".card-title").text("공지사항");
		});
	}

	// 검색
	$("#btnSearch").on("click", function () {
		keyword = $("input[name='keyword']").val();
		console.log("검색어(keyword) : ", keyword);

		// 전역 함수 호출
		allList();
	});

	// 검색 엔터키 처리
	$("input[name='keyword']").on("keydown", function (event) {
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
	$("#createEmp").on("click", function () {
		let groupNo = $("#groupName").val();
		console.log("그룹번호(groupNo) : ", groupNo);
		let groupNoticeNm = $("#groupNoticeNm").val();
		let groupNoticeCn = $("#groupNoticeCn").val();

		let data = {
			"groupNo": groupNo,
			"groupNoticeNm": groupNoticeNm,
			"groupNoticeCn": groupNoticeCn
		}
		console.log("통신 전 데이터(data) : ", data);

		Swal.fire({
			title: '게시글을 추가하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonText: '추가',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
			$.ajax({
				url: "/managepage/createGroupNotice",
				contentType: "application/json;charset=utf-8",
				type: "post",
				data: JSON.stringify(data),
				dataType: "json",
				success: function (resp) {
					console.log("통신결과(resp) : ", resp);
					Swal.fire('추가 완료', '', 'success').then(() => {
						location.href = location.href
					});
				}
			});
		}
		});
	});

	// 공지사항 삭제
	$('#deleteSelected').click(function () {
		const selectedIds = [];
		$('.selCheckbox:checked').each(function () {
			selectedIds.push({ groupNoticeNo: $(this).val() });
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
	$("#regBtn").on("click", function () {
		$("#groupName").val("");
		$("#groupNoticeNm").val("");
		$("#groupNoticeCn").val("");
		$("#createEmp").css("display", "block");
		$("#groupName").attr("readonly", false);
		$("#groupNoticeNm").attr("readonly", false);
		$("#groupNoticeCn").attr("readonly", false);
		$(".card-title").text("공지사항 등록");
	});

// 시연용 값 채워질 버튼
$("#previewBtn").on("click", function(){
	$("#groupName").val("6");
	$("#groupNoticeNm").val("[공지] 2025년 월드 투어 일정 발표!");
	$("#groupNoticeCn").val("안녕하세요, 팬 여러분!드디어 기다리고 기다리던 2025년 월드 투어 일정이 확정되었습니다.이번 투어는 전 세계 10개 도시를 돌며, 팬들과 함께 특별한 순간을 나눌 예정입니다.먼저 각 지역별 일정과 티켓 오픈일을 확인해 주세요!");
});
</script>

<!-- ///// footer 시작 ///// -->
<jsp:include page="../include/footer.jsp"></jsp:include>