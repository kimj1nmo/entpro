package kr.or.ddit.translation.dto;

import lombok.Data;

@Data
public class TranslationRequestDto {
    private String text;
    private String sourceLang; // 자동 감지 시 빈 문자열 전달
    private String targetLang;
    private String format; // "text" 또는 "html"
    private String model; // 사용할 번역 모델
}