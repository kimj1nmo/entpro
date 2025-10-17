//package kr.or.ddit.config;
//import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
//import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
//import com.google.api.client.auth.oauth2.Credential;
//import com.google.api.services.calendar.Calendar;
//import com.google.api.services.calendar.CalendarScopes;
//import com.google.api.client.json.JsonFactory;
//import com.google.api.client.json.jackson2.JacksonFactory;
//import com.google.api.client.http.HttpTransport;
//import com.google.api.client.http.javanet.NetHttpTransport;
//import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
//import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//import java.io.FileReader;
//import java.io.IOException;
//import java.util.Collections;
//
//@Configuration
//public class GoogleOAuthConfig {
//
//    private final String CREDENTIALS_FILE_PATH = "src/main/resources/google-credentials/client_secret_194925094605-i4o507mkiqbqdmee9uavgasmrtjhagmg.apps.googleusercontent.com.json";
//    private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
//    private static final JsonFactory JSON_FACTORY = new JacksonFactory();
//
//    @Bean
//    public GoogleAuthorizationCodeFlow googleAuthorizationCodeFlow() throws IOException {
//        GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(
//            JSON_FACTORY, new FileReader(CREDENTIALS_FILE_PATH));
//
//        return new GoogleAuthorizationCodeFlow.Builder(
//                HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, Collections.singleton(CalendarScopes.CALENDAR))
//                .setAccessType("offline")
//                .build();
//    }
//
//    @Bean
//    public Calendar googleCalendar() throws IOException {
//        // LocalServerReceiver의 포트를 80으로 설정
//        LocalServerReceiver receiver = new LocalServerReceiver.Builder()
//                .setPort(80)  // 포트를 80으로 설정
//                .setCallbackPath("/oauth2/callback")  // 리디렉션 URI 경로 맞추기
//                .build();
//
//        Credential credential = new AuthorizationCodeInstalledApp(
//                googleAuthorizationCodeFlow(), receiver).authorize("user");
//
//        return new Calendar.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential)
//                .setApplicationName("Google Calendar API Integration")
//                .build();
//    }
//}
//
