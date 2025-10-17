package kr.or.ddit.page.comm;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.ComRegVO;
import kr.or.ddit.vo.CommLikeVO;
import kr.or.ddit.vo.CommReportVO;
import kr.or.ddit.vo.CommentVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.GroupsVO;

public interface PostService {

	// 그룹 이름 조회
	public String getGroupName(int groupNo);

	// 커뮤니티 가입자 수 조회
	public int getCountMem(int groupNo);

	// 커뮤니티 리스트 조회
	public List<CommunityVO> list(@Param("groupNo") int groupNo);
	public List<CommunityVO> getCommReportYn(@Param("groupNo") int groupNo);

	public List<GroupsVO> artist(@Param("groupNo") int groupNo);

	// 마이페이지 게시글 리스트 조회
	public List<CommunityVO> profileList(@Param("groupNo") int groupNo, @Param("memId") String memId);

	// 커뮤니티 테이블에 글 등록
	public int createPost(CommunityVO communityVO);

	// 커뮤니티 게시글 상세
	public CommunityVO detail(String commNo, int groupNo, String memId);

	// 커뮤니티 게시글 수정
	public int updatePost(CommunityVO communityVO);

	public int update(CommunityVO communityVO);

	// 커뮤니티 게시글 삭제
	public int deletePost(int commNo);

	// 커뮤니티 가입
	public int createReg(ComRegVO comRegVO);

	// 커뮤니티 가입 확인
	public boolean checkReg(int groupNo, String memId);

	// 댓글 목록 조회
	public List<CommentVO> selectComment(CommunityVO communityVO);
	  // 특정 회원의 댓글 목록 조회
    public List<CommunityVO> selectComment2(@Param("groupNo") int groupNo, @Param("memId") String memId);

	// 댓글 하나
	public CommentVO selectOneComment(CommentVO commentVO);

	// 댓글 등록
	public int createComment(CommentVO commentVO);

	// 댓글 수정
	public int updateComment(CommentVO commentVO);

	// 댓글 삭제
	public int updateDelete(CommentVO commentVO);

	// 글 번호에 로그인 멤버가 좋아요 눌렀는지 체크
	public CommLikeVO getCommLikeChk(CommLikeVO commLikeVO);

	// 해당 글 번호에 해당맴버가 좋아요를 눌렀을 떄
	public CommLikeVO setCommLikeAjax(CommLikeVO commLikeVO);

	// 댓글 count
	public int getCommentCount(int commNo);

	// 특정 회원의 커뮤니티 닉네임 조회
	public CommunityVO getCommunityNickname(String memId, int groupNo);

	// 특정 회원의 프로필 사진 조회
	/**
	 * 파일 그룹 번호를 조회하는 메서드
	 * 
	 * @param memId   회원 ID
	 * @param groupNo 그룹 번호
	 * @return CommunityVO 객체 (파일 그룹 번호 포함)
	 */
	CommunityVO getFileGroupNo(String memId, int groupNo);

	void deleteSelected(List<Integer> commNoList);

	public int getLikeCount(int commNo);

	CommLikeVO getCommLikeStatus(int commNo, String userId);
	
	// 게시글 신고 등록
    int reportPost(CommReportVO commReportVO);
    
    // 신고 여부 확인
    boolean isAlreadyReported(int commNo, String memId);

	public int updateCommunityNickname(CommunityVO communityVO);

	public boolean updateFileSaveLocate(CommunityVO communityVO);

	//멤버십 조회
	List<Map<String, Object>> getMembershipList(int groupNo);

	List<CommentVO> getCommentsWithMembership(int commNo);
	
    List<CommentVO> selectCommentWithMembership(@Param("groupNo") int groupNo, @Param("commNo") int commNo);

    //특정 하나의 커뮤니티 정보(GroupsVO로 리턴)
	public GroupsVO communityOne(int groupNo);


}
