package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ComRegVO {
	private int    commRegNo;   // 커뮤니티 가입번호
	private int    groupNo;		// 그룹 번호	
	private Date   commRegJoin; // 가입일
	private String commRegNick; // 닉네임
	private String memId;		// 회원 아이디
	private Long    fileGroupNo; // 프로필 사진 파일 그룹 번호
	
	//게시글 : 파일그룹 = 1 : 1
	private FileGroupVO fileGroupVO;
		
	//이미지 파일들
	private MultipartFile[] uploadFiles;
	
	public int getCommRegNo() {
		return commRegNo;
	}
	public void setCommRegNo(int commRegNo) {
		this.commRegNo = commRegNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public Date getCommRegJoin() {
		return commRegJoin;
	}
	public void setCommRegJoin(Date commRegJoin) {
		this.commRegJoin = commRegJoin;
	}
	public String getCommRegNick() {
		return commRegNick;
	}
	public void setCommRegNick(String commRegNick) {
		this.commRegNick = commRegNick;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public long getFileGroupNo() {
		return fileGroupNo;
	}
	public void setFileGroupNo(long fileGroupNo) {
		this.fileGroupNo = fileGroupNo;
	}
	
	// toString() 메서드 오버라이드
    @Override
    public String toString() {
        return "ComRegVO{" +
                "commRegNo=" + commRegNo +
                ", groupNo=" + groupNo +
                ", commRegJoin=" + commRegJoin +
                ", commRegNick='" + commRegNick + '\'' +
                ", memId='" + memId + '\'' +
                ", fileGroupNo=" + fileGroupNo +
                '}';
    }
}
