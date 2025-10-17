package kr.or.ddit.page.survey;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletResponse;
import kr.or.ddit.security.CustomUser;
import kr.or.ddit.vo.SurveyResponseVO;
import kr.or.ddit.vo.SurveyVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/companypage")
@Slf4j
@Controller
public class SurveyController {

	

	@Autowired
	SurveyService surveyService;
	
	
	
	@GetMapping("/SurveyCreate")
	public String SurveyCreate() {
		log.info("SurveyCreate 페이지");
		
		return "companypage/SurveyCreate";
	}
	/*
	@GetMapping("/SurveyResult")
	public String SurveyResult() {
		log.info("SurveyResult 페이지");
		
		return "companypage/SurveyResult";
	}
	*/
	
	// 설문 재시작
	@PostMapping("/startSurvey")
	@ResponseBody
	public ResponseEntity<String> startSurvey(@RequestParam int srvyNo, @RequestParam int status) {
	    surveyService.updateSurveyStatus(srvyNo, status);
	    return ResponseEntity.ok("설문 상태가 업데이트되었습니다.");
	}
	//설문 중지
	@PostMapping("/stopSurvey")
	@ResponseBody
	public ResponseEntity<String> stopSurvey(@RequestParam int srvyNo, @RequestParam int status) {
		surveyService.updateSurveyStatus(srvyNo, status);
		return ResponseEntity.ok("설문 상태가 업데이트되었습니다.");
	}
	//설문 종료
	@PostMapping("/endSurvey")
	@ResponseBody
	public ResponseEntity<String> endSurvey(@RequestParam int srvyNo, @RequestParam int status) {
		surveyService.updateSurveyStatus(srvyNo, status);
		return ResponseEntity.ok("설문 상태가 업데이트되었습니다.");
	}

	@GetMapping("/SurveyResult")
	public String getSurveyResponse(@RequestParam("srvyNo") int srvyNo, Model model) {
		log.info("SurveyResult 페이지");
		log.info("SurveyResult 페이지 - 설문 번호: {}", srvyNo);
		
		// 서비스 호출
		SurveyVO surveyDetail = surveyService.getSurveyDetail(srvyNo);
		if (surveyDetail == null) {
			log.error("SurveyDetail이 null입니다. srvyNo: {}", srvyNo);
			throw new IllegalArgumentException("유효하지 않은 설문 번호입니다.");
		}
		
		// 날짜 포맷 변환
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String srvyBgngData = sdf.format(surveyDetail.getSrvyBgngData());
		String srvyEndDate = sdf.format(surveyDetail.getSrvyEndDate());
		
		 // 현재 시간을 Long 값으로 전달
	    model.addAttribute("currentDate", new Date().getTime());
		model.addAttribute("surveyDetail", surveyDetail);
		model.addAttribute("srvyBgngData", srvyBgngData);
		model.addAttribute("srvyEndDate", srvyEndDate);
		log.info("surveyDetail 데이터: {}", surveyDetail);
		
		
		return "companypage/SurveyResult";
	}
	
//	@GetMapping("/Survey")
//	public String getSurveyList() {
//		log.info("SurveyForm 페이지");
//		
//		return "companypage/SurveyList";
//	}
	
	@GetMapping("/SurveyList")
	public String list(Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<SurveyVO> surveyVOList = this.surveyService.getSurveyList(map);
		
		 // 현재 날짜 추가
//	    model.addAttribute("currentDate", new Date());
		 // 현재 시간을 Long 값으로 전달
	    model.addAttribute("currentDate", new Date().getTime());
	    
		model.addAttribute("surveyVOList",surveyVOList);
		return "companypage/SurveyList";
	}
	
	@PostMapping("/createSurvey")
	@ResponseBody
	public Map<String, Object> createSurvey(@RequestBody SurveyVO surveyVO, @AuthenticationPrincipal CustomUser user) {
	    Map<String, Object> response = new HashMap<>();
	    
	    log.info("Received SurveyVO: {}", surveyVO); // 매핑된 데이터 확인

	    if (user == null || user.getMember() == null) {
	        response.put("result", 0);
	        response.put("message", "로그인이 필요합니다.");
	        return response;
	    }

	    String memId = user.getMember().getMemId();
	    surveyVO.setMemId(memId);

	    log.debug("SurveyVO: {}", surveyVO);
	    log.debug("Questions: {}", surveyVO.getSurveyQuestionVOList());

	    
	    try {
	        surveyService.createSurvey(surveyVO);
	        response.put("status", "success");
	        response.put("srvyNo", surveyVO.getSrvyNo()); // 생성된 srvyNo 반환
	    } catch (Exception e) {
	        log.error("설문 등록 중 오류 발생: ", e);
	        response.put("status", "error");
	        response.put("message", "설문 생성 중 오류 발생");
	    }

	    log.debug("SurveyVO: {}", surveyVO);
	    log.debug("Questions: {}", surveyVO.getSurveyQuestionVOList());

	    
	    return response;
	}


	
	  // 설문 상세 조회
    @GetMapping("/SurveyDetail")
    public String getSurveyDetail(@RequestParam("srvyNo") int srvyNo, Model model) {
        log.info("SurveyDetail 페이지 - 설문 번호: {}", srvyNo);

        // 설문 상세 정보 조회
        SurveyVO surveyDetail = surveyService.getSurveyDetail(srvyNo);
        
        // 날짜 포맷 변환
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String srvyBgngData = sdf.format(surveyDetail.getSrvyBgngData());
        String srvyEndDate = sdf.format(surveyDetail.getSrvyEndDate());
        
        model.addAttribute("surveyDetail", surveyDetail);
        model.addAttribute("srvyBgngData", srvyBgngData);
        model.addAttribute("srvyEndDate", srvyEndDate);
        log.info("surveyDetail 데이터: {}", surveyDetail);


        return "companypage/SurveyDetail"; // JSP 파일 위치
    }
    
    @PostMapping("/update")
    @ResponseBody
    public Map<String, Object> updatePost(@RequestBody SurveyVO surveyVO) {
        Map<String, Object> response = new HashMap<>();
        try {
            int result = this.surveyService.updateSurvey(surveyVO);
            if (result > 0) {
                response.put("status", "success");
                response.put("redirectUrl", "/companypage/SurveyDetail?srvyNo=" + surveyVO.getSrvyNo());
            }
            else {
                response.put("status", "fail");
                response.put("message", "업데이트 실패");
            }
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "업데이트 중 오류 발생");
            e.printStackTrace();
        }

        return response;
    }
    
    @PostMapping("/delete")
    @ResponseBody
    public Map<String, Object> deleteSurvey(@RequestParam("srvyNo") int srvyNo) {
        Map<String, Object> response = new HashMap<>();
        try {
            // 서비스에서 설문 삭제 호출
            surveyService.deleteSurvey(srvyNo);
            response.put("status", "success");
            response.put("message", "설문이 성공적으로 삭제되었습니다.");
            log.info("설문 삭제 성공 - srvyNo: {}", srvyNo);
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "삭제 중 오류가 발생했습니다.");
            log.error("설문 삭제 실패 - srvyNo: {}, 오류: {}", srvyNo, e.getMessage(), e);
        }
        return response;
    }

    
    @PostMapping("/submitResponses")
    @ResponseBody
    public Map<String, Object> submitResponses(@RequestBody List<SurveyResponseVO> responseList, @AuthenticationPrincipal CustomUser user) {
        Map<String, Object> response = new HashMap<>();

        // 로그인 확인
        if (user == null || user.getMember() == null) {
            response.put("status", "error");
            response.put("message", "로그인이 필요합니다.");
            return response;
        }

        // 사용자 ID 설정
        for (SurveyResponseVO responseVO : responseList) {
            responseVO.setMemId(user.getMember().getMemId());
        }

        try {
            // 서비스 호출
            surveyService.submitResponses(responseList);
            response.put("status", "success");
            response.put("message", "응답이 성공적으로 제출되었습니다.");
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "응답 제출 중 오류가 발생했습니다.");
            e.printStackTrace();
        }

        return response;
    }
    
    // @@@ 설문 결과 조회 @@@
    // 일자별 결과 조회
    @GetMapping("/surveyParticipationBySurvey")
    @ResponseBody
    public List<Map<String, Object>> getSurveyParticipationBySurvey(
            @RequestParam("srvyNo") int srvyNo,
            @RequestParam(value = "startDate", required = false) String startDate,
            @RequestParam(value = "endDate", required = false) String endDate) {
        // 기본 날짜 범위 설정
        if (startDate == null || endDate == null) {
            LocalDate now = LocalDate.now();
            endDate = now.toString(); // 오늘 날짜
            startDate = now.minusMonths(1).toString(); // 한 달 전 날짜
        }
        return surveyService.getSurveyParticipationBySurvey(srvyNo, startDate, endDate);
    }

    //종합 결과
    @GetMapping("/surveyResponseStats")
    @ResponseBody
    public List<Map<String, Object>> getSurveyResponseStats(@RequestParam("srvyNo") int srvyNo) {
        return surveyService.getQuestionResponseStats(srvyNo);
    }
    
    // 참여자별 결과 조회
    @GetMapping("/getResponse")
    @ResponseBody
    public List<Map<String, Object>> getResponse(@RequestParam("srvyNo") int srvyNo,
                                                 @RequestParam(value = "memId", required = false) String memId) {
        SurveyVO surveyVO = new SurveyVO();  // 객체 생성
        surveyVO.setSrvyNo(srvyNo);          // 설문 ID 설정
        surveyVO.setMemId(memId);            // 응답자 ID 설정 (없으면 null)

        return surveyService.getResponse(surveyVO);  // Service 호출
    }
    
    @GetMapping("/getSurveyParticipants")
    @ResponseBody
    public ResponseEntity<?> getSurveyParticipants(@RequestParam("srvyNo") int srvyNo) {
        try {
            List<Map<String, Object>> participants = surveyService.getSurveyParticipants(srvyNo);
            
            if (participants == null || participants.isEmpty()) {
                return ResponseEntity.status(HttpStatus.NO_CONTENT).body("No participants found");
            }
            
            return ResponseEntity.ok(participants);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error fetching participants");
        }
    }

    
    // 설문자 수 조회
    @GetMapping("/surveyTotalParticipants")
    @ResponseBody
    public int getSurveyTotalParticipants(@RequestParam("srvyNo") int srvyNo) {
        return surveyService.getSurveyTotalParticipants(srvyNo);
    }
    
    @GetMapping("/downloadExcel")
    public void downloadExcel(@RequestParam("srvyNo") int srvyNo, HttpServletResponse response) {
        try {
            // 설문 제목 가져오기
        	String surveyName = surveyService.getSurveyTitle(srvyNo);
            System.out.println("Initial Survey Name: " + surveyName); // 확인
            
        	if (surveyName == null || surveyName.isEmpty()) {
        	    System.out.println("Survey Name is empty or null. Defaulting to: survey_results");
        	    surveyName = "survey_results"; // 기본 이름 설정
        	}
            System.out.println("Final Survey Name before setting file name: " + surveyName);

            // UTF-8로 파일 이름 인코딩
            String encodedFileName = URLEncoder.encode(surveyName + ".xlsx", StandardCharsets.UTF_8.toString()).replace("+", "%20");
            String contentDisposition = "attachment; filename=\"" + encodedFileName + "\"; filename*=UTF-8''" + encodedFileName;
            System.out.println("Encoded File Name: " + encodedFileName);

            // 응답 헤더 설정
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", contentDisposition);
            
            Workbook workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet("응답 결과");

            // 데이터 가져오기
            List<Map<String, Object>> responseList = surveyService.getSurveyResponseData(srvyNo);

            // 질문을 헤더로 설정하기 위해 고유 질문 목록 추출
            Set<String> questionSet = new LinkedHashSet<>();
            for (Map<String, Object> responseData : responseList) {
                questionSet.add((String) responseData.get("QUESTION"));
            }
            List<String> questionList = new ArrayList<>(questionSet);

            // 열 너비 설정
            sheet.setColumnWidth(0, 15 * 256); // 응답일시 열 (15자의 너비)
            sheet.setColumnWidth(1, 20 * 256); // 참여자 열 (20자의 너비)

            // 질문별 열 너비 설정
            for (int i = 0; i < questionList.size(); i++) {
                sheet.setColumnWidth(2 + i, 30 * 256); // 질문별 열 (30자의 너비)
            }
            
            // 헤더 생성
            Row headerRow = sheet.createRow(0);
            headerRow.createCell(0).setCellValue("응답일시");
            headerRow.createCell(1).setCellValue("참여자");
            for (int i = 0; i < questionList.size(); i++) {
                headerRow.createCell(2 + i).setCellValue(questionList.get(i));
            }

            // 응답 데이터를 순차적으로 기록
            Map<String, Map<String, String>> userResponses = new LinkedHashMap<>();
            for (Map<String, Object> responseData : responseList) {
                String responseDate = responseData.get("SRVYCNDATE").toString();
                String participant = (String) responseData.get("MEMID");
                String question = (String) responseData.get("QUESTION");
                String article = (String) responseData.get("ARTICLE");

                // 사용자별 데이터를 정리
                String userKey = responseDate + "_" + participant;
                userResponses.putIfAbsent(userKey, new LinkedHashMap<>());
                userResponses.get(userKey).put(question, article);
            }

            int rowNum = 1;
            for (Map.Entry<String, Map<String, String>> entry : userResponses.entrySet()) {
                Row row = sheet.createRow(rowNum++);

                String[] userKey = entry.getKey().split("_");
                String responseDate = userKey[0];
                String participant = userKey[1];

                row.createCell(0).setCellValue(responseDate);
                row.createCell(1).setCellValue(participant);

                Map<String, String> responses = entry.getValue();
                for (int i = 0; i < questionList.size(); i++) {
                    String question = questionList.get(i);
                    String article = responses.getOrDefault(question, "No Data");
                    row.createCell(2 + i).setCellValue(article);
                }
            }
/*
            // 파일 이름 설정 (설문 제목 + .xlsx)
            String fileName = surveyName + ".xlsx";
//            String outputFileName = new String(fileName.getBytes("KSC5601"), "8859_1");
            fileName = URLEncoder.encode(fileName, "UTF-8");
            response.setCharacterEncoding("UTF-8");
//            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setContentType("application/vnd.msexcel;charset=euc-kr");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
*/
            // 엑셀 파일 출력
            workbook.write(response.getOutputStream());
            workbook.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }





    /*
    @PostMapping("/submitResponses")
    @ResponseBody
    public Map<String, Object> submitResponses(
            @RequestBody List<SurveyResponseVO> responseList, 
            @AuthenticationPrincipal CustomUser user) {
        Map<String, Object> response = new HashMap<>();

        // 로그인 여부 확인
        if (user == null || user.getMember() == null) {
            response.put("status", "error");
            response.put("message", "로그인이 필요합니다.");
            return response;
        }

        // 응답마다 사용자 ID 설정
        String memId = user.getMember().getMemId();
        for (SurveyResponseVO responseVO : responseList) {
            responseVO.setMemId(memId);
        }

        try {
            // 서비스 호출
            surveyService.insertResponses(responseList);

            response.put("status", "success");
            response.put("message", "응답이 성공적으로 제출되었습니다.");
            response.put("submittedResponses", responseList); // 제출된 응답 데이터 반환
            log.info("설문 응답이 성공적으로 제출되었습니다: {}", responseList);

        } catch (DataIntegrityViolationException e) {
            response.put("status", "error");
            response.put("message", "데이터 무결성 오류 발생: 중복 또는 잘못된 데이터가 포함되어 있습니다.");
            log.error("데이터 무결성 오류 발생", e);

        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "응답 제출 중 알 수 없는 오류 발생");
            log.error("응답 제출 중 오류 발생", e);
        }

        return response;
    }

    */


}
