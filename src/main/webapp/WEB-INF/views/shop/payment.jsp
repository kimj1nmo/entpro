<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- Header -->
<jsp:include page="../include/header_user.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>결제 페이지</title>
    <!-- Daum 주소 API -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
/* 기본 스타일 */
body {
    font-family: 'Noto Sans KR', Arial, sans-serif;
    margin: 0;
    padding: 20px;
    background-color: #f8f9fa;
}

/* 컨테이너 레이아웃 */
.container {
    display: flex;
    justify-content: space-between; 
    align-items: flex-start;
    gap: 20px;
    max-width: 1200px;
    margin: auto;
    padding: 20px;
    box-sizing: border-box;
}

/* 결제 및 배송 폼 */
.form-container {
    width: 50%;
    background-color: #ffffff;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* 상품 정보 테이블 */
.product-info {
    width: 45%;
    background-color: #ffffff;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
    border-radius: 10px;
    overflow: hidden;
}

th, td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: center;
    font-size: 14px;
}

th {
    background-color: #e3f2fd; /* 연한 하늘색 */
    color: #1565c0;
    font-weight: bold;
}

/* 폼 요소 */
.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

.form-group input, .form-group select, .form-group button {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 8px;
    box-sizing: border-box;
}

/* 버튼 스타일 */
.btn-submit, .btn-postcode {
    padding: 12px;
    background-color: #90caf9;  /* 연한 하늘색 */
    color: white;
    border: none;
    border-radius: 25px;        /* 둥글게 처리 */
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
    font-weight: bold;
}

.btn-submit:hover, .btn-postcode:hover {
    background-color: #42a5f5;  /* 진한 하늘색으로 변화 */
    transform: translateY(-3px); /* 버튼이 살짝 떠오르는 효과 */
}

/* 모달 스타일 */
.modal {
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
    display: none;
}

.modal-content {
    background-color: white;
    padding: 20px;
    border-radius: 15px;
    width: 400px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    text-align: center;
}

.close {
    float: right;
    cursor: pointer;
    font-size: 20px;
    color: #444;
}

#addressList {
    list-style-type: none;
    padding: 0;
    margin: 10px 0;
}

#addressList li {
    padding: 10px;
    border: 1px solid #ddd;
    margin-bottom: 5px;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s;
}

#addressList li:hover {
    background-color: #e3f2fd; /* 연한 하늘색으로 hover */
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .container {
        flex-direction: column;
    }
    .form-container, .product-info {
        width: 100%;
    }
}


    </style>
</head>
<body>
<body>
<div class="container">
    <!-- 결제 및 배송 폼 (왼쪽) -->
    <div class="form-container">
        <h2>결제 페이지</h2>

        <sec:authorize access="isAuthenticated()">
            <!-- 사용자 정보 -->
            <c:set var="username" value="${pageContext.request.userPrincipal.name}" />

            <!-- 화면에 표시되지 않음 -->
            <input type="hidden" name="username" value="${username}" />
            <input type="hidden" name="cartNo" value="${cartNo}" />

            <!-- 결제 및 배송 폼 -->
            <form action="/shop/processPayment" method="post">
                <!-- Hidden Fields -->
                <c:forEach var="goods" items="${goodsList}" varStatus="status">
                    <input type="hidden" name="gdsNos" value="${goods.gdsNo}" />
                    <input type="hidden" name="quantities" value="${quantities[status.index]}" />
                </c:forEach>
                <input type="hidden" name="orderTotalAmount" value="${totalPrice}" />
                <input type="hidden" name="cartNo" value="${cartNo}" />

                <!-- 배송 정보 -->
                <h3>배송 정보</h3>
                <div class="form-group">
                    <label for="postalCode">우편번호</label>
                    <input type="text" id="postalCode" name="postalCode" placeholder="우편번호를 입력하세요" required readonly />
                    <button type="button" id="btnShowAddresses">등록 주소 찾기</button>

                    <div id="addressModal" class="modal" style="display: none;">
                        <div class="modal-content">
                            <span class="close">&times;</span>
                            <h3>등록된 주소 선택</h3>
                            <ul id="addressList">
                                <!-- 주소 리스트가 여기에 동적으로 추가됨 -->
                            </ul>
                        </div>
                    </div>

                    <button type="button" class="btn-postcode" onclick="execDaumPostcode()">우편번호 찾기</button>
                </div>

                <div class="form-group">
                    <label for="orderAddress">도로명주소 / 지번주소</label>
                    <input type="text" id="orderAddress" name="orderAddress" placeholder="검색 결과가 자동 입력됩니다" required readonly />
                </div>
                <div class="form-group">
                    <label for="orderDetailAddress">상세 주소</label>
                    <input type="text" id="orderDetailAddress" name="orderDetailAddress" placeholder="상세 주소를 입력하세요" />
                </div>

                <!-- 결제 정보 -->
                <h3>결제 정보</h3>
                <div class="form-group">
                    <label for="paymentMethod">결제 수단</label>
                    <select id="paymentMethod" name="goodsPaymentVO.paycoNo" required>
                        <option value="1" selected>카드</option>
                        <option value="2">카카오페이</option>
                        <option value="3">네이버페이</option>
                    </select>
                </div>

                <!-- 사용자 정보 -->
                <h3>사용자 정보</h3>
                <div class="form-group">
                    <label for="orderName">사용자 이름</label>
                    <input type="text" id="orderName" name="orderName" placeholder="받는이를 입력하세요" required />
                </div>
                <div class="form-group">
                    <label for="userPhone">전화번호</label>
                    <input type="text" id="userPhone" name="userPhone" placeholder="전화번호를 입력하세요" required />
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn-submit">결제</button>
                
               <button type="button" id="previewBtn" class="previewBtn">자동</button>
            </form>
        </sec:authorize>

        <sec:authorize access="isAnonymous()">
            <p>회원 상태: 로그인이 필요합니다.</p>
            <p><a href="/login">로그인 페이지로 이동</a></p>
        </sec:authorize>
    </div>

    <!-- 상품 정보 테이블 (오른쪽) -->
    <div class="product-info">
        <h3>상품 정보</h3>
        <table>
            <thead>
                <tr>
                    <th>상품 번호</th>
                    <th>상품 이름</th>
                    <th>수량</th>
                    <th>가격</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="goods" items="${goodsList}" varStatus="status">
                    <tr>
                        <td>${goods.gdsNo}</td>
                        <td>${goods.gdsNm}</td>
                        <td>${quantities[status.index]}</td>
                        <td><fmt:formatNumber value="${goods.gdsPrice}" type="currency" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <p><strong>상품 총 금액:</strong> <fmt:formatNumber value="${totalPrice}" type="currency" /></p>
    </div>
</div>
</body>

<script>
$(document).ready(function() {
    $("#previewBtn").on("click", function() {
        $("#orderName").val("최윤호");
        $("#userPhone").val("01097154862");
    });
});
    // Daum 우편번호 API 실행
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById('postalCode').value = data.zonecode; // 우편번호
                document.getElementById('orderAddress').value = data.roadAddress || data.jibunAddress; // 주소
            }
        }).open();
    }
    
    //주소 불러오기
    document.addEventListener("DOMContentLoaded", function () {
    const addressModal = document.getElementById("addressModal");
    const addressList = document.getElementById("addressList");
    const btnShowAddresses = document.getElementById("btnShowAddresses");
    const closeModal = document.querySelector(".close");

    // 모달 닫기 기능
    closeModal.addEventListener("click", function () {
        addressModal.style.display = "none";
    });

    // "등록 주소 찾기" 버튼 클릭 시 AJAX 요청
    btnShowAddresses.addEventListener("click", function () {
        const memId = "${username}"; // 로그인된 사용자 아이디 (JSP에서 전달됨)

        fetch("/shop/addresses", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ memId: memId })
        })
        .then(response => response.json())
        .then(data => {
            // 모달 열기
            addressModal.style.display = "flex";
            addressList.innerHTML = ""; // 기존 리스트 초기화

            if (data.length === 0) {
                addressList.innerHTML = "<li>등록된 주소가 없습니다.</li>";
                return;
            }

            // 주소 리스트 생성
            data.forEach(address => {
                const li = document.createElement("li");
                li.textContent = `\${address.addName} - \${address.add1} \${address.add2} (\${address.addZip})`;
                li.dataset.zip = address.addZip;
                li.dataset.address1 = address.add1;
                li.dataset.address2 = address.add2;
                li.style.cursor = "pointer";

                // 주소 클릭 이벤트 (자동 채우기)
                li.addEventListener("click", function () {
                    document.getElementById("postalCode").value = this.dataset.zip;
                    document.getElementById("orderAddress").value = this.dataset.address1;
                    document.getElementById("orderDetailAddress").value = this.dataset.address2;

                    // 모달 닫기
                    addressModal.style.display = "none";
                });

                addressList.appendChild(li);
            });
        })
        .catch(error => console.error("주소 조회 실패:", error));
    });
});


</script>
</body>
</html>
