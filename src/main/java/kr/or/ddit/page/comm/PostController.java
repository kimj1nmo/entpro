package kr.or.ddit.page.comm;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.page.comm.membership.MembershipService;
import kr.or.ddit.page.comm.service.ArtiProfileService;
import kr.or.ddit.page.managerpage.service.CalendarService;
import kr.or.ddit.security.CustomUser;
import kr.or.ddit.vo.ArtistVO;
import kr.or.ddit.vo.ComRegVO;
import kr.or.ddit.vo.CommLikeVO;
import kr.or.ddit.vo.CommReportVO;
import kr.or.ddit.vo.CommentVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.GroupsVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MembershipVO;
import kr.or.ddit.vo.SchdulVO;
import lombok.extern.slf4j.Slf4j;

//groupNo란? 커뮤니티 그룹(아티스트들이 모인 하나의 팀)을 식별하는 번호
@Slf4j
@RequestMapping("/{groupNo}")
@Controller
public class PostController {

	@Autowired
	private ArtiProfileService artiProfileService;

	@Autowired
	private PostService postService;

	@Autowired
	CalendarService calendarService;
	
	@Autowired
	MembershipService membershipService;

	@GetMapping("/profile2")
    public String artistProfile2(@RequestParam(value = "memId") String memId, // memId를 쿼리 파라미터로 받음
                                 @PathVariable(value = "groupNo") int groupNo, // groupNo는 Path Variable로 받음
                                 Model model, HttpSession session, @AuthenticationPrincipal CustomUser customUser) {

        // ** 프로필 데이터 처리 **
        log.info("Requested for memId: " + memId);
        log.info("Requested for groupNo: " + groupNo);

        // 커뮤니티별 닉네임 가져오기
        CommunityVO community = postService.getCommunityNickname(memId, groupNo);
        String commRegNick = (community != null) ? community.getCommRegNick() : "닉네임 없음";
        model.addAttribute("commRegNick", commRegNick);
        log.info("커뮤니티 닉네임: " + commRegNick);

        // 해당 사용자의 생일 정보 가져오기
        ArtistVO artistBirthInfo = artiProfileService.getArtistBirth(memId);
        if (artistBirthInfo != null) {
            log.info("Fetched artistBirthInfo: " + artistBirthInfo.getArtistBirth());
            model.addAttribute("artistBirth", artistBirthInfo.getArtistBirth());
        } else {
            log.info("Artist birth information is null for memId: " + memId);
            model.addAttribute("artistBirth", null);
        }

        // ** 게시글 목록 데이터 처리 **
        // 로그인된 사용자 정보 가져오기
        MemberVO loginUser = (customUser != null) ? customUser.getMember() : null;
        String userId = (customUser != null && customUser.getMember() != null) ? customUser.getMember().getMemId()
                : null;

        // 그룹의 게시글 리스트 가져오기
        List<CommunityVO> communityVOList2 = this.postService.list(groupNo);
        
     // ** 댓글 목록 데이터 처리 ** 추가된 부분
        List<CommunityVO> commentList = postService.selectComment2(groupNo, memId);  // 댓글 목록 가져오기
        log.info("댓글 목록22 : " + commentList);
        model.addAttribute("commentList", commentList); // 댓글 목록을 모델에 추가

        // 특정 memId와 groupNo에 해당하는 게시글 가져오기
        List<CommunityVO> communityVOList = postService.profileList(groupNo, memId);

        for (CommunityVO communityVO : communityVOList) {
            // 좋아요 수 가져오기 및 설정
            int likeCount = postService.getLikeCount(communityVO.getCommNo());
            communityVO.setLikeCount(likeCount);

            // 좋아요 상태 확인 및 설정
            CommLikeVO likeStatus = postService.getCommLikeStatus(communityVO.getCommNo(), userId);
            communityVO.setIsLiked((likeStatus != null && likeStatus.getCommLikeYn() == 1) ? 1 : 0);

            // 댓글 수 가져오기 및 설정
            int commentCount = postService.getCommentCount(communityVO.getCommNo());
            communityVO.setCommentCount(commentCount);
        }

        for (CommunityVO communityVO : communityVOList2) {
            // 좋아요 수 가져오기 및 설정
            int likeCount = postService.getLikeCount(communityVO.getCommNo());
            communityVO.setLikeCount(likeCount);
            
            // 좋아요 상태 확인 및 설정
            CommLikeVO likeStatus = postService.getCommLikeStatus(communityVO.getCommNo(), userId);
            communityVO.setIsLiked((likeStatus != null && likeStatus.getCommLikeYn() == 1) ? 1 : 0);
            
            // 댓글 수 가져오기 및 설정
            int commentCount = postService.getCommentCount(communityVO.getCommNo());
            communityVO.setCommentCount(commentCount);
        }

        log.info("게시글 목록 communityVOList: " + communityVOList);

        // 세션에 그룹번호 저장
        session.setAttribute("groupNo", groupNo);

        // 그룹 이름 및 멤버 수 가져오기
        String groupName = postService.getGroupName(groupNo);
        int communityMember = postService.getCountMem(groupNo);

        model.addAttribute("groupName", groupName);
        model.addAttribute("communityMember", communityMember);

        // 로그인 정보 전달
        model.addAttribute("loginUser", loginUser);

        // 모델에 데이터 추가
        model.addAttribute("communityVOList", communityVOList); // 해당 사람이 쓴 게시글 목록
        model.addAttribute("communityVOList2", communityVOList2); // 전체 게시글 목록
        model.addAttribute("groupNo", groupNo); // 그룹 번호

        

        return "comm/profile2"; // 프로필 JSP 파일 경로
    }

	@GetMapping("/profile")
	public String artistProfile(@RequestParam(value = "memId") String memId, // memId를 쿼리 파라미터로 받음
            @PathVariable(value = "groupNo") int groupNo, // groupNo는 Path Variable로 받음
            Model model, HttpSession session, @AuthenticationPrincipal CustomUser customUser) {

// ** 프로필 데이터 처리 **
log.info("Requested for memId: " + memId);
log.info("Requested for groupNo: " + groupNo);

// 커뮤니티별 닉네임 가져오기
CommunityVO community = postService.getCommunityNickname(memId, groupNo);
String commRegNick = (community != null) ? community.getCommRegNick() : "닉네임 없음";
model.addAttribute("commRegNick", commRegNick);
log.info("커뮤니티 닉네임: " + commRegNick);

// 해당 사용자의 생일 정보 가져오기
ArtistVO artistBirthInfo = artiProfileService.getArtistBirth(memId);
if (artistBirthInfo != null) {
log.info("Fetched artistBirthInfo: " + artistBirthInfo.getArtistBirth());
model.addAttribute("artistBirth", artistBirthInfo.getArtistBirth());
} else {
log.info("Artist birth information is null for memId: " + memId);
model.addAttribute("artistBirth", null);
}

// ** 게시글 목록 데이터 처리 **
// 로그인된 사용자 정보 가져오기
MemberVO loginUser = (customUser != null) ? customUser.getMember() : null;
String userId = (customUser != null && customUser.getMember() != null) ? customUser.getMember().getMemId()
: null;

// 그룹의 게시글 리스트 가져오기
List<CommunityVO> communityVOList2 = this.postService.list(groupNo);

CommunityVO communityFileGroup = postService.getFileGroupNo(memId, groupNo);
Long fileGroupNo = (communityFileGroup != null) ? communityFileGroup.getFileGroupNo() : null;
model.addAttribute("fileGroupNo", fileGroupNo); // JSP에서 사용
log.info("fileGroupNo: " + fileGroupNo);

// FILE_SAVE_LOCATE 값 가져오기
String fileSaveLocate = (communityFileGroup != null) ? communityFileGroup.getFileSaveLocate() : null;
model.addAttribute("fileSaveLocate", fileSaveLocate); // JSP에서 사용
log.info("fileSaveLocate: " + fileSaveLocate);
// ** 댓글 목록 데이터 처리 ** 추가된 부분
List<CommunityVO> commentList = postService.selectComment2(groupNo, memId);  // 댓글 목록 가져오기
log.info("댓글 목록22 : " + commentList);
model.addAttribute("commentList", commentList); // 댓글 목록을 모델에 추가

// 특정 memId와 groupNo에 해당하는 게시글 가져오기
List<CommunityVO> communityVOList = postService.profileList(groupNo, memId);

for (CommunityVO communityVO : communityVOList) {
// 좋아요 수 가져오기 및 설정
int likeCount = postService.getLikeCount(communityVO.getCommNo());
communityVO.setLikeCount(likeCount);

// 좋아요 상태 확인 및 설정
CommLikeVO likeStatus = postService.getCommLikeStatus(communityVO.getCommNo(), userId);
communityVO.setIsLiked((likeStatus != null && likeStatus.getCommLikeYn() == 1) ? 1 : 0);

// 댓글 수 가져오기 및 설정
int commentCount = postService.getCommentCount(communityVO.getCommNo());
communityVO.setCommentCount(commentCount);
}

for (CommunityVO communityVO : communityVOList2) {
// 좋아요 수 가져오기 및 설정
int likeCount = postService.getLikeCount(communityVO.getCommNo());
communityVO.setLikeCount(likeCount);

// 좋아요 상태 확인 및 설정
CommLikeVO likeStatus = postService.getCommLikeStatus(communityVO.getCommNo(), userId);
communityVO.setIsLiked((likeStatus != null && likeStatus.getCommLikeYn() == 1) ? 1 : 0);

// 댓글 수 가져오기 및 설정
int commentCount = postService.getCommentCount(communityVO.getCommNo());
communityVO.setCommentCount(commentCount);
}

log.info("게시글 목록 communityVOList: " + communityVOList);

// 세션에 그룹번호 저장
session.setAttribute("groupNo", groupNo);

// 그룹 이름 및 멤버 수 가져오기
String groupName = postService.getGroupName(groupNo);
int communityMember = postService.getCountMem(groupNo);

model.addAttribute("groupName", groupName);
model.addAttribute("communityMember", communityMember);

// 로그인 정보 전달
model.addAttribute("loginUser", loginUser);

// 모델에 데이터 추가
model.addAttribute("communityVOList", communityVOList); // 해당 사람이 쓴 게시글 목록
model.addAttribute("communityVOList2", communityVOList2); // 전체 게시글 목록
model.addAttribute("groupNo", groupNo); // 그룹 번호



return "comm/profile"; // 프로필 JSP 파일 경로
	}

	// 커뮤니티별 닉네임 가져오기
//  CommunityVO community = postService.getCommunityNickname(memId, groupNo);
//  String commRegNick = community != null ? community.getCommRegNick() : "닉네임 없음";
//  model.addAttribute("commRegNick", commRegNick);

	/*
	 * 게시글 등록 폼 요청URI : /community/create 요청파라미터 : 요청방식 : get
	 */
	// 메서드 레벨에서 요청URI를 매핑
	// 클래스 레벨 + 메서드 레벨 => /community/create
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(@PathVariable("groupNo") int groupNo, Model model) {
		model.addAttribute("groupNo", groupNo); // groupNo를 JSP로 전달

		// forwarding : jsp리턴
		return "comm/create";
	}

	@RequestMapping(value = "/gojoin", method = RequestMethod.GET)
	public String joinjoin(@PathVariable("groupNo") int groupNo, Model model) {
		model.addAttribute("groupNo", groupNo); // groupNo를 JSP로 전달

		// forwarding : jsp리턴
		return "comm/join";
	}

	@RequestMapping(value = "/listlist", method = RequestMethod.GET)
	public String listlist(@PathVariable("groupNo") int groupNo, Model model) {
		model.addAttribute("groupNo", groupNo); // groupNo를 JSP로 전달

		// forwarding : jsp리턴
		return "comm/timeline";
	}

	// **이 요청은 그룹 선택 시 무조건 여기로 옴
	// 요청URI : /2/feed
	@GetMapping("/feed")
	// 그룹의 게시글 리스트 가져오기
	public String list(@PathVariable("groupNo") int groupNo, Model model, HttpSession session, @RequestParam(value = "commNo", required = false) Integer commNo,
			@AuthenticationPrincipal CustomUser customUser) {

	    log.info("Received commNo: {}", commNo);

		// 로그인된 사용자 정보 가져오기
		MemberVO loginUser = (customUser != null) ? customUser.getMember() : null;
		String userId = (customUser != null && customUser.getMember() != null) ? customUser.getMember().getMemId()
				: null;
		// 해당 사용자의 생일 정보 가져오기
		if (customUser != null && customUser.getMember() != null) {
			String memId = customUser.getMember().getMemId();
			session.setAttribute("memId", memId); // 세션에 memId 저장
			log.info("memId: " + memId);
			log.info("groupNo: " + groupNo);
        ArtistVO artistBirthInfo = artiProfileService.getArtistBirth(memId);
        if (artistBirthInfo != null) {
            log.info("Fetched artistBirthInfo: " + artistBirthInfo.getArtistBirth());
            model.addAttribute("artistBirth", artistBirthInfo.getArtistBirth());
        } else {
            log.info("Artist birth information is null for memId: " + memId);
            model.addAttribute("artistBirth", null);
        }
		}
		// 멤버십 가입 상태 확인
	    boolean isMembershipActive = membershipService.isMembershipActive(groupNo, userId);
	    
		// 그룹의 게시글 리스트 가져오기
		List<CommunityVO> communityVOList = this.postService.list(groupNo);
		List<CommunityVO> communityreport = this.postService.getCommReportYn(groupNo);
		
		//특정 하나의 커뮤니티 정보(GroupsVO로 리턴)
		GroupsVO groupsVO = this.postService.communityOne(groupNo);
		log.info("특정 하나의 커뮤니티 정보 : " + groupsVO);
		
		List<Map<String, Object>> getMembershipList= this.postService.getMembershipList(groupNo);

		// 댓글 작성자 멤버십 가입 여부
		 List<CommentVO> comments = null;
		    if (commNo != null) {
		        comments = postService.getCommentsWithMembership(commNo);
		    }
		
		// 각 게시글에 좋아요 수 및 댓글 수 추가
		for (CommunityVO communityVO : communityVOList) {
			int likeCount = postService.getLikeCount(communityVO.getCommNo()); // 좋아요 수 가져오기
			communityVO.setLikeCount(likeCount); // CommunityVO에 좋아요 수 설정

			CommLikeVO likeStatus = postService.getCommLikeStatus(communityVO.getCommNo(), userId); // 좋아요 상태 확인
			communityVO.setIsLiked((likeStatus != null && likeStatus.getCommLikeYn() == 1) ? 1 : 0); // isLiked 설정

			int commentCount = postService.getCommentCount(communityVO.getCommNo()); // 댓글 수 가져오기
			communityVO.setCommentCount(commentCount); // CommunityVO에 댓글 수 설정
		}

		log.info("list->communityVOList : " + communityVOList);
		log.info("list->communityreport : " + communityreport);

		// 세션에 그룹 번호 저장
		session.setAttribute("groupNo", groupNo);

		// 그룹 이름 전달
		String groupName = postService.getGroupName(groupNo);
		model.addAttribute("groupName", groupName);

		// 그룹의 멤버 수 전달
		int communityMember = postService.getCountMem(groupNo);
		model.addAttribute("communityMember", communityMember);

		// 로그인한 사용자의 닉네임 가져오기
		if (customUser != null && customUser.getMember() != null) {
			String memId = customUser.getMember().getMemId();
			CommunityVO community = postService.getCommunityNickname(memId, groupNo); // 커뮤니티별 닉네임 가져오기
			String commRegNick = (community != null) ? community.getCommRegNick() : "닉네임 없음"; // 닉네임 설정
			log.info("commRegNick {}", commRegNick);
			model.addAttribute("commRegNick", commRegNick);
		}

		// 로그인된 사용자의 프로필 사진 및 저장 경로 가져오기
		if (customUser != null && loginUser != null) {
			CommunityVO communityFileGroup = postService.getFileGroupNo(userId, groupNo);
			Long fileGroupNo = (communityFileGroup != null) ? communityFileGroup.getFileGroupNo() : null;
			model.addAttribute("fileGroupNo", fileGroupNo); // JSP에서 사용
			log.info("fileGroupNo: " + fileGroupNo);

			String fileSaveLocate = (communityFileGroup != null) ? communityFileGroup.getFileSaveLocate() : null;
			model.addAttribute("fileSaveLocate", fileSaveLocate); // JSP에서 사용
			log.info("fileSaveLocate: " + fileSaveLocate);
		}

		// 모델에 데이터 추가
		model.addAttribute("communityVOList", communityVOList);
		model.addAttribute("groupsVO", groupsVO);//특정 하나의 커뮤니티 정보(GroupsVO로 리턴)
		model.addAttribute("communityreport", communityreport);
		model.addAttribute("getMembershipList", getMembershipList); // groupNo를 명시적으로 추가
		model.addAttribute("groupNo", groupNo); // groupNo를 명시적으로 추가

		// 로그인 정보 전달
		model.addAttribute("loginUser", loginUser);

		 // 가입 상태 전달
	    model.addAttribute("isMembershipActive", isMembershipActive);
	    
	    // 댓글 정보 전달
	    model.addAttribute("comments", comments);
	    
		return "comm/feed"; // JSP 파일 이름
	}

	@GetMapping("/feed/status")
	@ResponseBody
	public Map<String, Object> checkMembershipStatus(@PathVariable("groupNo") int groupNo,
			@AuthenticationPrincipal CustomUser user) {
		Map<String, Object> response = new HashMap<>();

		// 1. 로그인 여부 확인
		if (user == null || user.getMember() == null) {
			response.put("isLoggedIn", false);
			response.put("isCommunityMember", false);
			return response;
		}

		// 2. 커뮤니티 가입 여부 확인
		String memId = user.getMember().getMemId();
		boolean isCommunityMember = postService.checkReg(groupNo, memId);

		response.put("isLoggedIn", true);
		response.put("isCommunityMember", isCommunityMember);

		return response;
	}

	/*
	 * 요청URI : /community/createPost 요청파라미터 : request{boTitle=개똥이게임,boWriter=이정재
	 * ,boContent=개똥이게임2탄,uploadFile=파일객체들} 요청방식 : post
	 *
	 * 속성이 하나일 때는 속성명을 생략할 수 있다.
	 */

	@PostMapping("/create")
	@ResponseBody
	public Map<String, Object> createPost(@PathVariable("groupNo") int groupNo, @ModelAttribute CommunityVO communityVO,
			@AuthenticationPrincipal CustomUser user, Model model) {
		Map<String, Object> response = new HashMap<>();

		// 사용자 인증 확인
		if (user == null || user.getMember() == null) {
			log.warn("User is not authenticated or member is null.");
			response.put("result", 0);
			response.put("message", "로그인이 필요합니다.");
			return response;
		}

		// memId 설정
		String memId = user.getMember().getMemId();
		communityVO.setMemId(memId);
		communityVO.setGroupNo(groupNo); // groupNo 설정
		model.addAttribute("groupNo", groupNo); // groupNo를 JSP로 전달

		log.info("createPost->communityVO: " + communityVO);

		// 게시글 저장
		int result = this.postService.createPost(communityVO);
		log.info("createPost->result: " + result);
		log.info("createPost->communityVO: " + communityVO);

		// 응답 생성
		response.put("result", result);
		response.put("message", result > 0 ? "게시글이 성공적으로 등록되었습니다." : "게시글 등록에 실패했습니다.");
		if (result > 0) {
			response.put("commNo", communityVO.getCommNo()); // 커뮤니티 번호 추가
		}
		log.info("GroupNo: " + groupNo);
		log.info("CommunityVO: " + communityVO);
		return response;
	}

	/*
	 * 요청URI : /community/detail?commNo=1 요청파라미터 : request{commNo=1} 요청방식 : get
	 *
	 * forwarding : jsp리턴 return "community/detail";
	 */

	@GetMapping("/detailmanage")
	public String detail(@PathVariable("groupNo") int groupNo, @RequestParam("commNo") String commNo, Model model,
			@AuthenticationPrincipal CustomUser customUser) {
		log.info("GroupNo: " + groupNo + ", CommNo: " + commNo);

		// CustomUser에서 로그인한 사용자 정보 가져오기
		MemberVO loginUser = (customUser != null) ? customUser.getMember() : null;

		String memId = loginUser.getMemId();
		log.info("detail2->memId : " + memId);
		// 게시글 상세 정보 가져오기
		CommunityVO communityVO = this.postService.detail(commNo, groupNo, memId);
		log.info("communityVO: " + communityVO);

		if (communityVO != null) {
			// 좋아요 수 조회 및 설정
//	        int likeCount = postService.getLikeCount(Integer.parseInt(commNo));
//	        communityVO.setLikeCount(likeCount);

			// 댓글 수 조회 및 설정
			int commentCount = postService.getCommentCount(Integer.parseInt(commNo));
			communityVO.setCommentCount(commentCount);
		}

		// 댓글 목록 가져오기
		List<CommentVO> commentVOList = this.postService.selectComment(communityVO);

		// 모델에 데이터 추가
		model.addAttribute("communityVO", communityVO);
		model.addAttribute("commentVOList", commentVOList);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("loginUser", loginUser);

		return "comm/detail"; // JSP 파일 이름
	}

	@GetMapping("/detail")
	@ResponseBody
	public Map<String, Object> detail(@PathVariable("groupNo") int groupNo, @RequestParam("commNo") String commNo,
			@AuthenticationPrincipal CustomUser customUser) {

		// GroupNo: 3, CommNo: 127
		log.info("detail->GroupNo: " + groupNo + ", CommNo: " + commNo);

		MemberVO loginUser = (customUser != null) ? customUser.getMember() : null;

		String memId = loginUser.getMemId();
		log.info("detail->memId: " + memId);
		CommunityVO communityVO = this.postService.detail(commNo, groupNo, memId);

		if (communityVO != null) {
//	        communityVO.setLikeCount(postService.getLikeCount(Integer.parseInt(commNo)));
			communityVO.setCommentCount(postService.getCommentCount(Integer.parseInt(commNo)));
		}
		List<CommunityVO> communityVOList2 = this.postService.profileList(groupNo, memId);
		/*
		 * CommunityVO(RNUM=0, commNo=126, groupNo=3, memId=che0, commCn=😮..,
		 * commWriteDate=2025-01-20 16:35:50, commUpdtDate=2025-01-20 16:35:50,
		 * commView=0, commStatus=1, memshipState=0, groupNoCr=null, memIdCr=null,
		 * commRegNo=0, commRegJoin=Mon Jan 20 16:30:51 KST 2025, commRegNick=채채,
		 * fileGroupNo=null, fileGroupNoC=20250120024, fileGroupNoCr=20250120023,
		 * fileGroupNoG=null, fileGroupVO=FileGroupVO(fileGroupNo=0, fileRegdate=Mon Jan
		 * 20 16:35:49 KST 2025, fileDetailVOList=[FileDetailVO(fileSn=1, fileGroupNo=0,
		 * fileOriginalName=KakaoTalk_20250120_163537555.jpg,
		 * fileSaveName=b7c983e1-d1f3-4fe6-9be2-
		 * 7c672bf90e75_KakaoTalk_20250120_163537555.jpg,
		 * fileSaveLocate=/resources/upload/2025/01/20/b7c983e1-d1f3-4fe6-9be2-
		 * 7c672bf90e75_KakaoTalk_20250120_163537555.jpg, fileSize=254172, fileExt=jpg,
		 * fileMime=image/jpeg, fileFancysize=248.21 KB, fileSaveDate=Mon Jan 20
		 * 16:35:49 KST 2025, fileDowncount=0)]), uploadFiles=null, fileSaveLocate=null,
		 * proSaveLocate=/resources/upload/2025/01/20/d24bbe60-31c0-4ef0-bd00-
		 * 72bec5b37574_KakaoTalk_20250120_163016742.jpg, groupSaveLocate=null,
		 * likeCount=0, commentCount=1, isLiked=0, groupName=null)
		 */
		log.info("detail->communityVO : " + communityVO);

		List<CommentVO> commentVOList = this.postService.selectComment(communityVO);
		log.info("detail->commentVOList : " + commentVOList);

		Map<String, Object> result = new HashMap<>();
		result.put("communityVO", communityVO);
		result.put("commentVOList", commentVOList);
		result.put("commentVOList2", communityVOList2);
		result.put("loginUser", loginUser);
		result.put("user", loginUser);

		return result; // JSON 형식으로 반환
	}

//	@GetMapping("/detailmodal")
//	@ResponseBody
//	public CommunityVO getDetail(@RequestParam("groupNo") int groupNo, @RequestParam("commNo") String commNo) {
//		// 상세 데이터 가져오기
//		CommunityVO communityVO = this.postService.detail(commNo, groupNo);
//		return communityVO;
//	}

	@PostMapping("/updatePost")
	@ResponseBody
	public Map<String, Object> updatePost(@PathVariable("groupNo") int groupNo, @RequestBody CommunityVO communityVO) {
		log.info("updatePost->groupNo : " + groupNo);
		log.info("updatePost->communityVO : " + communityVO);

		int result = this.postService.updatePost(communityVO);
		Map<String, Object> response = new HashMap<>();
		response.put("result", result);
		response.put("message", result > 0 ? "게시글이 성공적으로 수정되었습니다." : "게시글 수정에 실패했습니다.");
		return response;
	}

	/*
	 * @PostMapping("/{groupNo}/updatePost") public String
	 * updatePost(@PathVariable("groupNo") int groupNo, @ModelAttribute CommunityVO
	 * communityVO, Model model) { log.info("updatePost->communityVO : " +
	 * communityVO);
	 *
	 * int result = this.postService.updatePost(communityVO);
	 * log.info("updatePost->result : " + result);
	 *
	 * //redirect : 새로운 URI를 재요청 return
	 * "redirect:/community/detail?commNo="+communityVO.getCommNo(); }
	 *
	 * 요청URI : /community/update/1 경로변수 : commNo 요청파라미터 : JSONstring{"commNo":1}
	 * 요청방식 : PUT
	 *
	 * @ResponseBody
	 *
	 * @PutMapping("/update/{commNo}") public int
	 * update(@PathVariable(value="commNo") int commNo,
	 *
	 * @RequestBody CommunityVO communityVO) { //update->commNo : 8
	 * log.info("update->commNo : " + commNo); //memberReplyVO :
	 * MemberReplyVO(commNo=8, memId=null..
	 *
	 * //MEMBER_REPLY 테이블의 REPLY_STATUS 컬럼의 값을 0으로 update int result =
	 * this.postService.update(communityVO); log.info("update->result : " + result);
	 *
	 * //데이터 return result; }
	 */

	/*
	 * 요청URI : /community/delete 요청파라미터 : JSONString{"commNo":"1"} 요청방식 : delete
	 *
	 * 리턴 : 1) 1 : 삭제 성공 2) 0 : 삭제 실패
	 */
	@PostMapping("/deletePost")
	@ResponseBody
	public Map<String, Object> deletePost(@PathVariable("groupNo") int groupNo, @RequestBody CommunityVO communityVO) {
		log.info("deletePost->groupNo : " + groupNo);
		log.info("deletePost->commNo : " + communityVO.getCommNo());

		int result = this.postService.deletePost(communityVO.getCommNo());
		Map<String, Object> response = new HashMap<>();
		response.put("result", result);
		response.put("message", result > 0 ? "게시글이 성공적으로 삭제되었습니다." : "게시글 삭제에 실패했습니다.");
		return response;
	}

	@PostMapping("/delete")
	@ResponseBody
	public ResponseEntity<String> deleteSelected(@PathVariable("groupNo") int groupNo,
			@RequestBody List<Integer> commNoList) {
		log.info("deleteSelected -> groupNo: {}, commNoList: {}", groupNo, commNoList);

		try {
			postService.deleteSelected(commNoList);
			return ResponseEntity.ok("삭제 성공");
		} catch (Exception e) {
			log.error("삭제 실패", e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("삭제 실패");
		}
	}

	/**
	 * 커뮤니티 가입 요청URI : /community/reg 요청파라미터 : request{memId=t001, memPass=0506,
	 * memName=성원태2, memZip=306-702, memAdd1=대전광역시 중구 유천동, memAdd2=한사랑아파트 302동 504호,
	 * memBir=2024-11-27} 요청방식 : post
	 *
	 * RequestBody: JSONString -> deserialize -> MemberVO
	 */

	@PostMapping("/join")
	@ResponseBody
	public Map<String, Object> createReg(@PathVariable("groupNo") int groupNo, @ModelAttribute ComRegVO comRegVO,
			@AuthenticationPrincipal CustomUser user) {
		Map<String, Object> response = new HashMap<>();

		// 사용자 인증 확인
		if (user == null || user.getMember() == null) {
			log.warn("User is not authenticated or member is null.");
			response.put("message", "로그인이 필요합니다.");
			return response;
		}

		// 사용자 ID 설정
		String memId = user.getMember().getMemId();
		log.info("Authenticated user memId: " + memId);
		comRegVO.setMemId(memId);
		comRegVO.setGroupNo(groupNo);

		log.info("createReg->comRegVO: " + comRegVO);

		// 서비스 호출
		int result = postService.createReg(comRegVO);

		log.info("createReg->result : " + result);

		if (result > 0) {
			response.put("message", "커뮤니티 가입이 완료되었습니다!");
		} else {
			response.put("message", "가입 중 문제가 발생했습니다.");
		}
		return response;
	}

	// 댓글 등록
	@ResponseBody
	@PostMapping("/createComment")
	public int createComment(@PathVariable int groupNo, @RequestBody CommentVO commentVO,
			@AuthenticationPrincipal CustomUser user) {
		if (user == null || user.getMember() == null) {
			throw new IllegalArgumentException("로그인이 필요합니다.");
		}

		// 로그인된 사용자 정보에서 memId 설정
		String memId = user.getMember().getMemId();
		commentVO.setMemId(memId);

		log.info("createComment->commentVO : {}", commentVO);

		int result = postService.createComment(commentVO);
		return result;
	}

	// 댓글 수정
	@ResponseBody
	@PostMapping("/updateComment")
	public CommentVO updateComment(@RequestBody CommentVO commentVO) {
		log.info("updateComment->memberReplyVO : " + commentVO);

		// update 실행
		int result = this.postService.updateComment(commentVO);
		log.info("updateCreate->result : " + result);

		// 업데이트된 그 행을 가져오장
		commentVO = this.postService.selectOneComment(commentVO);
		log.info("updateComment->memberReplyVO : " + commentVO);

		return commentVO;
	}

	// 댓글 삭제 상태 1로 바꾸는 업데이트
	@ResponseBody
	@PutMapping("/updateDelete/{cmmtNo}")
	public int updateDelete(@PathVariable(value = "cmmtNo") int cmmtNo, @RequestBody CommentVO commentVO) {
		log.info("updateDelete->cmmtNo: " + cmmtNo);

		log.info("updateDelete->commentVO: " + commentVO);

		// MEMBER_REPLY 테이블의 STATUS 컬럼을 0으로 업데이트
		int result = this.postService.updateDelete(commentVO);
		log.info("updateDelete->result: " + result);

		// 데이터
		return result;

	}

	@PostMapping("/like/{commNo}")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> likePost(@PathVariable int commNo,
			@AuthenticationPrincipal CustomUser user) {

		if (user == null || user.getMember() == null) {
			return ResponseEntity.status(401).body(Map.of("message", "로그인이 필요합니다."));
		}

		String memId = user.getMember().getMemId();
		CommLikeVO likeVO = new CommLikeVO();
		likeVO.setCommNo(commNo);
		likeVO.setMemId(memId);

		// 좋아요 상태 변경
		CommLikeVO updatedLike = postService.setCommLikeAjax(likeVO);

		// 좋아요 수 가져오기 (서비스 계층 통해 호출)
		int likeCount = postService.getLikeCount(commNo);

		// 응답 데이터 구성
		Map<String, Object> response = new HashMap<>();
		response.put("isLiked", updatedLike.getCommLikeYn() == 1);
		response.put("likeCount", likeCount);

		return ResponseEntity.ok(response);
	}

	// groupNo로 캘린더 페이지를 보여주는 메서드

	// groupNo에 해당하는 캘린더 이벤트 조회
	@GetMapping("/calendar")
	public String getCalendarPage(@PathVariable("groupNo") int groupNo, Model model) { // @RequestParam -> @PathVariable
																						// 수정
		log.info("getCalendarPage -> groupNo: {}", groupNo);
		List<SchdulVO> events = calendarService.getCalendarEvent(groupNo); // 이벤트 조회
		// 이벤트 중 첫 번째 항목에서 groupName 가져오기
		String groupName = events.isEmpty() ? "Unknown Group" : events.get(0).getGroupName();
		model.addAttribute("events", events); // 이벤트 리스트 전달
		model.addAttribute("groupNo", groupNo); // 그룹 번호 전달
		model.addAttribute("groupName", groupName); // 그룹 이름 전달
		log.info("groupName: {}", groupName); // groupName이 제대로 가져오는지 확인
		return "comm/calendar"; // JSP 반환
	}

	@ResponseBody
	@GetMapping("/calendar2")
	public List<SchdulVO> getEvents(@PathVariable("groupNo") int groupNo) {
		log.info("getEvents -> groupNo: {}", groupNo);
		return calendarService.getCalendarEvent(groupNo); // JSON 데이터 반환
	}

	@PostMapping("/report")
	@ResponseBody
	public Map<String, Object> reportPost(@PathVariable("groupNo") int groupNo, 
	                                      @RequestBody CommReportVO commReportVO,
	                                      @AuthenticationPrincipal CustomUser user) {

	    Map<String, Object> response = new HashMap<>();

	    // 사용자 인증 확인
	    if (user == null || user.getMember() == null) {
	        response.put("status", "error");
	        response.put("message", "로그인이 필요합니다.");
	        return response;
	    }

	    // 신고자 ID 설정
	    String memId = user.getMember().getMemId();
	    commReportVO.setMemId(memId);
	    log.info("ReportPost -> 신고 요청 데이터: {}", commReportVO);

	    // 이미 신고한 게시글인지 확인
	    if (postService.isAlreadyReported(commReportVO.getCommNo(), memId)) {
	        response.put("status", "error");
	        response.put("message", "이미 신고한 게시글입니다.");
	        return response;
	    }

	    // 신고 처리
	    int result = postService.reportPost(commReportVO);

	    response.put("status", result > 0 ? "success" : "error");
	    response.put("message", result > 0 ? "신고가 접수되었습니다." : "신고 접수에 실패했습니다.");
	    return response;
	}
	
	@PostMapping("/updateNickname")
    public String updateNickname(@PathVariable("groupNo") int groupNo,  // groupNo를 PathVariable로 받아옴
                                 @RequestParam(value = "memId") String memId, 
                                 @RequestParam(value = "newNickname") String newNickname, 
                                 Model model) {

        // 닉네임 변경을 위한 CommunityVO 객체 생성
        CommunityVO communityVO = new CommunityVO();
        communityVO.setMemId(memId);        // 로그인한 사용자 ID
        communityVO.setCommRegNick(newNickname); // 새로 변경된 닉네임

        // 닉네임 업데이트 로직 호출
        int updateCount = postService.updateCommunityNickname(communityVO);  // DB 업데이트

        if (updateCount > 0) {
            model.addAttribute("message", "닉네임이 성공적으로 변경되었습니다.");
        } else {
            model.addAttribute("message", "닉네임 변경에 실패했습니다.");
        }

        // 업데이트 후 다시 프로필 페이지로 리디렉션
        return "redirect:/{groupNo}/profile2?memId=" + memId;  // groupNo를 포함한 리디렉션
    }
	
	@PostMapping("/uploadProfilePhoto")
	public String uploadProfilePhoto(
	        @PathVariable("groupNo") int groupNo,  // PathVariable로 groupNo 받기
	        @RequestParam("profilePhoto") MultipartFile profilePhoto,
	        @RequestParam("memId") String memId,
	        HttpServletRequest request,
	        RedirectAttributes redirectAttributes) {

	    try {
	        // 사진 저장 경로 생성 (C:/upload/2025/{월}/{일}/)
	        String uploadPath = "C:/upload/2025";
	        LocalDate today = LocalDate.now();
	        String month = String.format("%02d", today.getMonthValue());
	        String day = String.format("%02d", today.getDayOfMonth());
	        File monthDir = new File(uploadPath, month);
	        File dayDir = new File(monthDir, day);

	        if (!dayDir.exists()) {
	            dayDir.mkdirs();  // 월, 일 폴더 생성
	        }

	        // 파일 저장
	        String fileName = UUID.randomUUID().toString() + "_" + profilePhoto.getOriginalFilename();
	        File destFile = new File(dayDir, fileName);
	        profilePhoto.transferTo(destFile);

	        // DB에 저장할 파일 경로 생성
	        String fileSaveLocate = "/resources/upload/2025/" + month + "/" + day + "/" + fileName;

	        // 업로드된 파일 경로 확인 로그
	        System.out.println("업로드된 파일 경로: " + fileSaveLocate);  // 경로 확인용 로그

	        // CommunityVO에 값 설정
	        CommunityVO communityVO = new CommunityVO();
	        communityVO.setMemId(memId);
	        communityVO.setFileSaveLocate(fileSaveLocate);
	        communityVO.setGroupNo(groupNo); 

	        // DB 업데이트 호출
	        boolean isUpdated = postService.updateFileSaveLocate(communityVO);

	        if (isUpdated) {
	            redirectAttributes.addFlashAttribute("successMessage", "프로필 사진이 성공적으로 변경되었습니다.");
	        } else {
	            redirectAttributes.addFlashAttribute("errorMessage", "프로필 사진 변경에 실패했습니다.");
	        }

	    } catch (IOException e) {
	        e.printStackTrace();
	        redirectAttributes.addFlashAttribute("errorMessage", "파일 저장 중 오류가 발생했습니다.");
	    }

	    // groupNo를 포함한 리디렉션
	    return "redirect:/" + groupNo + "/profile2?memId=" + memId;
	}


}
