<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- SweetAlert2 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

<!-- SweetAlert2 JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
.hidden-col {
	display: none;
}

.card-header {
	display: flex; /* 한 줄로 정렬 */
	/*     justify-content: space-between; /* 좌우 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
}

.card-tools {
	margin-left: auto; /* 검색창을 오른쪽 끝으로 밀어냄 */
	display: flex;
	align-items: center; /* 내부 요소 세로 중앙 정렬 */
}

.register-btn {
	margin-left: auto; /* 버튼을 오른쪽 끝으로 이동 */
	padding: 10px 15px; /* 버튼 크기 조정 */
	font-size: 14px; /* 버튼 글씨 크기 조정 */
}

.card-footer2 {
	display: flex;
	justify-content: flex-end; /* 모든 요소를 오른쪽으로 정렬 */
	align-items: center; /* 수직 중앙 정렬 */
	gap: 10px; /* 페이징 영역과 버튼 간격 조정 */
}

a {
	color: black;
	text-decoration: none; /* 밑줄 없애기 (선택사항) */
}

a:hover {
	color: black; /* 마우스 올려도 색 유지 */
}

.pageTitle {
	margin: 12px;
	font-weight: bold;
}
</style>

<div class="content-wrapper" style="background-color: white;">
	<!--     Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/companypage/main">companypage</a></li>
						<li class="breadcrumb-item active">아티스트 관리</li>
					</ol>
				</div>
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
		<h2 class="pageTitle">아티스트 관리</h2>
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<!-- 카드 헤더 -->
						<div
							class="card-header d-flex justify-content-between align-items-center">
							<!-- 드롭다운 메뉴 -->

							<!-- 검색 폼 -->
							<div class="card-tools">
								<div class="input-group input-group-sm" style="width: 200px;">
									<input type="text" id="krd" name="keyword"
										value="${param.keyword}" class="form-control float-right"
										placeholder="검색어 입력" />
									<div class="input-group-append">
										<button type="button" id="btnSearch" class="btn btn-default">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</div>

						<!-- 카드 바디 -->
						<div class="card-body table-responsive p-0">
							<!--  테이블 시작 -->
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th value="artistNo">번호 <span class="up" style="cursor: pointer;" ></span> <span
											class="down" style="cursor: pointer;" ></span>
										</th>
										<th value="artistName">활동명 <span class="up" style="cursor: pointer;" ></span> <span
											class="down" style="cursor: pointer;" ></span>
										</th>
										<th value="memId">아이디 <span class="up" style="cursor: pointer;" ></span> <span
											class="down" style="cursor: pointer;" ></span>
										</th>
										<th value="artistBirth">생년월일 <span class="up" style="cursor: pointer;" ></span> <span
											class="down" style="cursor: pointer;" ></span>
										</th>
									</tr>
								</thead>
								<tbody id="tby">
									<!-- 스크립트로 나올곳 -->
								</tbody>
							</table>
							<!-- 테이블 종료 -->
						</div>

						<!-- 페이징 및 버튼 영역 -->
						<div
							class="card-footer2 d-flex justify-content-between align-items-center">
							<div id="divPagingArea"
								style="background-color: white; flex-grow: 1;"></div>
							<div class="d-flex" style="gap: 15px; padding-right: 15px;">
								<a data-toggle="modal" data-target="#modalAdd"
									class="btn btn-primary">등록</a>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
</div>


<%@ include file="../include/footer.jsp"%>



<!-- /// 아티스트 등록 모달 시작 /// -->
<div class="modal fade" id="modalAdd">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" style="font-weight:bold;">아티스트 추가</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!--  /// 내용 시작 /// -->
				<form>
					<div class="card-body">
						<div class="form-group">
							<label for="artistName">활동명</label> <input type="text"
								class="form-control" id="artistName" placeholder="이름" />
						</div>
						<div class="form-group">
							<label for="memId">아이디</label> <input type="text"
								class="form-control" id="memId" placeholder="아이디" />
							<div style="display: flex; justify-content: flex-end;">

								<button id="memIdChk" type="button"
									class="btn  btn-success btn-sm">아이디확인</button>
							</div>
						</div>
						<div class="form-group">
							<label for="artistProfile">프로필</label> <input type="text"
								class="form-control" id="artistProfile" placeholder="프로필" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">생일</label> <input type="date"
								class="form-control" id="artistBirth" placeholder="생일" />
						</div>

						<div class="form-group">
							<!-- private Date memBir;
            	2024-11-27
            	-->
							<label for="uploadFiles">회원사진</label> <input type="file"
								class="form-control" id="uploadFiles" name="uploadFiles"
								value="" placeholder="회원사진" multiple />
						</div>
						<div id="divImage"></div>

					</div>
				</form>
				<!--  /// 내용 끝 /// -->
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="previewBtn" style="border:none; color:grey; background-color:white;">시연용</button>
				<button type="button" id="btnRegist" class="btn btn-primary"
					disabled>등록</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /// 아티스트 등록 모달 끝 /// -->

<!-- /// 아티스트 수정 모달 시작 /// -->
<div class="modal fade" id="modalUpdate">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">아티스트 수정</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!--  /// 내용 시작 /// -->
				<form>
					<div class="card-body">
						<div class="form-group">
							<label for="artistName">활동명</label> <input type="text"
								class="form-control" id="artistNameUp" placeholder="이름" />
						</div>
						<div class="form-group">

							<input type="text" class="form-control" id="memIdUp"
								placeholder="아이디" hidden /> <input type="text"
								class="form-control" id="artistNoUp" placeholder="넘버" hidden />

						</div>
						<div class="form-group">
							<label for="artistProfile">프로필</label> <input type="text"
								class="form-control" id="artistProfileUp" placeholder="프로필" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">생일</label> <input type="date"
								class="form-control" id="artistBirthUp" placeholder="생일" />
						</div>

						<div class="form-group">
							<!-- private Date memBir;
            	2024-11-27
            	-->
							<label for="uploadFiles">회원사진</label> <input type="file"
								class="form-control" id="uploadFilesUp" name="uploadFiles"
								value="" placeholder="회원사진" multiple />
						</div>
						<div id="divImage"></div>

					</div>
				</form>
				<!--  /// 내용 끝 /// -->
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="btnUpdate" class="btn btn-primary">수정</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /// 아티스트 수정 모달 끝 /// -->
<!-- ///// content 끝 ///// -->
<script type="text/javascript">

	//전역변수 , 전역함수
	/*
	 ==는 Equal Operator이고,  ===는 Strict Equal Operator이다.

	 ==는 a == b 라고 할때, a와 b의 값이 같은지를 비교해서, 같으면 true, 다르면 false라고 한다.(값만 같으면 true이다.)



	 ===는 Strict, 즉 엄격한 Equal Operator로써, "엄격하게" 같음을 비교할 때 사용하는 연산자이다.

	 ===는 a === b 라고 할때, 값과 값의 종류(Data Type)가 모두 같은지를 비교해서, 같으면 true, 다르면 false라고 한다.

	 */
	/**
	 * NVL: expr1 값이 null(undefined) 또는 공백인 경우 expr2 값을 반환, 그렇지 않으면 expr1 값 반환
	 * @return expr1
	 */
	 let keyword="";
	 let sortName="artistNo";
	 let mode="0";

	function nvl(expr1, expr2) {
		if (expr1 === undefined || expr1 == null || expr1 == "") {
			expr1 = expr2;
		}
		return expr1;
	}

	//누르는 소트
	$('.up').click(function() {
	    var value = $(this).closest('th').attr('value');
	    console.log("위에 누름",value); // 출력: "rnum"
	    sortName=value;
		getList("1", keyword,"0",sortName);

	  });

	  $('.down').click(function() {
	    var value = $(this).closest('th').attr('value');
	    console.log("아래 누름",value);
	    sortName=value;

		getList("1", keyword,"1",sortName);

	  });
	//아티스트 정보 비동기 추가
		$("#btnRegist").on("click", function() {
			console.log("아티스트 정보");

			//1. 가상 폼(이미지 포함) <form></form>
			let formData = new FormData();

			//2. 엘리먼트들을 가상 폼에 넣기
			let artistName = $("#artistName").val();
			let artistProfile = $("#artistProfile").val();
			let artistBirth = $("#artistBirth").val();
			let memId = $("#memId").val();

			formData.append("artistName", artistName);
			formData.append("artistProfile", artistProfile);
			formData.append("artistBirth", artistBirth);
			formData.append("memId", memId);

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
					url : "/manageArtistAjax/createArtistAjax",
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
								timer : 1500
							});
							Toast.fire({
								icon : 'success',
								title : '등록성공'
							});
							setTimeout(function(){
								location.href="/companypage/manageArtist";
							},1500);

						}else{
							var Toast = Swal.mixin({
								toast : true,
								position : 'top-end',
								showConfirmButton : false,
								timer : 1500
							});

							Toast.fire({
								icon : 'warning',
								title : '등록실패'
							});
						}
					}
				});
		});


		$("#btnUpdate").on("click", function() {

			//1. 가상 폼(이미지 포함) <form></form>
			let formData = new FormData();

			//2. 엘리먼트들을 가상 폼에 넣기
			let memId = $("#memIdUp").val();
			let artistName = $("#artistNameUp").val();
			let artistProfile = $("#artistProfileUp").val();
			let artistBirth = $("#artistBirthUp").val();
			let artistNo= $("#artistNoUp").val();

			formData.append("memId", memId);
			formData.append("artistName", artistName);
			formData.append("artistProfile", artistProfile);
			formData.append("artistBirth", artistBirth);
			formData.append("artistNo", artistNo);

			//3. 파일 엘리먼트를 선택하여 가상 폼에 넣기
			/*
			[0]*****<input type="file" name="uploadFiles"..
			[1]<input type="file" name="uploadFiles"..
			[2]<input type="file" name="uploadFiles"..
			 */

			let inputFile = $("#uploadFilesUp");
			//이미지 파일들(a001.jpg,b002.jpg)
			let files = inputFile[0].files;
			console.log("files : ", files);
			/*
			<form>
			   <input type="file" name="uploadFiles" 파일객체 />
			   <input type="file" name="uploadFiles" 파일객체 />
			   ..
			</form>
			 */

			for (let i = 0; i < files.length; i++) {
				formData.append("uploadFiles", files[i]);
			}

			//4. 아작나써유.. 피씨다타써

			$.ajax({
				url : "/manageArtistAjax/updateArtistAjax",
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
							timer : 1500
						});
						Toast.fire({
							icon : 'success',
							title : '수정성공'
						});
						setTimeout(function(){
							location.href="/companypage/manageArtist";

						},1500);

					}else{
						var Toast = Swal.mixin({
							toast : true,
							position : 'top-end',
							showConfirmButton : false,
							timer : 1500
						});

						Toast.fire({
							icon : 'warning',
							title : '수정실패'
						});
					}
				}
			});
		});


	//아이디 체크
	$("#memIdChk").on('click',function(){
	//input type="text" name="keyword"...
 	let memId = $("#memId").val();//길동
 	console.log("memId", memId);
	let data = {
			"memId" : memId
		}
 	$.ajax({
		url : "/manageArtistAjax/memIdChkAjax",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data),
		type : "POST",
		dataType : "json",
		success : function(ArtistVO) {
			console.log("ArtistVO : ", ArtistVO);

			if (ArtistVO.memId == memId) {//중복됨
				//success, error, warning, info, question
				var Toast = Swal.mixin({
					toast : true,
					position : 'top-end',
					showConfirmButton : false,
					timer : 1500
				});

				Toast.fire({
					icon : 'success',
					title : '아이디가 확인되었습니다.'
				});
				//등록버튼 활성
				$("#btnRegist").removeAttr("disabled");

			} else {//중복안됨
				var Toast = Swal.mixin({
					toast : true,
					position : 'top-end',
					showConfirmButton : false,
					timer : 1500
				});

				Toast.fire({
					icon : 'warning',
					title : '없는 아이디입니다'
				});
				$("#memId").focus();

				//등록버튼 비활성
				$("#btnRegist").attr("disabled", true);
			}
		},
		error:function(xhr,status,error){
			//xhr : responseEntity에 담아서 보낸 응답 메시지
			//status : 응답코드
			//error : 오류정보
				console.log("xhr : ", xhr);
				console.log("status : ", status);
				console.log("error : ", error);

			var Toast = Swal.mixin({
			      toast: true,
			      position: 'top-end',
			      showConfirmButton: false,
			      timer: 1500
			    });

			Toast.fire({
				icon:'error',
				title:'오류가 발생했습니다.'
			});
			$("#btnRegist").attr("disabled", true);

		}
	})

	})

	document.getElementById("previewBtn").addEventListener("click", () => {
		document.getElementById("artistName").value = "츄";
		document.getElementById("memId").value = "chu333";
		document.getElementById("artistProfile").value = "";
		document.getElementById("artistBirth").value = "1999-10-20";
	});
	$(document).on("click", "#btnDelete", function () {
    console.log("삭제 비동기");

    let artistNo = $(this).data("artistNo");
    console.log("artistNo", artistNo);

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
            let data = {
                "artistNo": artistNo
            };

            console.log("data : ", data);
            $.ajax({
                url: "/manageArtistAjax/deleteArtistAjax",
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(data),
                type: "post",
                dataType: "json",
                success: function (result) {
                    console.log("result : ", result);

                    if (result == 1) { // 성공
                        Swal.fire({
                            icon: 'success',
                            title: '삭제되었습니다',
                            showConfirmButton: false,
                            timer: 1500
                        });

                        // 3초 후 페이지 이동
                        setTimeout(() => {
                            location.href = "/companypage/manageArtist";
                        }, 1500);
                    } else { // 실패
                        Swal.fire({
                            icon: 'warning',
                            title: '삭제가 되지 않았습니다',
                            showConfirmButton: false,
                            timer: 1500
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
                        timer: 1500
                    });
                }
            });
        }
    });
});
	$("#krd").on("keypress", function(event) {
	    if (event.key === "Enter") {
	        event.preventDefault();

	        $("#btnSearch").trigger("click");
	    }
	});
	//검색 처리
	$("#btnSearch").on('click',function(){
	//input type="text" name="keyword"...
 	keyword = $("input[name='keyword']").val();//길동
 	console.log("keyword", keyword);

 	//전역함수 호출
 	getList("1", keyword,"",sortName);
	})

	//수정시 정보 미리 넣기
		$(document).on("click","#btnUpdateSet",function(){
			//data-reply-content
			let artistNo= $(this).data("artistNo");
		 	console.log("artistNo", artistNo);
			let data = {
					"artistNo" : nvl(artistNo, "")
				}
				console.log("data :", data);
		 	$.ajax({
				url : "/manageArtistAjax/artistDetailAjax",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				type : "POST",
				dataType : "json",
				success : function(artistVO) {
					console.log("artistVO :", artistVO.artistBirth);

					$("#artistNameUp").val(artistVO.artistName);
					$("#memIdUp").val(artistVO.memId);
					$("#artistProfileUp").val(artistVO.artistProfile);
					let artistBirth = artistVO.artistBirth; // Java에서 받은 날짜 값

					if (artistBirth) {
					    let formattedDate = new Date(artistBirth).toISOString().split('T')[0];
					    $("#artistBirthUp").val(formattedDate);
					}
					$("#artistNoUp").val(artistVO.artistNo);

				}
			});


		});

	async function getList(currentPage, keyword, mode, sortName) {
	    // 회원 목록
	    let data = {
	        "currentPage": currentPage || "1",
	        "keyword": keyword || "",
	        "mode": mode || "0",
	        "sortName": sortName || ""
	    };
	    console.log("data :", data);

	    try {
	        let articlePage = await $.ajax({
	            url: "/manageArtistAjax/artistListSortAjax",
	            contentType: "application/json;charset=utf-8",
	            data: JSON.stringify(data),
	            type: "POST",
	            dataType: "json"
	        });

	        console.log("articlePage :", articlePage);
	        console.log("articlePage.content :", articlePage.content);

	        let str = "";

	        for (let idx = 0; idx < articlePage.content.length; idx++) {
	            let ArtistVO = articlePage.content[idx];
	            let birthDate = new Date(ArtistVO.artistBirth);
	            let formattedDate = birthDate.getFullYear() + '-'
	                + String(birthDate.getMonth() + 1).padStart(2, '0') + '-'
	                + String(birthDate.getDate()).padStart(2, '0');

	            str += `
	                <tr data-widget="expandable-table" aria-expanded="false">
	                  <td>\${ArtistVO.artistNo}</td>
	                  <td>\${ArtistVO.artistName}</td>
	                  <td>\${ArtistVO.memId}</td>
	                  <td>\${formattedDate}</td>
	                </tr>
	                <tr class="expandable-body d-none">
	                  <td colspan="5">
	                    <p style=" padding-top: 12px; margin-top: 0px; padding-bottom: 12px; margin-bottom: 16px; display: none;">
	            `;

	            if (ArtistVO.fileGroupVO != null) {
	                str += `
	                    <div class="photo" style="width:300px; overflow: hidden;">
	                    <img src="\${ArtistVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}" alt="아티스트 사진" style="width: 100%; height: auto;">
	                    </div>`;
	            }

	            // artistGroupList 데이터를 가져오기 위한 Ajax 요청
	            let list = await $.ajax({
	                url: "/manageArtistAjax/artistGroupList",
	                contentType: "application/json;charset=utf-8",
	                data: JSON.stringify({ "artistNo": ArtistVO.artistNo }),
	                type: "POST",
	                dataType: "json"
	            });

	            str += `
	                <div class="content">
	            	<div class="profile">
	                프로필:
	                \${ArtistVO.artistProfile
	                    ? "<p>" + ArtistVO.artistProfile + "</p>"
	                    : "<p style='color: #888; font-style: italic;'>프로필 내용이 없습니다.</p>"}
	            </div>
	                    <a data-toggle="modal" data-artist-no="\${ArtistVO.artistNo}" id="btnUpdateSet" data-target="#modalUpdate" class="btn btn-info">
	                        <i class="fa-solid fa-pen"></i>
	                    </a>
	                    <button type="button" data-artist-no="\${ArtistVO.artistNo}" ID="btnDelete" class="btn btn-danger">
	                        <i class="fa fa-trash" aria-hidden="true"></i>
	                    </button>
	                </div>
	            </p>
	          </td>
	        </tr>
	            `;
	        }

	        // 모든 데이터를 처리한 후 DOM에 렌더링
	        $("#tby").html(str);
	        $("#divPagingArea").html(articlePage.pagingArea);
	    } catch (error) {
	        console.error("Error occurred while fetching data:", error);
	    }
	}



	//document.ready
	//동일 jsp에서 1회 작성
	$(function() {
		getList("1", "","0",sortName);
        const upIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-up icon" viewBox="0 0 16 16"><path d="M3.204 11h9.592L8 5.519zm-.753-.659 4.796-5.48a1 1 0 0 1 1.506 0l4.796 5.48c.566.647.106 1.659-.753 1.659H3.204a1 1 0 0 1-.753-1.659"/></svg>';
        const upIconChk = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-up-fill" viewBox="0 0 16 16"> <path d="m7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/></svg>';
        const downIcon='<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down" viewBox="0 0 16 16">  <path d="M3.204 5h9.592L8 10.481zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659"/> </svg>'
        const downIconChk='<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16"> <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/></svg>'

        	   $('.up').removeClass('active').html('').append(upIcon);
        $('.down').removeClass('active').html('').append(downIcon);



		//페이지 클릭 처리
		//class="clsPagingArea" : 여러개(오브젝트 배열)
		//정적요소 	   $(".clsPagingArea").on("click",function(){
		//동적요소
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
			getList(currentPage, keyword, mode, sortName);

		});

		   $('.up').click(function(){
               $('.up').removeClass('active').html('').append(upIcon);
               $('.down').removeClass('active').html('').append(downIcon);

	                $(this).addClass('active').html('').append(upIconChk);
           });
		   $('.down').click(function(){
               $('.down').removeClass('active').html('').append(downIcon);
               $('.up').removeClass('active').html('').append(upIcon);

	                $(this).addClass('active').html('').append(downIconChk);
           });
	});
	//e : 변경 이벤트 오브젝트
	function handleImg(e){
		console.log("개똥이");

		//이미지 오브젝트들
		let files = e.target.files;

		//이미지 오브젝트 배열(a.jpgb.jpgc.jpg)
		let fileArr = Array.prototype.slice.call(files);

		//미리보기 영역 초기화
		$("#divImage").html("");

		fileArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지 확장자만 가능합니다");
				return;//함수 종료
			}
			//이미지 읽기
			let reader = new FileReader();
			//e : 읽는 이벤트
			reader.onload = function(e){
				let img = "<img src='" + e.target.result + "' style='width:20%;' />";
				//누적 : append(), 덮어쓰기 : html()
				$("#divImage").append(img);
			}
			reader.readAsDataURL(f);
		});

	}

	$(function(){
		$("#uploadFiles").on("change",handleImg);
	});
</script>