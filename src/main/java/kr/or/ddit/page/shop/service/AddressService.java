package kr.or.ddit.page.shop.service;

import java.util.List;
import kr.or.ddit.vo.AddressVO;

/**
 * ✅ Address 관련 서비스 인터페이스
 */
public interface AddressService {
    
    /**
     * 특정 회원의 주소 목록 조회
     * @param memId 회원 ID
     * @return 해당 회원의 주소 리스트
     */
    List<AddressVO> getAddressesByMemId(String memId);
}
