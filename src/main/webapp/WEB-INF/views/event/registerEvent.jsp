<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게시글 등록</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h2>게시글 등록</h2>
    <form id="eventForm" action="${pageContext.request.contextPath}/event/register" method="post" enctype="multipart/form-data">
        <label for="evtboardttl">제목:</label>
        <input type="text" id="evtboardttl" name="evtboardttl" required><br>

        <label for="evtboardcn">내용:</label>
        <textarea id="evtboardcn" name="evtboardcn" required></textarea><br>

        <label for="evtboardctgry">카테고리:</label>
        <select id="evtboardctgry" name="evtboardctgry">
            <option value="공지">공지</option>
            <option value="이벤트">이벤트</option>
            <option value="기타">기타</option>
        </select><br>

        <label for="files">첨부파일:</label>
        <input type="file" id="files" name="files" multiple><br>
        <div id="filePreview"></div><br>

        <button type="submit">등록</button>
    </form>

    <script>
        // 파일 미리보기
        $("#files").on("change", function () {
            $("#filePreview").empty();
            Array.from(this.files).forEach(file => {
                const reader = new FileReader();
                reader.onload = function (e) {
                    $("#filePreview").append(`<img src="${e.target.result}" alt="미리보기" style="max-width:100px; max-height:100px; margin: 5px;">`);
                };
                reader.readAsDataURL(file);
            });
        });
    </script>
</body>
</html>
