//package kr.or.ddit.page.comm;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import jakarta.servlet.http.HttpSession;
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//@Controller
//@RequestMapping("/{groupNo}")
//public class CalendarController {
//
//    @Autowired
//    private CalendarService calendarService;
//
//    @Autowired
//    private PostService postService;
//
//    @GetMapping("/calendar")
//    public String main(HttpSession session, Model model) {
//        // 세션에서 groupNo 가져오기
//        Integer groupNo = (Integer) session.getAttribute("groupNo");
//        if (groupNo == null) {
//            // 세션에 groupNo가 없는 경우 예외 처리 또는 리디렉션
//            log.error("groupNo가 세션에 없습니다.");
//            return "redirect:/error"; // 예시로 에러 페이지로 리디렉션
//        }
//
//        log.info("아티스트 일정 확인 캘린더: groupNo={}", groupNo);
//
//        // groupName 전달
//        String groupName = postService.getGroupName(groupNo);
//        model.addAttribute("groupName", groupName);
//        model.addAttribute("groupNo", groupNo);
//
//        // 캘린더 데이터를 가져와서 전달
//        String calendarId = calendarService.getCalendarIdByGroup(groupNo);
//        model.addAttribute("calendarId", calendarId);
//
//        return "comm/calendar";
//    }
//}
