package kr.or.ddit.page.companypage.empmanage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.page.event.mapper.EventMapper;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PositionVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmpMangeServiceImpl implements EmpManageService{

    @Autowired
    EmpManageMapper empManageMapper;

    @Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

    // 직원 리스트
    @Override
    public List<MemberVO> list(Map<String, Object> map) {
    	return this.empManageMapper.list(map);
    }

    // 총 직원 수
	@Override
	public int getTotal(Map<String, Object> map) {
		return this.empManageMapper.getTotal(map);
	}

	// 부서 리스트
	@Override
	public List<DepartmentVO> departmentList() {
		return this.empManageMapper.departmentList();
	}

	// 직책 리스트
	@Override
	public List<PositionVO> positionList() {
		return this.empManageMapper.positionList();
	}

	// 암호화된 비밀번호와 함께 멤버등록
	@Transactional
	@Override
	public int changePasswd(MemberVO memberVO) {
		//암호화(encrypt) 처리
				String password = memberVO.getMemPw();
				password = this.bCryptPasswordEncoder.encode(password);
				log.info("save->password : " + password);
				log.info("save->memberVO : " + memberVO);


				//패스워드를 저장 시 시큐리티를 설정하며 패스워드 인코딩용으로 등록한 빈을
				//	사용해서 암호화한 후에 저장하자
				memberVO.setMemPw(password);

				//2. TB_MEMBERS 테이블에 insert
				int result = this.empManageMapper.changePasswd(memberVO);
				result += this.empManageMapper.saveAuth(memberVO);

				return result;
	}

	// 아이디 중복 체크
	@Override
	public int idDupChk(MemberVO memberVO) {
		return this.empManageMapper.idDupChk(memberVO);
	}

	// 삭제(비활성화) 처리
	@Override
	public int deleteMem(MemberVO memberVO) {
		return this.empManageMapper.deleteMem(memberVO);
	}



}
