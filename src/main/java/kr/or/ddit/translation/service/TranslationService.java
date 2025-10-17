package kr.or.ddit.translation.service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.translate.Translate;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.io.InputStream;

@Slf4j
@Service
public class TranslationService {

    private Translate translate;

    @Value("${google.cloud.credentials.file}")
    private String credentialsFilePath;

    @PostConstruct
    public void init() {
        try (InputStream credentialsStream = new ClassPathResource(credentialsFilePath).getInputStream()) {
            GoogleCredentials credentials = ServiceAccountCredentials.fromStream(credentialsStream);
            translate = TranslateOptions.newBuilder()
                .setCredentials(credentials)
                .build()
                .getService();
        } catch (IOException e) {
            log.error("Google Cloud Translation API 초기화 중 오류 발생. 인증 파일 경로: {}", credentialsFilePath, e);
            throw new RuntimeException("Failed to initialize Google Cloud Translation service", e);
        }
    }

    						// 		Bonjour.   ""			"ko"
    public Translation translateText(String text, String sourceLang, String targetLang) {
        try {
            Translation translation = translate.translate(
                text,
                Translate.TranslateOption.sourceLanguage(sourceLang),
                Translate.TranslateOption.targetLanguage(targetLang)
            );

            // 로그로 응답을 출력
            log.info("translateText->translation : " + translation);
            log.info("번역된 텍스트: {}", translation.getTranslatedText());
            log.info("번역대상 언어유형: {}", translation.getSourceLanguage());

            return translation;
        } catch (Exception e) {
            log.error("번역 중 오류 발생", e);
            throw new RuntimeException("번역 처리 중 오류 발생", e); // 예외를 던져서 상위 호출자가 처리하게 함
        }
    }
}
