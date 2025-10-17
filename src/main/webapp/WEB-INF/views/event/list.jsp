<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- SweetAlert2 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<%@ include file="../include/header_user.jsp"%>

<!-- SweetAlert2 JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<%-- ${eventVOList} --%>
<style>
    .hidden-col { display: none; }
    .card-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    /* 전체적으로 약간 왼쪽으로 이동 */
/* 전체적으로 왼쪽으로 이동 */

.card {
    margin-right: 90px; /* 카드 왼쪽 여백을 추가 */
}
.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

/* 나머지 스타일들 */
.search-container {
    display: flex;
    justify-content: flex-end;
    width: 100%;
}

.search-container input {
    width: 200px;  /* 검색창 너비 */
}

/* 제목 색상 변경 */
.card-title {
    color: black !important;  /* 카드 제목을 검은색으로 변경 */
}

/* 테이블 제목 색상 변경 */
.table th {
    color: black !important;  /* 테이블 헤더 제목을 검은색으로 강제로 변경 */
}

/* tbody 내용 텍스트 색상 변경 */
#tby, #tby td {
    color: black !important;  /* tbody 및 td 내용 텍스트를 검은색으로 변경 */
}

/* 링크 색상 변경 (제목 링크도 검은색으로 설정) */
#tby a {
    color: black !important;  /* 링크를 검은색으로 변경 */
    text-decoration: none; /* 링크 밑줄 제거 */
}

#tby a:hover {
    color: black !important;  /* 링크 hover 상태에서도 검은색으로 변경 */
}

</style>
<section class="content">
	<div class="container-fluid">
<div class="row">
   <div class="col-12">
     <div class="card">
       <div class="card-header">
         <h3 class="card-title">굿즈샵 공지사항</h3>

         <div class="card-tools">
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
               <th class="hidden-col">작성자</th>
               <th>작성일자</th>
               <th class="hidden-col">첨부파일</th>
             </tr>
           </thead>
           <tbody id="tby">
           </tbody>
         </table>
       </div>
       <div class="card-footer" id="divPagingArea"></div>
       <!-- /.card-body -->
     </div>
     <!-- /.card -->
   </div>
 </div>
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

	 
function getList(currentPage, keyword){
	let data = {
			"currentPage":nvl(currentPage,"1"),
			"keyword":nvl(keyword,"")
	};
	
	console.log("data : ", data);
	
	// 아작나써유 (피)씨다타써 - (피)는 form 타입일 때만 사용
	$.ajax({
		url:"/list",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		type:"post",
		dataType:"json",
		success:function(articlePage){	// result 대신 articlePage 사용 가능
			console.log("articlePage : ", articlePage);
			console.log("articlePage.content : ", articlePage.content);
		
			let str = "";
			$.each(articlePage.content, function(idx,EventVO){
			  str += `<tr class="trDetail">
				<td class="hidden-col">\${EventVO.evtBoardNo}</td>
				<td><a href="detail?evtBoardNo=\${EventVO.evtBoardNo}">\${EventVO.evtBoardTtl}</a></td>
				<td class="hidden-col">\${EventVO.evtBoardCn}</td>
				<td class="hidden-col">\${EventVO.evtBoardCtgry}</td>
				<td>\${EventVO.evtBoardDate}</td> 
				<td class="hidden-col">\${EventVO.fileGroupNo }</td>
	          </tr>`;
			});		// end each
			
			// element.append() : 누적 vs element.html() : 덮어쓰기
			$("#tby").html(str);
			// 페이징 처리
			$("#divPagingArea").html(articlePage.pagingArea);
		}
	});

}	// end getList()
$(function(){
    // 엔터키를 눌렀을 때 검색
    $("#krd").on("keydown", function(e) {
        if (e.key === "Enter") {
            e.preventDefault();  // 폼 제출 방지
            let keyword = $("#krd").val();  // 입력된 검색어
            console.log("keyword : " + keyword);
            getList("1", keyword);  // 검색 함수 호출
        }
    });

    // 검색 버튼 클릭 시 처리
    $("#btnSearch").on("click", function(event){
        event.preventDefault();  // 폼 제출 막기
        let keyword = $("#krd").val();  // 입력된 검색어
        console.log("keyword : " + keyword);
        getList("1", keyword);  // 검색 함수 호출
    });

    // 페이지 클릭 처리
    $(document).on("click", ".clsPagingArea", function(){
        let currentPage = $(this).data("currentPage");
        let keyword = $(this).data("keyword");
        console.log("페이지 클릭 처리 -> currentPage : ", currentPage);
        console.log("페이지 클릭 처리 -> keyword : ", keyword);
        getList(currentPage, keyword);
    });
});

// 페이지 로드 후 기본 리스트 불러오기
$(function(){
    getList("1", "");

    $(document).on("click", ".trDetail", function(){
        const rowData = [];
        $(this).find('td').each(function () {
            rowData.push($(this).text()); // 각 셀의 텍스트 값을 배열에 저장
        });
        let data = {
            "rowdata": rowData
        };
        console.log("data : ", data);

        $("#modalDetail").modal("show");
        $(".modal-title").html(rowData[1]);
        $(".modal-date").html(rowData[4]);
        $("#modalBody").html(rowData[2]);
    });
});



//document.ready랑 같은 의미
//동일 jsp에서 1회 작성
$(function(){
	
	getList("1","");
	
	// 검색
	$("#btnSearch").on("click",function(){
		// <input type="text" name="keyword"..
		let keyword = $("#krd").val();	// 개똥
		console.log("keyword : " + keyword);
		
		// 전역 함수 호출
		getList("1", keyword);
		
	});
	
//페이지 클릭 처리
//class="clsPagingArea" : 여러개(오브젝트 배열)
//정적 요소 : 달러(".clsPagingArea").on("click",function){
//동적 요소 : 
$(document).on("click",".clsPagingArea", function(){
 //클릭한 것은 하나
 // <a .. data-current-page="2" data-keyword="".. class="page-link clsPagingArea">2</a>
 let currentPage = $(this).data("currentPage");	// 2
 let keyword = $(this).data("keyword");
 
 console.log("페이지 클릭 처리 -> currentPage : ", currentPage);
 console.log("페이지 클릭 처리 -> keyword : ", keyword);
 
 // 회원 목록 호출
 getList(currentPage, keyword);
});
});


$(function(){
	$(document).on("click", ".trDetail", function(){
		const rowData = [];
	    $(this).find('td').each(function () {
	        rowData.push($(this).text()); // 각 셀의 텍스트 값을 배열에 저장
	    });
		let data={
			"rowdata" : rowData,
		}
		console.log("data : ", data);
		
		$("#modalDetail").modal("show");
		$(".modal-title").html(rowData[1]);
		$(".modal-date").html(rowData[4]);
		$("#modalBody").html(rowData[2]);
	})
	
	
})




</script>

<%-- <jsp:include page="../include/footer.jsp"></jsp:include> --%>

