<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- ///// header 시작 ///// -->
<jsp:include page="../include/header_user2.jsp"></jsp:include>
<!-- ///// header 끝 ///// -->

<html>
<head>
    <title>굿즈 메인</title>
</head>
<body>
    <br>
    <h1>전체 굿즈 목록</h1>

    <c:if test="${not empty goodsList}">
        <!-- 굿즈 목록 테이블 -->
        <table border="1">
            <thead>
                <tr>
                    <th>상품 번호</th>
                    <th>상품명</th>
                    <th>상품 설명</th>
                    <th>가격</th>
                    <th>상세 보기</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="goods" items="${goodsList}">
                    <tr>
                        <td>${goods.gdsNo}</td>
                        <td>${goods.gdsNm}</td>
                        <td>${goods.gdsDc}</td>
                        <td><fmt:formatNumber value="${goods.gdsPrice}" type="number" /></td>
                        <td>
                            <a href="/shop/detail?gdsNo=${goods.gdsNo}">상세 보기</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty goodsList}">
        <p>현재 표시할 상품이 없습니다.</p>
    </c:if>

    <hr/>
</body>
</html>

<%@ include file="../include/footer.jsp" %>
