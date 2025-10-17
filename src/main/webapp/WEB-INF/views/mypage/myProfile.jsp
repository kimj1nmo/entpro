<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 헤더 포함 -->
<jsp:include page="../include/header_user.jsp"></jsp:include>
<link href="/directlyCss/join.css" rel="stylesheet">
<link href="/directlyCss/commaside.css" rel="stylesheet">
<link href="/directlyCss/main.css" rel="stylesheet">
<link href="/directlyCss/modal.css" rel="stylesheet">
<link href="/directlyCss/commdetailmodal.css" rel="stylesheet">


<!-- <!-- Bootstrap CSS (필요 시 유지) -->
<!-- 	<link -->
<!-- 		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" -->
<!-- 		rel="stylesheet"> -->
<!-- 	<link -->
<!-- 		href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" -->
<!-- 		rel="stylesheet"> -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 아이콘 -->
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap JS (필요 시 유지) -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- SweetAlert2 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css"
	rel="stylesheet">

<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- 위버스에 포스트를 남겨보세요 -->
<link href="/directlyCss/main.css" rel="stylesheet">

<style>
section.content {
	position: relative; /* 문서 흐름 내 배치 */
	top: 10px; /* header와 nav의 총 높이 */
	padding: 20px;
}
</style>
<!-- Main Content -->
<section class="content" style="max-width: 1140px; margin: 0 auto;">
	<div class="container-fluid">
		<hr>
		<h3>프로필 변경</h3>
		<!-- /.card-header -->
		<!-- form start -->
		<form>
			<div class="card-body">
				<div class="form-group">
					<label for="exampleInputEmail1">이름</label> <input type="text"
						class="form-control" id="memName" placeholder="이름을 입력해주세요">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">이메일</label> <input type="email"
						class="form-control" id="memEmail" placeholder="이메일을 입력해주세요">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">비밀번호</label> <input
						type="password" class="form-control" id="memPw"
						placeholder="비밀번호를 입력해주세요">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">비밀번호 확인</label> <input
						type="password" class="form-control" id="memPwChk"
						placeholder="비밀번호를 다시 입력해주세요">
				</div>

				<div class="form-check">
					<label for="exampleInputPassword1">성별</label>
					<div>
						<input type="radio" name="memGender" value="0">남자 </label> <label>
							<input type="radio" name="memGender" value="1" checked>여자
						</label>
					</div>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">전화번호</label> <input type="text"
						class="form-control" id="memTel" placeholder="000-0000-0000">
				</div>
			</div>
			<br>
			<br>
			<!-- /.card-body -->
			<div style="display: flex; justify-content: flex-end;">
				<button type="button" id="memProfileUpdat" class="btn btn-primary">저장</button>
				<button type="button" onclick="goBack()" class="btn btn-warning">뒤로가기</button>
			</div>

		</form>
	</div>

</section>
<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">비밀번호 확인</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" onclick="goBack();">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<label for="password">비밀번호를 입력해주세요:</label> <input type="password"
					class="form-control" id="passwordModal1" placeholder="비밀번호">
			</div>
			<div class="modal-footer ">
				<button style="cursor: pointer;" type="button"
					class="btn btn-secondary" data-dismiss="modal" onclick="goBack();">취소</button>
				<button style="cursor: pointer;" type="button" id="checkPasswordBtn"
					class="btn btn-primary">확인</button>
			</div>
		</div>
	</div>
</div>

<!-- CSS로 모달 배경 수정 -->
<style>
.modal-backdrop {
	background-color: white !important; /* 배경을 흰색으로 설정 */
	opacity: 100 !important; /* 투명도 0으로 설정 */
}
</style>

<script type="text/javascript">
let memId;
$(document).ready(function() {
    $('#passwordModal').modal('show');
});
	$("#memProfileUpdat").on(
			"click",
			function() {
				let memTel = $("#memTel").val();
				let memName = $("#memName").val();
				let memEmail = $("#memEmail").val();
				let memPw = $("#memPw").val();
				let memPwChk = $("#memPwChk").val();
				let memGender = $("input[name='memGender']:checked").val(); // 성별 라디오 버튼 값
				console.log("memEmail",memEmail);
				console.log("memId",memId);

				// 빈 값 체크
				if (!memName || !memEmail || !memPw || !memPwChk || !memTel
						|| !memGender) {

					// 알림 표시
					let Toast = Swal.mixin({
						toast : true,
						position : 'top-end',
						showConfirmButton : false,
						timer : 1500
					});

					Toast.fire({
						icon : 'warning',
						title : `빈값을 입력해주세요`
					});

					return; // 함수 종료
				}

				// 전화번호 형식 체크
				let regMemTel = /^010-\d{4}-\d{4}$/;
				if (!regMemTel.test(memTel)) {
					console.log("형식에 맞지않습니다");

					var Toast = Swal.mixin({
						toast : true,
						position : 'top-end',
						showConfirmButton : false,
						timer : 3000
					});

					Toast.fire({
						icon : 'warning',
						title : '전화번호 형식에 맞지않습니다'
					});

					return; // 함수 종료
				}

				// 비밀번호 확인이 일치하는지 체크
				if (memPw !== memPwChk) {
					let Toast = Swal.mixin({
						toast : true,
						position : 'top-end',
						showConfirmButton : false,
						timer : 3000
					});

					Toast.fire({
						icon : 'warning',
						title : '비밀번호와 비밀번호 확인이 일치하지 않습니다.'
					});

					return; // 함수 종료
				}


				let data={
						"memId":memId,
						"memName":memName,
						"memTel":memTel,
						"memEmail":memEmail,
						"memPw":memPw,
						"memGender":memGender
						}

				$.ajax({
				    url: '/mypage/memProfileUpdat',
				    contentType: "application/json;charset=utf-8",
				    data: JSON.stringify(data),
				    type: "POST",
				    dataType: "json",
				    success: function(result) {
				        let Toast = Swal.mixin({
				            toast: true,
				            position: 'top-end',
				            showConfirmButton: false,
				            timer: 1500
				        });

				        Toast.fire({
				            icon: 'success',
				            title: '저장되었습니다.'
				        });

				        setTimeout(() => {
				            window.history.back();
				        }, 1500); // 알람 표시 후 1.5초 뒤 이동
				    },
				    error: function(xhr, status, error) {
				        console.error('입력에 실패하였습니다', error);

				        let Toast = Swal.mixin({
				            toast: true,
				            position: 'top-end',
				            showConfirmButton: false,
				            timer: 2000
				        });

				        Toast.fire({
				            icon: 'error',
				            title: '입력에 실패하였습니다.'
				        });
				    }
				});

			});

	function goBack() {
		window.history.back();
	}

	$(function() {
	     memId = `<%=session.getAttribute("memId") != null ? session.getAttribute("memId") : "Guest"%>`;

		$.ajax({
			url : '/api/userInfo',
			method : 'GET',
			success : function(memVO) {
				console.log("로그인 정보: ", memVO);
				memId = memVO.memId; // 서버에서 받은 사용자 정보
				console.log("memId: ", memId);

			},
			error : function(xhr, status, error) {
				console.error('로그인 정보 가져오기 실패:', error);
			}
		});
	});
	  $("#checkPasswordBtn").on("click", function() {
	        let enteredPassword = $("#passwordModal1").val();

	        let data={
					"memId" : memId,
					"memPw" : enteredPassword
			}
			$.ajax({
				url : '/api/memPwChk',
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				type : "POST",
				dataType : "json",
					success : function(result) {
						console.log("맞다고",result)

						if(result==1){
							console.log("맞다고",result)
						    $('#passwordModal').modal('hide');
						}
						let data={
								"memId" : memId
						}
						$.ajax({
							url : '/mypage/myProfileAjax',
							contentType : "application/json;charset=utf-8",
							data : JSON.stringify(data),
							type : "POST",
							dataType : "json",
								success : function(memberVO) {
									$("#memName").val(memberVO.memName);
									$("#memTel").val(memberVO.memTel);
									$("#memEmail").val(memberVO.memEmail);
									$("#memPw").val(memberVO.memPw);
									$("#memPwChk").val(memberVO.memPwChk);

								}

						});
					}

			});
	    });
	  document.getElementById("passwordModal1").addEventListener("keydown", function(event) {
	        if (event.key === "Enter") {
	            event.preventDefault(); // 기본 엔터 키 동작 방지 (폼 제출 방지)
	            document.getElementById("checkPasswordBtn").click(); // 확인 버튼 클릭
	        }
	    });

// 	  $(document).ready(function() {
//           $('#myInput').on('keydown', function(event) {
//               if (event.key === 'Enter') {
//               }
//           });
//       });
	  </script>
<!-- footer 포함 -->
<jsp:include page="../include/footer_user.jsp"></jsp:include>
