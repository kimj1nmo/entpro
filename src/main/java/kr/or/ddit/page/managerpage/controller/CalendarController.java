package kr.or.ddit.page.managerpage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.or.ddit.page.companypage.manageartist.ManageArtistController;
import kr.or.ddit.page.companypage.managecomm.ManageCommService;
import kr.or.ddit.page.companypage.managegroup.ManageGroupService;
import kr.or.ddit.page.managerpage.service.CalendarService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.SchdulVO; // VO 이름 변경: CalendarEventVO -> SchdulVO
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manage")
public class CalendarController {

    @Autowired
    ManageGroupService manageGroupService;
    @Autowired
    ManageCommService manageCommService;
    @Autowired
    CalendarService calendarService;

    // 그룹 목록 정렬 (groupListSortAjax)
    @ResponseBody
    @RequestMapping(value = "/calendar", method = RequestMethod.POST)
    public ArticlePage<GroupsVO> groupListSortAjax(@RequestBody Map<String, Object> map) {
        log.info("groupListSortAjax->map : {}", map);
        
        // 전체 행의 수
        int total = this.manageGroupService.getTotal(map);
        log.info("groupListSortAjax->total : {}", total);

        // 그룹 목록 가져오기
        List<GroupsVO> groupsVOList = this.manageGroupService.listSort(map);
        log.info("groupListSortAjax->groupsVOList : {}", groupsVOList);

        // 모든 그룹 리스트 (필요한 경우 JSON으로 전달)
        List<GroupsVO> groupsList = manageCommService.getGroupsList();
        log.info("groupListSortAjax->groupsList : {}", groupsList);

        // 클라이언트에서 사용하는 파라미터
        int currentPage = Integer.parseInt(map.get("currentPage").toString());
        String keyword = map.getOrDefault("keyword", "").toString();
        int mode = Integer.parseInt(map.get("mode").toString());
        String sortName = map.getOrDefault("sortName", "").toString();

        // 페이지네이션 객체 생성
        ArticlePage<GroupsVO> articlePage = new ArticlePage<>(
            total, 
            currentPage, 
            10, 
            groupsVOList, 
            keyword, 
            mode, 
            sortName
        );

        return articlePage; // JSON 데이터 반환
    }
    @ResponseBody
    @GetMapping("/calendar/groups")
    public List<GroupsVO> getGroupsList() {
        log.info("getGroupsList called");

        // 모든 그룹 리스트 가져오기
        List<GroupsVO> groupsList = manageCommService.getGroupsList();
        log.info("Fetched groupsList: {}", groupsList);

        return groupsList; // JSON 형태로 반환
    }

    @GetMapping("/calendar")
    public String groupListSort(Model model, @RequestParam Map<String, Object> params) {
        log.info("groupListSort->params : {}", params);

        // 전체 행의 수
        int total = this.manageGroupService.getTotal(params);
        log.info("groupListSort->total : {}", total);

        // 그룹 목록 가져오기
        List<GroupsVO> groupsVOList = this.manageGroupService.listSort(params);
        log.info("groupListSort->groupsVOList : {}", groupsVOList);

        // 클라이언트에서 사용하는 파라미터
        int currentPage = Integer.parseInt(params.getOrDefault("currentPage", "1").toString());
        String keyword = params.getOrDefault("keyword", "").toString();
        int mode = Integer.parseInt(params.getOrDefault("mode", "1").toString());
        String sortName = params.getOrDefault("sortName", "groupName").toString();

        // 데이터를 모델에 추가
        model.addAttribute("groupsVOList", groupsVOList);
        model.addAttribute("total", total);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("keyword", keyword);
        model.addAttribute("mode", mode);
        model.addAttribute("sortName", sortName);

        // 해당 JSP로 이동
        return "managepage/manage/calendar"; // /WEB-INF/views/calendar/groupList.jsp
    }
 // 그룹 목록 페이지
//    @RequestMapping(value = "/calendar", method = RequestMethod.GET)
//    public String list(@RequestParam(name = "groupNo", required = false) Integer groupNo, Model model) {
//        // 모든 그룹 리스트 가져오기
//        List<GroupsVO> groupsList = manageCommService.getGroupsList();
//        log.info("groupsList: {}", groupsList); // 수정된 로그 방식
//
//        // JSP에 전달
//        model.addAttribute("groupsList", groupsList);
//
//        return "manage/calendar"; // "calendar.jsp" 경로에 해당
//    }

    // 캘린더 이벤트 조회
    @ResponseBody
    @RequestMapping(value = "/getEvents", method = RequestMethod.GET)
    public List<SchdulVO> getEvents(@RequestParam("groupNo") int groupNo) {  // groupNo로 이벤트 조회
        log.info("getEvents -> groupNo: {}", groupNo);
        return calendarService.getCalendarEvent(groupNo);  // 서비스 메서드 호출
    }


    // 캘린더에 이벤트 추가
    @ResponseBody
    @PostMapping("/addEvent")
    public String addEvent(@RequestBody SchdulVO eventVO) { // VO 이름 변경: CalendarEventVO -> SchdulVO
        log.info("addEvent -> eventVO: {}", eventVO);
        int result = calendarService.addCalendarEvent(eventVO);
        if (result > 0) {
            return "일정이 추가되었습니다 !";
        } else {
            return "Failed to add event.";
        }
    }

    // 캘린더 이벤트 수정
    @ResponseBody
    @PostMapping("/updateEvent")
    public String updateEvent(@RequestBody SchdulVO eventVO) { // VO 이름 변경: CalendarEventVO -> SchdulVO
        log.info("updateEvent -> eventVO: {}", eventVO);
        int result = calendarService.updateCalendarEvent(eventVO);
        if (result > 0) {
            return "일정이 수정되었습니다 !";
        } else {
            return "Failed to update event.";
        }
    }

 // 캘린더 이벤트 삭제
    @ResponseBody
    @PostMapping("/deleteEvent")
    public String deleteEvent(@RequestParam("schdulNo") int eventId) {
        log.info("deleteEvent -> eventId: {}", eventId);
        int result = calendarService.deleteCalendarEvent(eventId);
        return result > 0 ? "일정이 삭제되었습니다!" : "일정 삭제에 실패했습니다.";
    }


    
    @ResponseBody
    @RequestMapping(value = "/getEventDetails", method = RequestMethod.GET)
    public SchdulVO getEventDetails(@RequestParam("schdulNo") int schdulNo) {
        log.info("getEventDetails -> schdulNo: {}", schdulNo);
        return calendarService.getEventDetails(schdulNo); // 일정 번호로 이벤트 상세 정보 조회
    }



    // 아티스트 검색
    @ResponseBody
    @PostMapping("/artistSearch")
    public List<ArtistVO> artistSearch(@RequestBody ArtistVO artistVO) {
        log.info("artistSearch->artistVO : " + artistVO);
        List<ArtistVO> artistVOs = manageGroupService.artistSearch(artistVO);
        return artistVOs;
    }

}
