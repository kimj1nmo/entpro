<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | Dashboard</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/adminlte/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<!--   <link rel="stylesheet" href="/adminlte/plugins/jqvmap/jqvmap.min.css"> -->
<!-- Theme style -->
<link rel="stylesheet" href="/adminlte/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="/adminlte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="/adminlte/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="/adminlte/plugins/summernote/summernote-bs4.min.css">

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- 아이콘 CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<!-- 직접 추가한 CSS -->
<link rel="stylesheet" href="/directlyCss/header.css">


</head>



<style>
table th {
	text-align: center;
}
</style>


<body class="hold-transition layout-top-nav">
	<div class="wrapper">

		<!-- Navbar -->


		<!-- Content Wrapper. Contains page content -->

		<!-- /.content-wrapper -->
		<!-- 모든 페이지에 이거 추가해야함 -->
		<div class="content-wrapper">
			<!--     Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6"></div>
						<!-- /.col -->
						<div class="col-sm-6"></div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
			<!-- sweetAlert -->
			<link rel="stylesheet"
				href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
			<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
			<!-- ///// content 시작 ///// -->

			<section class="content">
				<div class="container-fluid">
					<!-- ///// content 시작 ///// -->
					<h3>오디션 신청</h3>
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<div class="card-tools">
										<div class="input-group input-group-sm" style="width: 150px;">
											<input type="text" name="keyword" value="${param.keyword}"
												class="form-control float-right" placeholder="검색어 입력" />

											<div class="input-group-append">
												<button type="button" ID="btnSearch" class="btn btn-default">
													<i class="fas fa-search"></i>
												</button>

											</div>
										</div>
										<!-- /// 검색 끝 /// -->
									</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body table-responsive p-0">
									<!-- 성명으로 오름차순 정렬 -->
									<table class="table table-bordered table-hover">
										<thead>
											<tr>
												<th id="gdsCtgryNm">이름</th>
												<th id="gdsNm">신청 오디션</th>
												<th id="gdsPrice">오디션 신청 날짜</th>
											</tr>
										</thead>
										<tbody id="tby">


										</tbody>
									</table>
								</div>
								<div class="card-body table-responsive p-0" id="divDetailArea">

									<div class="card-footer" id="divPagingArea"></div>

								</div>
								<div class="col-12"
									style="justify-content: right; display: flex;">

									<a data-toggle="modal" data-target="#modal-audReqst"
										class="btn btn-primary" style="margin-right: 10px;">신청</a> <br>
									<button class="btn btn-primary" onclick="window.close()">나가기</button>
								</div>
							</div>
							<!-- /.card-body -->
							<!-- card-footer 시작 -->
						</div>
						<!-- card-footer 끝 -->
					</div>
					<!-- /.card -->




					<!-- ///// content 끝 ///// -->
				</div>
				<!-- /.container-fluid -->
			</section>



			<div class="modal fade" id="modal-audReqstDetail"
				style="display: none;" aria-hidden="true">
				<div class="modal-dialog modal-xl">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">신청 내역</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="card-body">
								<div class="form-group">
									<div class="select-container">
										<!-- 커스텀 셀렉트 박스 -->
										<!-- 										<select class="custom-select" id="audNmReqstDetail"> -->
										<div id="audNmReqstDetail"></div>
										<!-- 										</select> -->

									</div>
								</div>

								<div
									style="display: flex; justify-content: space-between; align-items: center; gap: 15px; margin-top: 10px; margin-bottom: 10px;">
									<div class="select-container">
										<!-- 커스텀 셀렉트 박스 -->
										<select class="custom-select" id="audTypeReqstDetail" disabled>
											<option value="0">오디션 종류 선택</option>
											<option value="1">통합</option>
											<option value="2">춤</option>
											<option value="3">노래</option>
											<option value="4">랩</option>
										</select>
									</div>

									<!-- Label (50% 공간 차지) -->
									<label for="exampleInputEmail1"
										style="flex: 1; text-align: right; padding-right: 10px;">신청자</label>

									<!-- Input (50% 공간 차지) -->
									<div class="form-group" style="flex: 1;">
										<input type="text" class="form-control"
											id="audReqstNmReqstDetail" value="" placeholder="신청자"
											style="width: 100%; padding: 10px;" disabled>
									</div>
								</div>
								<div
									style="display: flex; justify-content: space-between; align-items: center; gap: 15px; margin-top: 10px; margin-bottom: 10px;">
									<div class="select-container">
										<!-- 커스텀 셀렉트 박스 -->
										<select class="custom-select" id="audReqstGenReqstDetail"
											disabled>
											<option value="1">남자</option>
											<option value="2">여자</option>

										</select>
									</div>

									<!-- Label (50% 공간 차지) -->
									<label for="exampleInputEmail1"
										style="flex: 1; text-align: right; padding-right: 10px;">전화번호</label>

									<!-- Input (50% 공간 차지) -->
									<div class="form-group" style="flex: 1;">
										<input type="text" class="form-control"
											id="audReqstTelReqstDetail" value="" placeholder="전화번호"
											style="width: 100%; padding: 10px;" disabled>
									</div>
								</div>
								<div
									style="display: flex; justify-content: space-between; align-items: center; gap: 15px; margin-top: 10px; margin-bottom: 10px;">
									<label for="exampleInputEmail1">주소</label> <input type="text"
										class="form-control" id="audReqstAddReqstDetail"
										placeholder="신청자 주소" disabled
										style="flex: 1; margin-right: 10px; padding: 10px;"> <label
										for="exampleInputEmail1">이메일</label> <input type="email"
										class="form-control" id="audReqstEmailReqstDetail"
										placeholder="신청자 이메일" style="flex: 1; padding: 10px;" disabled>
								</div>

								<div
									style="width: 100%; height: 200px; border: 1px solid #ccc; padding: 10px;">
									<textarea id="audReqstDtlsReqstDetail" disabled
										style="width: 100%; height: 100%; box-sizing: border-box; border: none; padding: 10px; font-size: 14px; resize: none;"></textarea>
								</div>


								<div>
									<input id="audReqstNoDetail" hidden>
								</div>
								<div>


									<div id="audReqstFileReqstDetail"></div>

								</div>

							</div>

						</div>
						<div class="modal-footer justify-content-end" id="aud">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">나가기</button>
							<!-- 						<button type="button" class="btn btn-primary" id="audReqstInsert"></button> -->
							<button type="button" class="btn btn-danger"
								id="audReqstDetailDel">삭제하기</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- 오디션 신청 내역 보기 -->

			<div class="modal fade" id="modal-audReqst" style="display: none;"
				aria-hidden="true">
				<div class="modal-dialog modal-xl">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">오디션 신청하기</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="card-body">
								<div class="form-group">
									<div class="select-container">
										<!-- 커스텀 셀렉트 박스 -->
										<select class="custom-select" id="audNmReqst">

										</select>
									</div>
								</div>

								<div
									style="display: flex; justify-content: space-between; align-items: center; gap: 15px; margin-top: 10px; margin-bottom: 10px;">
									<div class="select-container">
										<!-- 커스텀 셀렉트 박스 -->
										<select class="custom-select" id="audTypeReqst" disabledd>
											<option value="0">오디션 종류 선택</option>
											<option value="1">통합</option>
											<option value="2">춤</option>
											<option value="3">노래</option>
											<option value="4">랩</option>
										</select>
									</div>

									<!-- Label (50% 공간 차지) -->
									<label for="exampleInputEmail1"
										style="flex: 1; text-align: right; padding-right: 10px;">신청자</label>

									<!-- Input (50% 공간 차지) -->
									<div class="form-group" style="flex: 1;">
										<input type="text" class="form-control" id="audReqstNmReqst"
											value="" placeholder="신청자"
											style="width: 100%; padding: 10px;">
									</div>
								</div>
								<div
									style="display: flex; justify-content: space-between; align-items: center; gap: 15px; margin-top: 10px; margin-bottom: 10px;">
									<div class="select-container">
										<!-- 커스텀 셀렉트 박스 -->
										<select class="custom-select" id="audReqstGenReqst">
											<option value="1">남자</option>
											<option value="2">여자</option>

										</select>
									</div>

									<!-- Label (50% 공간 차지) -->
									<label for="exampleInputEmail1"
										style="flex: 1; text-align: right; padding-right: 10px;">전화번호</label>

									<!-- Input (50% 공간 차지) -->
									<div class="form-group" style="flex: 1;">
										<input type="text" class="form-control" id="audReqstTelReqst"
											value="" placeholder="전화번호"
											style="width: 100%; padding: 10px;">
									</div>
								</div>
								<div
									style="display: flex; justify-content: space-between; align-items: center; gap: 15px; margin-top: 10px; margin-bottom: 10px;">
									<label for="exampleInputEmail1">주소</label> <input type="text"
										class="form-control" id="audReqstAddReqst"
										placeholder="신청자 주소"
										style="flex: 1; margin-right: 10px; padding: 10px;"> <label
										for="exampleInputEmail1">이메일</label> <input type="email"
										class="form-control" id="audReqstEmailReqst"
										placeholder="신청자 이메일" style="flex: 1; padding: 10px;">
								</div>

								<div
									style="width: 100%; height: 200px; border: 1px solid #ccc; padding: 10px;">
									<textarea id="audReqstDtlsReqst"
										style="width: 100%; height: 100%; box-sizing: border-box; border: none; padding: 10px; font-size: 14px; resize: none;"></textarea>
								</div>

								<div
									style="display: flex; justify-content: space-between; align-items: center; gap: 15px; margin-top: 10px; margin-bottom: 10px;">
									<label for="exampleInputEmail1">비밀번호</label> <input
										type="password" class="form-control" id="audReqstPwReqst"
										placeholder="비밀번호"
										style="flex: 1; margin-right: 10px; padding: 10px;">

								</div>
								<div>

									<input type="file" class="form-control" id="uploadFiles"
										name="uploadFiles" value="" placeholder="회원사진" multiple />
									<div id="divImage"></div>

								</div>

							</div>

						</div>
						<div class="modal-footer justify-content-end" id="aud">
							<button type="button" id="previewBtn" class="btn btn-warning">시연용</button>
							<script type="text/javascript">
                  // 시연용 값 채워질 버튼
                  $("#previewBtn").on("click", function(){
                 	  $("#audNmReqst").val(1);
              	    $("#audTypeReqst").val(2); // 오디션 종류: 춤
              	    $("#audReqstNmReqst").val("김민수"); // 신청자 이름
              	    $("#audReqstGenReqst").val(1); // 성별: 남자
              	    $("#audReqstTelReqst").val("010-9876-5432"); // 전화번호
              	    $("#audReqstEmailReqst").val("dditdockertest@gmail.com"); // 이메일
              	    $("#audReqstAddReqst").val("서울특별시 강남구 삼성동 123-45"); // 주소
              	    $("#audReqstDtlsReqst").val("어릴 때부터 춤을 좋아했고, 다양한 무대 경험을 쌓아왔습니다. 이번 오디션을 통해 제 실력을 인정받고 싶습니다. 최선을 다하겠습니다!"); // 신청 상세 내용
              	    $("#audReqstPwReqst").val("java");
                  });
                  </script>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="audReqstInsert" data-dismiss="modal">신청</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- 오디션 신청 내역 끝 -->


			<div class="modal fade" id="modal-password-check" tabindex="-1"
				role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">비밀번호 확인</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="password" class="form-control" id="password-input"
								placeholder="비밀번호 입력">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary"
								id="btn-check-password">확인</button>
						</div>
					</div>
				</div>
			</div>

			<script type="text/javascript">

	    let audReqstNm = "";
	    let audReqstPw = "";
	    let audReqstNo = "";
		$(document).on("click", "#audReqstDetail", function () {
		     audReqstNm = $(this).text();
		     audReqstPw = $(this).data("aud-reqst-pw");
		     audReqstNo = $(this).data("aud-reqst-no");

		     console.log("audReqstNm",audReqstNm);
		     console.log("audReqstPw",audReqstPw, typeof audReqstPw);
		     console.log("audReqstNo",audReqstNo, typeof audReqstNo);
		    $("#password-input").val("");
		    $("#modal-password-check").modal("show");
		});

		$("#btn-check-password").on("click", function () {
		     enteredPw = $("#password-input").val();
		     console.log("enteredPw",enteredPw,  typeof enteredPw);

		    if (String(enteredPw).trim() === String(audReqstPw).trim()) {
		        $("#modal-password-check").modal("hide");

		        // 신청 내역 모달을 띄우고 데이터 설정
		        $("#audReqstNmReqst").val(audReqstNm);

		        let data={
		        		"audReqstNo":audReqstNo
		        }



		        $.ajax({
		            url: "/getReqstDetailAjax",
		            contentType: "application/json;charset=utf-8",
		            data: JSON.stringify(data),
		            type: "POST",
		            dataType: "json",
		            success: function (reqstVO) {
		            	console.log("reqstVO",reqstVO);

		    		    $("#audNmReqstDetail").html(reqstVO.audNm);
		    		    $("#audTypeReqstDetail").val(reqstVO.audType);
		    		    $("#audReqstNmReqstDetail").val(reqstVO.audReqstNm);
		    		    $("#audReqstGenReqstDetail").val(reqstVO.audReqstGen);
		    		    $("#audReqstTelReqstDetail").val(reqstVO.audReqstTel);
		    		    $("#audReqstEmailReqstDetail").val(reqstVO.audReqstEmail);
		    		    $("#audReqstAddReqstDetail").val(reqstVO.audReqstAdd);
		    		    $("#udReqstDtlsReqstDetail").val(reqstVO.audReqstDtls);
		    		    $("#audReqstPwReqstDetail").val(reqstVO.audReqstPw);
		    		    $("#audReqstNoDetail").val(reqstVO.audNo);

		    		    if (!reqstVO.fileGroupVO || !reqstVO.fileGroupVO.fileDetailVOList) {
		                    $("#file").html("<p>파일이 없습니다.</p>");
		                } else {
		                    $("#audReqstFileReqstDetail").html(""); // 기존 콘텐츠 초기화
		                    $.each(reqstVO.fileGroupVO.fileDetailVOList, function (idx, file) {
		                        console.log("file:", file);

		                        let fileMime = file.fileMime;
		                        let fileUrl = file.fileSaveLocate; // 파일 URL 생성
		                        let fileDiv = $("#audReqstFileReqstDetail"); // 기존 div 선택

		                     // 새로운 div 생성 (각 파일마다 개별적으로 관리)
		                     let fileWrapper = $("<div></div>").css({ "margin-bottom": "10px" });

		                     if (fileMime.startsWith("image/")) {
		                         console.log("aa", fileUrl);
		                         fileWrapper.append(`<img src="\${fileUrl}" alt="이미지 파일" style="max-width: 60%; height: auto;">`);
		                     } else if (fileMime.startsWith("audio/")) {
		                         fileWrapper.append(`
		                             <audio controls>
		                                 <source src="\${fileUrl}" type="${fileMime}">
		                                 Your browser does not support the audio element.
		                             </audio>
		                         `);
		                     } else if (fileMime.startsWith("video/")) {
		                         fileWrapper.append(`
		                             <video controls style="max-width: 100%; height: auto;">
		                                 <source src="\${fileUrl}" type="${fileMime}">
		                                 Your browser does not support the video element.
		                             </video>
		                         `);
		                     } else {
		                         fileWrapper.append(`<p>지원되지 않는 파일 형식입니다.</p>`);
		                     }

		                     // 개별 파일 요소 추가
		                     fileDiv.append(fileWrapper);

		                    });
		                }
		            }})


		        $("#modal-audReqstDetail").modal("show");
		    } else {
		        Swal.fire({
		            icon: "error",
		            title: "비밀번호 불일치",
		            text: "입력한 비밀번호가 일치하지 않습니다.",
		        });
		    }
		});

function nvl(expr1, expr2) {

	if (expr1 === undefined || expr1 == null || expr1 == "") {
		expr1 = expr2;
	}
	return expr1;
}

let keyword="";
let sortName="groupNo";
let mode="0";
let audition;
$(function(){
	$("#uploadFiles").on("change",handleImg);

	getReqstList("1", "","0",sortName);


	  $.ajax({
	        url: '/getAudList',  // 데이터를 가져올 API
	        method: 'GET',
	        success: function(response) {
	            console.log("response", response);
	            let str = `<option value="0">오디션 선택</option>`;
	            $.each(response, function(idx, AuditionVO) {
	                str += `<option value="\${AuditionVO.audNo}" class="selectAud"  data-type="\${AuditionVO.audType}">\${AuditionVO.audNm}</option>`;
	            });
	            $("#audNmReqst").html(str);
	            $("#audNmReqstDetail").html(str);
	           audition = response;  // 전역 변수로 저장하여 이후 검색에 사용
	            console.log("audition", audition);
	        },
	        error: function(xhr, status, error) {
	            console.error("오류 발생:", error);
	        }
	    });
	});
$("#modal-audReqstDetail").on("shown.bs.modal", function () {
    $(this).find(".modal-body").css({
        "max-height": "80vh",
        "overflow-y": "auto"
    });
});
$("#audReqstDetailDel").on("click", function() {




	 Swal.fire({
	        title: "정말 삭제하시겠습니까?",
	        text: "이 작업은 되돌릴 수 없습니다!",
	        icon: "warning",
	        showCancelButton: true,
	        confirmButtonColor: "#d33",
	        cancelButtonColor: "#3085d6",
	        confirmButtonText: "네, 삭제하겠습니다",
	        cancelButtonText: "취소"
	    }).then((result) => {
	        if (result.isConfirmed) {
	        	 let data={
	        	     		"audReqstNo":audReqstNo
	        	     }

	            console.log("data : ", data);
	            $.ajax({
	                url: "/audReqstDetailDelAjax",
	                contentType: "application/json;charset=utf-8",
	                data: JSON.stringify(data),
	                type: "POST",
	                dataType: "json",

	                success: function (result) {
	                    console.log("result : ", result);

	                    if (result == 1) { // 성공
	                        Swal.fire({
	                            icon: 'success',
	                            title: '삭제되었습니다',
	                            showConfirmButton: false,
	                            timer: 3000
	                        });

	                        // 3초 후 페이지 이동
	                        setTimeout(() => {
	                            location.href = "/auditionReqstCreate";
	                        }, 3000);
	                    } else { // 실패
	                        Swal.fire({
	                            icon: 'warning',
	                            title: '삭제가 되지 않았습니다',
	                            showConfirmButton: false,
	                            timer: 3000
	                        });
	                    }
	                },
	                error: function (xhr, status, error) {
	                    console.log("xhr : ", xhr);
	                    console.log("status : ", status);
	                    console.log("error : ", error);

	                    Swal.fire({
	                        icon: 'error',
	                        title: '오류가 발생했습니다.',
	                        showConfirmButton: false,
	                        timer: 3000
	                    });
	                }
	            });
	        }
	    });

})
//아티스트 정보 비동기 추가
$("#audReqstInsert").on("click", function() {
	console.log("오디션신청 정보 넣기");

	//1. 가상 폼(이미지 포함) <form></form>
	let formData = new FormData();

	//2. 엘리먼트들을 가상 폼에 넣기
	let audNo = $("#audNmReqst").val();
	let audReqstNm = $("#audReqstNmReqst").val();
	let audReqstAdd = $("#audReqstAddReqst").val();
	let audReqstPw = $("#audReqstPwReqst").val();
	let audReqstEmail = $("#audReqstEmailReqst").val();
	let audReqstDtls = $("#audReqstDtlsReqst").val();
	let audReqstTel = $("#audReqstTelReqst").val();
	let audReqstGen = $("#audReqstGenReqst").val();

	formData.append("audNo", audNo);
	formData.append("audReqstNm", audReqstNm);
	formData.append("audReqstAdd", audReqstAdd);
	formData.append("audReqstPw", audReqstPw);
	formData.append("audReqstEmail", audReqstEmail);
	formData.append("audReqstDtls", audReqstDtls);
	formData.append("audReqstTel", audReqstTel);
	formData.append("audReqstGen", audReqstGen);

	//3. 파일 엘리먼트를 선택하여 가상 폼에 넣기
	/*
	[0]*****<input type="file" name="uploadFiles"..
	[1]<input type="file" name="uploadFiles"..
	[2]<input type="file" name="uploadFiles"..
	 */

	let inputFile = $("#uploadFiles");
	//이미지 파일들(a001.jpg,b002.jpg)
	let files = inputFile[0].files;
	console.log("files : ", files);

	for (let i = 0; i < files.length; i++) {
		formData.append("uploadFiles", files[i]);
	}

	//4. 아작나써유.. 피씨다타써

		$.ajax({
			url : "/audReqstInsert",
			processData : false,
			contentType : false,
			data : formData,
			type : "post",
			dataType : "text",
			success : function(result) {
				//5. 결과 확인(1 또는 0)
				//0 또는 1
				console.log("result : ", result);
				if(result==1){
					var Toast = Swal.mixin({
						toast : true,
						position : 'top-end',
						showConfirmButton : false,
						timer : 3000
					});
					Toast.fire({
						icon : 'success',
						title : '신청성공'
					});
					setTimeout(function(){
                        location.href = "/auditionReqstCreate";
					},3000);

				}else{
					var Toast = Swal.mixin({
						toast : true,
						position : 'top-end',
						showConfirmButton : false,
						timer : 3000
					});

					Toast.fire({
						icon : 'warning',
						title : '신청실패'
					});
				}
			}
		});
});

$(document).on("change", "#audNmReqst", function() {
	 let selectedOption = $(this).find(":selected");
	    let audNo = selectedOption.val();  // 선택한 오디션 번호
	    let audType = selectedOption.data("type");

    let found = false;
    $.each(audition, function(idx, AuditionVO) {
            console.log("audNo:", audNo);
        if (AuditionVO.audNo == audNo) {
            console.log("찾음:", AuditionVO);
            $("#audTypeReqst").val(AuditionVO.audType);  // 오디션 타입 설정

            found = true;
        }
    });

    if (!found) {
        console.log("못 찾음");
        $("#audTypeReqst").val("0");  // 기본값 유지

    }
});
$(document).on("change", "#audNmReqstDetail", function() {
	 let selectedOption = $(this).find(":selected");
	    let audNo = selectedOption.val();  // 선택한 오디션 번호
	    let audType = selectedOption.data("type");

   let found = false;
   $.each(audition, function(idx, AuditionVO) {
           console.log("audNo:", audNo);
       if (AuditionVO.audNo == audNo) {
           console.log("찾음:", AuditionVO);
           $("#audTypeReqstDetail").val(AuditionVO.audType);  // 오디션 타입 설정

           found = true;
       }
   });

   if (!found) {
       console.log("못 찾음");
       $("#audTypeReqstDetail").val("0");  // 기본값 유지

   }
});

 $("input[name='keyword']").on("keydown", function (event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    keyword = $("input[name='keyword']").val();//길동
                 	console.log("keyword", keyword);

                 	//전역함수 호출
                 	getReqstList("1", keyword,"0",sortName);

                }
            });
$("#btnSearch").on('click',function(){
	//input type="text" name="keyword"...
 	keyword = $("input[name='keyword']").val();//길동
 	console.log("keyword", keyword);

 	//전역함수 호출
 	getReqstList("1", keyword,"",sortName);
	})
		//목록 가져오는 함수 sort로 가져오는거까지
	function getReqstList(currentPage, keyword, mode, sortName) {
    //회원 목록
    let data = {
        "currentPage": nvl(currentPage, "1"),
        "keyword": nvl(keyword, ""),
        "mode": nvl(mode, "0"),
        "sortName": nvl(sortName, "")
    }
    console.log("data :", data);

    $.ajax({
        url: "/getReqstListAjax",
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(data),
        type: "POST",
        dataType: "json",
        success: function (articlePage) {
            console.log("articlePage :", articlePage);
            console.log("articlePage.content :", articlePage.content);

            let str = "";

            // If there is content, populate the table rows
            if (articlePage.content && articlePage.content.length > 0) {
                $.each(articlePage.content, function (idx, audReqstVO) {

                    let gdsDate = new Date(nvl(audReqstVO.audReqstDt, ""));
                    let formatGdsDate = "";
                    if (!isNaN(gdsDate)) {
                        formatGdsDate = gdsDate.getFullYear() + '-'
                            + String(gdsDate.getMonth() + 1).padStart(2, '0') + '-'
                            + String(gdsDate.getDate()).padStart(2, '0');
                    }
                    str += `<tr style="cursor: pointer;" id="audReqstDetail" data-aud-reqst-pw='\${audReqstVO.audReqstPw}' data-aud-reqst-no='\${audReqstVO.audReqstNo}'>
                        <td>\${audReqstVO.audReqstNm}</td>
                        <td>\${audReqstVO.audNm}</td>
                        <td style="text-align: center;">\${formatGdsDate}</td>
                    </tr>`;
//                         <td style="text-align: center;"><button type="button" class="btn btn-block btn-success btn-flat goodsChoice " data-gds-no="" data-gds-nm="">선택</button></td>
                });
            } else {
                // If no content, show the "No stock register" message
                str = `<tr><td colspan="6" style="text-align: center;">해당하는 신청이 없습니다.</td></tr>`;
            }

            // Update the table and paging area
            $("#tby").html(str);
            $("#divPagingArea").html(articlePage.pagingArea);

        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.error("Ajax Error:", textStatus, errorThrown);

            // Show the error message if AJAX fails
            let errorMessage = `<tr><td colspan="6" style="text-align: center;">등록된 신청이 없습니다.</td></tr>`;
            $("#tby").html(errorMessage);
            $("#divPagingArea").html(""); // Clear paging area
        }

    });

}


	$(document).on("click", ".clsPagingArea", function() {

			//클릭한 것은 하나
			//<a .. data-current-page="2" data-keyword="".. class="page-link clsPagingArea">2</a>
			let currentPage = $(this).data("currentPage");//2
			 keyword = $(this).data("keyword");//""

			 let mode = $(this).data("mode");//0 또는 1
			 sortName = $(this).data("sortName");//""

			console.log("페이지 클릭 처리->currentPage : " + currentPage);
			console.log("페이지 클릭 처리->keyword : " + keyword);
			console.log("페이지 클릭 처리->mode : " + mode);
			console.log("페이지 클릭 처리->sortName : " + sortName);
			getReqstList(currentPage, keyword, mode, sortName);

		});
	function handleImg(e){
	    console.log("파일 처리 시작");

	    // 이미지, 비디오, 오디오 오브젝트들
	    let files = e.target.files;

	    // 파일 오브젝트 배열
	    let fileArr = Array.prototype.slice.call(files);

	    // 미리보기 영역 초기화
	    $("#divImage").html("");

	    fileArr.forEach(function(f){
	        if(f.type.match("image.*")){
	            // 이미지 파일 처리
	            let reader = new FileReader();
	            reader.onload = function(e){
	                let img = "<img src='" + e.target.result + "' style='width:100%; height:100%' />";
	                $("#divImage").append(img);
	            }
	            reader.readAsDataURL(f);
	        }
	        else if(f.type.match("video.*")){
	            // 동영상 파일 처리
	            let video = "<video controls style='width:100%; height:100%'><source src='" + URL.createObjectURL(f) + "' type='" + f.type + "'>동영상을 지원하지 않는 브라우저입니다.</video>";
	            $("#divImage").append(video);
	        }
	        else if(f.type.match("audio.*")){
	            // 음악 파일 처리
	            let audio = "<audio controls><source src='" + URL.createObjectURL(f) + "' type='" + f.type + "'>오디오를 지원하지 않는 브라우저입니다.</audio>";
	            $("#divImage").append(audio);
	        }
	        else{
	            // 이미지, 동영상, 음악 파일이 아닌 경우 경고
	            alert("지원하지 않는 파일 형식입니다.");
	        }
	    });
	}

	$(document).on("click", ".goodsChoice", function() {
         const gdsNm = $(this).data('gds-nm');
         const gdsNo =  $(this).data('gds-no');

         if (window.opener) {
             // 부모 창에 데이터 전달
             try {
                 window.opener.receiveSelectGoods({ gdsNm, gdsNo });
                 window.close(); // 창 닫기
             } catch (error) {
                 console.error("Error in parent function:", error);
             }
         }else {
             alert('오류');
         }
     })
</script>

			<!-- ///// content 끝 ///// -->

			<%@ page language="java" contentType="text/html; charset=UTF-8"%>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

			<!-- /.content-wrapper -->


			<!-- Control Sidebar -->

			<!-- /.control-sidebar -->
			<!-- ./wrapper -->

			<!-- jQuery -->
			<!-- <script src="/adminlte/plugins/jquery/jquery.min.js"></script> -->
			<!-- jQuery UI 1.11.4 -->
			<script src="/adminlte/plugins/jquery-ui/jquery-ui.min.js"></script>
			<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
			<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
			<!-- Bootstrap 4 -->
			<script src="/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
			<!-- ChartJS -->
			<script src="/adminlte/plugins/chart.js/Chart.min.js"></script>
			<!-- Sparkline -->
			<!-- <script src="/adminlte/plugins/sparklines/sparkline.js"></script> -->
			<!-- JQVMap -->
			<!-- <script src="/adminlte/plugins/jqvmap/jquery.vmap.min.js"></script> -->
			<!-- <script src="/adminlte/plugins/jqvmap/maps/jquery.vmap.usa.js"></script> -->
			<!-- jQuery Knob Chart -->
			<script src="/adminlte/plugins/jquery-knob/jquery.knob.min.js"></script>
			<!-- daterangepicker -->
			<script src="/adminlte/plugins/moment/moment.min.js"></script>
			<script src="/adminlte/plugins/daterangepicker/daterangepicker.js"></script>
			<!-- Tempusdominus Bootstrap 4 -->
			<script
				src="/adminlte/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
			<!-- Summernote -->
			<script src="/adminlte/plugins/summernote/summernote-bs4.min.js"></script>
			<!-- overlayScrollbars -->
			<script
				src="/adminlte/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
			<!-- AdminLTE App -->
			<script src="/adminlte/dist/js/adminlte.js"></script>
			<!-- AdminLTE for demo purposes -->
			<script src="/adminlte/dist/js/demo.js"></script>
			<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
			<!-- <script src="/adminlte/dist/js/pages/dashboard.js"></script> -->
</body>
</html>