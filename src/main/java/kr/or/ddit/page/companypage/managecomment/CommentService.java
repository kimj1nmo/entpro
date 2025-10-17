package kr.or.ddit.page.companypage.managecomment;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CommentVO;

public interface CommentService {

	//그룹 이름 조회
	public String getGroupName(int groupNo);
		
	//얼범 총 갯수 가져오기
	int getTotal(Map<String, Object> map);

	//앨범 리스트 가져오기
	List<CommentVO> list(Map<String, Object> map);

	// !!! 게시글 전체 리스트!!!
	public List<CommentVO> listAll();


}
