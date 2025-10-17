<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- ///// header 시작 ///// -->
<jsp:include page="../include/header_user2.jsp"></jsp:include>
<!-- ///// header 끝 ///// -->

<!-- ///// nav 시작 ///// -->
<jsp:include page="../include/nav.jsp"></jsp:include>
<!-- ///// nav 끝 ///// -->

<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>캘린더 조회</title>
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- FullCalendar CDN -->
<!--     <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css" rel="stylesheet" /> -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
    <!-- FullCalendar 언어 지원 -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js"></script>
   <style>
    #calendar {
        max-width: 900px;
        margin: 0 auto;
    }

    #calendar-container {
        margin-top: 25px;
    }

    /* 그룹 이름과 Calendar를 Flexbox로 배치 */
    #group-name-container {
        display: flex; /* Flexbox 활성화 */
        justify-content: center; /* 중앙 정렬 */
        align-items: center; /* 수직 정렬 */
        font-size: 35px;
        font-weight: bold;
        margin-top: 20px; /* 상단 여백 */
        margin-left: 46px; /* 오른쪽 여백 조정 */
        position: relative; /* 상대 위치 조정을 위해 추가 */
        top: 30px; /* 그룹 이름과 "Calendar" 전체를 아래로 이동 */
    }

    #group-name-container #group-name {
        margin-right: 10px; /* 그룹 이름과 Calendar 텍스트 간 간격 */
        white-space: nowrap; /* 그룹 이름 줄바꿈 방지 */
    }

    #group-name-container #calendar-text {
        flex-shrink: 0; /* Calendar 텍스트가 그룹 이름 길이에 따라 줄어들지 않도록 고정 */
    }
</style>





</head>
<body>
    <!-- 그룹 이름을 표시할 요소 (navbar 바로 아래에 위치) -->
    <!-- 그룹 이름을 표시할 요소 (navbar 아래에 위치) -->
<div id="group-name-container">
    <span id="group-name"></span> <!-- 그룹 이름 -->
    <span id="calendar-text">Calendar</span> <!-- Calendar 텍스트 -->
</div>
<!-- 모달 창 -->
<div id="event-modal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 1000; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
    <h2 id="modal-title"></h2>
    <p id="modal-content"></p>
    <p id="modal-date"></p>
    <button onclick="closeModal()">닫기</button>
</div>

<!-- 모달 닫기 배경 -->
<div id="modal-backdrop" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); z-index: 999;" onclick="closeModal()"></div>



    <!-- 캘린더 영역 -->
    <div id="calendar-container">
        <div id="calendar"></div>
    </div>

    <script>
    
    // 캘린더 초기화 함수
    function initializeCalendar(groupNo, initialEvents) {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            locale: 'ko',
            initialView: 'dayGridMonth',
            headerToolbar: {
                left: 'prev,next today',
                center: 'title', // FullCalendar가 자동으로 연도와 월 처리
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            editable: false,
            events: initialEvents, // 초기 이벤트 로드
            eventClick: function(info) {
                openEventModal(info.event.startStr, groupNo); // 수정 모달을 열 필요가 없다면 여기도 수정해야 할 수 있음
            },
            dateClick: function(info) {
                openEventModal(info.dateStr, groupNo); // 날짜 클릭 시 이벤트 모달 열기
            }
        });

        calendar.render();

        // AJAX를 통해 추가 이벤트 동적 로드
        loadDynamicEvents(groupNo, calendar);
    }

    // 동적 이벤트 로드
    function loadDynamicEvents(groupNo, calendar) {
        $.ajax({
            url: '/' + groupNo + '/calendar2',  // {groupNo}을 포함한 URL
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                var events = data.map(function(event) {
                    return {
                        title: event.schdulTtl,  // 일정 제목
                        start: event.schdulStartDate,  // 시작일
                        end: event.schdulEndDate,  // 종료일
                        backgroundColor: event.schdulTypeBakcol, // 서버에서 받은 배경색 설정ㅇㅇ
                        textColor: event.schdulTypeTxtcol, // 텍스트 색상 설정
                        content : event.schdulContent
                    };
                });
                calendar.addEventSource(events); // 동적 이벤트 추가
            },
            error: function() {
                alert('이벤트를 로드하는 중 오류가 발생했습니다.');
            }
        });
    }

    // 페이지 로드 시 초기화
    $(document).ready(function() {
        var groupNo = '${groupNo}'; // JSP에서 전달받은 groupNo
        var groupName = '${groupName}'; // JSP에서 전달받은 groupName

        // 콘솔 로그로 그룹 이름 출력
        console.log("Group Name:", groupName);

        var initialEvents = [
            <c:forEach var="event" items="${events}">
            {
                title: '${event.schdulTtl}',  // 일정 제목
                content : '${event.schdulContent}',
                start: '${event.schdulStartDate}',  // 시작일
                end: '${event.schdulEndDate}',  // 종료일
                backgroundColor: '${event.schdulTypeBakcol}', // 서버에서 받은 배경색 설정
                textColor: '${event.schdulTypeTxtcol}' // 텍스트 색상 설정
                
            },
            </c:forEach>
        ];
        initializeCalendar(groupNo, initialEvents); // 캘린더 초기화

        // 그룹 이름을 별도로 상단에 추가하는 부분
        setGroupName(groupName); // 그룹 이름을 표시하는 함수 호출
    });

    // 그룹 이름을 캘린더 상단에 표시하는 함수
    function setGroupName(groupName) {
        var groupNameElement = document.getElementById('group-name'); // 그룹 이름을 표시할 요소
        if (groupNameElement) {
            // 그룹 이름을 지정된 위치에 삽입
            groupNameElement.innerHTML = groupName;  // 수정된 부분
        }
    }
</script>

</body>
</html>
