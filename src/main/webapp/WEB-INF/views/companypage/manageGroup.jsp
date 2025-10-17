<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- SweetAlert2 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

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

.pageTitle{
margin:12px;
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
						<li class="breadcrumb-item active">그룹 관리</li>
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
	<link rel="stylesheet" href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
	<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
	<!-- ///// content 시작 ///// -->

	<section class="content">
		<h2 class="pageTitle">그룹 관리</h2>
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<!-- 카드 헤더 -->
						<div class="card-header d-flex justify-content-between align-items-center">
							<!-- 드롭다운 메뉴 -->


							<!-- 검색 폼 -->
							<div class="card-tools">
									<div class="input-group input-group-sm" style="width: 200px;">
										<input
											type="text"
											id="krd"
											name="keyword"
											value="${param.keyword}"
											class="form-control float-right"
											placeholder="검색어 입력" />
										<div class="input-group-append">
											<button
												type="button"
												id="btnSearch"
												class="btn btn-default">
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
										<th value="groupNo">번호 <span style="cursor: pointer;" class="up"></span> <span
											 style="cursor: pointer;"  	class="down"></span>
										</th>
										<th value="groupName">그룹이름 <span style="cursor: pointer;"  class="up"></span> <span
											style="cursor: pointer;"  class="down"></span>
										</th>
										<th value="groupBirth">그룹생성일 <span style="cursor: pointer;"  class="up"></span> <span
											style="cursor: pointer;"  class="down"></span>
										</th>

										<th value="groupDspgn">그룹해체일 <span style="cursor: pointer;"  class="up"></span> <span
											style="cursor: pointer;"  class="down"></span>
										</th>
										<th value="groupBirthInputter">최종수정자 <span style="cursor: pointer;"  class="up"></span>
											<span style="cursor: pointer;"  class="down"></span>
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
						<div class="card-footer2 d-flex justify-content-between align-items-center">
							<div id="divPagingArea" style="background-color: white; flex-grow: 1;"></div>
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



<style>
.container {
	display: flex;
	/*                             width: 80%; */
	min-height: 400px;
	height: 100%;
	/* 화면 전체 높이 */
	/* 	background-color: yellow; */
	border-radius: 10px;
}

.left1 {
	width: 50%;
	/*             background-color: lightblue; /* 왼쪽 부분 색상 */
}

.right1 {
	width: 50%;
	/*             background-color: lightgreen; /* 오른쪽 부분 색상 */
}

 .modal-dialog {
	max-height: 90%; /* 모달 창의 최대 높이를 화면 크기 90%로 설정 */
	overflow-y: auto; /* 세로 스크롤 추가 */
 }
</style>


	<!-- /// 그룹 등록 모달 시작 /// -->
	<div class="modal fade" id="modalAdd">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" style="font-weight:bold;">그룹 등록</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<!--  /// 내용 시작 /// -->
					<div class="card-body">

						<div class="container">

							<div class="left1">
								<input type="file" class="form-control" id="uploadFiles"
									name="uploadFiles" value="" placeholder="그룹사진" />
								<div id="divImage" style="width: 100%; height: 80%">
									<img src="aaa" style="width: 100%; height: 100%" />
								</div>
								<div class="form-group">
									<label for="groupName">그룹 이름</label> <input type="text"
										class="form-control" id="groupName" placeholder="이름" />
								</div>
							</div>
							<div class="right1">
								<div class="form-group">
									<label for="groupNo">그룹 소개</label>
									<textarea rows="" cols=""
										style="width: 100%; height: 78%; resize: none;"
										placeholder="그룹 소개" id="groupIntrcn"></textarea>

								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">그룹 생성일</label> <input
										type="date" class="form-control" id="groupBirth"
										placeholder="그룹 생성일" />
								</div>

							</div>

						</div>

					</div>

					</form>
					<!--  /// 내용 끝 /// -->
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" id="previewBtn" style="border:none; color:grey; background-color:white;">시연용</button>
					<button type="button" id="btnRegist" class="btn btn-primary">등록</button>
				</div>
			</div>
			<!-- /.modal-content -->

		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /// 그룹 상세 모달 끝 /// -->
	<!-- /// 그룹 정보 모달 시작 /// -->
	<div class="modal fade" id="modalInfo"  data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">그룹 상세</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="container">
					<div class="left1">
						<input type="file" class="form-control" id="uploadFilesUpload"
							name="uploadFilesUpload" value="" placeholder="그룹사진" />
						<div id="divImageSet" style="width: 320px; height: 320px">
							<img src="aaa" style="width: 100%; height: 100%" />
						</div>
						<div class="form-group">
							<label for="groupName">그룹 이름</label> <input type="text"
								class="form-control" id="groupNameSet" placeholder="이름" />
						</div>
					</div>
					<div class="right1" style="overflow: visible; height: auto;">
						<div class="form-group">
							<label for="groupNo">그룹 소개</label>
							<textarea rows="" cols=""
								style="width: 100%; height: 58%; resize: none;"
								placeholder="그룹 소개" id="groupIntrcnSet"></textarea>

						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">그룹 생성일</label> <input
								type="date" class="form-control" id="groupBirthSet"
								placeholder="그룹 생성일" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">그룹 해체일</label> <input
								type="date" class="form-control" id="groupDspgnSet"
								placeholder="그룹 해체일" />
						</div>
					</div>
				</div>

				<div class="modal-body">
					<!--  /// 내용 시작 /// -->
					<label for="exampleInputPassword1">소속 아티스트</label>
					<div class="form-group">
						<div id="artistInsert">
							<!--  /// 내용 끝 /// -->
						</div>
						<div class="modal-footer justify-content-between">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" id="btnUpdate" class="btn btn-primary">수정</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->

	</div>
	<!-- /// 그룹 정보 모달 끝 /// -->

			<!-- /// 아티스트 검색 모달 시작 /// -->
			<div class="modal fade" id="modalArtistSearch" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">아티스트 검색</h4>
							<button type="button" class="close" onclick="closeModal()"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<!--  /// 내용 시작 /// -->
							<input id="artistSearch">
							<button type="button" class="btn btn-success"
								id="artistSearchBtn">
								<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							<div style="overflow: inherit;" id="artistInput"></div>
							<!--  /// 내용 끝 /// -->
						</div>
						<div class="modal-footer justify-content-between">
							<button onclick="closeModal()" type="button"
								class="btn btn-default" data-bs-dismiss="modal">Close</button>
<!-- 							<button type="button" id="addSelectedArtists" -->
<!-- 								class="btn btn-primary">등록</button> -->
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /// 아티스트 정보 모달 끝 /// -->

			<!-- ///// content 끝 ///// -->

			<script type="text/javascript">


	 let keyword="";
	 let sortName="groupNo";
	 let mode="0";
	 let groupNo=0;

	  // 특정 모달을 여는 함수
	    function openModal() {
			  console.log("모달 열기");
				$("#artistInput").html();

			  $("#modalArtistSearch").modal("show");
	    }

	    // 특정 모달을 닫는 함수

		function closeModal() {
		  console.log("모달 닫기");

		  // jQuery로 모달 닫기
		  $("#modalArtistSearch").modal("hide");
		}

		$(document).on("click","#artistInsertGroup",function(){
				  console.log("넣는중");

				let artistNo = $(this).data("artistNo");
				let data = {
				  artistNo: artistNo,
				  groupNo: groupNo,
				};

				console.log("data : ", data);

				$.ajax({
				    url: "/manageGroupAjax/artistInsertGroup",
				    contentType: "application/json;charset=utf-8",
				    data: JSON.stringify(data),
				    type: "post",
				    dataType: "json",
				    success: function (result) {
				        let Toast = Swal.mixin({
				            toast: true,
				            position: 'top-end',
				            showConfirmButton: false,
				            timer: 1500
				        });

				        if (result === 1) {
				            Toast.fire({
				                icon: 'success',
				                title: '아티스트가 성공적으로 추가되었습니다.'
				            });
				            artistList(groupNo);
				        } else if (result === -1) {
				            Toast.fire({
				                icon: 'warning',
				                title: '이미 추가된 아티스트입니다.'
				            });
				        } else if (result === 0) {
				            Toast.fire({
				                icon: 'error',
				                title: '추가에 실패했습니다. 다시 시도해주세요.'
				            });
				        }

				        console.log("통과");
				    }
				});

					});



			$("#artistSearchBtn").on("click", function() {
			let artistSearch=$("#artistSearch").val();
			console.log("artistSearch",artistSearch);

			let data = {
					"artistName":artistSearch
				};

				console.log("data : ", data);
				$.ajax({
					url:"/manageGroupAjax/artistSearch",
					contentType:"application/json;charset=utf-8",
					data:JSON.stringify(data),
					type:"post",
					dataType:"json",
					success:function(result){
						$("#artistInput").html("");
						$("#artistSearch").val("");

						$.each(result,function(idx,artistVO){
							str=`<div>
								  <label>\${artistVO.memId} : \${artistVO.artistName}</label>
								<button type="button" class="btn btn-outline-info btn-sm" data-artist-no="\${artistVO.artistNo}"
								id="artistInsertGroup"><i class="fa-solid fa-magnifying-glass"></i></button>
								</div>
							`
						$("#artistInput").append(str);

						});

						//delete 성공 : 1, delete 실패 : 0
						console.log("result : ", result);

						}
					})
				});//end ajax
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

	  ///그룹 정보 비동기 수정
	  $("#btnUpdate").on("click", function() {//여기 내일 해야함
			console.log("그룹 정보 수정");

// 			//1. 가상 폼(이미지 포함) <form></form>
			let formData = new FormData();

// 			//2. 엘리먼트들을 가상 폼에 넣기
			let groupName = $("#groupNameSet").val();
			let groupIntrcn = $("#groupIntrcnSet").val();
			let groupBirth = $("#groupBirthSet").val();
			let groupDspgn = $("#groupDspgnSet").val();
			let groupDspgnInputter = memId;
			let groupBirthInputter = memId;
			console.log("groupDspgnInputter",groupDspgnInputter);
			console.log("groupBirthInputter",groupBirthInputter);

			formData.append("groupNo", groupNo);
			formData.append("groupName", groupName);
			formData.append("groupBirth", groupBirth);
			formData.append("groupIntrcn", groupIntrcn);
			formData.append("groupDspgn", groupDspgn);
			formData.append("groupDspgnInputter", groupDspgnInputter);
			formData.append("groupBirthInputter", groupBirthInputter);

// 			//3. 파일 엘리먼트를 선택하여 가상 폼에 넣기
// 			/*
// 			[0]*****<input type="file" name="uploadFiles"..
// 			[1]<input type="file" name="uploadFiles"..
// 			[2]<input type="file" name="uploadFiles"..
// 			 */

			let inputFile = $("#uploadFilesUpload");
// 			//이미지 파일들(a001.jpg,b002.jpg)
			let files = inputFile[0].files;
			console.log("files : ", files);

			for (let i = 0; i < files.length; i++) {
				formData.append("uploadFiles", files[i]);
			}

			console.log("formData : ", formData);

// 			//4. 아작나써유.. 피씨다타써

				$.ajax({
					url : "/manageGroupAjax/updateGroupAjax",
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
								title : '등록성공'
							});
							setTimeout(function(){
								location.href="/companypage/manageGroup";
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
								title : '등록실패'
							});
						}
					}
				});
//
});
	  document.getElementById("previewBtn").addEventListener("click", () => {
		  document.getElementById("groupName").value = "Chuu";
		  document.getElementById("groupIntrcn").value = "2017년 ‘Heart Attack’으로 데뷔하여 이달의 소녀의 멤버로 활동하며 맑은 음색과 탁월한 가창력, 컨셉 소화력으로 대중들을 사로잡았다. 그 이후 예능, 드라마 OST, 컬래버레이션 음반 등 다양한 활동을 하며 통통 튀면서도 안정감 있는 매력을 보여주며 츄만의 밝은 에너지를 완성했다.";
		  document.getElementById("groupBirth").value = "2017-12-28";
		  });

	//그룹 정보 비동기 추가
		$("#btnRegist").on("click", function() {
			console.log("그룹 정보");

			//1. 가상 폼(이미지 포함) <form></form>
			let formData = new FormData();

			//2. 엘리먼트들을 가상 폼에 넣기
			let groupName = $("#groupName").val();
			let groupBirth = $("#groupBirth").val();
			let groupIntrcn = $("#groupIntrcn").val();
			let groupBirthInputter = memId;
			let groupDspgnInputter = memId;
			console.log("groupBirthInputter",groupBirthInputter);

			formData.append("groupName", groupName);
			formData.append("groupBirth", groupBirth);
			formData.append("groupIntrcn", groupIntrcn);
			formData.append("groupBirthInputter", groupBirthInputter);
			formData.append("groupDspgnInputter", groupDspgnInputter);

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
					url : "/manageGroupAjax/createGroupAjax",
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
								title : '등록성공'
							});
	         	            $("#btnRegist").prop("disabled", true);

							setTimeout(function(){
								location.href="/companypage/manageGroup";
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
								title : '등록실패'
							});
						}
					}
				});
		});







	//아티스트 지우기
	$(document).on("click","#groupArtistDel",function(){
			console.log("아티스트 삭제 비동기");

			let artistNo= $(this).data("artistNo");
		 	console.log("artistNo", artistNo);
			 groupNo= $(this).data("groupNo");
		 	console.log("groupNo", groupNo);
			 //2) JSON Object
			let data = {
				"artistNo":artistNo,
				"groupNo":groupNo
			};

			console.log("data : ", data);
			$.ajax({
				url:"/manageGroupAjax/groupArtistDel",
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(data),
				type:"post",
				dataType:"json",
				success:function(result){
					console.log(result);
					$("#artistInsert").html("");

					artistList(groupNo);
				}
			});//end ajax

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


	function artistList(groupNo){
		let data = {
				"groupNo" : nvl(groupNo, "")
			}
			console.log("data :", data);
	 	$.ajax({
			url : "/manageGroupAjax/groupDetailAjax",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "json",
			success : function(GroupsVO) {
				console.log("GroupsVO :", GroupsVO);
				$("#artistInsert").html( "");
				 let artistFound = false; // 아티스트가 존재하는지 체크하는 변수

			      $.each(GroupsVO.artistList, function(idx, artist) {
			        console.log("artist :", artist.artistName);

			        // artistNo가 0이 아닌 경우에만 추가
			        if (artist.artistNo !== 0) {
			          artistFound = true; // 아티스트가 존재함
			          let setting = `
			            <div style="display: flex; justify-content: space-between; align-items: center; padding: 5px; width:200px;">
			              <span style="flex-grow: 1; text-align: left;">\${artist.artistName}</span>
			              <button type="button" class="btn btn-danger btn-flat"
			                data-artist-no="\${artist.artistNo}"
			                data-group-no="\${GroupsVO.groupNo}"
			                id="groupArtistDel"
			                style="margin-left: auto;">
			                <i class="fa-solid fa-xmark"></i>
			              </button>
			            </div>
			          `;
			          $("#artistInsert").append(setting);
			        }
			      });

			      // artistNo가 0인 경우에만 메시지 표시
			      if (!artistFound) {
			        $("#artistInsert").append('<p>아티스트를 추가해주세요.</p>');
			      }
				let mTbtn=`<a  data-group-no="\${GroupsVO.groupNo}" data-target="#modalArtistSearch"class="btn btn-primary">아티스트 추가</a>`;
					$("#artistInsert").append(mTbtn);




			}
		});
	}

	//수정시 정보 미리 넣기
		$(document).on("click","#btnUpdateSet",function(){
			//data-reply-content
			 groupNo= $(this).data("groupNo");
		 	console.log("groupNo", groupNo);
			let data = {
					"groupNo" : nvl(groupNo, "")
				}
				console.log("data :", data);
		 	$.ajax({
				url : "/manageGroupAjax/groupDetailAjax",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				type : "POST",
				dataType : "json",
				success : function(GroupsVO) {
					console.log("GroupsVO :", GroupsVO);
					$("#artistInsert").html( "");
				      $('#uploadFilesUpload').val(''); // 파일 입력값 초기화

				      let artistFound = false; // 아티스트가 존재하는지 체크하는 변수

				      $.each(GroupsVO.artistList, function(idx, artist) {
				        console.log("artist :", artist.artistName);

				        // artistNo가 0이 아닌 경우에만 추가
				        if (artist.artistNo !== 0) {
				          artistFound = true; // 아티스트가 존재함
				          let setting = `
				            <div style="display: flex; justify-content: space-between; align-items: center; padding: 5px; width:200px;">
				              <span style="flex-grow: 1; text-align: left;">\${artist.artistName}</span>
				              <button type="button" class="btn btn-danger btn-flat"
				                data-artist-no="\${artist.artistNo}"
				                data-group-no="\${GroupsVO.groupNo}"
				                id="groupArtistDel"
				                style="margin-left: auto;">
				                <i class="fa-solid fa-xmark"></i>
				              </button>
				            </div>
				          `;
				          $("#artistInsert").append(setting);
				        }
				      });

				      // artistNo가 0인 경우에만 메시지 표시
				      if (!artistFound) {
				        $("#artistInsert").append('<p>아티스트를 추가해주세요.</p>');
				      }

					let mTbtn=`<a onclick="openModal()" data-group-no="\${GroupsVO.groupNo}" data-target="#modalArtistSearch"class="btn btn-primary">아티스트 추가</a>`
						$("#artistInsert").append( mTbtn);


					let groupBirth = new Date(nvl(GroupsVO.groupBirth,""));
					 let groupDspgn = new Date(nvl(GroupsVO.groupDspgn),"");

					$("#groupNameSet").val(GroupsVO.groupName);
					$("#groupIntrcnSet").val(GroupsVO.groupIntrcn);
					  let formatGroupBirth = "";
					    if (!isNaN(groupBirth)) {
					        formatGroupBirth = groupBirth.getFullYear() + '-'
					                        + String(groupBirth.getMonth() + 1).padStart(2, '0') + '-'
					                        + String(groupBirth.getDate()).padStart(2, '0');
					    }
					$("#groupBirthSet").val(formatGroupBirth);
					let formatGroupDspgn = "";
				    if (!isNaN(groupDspgn)) {
				        formatGroupDspgn = groupDspgn.getFullYear() + '-'
				                        + String(groupDspgn.getMonth() + 1).padStart(2, '0') + '-'
				                        + String(groupDspgn.getDate()).padStart(2, '0');
				    }
					$("#groupDspgnSet").val(formatGroupDspgn);
				$("#divImageSet").html("");
					let img = "<img src='" + GroupsVO.fileSaveLocate + "' style='width:100%; height: 100%' />";
					//누적 : append(), 덮어쓰기 : html()

					$("#divImageSet").append(img);

				}
			});


		});


	//목록 가져오는 함수 sort로 가져오는거까지
	function getList(currentPage, keyword,mode,sortName) {
		//회원 목록
		let data = {
			"currentPage" : nvl(currentPage, "1"),
			"keyword" : nvl(keyword, ""),
			"mode" : nvl(mode, "0"),
			"sortName" : nvl(sortName, "")
		}
		console.log("data :", data);

		$.ajax({
			url : "/manageGroupAjax/groupListSortAjax",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "json",
			success : function(articlePage) {
				console.log("articlePage :", articlePage);
				console.log("articlePage.content :", articlePage.content);


				let str = "";
				$.each(articlePage.content,function(idx,GroupsVO){
					 let groupBirth = new Date(nvl(GroupsVO.groupBirth,""));
					 let groupDspgn = new Date(nvl(GroupsVO.groupDspgn),"");

					  let formatGroupBirth = "";
					    if (!isNaN(groupBirth)) {
					        formatGroupBirth = groupBirth.getFullYear() + '-'
					                        + String(groupBirth.getMonth() + 1).padStart(2, '0') + '-'
					                        + String(groupBirth.getDate()).padStart(2, '0');
					    }
						let formatGroupDspgn = "";
					    if (!isNaN(groupDspgn)) {
					        formatGroupDspgn = groupDspgn.getFullYear() + '-'
					                        + String(groupDspgn.getMonth() + 1).padStart(2, '0') + '-'
					                        + String(groupDspgn.getDate()).padStart(2, '0');
					    }

					    console.log(formatGroupBirth);  // "2025-01-06"

					str+=`<tr style="cursor: pointer;" data-toggle="modal" data-group-no="\${GroupsVO.groupNo}" data-target="#modalInfo" id="btnUpdateSet">
                    <td>\${GroupsVO.groupNo}</td>
                    <td><a >\${GroupsVO.groupName}</a></td>
                    <td>`+nvl(formatGroupBirth,"")+`</td>
                    <td>`+ formatGroupDspgn	+`</td>
	                    <td>\${GroupsVO.groupBirthInputter}</td>
                  </tr>`;
				});//endeach
				$("#tby").html(str);
				$("#divPagingArea").html(articlePage.pagingArea);

			}
		});
	}//end getList()



	//document.ready
	//동일 jsp에서 1회 작성
	$(function() {
		getList("1", "","0",sortName);
        const upIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-up icon" viewBox="0 0 16 16"><path d="M3.204 11h9.592L8 5.519zm-.753-.659 4.796-5.48a1 1 0 0 1 1.506 0l4.796 5.48c.566.647.106 1.659-.753 1.659H3.204a1 1 0 0 1-.753-1.659"/></svg>';
        const upIconChk = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-up-fill" viewBox="0 0 16 16"> <path d="m7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/></svg>';
        const downIcon='<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down" viewBox="0 0 16 16">  <path d="M3.204 5h9.592L8 10.481zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659"/> </svg>'
        const downIconChk='<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16"> <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/></svg>'
        	memId="";
        	   $('.up').removeClass('active').html('').append(upIcon);
        $('.down').removeClass('active').html('').append(downIcon);


		 $.ajax({
        url: '/api/userInfo',
        method: 'GET',
        success: function(data) {
            console.log("로그인 정보: ", data)
             memId = data.memId; // 서버에서 받은 사용자 정보
            console.log("memId: ", memId)
        },
        error: function(xhr, status, error) {
            console.error('로그인 정보 가져오기 실패:', error);
        }
    });
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
// 				alert("이미지 확장자만 가능합니다");
				return;//함수 종료
			}
			//이미지 읽기
			let reader = new FileReader();
			//e : 읽는 이벤트
			reader.onload = function(e){
				let img = "<img src='" + e.target.result + "' style='width:100%; height: 100%' />";
				//누적 : append(), 덮어쓰기 : html()
				$("#divImage").append(img);
			}
			reader.readAsDataURL(f);
		});

	}
	function handleImgUpload(e){
		console.log("근똥이");

		//이미지 오브젝트들
		let files = e.target.files;

		//이미지 오브젝트 배열(a.jpgb.jpgc.jpg)
		let fileArr = Array.prototype.slice.call(files);

		//미리보기 영역 초기화
		$("#divImageSet").html("");

		fileArr.forEach(function(f){
			if(!f.type.match("image.*")){
// 				alert("이미지 확장자만 가능합니다");
				return;//함수 종료
			}
			//이미지 읽기
			let reader = new FileReader();
			//e : 읽는 이벤트
			reader.onload = function(e){
				let img = "<img src='" + e.target.result + "' style='width:100%; height: 100%' />";
				//누적 : append(), 덮어쓰기 : html()
				$("#divImageSet").append(img);
			}
			reader.readAsDataURL(f);
		});

	}

	$(function(){
		$("#uploadFiles").on("change",handleImg);
		$("#uploadFilesUpload").on("change",handleImgUpload);
	});


	/*  */

	const modalArtistSearch = document.getElementById('modalArtistSearch');
const modalInfo = document.getElementById('modalInfo');

// 모달ArtistSearch 열릴 때 z-index 조정
// modalArtistSearch.addEventListener('show.bs.modal', () => {
//   document.querySelector('.modal-backdrop').style.zIndex = 1040; // 기존 백드롭 z-index
//   modalInfo.style.zIndex = 1035; // 첫 번째 모달 z-index 낮춤
// });

// // 모달ArtistSearch 닫힐 때 z-index 복원
// modalArtistSearch.addEventListener('hidden.bs.modal', () => {
//   modalInfo.style.zIndex = '';
//   document.querySelector('.modal-backdrop').style.zIndex = '';
// });
// modalArtistSearch.addEventListener('show.bs.modal', () => {
// 	  document.body.style.overflow = 'hidden';
// 	});

// 	modalArtistSearch.addEventListener('hidden.bs.modal', () => {
// 	  document.body.style.overflow = '';
// 	});

</script>
			<%@ include file="../include/footer.jsp"%>