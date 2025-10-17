package kr.or.ddit.page.appr;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.ApprFormVO;

@Mapper
public interface ApprFormMapper {

    // 양식 등록
    void insertApprForm(ApprFormVO apprForm);

    // 양식 조회 (양식 번호로)
    ApprFormVO selectApprFormById(int formNo);

    // 양식 수정
    void updateApprForm(ApprFormVO apprForm);

    // 양식 삭제 (선택적으로 필요)
    void deleteApprForm(int formNo);
}
