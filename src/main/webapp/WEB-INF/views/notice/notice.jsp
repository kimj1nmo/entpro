<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header_user.jsp" %>
<!-- SweetAlert2 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<!-- SweetAlert2 JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
.hidden-col { 
display: none;
 }
.modal-content2{
	max-width: 90vh;
	max-height: 90%;
	margin:auto;
}
#modalImagePreview {
    background-color: rgba(0, 0, 0, 1); /* 반투명 검정 배경 */
  }

/* 두 번째 모달 크기 설정 */
#modalImagePreview.modal-content {


	width: 100px; /* 모달 너비를 화면의 90%로 설정 */
	/* max-width: 1200px; */ /* 최대 너비를 1200px로 제한 */
	margin: auto; /* 중앙 정렬 */
}
</style>
<!-- /. 시작--><!-- 모든 페이지에 이거 추가해야함 -->

<section class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<!-- 고객센터 버튼 추가 -->
				<div class="col-12 d-flex justify-content-end mb-3">
					<button type="button" onclick="location.href='/notice/question'" class="btn btn-block btn-info text-white">고객센터</button>
				</div>
				<div class="card">
					<div class="card-header d-flex justify-content-between align-items-center">
						<h3 class="card-title">NOTICE</h3>
							<div class="card-tools ml-3">
								<form>
									<div class="input-group input-group-sm" style="width: 150px;">
										<input type="text" id="krd" name="keyword" value="${param.keyword}"
											class="form-control float-right" placeholder="검색어 입력" />
										<div class="input-group-append">
											<button type="button" id="btnSearch" class="btn btn-default">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
					</div>
       <!-- /.card-header -->
       	<div class="card-body table-responsive p-0">
         	<table class="table table-hover text-nowrap">
           	<thead>
             	<tr>
								<th class="hidden-col">idx</th>
								<th>제목</th>
								<th class="hidden-col">내용</th>
								<th>작성자</th>
								<th>작성일자</th>
								<th class="hidden-col">첨부파일</th>
								<th class="hidden-col">첨부파일</th>
							</tr>
						</thead>
						<tbody id="tby"></tbody>
					</table>
				</div>
				<div class="card-footer" id="divPagingArea">${articlePage.pagingArea }</div>
				<!-- /.card-body -->
				</div>
			<!-- /.card -->
			</div>
		</div>
 	</div>
</section>
<!-- /. 종료 -->
<!-- /. modal시작 -->
<div class="modal fade" id="modalDetail" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style="overflow-y: auto;">
			<div class="modal-header">
				<h4 class="modal-title" id="modalImgName">Large Modal</h4> <!-- .modal-title -->
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

			</div>
			<div class="modal-body modal-scrollable">
				<h6 class="modal-date">작성일자<br /></h4> <!-- .modal-date -->
				<p style="white-space: pre-line;" id="modalContent">내용</p> <!-- #modalContent -->
				<p id="modalImgBody"></p> <!-- #modalImgBody -->
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default copy-btn" onclick="copyUrl()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-copy" viewBox="0 0 16 16">
				<path fill-rule="evenodd" d="M4 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 5a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1v-1h1v1a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h1v1z"/></svg></button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /. modal 종료  -->

<%@ include file="../include/footer_user.jsp" %>


<!-- 원본 이미지를 위한 새 모달 -->
<div class="modal" id="modalImagePreview" style="display: none;" aria-hidden="true">
	<!-- <div class="modal-dialog modal-xl"> -->
			<div class="modal-content2">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
							</button>
					<div class="modal-body">
						<!-- 좌측, 우측 버튼 추가 -->
						<button id="prevImage" class="btn btn-primary" style="position: absolute; left: 10px; top: 50%; z-index: 999;">←</button>
						<button id="nextImage" class="btn btn-primary" style="position: absolute; right: 10px; top: 50%; z-index: 999;">→</button>


							<img id="previewImage" src="" alt="원본 이미지" style="width: 100%; height: auto; display: block; margin-bottom: 15px;">
							<div id="imageList">
									<!-- 첨부 이미지 리스트가 여기에 동적으로 추가됨 -->
							</div>
					<!-- </div> -->
			</div>
	</div>
</div>

<script>
	$(function () {
    let allImages = []; // 모든 이미지의 src를 저장할 배열
    let currentIndex = 0; // 현재 보여주고 있는 이미지의 인덱스

    // 기존 모달에서 이미지 클릭 시 이벤트 처리
    $(document).on("click", "#modalImgBody img", function () {
        const src = $(this).attr("src"); // 클릭된 이미지 src

        // 현재 게시글의 첨부 이미지 가져오기
        allImages = [];
        $("#modalImgBody img").each(function () {
            allImages.push($(this).attr("src"));
        });

        // 현재 선택된 이미지의 인덱스를 찾기
        currentIndex = allImages.indexOf(src);

        // 원본 이미지를 새 모달에 표시
        $("#previewImage").attr("src", src);

        // 첨부 이미지 리스트 생성
        const imageListHtml = allImages
            .map(
                (imgSrc) => `
                    <img src="${imgSrc}" alt="첨부 이미지" style="width: 100px; height: auto; margin: 5px; cursor: pointer;"
                        onclick="$('#previewImage').attr('src', '${imgSrc}')">
                `
            )
            .join("");
        $("#imageList").html(imageListHtml);

        // 새 모달 표시
        $("#modalImagePreview").modal("show");
    });

    // '이전 이미지' 버튼 클릭 시
    $(document).on("click", "#prevImage", function () {
        currentIndex = (currentIndex === 0) ? allImages.length - 1 : currentIndex - 1;
        $("#previewImage").attr("src", allImages[currentIndex]);
    });

    // '다음 이미지' 버튼 클릭 시
    $(document).on("click", "#nextImage", function () {
        currentIndex = (currentIndex === allImages.length - 1) ? 0 : currentIndex + 1;
        $("#previewImage").attr("src", allImages[currentIndex]);
    });
});

	$(function () {
			// 기존 모달에서 이미지 클릭 시 이벤트 처리
			$(document).on("click", "#modalImgBody img", function () {
					const src = $(this).attr("src"); // 클릭된 이미지 src
					const allImages = []; // 모든 첨부 이미지 src

					// 현재 게시글의 첨부 이미지 가져오기
					$("#modalImgBody img").each(function () {
							allImages.push($(this).attr("src"));
					});

					// 원본 이미지를 새 모달에 표시
					$("#previewImage").attr("src", src);

					// 첨부 이미지 리스트 생성
					const imageListHtml = allImages
							.map(
									(imgSrc) => `
									<img src="\${imgSrc}" alt="첨부 이미지" style="width: 100px; height: auto; margin: 5px; cursor: pointer;"
											onclick="$('#previewImage').attr('src', '\${imgSrc}')">
							`
							)
							.join("");
					$("#imageList").html(imageListHtml);

					// 새 모달 표시
					$("#modalImagePreview").modal("show");
			});
	});
</script>



<script type="text/javascript">


// 리스트 가져오기
function getList(currentPage, keyword){
    let data = {
        "currentPage" : nvl(currentPage, "1"),
        "keyword" : nvl(keyword, "")
    };

    $.ajax({
        url : "/listAjax",
        method :"post",
        data:JSON.stringify(data),
        contentType:"application/json",
        success:function(articlePage){
					$("#tby").empty();
            // 테이블 내용 및 첨부파일 처리
            articlePage.content.forEach(function(NoticeVO){
							console.log("NoticeVO", NoticeVO);
                // 게시글 표시
                let row = `
									<tr class="trDetail">
										<td>\${NoticeVO.ntceBoardTtl}</td>
										<td class="hidden-col">\${NoticeVO.ntceBoardCn}</td>
										<td>\${NoticeVO.memId}</td>
										<td>\${NoticeVO.regDate}</td>
										<td class="hidden-col" style="text-align : center;">\${NoticeVO.fileGroupNo}</td>
										<td class="hidden-col" style="text-align : center;">\${NoticeVO.fileGroupNo}</td>
									`;

																		let fileDetailList = NoticeVO.fileGroupVO && NoticeVO.fileGroupVO.fileDetailVOList;
												console.log("FILEDETAILlIST", fileDetailList); // null 또는 undefined인지 확인

												// 파일 리스트 처리
												let attachments = Array.isArray(fileDetailList) && fileDetailList.length > 0
														? fileDetailList.map(function(fileDetail) {
																// 각 파일에 대해 <img> 태그 생성
																return `<img src="\${fileDetail.fileSaveLocate}" alt="첨부 이미지" style="max-width: 100%; height: auto; margin: 5px;" />`;
														}).join('') // 결과를 하나의 HTML 문자열로 병합
														: "첨부파일 없음"; // 파일이 없을 경우 메시지

												// 테이블에 추가
												row += '<td class="hidden-col" style="text-align : center;">' + attachments + '</td>';
												$("#tby").append(row);
											});
						// 페이징 처리 부분 추가
						$("#divPagingArea").html(articlePage.pagingArea);
        }, // end success
    }); // end ajax
} // end getList



 // modal에 표시하기
 $(function () {
    $(document).on("click", ".trDetail", function () {
        const rowData = [];
        const images = [];

        // 각 셀 데이터 수집
        $(this).find("td").each(function (index) {
            // 이미지가 포함된 열은 제외하고 나머지 텍스트만 수집
            if (index === 6) {
                $(this).find("img").each(function () {
                    images.push($(this).attr("src")); // 각 이미지의 src 값을 배열에 저장
                });
            } else {
                rowData.push($(this).text()); // 텍스트 값만 저장
            }
        });

        // 데이터를 객체로 정리
        let data = {
            rowdata: rowData,
            images: images,
        };

        console.log("ROWDATA:", rowData);
        console.log("IMAGES:", images);

        // 모달에 데이터 표시
        $("#modalDetail").modal("show");
        $(".modal-title").html(rowData[0]);
        $(".modal-date").html(rowData[3]);
        $("#modalContent").html(rowData[1]);

        // 이미지 표시
        if (images.length > 0) {
            const imgHtml = images
                .map((src) => `<img src="\${src}" alt="첨부 이미지" style="max-width:100%; height:auto; margin:5px;">`)
                .join("");
            $("#modalImgBody").html(imgHtml);
        } else {
            $("#modalImgBody").text("첨부파일 없음");
        }
    });
});


// 리스트 출력 및 검색어 기능
$(function(){
	getList("1", ""); // 기본을 1페이지에 검색어 없음으로 로드
	
	$("#btnSearch").on("click", function(){
		let keyword=$("#krd").val(); // 검색버튼 클릭하면 input박스에서 키워드 값 가져오기
		console.log("검색어 : " + keyword);

		getList("1", keyword); // 검색어가 적용된 리스트 출력
	});
	// 페이지 버튼 클릭 시	
	$(document).on("click", ".clsPagingArea", function(){
		let currentPage = $(this).data("currentPage");
		let keyword=$(this).data("keyword");
		
		console.log("페이지 클릭 -> currentPage : ", currentPage, "keyword : ", keyword);
		getList(currentPage, keyword);
	});

});


// 검색어 처리
function nvl(expr1, expr2){
	if(expr1 === undefined || expr1 == null || expr1 == ""){
		expr1 = expr2;
	}
	return expr1;
}


// 복사 버튼

let nowUrl = window.location.href;

function copyUrl(){
	navigator.clipboard.writeText(nowUrl).then(()=>{
		var Toast = Swal.mixin({
			toast : true, 
			position : 'top-end',
			showconfiemButton : false,
			timer : 3000
		});
		
		Toast.fire({
			icon : 'success',
			title: 'Link Copied!'
		});
	});
}

</script>