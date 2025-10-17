package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ApprAttrVO {
	private int atrzAttrNo;
	private int atrzDocNo;
	private String atrzAttrName;
	private String atrzAttrType;
	private String atrzAttrValue;
	private int atrzAttrOrder;
}
/*
<result property="atrzAttrNo" column="ATRZ_ATTR_NO"/>
<result property="atrzDocNo" column="ATRZ_DOC_NO"/>
<result property="atrzAttrName" column="ATRZ_ATTR_NAME"/>
<result property="atrzAttrType" column="ATRZ_ATTR_TYPE"/>
<result property="atrzAttrValue" column="ATRZ_ATTR_VALUE"/>
<result property="atrzAttrOrder" column="ATRZ_ATTR_ORDER"/>
*/
