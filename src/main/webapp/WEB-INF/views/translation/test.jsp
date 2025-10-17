<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Translation Test</title>
</head>
<body>
<script>

async function translateText(text, targetLanguage) {
  const apiKey = "AIzaSyCDJ-gvrsMKm2fAQnCYfeKaN-8nuNCsMu4";  // 발급받은 API 키 입력
  const url = `https://translation.googleapis.com/language/translate/v2?key=${apiKey}`;
  
  const response = await fetch(url, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      q: text,
      target: targetLanguage,
    }),
  });

  const result = await response.json();
  console.log(result.data.translations[0].translatedText);
}

translateText("Hello, world!", "ko");  // 예시 호출

const {Translate} = require('@google-cloud/translate').v2;

const translate = new Translate({
  keyFilename: 'YOUR_SERVICE_ACCOUNT_FILE.json',  // 서비스 계정 JSON 파일 경로
});

async function quickStart() {
  const text = 'Hello, world!';
  const target = 'ko';

  const [translation] = await translate.translate(text, target);
  console.log(`Translated text: ${translation}`);
}

quickStart();
</script>
</body>
</html>
