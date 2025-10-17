//package kr.or.ddit.translation.util;
//
//import com.google.gson.JsonObject;
//import com.google.gson.JsonParser;
//import okhttp3.*;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Value;
//import com.google.cloud.translate.TranslateOptions;
//import com.google.cloud.translate.Translation;
//
//import java.io.IOException;
//
//@Component
//public class TranslationApiClient {
//
//    private static final Logger logger = LoggerFactory.getLogger(TranslationApiClient.class);
//
//    // application.properties에서 설정값 읽어오기
//    @Value("${api.translation.url}")
//    private String apiUrl;
//
//    @Value("${api.translation.key}")
//    private String apiKey;
//
//    // 번역 요청 보내는 메서드
//    public String sendRequest(String text, String sourceLang, String targetLang) {
//        // HTTP 요청 설정
//        OkHttpClient client = new OkHttpClient();
//        RequestBody body = new FormBody.Builder()
//            .add("text", text)
//            .add("source", sourceLang)
//            .add("target", targetLang)
//            .build();
//
//        String fullUrl = apiUrl;
//        Request request = new Request.Builder()
//            .url(fullUrl)
//            .addHeader("Authorization", "Bearer " + apiKey)
//            .post(body)
//            .build();
//
//        // 로그 추가: 요청 URL 및 본문
//        logger.info("Request URL: {}", fullUrl);
//        logger.info("Request Body: text={}, source={}, target={}", text, sourceLang, targetLang);
//
//        try (Response response = client.newCall(request).execute()) {
//            if (!response.isSuccessful()) {
//                logger.error("API Error: HTTP {}", response.code());
//                throw new RuntimeException("Translation API Error: " + response.message());
//            }
//
//            String responseBody = response.body().string();
//
//            // 로그 추가: 응답 데이터
//            logger.info("Response: {}", responseBody);
//
//            return parseResponse(responseBody);
//        } catch (IOException e) {
//            logger.error("API Request Failed: {}", e.getMessage(), e);
//            throw new RuntimeException("Translation API Request Failed", e);
//        }
//    }
//
//    // 응답 데이터 파싱
//    private String parseResponse(String responseBody) {
//        JsonObject jsonObject = JsonParser.parseString(responseBody).getAsJsonObject();
//
//        // 로그 추가: 파싱 결과
//        logger.info("Parsed Response: {}", jsonObject);
//
//        return jsonObject.get("translatedText").getAsString(); // 번역된 텍스트 반환
//    }
//}
