<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%@ include file="../include/header.jsp" %> --%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
    <script src="https://cdn.ckeditor.com/4.25.0/standard/ckeditor.js"></script>
    <style>
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input, textarea, button {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <h1>게시글 작성</h1>
    <form action="${pageContext.request.contextPath}/insertPost" method="post" enctype="multipart/form-data">
        <!-- 제목 -->
        <div class="form-group">
            <label for="evtTitle">제목</label>
            <input type="text" id="evtTitle" name="evtBoardTtl" placeholder="제목을 입력하세요" required>
        </div>

        <!-- 내용 -->
        <div class="form-group">
            <label for="evtContent">내용</label>
            <textarea id="evtContent" name="evtBoardCn" rows="10" placeholder="내용을 입력하세요" required></textarea>
        </div>

        <!-- CKEditor 초기화 -->
        <script>
            CKEDITOR.replace('evtContent');
        </script>

        <!-- 첨부파일 -->
        <div class="form-group">
            <label for="uploadFile">첨부파일</label>
            <input type="file" id="uploadFile" name="uploadFile" placeholer="" multiple>
        </div>

        <!-- 제출 버튼 -->
        <div class="form-group">
            <button type="submit">게시글 등록</button>
        </div>
    </form>
</body>
</html>
