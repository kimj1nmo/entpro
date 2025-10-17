package kr.or.ddit.translation.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class TranslationResponseDto {
    private String translatedText;
    private String detectedSourceLanguage; // 자동 감지된 소스 언어
    private String model; // 사용된 번역 모델
}
