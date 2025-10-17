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

.chart-wrapper {
	display: flex;
	width: 100%;
}

/* 차트 영역 (좌측) */
#chart-container {
	width: 100%; /* 차트는 화면의 절반 */
	display: flex;
	justify-content: center;
	align-items: center;
}

/* 버튼 영역 (우측) */
#button-container {
	width: 40%; /* 버튼 영역은 화면의 절반 */
	display: flex;
	flex-direction: column; /* 버튼들을 세로로 배치 */
	justify-content: space-between; /* 위 아래로 배치 */
	gap: 10px; /* 위아래 버튼들 사이의 간격 */
}

/* 위쪽 버튼 컨테이너 */
#button-top-container {
	display: flex;
	justify-content: space-evenly; /* 버튼들을 좌우로 배치 */
}

/* 아래쪽 버튼 컨테이너 */
#button-bottom-container {
	display: flex;
	justify-content: space-evenly; /* 버튼들을 좌우로 배치 */
	gap: 10px;
}

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
	font-weight: bold;
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
					<li class="breadcrumb-item active">입고·재고 관리</li>
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
		<h2 class="pageTitle">입고·재고 관리</h2>
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 col-sm-12">
					<div class="card card-primary card-tabs">
						<div class="card-header p-0 pt-1">
							<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="custom-tabs-one-home-tab" data-toggle="pill"
									href="#custom-tabs-one-home" role="tab"
									aria-controls="custom-tabs-one-home" aria-selected="false">재고
										목록</a></li>
								<li class="nav-item"><a class="nav-link "
									id="custom-tabs-one-profile-tab" data-toggle="pill"
									href="#custom-tabs-one-profile" role="tab"
									aria-controls="custom-tabs-one-profile" aria-selected="true">입고
										목록</a></li>

							</ul>
						</div>
						<div class="card-body">
							<div class="tab-content" id="custom-tabs-one-tabContent">
								<div class="tab-pane fade show active" id="custom-tabs-one-home"
									role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">

									<div class="chart-wrapper">
										<!-- 차트 영역 (좌측) -->
										<div id="chart-container">
											<canvas id="myChart"></canvas>
										</div>

										<!-- 버튼 영역 (우측) -->
									</div>
									<div id="button-container">
										<!-- 위쪽 버튼들 (4개) -->
										<div id="button-top-container">
											<button type="button" class="btn  btn-info "
												id="loadChartBtn">월간판매순위</button>
											<!-- 											<button type="button" class="btn  btn-warning " -->
											<!-- 												id="loadChart2Btn">안전 재고 위험</button> -->
											<button type="button" class="btn  bg-success color-palette "
												id="loadChart3Btn">전월 대비 판매량</button>
										</div>

										<!-- 아래쪽 버튼들 (2개) -->
										<div id="button-bottom-container"></div>
									</div>
									<div class="flex-container">
										<div class="dropdown">
											<button class="btn btn-secondary dropdown-toggle"
												type="button" id="yearDropdown" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false" hidden>
												전체 보기</button>
											<div class="dropdown-menu" aria-labelledby="groupDropdown"></div>
										</div>
										<div id="putAudition"></div>
									</div>

									<script type="text/javascript">

</script>

									<table class=" table-bordered table-hover"
										style="width: 50%; max-width: 500px;">
										<thead>
											<tr>
												<th id="">총 상품</th>
												<th id="">현재고10개이하</th>
												<th id="">품절</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td id="total" style="text-align: right; cursor: pointer;">a</td>
												<td id="underTen"
													style="text-align: right; cursor: pointer;">a</td>
												<td id="soldOut" style="text-align: right; cursor: pointer;">a</td>
											</tr>
										</tbody>
									</table>
									<div class="card-header"
										style="display: flex; justify-content: flex-end;">

										<div class="card-tools">
											<div class="input-group input-group-sm" style="width: 150px;">
												<input type="text" name="keywordJaego"
													value="${param.keyword}" class="form-control float-right"
													placeholder="검색어 입력" />

												<div class="input-group-append">
													<button type="button" ID="btnSearchJaego"
														class="btn btn-default">
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
													<th>상품 번호</th>
													<th>상품 이름</th>
													<th>현재고량</th>
													<th>입고량</th>
													<th>출고량</th>
												</tr>
											</thead>
											<tbody id="tbyJaego">


											</tbody>
										</table>
										<div class="card-footer" id="divPagingAreaJaego"
											style="background-color: white; flex-grow: 1;"></div>
									</div>
									<div
										class="card-footer2 d-flex justify-content-between align-items-center">
										<div id="divDetailArea"
											style="background-color: white; flex-grow: 1;"></div>
										<div class="d-flex" style="gap: 15px; padding-right: 15px;">
										</div>
									</div>
									<div class="card-body table-responsive p-0" id="divDetailArea">




									</div>



								</div>
								<div class="tab-pane fade  " id="custom-tabs-one-profile"
									role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">

									<div class="card-header"
										style="display: flex; justify-content: flex-end;">

										<div class="card-tools">
											<div class="input-group input-group-sm" style="width: 150px;">
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
									</div>
									<!-- /.card-header -->
									<div class="card-body table-responsive p-0">
										<!-- 성명으로 오름차순 정렬 -->
										<table class="table table-bordered table-hover">
											<thead>
												<tr>
													<th>입고번호</th>
													<th>상품번호</th>
													<th>업체</th>
													<th>단가</th>
													<th>수량</th>
													<th>입고 담당자</th>
													<th>입고 날짜</th>
													<th>삭제</th>
												</tr>
											</thead>
											<tbody id="tby">


											</tbody>
										</table>
									</div>
									<div
										class="card-footer2 d-flex justify-content-between align-items-center">
										<div id="divPagingArea"
											style="background-color: white; flex-grow: 1;"></div>
										<div class="d-flex" style="gap: 15px; padding-right: 15px;">
											<button id="regBtn" data-toggle="modal"
												data-target="#modalAdd" class="btn btn-primary me-2">등록</button>
										</div>
									</div>


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






<div class="modal fade" id="modalAdd" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">
					입고 등록
					<button type="button" class="btn btn-warning" id="previewBtn">시연용</button>

					<script type="text/javascript">
	                  // 시연용 값 채워질 버튼
	                  $("#previewBtn").on("click", function(){
	                     $("#wrhousngSupplierPut").val("(주)푸른서적");
	                     $("#wrhousngQyPut").val(40);
	                     $("#wrhousngPricePut").val(20000);
	                  })
	                  </script>
				</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group row">
					<label for="inputEmail3" class="col-sm-2 col-form-label">상품</label>
					<input type="text" class="form-control" id="gdsNoPut"
						placeholder="클릭해주세요" hidden>
					<div class="col-sm-10" id="aaads">
						<input type="text" class="form-control" id="gdsNamePut"
							placeholder="클릭해주세요" readonly>

					</div>
				</div>
				<div class="form-group row">
					<label for="inputEmail3" class="col-sm-2 col-form-label">업체</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="wrhousngSupplierPut"
							placeholder="공급 업체">
					</div>
				</div>
				<div
					style="display: flex; justify-content: space-between; align-items: center; gap: 15px; margin-top: 10px; margin-bottom: 10px;">
					<label for="exampleInputEmail1">입고 갯수</label> <input type="number"
						class="form-control" id="wrhousngQyPut" placeholder="입고 갯수"
						style="flex: 1; margin-right: 10px; padding: 10px;"> <label
						for="exampleInputEmail1">입고 단가</label> <input type="number"
						class="form-control" id="wrhousngPricePut" placeholder="입고 가격"
						style="flex: 1; padding: 10px;">
				</div>

			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" id="wrhousngInsert">등록</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>





<script type="text/javascript">

function nvl(expr1, expr2) {

	if (expr1 === undefined || expr1 == null || expr1 == "") {
		expr1 = expr2;
	}
	return expr1;
}
let memId = `<%=session.getAttribute("memId") != null ? session.getAttribute("memId") : "Guest"%>`;

let keyword="";
let sortName="groupNo";
let mode="0";

let chartSel=0;
let year=0;
let month=0;
let Check=0;

let sortNameJaego="groupNo";
let keywordJaego="";
let modeJaego="0";
let check=0;

function receiveSelectGoods(goods) {
	console.log("goods:",goods);
    $("#gdsNamePut").val(goods.gdsNm);
    $("#gdsNoPut").val(goods.gdsNo);
    $("#gdsNoPut").val(goods.gdsNo);
}
$("#gdsNamePut").on('click',function(){
    window.open('/companypage/goodsInput', '물건 검색', 'width=1200,height=600');
	});

$("#wrhousngInsert").on('click',function(){

	//1. 가상 폼(이미지 포함) <form></form>
	let formData = new FormData();

	//2. 엘리먼트들을 가상 폼에 넣기
	let gdsNoPut = $("#gdsNoPut").val();
	let wrhousngSupplierPut = $("#wrhousngSupplierPut").val();
	let wrhousngPricePut = $("#wrhousngPricePut").val();
	let wrhousngQyPut = $("#wrhousngQyPut").val();

	console.log("memId",memId)
	formData.append("gdsNo", gdsNoPut);
	formData.append("wrhousngSupplier", wrhousngSupplierPut);
	formData.append("wrhousngPrice", wrhousngPricePut);
	formData.append("wrhousngQy", wrhousngQyPut);
	formData.append("memId", memId);


	$.ajax({
		url : "/stockManageAjax/wrhousngInsertAjax",
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
					location.href="/companypage/stockManage";
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


function updateTD(check) {
    // 모든 TD 초기화
    $("#total, #underTen, #soldOut").css("background-color", "");
    $("#total, #underTen, #soldOut").css("color", "");

    // check 값에 따라 스타일 변경
    if (check === 0) {
        $("#total").css("background-color", "gray");
        $("#total").css("color", "white");
    } else if (check === 1) {
        $("#underTen").css("background-color", "gray");
        $("#underTen").css("color", "white");
    } else if (check === 2) {
        $("#soldOut").css("background-color", "gray	");
        $("#soldOut").css("color", "white");
    }
}


	 $("input[name='keywordJaego']").on("keydown", function (event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    keywordJaego = $("input[name='keywordJaego']").val();//길동
                 	console.log("keywordJaego", keyword);

                 	//전역함수 호출
                 	getJaegoList("1", keywordJaego,"",sortName);

                }
            });
	$(function(){
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
		getStockList("1", "","0",sortName);
		getJaegoList("1", "","0",sortName);

// 		$(".dropdown-menu").html='';

		$.ajax({
		    type: "GET",
		    url: "/stockManageAjax/getYearsAjax", // 서버에서 12달 데이터를 반환하는 API 경로
		    dataType: "json",
		    success: function(response) {
		    	console.log("year",response);
		        let str = "";

		        $.each(response, function(idx, year) {
		            str += `<a class="dropdown-item year-item" href="#" data-year="\${year.YEAR}">\${year.YEAR}</a>`;
		        });

		        // 특정 요소에 추가
		        $(".dropdown-menu").html(str);
		    },
		    error: function(xhr, status, error) {
		        console.error("AJAX 오류:", error);
		    }
		});

	})
	$("#total").on('click',function(){

		check=0;
		updateTD(check);
		getJaegoList("1", keyword,"",sortName);

	})
	$("#underTen").on('click',function(){

		check=1;
		updateTD(check);
		getJaegoList("1", keyword,"",sortName);


	})
	$("#soldOut").on('click',function(){
		check=2;
		updateTD(check);
		getJaegoList("1", keyword,"",sortName);

	})

$("#btnSearchJaego").on('click',function(){
	//input type="text" name="keyword"...
 	keyword = $("input[name='keyword']").val();//길동
 	console.log("keyword", keyword);

 	//전역함수 호출
 	getStockList("1", keyword,"",sortName);
	})

	 $("input[name='keyword']").on("keydown", function (event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                 	keyword = $("input[name='keyword']").val();//길동
                 	console.log("keyword", keyword);

                 	//전역함수 호출
                 	getStockList("1", keyword,"",sortName);
                }
            });

	function getJaegoDb() {
		  $.ajax({
		        url: "/stockManageAjax/getJaegoDbAjax",
		        contentType: "application/json;charset=utf-8",
		        type: "get",
		        dataType: "json",
		        success: function (map) {
		            console.log(" map:", map);
		            /* 	<th id="total">총 상품 </th>
					<th id="underTen">재고 10개 이하</th>
					<th id="soldOut">품절</th>
					*/
		             $("#total").html(map.total+"개");
		             $("#underTen").html(map.underTen+"개");
		             $("#soldOut").html(map.soldOut+"개");

	        }
	    });
	}


function getJaegoList(currentPage, keyword, mode, sortName) {
    //회원 목록
    console.log("재고 등장 :");
    let dataJaego = {
        "currentPage": nvl(currentPage, "1"),
        "keyword": nvl(keyword, ""),
        "mode": nvl(mode, "0"),
        "sortName": nvl(sortName, ""),
        "check":nvl(check, "0"),
    };
    console.log("dataJaego :", dataJaego);

    $.ajax({
        url: "/stockManageAjax/jaegoListSortAjax",
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(dataJaego),
        type: "POST",
        dataType: "json",
        success: function (articlePage) {
            console.log("articlePage재고 :", articlePage);
            console.log("articlePage.content재고 :", articlePage.content);

            let str = "";

            // If there is content, populate the table rows
            if (articlePage.content && articlePage.content.length > 0) {
            	$.each(articlePage.content, function (idx, goodsVO) {

                    str += `<tr style="cursor: pointer;" data-gds-no="\${goodsVO.gdsNo}" id="modalIpgo"  data-toggle="modal"
						data-target="#modalAdd">
                        <td style="text-align: center;">\${goodsVO.gdsNo}</td>
                        <td>\${goodsVO.gdsNm}</td>
                        <td style="text-align: right;">\${goodsVO.remain.toLocaleString()}</td>
                        <td style="text-align: right;">\${goodsVO.wrhousngSum.toLocaleString()}</td>
                        <td style="text-align: right;">\${goodsVO.orderSum.toLocaleString()}</td>
                    </tr>`;
                });
            } else {
                // If no content, show the "No stock register" message
                str = `<tr><td colspan="6" style="text-align: center;">해당하는 상품이 없습니다.</td></tr>`;
            }

            // Update the table and paging area
            $("#tbyJaego").html(str);
            $("#divPagingAreaJaego").html(articlePage.pagingArea);
//             $("#allJaego").html(articlePage.total+"개");
            console.log("articlePage.total :", articlePage.total);
    		getJaegoDb();

        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.error("Ajax Error:", textStatus, errorThrown);

            // Show the error message if AJAX fails
            let errorMessage = `<tr><td colspan="6" style="text-align: center;">등록된 상품이 없습니다.</td></tr>`;
            $("#tbyJaego").html(errorMessage);
            $("#divPagingAreaJaego").html(""); // Clear paging area
        }
    });
}

		//목록 가져오는 함수 sort로 가져오는거까지
	function getStockList(currentPage, keyword, mode, sortName) {
    //회원 목록
    let data = {
        "currentPage": nvl(currentPage, "1"),
        "keyword": nvl(keyword, ""),
        "mode": nvl(mode, "0"),
        "sortName": nvl(sortName, "")
    }
    console.log("data :", data);

    $.ajax({
        url: "/stockManageAjax/stockListSortAjax",
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
                $.each(articlePage.content, function (idx, wrhousngVO) {

                	let maxLength=40;
                    let truncatedText=wrhousngVO.gdsNm;
                                    	  if (wrhousngVO.gdsNm.length > maxLength) {
                                    	       truncatedText = wrhousngVO.gdsNm.substring(0, maxLength) + "..."; // 잘라내고 '...' 추가
                                    	  }
                    let wrhousngDate = new Date(nvl(wrhousngVO.wrhousngDate, ""));
                    let formatWrhousngDate = "";
                    if (!isNaN(wrhousngDate)) {
                        formatWrhousngDate = wrhousngDate.getFullYear() + '-'
                            + String(wrhousngDate.getMonth() + 1).padStart(2, '0') + '-'
                            + String(wrhousngDate.getDate()).padStart(2, '0');
                    }
                    let formatWrhousngPrice=wrhousngVO.wrhousngPrice.toLocaleString();
                    let formatWrhousngQy=wrhousngVO.wrhousngQy.toLocaleString();

                    str += `<tr >
                        <td style="text-align: center;">\${wrhousngVO.wrhousngNo}</td>
                        <td style="text-align: left	;">\${truncatedText	}</td>
                        <td style="text-align: right;">\${wrhousngVO.wrhousngSupplier}</td>
                        <td style="text-align: right;">\${formatWrhousngPrice}</td>
                        <td style="text-align: right;">\${formatWrhousngQy}</td>
                        <td style="text-align: left;">\${wrhousngVO.memName}</td>
                        <td style="text-align: center;">\${formatWrhousngDate}</td>
                        <td style="text-align: center;"><button id="wrhousngDelete" data-wrhousng-no="\${wrhousngVO.wrhousngNo}" type="button" class="btn btn-danger btn-flat"><i class="fa-solid fa-minus"></i></button></td>
                    </tr>`;
                });
            } else {
                // If no content, show the "No stock register" message
                str = `<tr><td colspan="8" style="text-align: center;">해당하는 입고등록이 없습니다.</td></tr>`;
            }

            // Update the table and paging area
            $("#tby").html(str);
            $("#divPagingArea").html(articlePage.pagingArea);
    		getJaegoDb();

        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.error("Ajax Error:", textStatus, errorThrown);

            // Show the error message if AJAX fails
            let errorMessage = `<tr><td colspan="8" style="text-align: center;">등록된 입고등록이 없습니다.</td></tr>`;
            $("#tby").html(errorMessage);
            $("#divPagingArea").html(""); // Clear paging area
        }

    });

}
	$(document).on("click", "#modalIpgo", function() {
		let gdsNo = $(this).data("gdsNo");//2
		console.log("gdsNo",gdsNo);
		$("#gdsNoPut").val(gdsNo);
	    let data = {
		           "gdsNo":gdsNo
		        }
		    $.ajax({
		        url: "/stockManageAjax/getGdsNameAjax",
		        contentType: "application/json;charset=utf-8",
		        data: JSON.stringify(data),
		        type: "POST",
		        dataType: "json",
		        success: function (result) {
		    		console.log("result",result);
		    		$("#gdsNamePut").val(result.gdsNm);

		        }
		    })

	});
	$(document).on("click", "#wrhousngDelete", function() {

		//클릭한 것은 하나
		//<a .. data-current-page="2" data-keyword="".. class="page-link clsPagingArea">2</a>
		let wrhousngNo = $(this).data("wrhousngNo");//2


		const swalWithBootstrapButtons = Swal.mixin({
			  customClass: {
			    confirmButton: "btn btn-success",
			    cancelButton: "btn btn-danger"
			  },
			  buttonsStyling: false
			});
			swalWithBootstrapButtons.fire({
				  title: "",
				  text: "해당 입고 정보를 지우시겠습니까?",
			  icon: "warning",
			  showCancelButton: true,
			  confirmButtonText: "삭제",
			  cancelButtonText: "취소",
			  reverseButtons: true
			}).then((result) => {
			  if (result.isConfirmed) {
				    let data = {
					           "wrhousngNo":wrhousngNo
					        }
					    $.ajax({
					        url: "/stockManageAjax/wrhousngDelete",
					        contentType: "application/json;charset=utf-8",
					        data: JSON.stringify(data),
					        type: "POST",
					        dataType: "json",
					        success: function (result) {

					        }
					    })

			    swalWithBootstrapButtons.fire({
			      title: "삭제되었습니다.",
// 			      text: "Your file has been deleted.",
			      icon: "확인"
			    });

			    setTimeout(function(){
					location.href="/companypage/stockManage";
				},3000);
			  } else if (
			    /* Read more about handling dismissals below */
			    result.dismiss === Swal.DismissReason.cancel
			  ) {
// 			    swalWithBootstrapButtons.fire({
// 			      title: "Cancelled",
// 			      text: "Your imaginary file is safe :)",
// 			      icon: "error"
// 			    });
			  }
			});
	});
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
			getStockList(currentPage, keyword, mode, sortName);

		});

	$(document).on("click", ".clsPagingArea1", function() {

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
		getJaegoList(currentPage, keyword, mode, sortName);

	});
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



	$(document).on('click', '.year-item', function (e) {
        e.preventDefault(); // 기본 동작 방지
         year = $(this).data('year'); // 선택한 년도
        let yearSet = $(this).text();    // 선택한 년도 텍스트

        console.log("선택한 년도:", year);

        str=`
        	<div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="monthDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                전체 보기 <!-- 기본 텍스트 -->
            </button>
            <div class="dropdown-menu" aria-labelledby="groupDropdown">`

            for (let i = 1; i <= 12; i++) {
            let month = String(i).padStart(2, '0'); // 1자리 월을 2자리로 변경 (01, 02, ... 12)
            str += `<li><a class="dropdown-item month-item" href="#" data-month="\${month}">\${month}월</a></li>`;
        }

        str+=  `</div>
            </div>
            `;

        $('#putAudition').html(str);
        $('#yearDropdown').text(yearSet); // 버튼 텍스트 변경
    });

    // 월 선택 이벤트 추가
    $(document).on('click', '.month-item', function (e) {
        e.preventDefault();
         month = $(this).data('month');
        let monthSet = $(this).text();
        console.log("선택한 월:", month);
        console.log("chartSel", chartSel);

        if(chartSel==1){

        	  let data = {
				        'year': year,  // 선택한 년도
				        'month': month    // 선택한 월
				    };

				    $.ajax({
				        url: '/stockManageAjax/topProductsAjax',  // 데이터를 처리할 서블릿 URL
				        method: 'GET',
				        data: data,  // 원하는 년도와 월 데이터 전송
				        success: function(response) {
				            const labels = [];
				            const chartData = [];  // 'data'라는 이름 대신 'chartData'로 사용
				            console.log("version", Chart.version); // Chart.js 버전 확인

				            console.log("response", response);
				            response.forEach(function(item) {
				                labels.push(item.gdsNm);  // 상품 이름
				                chartData.push(item.totalOrderQuantity);  // 주문 수량
				            });

				            // 차트 생성 함수 호출
				            createTopChart(labels, chartData, 2025, 1);
				        },
				        error: function(xhr, status, error) {
// 				            alert("Error loading chart data");
				        }
				    });
        }
        if(chartSel==3){

        	  let data = {
				        'year': year,  // 선택한 년도
				        'month': month    // 선택한 월
				    };

				    $.ajax({
				        url: '/stockManageAjax/lastMonthProductsAjax',  // 데이터를 처리할 서블릿 URL
				        method: 'GET',
				        data: data,  // 원하는 년도와 월 데이터 전송
				        success: function(response) {
				            const labels = [];
				            const chartData = [];  // 'data'라는 이름 대신 'chartData'로 사용
				            console.log("version", Chart.version); // Chart.js 버전 확인

				            const lastMonthSales = [];
				            const currentMonthSales = [];
				            const growthRate = [];

				            console.log("response22", response);
				            response.forEach(function(item) {
				                labels.push(item.gdsNm);  // 상품 이름
				                lastMonthSales.push(item.lastMonthSales);  // 주문 수량
				                currentMonthSales.push(item.currentMonthSales);  // 주문 수량
				                growthRate.push(item.growthRate);  // 주문 수량
				            });

				            // 차트 생성 함수 호출
				            createMonthChart(labels, lastMonthSales, currentMonthSales,growthRate , 2025, 1);
				        },
				        error: function(xhr, status, error) {
// 				            alert("Error loading chart data");
				        }
				    });
        }
        $('#monthDropdown').text(monthSet);
    });


   // 버튼 클릭 시 AJAX 요청을 보내 차트 데이터 불러오기
   console.log(Chart.version);

   $('#loadChartBtn').click(function() {
	   chartSel=1;
        $('#yearDropdown').removeAttr('hidden');
        $('#putAudition').removeAttr('hidden');

        $('#yearDropdown').text("년도 선택");
        $('#monthDropdown').text("월별 선택");

	});

   $('#loadChart3Btn').click(function() {
	   chartSel=3;
        $('#yearDropdown').removeAttr('hidden');
        $('#putAudition').removeAttr('hidden');

        $('#yearDropdown').text("년도 선택");
        $('#monthDropdown').text("월별 선택");


	});
   $('#loadChart2Btn').click(function() {
	   chartSel=2;
	    $('#yearDropdown').attr('hidden', true);  // 'yearDropdown'에 hidden 속성 추가
	    $('#putAudition').attr('hidden', true);  // 'putAudition'에 hidden 속성 추가
		$.ajax({
		    type: "GET",
		    url: "/stockManageAjax/safetyStockAjax", // 서버에서 12달 데이터를 반환하는 API 경로
		    dataType: "json",
		    success: function(GoodsVO) {
				   console.log("안전제고",GoodsVO);


			         const labels = [];
			            const chartData = [];  // 'data'라는 이름 대신 'chartData'로 사용
			            console.log("version", Chart.version); // Chart.js 버전 확인

			            GoodsVO.forEach(function(item) {
			                labels.push(item.gdsNm);  // 상품 이름
			                chartData.push(item.remain);
			            });
			            createSaftyChart(labels, chartData);

		    }
		});


	});

	function createSaftyChart(labels, data) {
	    const canvas = document.getElementById('myChart');
	    const ctx = canvas.getContext('2d');

	    // 기존 차트가 있다면 삭제 후 새로 그리기
	    if (window.chart instanceof Chart) {
	        window.chart.destroy();  // 기존 차트 제거
	        ctx.clearRect(0, 0, canvas.width, canvas.height);  // 캔버스 초기화
	    }

	    // 최대값을 100 단위로 올림 설정
	    let maxValue = Math.max(...data);
	    maxValue = Math.ceil(maxValue / 100) * 100;  // 100 단위로 올림
	    if (maxValue < 100) maxValue = 100;  // 최소값을 100으로 설정

	    console.log("maxValue:", maxValue);  // 콘솔로 maxValue 확인

	    // 새로운 차트 생성
	    window.chart = new Chart(ctx, {
	        type: 'bar',  // 막대 차트
	        data: {
	            labels: labels,
	            datasets: [{
	                label: year + "안전재고",
	                data: data,
	                backgroundColor: 'rgba(54, 162, 235, 0.2)',
	                borderColor: 'rgba(54, 162, 235, 1)',
	                borderWidth: 1
	            }]
	        },
	        options: {
	            responsive: true,

	            scales: {
	            	yAxes: [{
						ticks: {
							fontSize : 14,
						}
		            	,beginAtZero: true
					}]

	            }
	          },
	    });

	    // 옵션이 정상적으로 적용되었는지 확인
	    console.log("Chart Options:", window.chart.options);
	}
	function createTopChart(labels, data, year, month) {
	    const canvas = document.getElementById('myChart');
	    const ctx = canvas.getContext('2d');

	    // 기존 차트가 있다면 삭제 후 새로 그리기
	    if (window.chart instanceof Chart) {
	        window.chart.destroy();  // 기존 차트 제거
	        ctx.clearRect(0, 0, canvas.width, canvas.height);  // 캔버스 초기화
	    }

	    // 최대값을 100 단위로 올림 설정
	    let maxValue = Math.max(...data);
	    maxValue = Math.ceil(maxValue / 100) * 100;  // 100 단위로 올림
	    if (maxValue < 100) maxValue = 100;  // 최소값을 100으로 설정

	    console.log("maxValue:", maxValue);  // 콘솔로 maxValue 확인

	    // 새로운 차트 생성
//		              y: {
//		            	  min:0,
//		                beginAtZero: true
//		              }
	    window.chart = new Chart(ctx, {
	        type: 'bar',  // 막대 차트
	        data: {
	            labels: labels,
	            datasets: [{
	                label: year + "년" + month + '월간 판매 순위',
	                data: data,
	                backgroundColor: 'rgba(54, 162, 235, 0.2)',
	                borderColor: 'rgba(54, 162, 235, 1)',
	                borderWidth: 1
	            }]
	        },
	        options: {
	            responsive: true,

	            scales: {
	            	yAxes: [{
						ticks: {
							min: 0,
							fontSize : 14,
						}
		            	,beginAtZero: true
					}]

	            }
	          },
	    });

	    // 옵션이 정상적으로 적용되었는지 확인
	    console.log("Chart Options:", window.chart.options);
	}
	function createMonthChart(labels, lastMonthSales, currentMonthSales, growthRate, year, month) {
	    const canvas = document.getElementById('myChart');
	    const ctx = canvas.getContext('2d');

	    // 기존 차트가 있다면 삭제 후 새로 그리기
	    if (window.chart) {
	        window.chart.destroy();  // 기존 차트 제거
	        ctx.clearRect(0, 0, canvas.width, canvas.height);  // 캔버스 초기화
	    }

	    // 새로운 차트 생성
	    window.chart = new Chart(ctx, {
	        type: 'bar',  // 막대 차트
	        data: {
	            labels: labels,
	            datasets: [
	                {
	                    label: '전월 판매량',
	                    data: lastMonthSales,
	                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
	                    borderColor: 'rgba(75, 192, 192, 1)',
	                    borderWidth: 1,
	                    fill: false
	                },
	                {
	                    label: '이번월 판매량',
	                    data: currentMonthSales,
	                    backgroundColor: 'rgba(153, 102, 255, 0.2)',
	                    borderColor: 'rgba(153, 102, 255, 1)',
	                    borderWidth: 1,
	                    fill: false
	                }
	            ]
	        },
	        options: {
	            responsive: true,

	            scales: {
	            	yAxes: [{
						ticks: {
							min: 0,
							fontSize : 14,
						}
		            	,beginAtZero: true
					}]

	            }
	          },
	    });

	    // 옵션이 정상적으로 적용되었는지 확인
	    console.log("Chart Options:", window.chart.options);
	}





</script>

<!-- ///// content 끝 ///// -->

<%@ include file="../include/footer.jsp"%>