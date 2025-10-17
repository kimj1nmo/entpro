<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 
../ : views폴더(부모)
 -->
<!-- ///// header 시작 ///// -->
<jsp:include page="../include/header_user2.jsp"></jsp:include>
<!-- ///// header 끝 ///// -->
<style>
section.content {
    position: relative; /* 문서 흐름 내 배치 */
    top: 110px; /* header와 nav의 총 높이 */
}</style>
<!-- Main content -->
<section class="content">
 <c:if test="${empty communityVO.commRegNick}">
        <script>
            // 모달창을 자동으로 띄우는 스크립트
            $(document).ready(function() {
                $('#joinModal').modal('show');
            });
        </script>
    </c:if>  
  <div class="container-fluid">
    <!-- ///// content 시작 ///// -->
    <a href="/1/feed">Group 1</a>
<a href="/2/feed">Group 2</a>
    
    <!-- ///// content 끝 ///// -->
  </div><!-- /.container-fluid -->
</section>
<!-- /.content -->
    
<!-- ///// footer 시작 ///// -->
<%-- <jsp:include page="../include/footer_user2.jsp"></jsp:include> --%>
<!-- ///// footer 끝 ///// -->  


