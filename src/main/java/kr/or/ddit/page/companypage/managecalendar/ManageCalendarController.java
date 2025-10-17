//package kr.or.ddit.page.companypage.managecalendar;
//
//import org.springframework.stereotype.Controller;  // 수정: @RestController -> @Controller
//import org.springframework.web.bind.annotation.*;
//import org.springframework.beans.factory.annotation.Autowired;
//import kr.or.ddit.page.companypage.managecalendar.ManageCalendarService;
//
//import com.google.api.client.util.DateTime;
//import com.google.api.services.calendar.model.Event;
//import com.google.api.services.calendar.model.EventDateTime;
//
//@Controller  // 수정: @RestController -> @Controller
//@RequestMapping("/companypage")
//public class ManageCalendarController {
//
//    @Autowired
//    private ManageCalendarService manageCalendarService;
//
//    // 페이지를 보여주는 엔드포인트
//    @GetMapping("/manageCalendar")
//    public String viewManageCalendarPage() {
//        return "companypage/manageCalendar";  // manageCalendar.jsp 페이지로 이동
//    }
//
//    // 캘린더 생성 요청 처리 (기존 API 요청)
//    @PostMapping("/create")
//    @ResponseBody
//    public String createCalendar(@RequestParam String calendarName) {
//        try {
//        	manageCalendarService.createCalendar(calendarName);
//            return "캘린더 생성 성공!";
//        } catch (Exception e) {
//            return "캘린더 생성 실패: " + e.getMessage();
//        }
//    }
//
//    // 이벤트 추가 요청 처리 (기존 API 요청)
//    @PostMapping("/addEvent")
//    @ResponseBody
//    public String addEvent(@RequestParam String calendarId,
//                           @RequestParam String eventTitle,
//                           @RequestParam String eventStart,
//                           @RequestParam String eventEnd) {
//        try {
//            Event event = new Event().setSummary(eventTitle);
//            EventDateTime start = new EventDateTime().setDateTime(new DateTime(eventStart)).setTimeZone("Asia/Seoul");
//            EventDateTime end = new EventDateTime().setDateTime(new DateTime(eventEnd)).setTimeZone("Asia/Seoul");
//            event.setStart(start).setEnd(end);
//            manageCalendarService.addEvent(calendarId, event);
//            return "이벤트 추가 성공!";
//        } catch (Exception e) {
//            return "이벤트 추가 실패: " + e.getMessage();
//        }
//    }
//
//    // 이벤트 삭제 요청 처리 (기존 API 요청)
//    @PostMapping("/deleteEvent")
//    @ResponseBody
//    public String deleteEvent(@RequestParam String calendarId, @RequestParam String eventId) {
//        try {
//        	manageCalendarService.deleteEvent(calendarId, eventId);
//            return "이벤트 삭제 성공!";
//        } catch (Exception e) {
//            return "이벤트 삭제 실패: " + e.getMessage();
//        }
//    }
//}
