//package kr.or.ddit.translation.service.impl;
//
//import kr.or.ddit.translation.service.TranslationService;
//import kr.or.ddit.translation.util.TranslationApiClient;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//@Service
//public class TranslationServiceImpl implements TranslationService {
//
//    @Autowired
//    private TranslationApiClient translationApiClient;
//
//    // TranslationService 인터페이스에서 정의한 translate 메서드 구현
//    @Override
//    public String translate(String text, String sourceLang, String targetLang) {
//        return translationApiClient.sendRequest(text, sourceLang, targetLang); // TranslationApiClient 호출
//    }
//}
