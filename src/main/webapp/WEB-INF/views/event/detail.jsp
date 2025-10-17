<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<%@ include file="../include/header_user.jsp"%>
<style>
/* 카드와 이미지 크기 조정 */
.container {
    width: 100%;  /* 컨테이너 너비를 80%로 설정 */
    margin-left: 0;  /* 왼쪽 여백을 0으로 설정 */
}

.card {
    margin: 0 auto;  /* 카드 중앙 정렬 */
    width: 100%;  /* 카드 너비를 100%로 설정 */
    max-width: 1000px;  /* 최대 너비를 800px로 설정 */
}

.card-header h3 {
    font-size: 20px;  /* 카드 제목 크기 줄이기 */
}

.card-body p {
    font-size: 14px;  /* 본문 텍스트 크기 줄이기 */
}

.card-footer {
    text-align: left;  /* 푸터를 왼쪽 정렬 */
}

.img-fluid {
    max-width: 100%;  /* 이미지 크기 조정 */
    height: auto;  /* 비율 유지 */
    max-height: 200px;  /* 이미지 최대 높이를 200px로 설정 */
}


</style>
<div class="container mt-4">
    <div class="card">
        <div class="card-header">
            <h3>${eventVO.evtBoardTtl}</h3>
        </div>
        <div class="card-body">
            <p> ${eventVO.evtBoardDate}</p>
            <hr>
            <p>${eventVO.evtBoardCn}</p>
        </div>
        <div class="form-group">
             <label for="saveLocate"></label>
             <!-- 반복 시작 
                 studVO.fileGroupVO.fileDetailVOList : List<FileDetailVO>
                 -->
                 <div class="row">
                 <c:forEach var="fileDetailVO" items="${eventVO.fileGroupVO.fileDetailVOList}" varStatus="stat">
                 	<div class="col-sm-3">
                 		<img class="img-fluid mb-3" src="${fileDetailVO.fileSaveLocate}" alt="Photo">
                 	</div>
                 </c:forEach>
                 </div>
                <!-- 반복 끝 -->
        <div class="card-footer">
        </div>
                <a href="${pageContext.request.contextPath}/list" class="btn btn-secondary">목록</a>
    </div>
</div>
</div>

