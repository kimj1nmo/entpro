<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<style>
/* ✅ 검색창 컨테이너 */
td {
    padding: 0px; /* 여백 추가로 가독성 향상 */
    vertical-align: middle; /* 내용 세로 중앙 정렬 */
    text-align: center; /* 버튼 가운데 정렬 */
}
.search-container {
    display: flex;
    justify-content: flex-end;
    margin: 10px 0;            /* 상하 여백 */
    padding: 10px;
}

/* ✅ 검색 입력 필드 스타일 */
.search-input {
    width: 100%;               /* 가로 전체 차지 */
    max-width: 400px;          /* 최대 너비 설정 */
    padding: 10px 15px;        /* 내부 여백 */
    font-size: 14px;           /* 글자 크기 */
    border: 2px solid #ccc;    /* 테두리 색상 */
    border-radius: 8px;        /* 둥근 테두리 */
    outline: none;             /* 포커스 시 테두리 제거 */
    transition: all 0.3s ease; /* 부드러운 전환 효과 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 약간의 그림자 */
}

/* ✅ 포커스 시 스타일 변화 */
.search-input:focus {
    border-color: #007bff;     /* 포커스 시 파란색 테두리 */
    box-shadow: 0 4px 8px rgba(0, 123, 255, 0.3); /* 강조된 그림자 */
    background-color: #f9f9ff; /* 약간의 배경 강조 */
}

.table {
    font-size: 12px;  /* 기본 글자 크기 설정 */
}
/* 🚀 버튼을 가로로 배치하기 위한 컨테이너 */
.button-group {
    display: column;        /* 가로 정렬 */
    gap: 5px;             /* 버튼 간격 */
    align-items: center;   /* 세로 중앙 정렬 */
}
.card-text {
    text-align: center; /* 중앙 정렬 */
    font-size: 1.5rem;  /* 텍스트 크기 조정 (선택 사항) */
    margin: 10px 0;     /* 상하 여백 추가 */
}

/* ✅ 히든 목록 기본 숨김 */
.scroll-container {
	padding: 10px;
	border-top: 1px solid #ddd;
}
.clickable-header {
    cursor: pointer;              /* 클릭 가능한 손가락 모양 */
    padding: 10px;                /* 클릭 영역 확대 */
    background-color: rgba(255, 255, 255, 0.1);  /* 약간의 배경 강조 */
    transition: background-color 0.3s ease;
}

.clickable-header:hover {
    background-color: rgba(255, 255, 255, 0.2);  /* Hover 시 더 강조 */
}

.toggle-btn {
    font-size: 20px;
    transition: transform 0.3s ease;
}

/* 열린 상태에서는 화살표 회전 */
.scroll-container[style*="display: block;"] + .toggle-btn {
    transform: rotate(180deg);
}

/* ✅ 토글 버튼 스타일 */
.toggle-btn {
	cursor: pointer;
	font-size: 16px;
	font-weight: bold;
	padding: 5px;
}

/* ✅ 목록 스타일 */
.order-list {
	list-style: none;
	padding: 0;
	margin: 0;
}

.order-item {
	cursor: pointer;
	transition: background 0.3s ease;
}

.order-item:hover {
	background: rgba(255, 255, 255, 0.2);
}

/* 사이드바 본문 간격 */
.content {
	padding-left: 0.5vw !important;
}
</style>


<div class="content-wrapper">
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6" style="padding-left: 1.4vw !important;">
					<h1>주문 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/companypage/main">Home</a></li>
						<li class="breadcrumb-item active">Order Management</li>
					</ol>
				</div>
			</div>



			<div class="row" style="margin-left: 0.6vw !important;">
    <!-- ✅ 총 주문 건수 -->
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="card bg-primary text-white">
            <!-- ✅ 상단 전체를 클릭 가능하게 수정 -->
            <div class="card-body d-flex justify-content-between align-items-center clickable-header" 
                 onclick="toggleVisibility('totalOrdersList')">
                <h5 class="card-title">📦 총 주문 건수</h5>
                <span class="toggle-btn">∨</span>
            </div>
            <p class="card-text">
                <strong id="totalOrders">0</strong> 건
            </p>
            <div class="scroll-container" id="totalOrdersList" style="display: none;">
                <ul class="order-list">
                    <li class="order-item" onclick="filterOrders('all')">전체 주문 보기</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- ✅ 주문 완료 건수 -->
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="card bg-warning text-dark">
            <div class="card-body d-flex justify-content-between align-items-center clickable-header" 
                 onclick="toggleVisibility('completedOrdersList')">
                <h5 class="card-title">🟢 주문 완료 건수</h5>
                <span class="toggle-btn">∨</span>
            </div>
            <p class="card-text">
                <strong id="completedOrders">0</strong> 건
            </p>
            <div class="scroll-container" id="completedOrdersList" style="display: none;">
                <ul class="order-list">
                    <li class="order-item" onclick="filterOrders('1')">주문 완료</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- ✅ 처리된 주문 건수 -->
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="card bg-success text-white">
            <div class="card-body d-flex justify-content-between align-items-center clickable-header" 
                 onclick="toggleVisibility('processedOrdersList')">
                <h5 class="card-title">✅ 처리된 주문 건수</h5>
                <span class="toggle-btn">∨</span>
            </div>
            <p class="card-text">
                <strong id="processedOrders">0</strong> 건
            </p>
            <div class="scroll-container" id="processedOrdersList" style="display: none;">
                <ul class="order-list">
                    <li class="order-item" onclick="filterOrders('2')">배송 진행</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- ✅ 환불 요청 건수 -->
    <div class="col-lg-3 col-md-6 col-sm-12">
        <div class="card bg-danger text-white">
            <div class="card-body d-flex justify-content-between align-items-center clickable-header" 
                 onclick="toggleVisibility('refundOrdersList')">
                <h5 class="card-title">❌ 환불 요청 건수</h5>
                <span class="toggle-btn">∨</span>
            </div>
            <p class="card-text">
                <strong id="refundRequests">0</strong> 건
            </p>
            <div class="scroll-container" id="refundOrdersList" style="display: none;">
                <ul class="order-list">
                    <li class="order-item" onclick="filterOrders('3')">환불 요청</li>
                    <li class="order-item" onclick="filterOrders('4')">환불 거절</li>
                    <li class="order-item" onclick="filterOrders('5')">환불 확인</li>
                </ul>
            </div>
        </div>
    </div>
</div>

			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									
									<div class="search-container">
		<input type="text" id="searchInput" class="search-input" placeholder="검색어를 입력하세요...">
		
	</div>
								</div>
								<div class="card-body table-responsive p-0">
									<table id="goodsTable" border="1" class="table table-hover">
										<thead>
											<tr>
												<th>주문번호</th>
												<th>총금액</th>
												<th>상품</th>
												<th>이름</th>
												<th>전화번호</th>
												<th>주문 상태</th>
												<th>주문 상태 변경</th>
												
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty orders}">
													<tr>
														<td colspan="9" class="text-center"><script> console.warn("🟠 [DEBUG] 주문 목록이 비어 있음!"); </script>
															${message != null ? message : "현재 표시할 주문이 없습니다."}</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:set var="prevOrderNo" value="" />
													<c:forEach var="order" items="${orders}">
														<c:if test="${prevOrderNo != order.orderNo}">
															<tr>
																<td>
																	<button class="btn btn-link toggle-order"
																		data-target="#order-${order.orderNo}">
																		<c:out value="${order.orderNo}" />
																	</button>
																</td>

																<td><c:out value="${order.orderTotalAmount}" /> 원</td>
																<td><c:set var="totalItems" value="0" /> <c:set
																		var="firstGdsName" value="" /> <c:forEach var="item"
																		items="${orders}">
																		
																		<c:if test="${item.orderNo == order.orderNo}">
																			<c:set var="totalItems" value="${totalItems + 1}" />
																			
																			<c:if test="${totalItems == 1}">
																				<c:set var="firstGdsName" value="${item.gdsName}" />
																			</c:if>
																		</c:if>
																		
																	</c:forEach>
																	<c:choose>
																	    <c:when test="${totalItems > 1}">
																	        <c:out value="${firstGdsName} 외 ${totalItems - 1}개" />
																	    </c:when>
																	    <c:otherwise>
																	        <c:out value="${firstGdsName}" />
																	    </c:otherwise>
																	</c:choose>
																</td>
																<td><c:out value="${order.orderName}" /></td>
																<td><c:out value="${order.userPhone}" /></td>
																<td><c:choose>
																		<c:when test="${order.orderChangeNo == 1}">✅ 주문 완료</c:when>
																		<c:when test="${order.orderChangeNo == 2}">⏳ 배송 중</c:when>
																		<c:when test="${order.orderChangeNo == 3}">❌ 환불 요청됨</c:when>
																		<c:when test="${order.orderChangeNo == 4}">❌ 환불 거절</c:when>
																		<c:when test="${order.orderChangeNo == 5}">✔ 환불 확인</c:when>
																		<c:otherwise>🔍 상태 확인 필요</c:otherwise>
																	</c:choose></td>
																<td>
																<div class="button-group">
    <!-- 🚚 배송 시작 버튼 -->
    <c:if test="${order.orderChangeNo == 1}">
        <button class="btn btn-sm btn-primary update-status"
            data-order-no="${order.orderNo}" data-status="2"
            style="width:150px;">
            🚚 배송 시작
        </button>
    </c:if>

    <!-- ❌ 환불 거절 버튼 -->
    <c:if test="${order.orderChangeNo == 3}">
        <button class="btn btn-sm btn-danger update-status"
            data-order-no="${order.orderNo}" data-status="4"
            style="width:75px;  ">
            ❌ 거절
        </button>
    </c:if>

    <!-- ✔ 환불 확인 버튼 -->
    <c:if test="${order.orderChangeNo == 3}">
        <button class="btn btn-sm btn-success update-status"
            data-order-no="${order.orderNo}" data-status="5"
            style="width:75px;   ">
            ✔ 승인
        </button>
    </c:if>
    </div>
</td>

																

															</tr>


															<!-- 상품 목록 (숨김 상태) -->



															<tr id="order-${order.orderNo}" class="order-details"
																style="display: none;">
																<td colspan="9">

																	<table class="table table-sm">
																		<thead>
																			<tr>
																				<th>주문날짜</th>
																				<th>배송주소</th>
																				<th>상품 개수</th>
																				<th>회원ID</th>
																				<th>회원 이름</th>
																				<th>회원 전화번호</th>
																			</tr>
																		</thead>
																		<tbody>
																			<c:set var="totalItems" value="0" />
																			<c:forEach var="item" items="${orders}">
																				<c:if test="${item.orderNo == order.orderNo}">
																					<c:set var="totalItems" value="${totalItems + 1}" />
																				</c:if>
																			</c:forEach>

																			<!-- 주문 정보를 한 번만 출력 -->
																			<tr>
																				<%@ taglib prefix="fmt"
																					uri="http://java.sun.com/jsp/jstl/fmt"%>

																				<td><fmt:formatDate value="${order.orderDate}"
																						pattern="yyyy-MM-dd HH:mm:ss" /></td>
																				<td><c:out value="${order.orderAddress}" /></td>
																				<td><c:out value="${totalItems}" /> 개</td>
																				<td><c:out value="${order.memId}" /></td>
																				<td><c:out value="${order.memName}" /></td>
																				<td><c:out value="${order.memTel}" /></td>
																			</tr>
																		</tbody>
																	</table>

																	<table class="table table-sm">
																		<thead>
																			<tr>
																				<th>상품번호</th>
																				<th>상품이름</th>
																				<th>수량</th>
																				<th>상품 가격</th>
																				<th>합계 금액</th>
																			</tr>
																		</thead>
																		<tbody>
																			<c:forEach var="item" items="${orders}">
																				<c:if test="${item.orderNo == order.orderNo}">
																					<tr>
																						<td><c:out value="${item.gdsNo}" /></td>
																						<td><c:out value="${item.gdsName}" /></td>
																						<td><c:out value="${item.orderListQy}" /></td>
																						<td><c:out value="${item.gdsPrice}" /> 원</td>
																						<td><c:out
																								value="${item.orderListQy * item.gdsPrice}" /> 원</td>
																					</tr>
																				</c:if>
																			</c:forEach>
																		</tbody>
																	</table>
																</td>
															</tr>
														</c:if>
														<c:set var="prevOrderNo" value="${order.orderNo}" />
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

		<!-- ✅ JavaScript 추가 -->
		<script>
//✅ 토글 버튼 클릭 시 특정 목록만 보이도록 수정
function toggleVisibility(id) {
    let element = document.getElementById(id);
    if (!element) return;

    // ✅ 모든 히든 목록을 닫고 클릭한 목록만 표시/숨김
    document.querySelectorAll(".scroll-container").forEach(list => {
        list.style.display = list.id === id ? (list.style.display === "block" ? "none" : "block") : "none";
    });
}

// ✅ 주문 상태 필터링 함수
function filterOrders(status) {
    console.log(`📢 주문 상태 필터링: ${status}`);

    document.querySelectorAll("tbody tr.order-row").forEach(row => {
        let orderStatus = row.getAttribute("data-status") || "unknown";
        if (status === "all" || orderStatus === status) {
            row.style.display = "";
        } else {
            row.style.display = "none";
        }
    });
}

// ✅ 주문 상태 업데이트 함수 (AJAX 요청)
function updateOrderStatus(orderNo, newStatus) {
    fetch("/companypage/updateOrderStatus", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ orderNo: parseInt(orderNo), orderChangeNo: parseInt(newStatus) })
    })
    .then(response => response.json())
    .then(result => {
        alert(result.message);
        location.reload(); // ✅ 상태 변경 후 새로고침
    })
    .catch(error => {
        console.error("❌ 주문 상태 변경 실패:", error);
        alert("❌ 상태 변경 중 오류 발생!");
    });
}

// ✅ DOM 로드 후 실행
document.addEventListener("DOMContentLoaded", function () {
    console.log("📢 DOM 로드 완료, 주문 통계 계산 시작...");

    let totalOrdersSet = new Set(); // ✅ 중복 제거를 위한 Set
    let processedOrders = 0;
    let refundRequests = 0;
    let completedOrders = 0;

    // ✅ "order-row" 클래스가 설정되지 않은 경우 추가
    document.querySelectorAll("tbody tr").forEach(row => {
        let statusCell = row.querySelector("td:nth-child(6)");
        if (statusCell) {
            let statusText = statusCell.innerText.trim();
            let statusCode = {
                "✅ 주문 완료": "1",
                "⏳ 배송 중": "2",
                "❌ 환불 요청됨": "3",
                "❌ 환불 거절": "4",
                "✔ 환불 확인": "5"
            }[statusText] || "unknown";

            row.setAttribute("data-status", statusCode);
            if (!row.classList.contains("order-details")) {
                row.classList.add("order-row");
            }
        }
    });

    // ✅ "order-row" 클래스를 가진 행에서 주문 정보 가져오기 (숨겨진 주문 상세 제외)
    document.querySelectorAll("tbody tr.order-row:not(.order-details)").forEach(row => {
        let orderNoElement = row.querySelector("td:first-child button"); // 주문번호 버튼
        let orderStatus = row.getAttribute("data-status") || "unknown";

        if (orderNoElement) {
            let orderNo = orderNoElement.innerText.trim();
            totalOrdersSet.add(orderNo); // ✅ 중복 방지
        }

        switch (orderStatus) {
            case "1": completedOrders++; break;
            case "2":
            case "4":
            case "5": processedOrders++; break;
            case "3": refundRequests++; break;
        }
    });

    // ✅ HTML 통계 값 업데이트
    document.getElementById("totalOrders").innerText = totalOrdersSet.size; // ✅ 중복 제거된 주문 개수
    document.getElementById("processedOrders").innerText = processedOrders;
    document.getElementById("refundRequests").innerText = refundRequests;
    document.getElementById("completedOrders").innerText = completedOrders;

    console.log("📢 주문 통계 업데이트 완료! ✅ 총 주문 건수: ", totalOrdersSet.size);

    // ✅ 주문 번호 클릭 시 상품 목록 토글
    document.querySelectorAll(".toggle-order").forEach(button => {
        button.addEventListener("click", function() {
            let target = document.querySelector(this.dataset.target);
            if (target) {
                target.style.display = target.style.display === "none" || target.style.display === "" ? "table-row" : "none";
            }
        });
    });

    // ✅ 주문 상태 변경 버튼 클릭 이벤트
    document.querySelectorAll(".update-status").forEach(button => {
        button.addEventListener("click", function() {
            let orderNo = this.getAttribute("data-order-no");
            let newStatus = this.getAttribute("data-status");

            if (!orderNo || isNaN(orderNo)) {
                alert("❌ 오류: 주문 번호가 유효하지 않습니다.");
                return;
            }

            if (confirm("주문 상태를 변경하시겠습니까?")) {
                updateOrderStatus(orderNo, newStatus);
            }
        });
    });

});

//✅ 검색 기능 수정
document.getElementById('searchInput').addEventListener('input', function () {
    const searchValue = this.value.toLowerCase();
    const rows = document.querySelectorAll('#goodsTable tbody tr');

    rows.forEach(row => {
        // ✅ 상세 정보(order-details)는 무조건 숨기기
        if (row.classList.contains('order-details')) {
            row.style.display = 'none';
            return; // 상세 정보는 검색에서 제외
        }

        // ✅ 주문 목록만 검색 조건에 맞게 표시
        const rowData = Array.from(row.cells).map(cell => cell.textContent.toLowerCase());
        const match = rowData.some(data => data.includes(searchValue));

        row.style.display = match ? '' : 'none';
    });
});

</script>





		<%@ include file="../include/footer.jsp"%>