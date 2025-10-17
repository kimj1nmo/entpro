package kr.or.ddit.translation.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TranslationResponseVO {
    private String translatedText;
    private String sourceLang;
    private String targetLang;
}
