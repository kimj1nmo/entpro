package kr.or.ddit.page.comm;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import kr.or.ddit.security.CustomUser;
import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;

@RequestMapping("/{groupNo}")
@Slf4j
@Controller
public class ArtistController {

	@Autowired
	PostService postService;
	
	@Autowired
	ArtistService artistService;
	
	@GetMapping("/artist")
    // 그룹의 게시글 리스트 가져오기
public String artist(@PathVariable("groupNo") int groupNo, Model model,
		HttpSession session, @AuthenticationPrincipal CustomUser customUser) {

	   // 로그인된 사용자 정보 가져오기
    MemberVO loginUser = (customUser != null) ? customUser.getMember() : null;
    
    String userId = (customUser != null && customUser.getMember() != null) ? customUser.getMember().getMemId() : null;
    
    // 그룹 리스트 가져오기
    List<GroupsVO> groupsVOList = this.postService.artist(groupNo);
    
    

    log.info("list->groupsVOList : " + groupsVOList);
    // 그룹 데뷔일 가져오기
    if (groupsVOList != null && !groupsVOList.isEmpty()) {
        GroupsVO group = groupsVOList.get(0); 
        Date groupBirth = group.getGroupBirth();

        if (groupBirth != null) {
            String formattedDaysSinceDebut = calculateDaysSinceDebut(groupBirth);
            model.addAttribute("daysSinceDebut", formattedDaysSinceDebut); // 모델에 추가
        } else {
            model.addAttribute("daysSinceDebut", "알 수 없음");
        }
    } else {
        model.addAttribute("daysSinceDebut", "알 수 없음");
    }
    
    // 세션에 그룹번호를 넣어줌
    session.setAttribute("groupNo", groupNo);

    // groupName 전달
    String groupName = postService.getGroupName(groupNo);
    model.addAttribute("groupName", groupName);

    // groupName 전달
    int communityMember = postService.getCountMem(groupNo);
    model.addAttribute("communityMember", communityMember);
    
 // 그룹별 아티스트 정보 (이름, 사진 등) 가져오기
    List<ArtistVO> artistList = artistService.getArtistsByGroupNo(groupNo);
    log.info("artistList" + artistList);
    model.addAttribute("artistList", artistList); // 아티스트 리스트 추가


    // 모델에 데이터 추가
    model.addAttribute("groupsVOList", groupsVOList);
    model.addAttribute("groupNo", groupNo); // groupNo를 명시적으로 추가

    // 로그인 정보 전달
    model.addAttribute("loginUser", loginUser);

    return "comm/artist"; // JSP 파일 이름
}
	
	private String calculateDaysSinceDebut(Date groupBirth) {
	    if (groupBirth == null) return "알 수 없음";

	    // Date를 LocalDate로 변환
	    LocalDate debutDate = groupBirth.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	    LocalDate currentDate = LocalDate.now();

	    // 데뷔일부터 오늘까지 일수 계산
	    long daysSinceDebut = ChronoUnit.DAYS.between(debutDate, currentDate);

	    // 천 단위 쉼표 추가
	    NumberFormat numberFormat = NumberFormat.getInstance();
	    return numberFormat.format(daysSinceDebut) + "일";
	}
	


}
