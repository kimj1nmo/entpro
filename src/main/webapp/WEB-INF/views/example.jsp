<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="./include/header.jsp" %>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- SweetAlert2 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

<!-- SweetAlert2 JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
	<!-- sweetAlert -->
	<link rel="stylesheet" href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
	<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
<style>
    .hidden-col {
        display: none;
    }

    .card-header {
    display: flex; /* 한 줄로 정렬 */
/*     justify-content: space-between; /* 좌우 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
}
.card-tools {
    margin-left: auto; /* 검색창을 오른쪽 끝으로 밀어냄 */
     display: flex;
    align-items: center; /* 내부 요소 세로 중앙 정렬 */
}


    .register-btn {
        margin-left: auto; /* 버튼을 오른쪽 끝으로 이동 */
        padding: 10px 15px; /* 버튼 크기 조정 */
        font-size: 14px; /* 버튼 글씨 크기 조정 */
    }

    .card-footer2 {
        display: flex;
        justify-content: flex-end; /* 모든 요소를 오른쪽으로 정렬 */
        align-items: center; /* 수직 중앙 정렬 */
        gap: 10px; /* 페이징 영역과 버튼 간격 조정 */
    }

a {
    color: black;
    text-decoration: none; /* 밑줄 없애기 (선택사항) */
}

a:hover {
    color: black; /* 마우스 올려도 색 유지 */
}

.pageTitle{
font-weight: bold;
}
</style>

<div class="content-wrapper" style="background-color: white;">
	<!--     Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/companypage/main">companypage</a></li>
						<li class="breadcrumb-item active">FAQ</li>
				 </ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- ///// content 시작 ///// -->

	<section class="content">
		<div class="container-fluid">
		<h2 class="pageTitle">그룹 커뮤니티 공지</h2>
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
								<form>
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
								</form>
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

<script type="text/javascript">

function nvl(expr1, expr2) {
	if (expr1 === undefined || expr1 == null || expr1 == "") {
		expr1 = expr2;
	}
	return expr1;
}

function getList(currentPage, keyword){
	let data = {
			"currentPage":nvl(currentPage,"1"),
			"keyword":nvl(keyword,"")
	};

	console.log("data : ", data);

	$.ajax({
		url:"/list",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		type:"post",
		dataType:"json",
		success:function(articlePage){
			console.log("articlePage : ", articlePage);
			let str = "";
			$.each(articlePage.content, function(idx, EventVO){
				str += `<tr class="trDetail">
					<td class="hidden-col">\${EventVO.evtBoardNo}</td>
					<td><a href="adminDetail?evtBoardNo=\${EventVO.evtBoardNo}">\${EventVO.evtBoardTtl}</a></td>
					<td class="hidden-col">\${EventVO.evtBoardCn}</td>
					<td class="hidden-col">\${EventVO.evtBoardCtgry}</td>
					<td>\${EventVO.evtBoardDate}</td>
					<td class="hidden-col">\${EventVO.fileGroupNo}</td>
				</tr>`;
			});

			$("#tby").html(str);
			$("#divPagingArea").html(articlePage.pagingArea);
		}
	});
}

$(function(){
	getList("1", "");

	$("#btnSearch").on("click",function(){
		let keyword = $("#krd").val();
		console.log("keyword : " + keyword);
		getList("1", keyword);
	});

	$(document).on("click", ".clsPagingArea", function(){
		let currentPage = $(this).data("currentPage");
		let keyword = $(this).data("keyword");
		console.log("페이지 클릭 처리 -> currentPage : ", currentPage);
		console.log("페이지 클릭 처리 -> keyword : ", keyword);
		getList(currentPage, keyword);
	});
});



</script>

<%@ include file="./include/footer.jsp" %>
