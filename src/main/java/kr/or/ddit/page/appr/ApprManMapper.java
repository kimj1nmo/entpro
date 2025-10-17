package kr.or.ddit.page.appr;

import java.util.List;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ApprManVO;

@Mapper
public interface ApprManMapper {

    // 결재자 등록
    void insertApprMan(ApprManVO apprMan);

    // 결재자 조회 (문서 번호 및 결재자 아이디로)
    ApprManVO selectApprManByDocNoAndId(int docNo, String apprManId);

    // 결재자 상태 변경
    void updateApprMan(ApprManVO apprMan);

    // 결재자 목록 조회 (문서 번호로)
    List<ApprManVO> selectApprManList(int docNo);

    // 결재자 삭제 (선택적으로 필요)
    void deleteApprMan(int docNo, String apprManId);
}

