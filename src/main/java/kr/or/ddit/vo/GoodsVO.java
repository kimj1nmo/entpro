package kr.or.ddit.vo;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.web.multipart.MultipartFile;
import lombok.Data;

@Data
public class GoodsVO {
    private int gdsNo;
    private Integer ctgryNo;
    private String gdsNm;
    private int gdsPrice;
    private long fileGroupNo;
    private String gdsDc;
    private String memId;
    private Date gdsDate;
    private int groupNo;
    private String groupName;
    private String gdsCtgryNm;
    private int gdsStatus;

    private String categoryName;

    private int totalSales;     // ✅ 매출 데이터 추가

 // ✅ GroupsVO 추가
    private GroupsVO groups;

    // ✅ GdsCtgryVO 추가
    private GdsCtgryVO gdsCtgry;

    // FILE_GROUP (파일 그룹 정보)
    private FileGroupVO fileGroupVO;

    // 📌 기존 fileDetails -> fileDetailVOList로 이름 변경
    private List<FileDetailVO> fileDetailVOList;

    // 이미지 파일 업로드 (Multipart 지원)
    private MultipartFile[] uploadFiles;
 // ✅ 마지막 `}`가 올바르게 위치함
    public List<String> getAllImageUrls() {
        if (fileDetailVOList != null && !fileDetailVOList.isEmpty()) {
            return fileDetailVOList.stream()
                    .map(file -> "/uploads/" + file.getFileSaveName())
                    .collect(Collectors.toList());
        }
        return Collections.singletonList("/images/no-image.jpg"); // 기본 이미지
    }

    //관리자 재고 확인용
    private int remain;
    private int WrhousngSum;
    private int OrderSum;
}
