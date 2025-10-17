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
				<h2 class="text-white">find Id</h2>
				<p class="text-white-50 mt-2 mb-5">아이디 찾기</p>

				<div class="mb-2">

					<form action="/findIdResultAjax" method="POST"
						enctype="multipart/form-data">
						<div class="mb-3">
							<label class="form-label text-white">이름</label> <input
								type="text" class="form-control" name="memName" id="memName"
								placeholder="이름" required />
						</div>



						<div class="mb-3" id="emailSpace">
							<label class="form-label text-white">email</label> <input
								type="email" class="form-control" name="memEmail" id="memEmail"
								placeholder="e-mail" required />
							<button type="button" id="getEmailCode" name="getEmailCode"
								class="btn btn-block btn-info btn-sm">e-mail 코드 받기</button>
						</div>



						<button type="button" class="btn btn-primary" id="findId" disabled>Submit</button>
						<%-- <sec:csrfInput /> --%>
					</form>
					<div id="result"></div>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
					$(function () {
						let check = "";
						//참고 소스
						$("#findId")
							.on("click",
								function () {
									let memName = $("#memName").val();
							let memEmail = $("#memEmail").val();
							console.log("memName= ",memName);
							console.log("memEmail= ",memEmail);

							let data = {
									"memName": memName,
									"memEmail": memEmail
								};
							$.ajax({
								url: "/findIdResultAjax",
								contentType: "application/json;charset=utf-8",
								data: JSON.stringify(data),
								type: "POST",
								dataType: "json",
								success: function (result) {

									console.log("result=", result);
									alert("확인중");


									let findIdResult = "<label class='form-label text-white'>아이디는 "+result.memId+"</label>";
									findIdResult += `<button type='button' class='btn btn-secondary mt-3' onclick='location.href="/findPw"'>비밀번호 찾기</button>`;
									findIdResult += `<button type="button" class="btn btn-secondary mt-3" onclick="location.href='/signup'">회원가입</button>`;
									findIdResult += `<button type="button" class="btn btn-secondary mt-3" onclick="location.href='/login'">로그인</button>`;
									console.log("findIdResult=" + findIdResult);

// 									$("#emailSpace").append(codeChk);
									$("#result").append(findIdResult);
// 									$("#getEmailCode").html("e-mail 코드 다시 받기");
// 									$("#getEmailCode").removeAttr("disabled");

								},
								error: function (xhr, status, error) {
							        console.error("AJAX 요청 실패:", status, error);
									alert("아이디나 이메일이 옳지 않습니다. 다시 시도해주세요");

								}
							});

								});

						$("#emailSpace").on("click", "#codeChkBtn", function () {
							console.log("codeChkBtn눌림");

							let code = $("#code").val();
							let codeChk = $("#codeChk").val();
							console.log("code : ", code);
							console.log("codeChk : ", codeChk);
							if (check === codeChk) {
								alert("같습니다");
								$("#findId").removeAttr("disabled");


							} else {
								alert("달라");

							}
						});
						$("#getEmailCode")
							.on("click",
								function () {
								$("#code").remove();
								$("#codeChk").remove();
								$("#codeChkBtn").remove();

									let memEmail = $("#memEmail").val();
									console.log("memEmail : ", memEmail);
									let data = {
										"email": memEmail
									};
									$("#getEmailCode").attr("disabled", "disabled");
									$("#code").removeAttr("disabled",);

									$.ajax({
										url: "/api/mail/findId",
										contentType: "application/json;charset=utf-8",
										data: memEmail,
										type: "POST",
										dataType: "text",
										success: function (results) {
											alert("e메일을 보냈습니다");
											console.log("results : ", results);
											check = results;
											let code = "<input type='text' class='form-control' id='code' value=" + results + " placeholder='코드를 입력해주세요' required hidden />";
											let codeChk = "<input type='text' class='form-control' id='codeChk' placeholder='코드를 입력해주세요' required />"
											let codeChkBtn = "<button type='button' id='codeChkBtn'  class='btn btn-block btn-info btn-sm'>e-mail 코드 확인</button>"

											$("#emailSpace").append(code);

											$("#emailSpace").append(codeChk);
											$("#emailSpace").append(codeChkBtn);
											$("#getEmailCode").html("e-mail 코드 다시 받기");
											$("#getEmailCode").removeAttr("disabled");

										},
										error: function (xhr, status, error) {
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