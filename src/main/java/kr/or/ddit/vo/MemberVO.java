package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVO {
   private String memId;
   private int departNo;
   private String memPw;
   private String memEnable;
   private String memName;
   private int memGender;
   private String memRegDate;
   private String memEmail;
   private int fileGroupNo;
   private String memTel;
   @DateTimeFormat(pattern = "yyyy-MM-dd")
   private Date memBir2;
   private int posNo;
   // 직급명 추가
   private String posName;
   private int addNo;
   private String memBir;
   // 부서이름
   private String departName;


   private int rnum;//행번호


   //MEMBER : FILE_GROUP = 1 : 1
   private FileGroupVO fileGroupVO;

   //이미지 파일들
   private MultipartFile[] uploadFiles;

   private List<AuthVO> authList;

   // 프로젝트 직원 리스트
   private List<ProjectEmpVO> projectEmpVOList;

   private DepartmentVO departmentVO;
}
