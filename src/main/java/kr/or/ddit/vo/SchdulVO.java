package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SchdulVO {
    // 그룹 관련 필드
    private int groupNo;  // 그룹 번호
    private String groupName;  // 그룹 이름

    @DateTimeFormat(pattern = "yyyy-MM-dd") // 변환
    private Date groupBirth;  // 그룹 결성일
    
    @DateTimeFormat(pattern = "yyyy-MM-dd") // 변환
    private Date groupDspgn;  // 그룹 해체일
    
    private String groupIntrcn;  // 그룹 소개
    private long fileGroupNo;  // 파일 그룹 번호
    private String fileSaveLocate;  // 사진 웹경로
    private String groupBirthInputter;  // 결성일 입력자
    private String groupDspgnInputter;  // 해체일 입력자

    // MEMEBER : FILE_GROUP = 1:1
    private FileGroupVO fileGroupVO;  // 파일 그룹 정보

    // 이미지 파일들
    private MultipartFile[] uploadFiles;  // 업로드된 이미지 파일들

    // 아티스트 목록
    private List<ArtistVO> artistList;  // 아티스트 목록

    // 마이창 정보 확인용 data
    private int commRegNo;  // 커뮤니티 등록 번호
    private Date commRegJoin;  // 커뮤니티 등록일
    private String commRegNick;  // 커뮤니티 닉네임

    // SCHDUL_TYPE 테이블의 필드들 (일정 유형)
    private int schdulTypeNo;  // 일정 유형 번호
    private String schdulTypeName;  // 일정 유형 이름
    private String schdulTypeBakcol;  // 일정 유형 배경 색
    private String schdulTypeTxtcol;  // 일정 유형 텍스트 색

    // SCHDUL 테이블의 필드들 (일정 내용)
    private int schdulNo;  // 일정 번호
    private int artistNo;  // 아티스트 번호
    private String schdulTtl;  // 일정 제목
    private String schdulContent;  // 일정 제목
    
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") // 변환
    private Date schdulStartDate;  // 일정 시작 일시
    
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") // 변환
    private Date schdulEndDate;  // 일정 종료 일시
    
    private String schdulAllDayYn;  // All Day 여부 (Y/N)
    private String memId;  // 일정 등록자 ID

    // 추가된 그룹 정보 필드 예시 (단, 이미 `groupNo`가 존재하면 중복 제거 가능)
    private int groupNoFromSchdul;  // 그룹 번호 (일정 관련 그룹 번호)
}
