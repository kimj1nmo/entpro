package kr.or.ddit.vo;

import lombok.Data;

@Data
public class VodCommentVO {
	private int vodIdx;
	private int vodParentIdx;
	private int vodNo;
	private String memId;
	private String vodCn;
}
