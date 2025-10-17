package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MembershipVO {
	// 멤버십 테이블 MEMSHIP
	private int memshipNo; // 멤버십 식별 번호
	private int groupNo; // 그룹 번호
	private String memshipNm; // 멤버십 이름
	private int memshipAmount; // 가격
	private int countMembership; // 멤버십 가입자 수

	// 멤버십 가입 테이블 MEMSIP_DATA
	private int memshipDataNo; // 멤버십 가입 번호
	private int commRegNo; // 커뮤니티 가입 번호
	private Date memshipStartDate; // 멤버십 가입 일자
	private Date memshipEndDate; // 멤버십 종료 일자
	private int memshipYn; // 멤버십 갱신 여부
	private int memshipPayAmount; // 멤버십 결제 금액

	private String groupName; // 그룹 이름 추가
	private String memId; // 그룹 이름 추가
	private String memName; // 그룹 이름 추가
	
	private int vrtualCrrncyNo; 	//가상화폐 일련번호
//	private String memId;			//회원 아이디
	private int vrtualCrrncyUse;	// 구매한 가상화폐
	private Date vrtualCrrncyGhge;  // 변경 일시

}
