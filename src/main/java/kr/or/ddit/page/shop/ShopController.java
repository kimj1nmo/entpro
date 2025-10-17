package kr.or.ddit.page.shop;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import kr.or.ddit.page.comm.PostService;
import kr.or.ddit.page.shop.service.GoodsService;
import kr.or.ddit.security.CustomUser;
import kr.or.ddit.vo.CommLikeVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.GoodsVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/{groupNo}")
@Slf4j
@Controller
public class ShopController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private GoodsService goodsService;

	// /3/shop
	@GetMapping("/shop")
	public String main(@PathVariable("groupNo") int groupNo, Model model, HttpSession session,
			@AuthenticationPrincipal CustomUser customUser) {
		log.info("굿즈샵->groupNo : " + groupNo);
		
		// 로그인된 사용자 정보 가져오기
		MemberVO loginUser = (customUser != null) ? customUser.getMember() : null;
		String userId = (customUser != null && customUser.getMember() != null) ? customUser.getMember().getMemId()
				: null;

		// 그룹의 게시글 리스트 가져오기
		List<CommunityVO> communityVOList = this.postService.list(groupNo);
		List<Map<String, Object>> getMembershipList= this.postService.getMembershipList(groupNo);

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
		
		//getAllGoods() -> getGroupGoods(groupNo)
		List<GoodsVO> goodsList = goodsService.getGroupGoods(groupNo); // ✅ 특정 그룹의 상품 조회
		log.info("shop->list : " + goodsList);

		// 모델에 데이터 추가
		model.addAttribute("communityVOList", communityVOList);
		model.addAttribute("getMembershipList", getMembershipList); // groupNo를 명시적으로 추가
		model.addAttribute("groupNo", groupNo); // groupNo를 명시적으로 추가
		model.addAttribute("goodsList", goodsList); // <c:forEach var="goods" items="달러{goodsList}">

		// 로그인 정보 전달
		model.addAttribute("loginUser", loginUser);

//		return "comm/feed"; // JSP 파일 이름

		return "shop/main";
	}

}
