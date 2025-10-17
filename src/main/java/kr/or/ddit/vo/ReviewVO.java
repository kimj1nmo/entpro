package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ReviewVO {
    private int reNo; // 리뷰 번호
    private int gdsNo; // 상품 번호
    private String memId; // 작성자 ID
    private Date reWritingDate; // 리뷰 작성일
    private Date reUpdateDate; // 리뷰 수정일
    private int reStatus; // 리뷰 상태 (0: 삭제됨, 1: 활성)
    private String reContent; // 리뷰 내용
    private Long fileGroupNo; // 파일 그룹 번호 (파일 업로드가 있을 경우 저장)

    private FileGroupVO fileGroupVO;
    // 파일 리스트 (업로드된 이미지 리스트)
    private List<FileDetailVO> fileDetailVOList;
}
