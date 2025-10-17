package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SurveyVO {
	
	// 설문조사 
	private int srvyNo;
	private String srvyTtl;
	private String srvyCn;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date srvyRegDate;
	private String memId;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date srvyBgngData;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date srvyEndDate;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date srvyLastEndDate;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date srvyUpdtDate;
	private int srvyStatus;
	
	// 설문 질문 리스트 (1:N 관계)
    private List<SurveyQuestionVO> surveyQuestionVOList;

//    // Getter/Setter
//    public List<SurveyQuestionVO> getSurveyQuestionVOList() {
//        return surveyQuestionVOList;
//    }
//
//    public void setSurveyQuestionVOList(List<SurveyQuestionVO> surveyQuestionVOList) {
//        this.surveyQuestionVOList = surveyQuestionVOList;
//    }
    
    
  //상품분류테이블 : 상품테이블 = 1(부모.P.K) : N(자식.F.K)
  	//컬렉션 : List(LinkedList, Stack,Vector, ArrayList), Set(HashSet, SortedSet)
  	//Map   : Hashtable, HashMap, SortedMap
//    private List<SurveyArticleVO> surveyArticleVOList;
}
