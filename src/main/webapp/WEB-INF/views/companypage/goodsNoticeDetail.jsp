<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp" %>

<script src="https://cdn.ckeditor.com/4.12.0/standard/ckeditor.js"></script>
<script type="text/javascript">
$(function(){
    // CKEditor 초기화
    CKEDITOR.replace('evtBoardCn');

    // 모든 .form-control 요소 읽기 전용 처리
    $(".form-control").attr("readonly", true);

    // 수정 버튼 클릭 시
    $("#edit").on("click", function() {
        $("#div1").hide(); // 일반 모드 숨기기
        $("#div2").show(); // 수정 모드 표시
        $("#div1Title").hide(); // 제목 일반모드 숨기기
        $("#div2Title").show(); // 제목 수정모드 표시
        $(".form-control").removeAttr("readonly"); // 입력 필드 활성화
        $("#evtBoardTtl").removeAttr("readonly"); // 제목 필드 활성화
        CKEDITOR.instances['evtBoardCn'].setReadOnly(false); // CKEditor 활성화
        $("#frm").attr("action", "${pageContext.request.contextPath}/updatePost");

        // 첨부파일 입력 필드 활성화
        $("#uploadFile").prop("disabled", false); // 업로드 파일 필드 활성화
        $("#uploadSection").show(); // 첨부파일 섹션 보이기
    });

    // 삭제 버튼 클릭 시
    $("#delete").on("click", function() {
        $("#frm").attr("action", "${pageContext.request.contextPath}/deletePost");
        if (confirm("삭제하시겠습니까?")) {
            $("#frm").submit();
        }
    });

    // 확인 버튼 클릭 시 CKEditor 데이터 동기화
    $("button[type='submit']").on("click", function() {
        CKEDITOR.instances['evtBoardCn'].updateElement();
    });
});
</script>

<div class="container mt-4">
    <div class="row">
        <!-- 본문 영역 (게시판 내용) -->
        <div class="col-md-9" style="margin-left: 75px;"> <!-- 왼쪽 메뉴의 너비만큼 간격을 띄움 -->
            <form id="frm" method="post" enctype="multipart/form-data">
                <input type="hidden" name="evtBoardNo" value="${eventVO.evtBoardNo}">
                <div class="card">
                    <div class="card-header">
                        <!-- 제목: 일반 모드와 수정 모드 모두 지원 -->
                        <div id="div1Title">
                            <h3>${eventVO.evtBoardTtl}</h3>
                        </div>
                        <div id="div2Title" style="display:none;">
                            <input type="text" id="evtBoardTtl" name="evtBoardTtl" class="form-control" value="${eventVO.evtBoardTtl}">
                        </div>
                    </div>
                    <div class="card-body">
                        <p>${eventVO.evtBoardDate}</p>
                        <hr>
                        <textarea id="evtBoardCn" name="evtBoardCn" class="form-control">${eventVO.evtBoardCn}</textarea>

                        <!-- 첨부파일 표시 -->
                        <div class="form-group">
                            <label for="saveLocate"></label>
                            <c:forEach var="fileDetailVO" items="${eventVO.fileGroupVO.fileDetailVOList}">
                                <div class="col-sm-3">
                                    <img class="img-fluid mb-3" src="${fileDetailVO.fileSaveLocate}" alt="첨부이미지">
                                </div>
                            </c:forEach>
                        </div>

                        <!-- 수정 모드에서만 첨부파일 업로드 필드 활성화 -->
                        <div id="uploadSection" style="display:none;">
                            <label for="uploadFile">첨부파일</label>
                            <input type="file" id="uploadFile" name="uploadFile" placeholder="" multiple>
                        </div>
                    </div>

                    <!-- 일반모드 -->
                    <div id="div1" class="card-footer">
                        <button type="button" id="edit" class="btn btn-primary">수정</button>
                        <button type="button" id="delete" class="btn btn-danger">삭제</button>
                        <a href="${pageContext.request.contextPath}/companypage/noticeManage" class="btn btn-secondary">목록</a>
                    </div>

                    <!-- 수정모드 -->
                    <div id="div2" class="card-footer" style="display:none;">
                        <button type="submit" class="btn btn-primary">확인</button>
                        <a href="${pageContext.request.contextPath}/companypage/adminDetail?evtBoardNo=${eventVO.evtBoardNo}" class="btn btn-secondary">취소</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>
