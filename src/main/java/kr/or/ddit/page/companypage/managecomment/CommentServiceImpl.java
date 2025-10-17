package kr.or.ddit.page.companypage.managecomment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.vo.CommentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentMapper commentMapper;

	// 그룹 이름 조회
		public String getGroupName(int groupNo) {
			return this.commentMapper.getGroupName(groupNo);
		}
		
	//게시글 총 갯수 가져오기
	@Override
	public int getTotal(Map<String, Object> map) {
		
		return commentMapper.getTotal(map);
	}

	//게시글 리스트 가져오기
	@Override
	public List<CommentVO> list(Map<String, Object> map) {
		
		return commentMapper.list(map);
	}
	

	@Override
	public List<CommentVO> listAll() {
		 List<CommentVO> comments = commentMapper.listAll(); // 매퍼 호출
	        log.info("listAll() 결과: {}", comments); // 데이터 확인
		return comments;
	}


}
