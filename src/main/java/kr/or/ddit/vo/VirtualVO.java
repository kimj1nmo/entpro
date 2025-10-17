package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class VirtualVO {
	private int vrtualCrrncyNo; 	//가상화폐 일련번호
	private String memId;			//회원 아이디
	private int vrtualCrrncyUse;	// 구매한 가상화폐
	private Date vrtualCrrncyGhge;  // 변경 일시
	int memshipDataNo;
}
