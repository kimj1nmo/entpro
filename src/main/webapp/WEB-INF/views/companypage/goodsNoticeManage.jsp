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

    .register-btn {
        margin-left: auto; /* 버튼을 오른쪽 끝으로 이동 */
        padding: 10px 15px; /* 버튼 크기 조정 */
        font-size: 14px; /* 버튼 글씨 크기 조정 */
    }

    .card-footer {
        display: flex;
        justify-content: flex-end; /* 모든 요소를 오른쪽으로 정렬 */
        align-items: center; /* 수직 중앙 정렬 */
        gap: 10px; /* 페이징 영역과 버튼 간격 조정 */
    }
    .card-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
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
.card-tools {
    display: flex;          /* flexbox를 사용하여 정렬 */
    justify-content: flex-end;  /* 자식 요소를 오른쪽 끝으로 정렬 */
    width: 90%;             /* 부모 요소의 너비를 100%로 설정 */
}

.search-container {
    display: flex;
    justify-content: flex-end; /* 오른쪽 정렬 */
    width: 100%;
}

.search-container input {
    width: 200px;  /* 검색창 너비 */
    margin-right: 10px; /* 오른쪽 여백 추가 */
}

    
</style>

<section class="content" style="margin-left: 250px; padding: 15px;">
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<!-- 카드 헤더 -->
<div class="card-header">
    <h3 class="card-title">굿즈샵 공지사항</h3>

    <!-- 검색 폼 -->
    <div class="card-tools">
        <form>
            <div class="input-group input-group-sm" style="width: 200px; margin-left: auto;">
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
        </form>
    </div>
</div>

					<!-- 카드 바디 -->
					<div class="card-body table-responsive p-0">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th class="hidden-col">IDX</th>
									<th>제목</th>
									<th class="hidden-col">내용</th>
									<th class="hidden-col">작성자</th>
									<th>작성일자</th>
									<th class="hidden-col">첨부파일</th>
								</tr>
							</thead>
							<tbody id="tby">
								<!-- 데이터가 비동적으로 추가됩니다. -->
							</tbody>
						</table>
					</div>

					<!-- 페이징 영역 -->
					<div class="card-footer">
						<div id="divPagingArea" style="display: inline;"></div>
						<a href="/event/form" class="btn btn-sm btn-primary register-btn">등록</a>
					</div>
				</div>
			</div>
		</div>
	</div>
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
	
	$.ajax({
		url:"/list",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		type:"post",
		dataType:"json",
		success:function(articlePage){
			console.log("articlePage : ", articlePage);
			let str = "";
			$.each(articlePage.content, function(idx, EventVO){
				str += `<tr class="trDetail">
					<td class="hidden-col">\${EventVO.evtBoardNo}</td>
					<td><a href="adminDetail?evtBoardNo=\${EventVO.evtBoardNo}">\${EventVO.evtBoardTtl}</a></td>
					<td class="hidden-col">\${EventVO.evtBoardCn}</td>
					<td class="hidden-col">\${EventVO.evtBoardCtgry}</td>
					<td>\${EventVO.evtBoardDate}</td> 
					<td class="hidden-col">\${EventVO.fileGroupNo}</td>
				</tr>`;
			});	
			
			$("#tby").html(str);
			$("#divPagingArea").html(articlePage.pagingArea);
		}
	});
}
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
$(function(){
	getList("1", "");

	$("#btnSearch").on("click",function(){
		let keyword = $("#krd").val();
		console.log("keyword : " + keyword);
		getList("1", keyword);
	});
	
	$(document).on("click", ".clsPagingArea", function(){
		let currentPage = $(this).data("currentPage");
		let keyword = $(this).data("keyword");
		console.log("페이지 클릭 처리 -> currentPage : ", currentPage);
		console.log("페이지 클릭 처리 -> keyword : ", keyword);
		getList(currentPage, keyword);
	});
});

$(function(){
	$(document).on("click", ".trDetail", function(){
		const rowData = [];
		$(this).find('td').each(function () {
			rowData.push($(this).text());
		});
		let data = { "rowdata" : rowData };
		console.log("data : ", data);

		$("#modalDetail").modal("show");
		$(".modal-title").html(rowData[1]);
		$(".modal-date").html(rowData[4]);
		$("#modalBody").html(rowData[2]);
	})
});

</script>

<%@ include file="../include/footer.jsp" %>
