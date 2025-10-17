package kr.or.ddit.page.appr;

import java.util.List;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ApprDocVO;

@Mapper
public interface ApprDocMapper {

    // 문서 등록
    void insertApprDoc(ApprDocVO apprDoc);

    // 문서 조회 (ID로)
    ApprDocVO selectApprDocById(int docNo);

    // 문서 목록 조회
    List<ApprDocVO> selectApprDocList();

    // 문서 상태 변경
    void updateApprDoc(ApprDocVO apprDoc);

    // 문서 삭제 (선택적으로 필요)
    void deleteApprDoc(int docNo);
}
