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
					<h3>상품 리스트</h3>
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
												<th id="gdsNm">상품 이름</th>
												<th id="gdsCtgryNm">상품 카테고리</th>
												<th id="groupName">그룹</th>
												<th id="gdsPrice">가격</th>
												<th id="gdsDate">등록일</th>
												<th id=>선택</th>
											</tr>
										</thead>
										<tbody id="tby">


										</tbody>
									</table>
								</div>
								<div class="card-body table-responsive p-0"  id="divDetailArea">

							<div class="card-footer" id="divPagingArea"></div>

								</div>
								<div class="col-12"
									style="justify-content: right; display: flex;">

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





			<script type="text/javascript">

function nvl(expr1, expr2) {

	if (expr1 === undefined || expr1 == null || expr1 == "") {
		expr1 = expr2;
	}
	return expr1;
}

let keyword="";
let sortName="groupNo";
let mode="0";

$(function(){

	getGoodsList("1", "","0",sortName);

})
 $("input[name='keyword']").on("keydown", function (event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    keyword = $("input[name='keyword']").val();//길동
                 	console.log("keyword", keyword);

                 	//전역함수 호출
                 	getGoodsList("1", keyword,"0",sortName);

                }
            });
$("#btnSearch").on('click',function(){
	//input type="text" name="keyword"...
 	keyword = $("input[name='keyword']").val();//길동
 	console.log("keyword", keyword);

 	//전역함수 호출
 	getGoodsList("1", keyword,"",sortName);
	})
		//목록 가져오는 함수 sort로 가져오는거까지
	function getGoodsList(currentPage, keyword, mode, sortName) {
    //회원 목록
    let data = {
        "currentPage": nvl(currentPage, "1"),
        "keyword": nvl(keyword, ""),
        "mode": nvl(mode, "0"),
        "sortName": nvl(sortName, "")
    }
    console.log("data :", data);

    $.ajax({
        url: "/stockManageAjax/goodsListSortAjax",
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
                $.each(articlePage.content, function (idx, goodsVO) {

                    let gdsDate = new Date(nvl(goodsVO.gdsDate, ""));
                    let formatGdsDate = "";
                    if (!isNaN(gdsDate)) {
                        formatGdsDate = gdsDate.getFullYear() + '-'
                            + String(gdsDate.getMonth() + 1).padStart(2, '0') + '-'
                            + String(gdsDate.getDate()).padStart(2, '0');
                    }
                    let formatGdsPrice=goodsVO.gdsPrice.toLocaleString();
                    str += `<tr>
                        <td>\${goodsVO.gdsNm}</td>
                        <td>\${goodsVO.gdsCtgryNm}</td>
                        <td>\${goodsVO.groupName}</td>
                        <td style="text-align: right;">\${formatGdsPrice}</td>
                        <td style="text-align: center;">\${formatGdsDate}</td>
                        <td style="text-align: center;"><button type="button" class="btn btn-block btn-success btn-flat goodsChoice " data-gds-no="\${goodsVO.gdsNo}" data-gds-nm="\${goodsVO.gdsNm}">선택</button></td>
                    </tr>`;
                });
            } else {
                // If no content, show the "No stock register" message
                str = `<tr><td colspan="6" style="text-align: center;">해당하는 상품이 없습니다.</td></tr>`;
            }

            // Update the table and paging area
            $("#tby").html(str);
            $("#divPagingArea").html(articlePage.pagingArea);

        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.error("Ajax Error:", textStatus, errorThrown);

            // Show the error message if AJAX fails
            let errorMessage = `<tr><td colspan="6" style="text-align: center;">등록된 상품이 없습니다.</td></tr>`;
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
			getGoodsList(currentPage, keyword, mode, sortName);

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
				alert("이미지 확장자만 가능합니다");
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