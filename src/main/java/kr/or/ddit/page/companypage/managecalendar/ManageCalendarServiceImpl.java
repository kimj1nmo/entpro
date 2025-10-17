//package kr.or.ddit.page.companypage.managecalendar;
//
////import com.google.api.services.calendar.Calendar; // Google Calendar API 서비스
////import com.google.api.services.calendar.model.Calendar; // Google Calendar 모델 클래스
//import com.google.api.services.calendar.model.Event;
//import com.google.api.services.calendar.model.Events;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.io.IOException;
//import java.util.List;
//
//@Service
//public class ManageCalendarServiceImpl implements ManageCalendarService {
//
//    @Autowired
//    private GoogleCalendarClient googleCalendarClient;
//
//    /**
//     * 새로운 캘린더 생성
//     * @param calendarName 생성할 캘린더 이름
//     * @return 생성된 캘린더 ID
//     */
//    @Override
//    public String createCalendar(String calendarName) {
//        try {
//            // Google Calendar 모델 클래스 사용
//            com.google.api.services.calendar.model.Calendar calendar = new com.google.api.services.calendar.model.Calendar();
//            calendar.setSummary(calendarName); // 캘린더 이름 설정
//
//            // 캘린더 생성 API 호출
//            com.google.api.services.calendar.model.Calendar createdCalendar = googleCalendarClient
//                    .getCalendarService()
//                    .calendars()
//                    .insert(calendar)
//                    .execute();
//
//            return createdCalendar.getId(); // 생성된 캘린더 ID 반환
//        } catch (IOException e) {
//            throw new RuntimeException("캘린더 생성 실패", e);
//        }
//    }
//
//    /**
//     * 캘린더에 이벤트 추가
//     * @param calendarId 캘린더 ID
//     * @param event 추가할 이벤트 객체
//     */
//    @Override
//    public void addEvent(String calendarId, Event event) {
//        try {
//            googleCalendarClient.getCalendarService().events().insert(calendarId, event).execute();
//        } catch (IOException e) {
//            throw new RuntimeException("이벤트 추가 실패", e);
//        }
//    }
//
//    /**
//     * 캘린더에서 이벤트 삭제
//     * @param calendarId 캘린더 ID
//     * @param eventId 삭제할 이벤트 ID
//     */
//    @Override
//    public void deleteEvent(String calendarId, String eventId) {
//        try {
//            googleCalendarClient.getCalendarService().events().delete(calendarId, eventId).execute();
//        } catch (IOException e) {
//            throw new RuntimeException("이벤트 삭제 실패", e);
//        }
//    }
//
//    /**
//     * 캘린더 이벤트 목록 조회
//     * @param calendarId 캘린더 ID
//     * @return 이벤트 목록
//     */
//    @Override
//    public List<Event> getEvents(String calendarId) {
//        try {
//            Events events = googleCalendarClient.getCalendarService().events().list(calendarId).execute();
//            return events.getItems();
//        } catch (IOException e) {
//            throw new RuntimeException("이벤트 조회 실패", e);
//        }
//    }
//}
