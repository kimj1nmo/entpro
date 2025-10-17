<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- <html> -->
<head>
  <title>전자화폐 충전</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    /* 기존 스타일들 그대로 유지 */
    body {
      margin: 0;
      font-family: 'Arial', sans-serif;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      background: linear-gradient(to bottom, #f5f7fa, #c3cfe2);
    }

    .container {
      text-align: center;
      max-width: 1200px;
      padding: 20px;
    }

    /* Title Styling */
    .title {
      font-size: 28px;
      font-weight: bold;
      color: #4a4a4a;
      margin-bottom: 20px;
    }

    /* Main Image Styling */
    .main-image {
      width: 180px;
      height: 180px;
      border-radius: 50%;
      object-fit: cover;
      margin: 0 auto 10px;
      box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
      border: 5px solid #fff;
      background: #fff;
    }

    /* Charge Text Styling */
    .charge-text {
      font-size: 20px;
      font-weight: bold;
      color: #4caf50;
      margin-bottom: 30px;
    }

    /* Options Layout */
    .options {
      display: flex;
      gap: 20px;
      justify-content: center;
      flex-wrap: wrap;
      margin-top: 20px;
    }

    /* Option Card Styles */
    .option {
      background: #fff;
      border-radius: 15px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      padding: 20px;
      text-align: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      width: 200px;
    }

    .option:hover {
      transform: translateY(-8px);
      box-shadow: 0 12px 20px rgba(0, 0, 0, 0.2);
    }

    /* Option Text Styles */
    .option-title {
      font-size: 18px;
      font-weight: bold;
      color: #333;
      margin-bottom: 10px;
    }

    .option-quantity {
      font-size: 16px;
      color: #666;
      margin-bottom: 10px;
    }

    .option-price {
      font-size: 18px;
      font-weight: bold;
      color: #4caf50;
      margin-bottom: 15px;
    }

    /* Charge Button */
    .charge-button {
      padding: 10px 15px;
      font-size: 14px;
      font-weight: bold;
      color: #fff;
      background: #4caf50;
      border: none;
      border-radius: 10px;
      cursor: pointer;
      transition: background-color 0.3s ease, transform 0.3s ease;
    }

    .charge-button:hover {
      background: #45a049;
      transform: scale(1.05);
    }
  </style>
</head>
<body>
  <div class="container">
    <!-- Title -->
    <div class="title">전자화폐 충전</div>

    <!-- Main Image -->
    <img src="/resources/upload/2024/jelley.png" alt="전자화폐 이미지" class="main-image">
    <div class="charge-text">충전</div>
    <input id="memId" hidden/>
    <!-- Options -->
    <div class="options">
      <!-- Option 1 -->
      <div class="option">
        <div class="option-title"></div>
        <div class="option-quantity">10000개</div>
        <div class="option-price">₩10,000</div>
        <button class="charge-button" data-amount="10000" data-cost="10000" id="charge">충전</button>
      </div>
      <!-- Option 2 -->
      <div class="option">
        <div class="option-title"></div>
        <div class="option-quantity">20000개</div>
        <div class="option-price">₩18,000</div>
        <button class="charge-button" data-amount="20000" data-cost="18000" id="charge">충전</button>
      </div>
      <!-- Option 3 -->
      <div class="option">
        <div class="option-title"></div>
        <div class="option-quantity">50000개</div>
        <div class="option-price">₩40,000</div>
        <button class="charge-button" data-amount="50000" data-cost="40000" id="charge">충전</button>
      </div>
      <!-- Option 4 -->
      <div class="option">
        <div class="option-title"></div>
        <div class="option-quantity">100000개</div>
        <div class="option-price">₩75,000</div>
        <button class="charge-button" data-amount="100000" data-cost="75000" id="charge">충전</button>
      </div>
    </div>
  </div>

  <script type="text/javascript">
<%--     let memId = "<%= session.getAttributec('memId') %>"; --%>
    let memId="${sessionScope.memId}";
    if (memId) {
      $("#memId").val(memId);
    } else {
      // 세션에 memId 값이 없을 경우 처리할 코드
      console.log("memId가 세션에 없습니다.");
    }


    window.addEventListener('message', function(event) {
      // 보낸 도메인 확인 (보안 강화)
      if (event.origin !== window.location.origin) return;

      memId = event.data?.memId;
      if (memId) {
          console.log(memId); // 받은 memId 값
          $("#memId").val(memId);
          // 메시지 처리 완료 후 이벤트 제거
          window.removeEventListener('message', arguments.callee);
          sessionStorage.setItem('memId', memId);

          // 세션에 저장된 값 확인
//           console.log(sessionStorage.getItem('memId'));  //
      }
    });

    $(document).on("click","#charge",function(){
		let amount= $(this).data("amount");
		let cost= $(this).data("cost");
        sessionStorage.setItem('cost', cost);
        sessionStorage.setItem('amount', amount);
        console.log(sessionStorage.getItem('cost'));  //
        console.log(sessionStorage.getItem('amount'));  //

		memId=$("#memId").val();
        console.log("memId={},amount={},cost={}",amount,cost,memId);

        let data ={
        		"memId":memId,
        		"amount":amount,
        		"cost":cost
        }
		//cost는 실제 금액 amount는 충전 금액
		$.ajax({
			url : "/mypage/chargeAmount",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "text",
			success : function(result) {
		        console.log("result",result);
		        if (result.startsWith("redirect:")) {
	                let redirectUrl = result.replace("redirect:", "").trim();
	                window.location.href = redirectUrl; // 해당 URL로 페이지 이동
	            }
			}
		});
    });
    function noEvent() {
    	if (event.keyCode == 116) {
    	event.keyCode= 2;
    	return false;
    	}
    	else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
    	{
    	return false;
    	}
    	}
    	document.onkeydown = noEvent;
  </script>
</body>
</html>
<body oncontextmenu="return false">

