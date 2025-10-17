<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../include/header.jsp" %>
<!-- 직접추가한 CSS -->
<link href="/directlyCss/empCalendar.css" rel="stylesheet">

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- sweetAlert -->
<link rel="stylesheet" href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>

<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<!--   <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' /> -->
<!--   <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script> -->
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- axios -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<!-- 모달 영역 -->
<div id="yrModal">
	<div id="cont" style="display: flex; flex-direction: column; align-items: center; gap: 5px; text-align: center; padding: 20px;">
		<h1>일정 추가</h1>
		<!-- 시작 날짜 -->
		<label for="schdulStartDate">시작 날짜</label>
		<input type="datetime-local" id="schStart" name="schdulStartDate" value="" required>
		<!-- 종료 날짜 -->
		<label for="schdulEndDate" style="padding-top: 10px;">종료 날짜</label>
		<input type="datetime-local" id="schEnd" name="schdulEndDate" required>
		<!-- 제목 -->
		<label for="schdulTtl" style="padding-top: 10px;">일정 제목</label>
		<input type="text" id="schTitle" name="schdulTtl" required>
		<!-- 배경색 -->
		<div style="display: flex; align-items: center; gap: 20px; margin-bottom: 40px;">
			<div style="display: flex; flex-direction: column; align-items: center;">
				<label for="schdulBakColor" style="margin-bottom: 5px;">배경색</label>
				<input type="color" id="schBColor" name="schdulTypeBakcol" value="#096AB3">
			</div>
			<!-- 글자 색상 -->
			<div style="display: flex; flex-direction: column; align-items: center;">
				<label for="schdulTxtColor" style="margin-bottom: 5px;">글자 색상</label>
				<input type="color" id="schFColor" name="schdulTypeTxtcol" value="#ffffff">
			</div>
		</div>
		<!-- 버튼 모음 -->
		<div class="button-container">
			<button type="button" class="btn btn-block btn-primary" onclick="fCalAdd()">일정 저장</button>
			<button id="deleteEventBtn" style="display:none;">일정 삭제</button>
		</div>
	</div>
</div>

<!-- ///// content 시작 ///// -->
<div class="content-wrapper">
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/companypage/main">companypage</a></li>
						<li class="breadcrumb-item active">manageGroup</li>
					</ol>
				</div>
			</div>
		</div>
	</div>

	

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>그룹 캘린더 관리</title>

	<!-- 캘린더 영역 -->
	<div id="Wrapper">
		<div id='calendar'></div>
	</div>


</div>




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
	const calList = `${calendarList[0].proNo}`;
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
	console.log("캘린더 호출 콜백", respDataArr);
	

	//캘린더 헤더 옵션
	const headerToolbar = {
			left: 'prevYear,prev,next,nextYear today',
			center: 'title',
			right: 'dayGridMonth,dayGridWeek,timeGridDay'
	}

	// 캘린더 생성 옵션(참공)
	const calendarOption = {
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
			/* 시작일 및 기간 수정가능여부
			eventStartEditable: false,
			eventDurationEditable: true,
			*/
			dayMaxEventRows: true,  // Row 높이보다 많으면 +숫자 more 링크 보임!
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
</script>
<%@ include file="../../include/footer.jsp" %>