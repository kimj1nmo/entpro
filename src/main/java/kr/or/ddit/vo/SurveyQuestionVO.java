package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class SurveyQuestionVO {
	
    private int srvyQstnNo;
    private int srvyNo;
    private String srvyQstn;
    private String srvyQstnCn;
    private int srvyQstnOrder;
    private int srvyQstnRequired;
    


    // 설문 항목 리스트 (1:N 관계)
    private List<SurveyArticleVO> surveyArticleVOList;

//    // Getter/Setter
//    public List<SurveyArticleVO> getSurveyArticleVOList() {
//        return surveyArticleVOList;
//    }
//
//    public void setSurveyArticleVOList(List<SurveyArticleVO> surveyArticleVOList) {
//        this.surveyArticleVOList = surveyArticleVOList;
//    }

}
