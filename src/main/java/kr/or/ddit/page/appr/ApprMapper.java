package kr.or.ddit.page.appr;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ApprAttrVO;
import kr.or.ddit.vo.ApprDocVO;
import kr.or.ddit.vo.ApprLineVO;
import kr.or.ddit.vo.ApprManVO;

@Mapper
public interface ApprMapper {

	public int getTotal();

	public List<ApprDocVO> list(Map<String, Object> map);

	public ApprDocVO detail(int atrzDocNo);

	public int saveAll(ApprDocVO apprDocVO, ApprLineVO apprLineVO, List<ApprManVO> apprMan);
	
	public int saveApprDocument(ApprDocVO apprDocVO);
	
	public int saveApprAttr(ApprAttrVO apprAttrVO);

	public List<Map<String, Object>> getTreeData();

	public ApprManVO getUserInfo(String memId);

	public int saveApprLine(ApprLineVO apprLineVO);

	public int saveApprMan(ApprManVO apprManVO);


}
