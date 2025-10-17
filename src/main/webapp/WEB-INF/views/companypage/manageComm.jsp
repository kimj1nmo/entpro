<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- css -->
<link href="/directlyCss/postManage.css" rel="stylesheet">
<style>

/* 드롭 다운 보이게 */
.table-responsive{
	  overflow-x: visible !important;
}

.hidden-col {
        display: none;
    }
    
    .card-header {
    display: flex; /* 한 줄로 정렬 */
/*     justify-content: space-between; /* 좌우 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    gap: 10px; /* 페이징 영역과 버튼 간격 조정 */
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

<!-- 모든 페이지에 이거 추가해야함 -->
<div class="content-wrapper" style="background-color:white;">
	<!--     Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/companypage/main">companypage</a></li>
						<li class="breadcrumb-item active"><a href="/companypage/main">게시글 관리</a></li>
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
<link rel="stylesheet"
	href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- ///// content 시작 ///// -->

<section class="content">
		<div class="container-fluid">
	<h2 class="pageTitle">게시글 관리</h2>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<!-- 카드 헤더 -->
						<div class="card-header">
	<!-- 						<h2>EVENT</h2> -->
							                	<!-- 드롭다운 메뉴 -->
					<div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle" type="button" id="groupDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        그룹 선택 <!-- 기본 텍스트 -->
    </button>
    <div class="dropdown-menu" aria-labelledby="groupDropdown">
        <!-- 전체 보기 -->
        <a class="dropdown-item" href="#" data-group-no="0">전체 보기</a>
        <!-- 그룹 목록 -->
        <c:forEach var="group" items="${groupsList}">
            <a class="dropdown-item" href="#" data-group-no="${group.groupNo}">
                ${group.groupName}
            </a>
        </c:forEach>
    </div>
</div>
    <button id="deleteSelected" class="btn btn-danger" style="float: right;">삭제</button>
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
				            <th>커뮤니티명</th>
				            <th>제목</th>
				            <th>글쓴이</th>
				            <th>작성일</th>
				        </tr>
				    </thead>
				    <tbody id="postTableBody">
				        <c:forEach var="communityVO" items="${communityVO}">
				            <tr>
				                <td><input type="checkbox" class="deleteCheckbox" value="${communityVO.commNo}"></td>
				                <td>${communityVO.groupName}</td>
				                <td>
							    <a
							       style="text-decoration: none; color: inherit;" 
							       title="${communityVO.commCn}"> 
							       <c:choose>
						            <c:when test="${fn:length(communityVO.commCn) > 30}">
						                ${fn:substring(communityVO.commCn, 0, 30)}...
						            </c:when>
						            <c:otherwise>
						                ${communityVO.commCn}
						            </c:otherwise>
				      			  </c:choose>
				      			  </a>
		                      </td>
				                <td>${communityVO.commRegNick} (${communityVO.memId})</td>
				                <td>${communityVO.commWriteDate}</td>
				            </tr>
				        </c:forEach>
				    </tbody>
				</table>
							<!-- 테이블 종료 -->
						</div>
	
						<!-- 페이징 영역 -->
						<div class="card-footer2 d-flex justify-content-between align-items-center">
<!-- 							<div id="divPagingArea" style="background-color: white;"></div> -->
<!-- 							<a href="#" class="btn btn-primary register-btn" style="margin-right: 15px;">등록</a> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

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

<!-- ///// content 끝 ///// -->

<script>
// 전체 선택/해제
$('#checkAll').click(function() {
    $('.deleteCheckbox').prop('checked', this.checked);
});

// 삭제 버튼 클릭 이벤트
$('#deleteSelected').click(function() {
    const selectedIds = [];
    $('.deleteCheckbox:checked').each(function() {
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
                success: function(response) {
                    Swal.fire('삭제 완료', '', 'success').then(() => {
                        location.reload(); // 페이지 새로고침
                    });
                },
                error: function() {
                    Swal.fire('삭제 실패', '다시 시도해주세요.', 'error');
                }
            });
        }
    });
});
</script>

<script>
$(document).ready(function () {
    let currentGroupNo = 0; // 현재 선택된 그룹 번호 (기본값: 전체 보기)

    // 드롭다운 선택 이벤트
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

    // 삭제 버튼 클릭 이벤트
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

    // 테이블 업데이트 함수
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
});

</script>

<%@ include file="../include/footer.jsp"%>
