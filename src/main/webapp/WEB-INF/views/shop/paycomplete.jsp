<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- Header -->
<jsp:include page="../include/header_user2.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
    <title>결제 완료</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
        }

        h1, h2, p {
            text-align: center;
        }

        .btn {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fff;
            margin: auto;
            padding: 20px;
            width: 40%;
            text-align: center;
            border-radius: 10px;
        }

        .close-btn {
            background: red;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>결제가 완료되었습니다!</h1>

    <!-- ✅ 결제 완료 정보 -->

    <p><strong>상품명:</strong> <span id="orderName">${orderName}</span></p>
    <p><strong>결제 금액:</strong> <span id="orderTotalPrice"><fmt:formatNumber value="${orderTotalPrice}" type="currency" currencySymbol="₩"/></span></p>

    <a href="/shop/main" class="btn">🏠 홈으로 돌아가기</a>
    <a href="/shop/buyList" class="btn">🛍️ 주문 내역 확인</a>
</body>
</html>

<!-- Footer -->
<%@ include file="../include/footer.jsp" %>
