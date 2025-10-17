<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- sweetAlert -->
<link rel="stylesheet" href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- date-range-picker -->
<!-- <script src="../../../../resources/plugins/daterangepicker/daterangepicker.js"></script> -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<!-- 차트 js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.2.0"></script>

<style>
.title1 {
	font-weight: bold;
	font-size: 100px;
}

.title {
	font-weight: bold;
	font-size: 25px;
}
.form-check-input:disabled~.form-check-label, .form-check-input[disabled]~.form-check-label {
 opacity: 1 !important;  /* 기본 투명도 제거 */
    cursor: not-allowed;  /* 선택은 안 되지만 UI는 유지 */
    color:black;
}

.form-check-input:checked + .form-check-label {
    background-color: #d1e7dd !important;
    padding: 0 5px 0 5px;
    border-radius: 5px;
}


.state {
	font-weight: bold;
	color: rgb(71, 178, 228);
}
.beforeStart {
	color: pink;
	font-weight: bold;
}

.inProgress {
	color: rgb(56, 201, 89);
	font-weight: bold;
}

.stop {
	color: rgb(215, 71, 55);
	font-weight: bold;
}

.end {
	color: rgb(90, 90, 90);
	font-weight: bold;
}
.period {
	color: grey;
}

.result_menu {
	margin: 10px;
}

.question_No {
	display: inline;
}

.question {
	display: inline;
}

.nsv_question_stat_text {
	display: inline;
}

.period {
	display: inline;
	margin-right: 10px;
}

.partiNo {
	display: inline;
}

.filter_sort {
	display: inline;
	float: right;
}

.button_sort {
	
}
/* Tab container */
.result_menu {
    margin-bottom: 15px;
}

.tabnav {
    display: flex;
    list-style-type: none;
    padding: 0;
    border-bottom: 2px solid #ddd;
}

.tabnav li {
    margin: 0;
    padding: 0;
}

.tabnav li a {
    display: block;
    padding: 10px 15px;
    text-decoration: none;
    color: #333;
    border: 1px solid transparent;
    border-radius: 5px 5px 0 0;
    background-color: #f9f9f9;
    transition: all 0.3s ease;
}

.tabnav li a:hover,
.tabnav li a.active {
    background-color: #fff;
    border-color: #ddd;
    border-bottom-color: transparent;
    color: #007bff;
}

/* Tab content */
.tabcontent {
    display: none;
    padding: 15px;
    border: 1px solid #ddd;
    border-top: none;
}

.tabcontent.active {
    display: block;
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
margin:12px;
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
						<li class="breadcrumb-item active"><a href="javascript:location.reload()">설문 결과</a></li>
				 </ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- ///// content 시작 ///// -->
		<section class="content">
		<div class="container-fluid">
		<h2 class="pageTitle">설문조사 결과</h2>
			<div class="row">
				<div class="col-12">
	<div class="card card-primary" style="margin: 10px;">
		<div class="card-body">
			<div class="survey-list-status">
				  <c:choose>
                <c:when test="${currentDate < surveyDetail.srvyBgngData.time}">
                    <span class="status_tag beforeStart">시작 전</span>
                </c:when>
                <c:when test="${currentDate >= surveyDetail.srvyBgngData.time and currentDate <= surveyDetail.srvyEndDate.time}">
                    <span class="status_tag inProgress">진행 중</span>
                </c:when>
                <c:when test="${currentDate > surveyDetail.srvyEndDate.time}">
                    <span class="status_tag end">종료</span>
                </c:when>
            </c:choose>
			</div>
			<div class="title">${surveyDetail.srvyTtl}</div> 
			<button id="downloadExcel" class="btn btn-block btn-outline-light btn-sm" style="width: 130px;">결과 내려받기</button>
			<div class="period">
				<p class="survey-list-period" style="margin-bottom:0; margin-left:10px;">
					<fmt:formatDate value="${surveyDetail.srvyBgngData}"
						pattern="yyyy. MM. dd. a hh:mm" />
					-
					<fmt:formatDate value="${surveyDetail.srvyEndDate}"
						pattern="yyyy. MM. dd. a hh:mm" />
				</p>
			</div>
			<div class="partiNo">총 참여자 수: <span id="totalParticipants" /></div>
		</div>
	</div>
	<!--  결과 메뉴 시작 -->
	<div class="result_menu" role="tablist" data-visible="true">
	    <ul class="tabnav">
	        <li><a href="#tab01" class="active">종합 결과</a></li>
	        <li><a href="#tab02">참여자별 결과</a></li>
	        <li><a href="#tab03">일자별 참여수</a></li>
	    </ul>
	</div>
	<!--  결과 메뉴 끝 -->
<div class="tabcontent active" id="tab01">
	 <c:forEach var="question" items="${surveyDetail.surveyQuestionVOList}" varStatus="status">
<!-- 	            <div class="card card-primary question-card"> -->
	              <!-- /.card-header -->
	              <!-- form start -->
	              
	                <div class="card-body">
	                 <div class="form-group" style="display: flex; align-items: center;">
<!-- 	                    <label for="question">질문</label> -->
   						 <em class="question-number" style="margin: 0; margin-right: 7px; font-weight: bold; font-size: 20px;">${status.index + 1}.</em>
	                    ${question.srvyQstn}
	                  </div>
	                 <div class="card card-primary">
				    <div class="card-body">
						    <canvas id="surveyResult${question.srvyQstnNo}" 
						    style="   width: 100%; 
						    max-width: 600px; 
						    height: 400px;
						    margin: 20px auto;
						    display: block;"></canvas>
					    </div>
					</div>
	                <!-- /.card-body -->
	                
	
	            </div>
<!-- 	                <div class="card-footer"> -->
<!-- 	                </div> -->
<!-- 				</div> -->
				</c:forEach>
</div>
<div class="tabcontent" id="tab02">
<!--     <p>참여자별 결과 내용</p> -->
    
     <!-- 참여자 선택 드롭다운 -->
        <div class="container-fluid">
       <div style="padding:0 0 0 20px;">
    <label for="participantSelect">참여자</label>
    <select id="participantSelect" class="form-control" style="width: 200px;">
<!--         <option value="">전체</option> -->
    </select>
       </div> 

    <!-- 응답 결과 테이블 -->
  <section class="content">
            <div class="row">
                <div class="col-12">
                    <div class="card-body table-responsive p-0" id="divDetailArea">
                        <c:forEach var="question" items="${surveyDetail.surveyQuestionVOList}" varStatus="status">
                            <div class="card card-primary question-card">
                                <div class="card-body">
                                    <div class="question-header">
                                        <em class="question-number" style="margin: 0; font-weight: bold; font-size: 20px;">
                                            ${status.index + 1}.
                                        </em>
                                        <h5 style="margin-bottom:0;">${question.srvyQstn}</h5>
                                    </div>

                                    <!-- 객관식 항목 표시 -->
                                    <div class="form-group">
                                        <c:forEach var="article" items="${question.surveyArticleVOList}">
                                            <div class="form-check">
                                                <input type="radio"
                                                       class="form-check-input"
                                                       name="responses[${question.srvyQstnNo}]"
                                                       value="${article.srvyArtclNo}"
                                                       data-question="${question.srvyQstnNo}"
                                                       data-article="${article.srvyArtclNo}" />
                                                <label class="form-check-label">
                                                    ${article.srvyArtclCn}
                                                </label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
    </section>
        </div>
</div>
<div class="tabcontent" id="tab03">
<!--     <p style="font-weight:bold;">일자별 참여수 내용</p> -->
    <canvas id="surveyParticipationChart"></canvas>
    
</div>
				</div>
			</div>
		</div>
	</section>
</div>

	<!-- /.container-fluid -->

	<!-- ///// content 끝 ///// -->
<script>
console.log(Chart.version);

document.addEventListener("DOMContentLoaded", function () {
    const tabs = document.querySelectorAll(".tabnav a");
    const tabContents = document.querySelectorAll(".tabcontent");

    // Attach click event to each tab
    tabs.forEach(tab => {
        tab.addEventListener("click", function (e) {
            e.preventDefault();

            // Deactivate all tabs and contents
            tabs.forEach(t => t.classList.remove("active"));
            tabContents.forEach(tc => tc.classList.remove("active"));

            // Activate the clicked tab and its content
            this.classList.add("active");
            const targetContent = document.querySelector(this.getAttribute("href"));
            targetContent.classList.add("active");
        });
    });

    // Activate the first tab and its content by default
    if (tabs.length > 0) {
        tabs[0].classList.add("active");
        tabContents[0].classList.add("active");
    }
});

//일자별 결과
document.addEventListener("DOMContentLoaded", function () {
    const srvyNo = new URLSearchParams(window.location.search).get("srvyNo"); // URL에서 설문 번호 가져오기
    const today = new Date().toISOString().split("T")[0]; // 오늘 날짜 (YYYY-MM-DD 형식)
    const lastMonth = new Date();
    lastMonth.setMonth(lastMonth.getMonth() - 1);
    const oneMonthAgo = lastMonth.toISOString().split("T")[0]; // 한 달 전 날짜

    console.log("Survey Number:", srvyNo);
    console.log("Date Range:", oneMonthAgo, "to", today);
    
    // 기본적으로 1개월 기간으로 데이터를 로드
    loadSurveyStatistics(srvyNo, oneMonthAgo, today);
});

function loadSurveyStatistics(srvyNo, startDate, endDate) {
	 console.log(`Fetching survey statistics for srvyNo=\${srvyNo}, startDate=\${startDate}, endDate=\${endDate}`);
    fetch(`/companypage/surveyParticipationBySurvey?srvyNo=\${srvyNo}&startDate=\${startDate}&endDate=\${endDate}`)
          .then(response => {
            console.log("API Response Status:", response.status);
            return response.json();
        })
        .then(data => {
            console.log("Data received from API:", data);

            const labels = data.map(item => item.PARTICIPATION_DATE); // 대소문자 수정
            const counts = data.map(item => item.PARTICIPATION_COUNT); // 대소문자 수정

            console.log("Chart Labels:", labels);
            console.log("Chart Counts:", counts);
            
         // ChartDataLabels 플러그인 등록
//             Chart.register(ChartDataLabels);
         
            new Chart(document.getElementById("surveyParticipationChart"), {
                type: "bar",
                data: {
                    labels: labels,
                    datasets: [{
                        label: `응답자 수`,
                        data: counts,
                        backgroundColor: [
    						"rgba(0, 0, 255, 0.3)",
    					],
                        borderWidth: 1
                    }]
                },
        		options: {
        			responsive: true,
        			scales: {
        				yAxes: [{
        				ticks: {
        					min: 0,
        					fontSize : 14,
        					stepSize: 1,
        					max: Math.ceil((Math.max(...counts) + 1) / 10) * 10
        				}
        					,beginAtZero: true
        			}]
        			}
        		},
            });
        });
}

document.addEventListener("DOMContentLoaded", function () {
    const srvyNo = new URLSearchParams(window.location.search).get("srvyNo"); // URL에서 설문 번호 가져오기
    console.log("Survey Number:", srvyNo);
    
    fetch(`/companypage/surveyResponseStats?srvyNo=\${srvyNo}`)
    .then(response => response.json())
    .then(data => {
        console.log("Raw data from server:", data); // 원본 데이터 확인
        const groupedData = groupDataByQuestion(data);
        console.log("Grouped data:", groupedData); // 그룹화된 데이터 확인
        renderDonutCharts(groupedData);
    })
    .catch(error => console.error("Error fetching survey response stats:", error));
});

// 데이터를 질문별로 그룹화
function groupDataByQuestion(data) {
    const grouped = {};
    data.forEach(item => {
        const questionNo = item.QUESTION_NO; // QUESTION_NO로 변경
        if (!grouped[questionNo]) {
            grouped[questionNo] = {
                question_title: item.QUESTION_TITLE, // QUESTION_TITLE로 변경
                options: [],
                counts: []
            };
        }

        // 데이터 추가
        grouped[questionNo].options.push(item.OPTION_TITLE); // OPTION_TITLE로 변경
        grouped[questionNo].counts.push(item.RESPONSE_COUNT); // RESPONSE_COUNT로 변경
    });
    return grouped;
}

// 질문별 도넛 차트를 렌더링
function renderDonutCharts(groupedData) {
    Object.keys(groupedData).forEach(questionNo => {
        const data = groupedData[questionNo];
        console.log(`Rendering chart for question ${questionNo}:`, data);

        // HTML에 이미 존재하는 canvas 요소 가져오기
        const canvas = document.getElementById(`surveyResult`+questionNo);
        if (!canvas) {
            console.error(`Canvas with id surveyResult${questionNo} not found.`);
            return; // 해당 canvas가 없으면 다음으로 넘어감
        }
        
        // 데이터 확인
        if (!data || !data.options.length || !data.counts.length) {
            console.warn(`No data available for question ${questionNo}`);
            return;
        }

        // 차트 렌더링
        new Chart(canvas, {
            type: "doughnut",
            data: {
                labels: data.options,
                datasets: [{
                    data: data.counts,
                    backgroundColor: generateColors(data.options.length)
                }]
            },
            options: {
                plugins: {
                    title: {
                        display: true,
                        text: data.question_title
                    }
                }
            }
        });
    });
}


// 색상 배열 생성
function generateColors(count) {
    const colors = ["#FF6384", "#36A2EB", "#FFCE56", "#4BC0C0", "#9966FF", "#FF9F40"];
    return Array.from({ length: count }, (_, i) => colors[i % colors.length]);
}

document.addEventListener("DOMContentLoaded", function () {
    const srvyNo = new URLSearchParams(window.location.search).get("srvyNo");
    console.log("Survey Number (srvyNo):", srvyNo);

    fetch(`/companypage/surveyTotalParticipants?srvyNo=\${srvyNo}`)
        .then(response => response.json())
        .then(data => {
            console.log("총 참여자 수:", data);
            document.getElementById("totalParticipants").textContent = data;
        })
        .catch(error => console.error("Error fetching total participants:", error));
});

document.addEventListener("DOMContentLoaded", function () {
    const srvyNo = new URLSearchParams(window.location.search).get("srvyNo");
    console.log("Survey Number from URL:", srvyNo);

    document.getElementById("downloadExcel").addEventListener("click", function () {
        if (!srvyNo) {
            alert("설문 번호가 없습니다. URL을 확인해주세요.");
            return;
        }

        console.log("Downloading Excel for Survey Number:", srvyNo);

        // 브라우저 기본 다운로드 동작 사용
        window.location.href = `/companypage/downloadExcel?srvyNo=\${srvyNo}`;
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const srvyNo = new URLSearchParams(window.location.search).get("srvyNo");
    const participantSelect = document.getElementById("participantSelect");
    const responseContainer = document.getElementById("divDetailArea");
//     const responseContainer = document.getElementById("participantResponses");
    console.log("참여자별 srvyNo):", srvyNo);
    console.log("참여자별 participantSelect:", participantSelect);
//     console.log("참여자별 participantResponses:", participantResponses);


    // 1️ 참여자 목록 불러와서 드롭다운에 추가
    fetch(`/companypage/getSurveyParticipants?srvyNo=\${srvyNo}`)
    .then(response => response.json())
    .then(participants => {
        console.log("참여자 목록 데이터 확인:", participants);

        if (!participants || participants.length === 0) {
            console.warn("참여자가 없습니다.");
            return;
        }

        participants.forEach((participant, index) => {
            const memId = participant.MEMID || participant["MEM_ID"] || "알 수 없음";

            const option = document.createElement("option");
            option.value = memId;
            option.textContent = memId;
            participantSelect.appendChild(option);

            // 첫 번째 참여자를 기본 선택값으로 설정
            if (index === 0) {
                participantSelect.value = memId;
                loadParticipantResponses(memId);
            }
        });
    })
    .catch(error => console.error("참여자 목록 가져오기 오류:", error));

    // 2️ 선택된 응답자의 응답 결과 가져오기 (질문별 그룹화)
  function loadParticipantResponses(memId) {
        if (!responseContainer) {
            console.error("Error: responseContainer is not defined.");
            return;
        }

        fetch(`/companypage/getResponse?srvyNo=\${srvyNo}&memId=\${memId}`)
            .then(response => response.json())
            .then(data => {
                console.log("응답 데이터:", data);

                responseContainer.innerHTML = ""; // 기존 데이터 초기화

                const groupedResponses = {};
                data.forEach(response => {
                    console.log("개별 응답 데이터:", response);

                    // 대소문자 문제 디버깅
                    const questionNo = response.QUESTION_NO || response.question_no;
                    const questionTitle = response.QUESTION_TITLE || response.question_title;
                    const optionTitle = response.OPTION_TITLE || response.option_title;
                    const selected = response.SELECTED || response.selected;

                    if (!questionNo || !questionTitle) {
                        console.warn("대소문자 문제 발생 가능: 응답 데이터에 QUESTION_NO 또는 QUESTION_TITLE 없음", response);
                    }

                    if (!groupedResponses[questionNo]) {
                        groupedResponses[questionNo] = {
                            question_title: questionTitle,
                            options: [],
                        };
                    }
                    groupedResponses[questionNo].options.push({
                        option_title: optionTitle,
                        selected: selected,
                    });
                });

                Object.keys(groupedResponses).forEach(questionNo => {
                    const questionData = groupedResponses[questionNo];

                    const questionDiv = document.createElement("div");
                    questionDiv.classList.add("card", "card-primary", "question-card");

                    // 수정된 템플릿 리터럴 처리 방식
                    let optionsHtml = "";
                    questionData.options.forEach(option => {
                        optionsHtml += `
                            <div class="form-check">
                                <input type="radio" class="form-check-input"
                                       \${option.selected == "Y" ? "checked='checked'" : ""} disabled />
                                <label class="form-check-label">\${option.option_title}</label>
                            </div>
                        `;
                    });

                    questionDiv.innerHTML = `
                        <div class="card-body">
                            <div class="question-header">
                                <h5 style="margin-bottom:0;">\${questionData.question_title}</h5>
                            </div>
                            <div class="form-group">
                                \${optionsHtml} <!--템플릿 리터럴 문제 해결 -->
                            </div>
                        </div>
                    `;
                    responseContainer.appendChild(questionDiv);
                });
            })
            .catch(error => console.error("응답 데이터 가져오기 오류:", error));
    }


    // 3️ 드롭다운 변경 시 선택한 참여자의 응답 불러오기
    participantSelect.addEventListener("change", function () {
        loadParticipantResponses(this.value);
    });

    // 초기 로드 (전체 응답)
    loadParticipantResponses();
});
</script>

	<%@ include file="../include/footer.jsp"%>