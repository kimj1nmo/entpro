<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header_user.jsp"%>

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- sweetAlert -->
<link rel="stylesheet"
	href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>


<!-- ///// content 시작 ///// -->
<section class="section sectionMargin2">
	<div class="row justify-content-center min-vh-100">
		<div class="col-lg-4">
			<div class="card divHeight3">
				<div class="card-body">
					<h5 class="card-title">회원가입<button type="button" id="previewBtn"  class="btn btn-warning">시연용</button>
					</h5>
						<script type="text/javascript">
						// 시연용 값 채워질 버튼
						$("#previewBtn").on("click", function(){
						   $("#memId").val("skyView1203");
						   $("#memName").val("정하은");
						   $("#memPw").val("java");
						   $("#memBir2").val("2000-01-01");
						   $("#memEmail").val("dditdockertest@gmail.com");
						   $("#memTel").val("010-5420-5340");
						});
						</script>
					<!-- Vertical Form -->
					<form action="/user" method="POST" enctype="multipart/form-data">
						<label for="inputPassword4" class="form-label">아이디</label>
						<div class="col-12 input-group">
							<input type="text" class="form-control" id="memId" name="memId"
							placeholder="아이디" required />
							<button type="button" class="btn btn-info idWidth text-white" id="idChk">아이디 중복 확인</button>
						</div>
						<br>
						<div class="col-12">
							<label for="inputNanme4" class="form-label">이름</label>
							<input type="text" class="form-control" id="memName" name="memName"
								placeholder="이름" required />
						</div>
						<br>
						<div class="col-12">
							<label for="inputNanme4" class="form-label">비밀번호</label>
							<input type="password" class="form-control" name="memPw"
								placeholder="비밀번호" required />
						</div>
						<div class="col-12">
							<label for="inputNanme4" class="form-label">생일</label>
							<input type="date" class="form-control" name="memBir2" id="memBir2"
								placeholder="생일" required />
						</div>
						<br>
						<div class="mb-3">
							<label class="form-label">성별</label>
							<div>
								<label class="form-label"> 남자 <input type="radio" name="memGender" id="gender m" value="0" checked />
								<label class="form-label"> 여자 <input type="radio" name="memGender" id="gender f" value="1" />
							</div>
						</div>
						<label class="form-label">email</label>
						<div class="mb-3 input-group" id="emailSpace">
							<input type="email" class="form-control" name="memEmail" id="memEmail"
								placeholder="e-mail" style="border-radius: 5px;" required />
							<button type="button" id="getEmailCode" name="getEmailCode"
								class="btn btn-block btn-info btn-sm" disabled>e-mail 코드 받기</button>
							<br>
						</div>
						<div class="mb-3">
							<label class="form-label text-white">전화번호</label> <input
								type="text" class="form-control" name="memTel" id="memTel"
								placeholder="000-0000-0000" required />
						</div>

						<div id="emailSpace" class="d-flex justify-content-between"></div>
						<br>
						<div id="emailSpace2" class="d-flex justify-content-between" style="max-width: 100px;">
							<button id="sub" type="submit" class="btn btn-info rounded-pill idWidth text-white" disabled>회원가입</button>
						</div>
						</form>
						<br><br>
						<div class="text-center">
						</div>
					<!-- Vertical Form -->
				</div>
			</div>
			<hr>
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
					Swal.fire({
						  icon: "error",
						  title: "이미 사용중인 ID입니다.",
						});

					}
					if(result==0){

					console.log("없을때")
					// $("#memId").attr("disabled", true);
					Swal.fire({
						  icon: "success",
						  title: "사용가능한 ID입니다.",
						});

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
    console.log("codeChkBtn 눌림");

    let code = $("#code").val();
    let codeChk = $("#codeChk").val();

    if (code === codeChk) {
        Swal.fire({
            title: '입력한 코드가 같습니다',
            text: '',
            icon: 'success',
            position: 'top-end', // 왼쪽 상단 위치
            showConfirmButton: false,
            timer: 1500,
            toast: true, // 토스트 모드 활성화
            width: '300px' // 가로 길이 설정
        }).then(() => {
            $("#sub").removeAttr("disabled");
        });

    } else {
        Swal.fire({
            title: '입력한 코드가 다릅니다',
            text: '',
            icon: 'error',
            position: 'top-end',
            showConfirmButton: false,
            timer: 1500,
            toast: true,
            width: '300px'
        });
    }
});

$("#getEmailCode").on("click", function() {
    $("#code, #codeChk, #codeChkBtn").remove();  // 기존 입력칸 제거
    let memEmail = $("#memEmail").val();
    console.log("memEmail : ", memEmail);

    $("#getEmailCode").attr("disabled", "disabled"); // 버튼 비활성화

    // SweetAlert2 로딩 화면 (이메일 전송 중)
    Swal.fire({
        title: '이메일 전송 중...',
        text: '잠시만 기다려 주세요.',
        allowOutsideClick: false,
        didOpen: () => {
            Swal.showLoading(); // 로딩 애니메이션 표시
        }
    });

    $.ajax({
        url: "/api/mail/signup",
        contentType: "application/json;charset=utf-8",
        data: memEmail,
        type: "POST",
        dataType: "text",
        success: function(results) {
            console.log("results : ", results);
            check = results;

            let code = "<input type='text' class='form-control' id='code' value=" + results + " placeholder='코드를 입력해주세요' required hidden />";
            let codeChk = "<input type='text' class='form-control' id='codeChk' placeholder='' required />";
            let codeChkBtn = "<button type='button' id='codeChkBtn' class='btn btn-block btn-info btn-sm'>이메일 코드 확인</button>";

            $("#emailSpace").append(code, codeChk, codeChkBtn);
            $("#getEmailCode").html("이메일 다시 받기").removeAttr("disabled"); // 버튼 활성화

            // 이메일 전송 성공 알림
            Swal.fire({
                icon: 'success',
                title: '이메일이 전송되었습니다!',
                showConfirmButton: false,
                timer: 1500
            });
        },
        error: function(xhr, status, error) {
            console.error("AJAX 오류: ", error);

            // 이메일 전송 실패 알림
            Swal.fire({
                icon: 'error',
                title: '이메일 전송 실패!',
                text: '다시 시도해 주세요.',
                showConfirmButton: false,
                timer: 2000
            });

            $("#getEmailCode").removeAttr("disabled"); // 버튼 다시 활성화
        }
    });
});


	});
</script>
<!-- ///// content 끝 ///// -->
<!-- 로딩 화면 -->


<%@ include file="../include/footer_user.jsp"%>
