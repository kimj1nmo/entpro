<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>댓글 번역 테스트</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // 번역 보기 버튼 클릭 시
            $('.translate-btn').click(function () {
                const commentId = $(this).data('comment-id'); // 댓글 ID 가져오기
                const $commentElement = $(`#comment-\${commentId}`); // 댓글 요소 가져오기
                const textToTranslate = $commentElement.text(); // 번역할 텍스트 가져오기
                const originalText = $commentElement.data('original-text') || textToTranslate; // 원본 텍스트 저장

                // 자동 언어 감지 처리 (빈 값을 넣어 자동 언어 감지 활성화)
                const sourceLang = ""; // 빈 값을 넣어 자동 언어 감지 활성화
                const targetLang = "ko"; // 대상 언어를 한국어로 고정

                let data = {
                    text: textToTranslate,
                    sourceLang: sourceLang,
                    targetLang: targetLang
                };

                console.log("data : ", data);

                // Ajax 요청으로 번역 처리
                $.ajax({
                    url: "/translation/api", // 컨트롤러에서 설정한 경로
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(data),
                    success: function (response) {
                    	/*
                    		Map<String, String> response = new HashMap<>();
					        response.put("translatedText", translatedText);
					        response.put("sourceLang", sourceLanguage);
                    	*/
                        console.log("번역 결과:", response);
                        // 번역 결과가 성공적으로 받았을 때
                        if (response && response.translatedText) {
                            // 번역된 텍스트를 댓글에 표시
                            $commentElement.text(response.translatedText); // 텍스트를 번역된 텍스트로 교체
                            $commentElement.data('original-text', originalText); // 원본 텍스트를 저장

                            // 원본 텍스트 언어 감지 (예: 영어 -> 영어)
                            const sourceLang = response.sourceLang || 'unknown'; // 번역된 언어의 감지된 원본 언어

                            // 버튼을 '원문 보기'로 변경하고 언어 표시
                            $(`#btn-\${commentId}`).text('원문 보기').append(` (\${sourceLang})`);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("번역 중 오류:", xhr, status, error);
                    }
                });

                // 버튼을 '번역 보기'로 바꿔주는 처리 (원문 보기 상태일 때)
                $(this).hide(); // '번역 보기' 버튼 숨기기
                $(`#btn-\${commentId}`).show(); // '원문 보기' 버튼 표시
            });

            // 원문 보기 버튼 클릭 시
            $('.original-btn').click(function () {
                const commentId = $(this).data('comment-id'); // 댓글 ID 가져오기
                const $commentElement = $(`#comment-\${commentId}`); // 댓글 요소 가져오기
                const originalText = $commentElement.data('original-text'); // 원본 텍스트 가져오기

                // 원본 텍스트로 되돌리기
                $commentElement.text(originalText); // 원본 텍스트로 교체

                // 버튼을 '번역 보기'로 변경하고, 언어 정보 제거
                $(`#btn-\${commentId}`).text('번역 보기').hide();
                $(`#btn-\${commentId}`).siblings('.translate-btn').show(); // '번역 보기' 버튼 표시
            });
        });
    </script>
</head>
<body>
    <h1>댓글 번역 테스트</h1>
    
    <!-- 댓글 목록 -->
    <div id="comments">
        <div class="comment">
            <p id="comment-1">नामुविकी, एक ज्ञान का वृक्ष जो हम साथ बढ़ते</p>
            <button class="translate-btn" data-comment-id="1">번역 보기</button>
            <button id="btn-1" class="original-btn" data-comment-id="1" style="display:none;">원문 보기</button>
            <div id="translated-comment-1"></div>
        </div>
        <hr>
        <div class="comment">
            <p id="comment-2">なんでそんなにかわいいの。</p>
            <button class="translate-btn" data-comment-id="2">번역 보기</button>
            <button id="btn-2" class="original-btn" data-comment-id="2" style="display:none;">원문 보기</button>
            <div id="translated-comment-2"></div>
        </div>
        <hr>
        <div class="comment">
            <p id="comment-3">ශ්‍රී ලංකාවේ අපේක්ෂිත ඉඩම් ඉල්ලුම්කරුවන්ට අවශ්‍ය තොරතුරුයිදැයි ඉල්ලාම්කරුවන් පවත්වාගෙන යාමේ අවසානය වේ.</p>
            <button class="translate-btn" data-comment-id="3">번역 보기</button>
            <button id="btn-3" class="original-btn" data-comment-id="3" style="display:none;">원문 보기</button>
            <div id="translated-comment-3"></div>
        </div>
    </div>
</body>
</html>
