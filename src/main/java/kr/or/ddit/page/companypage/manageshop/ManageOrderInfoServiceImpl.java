package kr.or.ddit.page.companypage.manageshop;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.ddit.vo.OrderInfoVO;

@Service
public class ManageOrderInfoServiceImpl implements ManageOrderInfoService {

    @Autowired
    private ManageOrderInfoMapper manageOrderInfoMapper;

    @Override
    public OrderInfoVO getOrderWithDetails(int orderNo) {
        // 특정 주문 번호에 해당하는 주문 정보와 주문 리스트 조회
        return manageOrderInfoMapper.selectOrderWithDetails(orderNo);
    }

    @Override
    public List<OrderInfoVO> getAllOrders() {
        // 전체 주문 정보를 조회하는 메서드 구현
        return manageOrderInfoMapper.selectAllOrders();
    }

    @Override
    public int updateOrderChangeNo(int orderNo, int orderChangeNo) {
        // ✅ 올바른 Mapper 메서드 호출
        return manageOrderInfoMapper.updateOrderChangeNo(orderNo, orderChangeNo);
    }
}
