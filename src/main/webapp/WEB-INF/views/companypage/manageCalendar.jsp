<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp" %>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">관리자 캘린더 관리</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="/companypage/main">Home</a></li>
                        <li class="breadcrumb-item active">캘린더 관리</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>

    <div class="container">
        <h2>그룹별 캘린더 관리</h2>
        
        <!-- 그룹 1 -->
        <div class="calendar-group">
            <h3>그룹 1: 아티스트 A</h3>
            <!-- 구글 캘린더 iframe -->
            <div class="calendar">
                <iframe src="https://calendar.google.com/calendar/embed?src=rlaalstn3211%40gmail.com&ctz=Asia%2FSeoul" style="border: 0" width="800" height="600" frameborder="0" scrolling="no"></iframe>
            </div>
            <!-- 이벤트 추가 -->
            <form action="/companypage/addEvent" method="post">
                <input type="hidden" name="calendarId" value="rlaalstn3211@gmail.com">
                <label for="eventTitle">이벤트 제목:</label>
                <input type="text" id="eventTitle" name="eventTitle" required>
                <label for="eventStart">시작 시간:</label>
                <input type="datetime-local" id="eventStart" name="eventStart" required>
                <label for="eventEnd">종료 시간:</label>
                <input type="datetime-local" id="eventEnd" name="eventEnd" required>
                <button type="submit">이벤트 추가</button>
            </form>
            <!-- 이벤트 삭제 -->
            <form action="/companypage/deleteEvent" method="post">
                <input type="hidden" name="calendarId" value="rlaalstn3211@gmail.com">
                <label for="eventId">이벤트 ID:</label>
                <input type="text" id="eventId" name="eventId" required>
                <button type="submit">이벤트 삭제</button>
            </form>
        </div>

        <!-- 그룹 2 -->
        <div class="calendar-group">
            <h3>그룹 2: 아티스트 B</h3>
            <div class="calendar">
                <iframe src="https://calendar.google.com/calendar/embed?src=rlaalstn3211%40gmail.com&ctz=Asia%2FSeoul" style="border: 0" width="800" height="600" frameborder="0" scrolling="no"></iframe>
            </div>
            <form action="/companypage/addEvent" method="post">
                <input type="hidden" name="calendarId" value="artistB@example.com">
                <label for="eventTitle">이벤트 제목:</label>
                <input type="text" id="eventTitle" name="eventTitle" required>
                <label for="eventStart">시작 시간:</label>
                <input type="datetime-local" id="eventStart" name="eventStart" required>
                <label for="eventEnd">종료 시간:</label>
                <input type="datetime-local" id="eventEnd" name="eventEnd" required>
                <button type="submit">이벤트 추가</button>
            </form>
            <form action="/companypage/deleteEvent" method="post">
                <input type="hidden" name="calendarId" value="artistB@example.com">
                <label for="eventId">이벤트 ID:</label>
                <input type="text" id="eventId" name="eventId" required>
                <button type="submit">이벤트 삭제</button>
            </form>
        </div>

        <!-- 그룹 3 -->
        <div class="calendar-group">
            <h3>그룹 3: 아티스트 C</h3>
            <div class="calendar">
                <iframe src="https://calendar.google.com/calendar/embed?src=artistC%40example.com&ctz=Asia%2FSeoul" frameborder="0" scrolling="no"></iframe>
            </div>
            <form action="/companypage/addEvent" method="post">
                <input type="hidden" name="calendarId" value="artistC@example.com">
                <label for="eventTitle">이벤트 제목:</label>
                <input type="text" id="eventTitle" name="eventTitle" required>
                <label for="eventStart">시작 시간:</label>
                <input type="datetime-local" id="eventStart" name="eventStart" required>
                <label for="eventEnd">종료 시간:</label>
                <input type="datetime-local" id="eventEnd" name="eventEnd" required>
                <button type="submit">이벤트 추가</button>
            </form>
            <form action="/companypage/deleteEvent" method="post">
                <input type="hidden" name="calendarId" value="artistC@example.com">
                <label for="eventId">이벤트 ID:</label>
                <input type="text" id="eventId" name="eventId" required>
                <button type="submit">이벤트 삭제</button>
            </form>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>
