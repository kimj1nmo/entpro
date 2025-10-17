package kr.or.ddit.page.shop.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import kr.or.ddit.vo.AddressVO;

@Mapper
public interface AddressMapper {
    // ✅ 특정 회원의 주소 조회 (MEM_ID 기준)
    List<AddressVO> selectAddressesByMemId(@Param("memId") String memId);
}
