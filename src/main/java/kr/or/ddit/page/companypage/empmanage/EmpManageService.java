package kr.or.ddit.page.companypage.empmanage;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PositionVO;

public interface EmpManageService {

	// 직원 리스트
	public List<MemberVO> list(Map<String, Object> map);
	// 총 직원 수
	public int getTotal(Map<String, Object> map);
	// 부서 리스트
	public List<DepartmentVO> departmentList();
	// 직책 리스트
	public List<PositionVO> positionList();
	// 암호화된 비밀번호와 함께 멤버등록
	public int changePasswd(MemberVO memberVO);
	// 아이디 중복 체크
	public int idDupChk(MemberVO memberVO);
	// 삭제(비활성화) 처리
	public int deleteMem(MemberVO memberVO);


}
