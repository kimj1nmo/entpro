package kr.or.ddit.translation.controller;

import kr.or.ddit.translation.service.TranslationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.cloud.translate.Translation;

@Controller
@RequestMapping("/translation")
@RequiredArgsConstructor
public class TranslationController {

    private final TranslationService translationService;

    // 번역 테스트 페이지를 열어주는 메서드 (JSP 방식)
    @GetMapping("/translateTest")
    public String translateTestPage() {
        return "translation/translateTest"; // /WEB-INF/view/translation/translateTest.jsp로 매핑
    }

    // 번역을 처리하는 메서드 (POST 요청 - JSP 방식)
    @PostMapping("/translateTest")
    public String translateText(@RequestParam String text, 
                                @RequestParam String sourceLang, 
                                @RequestParam String targetLang, 
                                Model model) {
        // 서비스에서 번역 수행
    	Translation translation = translationService.translateText(text, sourceLang, targetLang);
        
    	//번역된 텍스트
         String translatedText = translation.getTranslatedText();
        //번역대상 언어유형
         String sourceLanguage = translation.getSourceLanguage();//fr
         
        // 번역된 텍스트를 모델에 추가하여 JSP로 전달
        model.addAttribute("originalText", text);
        model.addAttribute("translatedText", translatedText);
        model.addAttribute("sourceLanguage", sourceLanguage);
        model.addAttribute("sourceLang", sourceLang);
        model.addAttribute("targetLang", targetLang);

        return "translation/translateTest"; // 번역 결과를 보여줄 JSP 페이지로 다시 포워드
    }

    // 댓글 번역을 처리하는 비동기 API (JSON 응답)
    @PostMapping("/api/translateComment")
    @ResponseBody
    public String translateComment(@RequestParam String text, 
                                   @RequestParam String sourceLang, 
                                   @RequestParam String targetLang) {
        // 번역 서비스 호출
        Translation translation = translationService.translateText(text, sourceLang, targetLang);
        
        String translatedText = translation.getTranslatedText();
        
        // 번역된 텍스트를 JSON 형식으로 반환
        return "{\"translatedText\": \"" + translatedText + "\"}";
    }
}
