package kr.or.ddit.page.comm.membership;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.CommunityVO;
import kr.or.ddit.vo.MembershipVO;

@Mapper
public interface MembershipMapper {
	 // COMM_REG_NO 가져오기
    int getCommRegNo(MembershipVO membershipVO);

    // MEMSHIP_NO 및 MEMSHIP_PAY_AMOUNT 가져오기
    MembershipVO getMembershipDetails(int groupNo);

    // MEMSHIP_DATA INSERT
    int insertMembershipData(MembershipVO membershipVO);

    // VIRTUAL_CRRNCY UPDATE
    int insertVirtualCurrency(MembershipVO membershipVO);

    // 잔액 확인
    int checkVirtualCurrencyBalance(String memId);

    boolean isMembershipActive(CommunityVO communityVO);

}
