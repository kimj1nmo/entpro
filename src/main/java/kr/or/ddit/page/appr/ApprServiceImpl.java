package kr.or.ddit.page.appr;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.vo.ApprAttrVO;
import kr.or.ddit.vo.ApprDocVO;
import kr.or.ddit.vo.ApprLineVO;
import kr.or.ddit.vo.ApprManVO;

@Service
public class ApprServiceImpl implements ApprService{

	@Autowired
	ApprMapper apprMapper;

	@Override
	public int getTotal() {
		return this.apprMapper.getTotal();
	}

	@Override
	public List<ApprDocVO> list(Map<String, Object> map) {
		return this.apprMapper.list(map);
	}

	@Override
	public ApprDocVO detail(int atrzDocNo) {
		return this.apprMapper.detail(atrzDocNo);
	}

	@Override
	@Transactional
	public int saveAll(ApprDocVO apprDocVO) {

		 // 1. 결재선 저장
	    ApprLineVO apprLineVO = new ApprLineVO();
	    apprLineVO.setAtrzLineNm("기본 결재선"); // 결재선 이름 설정
	    apprMapper.saveApprLine(apprLineVO); // 결재선 저장 (시퀀스로 atrzLineNo 생성)
	    int atrzLineNo = apprLineVO.getAtrzLineNo(); // 생성된 결재선 번호 가져오기

	    // 2. 결재 문서 저장
	    apprDocVO.setAtrzLineNo(atrzLineNo); // 문서에 결재선 번호 설정
	    apprMapper.saveApprDocument(apprDocVO); // 문서 저장
	    int atrzDocNo = apprDocVO.getAtrzDocNo(); // 생성된 문서 번호 가져오기

	    // 3. 결재자 정보 저장
	    List<ApprManVO> apprManList = apprDocVO.getApprManList();
	    for (ApprManVO apprM : apprManList) {
	        apprM.setAtrzLineNo(atrzLineNo); // 결재자에 결재선 번호 설정
	        apprM.setAtrzDocNo(atrzDocNo);   // 결재자에 문서 번호 설정
	        apprMapper.saveApprMan(apprM);   // 결재자 저장
	    }

	    return atrzDocNo;
	}


	@Override
	public int saveApprAttr(ApprAttrVO apprAttrVO) {
		return this.apprMapper.saveApprAttr(apprAttrVO);
	}

	@Override
	public List<Map<String, Object>> getTreeData() {
		return this.apprMapper.getTreeData();
	}

	@Override
	public ApprManVO getUserInfo(String memId) {
		return this.apprMapper.getUserInfo(memId);
	}

	@Override
	public int saveApprDocument(ApprDocVO apprDocVO) {
		return this.apprMapper.saveApprDocument(apprDocVO);
	}






}

