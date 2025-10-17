//package kr.or.ddit.page.comm;
//
//import com.google.api.client.util.DateTime;
//import com.google.api.services.calendar.model.Event;
//import com.google.api.services.calendar.model.EventDateTime;
//import org.springframework.stereotype.Service;
//
//@Service
//public class CalendarServiceImpl implements CalendarService {
//
//    // 그룹 번호로 캘린더를 가져오는 기능은 제외하고, 단순히 이벤트 생성만 수행
//    @Override
//    public Event createEvent(String title, String startDateTime, String endDateTime) {
//        Event event = new Event();
//        event.setSummary(title);
//
//        EventDateTime start = new EventDateTime()
//                .setDateTime(new DateTime(startDateTime))
//                .setTimeZone("Asia/Seoul");
//        event.setStart(start);
//
//        EventDateTime end = new EventDateTime()
//                .setDateTime(new DateTime(endDateTime))
//                .setTimeZone("Asia/Seoul");
//        event.setEnd(end);
//
//        return event;
//    }
//
//	@Override
//	public String getCalendarIdByGroup(Integer groupNo) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//}
