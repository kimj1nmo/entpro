<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
    .container {
    display: flex;
    min-height: 400px;
    height: 100%;
    border-radius: 10px;
}

.left1 {
    width: 50%;
}

.right1 {
    width: 50%;
}

.modal-dialog {
    max-height: 90vh;
    overflow-y: auto;
}
/* 중앙 정렬 스타일 */
    .fc-toolbar-title {
        text-align: center;
        display: block;
        width: 100%;
    }

#calendar-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0 auto;
    width: 100%; /* 부모 요소의 너비에 맞추기 */
    max-width: 100%; /* 최대 너비 제한 */
    overflow: hidden; /* 넘치는 부분 숨김 */
    box-sizing: border-box; /* 패딩과 보더를 포함한 박스 크기 설정 */
    margin-left: 100px;
}

#calendar {
    width: 90%; /* 캘린더 너비를 조정 */
    max-width: 1000px; /* 최대 너비 제한 */
    margin: 0 auto;
}


#event-modal {
    position: relative; /* 부모 요소(#calendar-container) 기준으로 배치 */
    top: -750px; /* 모달이 달력 위로 올라오게 설정 (이 값을 필요에 맞게 조정) */
    left: 56.5%; /* 달력의 중앙에 맞추기 */
    transform: translateX(-50%); /* 정확한 중앙 정렬 */
    display: none; /* 초기에는 숨김 */
    z-index: 10000; /* 달력 위에 나타나도록 높은 z-index 설정 */
    background-color: white;
    padding: 20px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
    border-radius: 10px;
    width: 320px;
    animation: fadeIn 0.3s ease-in-out; /* 부드러운 등장 효과 */
}


#event-modal form {
    display: flex;
    flex-direction: column; /* 기본적으로 세로 방향 */
    gap: 10px; /* 입력 필드 간의 간격 */
}

#event-modal .button-container {
    display: flex; /* 버튼들을 가로로 배치 */
    justify-content: space-between; /* 양 옆으로 배치 */
    gap: 10px; /* 버튼 간의 간격 */
}
.button-container button {
    padding: 8px 16px; /* 버튼의 여백 조정 */
    font-size: 14px; /* 글자 크기 조정 */
    white-space: nowrap; /* 글자가 한 줄로 나오도록 설정 */
    text-overflow: ellipsis; /* 글자가 길어지면 ...으로 표시 */
    overflow: hidden; /* 글자가 버튼 크기를 넘지 않게 처리 */
}
#event-modal button {
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s;
}

#event-modal button[type="submit"] {
    background-color: #007bff; /* 일정 저장 버튼 - 파란색 */
}

#event-modal button[type="submit"]:hover {
    background-color: #0056b3; /* 저장 버튼 호버 시 색상 */
}

#deleteEventBtn {
    background-color: #dc3545; /* 일정 삭제 버튼 - 빨간색 */
}

#deleteEventBtn:hover {
    background-color: #b02a37; /* 삭제 버튼 호버 시 색상 */
}

#deleteEventBtn {
    color: white;
}

/* 모달 닫기 버튼 */
#closeEventModal {
    position: absolute;
    top: 10px;
    right: 10px;
    background: none;
    border: none;
    font-size: 18px;
    cursor: pointer;
    color: #666;
    transition: color 0.3s;
}

#closeEventModal:hover {
    color: #333; /* 닫기 버튼 호버 시 색상 */
}

/* 애니메이션 추가 */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translate(-50%, -60%);
    }
    to {
        opacity: 1;
        transform: translate(-50%, -50%);
    }
}


 /* 레이아웃 정렬 */
   .content {
    display: flex;
    flex-direction: column;
    margin-left: 50px; /* 왼쪽 메뉴 너비만큼 여백 */
}

.dropdown {
    position: relative;
    margin-left: 340px;
    
}
/* 모달 배경 흐림 효과 */
.modal-backdrop {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.3); /* 배경을 어두운 투명도로 설정 */
    backdrop-filter: blur(5px); /* 배경 흐림 효과 */
    z-index: 999; /* 모달 위에 배경이 오도록 설정 */
}

.dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1050;
    display: none; /* 기본적으로 숨김 */
    min-width: 200px; /* 드롭다운 최소 너비 */
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* 드롭다운 토글 기능 */
.dropdown.open .dropdown-menu {
    display: block; /* .open 클래스가 추가된 경우 드롭다운 표시 */
}

/* 반응형 레이아웃 */
@media (max-width: 768px) {
    .content {
        margin-left: 0; /* 작은 화면에서는 좌측 메뉴 없앰 */
    }
}




</style>

<%@ include file="../../include/header.jsp"%>

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


<!-- ///// content 시작 ///// -->
<!-- <div class="content-wrapper"> -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6"></div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="/companypage/main">companypage</a></li>
                        <li class="breadcrumb-item active">manageCalendar</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <div class="content">
    <h1 style="font-size: 30px; margin-left: 340px;">그룹 일정 관리</h1>

    <!-- 그룹 선택 드롭다운 -->
    <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="groupDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            그룹 선택
        </button>
        <div class="dropdown-menu" id="groupDropdownMenu" aria-labelledby="groupDropdown">
            <!-- AJAX를 통해 동적으로 채워짐 -->
            <h2 style="margin: 10px;">그룹 목록</h2>
            <div class="card-tools">
                <div class="input-group input-group-sm" style="width: 150px; margin: 10px;">
                    <input type="text" name="keyword" value="${param.keyword}" class="form-control float-right" placeholder="검색어 입력" />
                    <div class="input-group-append">
                        <button type="button" id="btnSearch" class="btn btn-default">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>


<!--     <div class="card-body table-responsive p-0"> -->
<!--         <table class="table table-bordered table-hover"> -->
<!--             <thead> -->
<!--                 <tr> -->
<!--                     <th>번호 <span class="up"></span> <span class="down"></span></th> -->
<!--                     <th>그룹이름 <span class="up"></span> <span class="down"></span></th> -->
<!--                     <th>그룹생성일 <span class="up"></span> <span class="down"></span></th> -->
<!--                     <th>생성일 최종입력자 <span class="up"></span> <span class="down"></span></th> -->
<!--                     <th>그룹해체일 <span class="up"></span> <span class="down"></span></th> -->
<!--                     <th>해체일 최종입력자 <span class="up"></span> <span class="down"></span></th> -->
<!--                 </tr> -->
<!--             </thead> -->
<!--             <tbody id="tby"> -->
<!--                 여기에 그룹 목록이 동적으로 채워집니다 -->
<!--             </tbody> -->
<!--         </table> -->

<!--     </div> -->
<!-- 검색 및 목록 표시 -->
<!-- <div class="card-tools"> -->
<!--     <div class="input-group input-group-sm" style="width: 150px;"> -->
<%--         <input type="text" name="keyword" value="${param.keyword}" class="form-control float-right" placeholder="검색어 입력" /> --%>
<!--         <div class="input-group-append"> -->
<!--             <button type="button" id="btnSearch" class="btn btn-default"> -->
<!--                 <i class="fas fa-search"></i> -->
<!--             </button> -->
<!--         </div> -->
<!--     </div> -->
<!-- </div> -->

<!-- 그룹 목록 테이블 -->
<!-- <div class="card-body table-responsive p-0"> -->
<!--     <table class="table table-bordered table-hover"> -->
<!--         <thead> -->
<!--             <tr> -->
<!--                 <th>번호</th> -->
<!--                 <th>그룹 이름</th> -->
<!--                 <th>그룹 생성일</th> -->
<!--             </tr> -->
<!--         </thead> -->
<!--         <tbody id="tby"> -->
<%--             <c:forEach var="group" items="${groupsList}"> --%>
<!--                 <tr> -->
<%--                     <td>${group.groupNo}</td> --%>
<%--                     <td>${group.groupName}</td> --%>
<%--                     <td>${group.createdDate}</td> --%>
<%--                     <td>${group.createdBy}</td> --%>
<%--                     <td>${group.dissolvedDate}</td> --%>
<%--                     <td>${group.dissolvedBy}</td> --%>
<!--                 </tr> -->
<%--             </c:forEach> --%>
<!--         </tbody> -->
<!--     </table> -->
<!-- </div> -->



<!--     <div id="divPagingArea"></div> 페이징 영역 -->

    <div id="calendar-container" style="display:none;">
    <div id="calendar"></div> <!-- 캘린더 영역 -->
</div>

<!-- 이벤트 추가/수정 모달 -->
<div id="event-modal" style="display:none; position: relative; padding: 20px; border: 1px solid #ccc; background: #fff; box-shadow: 0 4px 8px rgba(0,0,0,0.2); border-radius: 8px;">
    <!-- 닫기 버튼 -->
    <button id="closeEventModal" style="position: absolute; top: 10px; right: 10px; background: none; border: none; font-size: 18px; cursor: pointer; color: #333;">X</button>

    <form id="event-form">
    <input type="hidden" id="schdulNo" name="schdulNo">
    <input type="hidden" id="groupNo" name="groupNo">

    <label for="schdulTtl">일정 제목:</label>
    <input type="text" id="schdulTtl" name="schdulTtl" required>

<!-- 	<label for="schdulContent">일정 내용:</label> -->
<!-- 	<input type="text" id="schdulContent" name="schdulContent" required> -->
<!--     <label for="allDay">종일 여부:</label> -->
<!--     <input type="checkbox" id="schdulAlldayYn" name="schdulAlldayYn"> -->

    <label for="schdulStartDate">시작 날짜:</label>
    <input type="datetime-local" id="schdulStartDate" name="schdulStartDate">

    <label for="schdulEndDate">끝 날짜:</label>
    <input type="datetime-local" id="schdulEndDate" name="schdulEndDate">

    <label for="schdulBakColor">배경색:</label>
    <input type="color" id="schdulTypeBakcol" name="schdulTypeBakcol" value="#096AB3">

    <label for="schdulTxtColor">텍스트 색상:</label>
    <input type="color" id="schdulTypeTxtcol" name="schdulTypeTxtcol" value="#ffffff">

    <div class="button-container">
        <button type="submit">일정 저장</button>
        <button id="deleteEventBtn" style="display:none;">일정 삭제</button>
        <!-- 시연용 버튼 추가 -->
<button type="button" id="demoEventBtn">시연용</button>
        
    </div>
</form>

</div>
</div>


<script>

//전역변수
let todayStr = new Date();
let monthEngName = ["개똥이","January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
let yy = todayStr.getFullYear();
let mon = monthEngName[todayStr.getMonth() + 1];

let groupNameStr = "";

$(document).ready(function() {
	// 초기 페이지 로드: 기본 groupNo 1로 캘린더 로드
    loadCalendar(1, "groupName");

	//검색 처리
	$("#btnSearch").on('click', function() {
		//input type="text" name="keyword"...
		let keyword = $("input[name='keyword']").val();//길동
		console.log("keyword", keyword);

		//전역함수 호출
		getList("1", keyword,"0",groupName);
	})

 // 그룹 선택 시 해당 그룹의 캘린더를 로드하고, 그룹 정보를 localStorage에 저장
    $(document).on("click", ".group-link", function() {
    	$("#spnImsi").html("");
    	
        var groupNo = $(this).closest("tr").find("td:first").text(); // 그룹 번호
        var groupName = $(this).closest("tr").find("td:nth-child(2)").text(); // 그룹 이름

        console.log("groupNo : ", groupNo, ", groupName : ", groupName);
        
        // 그룹 정보 localStorage에 저장
        localStorage.setItem('selectedGroupNo', groupNo);
        localStorage.setItem('selectedGroupName', groupName);

        loadCalendar(groupNo, groupName); // 그룹 번호와 이름을 함께 전달하여 캘린더 로드
    });



    $(document).on("click", "#closeEventModal", function() {
        $("#event-modal").hide();
    });

$(document).on("click",".fc-button-primary",function(){
	$("#spnImsi").html("");
});
    
//캘린더 로드 함수
function loadCalendar(groupNo, groupName) {
    console.log("캘린더 로드 중... groupName: " + groupName);
    $("#calendar-container").show(); // 캘린더 영역 보이기
    $('#calendar').html(''); // 기존 캘린더 내용 비우기

    // FullCalendar 초기화
    var calendar = new FullCalendar.Calendar($('#calendar')[0], {
        events: function(info, successCallback, failureCallback) {
            $.ajax({
                url: '/manage/getEvents', // 이벤트를 가져올 URL
                data: { groupNo: groupNo }, // 그룹 번호 전달
                dataType: 'json',
                success: function(data) {
                    var events = data.map(function(event) {
                        return {
                            id: event.schdulNo, // schdulNo 사용
                            title: event.schdulTtl,
                            start: event.schdulStartDate,
                            end: event.schdulEndDate,
                            backgroundColor: event.schdulTypeBakcol, // 배경색
                            textColor: event.schdulTypeTxtcol // 텍스트 색상
                        };
                    });
                    
                    console.log("이벤트 로드 완료.");
                    $("#spnTitle").html(groupName);
                    
                    successCallback(events);
                },
                error: failureCallback
            });
        },
        headerToolbar: {
            left: 'prev,next today',
            center: 'title', // 기본 title 유지
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        editable: true,
        droppable: true,
        dateClick: function(info) {
            openEventModal(info.dateStr, groupNo); // 날짜 클릭 시 이벤트 모달 열기
        },
        eventClick: function(info) {
            openEventModal(info.event.startStr, groupNo, info.event.id); // schdulNo로 전달
        },
        viewDidMount: function(arg) {
            let titleElement = document.querySelector('.fc-toolbar-title');
            if (titleElement) {
                titleElement.textContent = '';
                let viewTitle = arg.view.title;
                let formattedTitle = viewTitle.split(' ')[0] + ' ' + viewTitle.split(' ')[1];
                $(".fc-toolbar-title").html(`<span id="spnTitle">\${groupName}</span> Calendar <br /> <span id="spnImsi"> ${monthEngName[todayStr.getMonth()+1]} ${yy}</span>`);
            }
        }
    });

    // 캘린더 렌더링
    calendar.render();
}
$(document).ready(function () {
    // 페이지 처음 로드 시 groupNo 1에 해당하는 그룹 이름을 가져오기
    $.ajax({
        url: "/manage/calendar/groups", // 그룹 목록을 가져오는 URL
        type: "GET",
        dataType: "json",
        success: function (data) {
            console.log("Fetched groups: ", data);

            // groupNo 1에 해당하는 그룹 찾기
            let group = data.find(group => group.groupNo === 1);

            if (group) {
                let groupName = group.groupName;
                // groupNo 1에 해당하는 그룹 이름과 번호로 캘린더 로드
                loadCalendar(1, groupName); // 캘린더 로드
            } else {
                console.log("Group with groupNo 1 not found.");
            }
        },
        error: function (xhr, status, error) {
            console.error("Failed to fetch groups:", error);
        }
    });
});


$(document).ready(function () {
    // AJAX 요청을 통해 그룹 목록 가져오기
    $.ajax({
        url: "/manage/calendar/groups", // Controller의 매핑 URL
        type: "GET",
        dataType: "json",
        success: function (data) {
            console.log("Fetched groups: ", data);

            // groupNo를 기준으로 오름차순 정렬
            data.sort(function (a, b) {
                return a.groupNo - b.groupNo;
            });

            // 기본 "전체 보기" 추가
            let dropdownHtml = '<a class="dropdown-item" href="#" data-group-no="0" data-group-name=""></a>';

            // 그룹 데이터를 드롭다운 메뉴에 추가
            data.forEach(function (group) {
                dropdownHtml += `
                    <a class="dropdown-item" href="#" data-group-no="\${group.groupNo}" data-group-name="\${group.groupName}">
                        \${group.groupName}
                    </a>
                `;
            });

            // 드롭다운 메뉴 업데이트
            $("#groupDropdownMenu").html(dropdownHtml);
        },
        error: function (xhr, status, error) {
            console.error("Failed to fetch groups:", error);
        }
    });

    // 드롭다운 아이템 클릭 시 이벤트 처리
    $("#groupDropdownMenu").on("click", ".dropdown-item", function (event) {
        event.preventDefault();
        
        const groupNo = $(this).data("group-no");
        const groupName = $(this).data("group-name");

        console.log("Selected groupNo:", groupNo, "groupName:", groupName);
        
     // groupName을 로컬스토리지에 저장
        localStorage.setItem('selectedGroupName', groupName);

        // 캘린더 로드 함수 호출
        loadCalendar(groupNo, groupName);
    });
});









//이벤트 모달 열기/닫기
function openEventModal(date, groupNo, schdulNo) {
    $("#event-modal").css("display", "flex"); // 모달 표시
    $("#schdulNo").val(schdulNo || ""); // 일정 번호, 없으면 빈 값으로
    $("#groupNo").val(groupNo);

    if (schdulNo) { // 수정 모드
        $("#deleteEventBtn").show(); // 삭제 버튼 표시
        loadEventDetails(schdulNo); // 기존 일정 세부 사항 로드
    } else { // 추가 모드
        $("#deleteEventBtn").hide(); // 삭제 버튼 숨기기
        $("#schdulTtl").val(""); // 일정 제목 초기화
        $("#schdulStartDate").val(date); // 시작 일시 설정
        $("#schdulEndDate").val(date); // 종료 일시 설정
        $("#schdulTypeBakcol").val("#096AB3"); // 기본 배경색
        $("#schdulTypeTxtcol").val("#ffffff"); // 기본 글자색
    }
}

// 수정 모드일 때 시연용 데이터 설정
$("#demoEventBtn").on("click", function() {
    var schdulNo = $("#schdulNo").val();
    
    // 수정 모드에서 시연용 데이터 설정
    if (schdulNo) {
        // 일정 제목을 "대전 엑스포 콘서트"로 변경
        $("#schdulTtl").val("대전 엑스포 콘서트");
        $("#schdulStartDate").val("2025-02-14T18:00"); // 시작 일시 예시
        $("#schdulEndDate").val("2025-02-21T22:00"); // 종료 일시 예시
        $("#schdulTypeBakcol").val("#FF5733"); // 배경색 변경
        $("#schdulTypeTxtcol").val("#ffffff"); // 글자색 변경
    } else {
        // 추가 모드일 경우 기존 시연용 코드 실행
        $("#schdulTtl").val("대전 0시 축제");
        $("#schdulStartDate").val("2025-02-17T10:00");
        $("#schdulEndDate").val("2025-02-21T10:00");
        $("#schdulTypeBakcol").val("#096AB3");
        $("#schdulTypeTxtcol").val("#ffffff");
    }
});


    // 일정 수정 시 기존 이벤트 로드
    function loadEventDetails(schdulNo) {
    $.ajax({
        url: '/manage/getEventDetails', // 이벤트 상세 정보를 가져올 URL
        data: { schdulNo: schdulNo }, // schdulNo로 전달
        dataType: 'json',
        success: function(data) {
            $("#schdulTtl").val(data.schdulTtl); // 일정 제목
            $("#schdulStartDate").val(data.schdulStartDate); // 일정 시작 일시
            $("#schdulEndDate").val(data.schdulEndDate); // 일정 종료 일시
            $("#schdulTypeBakcol").val(data.schdulTypeBakcol); // 배경색
            $("#schdulTypeTxtcol").val(data.schdulTypeTxtcol); // 글자색
            $("#schdulContent").val(data.schdulContent); // 일정 내용 추가
        },
        error: function() {
            alert("이벤트 로드에 실패했습니다.");
        }
    });
}


 // 일정 추가/수정 폼 제출
    $("#event-form").on("submit", function (e) {
    e.preventDefault();

    $("#event-modal").hide(); // 여기 추가 - 버튼 클릭 시 즉시 모달 닫기

    var schdulStartDate = $("#schdulStartDate").val();
    var schdulEndDate = $("#schdulEndDate").val();

    // AJAX 호출 처리 (이전 코드 유지)
    var eventVO = {
        schdulNo: $("#schdulNo").val(),
        groupNo: $("#groupNo").val(),
        schdulTtl: $("#schdulTtl").val(),
        schdulStartDate: schdulStartDate, 
        schdulEndDate: schdulEndDate,
        schdulTypeBakcol: $("#schdulTypeBakcol").val(),
        schdulTypeTxtcol: $("#schdulTypeTxtcol").val(),
        schdulContent: $("#schdulContent").val()
    };

    var url = eventVO.schdulNo ? '/manage/updateEvent' : '/manage/addEvent';

    $.ajax({
        url: url,
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(eventVO),
        success: function (response) {
            Swal.fire({
                icon: 'success',
                title: response,
                showConfirmButton: false,
                timer: 2000
            }).then(() => {
                var groupNo = $("#groupNo").val();
                var groupName = localStorage.getItem('selectedGroupName');
                loadCalendar(groupNo, groupName); // 캘린더 새로 로드
            });
        },
        error: function () {
            Swal.fire({
                icon: 'error',
                title: '일정 추가/수정에 실패했습니다.',
                showConfirmButton: false,
                timer: 2000
            });
        }
    });
});


 // 일정 삭제
    $("#deleteEventBtn").on("click", function (e) {
        e.preventDefault();  // 기본 동작 방지

        var schdulNo = $("#schdulNo").val();
        console.log("삭제 버튼 클릭: schdulNo = " + schdulNo); // 삭제 버튼 클릭 시 로그 추가

        // 모달 닫기
        $("#event-modal").hide();

        Swal.fire({
            title: "정말 삭제하시겠습니까?",
            text: "이 작업은 되돌릴 수 없습니다!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#d33",
            cancelButtonColor: "#3085d6",
            confirmButtonText: "네, 삭제하겠습니다",
            cancelButtonText: "취소"
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '/manage/deleteEvent',
                    type: 'POST',
                    data: { schdulNo: schdulNo },  // schdulNo 전달
                    success: function (response) {
                        console.log("삭제 성공: " + response); // 성공 시 로그 추가
                        Swal.fire({
                            icon: 'success',
                            title: '일정이 삭제되었습니다!',
                            showConfirmButton: false,
                            timer: 2000
                        }).then(() => {
                            var groupNo = $("#groupNo").val();
                            var groupName = localStorage.getItem('selectedGroupName');
                            loadCalendar(groupNo, groupName); // 캘린더 새로 로드
                        });
                    },
                    error: function () {
                        Swal.fire({
                            icon: 'error',
                            title: '일정 삭제에 실패했습니다.',
                            showConfirmButton: false,
                            timer: 2000
                        });
                    }
                });
            }
        });
    });











    // 모달 닫기
    $(document).on("click", "#closeEventModal", function() {
        $("#event-modal").hide();  // 모달 닫기
    });



    // 리스트 가져오는 함수
    function getList(currentPage, keyword, mode, sortName) {
        let data = {
            "currentPage": nvl(currentPage, "1"),
            "keyword": nvl(keyword, ""),
            "mode": nvl(mode, "0"),
            "sortName": nvl(sortName, "")
        };

        $.ajax({
            url: "/manage/calendar",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(data),
            type: "POST",
            dataType: "json",
            success: function(articlePage) {
                let str = "";
                $.each(articlePage.content, function(idx, GroupsVO) {
                    let groupBirth = new Date(nvl(GroupsVO.groupBirth, ""));
                    let groupDspgn = new Date(nvl(GroupsVO.groupDspgn, ""));
                    let formatGroupBirth = "";
                    if (!isNaN(groupBirth)) {
                        formatGroupBirth = groupBirth.getFullYear() + '-'
                            + String(groupBirth.getMonth() + 1).padStart(2, '0') + '-'
                            + String(groupBirth.getDate()).padStart(2, '0');
                    }
                    let formatGroupDspgn = "";
                    if (!isNaN(groupDspgn)) {
                        formatGroupDspgn = groupDspgn.getFullYear() + '-'
                            + String(groupDspgn.getMonth() + 1).padStart(2, '0') + '-'
                            + String(groupDspgn.getDate()).padStart(2, '0');
                    }
                    str += `<tr>
                        <td>\${GroupsVO.groupNo}</td>
                        <td><a href="javascript:void(0);" class="group-link">\${GroupsVO.groupName}</a></td>
                        <td>\${formatGroupBirth}</td>
                        <td>${GroupsVO.groupBirthInputter}</td>
                        <td>${formatGroupDspgn}</td>
                        <td>${GroupsVO.groupDspgnInputter}</td>
                    </tr>`;
                });

                // 리스트 업데이트
                $("#tby").html(str);
                // 페이징 업데이트
                $("#divPagingArea").html(articlePage.pagingArea);
            }
        });
    }

    // nvl 함수 - null or undefined이면 기본값 반환
    function nvl(value, defaultValue) {
        return (value == null || value == undefined || value == "") ? defaultValue : value;
    }

    // 현재 날짜 및 시간을 자동으로 시작 및 종료 날짜 필드에 설정
//     var inputStartDate = document.getElementById('eventStartDate');
//     var inputEndDate = document.getElementById('eventEndDate');
//     var date = new Date();
//     var year = date.getFullYear();
//     var month = ("0" + (date.getMonth() + 1)).slice(-2); // 월을 2자리로 맞추기
//     var day = ("0" + date.getDate()).slice(-2); // 일을 2자리로 맞추기
//     var hour = ("0" + date.getHours()).slice(-2); // 시간을 2자리로 맞추기
//     var minute = ("0" + date.getMinutes()).slice(-2); // 분을 2자리로 맞추기
//     var formattedDate = year + "-" + month + "-" + day;
//     inputStartDate.value = formattedDate;
//     inputEndDate.value = formattedDate;


});


</script>
<%@ include file="../../include/footer.jsp"%>
