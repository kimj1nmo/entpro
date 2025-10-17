package kr.or.ddit.page.comm.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.MembershipVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MembershipServiceImpl implements MembershipService {

	@Autowired
	private MembershipMapper membershipMapper;

	@Override
	public boolean registerMembership(int groupNo, String memId) {
		// 1. COMMUNITY_REGDATA에서 COMM_REG_NO 가져오기
		MembershipVO membershipVO = new MembershipVO();
		membershipVO.setGroupNo(groupNo);
		membershipVO.setMemId(memId);

		Integer commRegNo = membershipMapper.getCommRegNo(membershipVO);
		if (commRegNo == null) {
			throw new RuntimeException("유효하지 않은 그룹 번호 또는 사용자 ID입니다.");
		}

		// 2. MEMSHIP 테이블에서 MEMSHIP_NO 및 PAY_AMOUNT 가져오기
		MembershipVO membershipDetails = membershipMapper.getMembershipDetails(groupNo);
		log.debug("Membership Details: " + membershipDetails);
		if (membershipDetails == null) {
			throw new RuntimeException("멤버십 정보를 찾을 수 없습니다.");
		}

		int memshipNo = membershipDetails.getMemshipNo();
		int memshipAmount = membershipDetails.getMemshipAmount(); // MEMSHIP 테이블의 금액
		log.debug("Fetched memshipAmount: " + memshipAmount);

		// 3. VIRTUAL_CRRNCY에서 잔액 확인
		int balance = membershipMapper.checkVirtualCurrencyBalance(memId);
		if (balance < memshipAmount) {
			log.warn("Insufficient balance: current balance = " + balance + ", required = " + memshipAmount);
//			throw new RuntimeException("가상 화폐 잔액이 부족합니다.  현재 잔액: " + balance);
			return false;
		}

		// 4. MEMSHIP_DATA 테이블에 INSERT
//	        MembershipVO membershipVO = new MembershipVO();
		membershipVO.setMemshipNo(memshipNo);
		membershipVO.setCommRegNo(commRegNo);
		membershipMapper.insertMembershipData(membershipVO);

		// 5. VIRTUAL_CRRNCY 테이블에서 잔액 차감
		membershipVO.setVrtualCrrncyUse(-memshipAmount); // 음수 값 설정
		membershipMapper.insertVirtualCurrency(membershipVO);
		log.debug("Inserted into VIRTUAL_CURRENCY: " + membershipVO);

		return true;
	}

	@Override
	public boolean isMembershipActive(int groupNo, String memId) {
	    CommunityVO communityVO = new CommunityVO();
	    communityVO.setGroupNo(groupNo);
	    communityVO.setMemId(memId);
	    return membershipMapper.isMembershipActive(communityVO);
	}
}
