package kr.or.ddit.page.comm;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.ComRegVO;
import kr.or.ddit.vo.CommLikeVO;
import kr.or.ddit.vo.CommReportVO;
import kr.or.ddit.vo.CommentVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.GroupsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PostServiceImpl implements PostService {

	@Autowired
	PostMapper postMapper;

	@Autowired
	UploadController uploadController;

	// 그룹 이름 조회
	public String getGroupName(int groupNo) {
		return this.postMapper.getGroupName(groupNo);
	}

	// 커뮤니티 가입자 수 조회
	public int getCountMem(int groupNo) {
		return this.postMapper.getCountMem(groupNo);
	}

	// 커뮤니티 리스트 조회
	@Override
	public List<CommunityVO> list(int groupNo) {
		return this.postMapper.list(groupNo);
	}

	public List<CommunityVO> getCommReportYn(@Param("groupNo") int groupNo){
		return this.postMapper.getCommReportYn(groupNo);
	}
	
	//특정 하나의 커뮤니티 정보(GroupsVO로 리턴)
	@Override
	public GroupsVO communityOne(int groupNo) {
		return this.postMapper.communityOne(groupNo);
	}

	// 마이페이지 게시글 리스트 조회
	@Override
	public List<CommunityVO> profileList(int groupNo, String memId) {
		return this.postMapper.profileList(groupNo, memId);
	}

	@Override
	public List<GroupsVO> artist(int groupNo) {
		return this.postMapper.artist(groupNo);
	}

	// 커뮤니티 테이블에 insert
	@Override
	public int createPost(CommunityVO communityVO) {
		// 1. 다중 파일업로드 처리(파일 + DB)
		MultipartFile[] uploadFiles = communityVO.getUploadFiles();

		// 1-2. 파일이 있는 경우만 실행
		if (uploadFiles != null && uploadFiles[0].getOriginalFilename().length() > 0) {
			long fileGroupNo = this.uploadController.multiImageUpload(uploadFiles);
			log.info("createPost->fileGroupNo : " + fileGroupNo);

			// 파일 그룹 번호 설정
			communityVO.setFileGroupNo(fileGroupNo);
			log.info("createPost->comRegVO : " + communityVO);
		}
		// 2. groupNo 설정 확인 (컨트롤러에서 설정되었는지 확인)
		log.info("createPost->groupNo : " + communityVO.getGroupNo());

		int result = this.postMapper.createPost(communityVO);
		log.info("createPost->result : " + result);

		return result;
	}

	// 게시물 상세 보기
	@Override
	public CommunityVO detail(String commNo, int groupNo, String memId) {
		return this.postMapper.detail(commNo, groupNo, memId);
	}

	// 게시글 수정
	@Override
	public int updatePost(CommunityVO communityVO) {
		return this.postMapper.updatePost(communityVO);
	}

	@Override
	public int update(CommunityVO communityVO) {
		return this.postMapper.update(communityVO);
	}

	// 게시글 삭제
	@Override
	public int deletePost(int commNo) {
		return this.postMapper.deletePost(commNo);
	}

	@Override
	public void deleteSelected(List<Integer> commNoList) {
		postMapper.deleteSelected(commNoList);
	}

	// 커뮤니티 가입
	@Override
	public int createReg(ComRegVO comRegVO) {
		// 세션에서 memId를 가져오기 (세션을 매개변수로 전달)
		String memId = comRegVO.getMemId(); // 현재는 comRegVO에 memId가 없을 수 있음. 세션에서 가져오기 전에 값을 설정할 필요 있음.

		// 세션에서 memId를 가져오는 코드 추가
		if (memId == null) {
			log.error("memId가 null입니다. 세션에서 가져오는 코드 필요.");
			// 예외 처리 로직 추가
		}

		// 1. 다중 파일업로드 처리(파일 + DB)
		MultipartFile[] uploadFiles = comRegVO.getUploadFiles();

		// 1-2. 파일이 있는 경우만 실행
		if (uploadFiles != null && uploadFiles[0].getOriginalFilename().length() > 0) {
			long fileGroupNo = this.uploadController.multiImageUpload(uploadFiles);
			log.info("createReg->fileGroupNo : " + fileGroupNo);

			// 2. comRegVO 테이블에 insert
			comRegVO.setFileGroupNo(fileGroupNo);
			log.info("createReg->comRegVO : " + comRegVO);
		}

		int result = this.postMapper.createReg(comRegVO);
		log.info("createReg->result : " + result);

		return result;
	}

	/**
	 * 사용자가 특정 그룹에 가입되어 있는지 확인
	 * 
	 * @param groupNo 그룹 번호
	 * @param memId   사용자 ID
	 * @return 가입 여부 (true: 가입, false: 미가입)
	 */

	// 커뮤니티 가입 확인
	@Override
	public boolean checkReg(int groupNo, String memId) {
		return postMapper.isUserMemberOfGroup(groupNo, memId) > 0;
	}

	// 댓글 목록 조회
	@Override
	public List<CommentVO> selectComment(CommunityVO communityVO) {
		return this.postMapper.selectComment(communityVO);
	}
	// 특정 회원 댓글 목록 조회
	@Override
	public List<CommunityVO> selectComment2(int groupNo, String memId) {
		return this.postMapper.selectComment2(groupNo, memId);
	}
	
	// 댓글 하나
	@Override
	public CommentVO selectOneComment(CommentVO commentVO) {
		return this.postMapper.selectOneComment(commentVO);
	}

	// 댓글 등록
	@Override
	public int createComment(CommentVO commentVO) {
		return this.postMapper.createComment(commentVO);
	}

	// 댓글 수정
	@Override
	public int updateComment(CommentVO commentVO) {
		return this.postMapper.updateComment(commentVO);
	}

	// 댓글 삭제
	@Override
	public int updateDelete(CommentVO commentVO) {
		return this.postMapper.updateDelete(commentVO);
	}

//  댓글 count
	public int getCommentCount(int commNo) {
		return postMapper.getCommentCount(commNo);
	}

	@Override
	public CommunityVO getCommunityNickname(String memId, int groupNo) {
		return postMapper.getCommunityNickname(memId, groupNo);
	}

	// 해당 글 번호에 해당맴버가 좋아요를 눌렇는지 체크한다
	@Override
	@Transactional
	public CommLikeVO getCommLikeChk(CommLikeVO commLikeVO) {
		return postMapper.getCommLikeChk(commLikeVO);
	}
	// 해당 글 번호에 해당맴버가 좋아요를 눌렀을 떄

	@Override
	@Transactional
	public CommLikeVO setCommLikeAjax(CommLikeVO commLikeVO) {
		// 좋아요 상태 확인
		CommLikeVO existingLike = postMapper.getCommLikeChk(commLikeVO);
		log.info("현재 좋아요 상태: {}", existingLike);

		if (existingLike == null) {
			// 처음 좋아요: INSERT
			postMapper.commLikeIns(commLikeVO);
			log.info("좋아요 추가");
			commLikeVO.setCommLikeYn(1); // 좋아요 상태를 1로 설정
		} else {
			// 좋아요 상태 반전: UPDATE
			int updatedYn = existingLike.getCommLikeYn() == 1 ? 0 : 1;
			commLikeVO.setCommLikeYn(updatedYn); // 상태 반전값 설정
			postMapper.commLikeChn(commLikeVO);
			log.info("좋아요 상태 변경됨: {}", updatedYn);
		}

		return commLikeVO;
	}

	@Override
	public CommLikeVO getCommLikeStatus(int commNo, String userId) {
		CommLikeVO likeVO = new CommLikeVO();
		likeVO.setCommNo(commNo);
		likeVO.setMemId(userId);
		return postMapper.getCommLikeChk(likeVO); // 좋아요 상태 조회
	}

	// 게시글 좋아요
	// public int likePost(CommLikeVO commLikeVO) {
	// return this.postMapper.likePost(commLikeVO);
	// }

	// 게시글 좋아요 취소
	// public int cancleLike(CommLikeVO commLikeVO) {
	// return this.postMapper.cancleLike(commLikeVO);
	// }

	/*
	 * public boolean toggleLike(CommLikeVO like) { //이미 좋아요를 눌렀는지 체킹 CommLikeVO
	 * existingLike = postMapper.checkLike(like); log.info("checkLike 결과: {}",
	 * existingLike);
	 * 
	 * if (existingLike == null) {//최초 좋아요를 누름 => insert => 1 log.info("좋아요 추가: {}",
	 * like); postMapper.insertLike(like); return true; // 좋아요 완료 } else {//이미 좋아요 한
	 * 글을 또 누름 => 기본키가 있으니까 => delete => 0 log.info("좋아요 취소: {}",
	 * existingLike.getCommLikeNo());
	 * postMapper.cancelLike(existingLike.getCommLikeNo()); return false; // 좋아요 취소
	 * } }
	 * 
	 * // 글 번호에 로그인 멤버가 좋아요 눌렀는지 체크
	 * 
	 * @Override public CommLikeVO checkLike(CommLikeVO like) { return
	 * postMapper.checkLike(like); }
	 * 
	 * @Override public void insertLike(CommLikeVO like) {
	 * 
	 * }
	 * 
	 * 
	 * 
	 * 
	 * @Override public void cancelLike(int commLikeNo) {
	 * 
	 * }
	 */
	@Override
	public int getLikeCount(int commNo) {
		return postMapper.getLikeCount(commNo);
	}
	// 특정 회원의 프로필 사진 조회

	@Override
	public CommunityVO getFileGroupNo(String memId, int groupNo) {
		return postMapper.getFileGroupNo(memId, groupNo);
	}

	@Override
	public int reportPost(CommReportVO commReportVO) {
		return postMapper.insertReport(commReportVO);
	}
	
	@Override
    public boolean isAlreadyReported(int commNo, String memId) {
        return postMapper.isReported(commNo, memId) > 0;
    }

	@Override
	public int updateCommunityNickname(CommunityVO communityVO) {
		return postMapper.updateCommunityNickname(communityVO);
	}

	@Override
	public boolean updateFileSaveLocate(CommunityVO communityVO) {
		return postMapper.updateFileSaveLocate(communityVO);
	}
	
	@Override
	public List<Map<String, Object>> getMembershipList(int groupNo) {
	    return postMapper.getMembershipList(groupNo);
	}
	
	// 댓글 작성자 멤버십 여부
	@Override
    public List<CommentVO> getCommentsWithMembership(int commNo) {
        return postMapper.getCommentsWithMembership(commNo);
    }

	 public List<CommentVO> selectCommentWithMembership(int groupNo, int commNo) {
	        return postMapper.selectCommentWithMembership(groupNo, commNo);
	    }
}
