<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- sweetAlert -->
<link rel="stylesheet"
	href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- date-range-picker -->
<!-- <script src="../../../../resources/plugins/daterangepicker/daterangepicker.js"></script> -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<link href="/directlyCss/survey.css" rel="stylesheet">

<!-- 아이콘 -->
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	
<style>
/* 기본 상태: 테두리 제거 */
 input[type="text"] {
    border: none; /* 테두리 제거 */
    border-bottom: 1px solid transparent; /* 밑줄 기본 상태 투명 */
    outline: none; /* 클릭 시 파란 테두리 제거 */
    transition: border-bottom-color 0.3s ease; /* 밑줄 애니메이션 */
}

/* 클릭(포커스) 시 밑줄 스타일 */
input[type="text"]:focus {
    border-bottom: 1px solid #007BFF; /* 포커스 시 밑줄 색상 */
}

/* 비활성화 상태 */
/* input[type="text"]:disabled { */
/*     background-color: #f9f9f9; /* 비활성화 시 배경색 변경 */ */
/*     cursor: not-allowed; */


/* <!--질문 번호 제목 --> */
.form-group{
    display: flex; /* Flexbox로 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    gap: 10px; /* 요소 간 간격 */
}

.question-number {
    margin: 0; /* 기본 마진 제거 */
    font-weight: bold; /* 숫자를 강조 */
}

.questionTitle {
    flex: 1; /* input이 남은 공간을 채우도록 설정 */
}

.required-star {
    color: red;
    font-weight: bold;
    margin-left: 5px;
}

.item-wrap{
	display: flex; 
	align-items: center; 
	gap: 10px; 
	margin-bottom: 1rem;

}

.questionItem form-control{
	flex: 1;
}

#deleteButton${questionVO.srvyQstnNo}
{
postision: absolute;
padding: 3px;;
top: -2px
}

<!-- 답변 필수 질문 삭제 -->
.question-edit {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 10px;
}

.deleteQuest button {
    border: none;
    background: none;
    padding: 0;
    margin: 0;
    cursor: pointer;
}

.custom-control {
    margin-left: 20px;
}

.deleteQuest {
/*     margin-right: 20px; */
margin-left: auto;


}

.hidden-col {
        display: none;
    }

    .card-header {
    display: flex; /* 한 줄로 정렬 */
/*     justify-content: space-between; /* 좌우 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
}
.card-tools {
    margin-left: auto; /* 검색창을 오른쪽 끝으로 밀어냄 */
     display: flex;
    align-items: center; /* 내부 요소 세로 중앙 정렬 */
}


    .register-btn {
        margin-left: auto; /* 버튼을 오른쪽 끝으로 이동 */
        padding: 10px 15px; /* 버튼 크기 조정 */
        font-size: 14px; /* 버튼 글씨 크기 조정 */
    }

    .card-footer2 {
        display: flex;
        justify-content: flex-end; /* 모든 요소를 오른쪽으로 정렬 */
        align-items: center; /* 수직 중앙 정렬 */
        gap: 10px; /* 페이징 영역과 버튼 간격 조정 */
    }

a {
    color: black;
    text-decoration: none; /* 밑줄 없애기 (선택사항) */
}

a:hover {
    color: black; /* 마우스 올려도 색 유지 */
}

.pageTitle{
font-weight: bold;
}
</style>
<div class="content-wrapper" style="background-color: white;">
	<!--     Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/companypage/main">companypage</a></li>
						<li class="breadcrumb-item active"><a href="/companypage/SurveyList">설문 목록</a></li>
						<li class="breadcrumb-item active"><a href="javascript:location.reload()">설문 편집</a></li>
				 </ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
				<section class="content">
		<div class="container-fluid">
		<h2 class="pageTitle">설문 편집</h2>
			<div class="row">
				<div class="col-12">
				<!-- /.card-header -->

				<div class="card-body table-responsive p-0" id="divDetailArea" >
<!-- 					<form> -->
				<div class="card card-info" >
	              <div class="card-header" style="background-color: rgb(71, 178, 228)">
	                <h3 class="card-title"></h3>
	              </div>
	              <!-- /.card-header -->
	              <!-- form start -->
	              
	                <div class="card-body">
	                  <div class="form-group">
	                    <label for="surveyTitle">제목</label>
	                    <input type="text" class="form-control" id="surveyTitle" placeholder="설문 제목 입력"
	                    value="${surveyDetail.srvyTtl}">
	                  </div>
	                  <div class="form-group">
	                    <label for="surveyExplanation">설명</label>
	                    <input type="text" class="surveyExplanation form-control" placeholder="설명 입력"
	                    value="${surveyDetail.srvyCn}">
	                  </div>
	                  <!-- 날짜와 시간 선택 -->
						<div class="form-group">
					    <label>설문 기간</label>
					    <div class="input-group">
					        <div class="input-group-prepend">
					            <span class="input-group-text"><i class="far fa-clock"></i></span>
					        </div>
					        <input type="text" class="form-control float-right" id="reservationtime">
					    </div>
					</div>
	                <!-- /날짜와 시간 선택 -->
	                
             			<div class="form-group">
						<button type="button" style="width:150px; margin-left: 4px;" class="btn btn-block btn-light">질문 추가</button>
	                  </div>
	                </div>
	                <!-- /.card-body -->
	            </div>
	            <c:forEach var="question" items="${surveyDetail.surveyQuestionVOList}">
	            <div class="card card-primary question-card">
	              <!-- /.card-header -->
	              <!-- form start -->
	              
	                <div class="card-body">
	                 <div class="form-group" style="display: flex; align-items: center;">
<!-- 	                    <label for="question">질문</label> -->
   						 <em class="question-number" style="margin: 0; font-weight: bold; font-size: 20px;">1</em>
	                    <input type="text" class="questionTitle form-control" placeholder="질문 입력"
	                    value="${question.srvyQstn}">
	                  </div>
	                  <div class="form-group">
<!-- 	                    <label for="questionExplanation">설명</label> -->
	                    <input type="text" class="questionExplanation form-control" placeholder="설명 입력"
	                    value="${question.srvyQstnCn}">
	                  </div>
	                 <div class="card card-primary">
				    <div class="card-body">
				        <div class="form-group option-group">
					            <label for="questionItem">항목</label>
				        <c:forEach var="article" items="${question.surveyArticleVOList}">
					             <div class="item-wrap">
					              <input type="text" class="questionItem form-control" placeholder="항목"
					              value="${article.srvyArtclCn}">
                                     <button id="deleteButton${question.srvyQstnNo}" style="border: none; background: none; padding: 0; margin: 0; cursor: pointer;">
                       					 <ion-icon name="close-outline"></ion-icon>
                       				 </button>
                       				 </div>
<!--                        				  <div class="item-wrap"> -->
<!--                         		  <input type="text" class="questionItem form-control" placeholder="항목" -->
<%--                         		  value="${article.srvyArtclCn}"> --%>
<%-- 		                          	<button id="deleteButton${questionVO.srvyQstnNo}" style="border: none; background: none; padding: 0; margin: 0; cursor: pointer;"> --%>
<!--                       					 <ion-icon name="close-outline"></ion-icon> -->
<!--                        				 </button> -->
<!--                        				 </div> -->
                       				 </c:forEach>
					        </div>
					        <button type="button" class="btn btn-block btn-light btn-sm" style="width:100px;">항목 추가</button>
					    </div>
					</div>

	                <div class="form-group">
	                <div class="question-edit" style="display: flex;">
                    <div class="custom-control custom-switch" style="margin-left: 20px; margin-bottom: 10px;">
                      <input type="checkbox" class="custom-control-input" id="requiredAnswer${question.srvyQstnNo}"
                      	<c:if test="${question.srvyQstnRequired==1}">checked</c:if>
                       />
                      <label class="custom-control-label" for="requiredAnswer${question.srvyQstnNo}">답변 필수</label>
                    </div>
                    <div class="deleteQuest">
                    	<button id="deleteButton${question.srvyQstnNo}" style="border: none; background: none; padding: 0; margin: 0; cursor: pointer;">
						        <ion-icon name="trash-outline" style="font-size: 25px;"></ion-icon>
						    </button>
                    </div>
                    </div>
                    <div class="form-group">
						<button type="button" style="width:150px; margin-left: 20px;" class="btn btn-block btn-light">질문 추가</button>
	                  </div>
                  </div>
	                
	                <!-- /.card-body -->
	                
	
	            </div>
<!-- 	                <div class="card-footer"> -->
<!-- 	                </div> -->
				</div>
				</c:forEach>
<!-- 	            </form> -->
				</div>
				<!-- /.card-body -->
	                  <button type="submit" id="btnSubmit" class="btn btn-block btn-info" style="background-color:rgb(71, 178, 228); border-color:rgb(71, 178, 228);">저장</button>
				<!-- card-footer 시작 -->
				<div class="card-footer" id="divPagingArea">
				
				</div>
			</div>
		</div>
	</section>
</div>

<!-- ///// content 끝 ///// -->

<!-- 기간 선택 -->
<script>
$(function () {
    const startDate = '${srvyBgngData}';
    const endDate = '${srvyEndDate}';

    $('#reservationtime').daterangepicker({
        timePicker: true,
        timePickerIncrement: 30,
        locale: {
            format: 'YYYY-MM-DD HH:mm:ss'
        },
        startDate: startDate, // 시작일
        endDate: endDate // 종료일
    });
});

</script>
<!-- 기존 항목 추가 -->

<script>
$(document).ready(function () {
    let questionCounter = 1; // 질문 ID 카운터
    
    // 초기 상태에서 질문 번호 업데이트
    updateQuestionNumbers();
    
    // 답변 필수 체크박스 상태 변경 이벤트
    $(document).on('change', '.custom-control-input', function () {
        const isChecked = $(this).is(':checked'); // 체크 상태 확인
        const questionTitle = $(this).closest('.card-body').find('.questionTitle'); // 해당 질문 제목
        
        if (isChecked) {
            // 체크된 경우, * 추가
            if (!questionTitle.siblings('.required-star').length) { // 중복 방지
                questionTitle.before('<span class="required-star" style="color: red;">*</span>');
            }
        } else {
            // 체크 해제된 경우, * 제거
            questionTitle.siblings('.required-star').remove();
        }
    });

    // 질문 추가 버튼 클릭
    $(document).on('click', '.btn-block.btn-light', function () {
        if ($(this).text().trim() === '질문 추가') {
            const questionHtml = `
            <div class="card card-primary question-card" data-question-id="${questionCounter}">
                <div class="card-body">
                <div class="form-group" style="display: flex; align-items: center; ">
                <!-- 	                    <label for="question">질문</label> -->
                   						 <em class="question-number" style="margin: 0; font-weight: bold; font-size: 20px; "></em>
                        <input type="text" class="questionTitle form-control" placeholder="질문 입력"
                        	value="${question.srvyQstn}">
                    </div>
                    <div class="form-group">
                        <input type="text" class="questionExplanation form-control" placeholder="설명 입력"
                        	value="${question.srvyQstnCn}">
                    </div>
                    <div class="card card-primary">
                    <div class="card-body">
                    <div class="form-group option-group">
                        <label for="questionItem">항목</label>
                        <div class="item-wrap">
                        <input type="text" class="questionItem form-control" placeholder="항목">
                        <button id="deleteButton${questionVO.srvyQstnNo}" style="border: none; background: none; padding: 0; margin: 0; cursor: pointer;">
                        <ion-icon name="close-outline"></ion-icon>
                        </button>
                        </div>
                        <div class="item-wrap">
                        <input type="text" class="questionItem form-control" placeholder="항목">
                        <button id="deleteButton${questionVO.srvyQstnNo}" style="border: none; background: none; padding: 0; margin: 0; cursor: pointer;">
                        <ion-icon name="close-outline"></ion-icon>
                        </button>
                        </div>
                    </div>
                    <button type="button" class="btn btn-block btn-light btn-sm" style="width:100px;">항목 추가</button>
                    </div>
                    </div>
                    <div class="question-edit" style="display: flex;">
                    <div class="custom-control custom-switch" style="margin-left: 20px; margin-bottom: 10px;">
                      <input type="checkbox" class="custom-control-input" id="requiredAnswer\${questionCounter}">
                      <label class="custom-control-label" for="requiredAnswer\${questionCounter}">답변 필수</label>
                    </div>
                    <div class="deleteQuest">
                    	<button id="deleteButton${questionVO.srvyQstnNo}" style="border: none; background: none; padding: 0; margin: 0; cursor: pointer;">
						        <ion-icon name="trash-outline" style="font-size: 25px;"></ion-icon>
						    </button>
                    </div>
                    </div>
                </div>
            </div>`;
            // 새 질문 카드를 기존 질문들 아래, 저장 버튼 위에 추가
            $('.question-card:last').after(questionHtml);

            questionCounter++;
            
            // 질문 추가 후 번호 업데이트
            updateQuestionNumbers();
        }
    });
    
    // 질문 카드 삭제 버튼 클릭
    $(document).on('click', '.deleteQuest button', function () {
        const questionCard = $(this).closest('.question-card'); // 해당 질문 카드 찾기
        questionCard.remove(); // 질문 카드 삭제
        
        // 질문 삭제 후 번호 업데이트
        updateQuestionNumbers();
    });
    
    // 질문 번호 업데이트 함수
    function updateQuestionNumbers() {
    $('.question-card').each(function (index) {
        const questionNumber = (index + 1).toString(); // 숫자 생성
        $(this).find('.question-number').text(questionNumber + '.'); // 숫자와 점 결합하여 표시
    });
}

    // 항목 추가 버튼 클릭
    $(document).on('click', '.btn-light.btn-sm', function () {
        if ($(this).text().trim() === '항목 추가') {
            const optionHtml = `
            <div class="form-group item-wrap">
                <input type="text" class="questionItem form-control" placeholder="항목">
                <button style="border: none; background: none; padding: 0; margin: 0; cursor: pointer;">
               	 	<ion-icon name="close-outline"></ion-icon>
           		 </button>
            </div>`;
            const optionGroup = $(this).closest('.card-body').find('.option-group'); // 클릭된 카드 내 option-group 찾기
            optionGroup.append(optionHtml); // 클릭된 카드 내 항목 추가

            
            // 항목 추가 후 삭제 버튼 상태 업데이트
            updateDeleteButtonVisibility(optionGroup);
        }
    });
    
 // 항목 삭제 버튼 클릭
    $(document).on('click', '.deleteQuest button, .option-group button', function () {
    	 const itemWrap = $(this).closest('.item-wrap'); // 클릭된 버튼의 item-wrap div 찾기
         const optionGroup = $(this).closest('.option-group'); // 항목 그룹 찾기
         
         if (itemWrap.length) {
             itemWrap.remove(); // item-wrap 전체 삭제
             
             // 남은 항목 개수를 확인하여 삭제 버튼 숨기기
             updateDeleteButtonVisibility(optionGroup);
         }
     });
 
    // 항목 개수 확인 후 삭제 버튼 표시/숨김
    function updateDeleteButtonVisibility(optionGroup) {
        const itemWraps = optionGroup.find('.item-wrap'); // 현재 항목들
        if (itemWraps.length === 1) {
            itemWraps.find('button').hide(); // 삭제 버튼 숨기기
        } else {
            itemWraps.find('button').show(); // 삭제 버튼 표시
        }
    }

    // 초기 상태에서 각 질문 카드의 항목 개수 확인
    $('.option-group').each(function () {
        updateDeleteButtonVisibility($(this));
    });
    

    // 저장 버튼 클릭
    $('#btnSubmit').off('click').on('click', function () {
        const surveyVO = {
            srvyTtl: $('#surveyTitle').val(), // 설문 제목
            srvyCn: $('.surveyExplanation').val(), // 설문 설명
            srvyBgngData: $('#reservationtime').data('daterangepicker').startDate.format('YYYY-MM-DD HH:mm:ss'), // 시작 날짜
            srvyEndDate: $('#reservationtime').data('daterangepicker').endDate.format('YYYY-MM-DD HH:mm:ss'), // 종료 날짜
            surveyQuestionVOList: [] // 질문 리스트
        };

        // 질문 및 항목 데이터 수집
        $('.question-card').each(function () {
            const questionTitle = $(this).find('.questionTitle').val();
            const questionExplanation = $(this).find('.questionExplanation').val();
            const isRequired = $(this).find('.custom-control-input').is(':checked');

            const question = {
                srvyQstn: questionTitle,
                srvyQstnCn: questionExplanation,
                srvyQstnRequired: isRequired ? 1 : 0, // 답변 필수 여부
                surveyArticleVOList: []
            };

            // 항목 데이터 수집
            $(this).find('.questionItem').each(function () {
                const optionText = $(this).val();
                question.surveyArticleVOList.push({
                    srvyArtclCn: optionText
                });
            });

            surveyVO.surveyQuestionVOList.push(question);
        });

        console.log('전송 데이터:', JSON.stringify(surveyVO)); // 데이터 확인

        // 서버로 데이터 전송
        $.ajax({
            url: '/companypage/createSurvey',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(surveyVO),
            success: function (response) {
                if (response.status === 'success') {
                    const srvyNo = response.srvyNo; // 서버에서 반환된 srvyNo
                    window.location.href = `/companypage/SurveyDetail?srvyNo=`+ srvyNo;
                } else {
                    Swal.fire('저장 실패', response.message || '저장 중 오류가 발생했습니다.', 'error');
                }
            },
            error: function () {
                Swal.fire('오류', '서버 요청 중 오류가 발생했습니다.', 'error');
            }
        });
    });
});

</script>

<%@ include file="../include/footer.jsp"%>
