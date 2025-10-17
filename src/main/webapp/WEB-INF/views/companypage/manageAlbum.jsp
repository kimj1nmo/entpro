<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- sweetAlert -->
<link rel="stylesheet"
	href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>

<!-- ///// content 시작 ///// -->
<!-- 모든 페이지에 이거 추가해야함 -->
<div class="content-wrapper">
	<!--     Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/companypage/main">/companypage</a></li>
						<li class="breadcrumb-item active">manageArtist</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
<section class="content">
	<div class="container-fluid">
		<!-- ///// content 시작 ///// -->
		<h3>앨범</h3>
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">웰범 목록</h3>
						<p>${articlePage.content}</p>
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
				<div class="card-body table-responsive p-0">
					<!-- 성명으로 오름차순 정렬 -->
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th value="albumNo">
								번호
								<span class="up"></span>
								<span class="down"></span>
								</th>
								<th value="albumTtl">앨범제목
								<span class="up"></span>
								<span class="down"></span>
								</th>
								<th value="groupName">그룹
								<span class="up"></span>
								<span class="down"></span>
								</th>
								<th value="artistName">이름
								<span class="up"></span>
								<span class="down"></span>
								</th>
								<th value="albumDate">
								웰범 발매일
								<span class="up"></span>
								<span class="down"></span>
								</th>
								<th value="albumRegDate">
								앨범 내용 번경일
								<span class="up"></span>
								<span class="down"></span>
								</th>
								<th value="albumInputter">
								앨범 최종 번경자
								<span class="up"></span>
								<span class="down"></span>
								</th>
							</tr>
						</thead>
						<tbody id="tby">


						</tbody>
					</table>
				</div>
				<div class="card-body table-responsive p-0" id="divDetailArea">
				</div>
				<!-- /.card-header -->
<div class="col-12" style="justify-content: right; display: flex;">
			<a data-toggle="modal" data-target="#modalAdd"
				class="btn btn-primary">등록</a>
		</div>
				</div>
				<!-- /.card-body -->
				<!-- card-footer 시작 -->
				<div class="card-footer" id="divPagingArea"></div>
				<!-- card-footer 끝 -->
			</div>
			<!-- /.card -->

		</div>


		<!-- ///// content 끝 ///// -->
	</div>
	<!-- /.container-fluid -->
</section>


<!-- /// 아티스트 등록 모달 시작 /// -->
<div class="modal fade" id="modalAdd">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">아티스트 추가</h4>
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
							<button id="memIdChk" type="button"
								class="btn btn-block btn-success btn-sm">아이디확인</button>

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

							<input type="text"	class="form-control" id="memIdUp" placeholder="아이디" hidden/>
							<input type="text"	class="form-control" id="artistNoUp" placeholder="넘버" hidden/>

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
				<button type="button" id="btnUpdate" class="btn btn-primary"
					>수정</button>
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
	 let sortName="albumNo";
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
								timer : 3000
							});
							Toast.fire({
								icon : 'success',
								title : '등록성공'
							});
							setTimeout(function(){
								location.href="/companypage/manageArtist";
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
					timer : 3000
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
					timer : 3000
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
			      timer: 3000
			    });

			Toast.fire({
				icon:'error',
				title:'오류가 발생했습니다.'
			});
			$("#btnRegist").attr("disabled", true);

		}
	})

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
					$("#artistBirthUp").val(artistVO.artistBirth);
					$("#artistNoUp").val(artistVO.artistNo);

				}
			});


		});


	//목록 가져오는 함수 sort로 가져오는거까지
function getList(currentPage, keyword, mode, sortName) {
    // 회원 목록
    let data = {
        "currentPage": nvl(currentPage, "1"),
        "keyword": nvl(keyword, ""),
        "mode": nvl(mode, "0"),
        "sortName": nvl(sortName, "")
    };
    console.log("data :", data);

    $.ajax({
        url: "/manageAlbumAjax/albumListAjax",
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(data),
        type: "POST",
        dataType: "json",
        success: function(articlePage) {
            console.log("articlePage :", articlePage);
            console.log("articlePage.content :", articlePage.content);

            let str = "";

            $.each(articlePage.content, function(idx, AlbumVO) {

                let albumDate = new Date(nvl(AlbumVO.albumDate,""));
				 let albumRegDate = new Date(nvl(AlbumVO.albumRegDate),"");

				  let formatAlbumDate = "";
				    if (!isNaN(albumDate)) {
				    	formatAlbumDate = albumDate.getFullYear() + '-'
				                        + String(albumDate.getMonth() + 1).padStart(2, '0') + '-'
				                        + String(albumDate.getDate()).padStart(2, '0');
				    }
					let formatAlbumRegDate = "";
				    if (!isNaN(albumRegDate)) {
				    	albumRegDate = albumRegDate.getFullYear() + '-'
				                        + String(albumRegDate.getMonth() + 1).padStart(2, '0') + '-'
				                        + String(albumRegDate.getDate()).padStart(2, '0');
				    }



                console.log("AlbumVO :", AlbumVO);

                // 수정된 부분: 문자열 템플릿 문법에 맞게 변경
                str += `
                    <tr data-widget="expandable-table" aria-expanded="false">
                        <td>\${AlbumVO.albumNo}</td>
                        <td>\${AlbumVO.albumTtl}</td>
                        <td>\${AlbumVO.groupName}</td>
                        <td>\${AlbumVO.groupName}</td>
                        <td>\${formatAlbumDate}</td>
                        <td>\${formatAlbumRegDate}</td>
                        <td>\${nvl(AlbumVO.albumInputter,"")}</td>
                    </tr>
                    <tr class="expandable-body d-none">
                        <td colspan="7">
                        <table border="1" style="width: 100%; margin-top: 10px; border-collapse: collapse;">
                        <thead>
                            <tr>
                                <th>곡번호</th>
                                <th>곡 제목</th>
                                <th>플레이 시간</th>
                                <th>작사가</th>
                                <th>작곡가</th>
                            </tr>
                        </thead>
                        <tbody>
                                    `;
                            $.each(AlbumVO.soundInfoList, function(idx, soundVO) {
                                str+=`

                                <tr>
                                	<td>\${soundVO.soundInfoNo}</td>
                                	<td>\${soundVO.soundInfoTtl}</td>
                                	<td>\${soundVO.soundInfoPlaytime}</td>
                                	<td>\${soundVO.soundSourceLyrics}</td>
                                	<td>\${nvl(soundVO.soundSourceComposer,"")}</td>

                                `

                            });
              str+=`
                        </tr>
                  </tbody>
                  </table>
              	<button type="button" class="btn btn-primary"
					>곡 추가</button>
                    </tr>
                `;
            }); // end each
            $("#tby").html(str);
            $("#divPagingArea").html(articlePage.pagingArea);

        }
    });
} // end getList()




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

		//검색 처리
		$("#btnSearch").on('click', function() {
			//input type="text" name="keyword"...
			let keyword = $("input[name='keyword']").val();//길동
			console.log("keyword", keyword);

			//전역함수 호출
			getList("1", keyword,"0",sortName);
		})

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
<%@ include file="../include/footer.jsp"%>
