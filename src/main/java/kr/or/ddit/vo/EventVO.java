package kr.or.ddit.vo;


import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EventVO {
    private int evtBoardNo;
    private String evtBoardCtgry;
    private String evtBoardTtl;
    private String evtBoardCn;
    private String evtBoardDate;

    private long fileGroupNo;
    private MultipartFile[] uploadFile;

    private FileGroupVO fileGroupVO;

    // 기존에 Lombok @Data가 이미 getter, setter를 자동으로 생성하지만,
    // 직접 생성할 수도 있습니다.

    
}


