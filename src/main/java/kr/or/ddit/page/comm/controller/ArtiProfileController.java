//package kr.or.ddit.page.comm.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.annotation.AuthenticationPrincipal;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import jakarta.servlet.http.HttpSession;
//import kr.or.ddit.page.comm.service.ArtiProfileService;
//import kr.or.ddit.security.CustomUser;
//import kr.or.ddit.vo.ArtistVO;
//
//@Controller
//@RequestMapping("/comm")
//public class ArtiProfileController {
//
//    @Autowired
//    private ArtiProfileService service;
//
//    @GetMapping("/artistProfile")
//    public String artistProfile(
//            @RequestParam(value = "artistNo", required = false) String artistNo,
//            @RequestParam(value = "groupNo", required = false, defaultValue = "") String groupNo,
//            Model model, 
//            HttpSession session,
//            @AuthenticationPrincipal CustomUser currentUser) {
//
//        // 로그인된 사용자 정보 가져오기
//        if (currentUser != null) {
//            String memId = currentUser.getMember().getMemId(); // CustomUser에서 Member 객체의 memId 가져오기
//            session.setAttribute("memId", memId); // 세션에 memId 저장
//            System.out.println("Logged-in User MEM_ID: " + memId);
//        } else {
//            System.out.println("No user is currently logged in.");
//        }
//
//        // Artist 정보 가져오기
//        ArtistVO artistProfile = service.getArtistProfile(artistNo);
//        if (artistProfile == null) {
//            System.out.println("No artist profile found for artistNo: " + artistNo);
//        } else {
//            System.out.println("Artist Profile: " + artistProfile);
//        }
//
//        // groupNo 처리
//        if (groupNo.isEmpty() && session.getAttribute("groupNo") != null) {
//            groupNo = session.getAttribute("groupNo").toString();
//        }
//        System.out.println("Group No: " + groupNo);
//
//        // Model에 데이터 추가
//        model.addAttribute("artist", artistProfile);
//        model.addAttribute("groupNo", groupNo);
//
//        return "comm/artiProfile";
//    }
//
//}
