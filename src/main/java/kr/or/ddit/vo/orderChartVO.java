package kr.or.ddit.vo;

import lombok.Data;

@Data
public class orderChartVO {
    //차트 정보 기입용
    private int orderYear;
    private int orderMonth;
    private int gdsNo;
    private String gdsNm;
	    private int totalOrderQuantity;
	    private  int SalesChangeRate;
	    private  int SalesDifference;
	    private  int LastMonthSales;
	    private  int CurrentMonthSales;

}
