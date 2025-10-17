<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- ///// header 시작 ///// -->
<jsp:include page="../../include/header.jsp"></jsp:include>
<!-- ///// header 끝 ///// -->
<!-- 직접추가한 CSS -->
<link href="/directlyCss/empCalendar.css" rel="stylesheet">

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- sweetAlert -->
<link rel="stylesheet" href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>

<!-- fullcalendar CDN -->
<!--   <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' /> -->
<!--   <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script> -->
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- axios -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
 
<div class="content-wrapper">
	<!--     Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/managepage/manage/list">프로젝트 리스트</a></li>
						<li class="breadcrumb-item active">${projectVO.proTtl} 프로젝트</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!--  /.content-header -->
<!-- 직접 추가한 CSS -->
<link rel="stylesheet" href="/directlyCss/project.css">
<link rel="stylesheet" href="/directlyCss/main.css">

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function () {
  //파일 다운로드
	$(document).on("click",".imgFileSaveLocate",function(){
		let fileSaveLocate = $(this).data("fileSaveLocate");// /resources/upload...
		//before : /resources/upload/project/이동관리계획/82462b65-4b8f-4681-bce9-e3e260820079_dad.jpg
		//after  : /project/이동관리계획/82462b65-4b8f-4681-bce9-e3e260820079_dad.jpg
		console.log("fileSaveLocate : " + fileSaveLocate);
		fileSaveLocate = fileSaveLocate.replaceAll("/resources/upload","");

		///download?fileName=/project/이동관리계획/82462b65-4b8f-4681-bce9-e3e260820079_dad.jpg
		location.href="/download?fileName="+fileSaveLocate;
		
		return;
	});
  
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

          location.href = `/managepage/manage/detail/${proNo}`;
        }
    });
  });
  // 수정모드
  $("#edit").on("click", function () {
    $("#div1").css("display", "none");
    $("#div2").css("display", "block");
    $(".ctrl").removeAttr("hidden");
    $(".ctrl").removeAttr("disabled");
    // $("#frm").attr("action", "/managepage/manage/updatePostAjax");
    $(".ctrl_p").css("display", "none");
    $("#prodId").attr("hidden", true);
  });
});
</script>

<!-- ///// content 시작 ///// -->
<div class="d-flex justify-content-center align-items-center">
  <div class="callout callout-info col-md-6">
    <h2 style="text-align: center;">${projectVO.proTtl}</h2>
  </div>
</div>
<main id="detailPadding">
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <!-- 왼쪽 4개의 카드 -->
        <div class="col-md-8">
          <div class="row">
            <div class="col-md-6">
              <!-- 첫 번째 카드 -->
              <div class="card card-primary durationHeight">
                <div class="card-header">
                  <h3 class="card-title">그룹 & 진행률</h3>
                  <div class="card-tools">
                  </div>
                </div>
                <div class="card-body minHeight">
                  <!-- 프로젝트 진행 수치 시작 -->
                  <div class="col-lg-12 col-12">
										<div class="small-box bg-success d-flex align-items-center justify-content-center">
											<div class="inner">
												<h2>🎙&nbsp;${projectVO.groupName}</h2>
											</div>
										</div>
                    <!-- small card -->
                    <div id="durationFont" class="small-box bg-success" style="height: 40vh;">
                      <div class="inner text-center">
                        <h3 style="font-size: 150px;">${projectVO.percentage}<sup style="font-size: 30px">%</sup></h3>
        
                        <p class="durationFontSize">${projectVOList[0].proRegDate} ~ ${projectVOList[0].proDeadline}</p>
                      </div>
                      <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                      </div>
                    </div>
                  </div>
                  <!-- 프로젝트 진행 수치 끝 -->
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <!-- 두 번째 카드 -->
              <div class="card card-primary minHeight">
                  <div class="card-header movePage" onclick="location.href = '/managepage/manage/gantt/${proNo}'">
                    <h3 class="card-title">진행경과</h3>
                    <i class="fas fa-plus" style="margin-left: auto;">&ensp;상세정보</i>
                  </div>
                <!-- 진행경과 시작 -->
                <div class="col-md-12" style="max-height: 61.5vh; overflow: auto;">
                  <div class="card" style="min-height: 61.6vh;">
                    <!-- /.card-header -->
                    <c:forEach var="projectVO" items="${projectVOList}" varStatus="stat">
                      <c:if test="${projectVO.proYn == 1}">
		                    <div class="card-body">
		                      <h3 class="card-title">${projectVO.proJobNm}</h3><br>
		                      <h3 class="card-title">${projectVO.proStartDate} ~ ${projectVO.proEndDate}</h3><br>
		                      <div class="progress mb-3" id="progressContainer">
                            <span class="progress-text">${projectVO.gpercentage}%</span>
	                            <c:if test="${projectVO.gpercentage == 100}">
			                        <div class="progress-bar bg-success" style="width: ${projectVO.gpercentage}%">
			                        </div>
	                            </c:if>
	                            <c:if test="${projectVO.gpercentage != 100}">
			                        <div class="progress-bar bg-info" style="width: ${projectVO.gpercentage}%">
			                        </div>
	                            </c:if>
		                      </div>
		                    </div>
                      </c:if>
                  	</c:forEach>
                    <!-- /.card-body -->
                  </div>
                  <!-- /.card -->
                </div>
                <!-- 진행경과 끝 -->  
              </div>
            </div>
            <div class="col-md-12">
              <!-- 세 번째 카드 -->
              <div class="card card-primary minHeight" >
                <div class="card-header movePage" onclick="location.href = '/managepage/manage/filebox/${proNo}'">
                  <h3 class="card-title">관련 파일함</h3>
                  <i class="fas fa-plus" style="margin-left: auto;">&ensp;상세정보</i>
                  <!-- 추가 카드 내용 -->
                </div>
                <!-- 파일함 상세 시작 -->
                <div class="card-body">
                  <c:forEach var="ganttVO" items="${ganttVOList}" end="3" varStatus="stat"> 
                    <c:if test="${ganttVO.proFileNo != null}">
                        <div class="callout callout-success" style=" display: flex; align-items: center; justify-content: space-between; padding: 16px; border-radius: 8px;">
													<div style="display: flex; flex-direction: column; gap: 4px;">
                          <h5>📁${ganttVO.fileOriginalName}</h5>
                          <p>✔프로젝트 명 : ${ganttVO.proJobNm}</p>
												</div>

													<i class="fas fa-download imgFileSaveLocate" style="font-size: 24px; cursor:pointer;"  data-file-save-locate="${ganttVO.fileSaveLocate}"></i>
                        </div>
                      </c:if>
                  </c:forEach>
                </div>
                <!-- 파일함 상세 끝 -->
              </div>
            </div>
            <div class="col-md-12">
              <!-- 네 번째 카드 -->
              <!-- <div class="card card-primary minHeight">
                <div class="card-header movePage" onclick="location.href = '/managepage/manage/empCalendar/${proNo}'">
                  <h3 class="card-title">캘린더</h3>
                  <i class="fas fa-hand-pointer" style="margin-left: auto;"></i> -->
                  <!-- 추가 카드 내용 -->
                <!-- </div> -->
                <!-- <div id="Wrapper">
                  <div id='calendar'></div>
                </div> -->
              <!-- </div> -->
            </div>
          </div>
        </div>
    
        <!-- 오른쪽 긴 카드(담당자) -->
        <div class="col-md-4" >
          <div class="card card-secondary" style="min-height: 144vh;">
            <div class="card-header">
              <h3 class="card-title">담당자</h3>
              <div class="card-tools">
              </div>
            </div>
              <form id="frm" action="/managepage/manage/updatePostAjax" method="post">
                <div class="card-body">
                  <!-- 담당자 영역 시작 -->
                    <div class="card">
                      <div class="card-header">
                        <h3 class="card-title">이름 & 부서</h3>
                        <div class="card-tools">

                          <button type="button" class="btn btn-tool" onclick="location.href='/managepage/manage/projectEmpList/${proNo}'">
                            <i class="fas fa-plus">&nbsp;&nbsp;담당자 추가</i>
                          </button>
                        </div>
                      </div>
                      <div class="card-body p-0">
                        <ul class="products-list product-list-in-card pl-2 pr-2">
                          <c:forEach var="proVO2" items="${projectVO2}" varStatus="stat">
                            <li class="item">
                              <div class="product-info">
                                <a href="javascript:void(0)" class="product-title" />${proVO2.memName}
                                <span class="product-description">
	                                ${proVO2.departName}
                                </span>
                              </div>
                            </li>
                          </c:forEach>
                        </ul>
                      </div>
                      <!-- /.card-footer -->
                    </div>
                  <!-- 담당자 영역 끝 -->
                  <div class="form-group" style="display: none;">
                    <label for="proNo"><b>프로젝트 번호</b></label>
                    <textarea id="proNo" name="proNo" class="form-control" rows="6" value="${projectVO.proNo}">${projectVO.proNo}</textarea>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    
  </section>
</main>
<!-- ///// content 끝 ///// -->

	
<!-- 캘린더 스크립트 영역 -->
<script>
	// 전역변수
	/*
	const YrModal = document.querySelector("#yrModal");
	const calendarEl = document.querySelector('#calendar');
	const mySchStart = document.querySelector("#schStart");
	const mySchEnd = document.querySelector("#schEnd");
	const mySchTitle = document.querySelector("#schTitle");
	const mySchAllday = document.querySelector("#allDay");
	const mySchBColor = document.querySelector("#schBColor");
	const mySchFColor = document.querySelector("#schFColor");
	// 캘린더 특정 주소 리스트
	const calList = `${projectVO.proNo}`;
	console.log("캘린더 특정 주소 리스트(calList) : ", calList);

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
	console.log("캘린더 호출 콜백", respDataArr);
	

	//캘린더 헤더 옵션
	const headerToolbar = {
			left: 'prevYear,prev,next,nextYear today',
			center: 'title',
			right: 'dayGridMonth,dayGridWeek,timeGridDay'
	}

	// 캘린더 생성 옵션(참공)
	const calendarOption = {
		// 캘린더 겹치는 요소 모두 보이기
		dayMaxEvents: false,
		height: '700px', // calendar 높이 설정
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
		*/
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
					alert("제모게 머라도 써주삼")
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
	*/
</script>
 

<!-- ///// footer 시작 ///// -->
<jsp:include page="../../include/footer.jsp"></jsp:include>
<!-- ///// footer 끝 ///// -->