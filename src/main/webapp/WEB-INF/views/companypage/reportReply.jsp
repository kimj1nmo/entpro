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
.pageTitle{
font-weight: bold;
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

a {
    color: black;
    text-decoration: none; /* 밑줄 없애기 (선택사항) */
}

a:hover {
    color: black; /* 마우스 올려도 색 유지 */
}
</style>

<!-- 모든 페이지에 이거 추가해야함 -->
<div class="content-wrapper" style="background-color: white;">
<%-- <c:out value="${reportedPosts}" /> --%>

	<!--     Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/companypage/main">companypage</a></li>
						<li class="breadcrumb-item active"><a href="javascript:location.reload()">신고된 게시글 관리</a></li>
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
	<h2 class="pageTitle">신고된 게시글 관리</h2>
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
				<div><button id="btnUpdateReport" class="btn btn-danger" style="float: right; margin-left:5px;">비공개</button></div>
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
                  <!-- 게시글 리스트 -->
				<table class="table" id="postTable">
				    <thead>
				        <tr>
				            <th><input type="checkbox" id="checkAll"> 전체 선택</th>
				            <th>커뮤니티명</th>
			                <th>게시글 내용</th>
			                <th>글쓴이</th>
			                <th>신고 사유</th>
			                <th>신고자</th>
			                <th>신고일</th>
			                <th>처리 여부</th>
<!-- 			                <th>처리일</th> -->
				        </tr>
				    </thead>
				    <tbody id="postTableBody">
				        <c:forEach var="report" items="${reportedPosts}">
				            <tr>
				                <td><input type="checkbox" class="reportCheckbox" value="${report.commNo}"></td>
			                    <td>${report.communityName}</td>
			                    <td>
			                    <c:choose>
						            <c:when test="${fn:length(report.postContent) > 25}">
						                ${fn:substring(report.postContent, 0, 25)}...
						            </c:when>
						            <c:otherwise>
						                ${report.postContent}
						            </c:otherwise>
				      			  </c:choose>
			                    </td>
			                    <td>${report.postAuthorNick} (${report.postAuthor})</td>
			                    <td>${report.commReportCn}</td>
			                    <td>${report.reporterNick} (${report.memId})</td>
			                    <td><fmt:formatDate value="${report.commReportDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			                    <td>
			                        <c:choose>
    <c:when test="${report.commReportYn == 1}">
        <span style="color: green; font-weight: bold;">처리 완료</span>
    </c:when>
    <c:otherwise>
        <span style="font-weight: bold; display: block; text-align: center;">미처리</span>
    </c:otherwise>
</c:choose>


			                    </td>
<%-- 			                    <td>${report.commReportAcDt}</td> --%>
				            </tr>
				        </c:forEach>
				    </tbody>
				</table>
                  </div>
	
						<!-- 페이징 영역 -->
						<div class="card-footer2 d-flex justify-content-between align-items-center">
							<div id="divPagingArea" style="background-color: white;"></div>
<!-- 							<a href="#" class="btn btn-primary register-btn" style="margin-right: 15px;">등록</a> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<!-- ///// content 끝 ///// -->

<!-- 

<script>
// 전체 선택/해제
$('#checkAll').click(function() {
    $('.reportCheckbox').prop('checked', this.checked);
});

// 삭제 버튼 클릭 이벤트
$('#btnUpdateReport').click(function() {
    const selectedIds = [];
    $('.reportCheckbox:checked').each(function() {
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
 -->

<script>
document.addEventListener("DOMContentLoaded", function () {
    const tabs = document.querySelectorAll(".tabnav a");
    const tabContents = document.querySelectorAll(".tabcontent");

    // Attach click event to each tab
    tabs.forEach(tab => {
        tab.addEventListener("click", function (e) {
            e.preventDefault();

            // Deactivate all tabs and contents
            tabs.forEach(t => t.classList.remove("active"));
            tabContents.forEach(tc => tc.classList.remove("active"));

            // Activate the clicked tab and its content
            this.classList.add("active");
            const targetContent = document.querySelector(this.getAttribute("href"));
            targetContent.classList.add("active");
        });
    });

    // Activate the first tab and its content by default
    if (tabs.length > 0) {
        tabs[0].classList.add("active");
        tabContents[0].classList.add("active");
    }
});

//그룹 목록 불러오기 (예: /api/groups 엔드포인트에서 가져옴)
$(document).ready(function () {
    let currentGroupNo = 0; // 현재 선택된 그룹 번호 (기본값: 전체 보기)

    // 테이블 본문에 이벤트 리스너 추가
    document.querySelector("#postTableBody").addEventListener("click", function (e) {
        // 클릭된 요소가 filtergroup 클래스인지 확인
        if (e.target.classList.contains("filtergroup")) {
            e.preventDefault();

            // 그룹 번호 가져오기
            const groupNo = e.target.dataset.groupNo;

            // AJAX 요청: 그룹별 게시글 조회
            $.ajax({
                url: '/companypage/groupmem',
                type: 'GET',
                data: { groupNo: groupNo },
                success: function (response) {
                    // 테이블 업데이트
                    updateTable(response);
                },
                error: function () {
                    Swal.fire('오류', '데이터를 가져오는 중 문제가 발생했습니다.', 'error');
                }
            });
        }
    });
    // 드롭다운 선택 이벤트
    $('.dropdown-item').click(function (e) {
        e.preventDefault(); // 기본 동작 방지
        currentGroupNo = $(this).data('group-no'); // 선택한 그룹 번호
        const selectedGroupName = $(this).text(); // 선택한 그룹 이름

        // AJAX 요청: 그룹별 게시글 조회
        $.ajax({
            url: '/companypage/groupreport',
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
    
    function formatDate(dateString) {
        const date = new Date(dateString);
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1 필요
        const day = String(date.getDate()).padStart(2, '0');
        return `\${year}. \${month}. \${day}`;
    }
    
    // 테이블 업데이트 함수
    function updateTable(data) {
        const tbody = $('#signmembershipTableBody');
        tbody.empty(); // 기존 데이터 제거

        if (data.length === 0) {
            tbody.append('<tr><td colspan="5">게시글이 없습니다.</td></tr>');
            return;
        }

        data.forEach(membership  => {
        	 const formattedAmount = membership.memshipAmount.toLocaleString(); // 천 단위 콤마
             const startDate = new Date(membership.memshipStartDate);
             const endDate = new Date(membership.memshipEndDate);
             const formattedStartDate = formatDate(membership.memshipStartDate);
             const formattedEndDate = formatDate(membership.memshipEndDate);

            const row = `
                <tr>
                    <td><input type="checkbox" class="reportCheckbox" value="${communityVO.groupName}"></td>
                    <td><a href="#" class="filtergroup" data-group-no="\${membership.groupNo}">
                    \${membership.groupName}
                    </a></td>
                    <td>\${membership.memshipNm}
					</td>
					 <td>\${formattedAmount}</td>
                    <td>\${membership.memName}(\${membership.memId})</td>
                    <td>\${formattedStartDate} - \${formattedEndDate}</td>
						<td>\${membership.memshipYn}</td>
                </tr>
            `;
            tbody.append(row);
        });
    }
    // '그룹 이름' 클릭 시 필터링
    document.querySelectorAll(".filtergroup").forEach(item => {
        item.addEventListener("click", function (e) {
            e.preventDefault();

            // 그룹 번호 가져오기
            const groupNo = this.dataset.groupNo;

            // AJAX 요청: 그룹별 게시글 조회
            $.ajax({
                url: '/companypage/groupmem', // 서버에서 필터링된 데이터를 가져오는 엔드포인트
                type: 'GET',
                data: { groupNo: groupNo },
                success: function (response) {
                    // tab02를 활성화
                    document.querySelectorAll(".tabnav a").forEach(tab => tab.classList.remove("active"));
                    document.querySelectorAll(".tabcontent").forEach(content => content.classList.remove("active"));
                    document.querySelector("a[href='#tab02']").classList.add("active");
                    document.querySelector("#tab02").classList.add("active");

                    // 테이블 업데이트
                    updateTable(response);
                },
                error: function () {
                    Swal.fire('오류', '데이터를 가져오는 중 문제가 발생했습니다.', 'error');
                }
            });
        });
    });
    // '그룹 이름' 헤더 클릭 이벤트
    document.getElementById("filterAllGroups").addEventListener("click", function () {
        // AJAX 요청: 전체 그룹 데이터 가져오기
        $.ajax({
            url: '/companypage/groupmem', // 서버 엔드포인트
            type: 'GET',
            data: { groupNo: 0 }, // 전체 그룹을 요청하기 위해 groupNo=0 전달
            success: function (response) {
                // 테이블 업데이트
                updateTable(response);
            },
            error: function () {
                Swal.fire('오류', '데이터를 가져오는 중 문제가 발생했습니다.', 'error');
            }
        });
    });
		});


//"비공개" 버튼 클릭 이벤트
$('#btnUpdateReport').click(function() {
    const selectedIds = [];
    $('.reportCheckbox:checked').each(function() {
        selectedIds.push(parseInt($(this).val(), 10)); // 숫자로 변환
    });

    if (selectedIds.length === 0) {
        Swal.fire('선택된 항목이 없습니다.', '', 'warning');
        return;
    }

    fetch("/companypage/accessReport", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            commNos: selectedIds
        })
    })
    .then(response => response.json())
    .then(data => {
        console.log("🔹 서버 응답:", data);
        if (data > 0) {
            Swal.fire("선택한 게시글이 비공개 처리되었습니다.", "", "success").then(() => {
                location.reload();
            });
        } else {
            Swal.fire("비공개 처리 실패!", "SQL 실행 오류 발생!", "error");
        }
    })
    .catch(error => {
        console.error("Error:", error);
        Swal.fire("비공개 처리 실패!", "서버와의 통신 오류!", "error");
    });
});


</script>

<%@ include file="../include/footer.jsp"%>
