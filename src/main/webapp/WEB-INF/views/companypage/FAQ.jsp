<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>

<!-- 직접추가한 CSS -->
<link rel="stylesheet" href="/directlyCss/question.css">
<!-- 자리 잡으면 삭제 -->
<link rel="stylesheet" href="/directlyCss/groupNotice.css">

<!-- sweetAlert -->
<link rel="stylesheet" href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>

<!-- 모든 페이지에 이거 추가해야함 -->
<div class="content-wrapper" style="background-color: white;">
	<!--     Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item active">고객센터 관리</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>

	<section class="content">
		<h2 class="pageTitle" style="margin-left: 0.5vw;">고객센터 관리</h2>
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
									<c:forEach var="questionVO" items="${questionVOList}">
										<a class="dropdown-item" href="#" data-qstn-ctgry-no="${questionVO.qstnCtgryNo}">
											${questionVO.qstnCtgryNm}
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
										<th>카테고리</th>
										<th>제목</th>
										<th>답변여부</th>
										<th>작성 회원아이디</th>
										<th>일자</th>
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
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<!-- /// 아티스트 등록 모달 시작 /// -->
<div class="modal fade" id="modalAdd">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">아티스트 추가</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!--  /// 내용 시작 /// -->
				<form>
					<div class="card-body">
						<div class="form-group">
							<label for="artistName">활동명</label> <input type="text" class="form-control" id="artistName"
								placeholder="이름" />
						</div>
						<div class="form-group">
							<label for="memId">아이디</label> <input type="text" class="form-control" id="memId"
								placeholder="아이디" />
							<button id="memIdChk" type="button" class="btn btn-block btn-success btn-sm">아이디확인</button>

						</div>
						<div class="form-group">
							<label for="artistProfile">프로필</label> <input type="text" class="form-control" id="artistProfile"
								placeholder="프로필" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">생일</label> <input type="date" class="form-control"
								id="artistBirth" placeholder="생일" />
						</div>

						<div class="form-group">
							<!-- private Date memBir;
2024-11-27
-->
							<label for="uploadFiles">회원사진</label> <input type="file" class="form-control" id="uploadFiles"
								name="uploadFiles" value="" placeholder="회원사진" multiple />
						</div>
						<div id="divImage"></div>

					</div>
				</form>
				<!--  /// 내용 끝 /// -->
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="btnRegist" class="btn btn-primary" disabled>등록</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /// 아티스트 등록 모달 끝 /// -->
<!-- ///// content 끝 ///// -->

<!-- 모달 시작 -->
<div class="modal fade show" id="modal-lg" style="display: none; padding-right: 17px;" aria-modal="true"
	role="dialog">
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
								<option class="optionSel" data-qstn-ctgry-no="${questionVO.qstnCtgryNo}"
									value="${questionVO.qstnCtgryNo}">
									${questionVO.qstnCtgryNm}
								</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="qstnTtl">제목</label>
						<input type="text" id="qstnTtl" class="form-control" value="" required readonly />
					</div>
					<div class="form-group">
						<label for="qstnCn">내용</label>
						<textarea id="qstnCn" class="form-control" rows="8" required readonly></textarea>
					</div>
					<!-- 관리자 답변 -->
					<div id="title" class="form-group">
						<label for="ansTtl">제목</label>
						<input type="text" id="ansTtl" class="form-control" value="" required />
					</div>
					<div id="answer" class="form-group">
						<label for="ansCn">답변</label>
						<textarea id="ansCn" class="form-control" rows="8" required></textarea>
					</div>
				</div>
			</div>
			<!-- 등록 & 삭제 버튼 -->
			<div class="modal-footer justify-content-between">
				<button id="createEmp" type="button" class="btn btn-primary">등록</button>
				<div class="d-flex" style="gap: 10px;">
						<button type="button" id="previewBtn" class="btn btn-primary btn-user">시연용</button>
						<button id="deleteBtn" type="button" class="btn btn-danger ms-2">삭제</button>
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
	// 현재 선택된 고객센터 번호 (기본값: 환불)
	var qstnCtgryNo = "";
	// 현재 페이지
	var currentPage = 1;
	// 검색어
	var keyword = "";
	// 로그인한 회원 받아오기
	let loginMemId = "";
	$.ajax({
		url: "/api/userInfo",
		method: "GET",
		success: function (data) {
			console.log("로그인 정보: ", data)//memId 와 authName의 authList가들어잇음
			loginMemId = data.memId; // 서버에서 받은 사용자 정보를 전역 정보에 입력 가능 
		},
		error: function (xhr, status, error) {
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
	function allList() {
		let data = {
			"qstnCtgryNo": qstnCtgryNo,
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
				console.log("고객센터 리스트 요청 결과(articlePage) : ", articlePage);
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
			"qstnCtgryNo": currentCtgryNo,
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
		const tbody = $('#tby');
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
			str += `
							<tr>
								<td>\${questionVO.rnum}</td>
								<td>\${questionVO.qstnCtgryNm}</td>
								<td data-toggle="modal" data-target="#modal-lg" class="hoverText"
								data-qstn-ttl="\${questionVO.qstnTtl}" data-qstn-ctgry-no="\${questionVO.qstnCtgryNo}" data-qstn-cn="\${questionVO.qstnCn}" data-qstn-no="\${questionVO.qstnNo}">\${questionVO.qstnTtl}</td>
								<td>\${questionVO.qstnYn == '1' ? '<i class="fas fa-check-circle text-success">답변완료</i>' : '<i class="fas fa-clock text-warning">미답변</i>'}</td>
								<td>\${questionVO.memId}</td>
								<td>\${questionVO.qstnDate}</td>
							</tr>
							`;
		})
		tbody.html('<tr><td colspan="5">게시글이 없습니다.</td></tr>');
		// 로그인 정보 같으면 목록 나오기
		if (str) tbody.html(str);
		$("#divPagingArea").html(articlePage.pagingArea);

		// 상세 모달창 띄우기
		$(".hoverText").on("click", function () {
			// 제목
			$("#qstnTtl").val($(this).text());
			// 내용
			$("#qstnCn").val($(this).data("qstnCn"));
			$("#qstnCtgryNo").val($(this).data("qstn-ctgry-no"));

			$("#ansTtl").val("");
			$("#ansCn").val("");
			$("#ansDate").val("");

			// 관리자 답변 받아오기
			let qstnNo = $(this).data("qstn-no");
			let answerData = {
				"qstnNo": qstnNo
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
			// console.log("엔터키");
		}
	});


	$(function () {
		// 담당자 답변 달기
		$("#createEmp").on("click", function () {
			let ansTtl = $("#ansTtl").val();
			let ansCn = $("#ansCn").val();
			let qstnNo = $(".hoverText").data("qstn-no");
			let ansMemId = loginMemId;
			let data = {
				"ansTtl": ansTtl
				, "ansCn": ansCn
				, "qstnNo": qstnNo
				, "ansMemId": ansMemId
				, "qstnYn": 1
			}
			console.log("담당자 답변 보낼 데이터(data) : ", data);

			Swal.fire({
				title: '답변을 추가하시겠습니까?',
				icon: 'question',
				showCancelButton: true,
				confirmButtonText: '추가',
				cancelButtonText: '취소'
			}).then((result) => {
				if (result.isConfirmed) {
					$.ajax({
						url: "/notice/managerAnswer",
						type: "post",
						contentType: "application/json;charset=utf-8",
						dataType: "json",
						data: JSON.stringify(data),
						success: function (resp) {
							Swal.fire('추가 완료', '', 'success').then(() => {
								location.href = location.href
							});
						}
					});
				}
			});
		});

		// 삭제(비활성화) 구현
		$("#deleteBtn").on("click", function () {
			let qstnNo = $(".hoverText").data("qstn-no");
			// console.log("체체킁 : ", qstnNo);
			let deleteData = {
				"qstnNo": qstnNo
				, "qstnYn": 2
			}
			console.log("삭제 보낼 데이터(deleteData) : ", deleteData);

			Swal.fire({
				title: '삭제하시겠습니까?',
				icon: 'warning',
				showCancelButton: true,
				confirmButtonText: '삭제',
				cancelButtonText: '취소'
			}).then((result) => {
				if (result.isConfirmed) {

					$.ajax({
						url: "/notice/deleteAnswer",
						type: "post",
						contentType: "application/json;charset=utf-8",
						dataType: "json",
						data: JSON.stringify(deleteData),
						success: function (resp) {
							Swal.fire('삭제 완료', '', 'success').then(() => {
								location.href = location.href
							});
						}
					});
				}
			});
		});
	});

// 시연용 값 채워질 버튼
$("#previewBtn").on("click", function(){
	$("#ansTtl").val("죄송합니다 고객님");
	$("#ansCn").val("해당 사유로는 환불을 진행할 수 없습니다. 이점 양해 바랍니다");
});
</script>
<%@ include file="../include/footer.jsp" %>