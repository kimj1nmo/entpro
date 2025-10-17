<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <%@ include file="../include/header.jsp"%> --%>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/adminlte/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
<!--   <link rel="stylesheet" href="/adminlte/plugins/jqvmap/jqvmap.min.css"> -->
  <!-- Theme style -->
  <link rel="stylesheet" href="/adminlte/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="/adminlte/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="/adminlte/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="/adminlte/plugins/summernote/summernote-bs4.min.css">
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<link href="/directlyCss/survey.css" rel="stylesheet">

<!-- sweetAlert -->
<link rel="stylesheet"
	href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
	
<style>
.survey-list-period{
	opacity: .6;
}

.surveyTitle{
	font-size:30px;
}

input.form-control {
    border: none; /* 테두리 제거 */
    background-color: transparent; /* 배경 제거 */
    box-shadow: none; /* 그림자 제거 */
    outline: none; /* 포커스 outline 제거 */
}

input.form-control:focus {
    border: none;
    background-color: transparent;
    outline: none;
}

.item-wrap {
    display: flex;
    align-items: center;
    margin-bottom: 8px; /* 항목 간 간격 */
}

.item-wrap .form-check-input {
    margin-right: 10px;
}

/* 숨김 처리 */
input.form-control.hidden {
    display: none;
}

.centered {
	    margin: 0 auto; /* 상하: 0, 좌우: 자동으로 설정해 가운데 정렬 */
/*     display: flex; */
    justify-content: center; /* 가로 가운데 */
/*     align-items: center; /* 세로 가운데 */ */
    height: 100vh; /* 뷰포트 높이 */
}
.question-header {
    display: flex; /* Flexbox로 정렬 */
    align-items: center; /* 세로 가운데 정렬 */
    gap: 10px; /* 번호와 질문 사이의 간격 */
    margin-bottom:5px;
}

.question-number {
    margin: 0;
    font-weight: bold;
    font-size: 20px;
}

.question-title {
    margin: 0;
    font-size: 18px;
}
</style>
<!-- ///// content 시작 ///// -->
<!-- <div class="content-wrapper"> -->
<!-- 	    Content Header (Page header) -->
	<div class="content-header centered" style="width: 100%;  
    max-width: 800px;">
	<section class="content">
		<div class="container-fluid">
			<!-- ///// content 시작 ///// -->
			<div class="row">
				<div class="col-12">
					<!-- /.card-header -->
					    <c:choose>
			        <c:when test="${surveyDetail.srvyStatus == 2}">
			            <h1 style=" text-align: center;">참여할 수 없는 설문입니다.</h1>
			        </c:when>
			
			        <c:when test="${surveyDetail.srvyStatus == 3 or currentDate > surveyDetail.srvyEndDate.time}">
			            <h1 style=" text-align: center;">설문이 종료되었습니다.</h1>
			        </c:when>
			        
			        <c:when test="${currentDate < surveyDetail.srvyBgngData.time}">
			            <h1 style=" text-align: center;">설문 기간이 아닙니다.</h1>
			        </c:when>
			
			        <c:otherwise>
					<div class="card-body table-responsive p-0" id="divDetailArea">

					<form id="surveyForm" method="POST">
					    <div class="content-header centered" style="width: 100%; max-width: 800px;">
					        <section class="content">
					            <div class="container-fluid">
					                <div class="row">
					                    <div class="col-12">
					                        <div class="card-body table-responsive p-0" id="divDetailArea">
					                            <div class="card card-info">
					                                <div class="card-header" style="background-color: rgb(71, 178, 228);">
					                                    <h3 class="card-title"></h3>
					                                </div>
					                                <div class="card-body">
					                                	<h3 style="font-weight:bold;">${surveyDetail.srvyTtl}</h3>
					                                    <c:if test="${not empty surveyDetail.srvyCn}">
															    ${surveyDetail.srvyCn}
															</c:if>
					                                    <p class="survey-list-period">
					                                        <fmt:formatDate value="${surveyDetail.srvyBgngData}" pattern="yyyy. MM. dd. a hh:mm" />
					                                        -
					                                        <fmt:formatDate value="${surveyDetail.srvyEndDate}" pattern="yyyy. MM. dd. a hh:mm" />
					                                    </p>
					                                </div>
					                            </div>
					                            
					                            <c:forEach var="question" items="${surveyDetail.surveyQuestionVOList}" varStatus="status">
					                                <div class="card card-primary question-card">
					                                    <div class="card-body">
					                                        <!-- <em class="question-number">${question.srvyQstnNo}</em> -->
					                                        <div class="question-header">
					                                        <em class="question-number" style="margin: 0; font-weight: bold; font-size: 20px; ">
					                                        ${status.index + 1}.</em>
					                                        <h5 style="margin-bottom:0;">${question.srvyQstn}</h5>
					                                        </div>
					                                        <div class="form-group">
					                                            <c:forEach var="article" items="${question.surveyArticleVOList}">
					                                                <div class="form-check">
					                                                    <input type="radio"
					                                                           class="form-check-input"
					                                                           name="responses[${question.srvyQstnNo}]"
					                                                           value="${article.srvyArtclNo}" />
					                                                    <label class="form-check-label">
					                                                        ${article.srvyArtclCn}
					                                                    </label>
					                                                </div>
					                                            </c:forEach>
					                                        </div>
					                                    </div>
					                                </div>
					                            </c:forEach>
					                            
					                            <button type="button" id="submitSurvey" class="btn btn-block btn-info"
					                                    style="background-color: rgb(71, 178, 228); border-color: rgb(71, 178, 228);">
					                                제출
					                            </button>
					                        </div>
					                    </div>
					                </div>
					            </div>
					        </section>
					    </div>
					</form>

					</div>
					    </c:otherwise>
    </c:choose>
					<!-- /.card-body -->
					<!-- card-footer 시작 -->
					<!-- card-footer 끝 -->
				</div>
				<!-- /.card -->

			</div>

			<!-- ///// content 끝 ///// -->
		</div>
		<!-- /.container-fluid -->
<!--        <button type="submit" class="btn btn-block btn-info" style="background-color:rgb(71, 178, 228); border-color:rgb(71, 178, 228);"> -->
<!--        제출</button> -->
		
	</section>

	<!-- ///// content 끝 ///// -->
<script type="text/javascript">
$(document).ready(function () {
    let questionCounter = 1; // 질문 ID 카운터

    // 질문 번호 업데이트 함수
    function updateQuestionNumbers() {
        $('.question-card').each(function (index) {
            const questionNumber = (index + 1).toString(); // 숫자 생성
            $(this).find('.question-number').text(questionNumber + '.'); // 숫자와 점 결합하여 표시
        });
    }

    // 초기화 시 value가 없으면 숨기기
    $('input.form-control').each(function () {
        if (!$(this).val()) {
            $(this).addClass('hidden');
        }
    });

    // value 변경 시 숨기기/보이기 처리
    $('input.form-control').on('input', function () {
        if (!$(this).val()) {
            $(this).addClass('hidden');
        } else {
            $(this).removeClass('hidden');
        }
    });
});

$(document).ready(function () {
    $('#submitSurvey').on('click', function () {
        const responses = [];

        // 질문마다 선택된 항목 ID를 수집
        $('.question-card').each(function () {
            const questionId = $(this).find('.question-number').text().trim().replace('.', '');
            const selectedOption = $(this).find('input[type="radio"]:checked').val();

            if (selectedOption) {
                responses.push({
                    srvyArtclNo: selectedOption // 선택된 항목 번호
                });
            }
        });

        if (responses.length === 0) {
            alert('응답을 선택해주세요.');
            return;
        }

        // 서버로 데이터 전송
        $.ajax({
            url: '/companypage/submitResponses',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(responses),
            success: function (data) {
                if (data.status === 'success') {
                    Swal.fire('제출 완료', '응답이 성공적으로 제출되었습니다.', 'success');
                    setTimeout(function () {
                        window.close();
                    }, 1000);
                } else {
                    Swal.fire('오류', data.message, 'error');
                }
            },
            error: function (err) {
                Swal.fire('오류', '응답 제출 중 문제가 발생했습니다.', 'error');
                console.error(err);
            }
        });
    });
});


</script>

	<%@ include file="../include/footer.jsp"%>