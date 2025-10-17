package kr.or.ddit.vo;

import lombok.Data;

@Data
public class SoundInfoVO {
	private int soundInfoNo;
	private int albumNo;
	private String soundInfoTtl;
	private String soundInfoPlaytime;
	private String soundSourceLyrics;
	private String soundSourceComposer;
}
