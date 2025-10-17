package kr.or.ddit.page.appr;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ApprLineVO;

@Mapper
public interface ApprLineMapper {

    // 결재선 생성
    void insertApprLine(ApprLineVO apprLine);

    // 결재선 조회 (문서 번호로)
    ApprLineVO selectApprLineByDocNo(int docNo);

    // 결재선 수정
    void updateApprLine(ApprLineVO apprLine);

    // 결재선 삭제 (선택적으로 필요)
    void deleteApprLine(int docNo);
}
