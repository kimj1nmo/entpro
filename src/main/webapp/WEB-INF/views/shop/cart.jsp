<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../include/header_user.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }

        .cart-container {
            max-width: 800px;
            margin: auto;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #fff;
            padding: 15px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .item-actions {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .quantity-input {
            width: 50px;
            text-align: center;
        }

        .btn {
            padding: 8px 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .delete-btn {
            background-color: #dc3545;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }

        .empty-cart {
            text-align: center;
            color: #888;
            margin: 20px 0;
        }

        .cart-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .total-price {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
            margin-top: 20px;
        }
        


.cart-image {
    width: 50px;
    height: auto;
    object-fit: cover;
}

.item-info{
display: flex;
flex: 2;
align-items: center; /* 세로 중앙 정렬 */
    gap: 5px; /* 이미지와 텍스트 사이 간격 */
}

.cart-text {
    flex-direction: column; /* 세로 정렬 */
    justify-content: center;
    margin-left: 5px;
}

.deleteButton{
background-color:inherit;
border:none;
}
        
    </style>
</head>
<body>
<div class="cart-container">
    <h1 style="font-weight:550;">장바구니</h1>
    <c:choose>
        <c:when test="${not empty memId}">
            <c:if test="${not empty cartList}">
                <c:set var="totalPrice" value="0" />
                <c:forEach var="cart" items="${cartList}">
                    <c:forEach var="detail" items="${cart.cartDetails}">
                        <div class="cart-item">
                            <div class="item-info">
                            <c:if test="${not empty detail.fileGroupVO.fileDetailVOList}">
							    <c:set var="imagePath" value="${detail.fileGroupVO.fileDetailVOList[0].fileSaveLocate}" />
							    <img src="${imagePath}" alt="상품 이미지" style="width: 50px; height: auto;">
							</c:if>
							 <div class="cart-text">
					            <strong>${detail.goods.gdsNm}</strong><br>
					            <fmt:formatNumber value="${detail.goods.gdsPrice}" pattern="#,###"/>원
					        </div>                            </div>
                            <div class="item-actions">
                                <input type="number" class="quantity-input" id="quantity-${cart.cartNo}-${detail.gdsNo}" value="${detail.cartDetailQy}" min="1">
<%--                                 <button class="btn" onclick="updateQuantity('${cart.cartNo}', '${detail.gdsNo}')">업데이트</button> --%>
                                <button class="deleteButton" onclick="deleteCartItem('${cart.cartNo}', '${detail.gdsNo}')"><i class="fa-solid fa-xmark"></i></button>
                            </div>
                        </div>
                        <c:set var="totalPrice" value="${totalPrice + (detail.goods.gdsPrice * detail.cartDetailQy)}" />
                    </c:forEach>
                </c:forEach>

                <div class="total-price">
                    총 가격: <fmt:formatNumber value="${totalPrice}" pattern="#,###"/>원
                </div>

                <div class="cart-footer">
                    <button type="button" class="btn btn-block btn-light" style="background-color:rgb(200, 200, 200);"onclick="goToMain()">쇼핑 계속하기</button>
                    
                    <form id="paymentForm" action="/shop/payment" method="POST">
                        <c:forEach var="cart" items="${cartList}">
                            <c:forEach var="detail" items="${cart.cartDetails}">
                                <input type="hidden" name="cartNo" value="${cart.cartNo}">
                                <input type="hidden" name="gdsNos" value="${detail.gdsNo}">
                                <input type="hidden" name="quantities" value="${detail.cartDetailQy}">
                            </c:forEach>
                        </c:forEach>
                        <button type="submit" class="btn" style="width:100%;">구매하기</button>
                    </form>
                </div>
            </c:if>

            <c:if test="${empty cartList}">
                <div class="empty-cart">
                    장바구니가 비어 있습니다.
                </div>
            </c:if>
        </c:when>

        <c:otherwise>
            <p>로그인이 필요합니다. <a href="/login">로그인</a>하세요.</p>
        </c:otherwise>
    </c:choose>
</div>

<script>
    function updateQuantity(cartNo, gdsNo) {
        const quantityInput = document.getElementById("quantity-" + cartNo + "-" + gdsNo);
        const quantity = quantityInput.value;

        if (quantity <= 0) {
            alert('수량은 1 이상이어야 합니다.');
            return;
        }

        fetch('/shop/cart/update', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams({ cartNo, gdsNo, quantity })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('수량이 업데이트되었습니다.');
                location.reload();
            } else {
                alert('오류: ' + data.error);
            }
        });
    }

    function deleteCartItem(cartNo, gdsNo) {
        if (confirm('정말 삭제하시겠습니까?')) {
            fetch('/shop/cart/delete', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams({ cartNo, gdsNo })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('상품이 삭제되었습니다.');
                    location.reload();
                } else {
                    alert('삭제 중 오류 발생: ' + data.error);
                }
            });
        }
    }

    function goToMain() {
        window.location.href = "/shop/main";
    }
</script>
</body>
</html>
