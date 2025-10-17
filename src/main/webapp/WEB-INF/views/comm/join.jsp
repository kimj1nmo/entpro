<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- 
../ : views폴더(부모)
-->
<!-- ///// header 시작 ///// -->
<jsp:include page="../include/header_user2.jsp"></jsp:include>
<jsp:include page="../include/nav.jsp"></jsp:include>

<!-- ///// header 끝 ///// -->

<style>
section.content {
    position: relative; /* 문서 흐름 내 배치 */
    top: 110px; /* header와 nav의 총 높이 */
    padding: 30px;
}</style>
<script type="text/javascript">
  $(document).ready(function(){
      $('#submitJoin').click(function(){
          // CSRF 토큰 가져오기
          var csrfToken = $('input[name="${_csrf.parameterName}"]').val();
          var csrfHeader = 'X-CSRF-TOKEN'; // 기본 CSRF 헤더 이름

          var formData = new FormData($('#joinForm')[0]);

          $.ajax({
        	  url: groupNo + '/join',
              type: 'POST',
              data: formData,
              contentType: false,
              processData: false,
              beforeSend: function(xhr) {
                  xhr.setRequestHeader(csrfHeader, csrfToken);
              },
              success: function(response){
                  if(response.message === "커뮤니티 가입이 완료되었습니다!"){
                      var Toast = Swal.mixin({
                          toast: true,
                          position: 'top-end',
                          showConfirmButton: false,
                          timer: 3000
                      });
                      
                      Toast.fire({
                          icon: 'success',
                          title: '등록 성공!'
                      });
                      
                      setTimeout(function(){
                          location.href = "/create";
                      }, 3000);
                  } else {
                      var Toast = Swal.mixin({
                          toast: true,
                          position: 'top-end',
                          showConfirmButton: false,
                          timer: 3000
                      });
                      
                      Toast.fire({
                          icon: 'warning',
                          title: '등록 실패!'
                      });
                  }
              },
              error: function(){
                  alert('가입 중 오류가 발생했습니다.');
              }
          });
      });
  });

  </script>
<section class="content" style="max-width: 1200px; margin: 0 auto;">

  <div class="container-fluid">
    <h2>커뮤니티 가입</h2>
    <form id="joinForm" action="/join" method="post" enctype="multipart/form-data">
        <!-- CSRF 토큰 포함 -->
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <!-- 파일 업로드 -->
        <div class="form-group">
              <label for="uploadFiles">회원사진</label>
              <input type="file" class="form-control" id="uploadFiles" 
              		name="uploadFiles" value="" 
              		placeholder="회원사진" multiple />
       </div>
       <div class="form-group">
         <code>*</code><label for="commRegNick">닉네임:</label>
         <input type="text" class="form-control col-md-5" id="commRegNick" 
         		name="commRegNick" value="" required 
         		placeholder="닉네임" />
       </div>
        
        <!-- 닉네임 입력 -->
        <button type="button" id="submitJoin">가입하기</button>
    </form>
  </div>

  
    <!-- ///// content 끝 ///// -->
  </div><!-- /.container-fluid -->
</section>
<!-- /.content -->
    
<!-- ///// footer 시작 ///// -->
<%-- <jsp:include page="../include/footer_user2.jsp"></jsp:include> --%>
<!-- ///// footer 끝 ///// -->  
