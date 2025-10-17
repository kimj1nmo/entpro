package kr.or.ddit.page.comm;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.ComRegVO;
import kr.or.ddit.vo.CommLikeVO;
import kr.or.ddit.vo.CommReportVO;
import kr.or.ddit.vo.CommentVO;
import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.GroupsVO;

@Mapper
public interface PostMapper {

	// 그룹 이름 조회
	public String getGroupName(int groupNo);

	// 커뮤니티 가입자 수 조회
	public int getCountMem(int groupNo);

	// 커뮤니티 리스트 조회
	public List<CommunityVO> list(@Param("groupNo") int groupNo);
	public List<CommunityVO> getCommReportYn(@Param("groupNo") int groupNo);
	public List<GroupsVO> artist(@Param("groupNo") int groupNo);
	//특정 하나의 커뮤니티 정보(GroupsVO로 리턴)
	//<select id="communityOne" parameterType="int" resultMap="groupMap">
	public GroupsVO communityOne(int groupNo);
	
	// 마이페이지 리스트 조회
	public List<CommunityVO> profileList(@Param("groupNo") int groupNo, @Param("memId") String memId);
	// 커뮤니티 테이블에 insert
	public int createPost(CommunityVO communityVO);

	// 커뮤니티 상세 조회
	public CommunityVO detail(String commNo, @Param("groupNo") int groupNo, @Param("memId") String memId);

	// 커뮤니티 게시글 수정
	public int update(CommunityVO communityVO);

	public int updatePost(CommunityVO communityVO);

	// 커뮤니티 게시글 삭제
	public int deletePost(@Param("commNo") int commNo);

	// 게시글 선택 삭제
	void deleteSelected(@Param("commNoList") List<Integer> commNoList);

	// 커뮤니티 가입
	public int createReg(ComRegVO comRegVO);

	// 커뮤니티 가입 확인
	public boolean checkReg(@Param("groupNo") int groupNo, @Param("memId") String memId);

	/**
	 * 특정 그룹에 사용자가 가입되어 있는지 확인
	 * 
	 * @param groupNo 그룹 번호
	 * @param memId   사용자 ID
	 * @return 가입 여부 (1: 가입, 0: 미가입)
	 */
	public int isUserMemberOfGroup(@Param("groupNo") int groupNo, @Param("memId") String memId);

	// 댓글 조회
	public List<CommentVO> selectComment(CommunityVO communityVO);
	// 특정 회원 댓글 조회
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

	//해당 글번호에 해당맴버가 좋아요를 누룬것을 저장
	public int commLikeIns(CommLikeVO commLikeVO);
	
	//해당 글번호에 해당맴버가 좋아요를 누룬것을 변경
	public int commLikeChn(CommLikeVO commLikeVO);

//    void insertLike(CommLikeVO like);

//    void cancelLike(int commLikeNo);

    public int getLikeCount(int commNo);

//  댓글 count
	public int getCommentCount(int commNo);

	// 특정 회원의 커뮤니티 닉네임 조회
	CommunityVO getCommunityNickname(@Param("memId") String memId, @Param("groupNo") int groupNo);
    
	//특정 회원의 프로필 사진 조회

    /**
     * 파일 그룹 번호를 조회하는 메서드
     * @param memId 회원 ID
     * @param groupNo 그룹 번호
     * @return CommunityVO 객체 (파일 그룹 번호 포함)
     */
    CommunityVO getFileGroupNo(@Param("memId") String memId, @Param("groupNo") int groupNo);
    
    // 게시글 신고 등록
    int insertReport(CommReportVO commReportVO);
    
    // 신고 여부 확인
    int isReported(@Param("commNo") int commNo, @Param("memId") String memId);
    
    //커뮤니티 닉네임 변경
    public int updateCommunityNickname(CommunityVO communityVO);

	public boolean updateFileSaveLocate(CommunityVO communityVO);

	// 멤버십 조회
	List<Map<String, Object>> getMembershipList(@Param("groupNo") int groupNo);

	// 댓글 작성자 멤버십 여부
	List<CommentVO> getCommentsWithMembership(@Param("commNo") int commNo);
	
    List<CommentVO> selectCommentWithMembership(@Param("groupNo") int groupNo, @Param("commNo") int commNo);


}
