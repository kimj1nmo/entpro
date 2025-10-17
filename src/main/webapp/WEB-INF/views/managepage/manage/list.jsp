<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!--
../ : views폴더(부모)
 -->
<!-- ///// header 시작 ///// -->
<jsp:include page="../../include/header.jsp"></jsp:include>
<!-- ///// header 끝 ///// -->
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- axios -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<!-- 직접추가한 CSS -->
<link href="/directlyCss/empCalendar.css" rel="stylesheet">
 
 
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
						<li class="breadcrumb-item">프로젝트 관리</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!--  /.content-header -->
<!-- Main content -->
<section class="content">
	<div class="container-fluid">

		<!-- ///// content 시작 ///// -->
		<!-- 프로젝트 리스트 제목 -->
		<!-- <div class="row justify-content-center align-items-center" style="min-height: 20vh;">
			<div class="col-md-4 col-sm-6 col-12">
				<div class="info-box">
					<span class="info-box-icon bg-success"><i class="far fa-flag"></i></span>
					
					<div class="info-box-content">
						<span class="info-box-text text-center" style="font-size: 2rem;">프로젝트목록</span>
					</div> -->
					<!-- /.info-box-content -->
				<!-- </div> -->
				<!-- /.info-box -->
			<!-- </div>
		</div> -->

		<!-- 참여중인 프로젝트 및 캘린더 시작 -->
		<div class="row d-flex justify-content-center" style="max-width: 83vw;">
			<div class="col-3 mx-auto">
				<div class="card">
					<div class="card-header backColor">
						<h3 class="card-title text-white"><span class="memId_" style="font-weight: bold;"></span>님이 참여중인 프로젝트</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-body table-responsive p-0" style="overflow: hidden; min-height: 80vh !important;">
						<!-- 성명으로 오름차순 정렬 -->
						<table class="table table-hover text-nowrap">
							<tbody style="width: 50%;">

								<!-- 로그인한 대상별 프로젝트 리스트 나오기 -->
								<div class="row tby"></div>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-9 d-flex justify-content-center align-items-center">
				<!-- 네 번째 카드 -->
				<div class="card card-primary minHeight w-100" style="width: 50vw;">
					<div class="card-header backColor movePage">
						<h3 class="card-title">전체일정</h3>
						<!-- 추가 카드 내용 -->
					</div>
					<div id="Wrapper">
						<div id='calendar'></div>
					</div>
				</div>
			</div>
		</div>
		<!-- 캘린더 끝 -->
		<!-- <div class="row">
			<div class="col-3 mx-auto">
				<div class="card">
					<div class="card-header backColor">
						<h3 class="card-title text-white"><span class="memId_" style="font-weight: bold;"></span>님이 참여중인 프로젝트</h3>
					</div>
					/.card-header
					<div class="card-body table-responsive p-0" style="overflow: hidden;">
						성명으로 오름차순 정렬
						<table class="table table-hover text-nowrap">
							<tbody style="width: 50%;">

								로그인한 대상별 프로젝트 리스트 나오기
								<div class="row tby"></div>
							</tbody>
						</table>
					</div>
				</div>
			</div> -->

			<!-- 전체 프로젝트 목록 -->
			<div class="col-12 mx-auto">
				<div class="card">
					<div class="card-header backColor">
						<h3 class="card-title text-white">전체 프로젝트 목록</h3>

						<div class="card-tools">
							<!-- /// 검색 시작 /// -->
							<div class="input-group input-group-sm" style="width: 150px;">
								<input type="text" name="keyword" value="${param.keyword}"
									class="form-control float-right" placeholder="검색어 입력" />

								<div class="input-group-append">
									<button type="button" id="btnSearch" class="btn btn-default">
										<i class="fas fa-search"></i>
									</button>
								</div>
							</div>
							<!-- /// 검색 끝 /// -->
						</div>
					</div>
					<!-- /.card-header -->
					<div class="card-body table-responsive p-0" style="overflow: hidden;">

						<!-- 등록 버튼 -->
						<div class="mt-3 ps-5 d-flex align-items-center justify-content-end" style="min-height: 15vh; margin-right: 20px;">
							<a href="/managepage/manage/approve" class="btn btn-primary" style="margin-left: 1vw;">등록</a>
						</div>
						
						<!-- 성명으로 오름차순 정렬 -->
						<table class="table table-hover text-nowrap">
							<tbody style="width: 50%;">

								<!-- 프로젝트 전체 리스트 나오기 -->
								<div class="row tby2"></div>
							</tbody>
						</table>
					</div>
					<!-- /.card-body -->
					<!-- /card-footer 시작 -->
					<div class="card-footer" id="divPagingArea"></div>
					<!-- /card-footer 끝 -->
				</div>
				<!-- /.card -->
			</div>
			
		</div>

		<!-- ///// content 끝 ///// -->
	</div>
	<!-- /.container-fluid -->
</section>
<!-- /.content -->

<!-- 프로젝트 상세 모달 시작 -->
<div class="modal fade show" id="modal-xl" style="display: none; padding-right: 17px;" aria-modal="true" role="dialog" data-backdrop="static">
  <div class="modal-dialog modal-xl">
    <div id="modalClick" class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">상세</h4>
        <form id="frm" action="/managepage/manage/updatePostAjax" method="post">  <!-- 스타일 불일치 시 form태그 삭제 후 재배정 -->
        <button id="btnHidden" type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="card-body">
            <div class="form-group">
              <label for="proTtl">프로젝트 명</label>
              <input type="text" id="proTtl" name="proTtl" class="form-control readOnly" value="" required>
            </div>
            <div class="form-group" style="display: none;">
              <label for="proNo">프로젝트 아이디</label>
              <textarea id="proNo" name="proNo" class="form-control readOnly" rows="6"></textarea>
            </div>
            <div class="form-group">
              <label for="proManager">담당자</label>
              <select id="proManager" name="proManager" class="form-control readOnly custom-select">
                <c:forEach var="proVO" items="${projectVOList}" varStatus="stat">
                  <option data-pro-no="${proVO.proNo}" value="${proVO.proManager}" <c:if test="${proVO.proNo == projectVO}">selected</c:if> >
                    ${proVO.proManager}
                  </option>
                </c:forEach>
              </select>
            </div>
            <div class="form-group">
              <label for="proComment">프로젝트 내용</label>
              <textarea id="proComment" name="proComment" class="form-control readOnly" rows="6"></textarea>
            </div>
            <div class="form-group">
              <label for="proRegDate">등록일자</label>
              <input type="date" id="proRegDate" name="proRegDate" class="form-control readOnly">
            </div>
            <div class="form-group">
              <label for="proDeadline">마감일자</label>
              <input type="date" id="proDeadline" name="proDeadline" class="form-control readOnly">
            </div>
				 <!-- 일반모드 시작 -->
         <div id="div1" class="card-footer justify-content-between">
           <div class="float-left">
	           <button type="button" id="edit"
		           	class="btn btn-primary">수정</button>
	           <button type="button" id="btnDelete"
		           	class="btn btn-primary">삭제</button>
	       </div>
         </div>
         <!-- 일반모드 끝 -->
         <!-- 수정모드 시작 -->
         <div id="div2" class="card-footer" style="display:none;">
           <button id="btnUpdate" type="button" class="btn btn-primary">
               	확인
           </button>
           <a href="/managepage/manage/list" class="btn btn-success">
               	취소
           </a>
         </form>
         </div>
         <!-- 수정모드 끝 -->
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
<!-- 프로젝트 상세 모달 끝 -->

<script type="text/javascript">
	// 로그인 정보를 가져올수 있는 userInfo api 
	var memId="";

	// 직원 아이디 리스트
	var empId = [];
	
	// 접속중인 직원 이름
	var connEmp = [];
	var connEmpName = "이거";
	
// document.ready
$(function () {
	
		
	// 로그인 정보를 가져올수 있는 userInfo api 
	$.ajax({
		url: '/api/userInfo',
		method: 'GET',
		success: function(data) {
				// console.log("로그인 정보: ", data)//memId 와 authName의 authList가들어잇음
				memId = data.memId; // 서버에서 받은 사용자 정보를 전역 정보에 입력 가능 
		},
		error: function(xhr, status, error) {
				console.error('로그인 정보 가져오기 실패:', error);
		}
	});
	
	// 비동기 직원 리스트
	$.ajax({
		url:"/managepage/manage/getEmp",
		type: 'GET',
		success: function (data) {
			// console.log("직원정보 가져오기 통신결과(data) : ", data);
			
			// memId만 추출
			data.forEach(e => {
				empId.push(e.memId);
			});
			// console.log("직원 아이디(empId) : ", empId);

			// 접속중인 직원 이름
			connEmp = data.filter((e) => e.memId == memId);
			// console.log("접속중인 직원 정보(connEmp)", connEmp);
			connEmpName = connEmp[0].memName
			$(".memId_").html(connEmpName);
			// console.log("체킁(connEmpName)", connEmpName);
			// console.log("접속중인 직원 이름(connEmp[0].memName)", connEmp[0].memName);
			// console.log("직원 아이디 리스트(empId)", empId);
		},
		error: function(xhr, status, error) {
			console.error('로그인 정보 가져오기 실패:', error);
		}
	});
	
  //프로젝트 목록 중 하나를 클릭 시(More Info) 상세 모달 내 데이터 불러오기
  //동적으로 만들어짐..
  $(document).on("click",".aList",function(){
	 //클릭한 바로 그것
	 let proNo = $(this).data("proNo");//101
	 let proNotest = $(this).data("pro-no");	// 테스트 변수
	 console.log("proNo : ", proNo);
	 console.log("proNotest : ",proNotest);// 테스트 변수

	 $("#proManager").attr("selected");

	 //1. FormData()
	 //2. JSON
	 //3. 그냥
	 let jsonData = {
		"proNo":proNo
	 };
	 console.log("data : ", jsonData);

	 /*
		요청URI : /managepage/manage/detailInfo
		요청파라미터 : {"proNo": 102} *JSONString이 아님=>RequestBody가 필요없음
		요청방식 : post
	 */
	 $.ajax({
		url:"/managepage/manage/detail",
		data:jsonData,
		type:"post",
		success:function(projectVO){
			// console.log("projectVO : ", projectVO);

			let proRegDate = projectVO.proRegDate;
			proRegDate = proRegDate.substring(0,10);//2024-12-26
			// console.log("proRegDate : ", proRegDate);

			let proDeadline = projectVO.proDeadline;
			proDeadline = proDeadline.substring(0,10);//2024-12-26

			$("#proNo").val(projectVO.proNo); // 오류나면 빼
			$("#proTtl").val(projectVO.proTtl);
			$("#proManager").val(projectVO.proManager);
			$("#proComment").val(projectVO.proComment);
			$("#proRegDate").val(proRegDate);
			$("#proDeadline").val(proDeadline);
		}
	 });
  });

  // 최초 회원 목록 호출
  getList("1", "");

  // 검색 처리
  $("#btnSearch").on("click", function(){
    let keyword = $("input[name='keyword']").val(); // 길동
    console.log("keyword : " + keyword);

    // 전역 함수 호출
    getList("1", keyword);
  });

  $(document).on("click", ".clsPagingArea", function(){
    // 클릭한 것은 하나
    let currentPage = $(this).data("currentPage"); // 2
    let keyword = $(this).data("keyword"); // ""

    console.log("페이지 클릭 처리->currentPage : " + currentPage);
    console.log("페이지 클릭 처리->keyword : " + keyword);

    // 회원 목록 호출
    getList(currentPage, keyword);
  });
});

// 비동기 삭제
$("#btnDelete").on("click", function(){
  let proNo = $("#proNo").val();
  let data = {
    "proNo" : proNo
  }

  $.ajax({
			url: "/managepage/manage/deletePostAjax",
			contentType: "application/json;charset=utf-8",
			data: JSON.stringify(data),
			type: "put",
			dataType: "text",
			success: function (result) {
				// delete 성공 : 1, delete 실패 : 0
				console.log("result : ", result);

				if (result == 1) {// 성공
					// 4) /member/list로 이동
					var Toast = Swal.mixin({
						toast: true,
						position: 'top-end',
						showConfirmButton: false,
						timer: 3000
					});
					Toast.fire({
						icon: 'success',
						title: '삭제되었습니다.'
					});

					// 					setTimeout(function(){
					// 						location.href ="/member/list";
					// 					},3000)
					setTimeout(() => location.href = "/managepage/manage/list", 3000);

				} else {// 실패
					// 5) sweetalert2를 통해 "삭제가 되지 않았습니다"
					var Toast = Swal.mixin({
						toast: true,
						position: 'top-end',
						showConfirmButton: false,
						timer: 3000
					});
					Toast.fire({
						icon: 'warning',
						title: '삭제가 되지 않았습니다.'
					});

				}
			},
			error: function (xhr, status, error) {
				// xhr : responseEntity에 담아서 보낸 응답 메시지
				// status : 응답코드
				// error : 오류정보
				var Toast = Swal.mixin({
					toast: true,
					position: 'top-end',
					showConfirmButton: false,
					timer: 3000
				});
				Toast.fire({
					icon: 'warning',
					title: '삭제가 되지 않았습니다.'
				});
			}
		});//end ajax
	});// end delete

// 비동기 수정
$("#btnUpdate").on("click", function(){
  let proNo = $("#proNo").val();
  let proTtl = $("#proTtl").val();
  let proManager = $("#proManager").val();
  let proRegDate = $("#proRegDate").val();
  let proDeadline = $("#proDeadline").val();
  let proComment = $("#proComment").val();

  let data = {
    "proNo" : proNo
    , "proTtl" : proTtl
    , "proManager" : proManager
    , "proRegDate" : proRegDate
    , "proDeadline" : proDeadline
    , "proComment" : proComment
  }
  console.log("updatePostAjax -> data : ", data);

  $.ajax({
			url:"/managepage/manage/updatePostAjax",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			dataType:"json",
			success:function(result){
				console.log("result : ", result);

        location.href = "/managepage/manage/list";
			}
		});
});

// 수정 모드
$("#edit").on("click",function(){
    //X버튼 비활성화
    $("#btnHidden").css("display","none");
		//일반모드영역 가려짐
		$("#div1").css("display","none");
		//수정모드영역 보임
		$("#div2").css("display","block");
    // 비활성화&읽기전용 풀기
    $(".readOnly").removeAttr("readonly",true);
    $("#proManager").removeAttr("disabled",true);
});

// 상세화면 비활성화&읽기전용 처리
$(".readOnly").attr("readonly",true);
$("#proManager").attr("disabled",true);

// NULL 처리
function nvl(expr1, expr2) {
    if (expr1 === undefined || expr1 == null || expr1 == "") {
        expr1 = expr2;
    }
    return expr1;
}

// 리스트 불러오기
function getList(currentPage, keyword){
	// console.log("currentPage", currentPage);
	// console.log("keyword", keyword);
  let data = {
    "currentPage": nvl(currentPage, "1"),
    "keyword": nvl(keyword, "")
  };
  // console.log("data : ", data);

  // 프로젝트 리스트
  $.ajax({
    url: "/managepage/manage/listAjax",
    contentType: "application/json;charset=utf-8",
    data: JSON.stringify(data),
    type: "post",
    dataType: "json",
    success: function (articlePage) {
      // console.log("articlePage : ", articlePage);
      // console.log("articlePage.content : ", articlePage.content);

			// 로그인한 대상의 프로젝트 리스트만 띄우기
      // let str = "";
      // $.each(articlePage.content, function (idx, projectVO) {
				// console.log("매개변수(idx) : ", idx);
				// console.log("프로젝트 정보(projectVO) : ", projectVO);
				// console.log("프로젝트 담당직원(projectVO.proManager) : ", projectVO.proManager);
				// console.log("접속중인 직원(memId) : ", memId);
				// if(memId == projectVO.proManager){
				// 	str += `<div class="col-md-6 mb-3" name="tbyFull">
				// 						<div class="col-11 mx-auto callout callout-danger my-3" onclick="location.href='/managepage/manage/detail/\${projectVO.proNo}'"
				// 							style="cursor: pointer;">
				// 							<h5>\${projectVO.proTtl}</h5>

				// 							<p>\${projectVO.cut}</p>
				// 						</div>
				// 					</div>	`;
					
					// $("#divPagingArea").html(articlePage.pagingArea);
					// $(".tby").html(str);
				// } 
      // });
			

			// 전체 프로젝트 리스트 띄우기
      let str2 = "";
      $.each(articlePage.content, function (idx, projectVO) {
				// console.log("이거 봐봐(projectVO) : ", projectVO);
        str2 += `<div class="col-md-6 mb-3">
									<div class="col-11 mx-auto callout callout-success my-3" onclick="location.href='/managepage/manage/detail/\${projectVO.proNo}'"
										style="cursor: pointer;">
										<div class="d-flex justify-content-between align-items-center">
											<h5>\${projectVO.proTtl}</h5>
											<p>\${projectVO.proRegDateStr} ~ \${projectVO.proDeadlineStr}</p>
										</div>
										<p>🎙\${projectVO.groupName}</p>
									</div>
								</div>`;	
        $(".tby2").html(str2);
        $("#divPagingArea").html(articlePage.pagingArea);
      })
    }
  });

	// 로그인 직원의 프로젝트만 띄우기
	$.ajax({
    url: "/managepage/manage/allEmpList",
    contentType: "application/json;charset=utf-8",
    type: "get",
    dataType: "json",
    success: function (resp) {
			console.log("참여 중인 모든 직원 통신결과(resp) : ", resp);
			// console.log("로그인 대상(memId) : ", memId);
			const uniqueArr = resp.filter((item, index, self) => 
				self.findIndex(obj => obj.proTtl == item.proTtl) === index
			);
			console.log("중복 제거(uniqueArr) : ", uniqueArr);

			// 로그인 별 참여중 프로젝트 추가
			$.each(uniqueArr, function(idx, empList){
				// console.log("참여 중인 모든 직원 리스트(empList) : ", empList);
				let str3 = "";
				if(memId == empList.memId || memId == empList.proManager){
					str3 = `<div class="col-md-12 mb-3" name="tbyFull">
										<div class="col-11 mx-auto callout callout-danger my-3" onclick="location.href='/managepage/manage/detail/\${empList.proNo}'"
											style="cursor: pointer;">
											<h5>\${empList.proTtl}</h5>

											<p>🎙\${empList.groupName}</p>
										</div>
									</div>	`;
					
									$(".tby").append(str3);
				}
			});

			// 참여중 프로젝트에 추가된게 없으면
			if($(".tby").length){
				let str3 = "";
				$.each(resp, function(idx, empList){
					// 로그인 별 참여중인 프로젝트 없을 때
					let tbyEmpty = $("[name=tbyFull]").length;
					// console.log("요소 비었는지 확인(tbyEmpty) : ", tbyEmpty);
					if(!tbyEmpty) {
						str3 = `
										<div class="col-11 mx-auto callout my-3 text-center">
											<h5>❌참여 중인 프로젝트가 없습니다</h5>

										</div>
											`;
						$(".tby").html(str3);
					}
				});
			}	
							// console.log("뭐지 : ", str3);
							// $(".tby").html(str3);
		}
	});
}

</script>

<!-- 캘린더 영역 -->
<script>
	// 전역변수
	const YrModal = document.querySelector("#yrModal");
	const calendarEl = document.querySelector('#calendar');
	const mySchStart = document.querySelector("#schStart");
	const mySchEnd = document.querySelector("#schEnd");
	const mySchTitle = document.querySelector("#schTitle");
	const mySchAllday = document.querySelector("#allDay");
	const mySchBColor = document.querySelector("#schBColor");
	const mySchFColor = document.querySelector("#schFColor");
	// 캘린더 특정 주소 리스트
	const calList = `${projectVO}`;
	// console.log("캘린더 특정 주소 리스트(calList) : ", calList);

	// DB통신 후 캘린더 데이터
	const respDataArr = [];
	function respDataList(respData){
		// console.log("나오닝?(respData) : ", respData);
		respData.forEach(e => {
			// console.log("반복문(e) : ", e);
			respDataArr.push(e);
		});
		// var respDataJSON = JSON.stringify(respDataArr);
		// console.log("여기서 나와야 돼(respDataJSON) : ", respDataJSON);
		calendarSijax(respDataArr);
	}
	
function calendarSijax(respDataArr){
	// console.log("캘린더 호출 콜백", respDataArr);
	

	//캘린더 헤더 옵션
	const headerToolbar = {
			left: 'prevYear,prev,next,nextYear today',
			center: 'title',
			right: 'dayGridMonth,dayGridWeek,timeGridDay'
	}

	// 캘린더 생성 옵션(참공)
	const calendarOption = {
			height: '250px', // calendar 높이 설정
			expandRows: true, // 화면에 맞게 높이 재설정
			slotMinTime: '09:00', // Day 캘린더 시작 시간
			slotMaxTime: '18:00', // Day 캘린더 종료 시간
			// 맨 위 헤더 지정
			headerToolbar: headerToolbar,
			initialView: 'dayGridMonth',  // default: dayGridMonth 'dayGridWeek', 'timeGridDay', 'listWeek'
			locale: 'kr',        // 언어 설정
			selectable: true,    // 영역 선택
			selectMirror: true,  // 오직 TimeGrid view에만 적용됨, default false
			navLinks: true,      // 날짜,WeekNumber 클릭 여부, default false
			weekNumbers: true,   // WeekNumber 출력여부, default false
			editable: true,      // event(일정) 
			/* 시작일 및 기간 수정가능여부
			eventStartEditable: false,
			eventDurationEditable: true,
			*/
			// dayMaxEventRows: true,  // Row 높이보다 많으면 +숫자 more 링크 보임!
			/*
			views: {
					dayGridMonth: {
							dayMaxEventRows: 3
					}
			},
			*/
			nowIndicator: true,

			//events:[],
			// 이곳에 CRUD 하면 됨
			eventSources: [
				respDataArr
			]
	}

	// 캘린더 생성
	const calendar = new FullCalendar.Calendar(calendarEl, calendarOption);
	// 캘린더 그리깅
	calendar.render();

	// 캘린더 이벤트 등록
	calendar.on("eventAdd", info => console.log("Add:", info));
	calendar.on("eventChange", info => console.log("Change:", info));
	calendar.on("eventRemove", info => console.log("Remove:", info));
	calendar.on("eventClick", info => {
			console.log("eClick:", info);
			console.log('Event: ', info.event.extendedProps);
			console.log('Coordinates: ', info.jsEvent);
			console.log('View: ', info.view);
			// 재미로 그냥 보더색 바꾸깅
			info.el.style.borderColor = 'red';
	});
	calendar.on("eventMouseEnter", info => console.log("eEnter:", info));
	calendar.on("eventMouseLeave", info => console.log("eLeave:", info));
	calendar.on("dateClick", info => console.log("dateClick:", info));
	calendar.on("select", info => {
			console.log("체킁:", info);

			mySchStart.value = info.startStr;
			mySchEnd.value = info.endStr;

			YrModal.style.display = "block";
	});

	// 일정(이벤트) 추가하깅
	function fCalAdd() {
			if (!mySchTitle.value) {
					mySchTitle.focus();
					return;
			}
			let bColor = mySchBColor.value;
			let fColor = mySchFColor.value;
			if (fColor == bColor) {
					bColor = "black";
					fColor = "yellow";
			}

			let event = {
					start: mySchStart.value,
					end: mySchEnd.value,
					title: mySchTitle.value,
					// allDay: mySchAllday.checked,
					backgroundColor: bColor,
					textColor: fColor
			};

			calendar.addEvent(event);
			fMClose();
	}

	// 모달 닫기
	function fMClose() {
			YrModal.style.display = "none";
	}

	// function asdf(asdf){
	// 	console.log("체킁 : ", asdf);
	// }
}	

	// 캘린더 전체 리스트
	async function getEmpCalendar() {

		let data = {
			"id" : calList
		}
		// console.log("ajax에 넘길 데이터(data) : ", data);

		// 최초 전체 캘린더 데이터
		let resp = await axios.post("/managepage/manage/getEmpCalendar", data ,{
			headers: {
				"Content-Type": "application/json",
			}
		});
		// console.log("최초 전체 캘린더 데이터 : ", resp.data);
		// respData = resp.data
		var respData = resp.data;
		// console.log("json 변수에 담기(respData) : ", respData);
		
		respDataList(respData); // ←← respData를 여기에 집어넣어서 콜백으로 끌고 다니기
	}
	// 최초 리스트 호출
	getEmpCalendar();
	// 캘린더 호출
	// calendarSijax();

	// 특정 주소 캘린더 가져오기
	// function getOneCal() {
		
	// }
</script>

<!-- ///// footer 시작 ///// -->
<!-- <jsp:include page="../../include/footer.jsp"></jsp:include> -->
<!-- ///// footer 끝 ///// -->