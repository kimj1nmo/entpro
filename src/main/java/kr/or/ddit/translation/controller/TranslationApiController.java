package kr.or.ddit.translation.controller;

import kr.or.ddit.translation.service.TranslationService;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.cloud.translate.Translation;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/translation")
public class TranslationApiController {

    @Autowired
    private TranslationService translationService;

    // 번역 API (REST 방식)
    @PostMapping("/api") 
    public ResponseEntity<Map<String, String>> translateApi(@RequestBody Map<String, String> requestData) {
        String text = requestData.get("text");
        String sourceLang = requestData.get("sourceLang");
        String targetLang = requestData.get("targetLang");
        
        log.info("translateApi->text : " + text);
        log.info("translateApi->sourceLang : " + sourceLang);
        log.info("translateApi->targetLang : " + targetLang);
        													//Bonjour.   ""			"ko"
        Translation translation = translationService.translateText(text, sourceLang, targetLang);
        
        String translatedText = translation.getTranslatedText();
        String sourceLanguage = codeToLan(translation.getSourceLanguage());
        log.info("translateApi->translatedText : " + translatedText);
        log.info("translateApi->sourceLanguage : " + sourceLanguage);
        
        Map<String, String> response = new HashMap<>();
        response.put("translatedText", translatedText);
        response.put("sourceLang", sourceLanguage);

        return ResponseEntity.ok(response);
    }
    
    public String codeToLan(String code) {
    	Map<String,String> lanMap = new HashMap<String,String>();
    	lanMap.put("af","아프리칸스어");
    	lanMap.put("sq","알바니아어");
    	lanMap.put("am","암하라어");
    	lanMap.put("ar","아랍어");
    	lanMap.put("hy","아르메니아어");
    	lanMap.put("az","아제르바이잔어");
    	lanMap.put("eu","바스크어");
    	lanMap.put("be","벨라루스어");
    	lanMap.put("bn","벵골어");
    	lanMap.put("bs","보스니아어");
    	lanMap.put("bg","불가리아어");
    	lanMap.put("ca","카탈루냐어");
    	lanMap.put("ceb","세부아노어");
    	lanMap.put("zh-CN","중국어(간체)");
    	lanMap.put("zh-TW","중국어(번체)");
    	lanMap.put("co","코르시카어");
    	lanMap.put("hr","크로아티아어");
    	lanMap.put("cs","체코어");
    	lanMap.put("da","덴마크어");
    	lanMap.put("nl","네덜란드어");
    	lanMap.put("en","영어");
    	lanMap.put("eo","에스페란토");
    	lanMap.put("et","에스토니아어");
    	lanMap.put("fi","핀란드어");
    	lanMap.put("fr","프랑스어");
    	lanMap.put("fy","프리지아어");
    	lanMap.put("gl","갈리시아어");
    	lanMap.put("ka","조지아어");
    	lanMap.put("de","독일어");
    	lanMap.put("el","그리스어");
    	lanMap.put("gu","구자라트어");
    	lanMap.put("ht","아이티 크리올어");
    	lanMap.put("ha","하우사어");
    	lanMap.put("haw","하와이어");
    	lanMap.put("he","히브리어");
    	lanMap.put("hi","힌디어");
    	lanMap.put("hmn","몽어");
    	lanMap.put("hu","헝가리어");
    	lanMap.put("is","아이슬란드어");
    	lanMap.put("ig","이그보어");
    	lanMap.put("id","인도네시아어");
    	lanMap.put("ga","아일랜드");
    	lanMap.put("it","이탈리아어");
    	lanMap.put("ja","일본어");
    	lanMap.put("jv","자바어");
    	lanMap.put("kn","칸나다어");
    	lanMap.put("kk","카자흐어");
    	lanMap.put("km","크메르어");
    	lanMap.put("rw","키냐르완다어");
    	lanMap.put("ko","한국어");
    	lanMap.put("ku","쿠르드어");
    	lanMap.put("ky","키르기스어");
    	lanMap.put("lo","라오어");
    	lanMap.put("la","라틴어");
    	lanMap.put("lv","라트비아어");
    	lanMap.put("lt","리투아니아어");
    	lanMap.put("lb","룩셈부르크어");
    	lanMap.put("mk","마케도니아어");
    	lanMap.put("mg","마다가스카르어");
    	lanMap.put("ms","말레이어");
    	lanMap.put("ml","말라얄람어");
    	lanMap.put("mt","몰타어");
    	lanMap.put("mi","마오리어");
    	lanMap.put("mr","마라타어");
    	lanMap.put("mn","몽골어");
    	lanMap.put("my","미얀마어(버마어)");
    	lanMap.put("ne","네팔어");
    	lanMap.put("no","노르웨이어");
    	lanMap.put("ny","니안자어(치츄어)");
    	lanMap.put("or","오리야어");
    	lanMap.put("ps","파슈토어");
    	lanMap.put("fa","페르시아어");
    	lanMap.put("pl","폴란드어");
    	lanMap.put("pt","포르투갈어(포르투갈, 브라질)");
    	lanMap.put("pa","펀자브어");
    	lanMap.put("ro","루마니아어");
    	lanMap.put("ru","러시아어");
    	lanMap.put("sm","사모아어");
    	lanMap.put("gd","스코틀랜드 게일어");
    	lanMap.put("sr","세르비아어");
    	lanMap.put("st","세소토어");
    	lanMap.put("sn","쇼나어");
    	lanMap.put("sd","신디어");
    	lanMap.put("si","스리랑카어(싱할라어)");
    	lanMap.put("sk","슬로바키아어");
    	lanMap.put("sl","슬로베니아어");
    	lanMap.put("so","소말리어");
    	lanMap.put("es","스페인어");
    	lanMap.put("su","순다어");
    	lanMap.put("sw","스와힐리어");
    	lanMap.put("sv","스웨덴어");
    	lanMap.put("tl","타갈로그어(필리핀어)");
    	lanMap.put("tg","타지크어");
    	lanMap.put("ta","타밀어");
    	lanMap.put("tt","타타르어");
    	lanMap.put("te","텔루구어");
    	lanMap.put("th","태국어");
    	lanMap.put("tr","터키어");
    	lanMap.put("tk","투르크멘어");
    	lanMap.put("uk","우크라이나어");
    	lanMap.put("ur","우르두어");
    	lanMap.put("ug","위구르어");
    	lanMap.put("uz","우즈베크");
    	lanMap.put("vi","베트남어");
    	lanMap.put("cy","웨일즈어");
    	lanMap.put("xh","코사어");
    	lanMap.put("yi","이디시어");
    	lanMap.put("yo","요루바어");
    	lanMap.put("zu","줄루어");

    	return lanMap.get(code);
    }
}

