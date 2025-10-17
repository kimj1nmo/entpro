<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="/directlyCss/companyEmpManage.css">
<!-- sweetAlert -->
<link rel="stylesheet" href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- 모든 페이지에 이거 추가해야함 -->
<!--     Content Header (Page header) -->
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
		<h2 class="pageTitle" style="margin-left: 0.5vw;">직원관리</h2>
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<!-- 카드 헤더 -->
						<div class="card-header d-flex justify-content-between align-items-center">
							<!-- 드롭다운 메뉴 -->
							<div class="dropdown" style="margin-right: auto;">
								<button class="btn btn-primary dropdown-toggle" type="button" id="groupDropdown"
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									전체 보기 <!-- 기본 텍스트 -->
								</button>
								<div class="dropdown-menu dropdownScroll" aria-labelledby="groupDropdown">
									<!-- 전체 보기 -->
									<a class="dropdown-item" href="#" data-group-no="0">전체
										보기</a>
									<!-- 카테고리 목록 -->
									<c:forEach var="departmentVO" items="${departmentVOList}">
										<a class="dropdown-item" href="#" data-depart-no="${departmentVO.departNo}">
											${departmentVO.departName}
										</a>
									</c:forEach>
								</div>
							</div>

							<!-- 검색 폼 -->
							<div class="card-tools">
								<!-- <form> -->
									<div class="input-group input-group-sm" style="width: 200px;">
										<input type="text" id="krd" name="keyword" value="${param.keyword}"
											class="form-control float-right" placeholder="검색어 입력" />
										<div class="input-group-append">
											<button type="button" id="btnSearch" class="btn btn-default">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>
								<!-- </form> -->
							</div>
						</div>

						<!-- 카드 바디 -->
						<div class="card-body table-responsive p-0">
							<!--  테이블 시작 -->
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th>번호</th>
										<th>이름</th>
										<th>아이디</th>
										<th>비밀번호</th>
										<th>전화번호</th>
										<th>이메일</th>
										<th>직급</th>
										<th>부서</th>
										<th>재직여부</th>
										<th>입사일자</th>
									</tr>
								</thead>
								<tbody id="tby">
									<!-- 스크립트로 나올곳 -->
								</tbody>
							</table>
						</div>

						<!-- 페이징 및 버튼 영역 -->
						<div class="card-footer2 d-flex justify-content-between align-items-center"
							style="margin-top: 4vh;">
							<div id="divPagingArea" style="background-color: white; flex-grow: 1;"></div>
							<div class="d-flex" style="gap: 15px; padding-right: 15px;">
								<button id="regBtn" data-toggle="modal" data-target="#modal-lg"
									class="btn btn-primary me-2">등록</button>
								<!-- <button id="deleteSelected" class="btn btn-danger">삭제</button> -->
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<!-- 모달 시작 -->
<div class="modal fade show" id="modal-lg" style="display: none; padding-right: 17px;" aria-modal="true"
	role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<div class="card card-primary col-12 p-0 m-0">
				<div class="card-header">
					<h3 class="card-title">직원 등록</h3>

				</div>
				<div class="card-body">
					<div class="form-group">
						<label for="">이름</label>
						<input id="memName" type="text" class="form-control" value="" required empty />
					</div>
					<div class="form-group">
						<label for="memId">아이디</label>
						<div class="input-group">
							<input id="memId" type="text" class="form-control" placeholder="아이디 입력" required empty />
							<button id="btnIdDupChk" type="button" class="btn btn-primary">중복 확인</button>
						</div>
					</div>
					<div class="form-group">
						<label for="memPw">비밀번호</label>
						<input id="memPw" type="password" class="form-control" value="" required />
					</div>
					<div class="form-group">
						<label for="">전화번호</label>
						<input id="memTel" type="tel" class="form-control" value="" placeholder="000-0000-0000" required
							empty />
					</div>
					<div class="form-group">
						<label for="">이메일</label>
						<input id="memEmail" type="email" class="form-control" value="" placeholder="" required empty />
					</div>
					<!-- <div class="form-group" style="display: none;">
		<label for="groupNo">그룹 번호</label>
		<textarea id="groupNo" class="form-control" rows="6"></textarea>
	</div> -->
					<div class="form-group">
						<label for="">직급</label>
						<select id="posNo" class="form-control custom-select" empty>
							<option value="">선택</option>
							<c:forEach var="positionVO" items="${positionVOList}" varStatus="stat">
								<option class="optionSel" value="${positionVO.posNo}">
									${positionVO.posName}
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="">부서</label>
						<select id="departNo" class="form-control custom-select" empty>
							<option value="">선택</option>
							<c:forEach var="departmentVO" items="${departmentVOList}" varStatus="stat">
								<option class="optionSel" value="${departmentVO.departNo}">
									${departmentVO.departName}
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="">성별</label>
						<select id="memGender" class="form-control custom-select" empty>
							<option value="">선택</option>
							<option class="optionSel" value="1">남자</option>
							<option class="optionSel" value="0">여자</option>
						</select>
					</div>
					<!-- <div class="form-group">
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
	</div> -->
					<!-- <div id="projectReg" class="col-12">
		<button type="button" id="btnSubmit" class="btn btn-primary btn-user">등록</button>
	</div> -->
				</div>
				<!-- /.card-body -->
			</div>
			<!-- /.card -->

			<div class="modal-footer d-flex justify-content-between">
				<button id="deleteBtn" type="button" class="btn btn-danger">퇴사 처리</button>
				<button id="createEmp" type="button" class="btn btn-primary">추가</button>
				<div class="ms-auto">
					<button type="button" id="previewBtn" class="btn btn-primary btn-user">시연용</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- 모달 끝 -->


<script type="text/javascript">
	// 전역변수
	// 현재 페이지
	var currentPage = 1;
	// 검색어
	var keyword = "";
	// 상세창 띄울 시 아이디 담기
	var delMemId = "";

	// null 체크
	function nvl(expr1, expr2) {
		if (expr1 === undefined || expr1 == null || expr1 == "") {
			expr1 = expr2;
		}
		return expr1;
	}

	// 페이지 로드 시 바로 실행되는 함수
	function allList(currentPage, keyword) {
		let data = {
			"currentPage": nvl(currentPage, "1"),
			"keyword": nvl(keyword, "")
		}
		console.log("리스트 넘길 데이터(data) : ", data);

		// 고객센터 리스트 데이터 받아오기
		$.ajax({
			url: "/companypage/empList",
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


	// 최초 실행 & 드롭다운 선택 시 테이블 업데이트 함수
	function updateTable(articlePage) {
		console.log("콜백->테이블생성 데이터(articlePage) : ", articlePage);
		// console.log("콜백->테이블생성 데이터 콘텐츠(articlePage.content) : ", articlePage.content);
		const tbody = $('#tby');
		tbody.empty(); // 기존 데이터 제거

		// 반복문 직원 목록
		let str = ""
		$.each(articlePage.content, function (idx, memberVO) {
			// console.log("반복문 안 1번째 매개변수(idx) : ", idx);
			// console.log("반복문 안 2번째 매개변수(memberVO) : ", memberVO);
			// console.log("반복문 안 회원정보(questionVO.memId) : ", questionVO.memId);
			// console.log("반복문 안 로그인 정보(loginMemId) : ", loginMemId);
			str += `
							<tr data-toggle="modal" data-target="#modal-lg" class="hoverText" data-mem-id="\${memberVO.memId}" data-mem-name="\${memberVO.memName}"
							data-mem-tel="\${memberVO.memTel}" data-mem-Email="\${memberVO.memEmail}" data-pos-no="\${memberVO.posNo}"
							data-depart-no="\${memberVO.departNo}" data-mem-reg-date="\${memberVO.memRegDate}" data-mem-gender="\${memberVO.memGender}">
								<td>\${memberVO.rnum}</td>
								<td>\${memberVO.memName}</td>
								<td>\${memberVO.memId}</td>
								<td>******</td>
								<td>\${memberVO.memTel}</td>
								<td>\${memberVO.memEmail}</td>
								<td>\${memberVO.posName}</td>
								<td>\${memberVO.departName}</td>
								<td>\${memberVO.memEnable == 'y' ? '<i class="fas fa-check-circle text-success">&nbsp;재직중</i>' : '<i class="fas fa-clock text-warning">&nbsp;퇴사</i>'}</td>
								<td>\${memberVO.memRegDate}</td>
							</tr>
							`;
		})
		tbody.html('<tr><td colspan="5">게시글이 없습니다.</td></tr>');
		// 게시글이 존재하면 나오기
		if (str) tbody.html(str);
		$("#divPagingArea").html(articlePage.pagingArea);

		// 상세 모달창 띄우기

		$(".hoverText").on("click", function () {
			// 삭제 때 활용할 아이디
			delMemId = $(this).data("memId");
			$("#memName").val($(this).data("memName"));
			$("#memId").val($(this).data("memId"));
			$("#memTel").val($(this).data("memTel"));
			$("#memEmail").val($(this).data("memEmail"));
			$("#posNo").val($(this).data("posNo"));
			$("#departNo").val($(this).data("departNo"));
			$("#memRegDate").val($(this).data("memRegDate"));
			$("#memGender").val($(this).data("memGender"));
			$("#memPw").css("display", "none");
			$("label[for=memPw]").css("display", "none");
			$("#btnIdDupChk").css("display", "none");
			$("#previewBtn").attr("disabled", true);
			$("#createEmp").css("display", "none");
			$("#deleteBtn").css("display", "block");
			$("#memName").attr("readonly", true);
			$("#memEmail").attr("readonly", true);
			$("#memId").attr("readonly", true);
			$("#memTel").attr("readonly", true);
			$("#posNo").attr("readonly", true);
			$("#departNo").attr("readonly", true);
			$("#memRegDate").attr("readonly", true);
			$("#memGender").attr("readonly", true);
		});

		// 페이지 클릭 처리 (동적 요소)
		$(".clsPagingArea").on("click", function () {
			let currentPage = $(this).data("currentPage");	// 클릭한 요소의 속성값
			let keyword = $(this).data("keyword"); // 각각 클릭한 페이지, 검색어

			console.log("페이지 클릭 처리 -> currentPage : ", currentPage); // 클릭한 페이지 번호 출력
			console.log("페이지 클릭 처리 -> keyword : ", keyword); // 검색어 출력

			allList(currentPage, keyword); // 함수 재호출(해당페이지, 검색어)
		});
	};

	// 삭제(비활성화)
	$("#deleteBtn").on("click", function () {
		// console.log("아이디값(delMemId) : ", delMemId);
		let delDate = {
			"memId": delMemId
		}

		Swal.fire({
			title: '해당 직원을 퇴사 처리하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonText: '퇴사 처리',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				$.ajax({
					url: "/companypage/deleteMem",
					type: "post",
					contentType: "application/json;charset=utf-8",
					dataType: "json",
					data: JSON.stringify(delDate),
					success: function (resp) {
						console.log("삭제(비활성화) 결과(resp) : ", resp);
						Swal.fire('처리 완료', '', 'success').then(() => {
							location.href = location.href
						});
					}
				});
			}
		});
	});

	// 검색
	$("#btnSearch").on("click", function () {
		keyword = $("input[name='keyword']").val();
		console.log("검색어(keyword) : ", keyword);

		// 전역 함수 호출
		allList(currentPage, keyword);
	});

	// 검색 엔터키 처리
	$("input[name='keyword']").on("keydown", function (event) {
		if (event.key === "Enter") {
			$("#btnSearch").trigger("click");
			// console.log("엔터키");
		}
	});

	// 등록 버튼 누를 시 등록창을 비우기
	$("#regBtn").on("click", function () {
		$("[empty]").val("");
		$("#btnIdDupChk").css("display", "block");
		$("#memPw").css("display", "block");
		$("label[for=memPw]").css("display", "block");
		$("#createEmp").css("display", "block");
		$("#deleteBtn").css("display", "none");
		$("#previewBtn").attr("disabled", false);
		$("#memName").attr("readonly", false);
		$("#memEmail").attr("readonly", false);
		$("#memId").attr("readonly", false);
		$("#memTel").attr("readonly", false);
		$("#posNo").attr("readonly", false);
		$("#departNo").attr("readonly", false);
		$("#memRegDate").attr("readonly", false);
		$("#memGender").attr("readonly", false);
	});

	// 직원 등록
	$("#createEmp").on("click", function () {
		let memName = $("#memName").val();
		let memId = $("#memId").val();
		let memPw = $("#memPw").val();
		let memTel = $("#memTel").val();
		let memEmail = $("#memEmail").val();
		let posNo = $("#posNo").val();
		let departNo = $("#departNo").val();
		let memGender = $("#memGender").val();
		// let qstnNo = $(".hoverText").data("qstn-no");

		if(!memName || !memId || !memPw || !memTel || !memEmail || !posNo || !departNo || !memGender)	{
			Swal.fire({
				title: '모든 정보를 입력해 주세요',
				text: '',
				icon: 'warning',
				position: 'top-end',
				showConfirmButton: false,
				timer: 1500,
				toast: true, 
				width: '300px',  
			})
			return;
		}
		
		let data = {
			"memName": memName
			, "memId": memId
			, "memPw": memPw
			, "memTel": memTel
			, "memEmail": memEmail
			, "posNo": posNo
			, "departNo": departNo
			, "memGender": memGender
		}
		console.log("직원 추가 보낼 데이터(data) : ", data);
		
		Swal.fire({
			title: '직원을 추가하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonText: '추가',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				$.ajax({
					url: "/companypage/signInEmp",
					type: "post",
					contentType: "application/json;charset=utf-8",
					dataType: "json",
					data: JSON.stringify(data),
					success: function (resp) {
						console.log("그룹 요청 결과(resp) : ", resp);
						Swal.fire('추가 완료', '', 'success').then(() => {
							location.href = location.href
						});
					}
				});
			}
		});
	});

	// 아이디 중복 체크
	$("#btnIdDupChk").on("click", function () {
		let memId = $.trim($("#memId").val());
		console.log("memId : ", memId);

		if (memId == "") {
			var Toast = Swal.mixin({
				toast: true,
				position: 'top-end',
				showConfirmButton: false,
				timer: 3000
			});
			Toast.fire({
				icon: 'warning',
				title: '아이디를 입력해주세요'
			});

			$("#memId").focus();
		}

		let idData = {
			"memId": memId
		}
		$.ajax({
			url: "/companypage/idDupChk",
			contentType: "application/json;charset=utf-8",
			data: JSON.stringify(idData),
			type: "post",
			dataType: "text",
			success: function (result) {
				// result => 1) 1 : 중복됨 2) 0 : 중복안됨
				console.log("result: ", result);
				if (result == 1) {// 중복됨
					var Toast = Swal.mixin({
						toast: true,
						position: 'top-end',
						showConfirmButton: false,
						timer: 3000
					});
					Toast.fire({
						icon: 'warning',
						title: '아이디가 중복되었습니다.'
					});

					$("#memId").focus();
					//등록 버튼 비활성
					$("#btnSubmit").attr("disabled", true);
				} else {

					var Toast = Swal.mixin({
						toast: true,
						position: 'top-end',
						showConfirmButton: false,
						timer: 3000
					});
					Toast.fire({
						icon: 'success',
						title: '아이디가 사용가능합니다.'
					});
					$("#btnSubmit").removeAttr("disabled");
				}
			}
		});
	});


	// 드롭다운 선택 이벤트
	$('.dropdown-item').click(function (e) {
		// 기본 동작 방지
		e.preventDefault();

		// 선택한 카테고리 번호
		let departNo = $(this).data('depart-no');
		console.log("선택한 번호(departNo) : ", departNo);

		// 선택한 그룹 이름
		const selectedDepartNo = $(this).text();
		console.log("선택한 번호(selectedDepartNo) : ", selectedDepartNo);

		let data = {
			"departNo": departNo,
			"currentPage": nvl(currentPage, "1"),
			"keyword": nvl(keyword, "")
		}
		console.log("통신에 보낼 데이터(data) : ", data);

		// 그룹별 게시글 조회
		$.ajax({
			url: "/companypage/empList",
			type: "post",
			contentType: "application/json;charset=utf-8",
			dataType: "json",
			data: JSON.stringify(data),
			success: function (articlePage) {
				console.log("그룹 요청 결과(articlePage) : ", articlePage);
				// console.log("그룹 요청 결과 콘텐츠(articlePage.content) : ", articlePage.content);
				// 테이블 업데이트
				updateTable(articlePage);

				// 드롭다운 버튼 텍스트 변경
				$('#groupDropdown').text(selectedDepartNo);
			},
			error: function () {
				Swal.fire('오류', '데이터를 가져오는 중 문제가 발생했습니다.', 'error');
			}
		});
	});

// 시연용 값 채워질 버튼
$("#previewBtn").on("click", function(){
	$("#memName").val("김민준");
	$("#memId").val("minjun");
	$("#memPw").val("java");
	$("#memTel").val("010-9876-5432");
	$("#memEmail").val("dditdockertest@gmail.com");
	$("#posNo").val("1");
	$("#departNo").val("2");
	$("#memGender").val("1");
});
</script>
<%@ include file="../include/footer.jsp" %>