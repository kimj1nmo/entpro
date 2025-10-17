package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AddressVO {
	private int addNo;
	private int sn;

	private String memId;
	private String addName;
	private String addZip;
	private String add1;
	private String add2;
	private String addTel;
	private Date addDate;
}
