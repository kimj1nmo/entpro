<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header_user.jsp"%>

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<div class="reference-size"
	style="height: auto; width: 100%; padding: 20px; border: 2px solid #ccc; background-color: #f8f9fa;">
</div>
<!-- ///// content 시작 ///// -->

<section id="skills" class="skills section">

	<div class="container aos-init aos-animate" data-aos="fade-up"
		data-aos-delay="100">

		<div class="row">

			<div class="col-lg-6 d-flex align-items-center"></div>


		</div>

	</div>

</section>

<section class="d-flex vh-100">
	<div
		class="container-fluid row justify-content-center align-content-center">
		<div class="card bg-black" style="border-radius: 1rem;">
			<div class="card-body p-5 text-center">
				<h2 class="text-white">SIGN UP</h2>
				<p class="text-white-50 mt-2 mb-5">서비스 사용을 위한 회원 가입</p>

				<div class="mb-2">
					<!--
          요청URI : /user
          요청파라미터 : request{memId=z010,memName=개똥이10,memPw=java,uploadFiles=파일객체}
          요청방식 : post
           -->
					<form action="/user" method="POST" enctype="multipart/form-data">
						<!-- 토큰을 추가하여 CSRF 공격 방지 -->
						<div class="mb-3">
							<label class="form-label text-white">아이디</label> <input
								type="text" class="form-control" id="memId" name="memId" placeholder="아이디"
								required />
								<button type="button" id="idChk">아이디 중복 확인</button>
						</div>
						<div class="mb-3">
							<label class="form-label text-white">이름</label> <input
								type="text" class="form-control" name="memName" placeholder="이름"
								required />
						</div>
						<div class="mb-3">
							<label class="form-label text-white">Password</label> <input
								type="password" class="form-control" name="memPw"
								placeholder="비밀번호" required />
						</div>
						<div class="mb-3">
							<label class="form-label text-white ">성별</label>
							<div>
								<label class="form-label text-white"> 남자 <input
									type="radio" name="memGender" id="gender m" value="0" checked />
								</label> <label class="form-label text-white"> 여자 <input
									type="radio" name="memGender" id="gender f" value="1" />
								</label>
							</div>
						</div>
						<div class="mb-3" id="emailSpace">
							<label class="form-label text-white">email</label> <input
								type="email" class="form-control" name="memEmail" id="memEmail"
								placeholder="e-mail" required />
							<button type="button" id="getEmailCode" name="getEmailCode"
								class="btn btn-block btn-info btn-sm" disabled>e-mail 코드 받기</button>
							<!-- 						<input type="text" class="form-control" name="code"
								placeholder="코드를 입력해주세요" required /> -->
						</div>
						<div class="mb-3">
							<label class="form-label text-white">전화번호</label> <input
								type="text" class="form-control" name="memTel"
								placeholder="000-0000-0000" required />
						</div>


						<button type="submit" class="btn btn-primary" id="sub" disabled>Submit</button>
						<%--             <sec:csrfInput/> --%>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	$(function() {

		$("#idChk").on("click",function(){
			let memId = $("#memId").val();
			console.log(memId);
			$.ajax({
				url : "/idChk",
				contentType : "application/json;charset=utf-8",
				data : memId,
				type : "POST",
				dataType : "text",
				success : function(result) {
					console.log("체크확인",result)
					if(result==1){

					console.log("잇을때")
					}
					if(result==0){

					console.log("없을때")
					$("#memId").attr("disabled", true);

		            $("#getEmailCode").removeAttr("disabled");
					}

				},
				  error: function(xhr, status, error) {
			            console.error("AJAX 오류: ", error);
			            alert("아이디 값을 입력해주세요");
			        }
			});
		})
		let check="";
		//참고 소스
  $("#emailSpace").on("click", "#codeChkBtn", function() {
			console.log("codeChkBtn눌림");

			let code = $("#code").val();
			let codeChk = $("#codeChk").val();

			if(check===codeChk){
				alert("같습니다");
				$("#sub").removeAttr("disabled");

			}else{
				alert("달라");

			}
		});
		$("#getEmailCode")
				.on("click",
						function() {

						$("#code").remove();
						$("#codeChk").remove();
						$("#codeChkBtn").remove();
								let memEmail = $("#memEmail").val();
								console.log("memEmail : ", memEmail);

								$("#getEmailCode").attr("disabled","disabled");
								$("#code").removeAttr("disabled",);

								$.ajax({
											url : "/api/mail/signup",
											contentType : "application/json;charset=utf-8",
											data : memEmail,
											type : "POST",
											dataType : "text",
											success : function(results) {
												alert("e메일을 보냈습니다");
												console.log("results : ", results);
												check=results;
												let code = "<input type='text' class='form-control' id='code' value="+results+" placeholder='코드를 입력해주세요' required hidden />";
												let codeChk="<input type='text' class='form-control' id='codeChk' placeholder='코드를 입력해주세요' required />"
												let codeChkBtn="<button type='button' id='codeChkBtn'  class='btn btn-block btn-info btn-sm'>e-mail 코드 확인</button>"

												$("#emailSpace").append(code);

												$("#emailSpace").append(codeChk);
												$("#emailSpace").append(codeChkBtn);
												$("#getEmailCode").html("e-mail 코드 다시 받기");
												$("#getEmailCode").removeAttr("disabled");

											},
											  error: function(xhr, status, error) {
										            console.error("AJAX 오류: ", error);
										            alert("이메일 전송에 실패했습니다. 다시 시도해 주세요.");
										            // 오류 발생 시 버튼을 다시 활성화
										            $("#getEmailCode").removeAttr("disabled");
										        }
										});

						});

	});
</script>
<!-- ///// content 끝 ///// -->

<%@ include file="../include/footer_user.jsp"%>
