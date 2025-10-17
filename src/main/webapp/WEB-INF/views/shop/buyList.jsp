<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Header -->
<jsp:include page="../include/header_user2.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주문 내역</title>
    <style>
    .refund-btn {
    background-color: #dc3545; /* 빨간색 배경 */
    color: white;              /* 흰색 글자 */
    border: none;              /* 테두리 없음 */
    padding: 8px 15px;         /* 버튼 내부 여백 */
    border-radius: 5px;        /* 버튼 모서리 둥글게 */
    cursor: pointer;           /* 커서 포인터로 변경 */
    transition: background-color 0.3s, transform 0.2s; /* 부드러운 색상 및 크기 변화 */
    font-weight: bold;         /* 글씨 굵게 */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 가벼운 그림자 */
}

.refund-btn:hover {
    background-color: #c82333; /* 더 진한 빨간색 */
    transform: scale(1.05);    /* 살짝 확대 효과 */
}

.refund-btn:active {
    background-color: #bd2130; /* 클릭 시 더 진한 색상 */
    transform: scale(0.95);    /* 클릭 시 살짝 축소 효과 */
}

    .filter-btn {
    background-color: #007BFF;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin: 0 5px;
    transition: background-color 0.3s;
}

.filter-btn:hover {
    background-color: #0056b3;
}

.filter-all { background-color: #007BFF; }     /* 파랑 */
.filter-complete { background-color: #28A745; } /* 초록 */
.filter-shipping { background-color: #FFC107; } /* 노랑 */
.filter-refund { background-color: #DC3545; }   /* 빨강 */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
        .order-details {
            display: none;
        }
        .toggle-order {
            background: none;
            border: none;
            color: blue;
            cursor: pointer;
            font-size: 16px;
        }
    </style>
</head>
<body>

    <h1 style="margin-bottom:40px; text-align: center; font-weight:600; color:rgb(100, 100, 100);">주문 목록</h1>

    <!-- ✅ 필터 버튼 -->
    <div style="text-align: center; margin-bottom: 20px;">
    <button onclick="filterOrders('all')" class="filter-btn filter-all"> 📋 전체 주문 (<span id="allCount">0</span>)</button>
    <button onclick="filterOrders('1')" class="filter-btn filter-complete"> ✅ 주문 완료 (<span id="completeCount">0</span>)</button>
    <button onclick="filterOrders('2')" class="filter-btn filter-shipping"> 🚚 배송 진행 (<span id="shippingCount">0</span>)</button>
    <button onclick="filterOrders('3')" class="filter-btn filter-refund"> 💸 환불 요청 (<span id="refundCount">0</span>)</button>
</div>

    <!-- ✅ 로그인한 사용자 ID -->
<%--     <p>로그인한 사용자 ID: <c:out value="${userId}" /></p> --%>

    <!-- ✅ 주문 목록 (하나의 테이블로 통합) -->
 <!-- ✅ 주문 목록 (하나의 테이블로 통합) -->
<table border="1" id="orderTable">
    <thead>
        <tr>
            <th>주문 번호</th>
            <th>받는 사람</th>
            <th>상품명</th>
            <th>총 금액</th>
            <th>주문 상태</th>
            <th>환불</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${not empty orderList}">
                <c:set var="prevOrderNo" value=""/>
                <c:forEach var="order" items="${orderList}">
                    <c:if test="${prevOrderNo != order.orderNo}">
                        <tr class="order-row" data-status="${order.orderChangeNo}">
                            <td>
                                <button class="toggle-order" data-target="#order-${order.orderNo}">
                                    <c:out value="${order.orderNo}" />
                                </button>
                            </td>
                            <td><c:out value="${order.orderName}"/></td>
                           <td>
    <c:set var="totalItems" value="0"/>
    <c:forEach var="item" items="${orderList}">
        <c:if test="${item.orderNo == order.orderNo}">
            <c:set var="totalItems" value="${totalItems + 1}"/>
        </c:if>
    </c:forEach>
    
    <c:choose>
        <c:when test="${totalItems > 1}">
            <c:out value="${order.gdsName} 외 ${totalItems - 1}개" />
        </c:when>
        <c:otherwise>
            <c:out value="${order.gdsName}" />
        </c:otherwise>
    </c:choose>
</td>

                            <td><fmt:formatNumber value="${order.orderTotalAmount}" type="currency" currencySymbol="₩"/></td>

                            <td>
                                <c:choose>
                                    <c:when test="${order.orderChangeNo == 1}">✅ 주문 완료</c:when>
                                    <c:when test="${order.orderChangeNo == 2}">⏳ 배송 중</c:when>
                                    <c:when test="${order.orderChangeNo == 3}">❌ 환불 요청됨</c:when>
                                    <c:when test="${order.orderChangeNo == 4}">🚫 환불 거절됨</c:when>
                                    <c:when test="${order.orderChangeNo == 5}">💸 환불 수락됨</c:when>
                                </c:choose>
                            </td>
                            <td>
                                <c:if test="${order.orderChangeNo != 3}">
                                    <button class="refund-btn" onclick="requestRefund('<c:out value="${order.orderNo}" />')">
                                        환불 요청
                                    </button>
                                </c:if>
                            </td>
                        </tr>

                        <!-- ✅ 주문 상세 정보 -->
                        <tr id="order-${order.orderNo}" class="order-details">
                            <td colspan="6">
                                <table width="100%" border="1">
                                    <tr>
                                        <th>주문 날짜</th>
                                        <th>배송 주소</th>
                                        <th>전화 번호</th>
                                    </tr>
                                    <tr>
                                        <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td><c:out value="${order.orderAddress}" /></td>
                                        <td><c:out value="${order.userPhone}" /></td>
                                    </tr>
                                </table>

                                <table width="100%" border="1">
                                    <thead>
                                        <tr>
                                            <th>상품 번호</th>
                                            <th>상품명</th>
                                            <th>상품 가격</th>
                                            <th>주문 수량</th>
                                            <th>총 상품 가격</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${orderList}">
                                            <c:if test="${item.orderNo == order.orderNo}">
                                                <tr>
                                                    <td><c:out value="${item.gdsNo}" /></td>
                                                    <td><c:out value="${item.gdsName}" /></td>
                                                    <td><fmt:formatNumber value="${item.gdsPrice}" type="currency" currencySymbol="₩"/></td>
                                                    <td><c:out value="${item.orderListQy}" /></td>
                                                    <td>
                                                        <fmt:formatNumber value="${item.gdsPrice * item.orderListQy}" type="currency" currencySymbol="₩"/>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </c:if>
                    <c:set var="prevOrderNo" value="${order.orderNo}"/>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="6">주문 내역이 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>

</body>
</html>

<!-- ✅ JavaScript -->
<script>
function filterOrders(status) {
   document.querySelectorAll(".order-details").forEach(row => row.style.display = "none");

    document.querySelectorAll(".order-row").forEach(row => {
        if (status === 'all' || row.dataset.status === status) {
            row.style.display = "table-row";
        } else {
            row.style.display = "none";
        }
    });
}

// ✅ 주문 상세 토글 기능
document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll(".toggle-order").forEach(button => {
        button.addEventListener("click", function() {
            let target = document.querySelector(this.dataset.target);
            if (target.style.display === "none" || target.style.display === "") {
                target.style.display = "table-row";
            } else {
                target.style.display = "none";
            }
        });
    });
});

// ✅ 환불 요청 처리 함수
function requestRefund(orderNo) {
    if (confirm("정말 환불 요청을 하시겠습니까?")) {
        fetch('/shop/requestRefund', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'orderNo=' + orderNo
        })
        .then(response => response.text())
        .then(message => {
            alert(message);
            location.reload();
        })
        .catch(error => {
            console.error("❌ 환불 요청 오류:", error);
            alert("서버 오류로 인해 환불 요청이 처리되지 않았습니다.");
        });
    }
}
document.addEventListener("DOMContentLoaded", function() {
    let allCount = 0, completeCount = 0, shippingCount = 0, refundCount = 0;

    document.querySelectorAll(".order-row").forEach(row => {
        allCount++;
        const status = row.dataset.status;

        if (status === "1") completeCount++;
        if (status === "2") shippingCount++;
        if (status === "3") refundCount++;
    });

    document.getElementById("allCount").textContent = allCount;
    document.getElementById("completeCount").textContent = completeCount;
    document.getElementById("shippingCount").textContent = shippingCount;
    document.getElementById("refundCount").textContent = refundCount;
});
</script>

<%@ include file="../include/footer.jsp" %>
