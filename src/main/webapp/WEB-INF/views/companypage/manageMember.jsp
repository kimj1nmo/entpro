<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>

    .hidden-col { display: none; }
</style>

<section class="content" style="margin-left: 250px; padding: 15px;">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">전체 회원 목록</h3>
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
                        <table class="table table-hover text-nowrap">
                            <thead>
                                <tr>
                                    <th>순번</th>
                                    <th>회원ID</th>
                                    <th>회원명</th>
                                    <th>가입날짜</th>
                                    <th>전화번호</th>
                                    <th>이메일</th>
                                    <th>생일</th>
                                    <th>정지 여부</th>
                                    
                                </tr>
                            </thead>
                            <tbody id="tby">
                                <!-- 데이터가 비동적으로 추가됩니다. -->
                            </tbody>
                        </table>
                    </div>

                    <!-- 페이징 영역 -->
                    <div class="card-footer" id="divPagingArea"></div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 등록 버튼 -->
<!-- <div class="container"> -->
<!--     <a href="/event/form" class="btn btn-sm btn-primary" style="display:block;">새글등록</a> -->
<!-- </div> -->

<!-- 수정 모달 -->
<div class="modal" id="editModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">회원 수정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
    <form id="editForm">
        <div class="form-group">
            <label for="memId">회원ID</label>
            <!-- memId 입력 필드에 readonly 속성 추가 -->
            <input type="text" class="form-control" id="memId" name="memId" readonly>
        </div>
        <div class="form-group">
            <label for="memName">회원명</label>
            <input type="text" class="form-control" id="memName" name="memName">
        </div>
        <div class="form-group">
            <label for="memRegDate">가입일</label>
            <input type="text" class="form-control" id="memRegDate" name="memRegDate">
        </div>
        <div class="form-group">
            <label for="memTel">전화번호</label>
            <input type="text" class="form-control" id="memTel" name="memTel">
        </div>
        <div class="form-group">
            <label for="memEmail">이메일</label>
            <input type="email" class="form-control" id="memEmail" name="memEmail">
        </div>
        <div class="form-group">
            <label for="memBir">생일</label>
            <input type="text" class="form-control" id="memBir" name="memBir">
        </div>
    </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
    <button type="button" class="btn btn-primary" id="saveBtn">저장</button>
</div>

        </div>
    </div>
</div>

<script type="text/javascript">
// NVL 함수
function nvl(expr1, expr2) {
    if (expr1 === undefined || expr1 == null || expr1 == "") {
        expr1 = expr2;
    }
    return expr1;
}  

function getList(currentPage, keyword) {
    let data = {
        "currentPage": nvl(currentPage, "1"),
        "keyword": nvl(keyword, "")
    };

    console.log("Request data:", data);

    // AJAX 요청
    $.ajax({
        url: "/companypage/manageMember/list",  // 서버의 AJAX 처리 URL
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(data),
        type: "POST",
        dataType: "json",
        success: function(articlePage) {
            console.log("Response data:", articlePage);

            // 테이블 데이터 업데이트
            let str = "";
            $.each(articlePage.content, function(idx, member) {
                // MEM_ENABLE 값에 따라 탈퇴 여부 표시
                let memEnableText = (member.memEnable === 'y') ? 'X' : 'O';  // 'y'이면 탈퇴하지 않은 회원, 'n'이면 탈퇴한 회원
                str += `<tr class="trDetail">
                    <td>\${member.rnum}</td>
                    <td>\${member.memId}</td>
                    <td>\${member.memName}</td>
                    <td>\${member.memRegDate}</td>
                    <td>\${member.memTel}</td>
                    <td>\${member.memEmail}</td>
                    <td>\${member.memBir}</td>
                    <td>\${memEnableText}</td>  <!-- 탈퇴 여부 표시 -->
                    <td><button class="btn btn-danger delete-btn" data-id="\${member.memId}">정지 처리</button></td>
                </tr>`;
            });
            $("#tby").html(str);

            // 페이징 영역 업데이트
            $("#divPagingArea").html(articlePage.pagingArea);
        },
        error: function(error) {
            console.error("AJAX error:", error);
        }
    });
}


$(function() {
    getList("1", "");

    // 검색 버튼 클릭 이벤트
    $("#btnSearch").on("click", function() {
        let keyword = $("#krd").val();
        getList("1", keyword); // 첫 페이지로 이동
    });

    // 엔터 키 이벤트 처리
    $("#krd").on("keydown", function(e) {
        if (e.key === "Enter") {
            e.preventDefault(); // 엔터키로 인한 페이지 새로고침 방지
            let keyword = $(this).val();
            getList("1", keyword); // 첫 페이지로 이동
        }
    });

    // 페이지 클릭
    $(document).on("click", ".clsPagingArea", function() {
        let currentPage = $(this).data("currentPage");
        let keyword = $(this).data("keyword");
        getList(currentPage, keyword);
    });

 // 수정 버튼 클릭 이벤트
    // 수정 버튼 클릭 이벤트
$(document).on("click", ".edit-btn", function() {
    const memId = $(this).data("id");
    const memRow = $(this).closest("tr"); // 클릭한 수정 버튼의 행을 찾아 해당 데이터 가져오기

    const memIdFromTable = memRow.find("td:nth-child(2)").text(); // memId가 2번째 열에 있으므로 수정
    const memName = memRow.find("td:nth-child(3)").text();
    const memRegDate = memRow.find("td:nth-child(4)").text();
    const memTel = memRow.find("td:nth-child(5)").text();
    const memEmail = memRow.find("td:nth-child(6)").text();
    const memBir = memRow.find("td:nth-child(7)").text();

    // 해당 데이터를 수정 폼에 미리 채워넣기
    $("#memId").val(memIdFromTable); // memId는 수정할 수 없도록 readonly로 표시
    $("#memName").val(memName);
    $("#memRegDate").val(memRegDate);
    $("#memTel").val(memTel);
    $("#memEmail").val(memEmail);
    $("#memBir").val(memBir);

    // 수정 모달 표시
    $("#editModal").modal("show");
});




//저장 버튼 클릭 이벤트
$("#saveBtn").on("click", function() {
    const data = {
        memId: $("#memId").val(),
        memName: $("#memName").val(),
        memRegDate: $("#memRegDate").val(), // 수정된 부분
        memTel: $("#memTel").val(),
        memEmail: $("#memEmail").val(),
        memBir: $("#memBir").val()
    };

    // 서버에 수정 요청
    $.ajax({
        url: "/companypage/manageMember/update",
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify(data),
        success: function() {
            alert("회원 정보 수정이 완료되었습니다.");
            getList("1", $("#krd").val()); // 수정 후 목록 갱신
            $("#editModal").modal("hide"); // 모달 닫기
        },
        error: function() {
            alert("수정 실패");
        }
    });
});


 // 탈퇴 버튼 클릭 이벤트
    $(document).on("click", ".delete-btn", function() {
        const memId = $(this).data("id");

        if (confirm("정말로 정지처리 시키겠습니까?")) {
            $.ajax({
                url: "/companypage/manageMember/delete", // 탈퇴 처리 URL
                method: "POST",
                contentType: "application/json",
                data: JSON.stringify({ memId: memId }), // memId만 전달
                success: function(response) {
                    alert(response); // 서버에서 받은 성공 메시지 출력
                    getList("1", $("#krd").val()); // 삭제 후 목록 갱신
                },
                error: function() {
                    alert("이미 정지된 회원입니다");
                }
            });
        }
    });
});
</script>

<%@ include file="../include/footer.jsp" %>
