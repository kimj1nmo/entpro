<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- ///// header 시작 ///// -->
<jsp:include page="../include/header_user2.jsp"></jsp:include>
<jsp:include page="../include/nav.jsp"></jsp:include>

<!-- ///// header 끝 ///// -->
<style>
section.content {
    position: relative; /* 문서 흐름 내 배치 */
    top: 110px; /* header와 nav의 총 높이 */
    padding:30px;
}</style>
<section class="content" style="max-width: 1200px; margin: 0 auto;">
<input type="hidden" id="groupNo" name="groupNo" value="${groupNo}" />
<p>GroupNo: ${groupNo}</p>
<!-- 	로그인 테스트 -->
	 <c:if test="${empty loginUser}">
	 <p>로그인하세요</p>
	 </c:if>
	<div class="container-fluid">
		<h2>게시글 작성</h2>
		<form id="frm" onsubmit="submitForm(event)"
			enctype="multipart/form-data">
			<!-- CSRF 토큰 포함 -->
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

			<!-- 내용 -->
			<label for="commCn">내용</label>
			<textarea id="commCn" name="commCn" rows="10" cols="50" required></textarea>
			<br> <br>

			<!-- 멤버십 전용 여부 -->
			<label for="memshipState">멤버십 전용</label> <input type="checkbox"
				id="memshipState" name="memshipState" value="1" /> 멤버십 전용 (체크하면 1,
			아니면 0)<br> <br>

			<!-- 파일 업로드 -->
			<label for="uploadFiles">첨부파일</label> <input type="file"
				id="uploadFiles" name="uploadFiles" multiple /><br> <br>

			<!-- 제출 버튼 -->
			<button type="submit">게시글 등록</button>
		</form>
		    <a href="/${groupNo}/feed">게시글 목록</a>
		
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- SweetAlert2 추가 -->
	<script type="text/javascript">
  async function submitForm(event) {
      event.preventDefault(); // 기본 폼 제출 동작 방지

      // CSRF 토큰 읽기
      const csrfToken = document.querySelector('input[name="${_csrf.parameterName}"]').value;
      const csrfHeader = 'X-CSRF-TOKEN'; // 기본 CSRF 헤더 이름

      // 폼 데이터 가져오기
      const formData = new FormData(document.getElementById("frm"));
      const groupNo = document.getElementById('groupNo').value; // groupNo 값을 읽음

      console.log('GroupNo:', groupNo);
//       console.log(${result.commNo}); // 값 확인
      try {
          // 서버로 데이터 전송
        const response = await fetch(`/${groupNo}/create`, { // URL에 groupNo 포함
              method: 'POST',
              body: formData,
              headers: {
                  [csrfHeader]: csrfToken
              },
              credentials: 'same-origin' // 쿠키 포함
          });

        if (!response.ok) {
            console.error('Response not OK:', response.statusText);
            Swal.fire({
                icon: 'error',
                title: '서버 요청 실패',
                text: '게시글 등록 중 문제가 발생했습니다.',
            });
            return;
        }

        const result = await response.json();
        console.log('Result:', result); // 응답 데이터 디버깅

        if (result.result > 0) {
            console.log("Redirecting to detail page with commNo:", result.commNo); // 디버깅 로그 추가

            Swal.fire({
                icon: 'success',
                title: '등록 성공!',
                showConfirmButton: false,
                timer: 3000,
            }).then(() => {
            	window.location.href = `/${groupNo}/detail?commNo=`+result.commNo; // 올바르게 result.commNo 사용
            	
            });
        } else {
            Swal.fire({
                icon: 'warning',
                title: '등록 실패!',
                text: result.message,
                showConfirmButton: false,
                timer: 3000,
            });
        }
    } catch (error) {
        console.error('네트워크 오류:', error);
        Swal.fire({
            icon: 'error',
            title: '네트워크 오류 발생',
            text: '게시글 등록 중 네트워크 문제로 실패했습니다.',
        });
    }
}
  </script>
	<!-- ///// content 끝 ///// -->
	</div>
	<!-- /.container-fluid -->
</section>
<!-- /.content -->

<!-- ///// footer 시작 ///// -->
<%-- <jsp:include page="../include/footer_user2.jsp"></jsp:include> --%>
<!-- ///// footer 끝 ///// -->
