<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- SweetAlert2 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<!-- SweetAlert2 JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- Axios -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<%@ include file="../include/header.jsp"%>
<script
src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"
></script>
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
						<li class="breadcrumb-item"><a href="/companypage/main">companypage</a></li>
						<li class="breadcrumb-item active">FAQ</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>

<style>
.hidden-col { display: none; }
.hidden-col img {
  width: 50px;
  height: 40px;
}
#ntceboardno{
  width: 30px;
  height: 40px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: lightblue;
  float : left;
  margin-right: 15px;

}
.form-control1 {
  width: 95%;
  height: 40px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: lightblue;
  float : left;
  margin-right: 20px;
  margin-bottom: 20px;

}
.form-control2 {
  width: 97.5%;
  height: 500px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color:lightblue;
  overflow:auto;
  margin-bottom: 20px;
  padding: 20px;
}
</style>

<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">공지사항</h3>
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
                  <th>작성자</th>
                  <th>작성일자</th>
                  <th class="hidden-col">첨부파일</th>
                </tr>
              </thead>
            <tbody id="tby"></tbody>
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
<!-- /.card-header -->

  <form name="noticeFrm" enctype="multipart/form-data">
    <div class="card-body">
      <div>
      <div class="form-group">
	       <!-- disabled : Controller로 데이터가 안넘어감 -> readonly로-->
        <input  id="ntceboardno" name="ntceboardno" class="form-control3" readonly />
      </div>
      <div class="form-group">
        <input id="ntitle" name="ntitle" class="form-control1" placeholder="NoticeTitle">
      </div>
    </div>
      <div class="form-group">
        <textarea id="ncontent" name="ncontent" class="form-control2" id="contenttt" placeholder="Content" ></textarea>
      </div>
   		<div class="form-group" id="form-control4">test
		  </div>
      <div class="form-group">
        <button class="btn btn-default btn-file" id="add-attachment-btn">
          <i class="fas fa-paperclip"></i> Add Attachment
        </button>
      </div>
		<div id="preview-container" style="display: flex; gap: 10px; flex-wrap: wrap; "></div>
		<input type="file" name="uploadFiles" id="attachment01" style="display: none;" multiple>
    </div>
  </form>
    <!-- /.card-body -->
    <div style="height: 200px;"></div>
    <div class="card-footer">
      <div class="float-right">
        <button type="button" class="btn btn-primary" id="btnRegist"><i class="far fa-envelope"></i> Submit</button>
      </div>
      <button type="reset" class="btn btn-default"><i class="fas fa-times"></i> Discard</button>
    </div>
    <!-- /.card-footer -->


<script type="text/javascript">


// nvl을 함수로 구현(null 제거)
function nvl(expr1, expr2) { // 검색어 2개를 받는다
  if (expr1 === undefined || expr1 == null || expr1 == "") { expr1 = expr2 }; // 3가지중 한가지라도 만족하면 2번값으로 대체
  return expr1; // 첫번째 값 리턴
}

// 리스트 가져오기 (현재페이지값, 키워드)
function getList(currentPage, keyword){
  // JSON은 문자열 형태로 데이터를 표현하는 데이터 교환 형식(함수 x)
	let data = { // 얘는 JSON이 아닌 javascript 데이터 구조 (함수 o)
    "currentPage":nvl(currentPage,"1"),
    "keyword":nvl(keyword,"")
	};

  // 콘솔에서 확인
	console.log("data: ", data);
	// 아작나써유 (피)씨다타써 - (피)는 form 타입일 때만 사용
	$.ajax({
		url:"/companypage/comListAjax", // 서버로 요청보낼 url
		contentType:"application/json;charset=utf-8", // 서버와 주고받을 데이터타입
		data:JSON.stringify(data), // 자바스크립트 Object를 JSON 문자열 데이터로
		type:"post", // http요청방식
		dataType:"json", // 서버에서 반환되는 데이터 타입
		success:function(articlePage){	// 성공 시 실행하는 콜백함수
			console.log("articlePage : ", articlePage); // 전체 데이터 확인
			console.log("articlePage.content : ", articlePage.content); // 내용만 확인

      // <img src=\${NoticeVO.fileGroupVO.fileDetailVOList.fileSaveLocate}/>

			let str = ""; // 테이블에 추가할 HTML 문자열 초기화
			$.each(articlePage.content, function(idx,NoticeVO){ // articlePage.content 배열 반복
        const fileUrl = NoticeVO.fileGroupVO && NoticeVO.fileGroupVO.fileDetailVOList ? NoticeVO.fileGroupVO.fileDetailVOList.fileSaveLocate : ""; // 파일 URL이 없을 경우 빈 문자열로 처리
        // console.log("fileURl 안나오나요>?" , fileUrl);
			  // console.log("NoticeVO : ", NoticeVO);

                str += `<tr class="trDetail">
                  <td class="hidden-col">\${NoticeVO.ntceBoardNo}</td> <!-- 번호 -->
                  <td>\${NoticeVO.ntceBoardTtl}</a></td> <!-- 제목 -->
                  <td class="hidden-col">\${NoticeVO.ntceBoardCn}</td> <!-- 내용 -->
                  <td>\${NoticeVO.memId}</td> <!-- 작성자 -->
                  <td>\${NoticeVO.regDate}</td> <!-- 작성일 -->`;

                  if (NoticeVO.fileGroupVO && NoticeVO.fileGroupVO.fileDetailVOList) {
                    $.each(NoticeVO.fileGroupVO.fileDetailVOList, function(idx, fileDetailVO){
                      console.log("이미지있땅!!", fileDetailVO)
                      str += `<td class="hidden-col">
                         <img src=\${fileDetailVO.fileSaveLocate} width="50" height="30">
                        </td> `;
                      });
                    }
                    str += `</tr>`;
                  });		// end each
          // element.append() : 누적 // element.html() : 덮어쓰기
          // ${fileUrl ? "<img src=fileUrl />" : "첨부파일 없음"}
          $("#tby").html(str); // 테이블 본문에 생성된 HTML 문자열 삽입 (기존 내용을 덮어씀)
          // 페이징 영역에 페이징 처리된 HTML 삽입
          fTrClickMouseOverOut();


			$("#divPagingArea").html(articlePage.pagingArea); // 페이징 처리
		}
	});
}	// end getList()

$(function(){ // 페이지 로드 시 실행되는 초기 함수
	getList("1",""); // 페이지와 빈 검색어로 호출
	$("#btnSearch").on("click",function(){ // 검색
		let keyword = $("#krd").val(); // 검색어 값 가져오기
		console.log("keyword : " + keyword); // 콘솔에서 확인
		getList("1", keyword); // 함수 재호출 페이지, 검색어
	});


  // 페이지 클릭 처리 (동적 요소)
  $(document).on("click",".clsPagingArea", function(){
  let currentPage = $(this).data("currentPage");	// 클릭한 요소의 속성값
  let keyword = $(this).data("keyword"); // 각각 클릭한 페이지, 검색어

  console.log("페이지 클릭 처리 -> currentPage : ", currentPage); // 클릭한 페이지 번호 출력
  console.log("페이지 클릭 처리 -> keyword : ", keyword); // 검색어 출력

  getList(currentPage, keyword); // 함수 재호출(해당페이지, 검색어)
  });
});


$(function(){ // 추가된 행 클릭 이벤트 처리
	$(document).on("click", ".trDetail", function(){
		const rowData = []; // 클릭한 행 데이터를 저장하는 배열
		let imgStr = "";	// 첨부파일이 있다면 첨부파일 경로 저장
		//1. <tr><td>데이터</td></tr>
	    $(this).find('td').each(function () { // 클릭한 행에서 각 셀의 텍스트 값을 배열에 추가
	        rowData.push($(this).text()); // 각 셀의 텍스트 값을 배열에 저장



	    });
		//2.이미지 경로 찾기
		$(this).find("img").each(function(){
			console.log("img src : ", $(this).attr("src"));
			imgStr += "<img src='" + $(this).attr("src") + "' />";
		});
		$("#form-control4").html(imgStr);
		let data={ // 객체 형태
			"rowdata" : rowData, // 배열 데이터 저장
		}
		console.log("data! : ", data); // 콘솔에 출력
		console.log("///////////");
    console.log("rowData[5]", rowData[5]);
    // 특정 폼 요소에 각 데이터값 삽입
		$(".form-control3").val(rowData[0]);
		$(".form-control1").val(rowData[1]);
		$(".form-control2").val(rowData[2]);
		$(".form-control4").val(rowData[5]);


	})
})

/*///////////////////////////////  */

$(function() {
  $("#btnRegist").on("click", function(){

    /*////////////// 등록 버튼 로직 시작 ///////////////////  */

    console.log("check"); // 버튼 클릭 시 콘솔로그

		const myForm = document.noticeFrm; // 폼 객체 값

		let formData = new FormData(); // 파일, 폼데이터 저장용 객체 생성

		let ntceBoardNo = myForm.ntceboardno.value; // name값으로 값 가져오기
		let ntceContent = myForm.ncontent.value; // 공지사항 내용
		let ntceTtl = myForm.ntitle.value; // 공지사항 제목
		let ntceWriter = "${memberVO.memName}";
    console.log(" skdh??", "${memberVO.memName}");
		let inputFiles = $("#attachment01"); // <input type="file" 선택
		//inputFiles : <input type="file" name="uploadFiles" id="attachment01" ..
		let files = inputFiles[0].files; // 선택된 파일 목록

		console.log("files : ", files); // 목록 로그
		console.log("files.length : ", files.length); // 선택된 파일 개수 로그

		for(let i = 0; i < files.length; i++){
      // 선택된 파일을 formData에 추가
			formData.append("uploadFiles", files[i]);
		}

		//////

		// 제목이 없는데 등록한 경우 등록되지 않음
    if (!ntceTtl) {
      console.log("제목을 입력하세요");
      $("#ntitle").focus();
      return;
    }
    // 내용이 없는데 등록한 경우 등록되지 않음
    if (!ntceContent) {
      console.log("내용을 입력하세요");
      $("#ncontent").focus();
      return;
    }

    // 공지사항 수정/등록 처리 로직

    // 번호만 있고 제목, 내용이 없는 경우
		if (!ntceTtl && !ntceContent && ntceBoardNo) {
      Swal.fire({
        title: "수정을 취소하고 새 글을 작성하시겠습니까?", // 메세지
        icon: "warning", // 아이콘
        showCancelButton: true, // 취소버튼 표시여부
        confirmButtonText: "예, 새 글 작성", // 확인 버튼
        cancelButtonText: "아니요, 유지" // 취소 버튼
      }).then((result) => {
        if (result.isConfirmed) { // confirm 버튼 클릭 시
          $("#ntceboardno").val(""); // 번호 초기화
        }
      });
      return;
    }


    // 게시글 번호가 있는 경우엔 update, 없는 경우엔 create
		let url = ntceBoardNo ? "/companypage/updatePostAjax" : "/companypage/createPostAjax";

    // 번호가 있는 경우 formData에 번호가 포함됨
		if (ntceBoardNo) {
      formData.append("ntceBoardNo", ntceBoardNo);
		}

    // 제목, 내용 formData에 추가
		formData.append("ntceBoardTtl", ntceTtl);
		formData.append("ntceBoardCn", ntceContent);
		formData.append("memId", ntceWriter);

		console.log("form", formData)
		$.ajax({
      url:url, // update or create url
			processData : false, // 문자열로 변환하지 않음
			contentType : false, // 헤더를 자동으로 설정하지 않음
			data : formData, // formData객체 전달(파일 + 폼데이터)
			dataType : "text", // 서버에서 반환받는 데이터 형식
			type:"post", // 서버로 데이터를 전송하는 http메서드
			success:function(result){ // 응답받은 데이터 처리 함수
        // 값 초기화
        console.log("result : ", result);
        $("#ntceboardno").val("");
        $("#ntitle").val("");
        $("#ncontent").val("");
        $("#attachment01").val("");
				getList("");
			},

    error: function (request, status, error) {
        console.log("code: " + request.status)
        console.log("error: " + error);
  },

    });//end ajax
    /*////////////// 등록 버튼 로직 종료 ///////////////////  */
  });
});

$(function () {
  $("button[type='reset']").on("click", function (e) {

    /*////////////// 취소 버튼 로직 시작 ///////////////////  */

    e.preventDefault(); // 초기화 방지

    // SweetAlert 띄우기
    Swal.fire({
      title: '정말로 취소하시겠습니까?', // 제목
      text: "모든 입력 내용이 초기화됩니다.", // 내용
      icon: 'warning', // 아이콘
      showCancelButton: true, // 취소 버튼 표시
          confirmButtonColor: '#3085d6', // 버튼 색상 지정
          cancelButtonColor: '#d33', // 버튼 색상 지정
          confirmButtonText: '네' // 확인 버튼 내용 지정
        }).then((result) => {
            if (result.isConfirmed) { // 확인버튼 클릭 시
              // 입력 박스 초기화
              $("#ntitle").val('');
              $("#ncontent").val('');
              $("input[type='file']").val('');
              $("#ntceboardno").val('');
              Swal.fire(
                  '완료되었습니다.'
              );
            }
        });
    });
});
/*////////////// 취소 버튼 로직 종료 ///////////////////  */
/*////////////// 미리보기 컨테이너 로직 시작 ////////////  */
$(function () {
    const previewContainer = $("#preview-container"); // 컨테이너 div태그 선택
    const attachmentInput = $("#attachment01"); // input 태그 선택

    // 첨부 버튼 클릭 시 파일 선택 창 열기
    $("#add-attachment-btn").on("click", function (e) {
      e.preventDefault(); // 동작 막기
      attachmentInput.click(); // 파일 선택 창 열기
    });

    // 파일 선택 시 미리보기 추가
    attachmentInput.on("change", function () {
      const files = this.files; // 선택된 파일들 가져오기

      previewContainer.html(""); // 미리보기 초기화

      Array.from(files).forEach((file) => {
          const reader = new FileReader(); // fileReader 객체 생성

          // 이미지 파일 처리
          if (file.type.startsWith("image/")) {
              reader.onload = function (e) {
                  const img = $("<img>") // 이미지 요소 생성
                      .attr("src", e.target.result) // 이미지 소스
                      .css({
                          width: "100px", // 너비
                          height: "100px", // 높이
                          objectFit: "cover", // 이미지 비율
                          borderRadius: "5px", // 모서리 둥글기
                          border: "1px solid #ccc", // 테두리
                      });
                  previewContainer.append(img); // 이미지를 컨테이너에 추가
              };
              reader.readAsDataURL(file); // 데이터 읽기 메서드
          } else {
              // 이미지가 아닌 파일 처리
              const fileName = $("<div>") // 파일 이름 표시 요소
                  .text(file.name) // 파일 이름
                  .css({
                      width: "100px", // 너비
                      height: "100px", // 높이
                      display: "flex", // flexbox 레이아웃
                      alignItems: "center", // 수직 정렬
                      justifyContent: "center", // 수평 정렬
                      border: "1px solid #ccc", // 테두리
                      borderRadius: "5px", // 모서리 둥글기
                      backgroundColor: "#f9f9f9", // 배경색
                      fontSize: "12px", // 글자 크기
                      textAlign: "center", // 정렬
                      padding: "5px", // 내부 여백
                      overflow: "hidden", // 넘치는 내용 숨김 처리
                      whiteSpace: "nowrap", // 한 줄로 표시
                      textOverflow: "ellipsis", // 넘치는 텍스트 말줄임표로 처리
                  });
              previewContainer.append(fileName); // 미리보기 컨테이너에 추가
            }
        });
    });
});




const fTrClickMouseOverOut = () => {
    let trs = document.querySelectorAll("tr");
    let selectedTr = null; // 현재 선택된 행을 저장할 변수

    for (let i = 0; i < trs.length; i++) {


        // 행을 클릭했을 때
        trs[i].addEventListener("click", () => {
            // 기존 선택된 행 색 초기화
            if (selectedTr) {
                selectedTr.style.backgroundColor = "white";
                selectedTr.style.color = "black";
                selectedTr.style.fontWeight = "normal";
            }

            // 새로 선택된 행 색상 유지
            selectedTr = trs[i];
            // selectedTr.style.backgroundColor = "blue";
            // selectedTr.style.color = "white";
            selectedTr.style.fontWeight = "bold"; // 강조 효과 추가

            console.log("선태쿠", selectedTr )
        });
    }
};


/*////////////// 미리보기 컨테이너 로직 종료 ////////////  */

</script>

<%@ include file="../include/footer.jsp" %>


<!-- 선택하면 배경 바뀌게 하는 거 구현하깅



 -->