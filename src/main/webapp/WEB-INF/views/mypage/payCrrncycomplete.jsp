<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>결제 완료</title>
  <script>
    window.onload = function () {
      // 일정 시간 후 창 닫기 (예: 1초 후)
      setTimeout(function () {
        // 부모 창이 존재하면 새로고침
        if (window.opener && !window.opener.closed) {
          window.opener.location.reload();
        }
        // 현재 창 닫기
        window.close();
      }, 1000);
    };
  </script>
</head>

<!-- <body> -->
<!--   <h1>결제가 완료되었습니다.</h1> -->
<!--   <p>창이 곧 닫힙니다...</p> -->
<!-- </body> -->
</html>

<!-- <script>
  const orderData = {
    orderName: "상품명",
    orderTotalPrice: 10000,
    pgToken: "example_pg_token",
  };

  // 부모 창으로 데이터 전달
  if (window.opener) {
    window.opener.postMessage(orderData, "*"); // 부모 창으로 메시지 전달
  }

  // 팝업 창 닫기
  window.close();
</script>
 -->