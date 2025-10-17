package kr.or.ddit.page.shop.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.ddit.page.shop.mapper.AddressMapper;
import kr.or.ddit.page.shop.service.AddressService;
import kr.or.ddit.vo.AddressVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
    private AddressMapper addressMapper;

    /**
     * 특정 회원의 주소 목록 조회
     * @param memId 회원 ID
     * @return 해당 회원의 주소 리스트
     */
    @Override
    public List<AddressVO> getAddressesByMemId(String memId) {
        log.info("🔎 회원 {}의 주소 목록 조회", memId);
        return addressMapper.selectAddressesByMemId(memId);
    }
}
