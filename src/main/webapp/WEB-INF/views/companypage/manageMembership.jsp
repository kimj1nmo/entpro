<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>

<style>
/* Tab container */
.result_menu {
}

.tabnav {
	display: flex;
	list-style-type: none;
	padding: 0;
	border-bottom: 2px solid #ddd;
}

.tabnav li {
	margin: 0;
	padding: 0;
}

.tabnav li a {
	display: block;
	padding: 10px 15px;
	text-decoration: none;
	color: #333;
	border: 1px solid transparent;
	border-radius: 5px 5px 0 0;
	background-color: #f9f9f9;
	transition: all 0.3s ease;
}

.tabnav li a:hover, .tabnav li a.active {
	background-color: #fff;
	border-color: #ddd;
	border-bottom-color: transparent;
	color: #007bff;
}

/* Tab content */
.tabcontent {
	display: none;
	padding: 0 15px 15px 15px;
	border: 1px solid #ddd;
	border-top: none;
}

.tabcontent.active {
	display: block;
}

/* 드롭 다운 보이게 */
.table-responsive{
	  overflow-x: visible !important;
}

a.editMembership, a.filtergroup {
    color: black;
    text-decoration: none;
}

a.editMembership:hover, a.filtergroup:hover {
/*     color: #007bff; */
/* background-color:pink; */
/*     text-decoration: underline; */
}

.hidden-col {
        display: none;
    }

    .card-header {
    display: flex; /* 한 줄로 정렬 */
/*     justify-content: space-between; /* 좌우 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    padding: 0 0 5px 0;
    gap: 5px;
}
.card-tools {
    margin-left: auto; /* 검색창을 오른쪽 끝으로 밀어냄 */
     display: flex;
    align-items: center; /* 내부 요소 세로 중앙 정렬 */
}
+


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
						<li class="breadcrumb-item active"><a href="javascript:location.reload()">멤버십 관리</a></li>
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
		<h2 class="pageTitle">멤버십 관리</h2>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<!-- 카드 헤더 --><!--  결과 메뉴 시작 -->
			<div class="result_menu" role="tablist" data-visible="true">
				<ul class="tabnav">
					<li><a href="#tab01" class="active">멤버십 조회</a></li>
					<li><a href="#tab02">가입자 조회</a></li>
				</ul>
			</div>
			<!--  결과 메뉴 끝 -->
			<div class="tabcontent active" id="tab01">

											<!-- 드롭다운 메뉴 -->
											<div class="card-header d-flex justify-content-between align-items-center">
							<!-- 드롭다운 메뉴 -->
							<a data-toggle="modal" data-target="#modalAdd"
						class="btn btn-primary">새 멤버십</a>
							<button id="deleteSelected" class="btn btn-danger"
												style="float: right;">삭제</button>

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
											<!-- 게시글 리스트 -->
											<table class="table" id="postTable">
												<thead>
													<tr>
														<th><input type="checkbox" id="checkAll"> 전체
															선택</th>
<!-- 														<th>멤버십 번호</th> -->
														<th>그룹 이름</th>
														<th>멤버십 이름</th>
														<th>멤버십 가격</th>
													</tr>
												</thead>
												<tbody id="membershipTableBody">
													<c:forEach var="membership" items="${membershipList}">
														<tr>
															<td><input type="checkbox" class="deleteCheckbox"
																value="${communityVO.commNo}"></td>
<%-- 															<td>${membership.memshipNo}</td> --%>
															<td>
															 <a href="#" 
										                       class="filtergroup" 
										                       data-memship-no="${membership.memshipNo}" 
										                       data-group-no="${membership.groupNo}" 
										                       data-memship-nm="${membership.memshipNm}" 
										                       data-memship-amount="${membership.memshipAmount}" title="가입자 조회">
										                        ${membership.groupName}
										                    </a>
															</td>
															<td>
															<a href="#" 
										                       class="editMembership" 
										                       data-memship-no="${membership.memshipNo}" 
										                       data-group-no="${membership.groupNo}" 
										                       data-memship-nm="${membership.memshipNm}" 
										                       data-memship-amount="${membership.memshipAmount}" title="수정">
															${membership.memshipNm}
															</a>
															</td>
															<td><fmt:formatNumber
																	value="${membership.memshipAmount}" type="number"
																	groupingUsed="true" /></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
							</div>
						<!-- /.card-header -->
				<!-- 
				<div class="col-12" style="justify-content: right; display: flex;">
					<a data-toggle="modal" data-target="#modalAdd"
						class="btn btn-primary">등록</a>
				</div>
				 -->
			
			<div class="tabcontent" id="tab02">
				<div class="card-header d-flex justify-content-between align-items-center">
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
											<!-- 게시글 리스트 -->
											<table class="table" id="postTable">
												<thead>
													<tr>
														<th><input type="checkbox" id="checkAll"> 전체
															선택</th>
														<th id="filterAllGroups" style="cursor: pointer;">그룹 이름</th>
														<th>멤버십명</th>
														<th>가격</th>
														<th>회원</th>
														<th>기간</th>
														<th>상태</th>
													</tr>
												</thead>
												<tbody id="signmembershipTableBody">
													<c:forEach var="membership" items="${signmembershipList}">
														<tr>
															<td><input type="checkbox" class="deleteCheckbox"
																value="${communityVO.groupName}"></td>
															<td>
															<a href="#" class="filtergroup" data-group-no="${membership.groupNo}">
										                        ${membership.groupName}
										                    </a></td>
															<td>${membership.memshipNm}</td>
															<td><fmt:formatNumber
																	value="${membership.memshipAmount}" type="number"
																	groupingUsed="true" /></td>
															<td>${membership.memName}(${membership.memId})</td>
															<td><fmt:formatDate
																	value="${membership.memshipStartDate}"
																	pattern="yyyy. MM. dd" /> - <fmt:formatDate
																	value="${membership.memshipEndDate}"
																	pattern="yyyy. MM. dd" /></td>
															<td>
															<c:choose>
    <c:when test="${membership.memshipYn == 1}">
        <span style="color: green; font-weight: bold;">활성</span>
    </c:when>
    <c:otherwise>
        <span style="font-weight: bold;">비활성</span>
    </c:otherwise>
</c:choose>
															
</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
						</div>
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0" id="divDetailArea">

						</div></div>
						<!-- /.card-body -->
						<!-- card-footer 시작 -->
						<!-- 				<div class="card-footer" id="divPagingArea"></div> -->
						<!-- card-footer 끝 -->
					</div>
					</div>
					</div>
	</section>
</div>

	<!-- 모달 -->
	<div class="modal fade" id="modalAdd" tabindex="-1" role="dialog"
		aria-labelledby="modalAddLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- 모달 헤더 -->
				<div class="modal-header">
					<h5 class="modal-title" id="modalAddLabel">멤버십 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<!-- 모달 바디 -->
				<div class="modal-body">
					<form id="membershipForm">
						<!-- 그룹 선택 -->
						<div class="form-group">
							<label for="groupNo">그룹 선택</label> <select class="form-control"
								id="groupNo" name="groupNo" required>
								<!-- 그룹 목록은 JavaScript로 동적 추가 -->
							</select>
						</div>

						<!-- 멤버십 이름 -->
						<div class="form-group">
							<label for="memshipNm">멤버십 이름</label> <input type="text"
								class="form-control" id="memshipNm" name="memshipNm"
								placeholder="멤버십 이름 입력" required>
						</div>

						<!-- 멤버십 가격 -->
						<div class="form-group">
							<label for="memshipAmount">가격</label> <input type="number"
								class="form-control" id="memshipAmount" name="memshipAmount"
								placeholder="멤버십 가격 입력" required>
						</div>
					</form>
				</div>

				<!-- 모달 푸터 -->
				<div class="modal-footer">
				<button type="button" id="previewBtn" style="border:none; color:grey; background-color:white;">시연용</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="submitMembership">등록</button>
				</div>
			</div>
		</div>
	</div>

<!-- 수정 모달 -->
<div class="modal fade" id="editMembershipModal" tabindex="-1" role="dialog" aria-labelledby="editMembershipModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h5 class="modal-title" id="editMembershipModalLabel">멤버십 수정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- 모달 바디 -->
            <div class="modal-body">
                <form id="editMembershipForm">
                    <input type="hidden" id="editMemshipNo">
                    <input type="hidden" id="editGroupNo">
                    
                    <div class="form-group">
                        <label for="editMemshipNm">멤버십명</label>
                        <input type="text" class="form-control" id="editMemshipNm" required>
                    </div>
                    <div class="form-group">
                        <label for="editMemshipAmount">가격</label>
                        <input type="number" class="form-control" id="editMemshipAmount" required>
                    </div>
                </form>
            </div>
            <!-- 모달 푸터 -->
            <div class="modal-footer">
            <button type="button" id="previewBtn" style="border:none; color:grey; background-color:white;">시연용</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" id="saveMembership" class="btn btn-primary">저장</button>
            </div>
        </div>
    </div>
</div>

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
    document.querySelector("#signmembershipTableBody").addEventListener("click", function (e) {
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
            url: '/companypage/groupmem',
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
                    <td><input type="checkbox" class="deleteCheckbox" value="${communityVO.groupName}"></td>
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
//그룹 목록 불러오기 (예: /api/groups 엔드포인트에서 가져옴)
document.addEventListener("DOMContentLoaded", function () {
    fetch('/companypage/groups')
        .then(response => response.json())
        .then(data => {
            const groupSelect = document.getElementById("groupNo");
            data.forEach(group => {
                const option = document.createElement("option");
                option.value = group.groupNo; // 그룹 번호
                option.textContent = group.groupName; // 그룹 이름
                groupSelect.appendChild(option);
            });
        })
        .catch(error => console.error('Error fetching group list:', error));
});    
document.getElementById("previewBtn").addEventListener("click", () => {
	document.getElementById("groupNo").value = "11";
	document.getElementById("memshipNm").value = "츄 Digital Membership";
	document.getElementById("memshipAmount").value = "2000";
	});
// 멤버십 등록 요청
document.getElementById("submitMembership").addEventListener("click", function () {
    const membershipData = {
        groupNo: document.getElementById("groupNo").value,
        memshipNm: document.getElementById("memshipNm").value,
        memshipAmount: document.getElementById("memshipAmount").value
    };
    fetch('/companypage/memship', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(membershipData)
    })
        .then(response => {
            if (response.ok) {
                alert("멤버십 등록 성공!");
                window.location.reload(); // 페이지 새로고침
            } else {
                alert("멤버십 등록 실패!");
            }
        })
        .catch(error => {
            console.error('Error registering membership:', error);
            alert("멤버십 등록 중 오류 발생!");
        });
});

document.addEventListener("DOMContentLoaded", function () {
    // '그룹 이름' 클릭 시 모달 표시
    document.querySelectorAll(".editMembership").forEach(item => {
        item.addEventListener("click", function (e) {
            e.preventDefault();

            // 데이터 속성 읽기
            const memshipNo = this.dataset.memshipNo;
            const groupNo = this.dataset.groupNo;
            const memshipNm = this.dataset.memshipNm;
            const memshipAmount = this.dataset.memshipAmount;

            // 모달에 데이터 채우기
            document.getElementById("editMemshipNo").value = memshipNo;
            document.getElementById("editGroupNo").value = groupNo;
            document.getElementById("editMemshipNm").value = memshipNm;
            document.getElementById("editMemshipAmount").value = memshipAmount;

            // 모달 열기
            $("#editMembershipModal").modal("show");
        });
    });

    // '저장' 버튼 클릭 시 수정 요청
    document.getElementById("saveMembership").addEventListener("click", function () {
        const memshipNo = document.getElementById("editMemshipNo").value;
        const groupNo = document.getElementById("editGroupNo").value;
        const memshipNm = document.getElementById("editMemshipNm").value;
        const memshipAmount = document.getElementById("editMemshipAmount").value;

        // 수정 요청
        fetch("/companypage/updateMembership", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded",
            },
            body: new URLSearchParams({
                memshipNo,
                groupNo,
                memshipNm,
                memshipAmount
            })
        })
        .then(response => response.text())
        .then(result => {
            alert("수정 성공했습니다"); // 성공 메시지
                window.location.reload(); // 페이지 새로고침
        })
        .catch(error => console.error("Error:", error));
    });
});

</script>

	<%@ include file="../include/footer.jsp"%>