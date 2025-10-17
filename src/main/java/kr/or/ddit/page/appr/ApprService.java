package kr.or.ddit.page.appr;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.vo.ApprAttrVO;
import kr.or.ddit.vo.ApprDocVO;
import kr.or.ddit.vo.ApprLineVO;
import kr.or.ddit.vo.ApprManVO;

@Service
public interface ApprService {

	public int getTotal();

	public List<ApprDocVO> list(Map<String, Object> map);

	public ApprDocVO detail(int atrzDocNo);

	public int saveAll(ApprDocVO apprDocVO);

	public int saveApprDocument(ApprDocVO apprDocVO);

	public int saveApprAttr(ApprAttrVO apprAttrVO);


	public List<Map<String, Object>> getTreeData();

	public ApprManVO getUserInfo(String memId);




}
