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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<style>
table th {
	text-align: center;
	/* 	font-size: 10px;" */
}

.flex-container {
	display: flex;
	align-items: center; /* 수직 정렬 */
	gap: 10px; /* 요소 간 간격 */
}
</style>

<div class="content-wrapper" style="background-color: white;">
	<!--     Content Header (Page header) -->
	<div class="content-header">
		<div class="row mb-2">
			<div class="col-sm-6"></div>
			<!-- /.col -->
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="/companypage/main">companypage</a></li>
					<li class="breadcrumb-item active">동영상●라이브 관리</li>
				</ol>
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
		<!-- /.container-fluid -->
	</div>

	<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
	<!-- sweetAlert -->
	<link rel="stylesheet"
		href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
	<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
	<!-- ///// content 시작 ///// -->

	<section class="content">
		<h2 class="pageTitle">동영상●라이브 관리</h2>
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 col-sm-12">
					<div class="card card-primary card-tabs">
						<div class="card-header p-0 pt-1">
							<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="custom-tabs-one-home-tab" data-toggle="pill"
									href="#custom-tabs-one-home" role="tab"
									aria-controls="custom-tabs-one-home" aria-selected="false">아카이브
										목록</a></li>
								<li class="nav-item"><a class="nav-link "
									id="custom-tabs-one-profile-tab" data-toggle="pill"
									href="#custom-tabs-one-profile" role="tab"
									aria-controls="custom-tabs-one-profile" aria-selected="true">라이브
										관리</a></li>

							</ul>
						</div>
						<div class="card-body">
							<div class="tab-content" id="custom-tabs-one-tabContent">
								<div class="tab-pane fade show active" id="custom-tabs-one-home"
									role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
									<div class="card">
										<div class="card-header">
											<div class="card-tools">
												<div class="input-group input-group-sm"
													style="width: 150px;">
													<input type="text" name="keyword" value="${param.keyword}"
														class="form-control float-right" placeholder="검색어 입력" />

													<div class="input-group-append">
														<button type="button" ID="btnSearch"
															class="btn btn-default">
															<i class="fas fa-search"></i>
														</button>
													</div>
												</div>
												<!-- /// 검색 끝 /// -->
											</div>
											<!-- 							<table style="border: solid"> -->
											<!-- 								<thead> -->
											<!-- 									<tr> -->
											<!-- 										<th>aaaa</th> -->
											<!-- 									</tr> -->
											<!-- 								</thead> -->
											<!-- 								<tbody> -->
											<!-- 									<td>asdas</td> -->
											<!-- 									<td>asdas</td> -->
											<!-- 									<td>asdas</td> -->
											<!-- 								</tbody> -->
											<!-- 							</table> -->
											<!-- 만들기 -->
											<!-- 								<tbody id="tby"> -->


											<!-- 								</tbody>	 -->

											<div class="container1">

												<!-- 동영상 카드 -->
												<div class="box">
													<img class="thumbnail"
														src="https://via.placeholder.com/150" alt="Thumbnail">
													<div class="title">Video Title 1</div>
													<div class="info">
														<div class="uploader">올린이: User1</div>
														<div class="date">2025-01-26</div>
													</div>
												</div>

											</div>
											<!-- 만들기 끝-->
										</div>
									</div>
									<!-- /.card-header -->

									<div class="card-body table-responsive p-0" id="divDetailArea">

									</div>
									<!-- /.card-body -->
									<!-- card-footer 시작 -->
									<div class="card-footer" id="divPagingArea"></div>

								</div>
								<div class="tab-pane fade  " id="custom-tabs-one-profile"
									role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">

									<div class="card">
										<div class="card-header">


											<div class="container2">

												<!-- 동영상 카드 -->
												<div class="box">
													<img class="thumbnail"
														src="https://via.placeholder.com/150" alt="Thumbnail">
													<div class="title">Video Title 1</div>
													<div class="info">
														<div class="uploader">올린이: User1</div>
														<div class="date">2025-01-26</div>
													</div>
												</div>

											</div>
											<!-- 만들기 끝-->
										</div>
									</div>
									<!-- /.card-header -->

									<div class="card-body table-responsive p-0" id="divDetailArea">

									</div>
									<!-- /.card-body -->
									<!-- card-footer 시작 -->
									<div class="card-footer" id="divPagingArea2"></div>

								</div>
							</div>
							<!-- /.card -->
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
</div>



<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- sweetAlert -->
<link rel="stylesheet"
	href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>

<style>

/* 전체 컨테이너 설정 */
.container1 {
	display: flex;
	flex-wrap: wrap; /* 여러 줄로 배치 */
	gap: 20px; /* 카드 간격 */
	width: 100%;
	justify-content: space-between; /* 카드 간격 균등 분배 */
	padding: 20px; /* 컨테이너 패딩 */
	box-sizing: border-box;
}

/* 동영상 카드 스타일 */
.box {
	width: calc(25% - 20px); /* 한 줄에 4개 배치 */
	background-color: #ffffff; /* 배경색 흰색 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 */
	border-radius: 12px; /* 둥근 모서리 */
	overflow: hidden; /* 내용이 넘치지 않도록 설정 */
	display: flex;
	flex-direction: column; /* 세로 방향 배치 */
	justify-content: flex-start; /* 위쪽 정렬 */
	align-items: center;
	box-sizing: border-box;
	padding: 10px;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

/* 카드 hover 효과 */
.box:hover {
	transform: translateY(-5px); /* 살짝 위로 이동 */
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* 그림자 강조 */
}

/* 썸네일 이미지 스타일 */
.thumbnail {
	width: 100%; /* 카드 너비에 맞게 */
	aspect-ratio: 16/9; /* 가로세로 비율 */
	background-color: #ddd; /* 썸네일 없을 때 기본 배경색 */
	border-radius: 8px;
	margin-bottom: 10px;
	object-fit: cover; /* 이미지 크기 조정 */
}

/* 제목 스타일 */
.title {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 8px;
	color: #333;
	text-align: center;
}

/* 하단 정보 영역 */
.info {
	display: flex;
	justify-content: space-between;
	width: 100%;
	font-size: 14px;
	color: #666;
	padding: 0 10px;
	margin-top: 8px;
}

.uploader {
	font-weight: bold;
}

.date {
	text-align: right;
	font-style: italic;
}

/* 버튼 영역 */
.actions {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	margin-top: 10px;
	padding: 0 10px;
}

.actions button {
	padding: 5px 10px;
	border: none;
	border-radius: 6px;
	font-size: 14px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.actions .public-btn {
	background-color: #4caf50; /* 초록색 */
	color: white;
}

.actions .public-btn.private {
	background-color: #f44336; /* 빨간색 */
}

.actions .view-count {
	font-weight: bold;
}

.actions button:hover {
	opacity: 0.8;
}
</style>
<!-- 모든 페이지에 이거 추가해야함 -->
<
	<script type="text/javascript">


let keyword="";
let sortName="groupNo";
let mode="0";
let groupNo=0;
function nvl(expr1, expr2) {
	if (expr1 === undefined || expr1 == null || expr1 == "") {
		expr1 = expr2;
	}
	return expr1;
}
$(document).on("click","#checkStatus",function(){
	let vodNo = $(this).data("vodNo");
	let data = {
			"vodNo" : nvl(vodNo, "1")
		}
		console.log("data :", data);

		$.ajax({
			url : "/manageVodAjax/updataStatusAjax",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "json",
			success : function(result) {



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
						title : '변경성공'
					});
     	            $("#btnRegist").prop("disabled", true);

					setTimeout(function(){
					 	getList("1", keyword,"",sortName);
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
})
})


/*
		            	 let data = {
		            		        "memId": memId,            // 사용자 ID
		            		        "liveName": liveName,      // 라이브 제목
		            		        "memshipState": memshipState, // 체크박스 상태 (1 또는 0)
		            		        "liveNo": liveNo // 라이브 방 번호
		            		    };
		            	    console.log("끝내기 data", data);

		            		    fetch(`/${groupNo}/endLiveAjax`, {
		            		        method: 'POST',
		            		        headers: {
		            		            'Content-Type': 'application/json'  // 데이터가 JSON 형식임을 명시
		            		        },
		            		        body: JSON.stringify(data)  // 데이터: JSON 문자열
		            		    })
		            		    .then(response => response.json(

		            		    		))

		            		    .catch(error => {
		            		        console.error("Error during sending data:", error);
		            		    });
		            		    Swal.fire({
									title:'방송이 종료되었습니다.',
								      showConfirmButton: false,
						  icon: "question",
						      timer: 1500

						});
   	            	            $("#liveEnd").prop("disabled", true);

		            		});
		            		*/
$(document).on("click","#endLive",function(){
	let liveNo = $(this).data("liveNo");
	let memId = $(this).data("memId");
	let memshipState = $(this).data("memshipState");
	let liveName = $(this).data("liveName");
	 let data = {
		        "memId": memId,            // 사용자 ID
		        "liveName": liveName,      // 라이브 제목
		        "memshipState": memshipState, // 체크박스 상태 (1 또는 0)
		        "liveNo": liveNo // 라이브 방 번호
		    };
		console.log("data :", data);

		$.ajax({
			url : "/manageVodAjax/endLive",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "json",
			success : function(result) {



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
						title : '종료'
					});

					setTimeout(function(){
					 	getList("1", keyword,"",sortName);
					 	getLiveList("1", keyword,"",sortName);
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
						title : '종료 실패'
					});
				}
			}
})
})
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
		url : "/manageVodAjax/vodListSortAjax",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data),
		type : "POST",
		dataType : "json",
		success : function(articlePage) {
			console.log("articlePage :", articlePage);
			console.log("articlePage.content :", articlePage.content);


			let str = "";
			$.each(articlePage.content, function(idx, VodVO) {
			    let groupBirth = new Date(nvl(VodVO.groupBirth, ""));

			    let formatGroupBirth = "";
			    if (!isNaN(groupBirth)) {
			        formatGroupBirth = groupBirth.getFullYear() + '-'
			            + String(groupBirth.getMonth() + 1).padStart(2, '0') + '-'
			            + String(groupBirth.getDate()).padStart(2, '0');
			    }

			    str += `
			        <div class="box">
			            <img class="thumbnail" src="\${VodVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}">
			            <div class="title">\${VodVO.vodName}</div>
			            <div class="info">
			                <div class="uploader">올린이: \${VodVO.memId}</div>
			                <div class="date">2025-01-26</div>
			            </div>
			            <div class="actions">
			                <div class="view-count">조회수: <span id="viewCount1">\${VodVO.vodView}</span></div>
			                <button class="public-btn" id="checkStatus" data-vod-no="\${VodVO.vodNo}"
			                    style="background-color: \${VodVO.vodStatus === 0 ? '' : 'red'};">
			                    \${VodVO.vodStatus === 0 ? '공개' : '비공개'}
			                </button>
			            </div>
			        </div>
			    `;
			});

			$(".container1").html(str);
			$("#divPagingArea").html(articlePage.pagingArea);
/*<div class="box">
									<img class="thumbnail" src="https://via.placeholder.com/150"
										alt="Thumbnail">
									<div class="title">Video Title 1</div>
									<div class="info">
										<div class="uploader">올린이: User1</div>
										<div class="date">2025-01-26</div>
									</div>
								</div>  */
		}
	});
}//end getList()
function getLiveList(currentPage, keyword, mode, sortName) {
	//회원 목록
	let data = {
		"currentPage" : nvl(currentPage, "1"),
		"keyword" : nvl(keyword, ""),
		"mode" : nvl(mode, "0"),
		"sortName" : nvl(sortName, "")
	}
	console.log("data :", data);

	$.ajax({
		url : "/manageVodAjax/liveListAjax",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data),
		type : "POST",
		dataType : "json",
		success : function(articlePage) {
			console.log("articlePage2 :", articlePage);
			console.log("articlePage.content2 :", articlePage.content);

			let str = "";

			if (articlePage.content.length === 0) {
				str = `<div class="no-live-msg">현재 라이브 중인 방송이 없습니다.</div>`;
			} else {
				$.each(articlePage.content, function(idx, liveVO) {
					let groupBirth = new Date(nvl(liveVO.liveDate, ""));
					let formatGroupBirth = "";
					if (!isNaN(groupBirth)) {
						formatGroupBirth = groupBirth.getFullYear() + '-'
							+ String(groupBirth.getMonth() + 1).padStart(2, '0') + '-'
							+ String(groupBirth.getDate()).padStart(2, '0');
					}

					str += `
						<div class="box">
							<img class="thumbnail" src="\${liveVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}">
							<div class="title">\${liveVO.liveName}</div>
							<div class="info">
								<div class="uploader">올린이: \${liveVO.memId}</div>
								<div class="date">2025-01-26</div>
							</div>
							<div class="actions">
								<div class="view-count">조회수: <span id="viewCount1">\${liveVO.liveView}</span></div>
								<button class="public-btn" id="endLive" data-live-no="\${liveVO.liveNo}" data-live-name="\${liveVO.liveName}"
									data-mem-id="\${liveVO.memId}" data-memship-state="\${liveVO.memshipState}">
									방송 종료
								</button>
							</div>
						</div>
					`;
				}); // end each
			}

			$(".container2").html(str);
			$("#divPagingArea2").html(articlePage.pagingArea);
		}
	});
} // end getLiveList()

$("#btnSearch").on('click',function(){
	//input type="text" name="keyword"...
 	keyword = $("input[name='keyword']").val();//길동
 	console.log("keyword", keyword);

 	//전역함수 호출
 	getList("1", keyword,"",sortName);
	})

$(function() {
	getList("1", "","0",sortName);
	getLiveList("1", "","0",sortName);
})
</script>
	<%@ include file="../include/footer.jsp"%>


	<!-- ///// content 끝 ///// -->

	<%@ include file="../include/footer.jsp"%>