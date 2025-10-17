	package kr.or.ddit.page.companypage.managecomment;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CommentVO;

@Mapper
public interface CommentMapper {


	//그룹 이름 조회
	public String getGroupName(int groupNo);
		
	//게시글 총 갯수 가져오기
	int getTotal(Map<String, Object> map);

	//게시글 리스트 가져오기(sort
	List<CommentVO> list(Map<String, Object> map);
	
	public List<CommentVO> listAll();



}
