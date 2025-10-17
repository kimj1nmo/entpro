<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- ///// header 시작 ///// -->
<jsp:include page="../../include/header.jsp"></jsp:include>

<title>Gantt chart with resource panel</title>
<link rel="stylesheet" href="/gantt-master/codebase/dhtmlxgantt.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/spectrum/1.8.1/spectrum.min.css">
<!-- sweetAlert -->
<link rel="stylesheet" href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
<script src="/gantt-master/codebase/dhtmlxgantt.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/spectrum/1.8.1/spectrum.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<!-- 직접추가한 CSS -->
<link rel="stylesheet" href="/directlyCss/gantt.css">

<div class="content-wrapper" style="overflow: hidden !important;">
<!--     Content Header (Page header) -->
<div class="content-header">
<div class="container-fluid">
	<div class="row mb-2">
		<div class="col-sm-6"></div>
		<!-- /.col -->
		<div class="col-sm-6">
			<ol class="breadcrumb float-sm-right">
				<li class="breadcrumb-item"><a href="/managepage/manage/list">프로젝트 리스트</a></li>
				<li class="breadcrumb-item"><a href="/managepage/manage/detail/${projectVOList[0].proNo}">프로젝트 상세페이지</a></li>
				<li class="breadcrumb-item active">gantt</li>
			</ol>
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</div>
<!-- /.container-fluid -->
</div>
<!--  /.content-header -->
<!-- ///// header 끝 ///// -->

<body>

<!-- 프로젝트 명 & 홈 버튼 -->
<div class="callout callout-info col-md-6 d-flex align-items-center justify-content-center mx-auto"
	onclick="location.href=`/managepage/manage/detail/${proNo}`" style="cursor: pointer;">
	<i class="fas fa-arrow-circle-left me-2 fa-2x"></i>
	<h2 class="flex-grow-1 text-center" style="text-align: center;">${projectVOList[0].proTtl}</i></h2>
</div>
<!-- 본문 영역 div -->
<div id="e7eGantt" style='width:82vw; height:90vh; margin-left:1vw;'></div>


<script>
// 전역변수 영역
// 담당자 중복 제거 전 목록
var gArray = []; 

// 담당자 중복 제거 후 목록
var resultArr = []; 

// 담당자 id만 담은 배열
var gMangerArr = [];

// 영어체크
var gEng = /[a-zA-Z]/;

// 숫자체크
var gNum = /[0-9]/;

// memId 값 담기
var gMemId = [];

// select박스 선택값
var optionVal = "";

// jQuery 영역
$(function () {

	// 담당자 value값 받아오기
	$(document).on("change", ".gantt_cal_light select", function(){
		// select박스값 담기
		optionVal = $(this).find("option:selected").text();
		console.log("선택된 담당자 번호(optionVal) : ", optionVal);
		// alert("선택된 담당자 번호(optionVal) : " + optionVal);
	});
});


// 업데이트할 memId값 따로 뽑기
// 담을 변수
var updateId = "";

// 콜백 함수
function getManager(){
	gMemId.forEach(e => {
		// console.log("직원 리스트 반복문(e) : ", e);
		if(e.key == optionVal) updateId = e.label;
	});
	console.log("업데이트할 직원 아이디(updateId) : ", updateId);
}

// 접속 페이지 pathVariable
var gPathVariable = `${projectVOList[0].proNo}`;



// CRUD 시작
gantt.createDataProcessor({
	task: {
		create: (data) => {
			console.log("create데이터(data) : ", data);

			getManager();
			let ganttVO = {
				ganttChartsNo: 0,
				proNo: gPathVariable,
				proJobNm: data.text,
				proStartDate: data.start_date,
				proEndDate: data.end_date,
				proProgrsRt: data.progress,
				proColor: data.type,
				proDuration: data.duration,
				proYn: 0,
				memId: updateId
			}
			console.log("보내지는 create데이터(ganttVO)", ganttVO);

			// 받아온 데이터 보내기
			axios.post('/managepage/manage/createGantt', ganttVO).then(resp => {
				console.log("체킁", resp.data);
				Swal.fire('추가 완료', '', 'success').then(() => {
					location.href = location.href
				});
			})
		},
		// 업데이트
		update: (data, id) => {
			/*
			console.log("업데이트 하기 위한 데이터(data) : ", data);
			console.log("업데이트 할 아이디(id) : ", id);
			console.log("업데이트할 이름(data.user) : ", data.user);
			console.log("전체 직원 아이디, 이름(gMemId) : ", gMemId);
			console.log("선택된 담당자 번호(optionVal) : ", optionVal);
			*/

			// 담당자값 호출
			getManager();
			
			// if(gEng.test(data.user) || gNum.test(data.user)){
				let putGantt = {
					ganttChartsNo: id,
					proNo: data.parent,
					proJobNm: data.text,
					proStartDate: data.start_date,
					proEndDate: data.end_date,
					proProgrsRt: data.progress,
					proColor: data.type,
					proDuration: data.duration,
					memId: updateId
				}
			
				console.log("update -> putGantt", putGantt);

			// 받아온 데이터 보내기
			// axios.put(`/managepage/manage/putGantt?ganttChartsNo${ganttChartsNo}`, putGantt).then(resp=>{		 pathvariable
			axios.put(`/managepage/manage/putGantt`, putGantt).then(resp => {
				console.log("체킁", resp.data);
				Swal.fire({
					title: '수정 완료',
					text: '',
					icon: 'success',
					position: 'top-end',
					showConfirmButton: false,
					timer: 1500,
					toast: true, // 토스트 모드 활성화
					width: '300px',  // 가로 길이를 넓게 설정
				}).then(() => {
				});
			})
		// } else {
		// 	let putGantt = {
		// 			ganttChartsNo: id,
		// 			proNo: data.parent,
		// 			proJobNm: data.text,
		// 			proStartDate: data.start_date,
		// 			proEndDate: data.end_date,
		// 			proProgrsRt: data.progress,
		// 			proColor: data.type,
		// 			proDuration: data.duration,
		// 		}
			
		// 		console.log("update -> putGantt", putGantt);

		// 	// 받아온 데이터 보내기
		// 	// axios.put(`/managepage/manage/putGantt?ganttChartsNo${ganttChartsNo}`, putGantt).then(resp=>{		 pathvariable
		// 	axios.put(`/managepage/manage/putGantt`, putGantt).then(resp => {
		// 		// gantt.render; // 새로고침
		// 		console.log("체킁", resp.data);
		// 	})
		// }
		},
		// 삭제(비활성화 방식)
		delete: (id) => {
			console.log("delete -> id: ", id);
			let deleteGantt = {
				ganttChartsNo: id
				, proYn: 0
			}
			console.log("delete -> deleteGantt: ", deleteGantt);
			
			// 받아온 데이터 보내기
			
				axios.put(`/managepage/manage/deleteGantt`, deleteGantt).then(resp => {
					// console.log("delete -> resp.data: ", resp.data);
					Swal.fire('삭제 완료', '', 'success').then(() => {
						location.href = location.href
				});
			});
		}
	},
});
// CRUD 끝


// 담당자 등록 메서드
function setGanttOptions(options, callback) {
	console.log("options : ", options);

	// memId, memName 뽑기
	options.forEach(e => {
		gMemId.push({ key: e.memName, label: e.memId })
	});
	console.log("gMemId : ", gMemId);

	// 담당자 전체 리스트 뽑기				
	options.forEach(e => {
		gArray.push({ key: e.ganttChartsNo, label: e.memName })
		// gMangerArr.push(e.memId);
	});
	console.log("gArray : ", gArray);

	// 담당자 중복 제거
	resultArr = gArray.filter(function (item1, idx1) {
		// console.log("담당자 중복 제거 1번째 매개변수(item1) : ", item1);
		// console.log("담당자 중복 제거 2번째 매개변수(idx1) : ", idx1);
		return gArray.findIndex(function (item2, idx2) {
			return item1.label == item2.label
		}) == idx1;
	});
	console.log("담당자 중복제거 후 결과(resultArr) : ", resultArr);

	// lightbox 이름 바꾸기
	gantt.locale.labels.section_user = "담당자";
	gantt.locale.labels.section_type = "중요도";
	
	// lightbox 바꾸기
	gantt.config.lightbox.sections = [
			{ name: "description", height: 70, map_to: "text", type: "textarea", focus: true }
		, { name: "user", height: 22, map_to: "user", type: "select", options: resultArr }
		, {
				name: "type", type: "select", map_to: "type"
				, options: [
					{ key: "task", label: "Task" },
					{ key: "milestone", label: "Milestone" },
					{ key: "project", label: "Project" }
				]
			}
		, { name: "time", type: "duration", map_to: "auto" }
	];
}

function calculateResourceLoad(tasks, scale) {
	var step = scale.unit;	// 시간 단위(ex: day, week)
	var timegrid = {};	// 차트의 바가 포함되는 날짜 확인 변수

	// task == 1개의 json 데이터
	for (var i = 0; i < tasks.length; i++) {
		var task = tasks[i];
		var currDate = gantt.date[step + "_start"](new Date(task.start_date));	// 시작 날짜 선언 후 현재날짜에 담아줌

		// 간트차트 끝나는 날짜보다 현재날짜가 적으면 실행
		while (currDate < task.end_date) {

			var date = currDate;	// 현재 날짜 선언
			currDate = gantt.date.add(currDate, 1, step);	// 간트차트 날짜 추가 변수에 담기(시작 날짜, 1(이게모징), 시간 단위)

			// 지정된 날짜가 근무 시간인지 확인(boolean)
			if (!gantt.isWorkTime({ date: date, task: task })) {
				continue;	// while문 종료
			}

			var timestamp = date.valueOf();	// 현재 날짜의 유닉스 밀리초 담기(배열로 해당 날짜 확인용도)

			// timegrid[timestamp] 이 값이 존재하지 않으면 undefiend반환 ! 붙였으니 true가 반환됨
			if (!timegrid[timestamp])
				timegrid[timestamp] = 0;	// 차트의 바가 걸친 곳에 다른 스케줄 바가 없었으면 0을 넣어준다

			timegrid[timestamp] += 8;	// 차트의 바가 해당날짜에 포함되면 8을 더해줌
			// console.log("timegrid : ", timegrid);
		}
	}

	var timetable = [];	// 시간표 변수
	var start, end;			// 시작, 종료 변수

	// timegrid 키와 밸류를 모두 순회하는 반복문
	for (var i in timegrid) {
		start = new Date(i * 1);	// 시작 날짜
		end = gantt.date.add(start, 1, step);	// 종료 날짜

		// 시간표에 시작, 종료 날짜 및 밸류(ex 8 16)넣기
		timetable.push({
			start_date: start,
			end_date: end,
			value: timegrid[i]
		});
	}

	return timetable;
}



var renderResourceLine = function (resource, timeline) {
	var tasks = gantt.getTaskBy("user", resource.id);
	var timetable = calculateResourceLoad(tasks, timeline.getScale());

	var row = document.createElement("div");	// div 영역 만들어서 변수에 담기

	for (var i = 0; i < timetable.length; i++) {

		var day = timetable[i];

		var css = "";
		if (day.value <= 8) {
			css = "gantt_resource_marker gantt_resource_marker_ok";
		} else {
			css = "gantt_resource_marker gantt_resource_marker_overtime";
		}

		var sizes = timeline.getItemPosition(resource, day.start_date, day.end_date);
		var el = document.createElement('div');
		el.className = css;

		el.style.cssText = [
			'left:' + sizes.left + 'px',
			'width:' + sizes.width + 'px',
			'position:absolute',
			'height:' + (gantt.config.row_height - 1) + 'px',
			'line-height:' + sizes.height + 'px',
			'top:' + sizes.top + 'px'
		].join(";");

		el.innerHTML = day.value;
		row.appendChild(el);
	}
	return row;
};

var resourceLayers = [
	renderResourceLine,
	"taskBg"
];

// 색깔 에디터 추가
let editor;
gantt.config.editor_types.color = {
	show: function (id, column, config, placeholder) {
		var html = "<div><input type='color' name='" + column.name + "'></div>";
		placeholder.innerHTML = html;

		editor = $(placeholder).find("input").spectrum({
			change: () => {
				gantt.ext.inlineEditors.save();
			}
		});

		setTimeout(() => {
			editor.spectrum("show")
		})
	},
	hide: function () {
		if (editor) {
			editor.spectrum("destroy");
			editor = null;
		}
	},

	set_value: function (value, id, column, node) {
		editor.spectrum("set", value);
	},

	get_value: function (id, column, node) {
		return editor.spectrum("get").toHexString();
	},

	is_changed: function (value, id, column, node) {
		// console.log("THIS: ", this);
		var newValue = this.get_value(id, column, node);
		return newValue !== value;
	},

	is_valid: function (value, id, column, node) {
		var newValue = this.get_value(id, column, node);
		return !!newValue;
	},

	save: function (id, column, node) {
		// only for inputs with map_to:auto. complex save behavior goes here
	},
	focus: function (node) {
		editor.spectrum("show");
	}
}

// 간트차트 각 열 정보 바꾸기
var mainGridConfig = {
	columns: [
		{ name: "text", tree: true, width: 200, resize: true },
		{ name: "start_date", align: "center", width: 80, resize: true },
		{
			name: "user", align: "center", width: 60, label: "담당자", template: function (task) {
				// console.log("task : ", task);
				// console.log("task.user : ", task.user);
				var store = gantt.getDatastore("resources");
				// console.log("store : ", store);
				var user = store.getItem(task.id);
				if (user) {
					return user.label;
				} else {
					return "디폴트";
				}
			}
		},
		{ name: "duration", width: 50, align: "center" },
		{
			// name: "color", label: "색깔", align: "center", width: 1, resize: true, /* editor: colorEditor, */
			width: 15,
			template: (task) => {
				// console.log("task.type : ", task.type);
				// json 데이터의 type이 있음 type을 하나의 컬럼으로 사용하면 됨
				if (!task.color) {
					if (task.type == "project") task.color = "#7fbc64";
					if (task.type == "milestone") task.color = "#d18c7f";
				}
				// 간트차트 추가 시 기본색상
				task.color = task.color || "#75a3ff";
				// return `<div class="task-color-cell" style="background:${task.color}"></div>`; 	/* <- 원래 return 값 */
				return ``;
			}
		}
		, {
			name: "add", width: 50
			// , template : (task) => {
			// 	alert("들어왔닝?")
			// 	console.log("task : ", task);
			// 	if(task.type == 'project') {
			// 		return "";
			// 	}
			// }
		}
	]
};

// 담당자별 작업공간
var resourcePanelConfig = {
	columns: [
		{
			name: "name", label: "Name", align: "center", template: function (resource) {
				//console.log("체킁:", resource);
				return resource.label;
			}
		},
		{
			name: "workload", label: "Workload", align: "center", template: function (resource) {
				var tasks = gantt.getTaskBy("user", resource.id);

				var totalDuration = 0;
				for (var i = 0; i < tasks.length; i++) {
					totalDuration += tasks[i].duration;
				}

				return (totalDuration || 0) * 8 + "";
			}
		}
	]
};

// 화면에 나오는 각 열
gantt.config.layout = {
	css: "gantt_container",
	rows: [
		{
			cols: [
				{ view: "grid", group: "grids", config: mainGridConfig, scrollY: "scrollVer" },
				{ resizer: true, width: 1, group: "vertical" },
				{ view: "timeline", id: "timeline", scrollX: "scrollHor", scrollY: "scrollVer" },
				{ view: "scrollbar", id: "scrollVer", group: "vertical" }
			]
		},
		{ resizer: true, width: 1 },
		/*
		{
			config: resourcePanelConfig,
			cols: [
				{
					view: "grid",
					id: "resourceGrid",
					group: "grids",
					bind: "resources",
					scrollY: "resourceVScroll"
				},
				{ resizer: true, width: 1, group: "vertical" },
				{
					view: "timeline",
					id: "resourceTimeline",
					bind: "resources",
					bindLinks: null,
					layers: resourceLayers,
					scrollX: "scrollHor",
					scrollY: "resourceVScroll"
				},
				{ view: "scrollbar", id: "resourceVScroll", group: "vertical" }
			]
		},
		*/
		{ view: "scrollbar", id: "scrollHor" }
	]
};

// 담당자와 해당 id 받아오기
var resourcesStore = gantt.createDatastore({
	name: "resources",
	initItem: function (item) {
		item.id = item.key || gantt.uid();
		// console.log("item : ", item);

		return item;
	}
});

var tasksStore = gantt.getDatastore("task");
//console.log("체킁taskStore:", tasksStore);
tasksStore.attachEvent("onStoreUpdated", function (id, item, mode) {
	resourcesStore.refresh();
});

// 차트를 보이지 않는 부분까지 늘리는 메서드
gantt.attachEvent("onTaskDrag", function (id, mode, task, original) {
	var visibleStart = gantt.getState().min_date;
	var visibleEnd = gantt.getState().max_date;

	if (task.start_date < visibleStart) {
		gantt.config.start_date = gantt.date.add(task.start_date, -1, "month");
	}
	if (task.end_date > visibleEnd) {
		gantt.config.end_date = gantt.date.add(task.end_date, 1, "month");
	}
	gantt.render();
});

// 하위 작업 순서 변경 허용
gantt.config.order_branch = true;         

// 부모 작업 간 이동 허용
gantt.config.order_branch_free = true;    

// 기본 설정
gantt.i18n.setLocale("kr");

gantt.config.scales = [
	{ unit: "month", step: 1, format: "%Y, %F" },	// 연도 및 월 이름 (예: "2024, January")
	{ unit: "day", step: 1, format: "%j, %D" }		// 월의 몇 번째 날 및 요일 이름 (예: "15, Tue")
];

gantt.config.date_format = "%Y-%m-%d"; // 실제 전달되는 데이타의 start_date등의 포맷
gantt.config.task_date = "%Y년 %m월 %d일";	// 날짜 형식 지정

// 담당자 정렬
gantt.attachEvent("onBeforeLightbox", function(task_id) {
	var task = gantt.getTask(task_id);
	console.log("task : ", task);

	// 직원 이름 : user(memName)
	var taskUser = task.user;
	console.log("taskUser : ", taskUser);

	// 옵션 배열 복사 및 재정렬
	var resultArrSlice = resultArr.slice();
	console.log("직원 목록(resultArrSlice) : ", resultArrSlice);
	

	// 담당자 이름 정렬 시작
	resultArrSlice.sort(function(a, b) {
			// console.log("정렬 시 나오는 객체(a) : ", a);
			// console.log("정렬 시 나오는 객체(b) : ", b);
			if (a.label === taskUser) return -1;
			if (b.label === taskUser) return 1;
			return 0;
	});
	// console.log("정렬 후 직원 목록(resultArrSlice) : ", resultArrSlice);

	// 담당자 중복 제거
	var uniqueRslt = resultArrSlice.filter((item, index, self) => 
    self.findIndex(obj => obj.label === item.label) === index
	);
	
	// lightbox 이름 바꾸기
	gantt.locale.labels.section_user = "담당자";
	gantt.locale.labels.section_type = "중요도";
	
	// lightbox 폼 업데이트
	gantt.config.lightbox.sections = [

			// 간트차트명 영역
			{ name: "description", height: 38, map_to: "text", type: "textarea", focus: true }

			
			// 중요도 영역
			, {
				name: "type", type: "select", map_to: "type"
				, options: [
					{ key: "task", label: "낮음" }
					,	{ key: "project", label: "중간" }
					,	{ key: "milestone", label: "높음" }
				]
			}
			
			// 시간&기간 영역
			,	{ name: "time", height: 22, map_to: "auto", type: "duration" }
			
			// 담당자 영역
		,	{ name: "user", height: 62, map_to: "auto", type: "select", options: uniqueRslt }
	];
	return true;
});	 

// 변경사항 저장 허용
gantt.config.resources = {
	dataprocessor_assignments: true,
	dataprocessor_resources: true,
};

// 전체 API 메서드 확인
// console.log("gantt : ", gantt);

// 비동기로 데이터 가져오기
const fData = async () => {
	// console.log("비동기 데이터 가져오기");

	// 공통변수
	const id = `${projectVO.proNo}`;

	// 담당자 번호
	let gManager = {
		"proNo": id
	}
	// console.log("gManager : ", gManager);
	// DB랑 통신
	axios.post(`/managepage/manage/getManager`, gManager, {
		headers: {
			"Content-Type": "application/json",
		}
	}).then(resp => {
		setGanttOptions(resp.data);
		// console.log("resp.data : ", resp.data);
	});


	// 프로젝트 번호
	let ganttData = {
		"id": id
	}
	// console.log("ganttData: ", ganttData);
	let response = await axios.post(`/managepage/manage/ganttDetail`, ganttData, {
		headers: {
			"Content-Type": "application/json",
		}
	});
	let taskData = response.data;
	// console.log("taskData(후): ", taskData);

	// 데이터 불러오기
	let ganttChart = {
		"tasks": taskData
	}
	// console.log("ganttChart: ", ganttChart);

	// 담당자 리스트 뽑아내기
	const ganttManager = [];
	for (let i = 0; i < taskData.length; i++) {
		ganttManager.push({
			key: taskData[i].id
			, label: taskData[i].user
		});
	}
	console.log("ganttManager: ", ganttManager);

	// 담당자 중복 제거
	/*
	var uniqueGanttManager = ganttManager.filter((item, index, self) => 
		self.findIndex(obj => obj.label === item.label) === index
	);
	console.log("중복제거된 담당자(uniqueGanttManager): ", uniqueGanttManager);
	*/

	// 담당자 화면에 뿌리기
	resourcesStore.parse(ganttManager);

	// 차트 화면에 뿌리기
	gantt.parse(ganttChart);
}
fData();

// 업데이트 버튼 클릭 시 새로고침
// #e7eGantt div 초기화
gantt.init("e7eGantt");
/*
addEventListener("DOMContentLoaded", (event) => {
	var btnRender = document.querySelector("div[role='button']");
	console.log("이게뭔데 : ", btnRender);
	btnRender.addEventListener("click", function(){
		alert("나와랑")
		// location.href = location.href
	});
});
*/
</script>

<!-- ///// footer 시작 ///// -->
<jsp:include page="../../include/footer.jsp"></jsp:include>
<!-- ///// footer 끝 ///// -->