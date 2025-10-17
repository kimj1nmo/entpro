//package kr.or.ddit.page.companypage.managecalendar;
//
//import com.google.api.client.json.JsonFactory;
//import com.google.api.client.json.jackson2.JacksonFactory;
//import com.google.api.services.calendar.Calendar;
//import com.google.auth.http.HttpCredentialsAdapter;
//import com.google.auth.oauth2.GoogleCredentials;
//import org.springframework.stereotype.Component;
//
//import javax.annotation.PostConstruct;
//import java.io.IOException;
//import java.io.InputStream;
//
//@Component
//public class GoogleCalendarClient {
//
//    private Calendar calendarService;
//
//    private static final String CREDENTIALS_FILE_PATH = "/google-credentials/sustained-works-405008-fbd19172e432.json"; // 파일 경로를 명시적으로 지정
//
//    @PostConstruct
//    public void checkCredentialsPath() {
//        System.out.println("Credentials File Path: " + CREDENTIALS_FILE_PATH);
//    }
//
//    public GoogleCalendarClient() throws IOException {
//        // 파일 경로가 null 또는 비어 있으면 예외 처리
//        if (CREDENTIALS_FILE_PATH == null || CREDENTIALS_FILE_PATH.isEmpty()) {
////            throw new IllegalArgumentException("Credentials path must not be null or empty.");
//        }
//
//        // JacksonFactory 인스턴스를 사용
//        JsonFactory jsonFactory = new JacksonFactory();
//
//        // 경로에서 "classpath:"를 제거하여 실제 경로를 사용
//        String filePath = CREDENTIALS_FILE_PATH.replace("classpath:", "");
//
//        // InputStream으로 인증 파일을 로드
//        InputStream credentialsStream = getClass().getResourceAsStream(filePath);
//        if (credentialsStream == null) {
//            throw new IOException("Credential file not found at path: " + filePath);
//        }
//
//        // Google 인증을 위한 파일 스트림 생성
//        GoogleCredentials credentials = GoogleCredentials
//                .fromStream(credentialsStream)
//                .createScoped("https://www.googleapis.com/auth/calendar");
//
//        // Google Calendar 서비스 객체 초기화
//        this.calendarService = new Calendar.Builder(
//                new com.google.api.client.http.javanet.NetHttpTransport(),
//                jsonFactory,
//                new HttpCredentialsAdapter(credentials)
//        ).setApplicationName("Manage Calendar").build();
//    }
//
//    public Calendar getCalendarService() {
//        return calendarService;
//    }
//}
