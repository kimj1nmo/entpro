<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header_user.jsp"%>

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- ///// content 시작 ///// -->

<section id="skills" class="skills section">
	<div class="container aos-init aos-animate" data-aos="fade-up"
		data-aos-delay="100">
		<div class="row">
			<div class="col-lg-6 d-flex align-items-center"></div>
		</div>
	</div>
</section>

<main class="main mainCenter">
  <section class="section sectionMargin">
    <div class="row justify-content-center min-vh-100">
      <div class="col-lg-4">
        <div class="card divHeight2">
          <div class="card-body">
            <h5 class="card-title">아이디 찾기</h5>
            <!-- Vertical Form -->
            <form action="/findIdResultAjax" method="POST" enctype="multipart/form-data">
              <div class="col-12">
                <label for="inputNanme4" class="form-label">이름</label>
                <input type="text" class="form-control" id="memName" name="memName"
									placeholder="이름" required />
              </div>
							<br>
							<div class="col-12">
                <label for="inputPassword4" class="form-label">이메일</label>
                <input type="email" class="form-control" id="memEmail" name="memEmail"
								placeholder="이메일" required />
              </div>
							<br>
							<div id="emailSpace" class="input-group"></div>
							<br><br><br>
							<div id="emailSpace2" class="d-flex justify-content-between">
								<button type="button" id="getEmailCode" name="getEmailCode"
									class="btn btn-block btn-info btn-sm text-white rounded-pill">이메일 코드 받기</button>
								<button id="findId" type="button" class="btn btn-info rounded-pill idWidth text-white" disabled>아이디 찾기</button>
							</div>

              <div class="text-center">
              </div>
            </form><!-- Vertical Form -->
          </div>
        </div>
        <hr>
        <div class="text-center">
					<div id="result" class="d-flex flex-column align-items-center"></div>
					<div id="result2" class="d-flex justify-content-center align-items-center gap-2"></div>
          <!-- <button type="button" class="btn btn-outline-info rounded-pill mt-3 me-4"
            onclick="location.href='/findId'">아이디 찾기</button> -->
          <!-- <button type="button" class="btn btn-outline-info rounded-pill mt-3 me-4"
            onclick="location.href='/findId'">비밀번호 찾기</button> -->
          <!-- <button type="button" class="btn btn-outline-info rounded-pill mt-3"
            onclick="location.href='/signup'">회원가입</button> -->
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


									let findIdResult = "<input type='text' class='form-control' value='아이디는 " + result.memId + "' readonly />"
									findIdResult2 = `<button type='button' class='btn btn-outline-info rounded-pill mt-3 me-2' onclick='location.href="/findPw"'>비밀번호 찾기</button>`;
									findIdResult3 = `<button type="button" class="btn btn-block btn-info text-white px-3 loginBtn mt-3" onclick="location.href='/login'">로그인</button>`;
									console.log("findIdResult=" + findIdResult);

// 									$("#emailSpace").append(codeChk);
									$("#result").html(findIdResult);
									$("#result2").html(findIdResult2);
									$("#result2").append(findIdResult3);
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
											alert("이메일을 보냈습니다");
											console.log("results : ", results);
											check = results;
											let code = "<input type='text' class='form-control' id='code' value=" + results + " placeholder='코드를 입력해주세요' required hidden />";
											let codeChk = `<input type='text' class='form-control' style='border-radius: 4px;' id='codeChk' placeholder='코드를 입력해주세요' required />`
											let codeChkBtn = "<button type='button' id='codeChkBtn'  class='btn btn-block btn-info btn-sm text-white rounded'>이메일 코드 확인</button>"
											$("#emailSpace").append(code);

											$("#emailSpace").append(codeChk);
											$("#emailSpace").append(codeChkBtn);
											$("#getEmailCode").html("코드 다시 받기");
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