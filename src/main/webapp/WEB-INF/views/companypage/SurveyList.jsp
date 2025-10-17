<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- sweetAlert -->
<link rel="stylesheet"
	href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>

<!-- 아이콘 -->
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<!-- ///// content 시작 ///// -->


<style>
.surveyResult {
	background-color: rgb(222, 241, 250); /* 기본 배경색 */
	border-color: rgb(71, 178, 228); /* 기본 테두리색 */
	color: rgb(71, 178, 228); /* 기본 텍스트 색상 */
	transition: all 0.3s ease; /* 부드러운 전환 효과 */
	padding: 10px;
	border-radius: 10%;
}

.surveyResult:hover {
	background-color: rgb(200, 232, 247); /* 마우스 오버 시 배경색 */
	color: rgb(71, 178, 228); /* 마우스 오버 시 텍스트 색상 */
}

.surveyCreate {
	display: flex; /* 아이콘과 텍스트를 가로 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
	background-color: rgb(71, 178, 228); /* 기본 배경색 */
	border-color: rgb(71, 178, 228); /* 기본 테두리색 */
	color: white; /* 기본 텍스트 색상 */
	transition: all 0.3s ease; /* 부드러운 전환 효과 */
	padding: 5px;
	border-radius: 10px;
	margin-right:10px;
}

.surveyCreate ion-icon {
    font-size: 20px; /* 아이콘 크기 */
    font-weight: bold; /* 아이콘 두껍게 */
    --ionicon-stroke-width: 50px; /* 아이콘 선 두께 조절 */
}

.surveyCreate:hover {
	background-color: rgb(30, 148, 204); /* 마우스 오버 시 배경색 */
	color: white; /* 마우스 오버 시 텍스트 색상 */
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

.surveyTitle {
	font-weight: bold;
	color: rgb(60, 60, 60);
}

.a {
	text-decoration: none;
	color: inherit;
}
/*   ㅇㅇ 
.survey-list-row {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-left: 10px;
    margin-top: 10px;
}

.update-txt{
	color: grey;
}
.survey-list-title{
 font-size: 20px;
 font-weight: bold;
 margin-left: 10px;
 margin-bottom: 10px;
}

.survey-list-period{
	margin-left: 10px;
}
*/

.container-fluid{
width: 80%;
}

/* 한 줄로 배치 */
.survey-list-item {
	display: flex;
	align-items: center; /* 세로 정렬 */
	justify-content: space-between; /* 양쪽 정렬 */
	gap: 15px; /* 각 요소 간 간격 */
	padding: 15px 20px 15px 15px
}

/* survey-list-info 내부 정렬 */
.survey-list-info {
	display: flex;
	flex-direction: column; /* 제목과 기간을 위아래로 배치 */
	justify-content: space-between; /* 위와 아래로 균등 배치 */
	height: 100%; /* 부모 컨테이너의 높이에 맞춤 */
	width: 490px;
	order: 2;
}

.survey-list-status{
	width:80px;
	text-align: center;
	order: 1;
}
/* 제목과 기간 간격 조정 */
.survey-list-title {
	margin-bottom: 5px; /* 제목과 기간 간의 여백 */
}

.survey-list-title {
	font-weight: 900;
	font-size: 20px;
}

.survey-list-period {
/* 	color: grey; */
	opacity: .6;
	font-size: 17px;
}

.survey-list-update{
	width: 130px;
	order: 3;
	opacity: .6;
	text-align: center;
}

.update-txt {
/* 	color: grey; */
	font-size: 15px;
	
}

.survey-list-button{
order: 4;
display: flex;
position: relative;
width: 190px;
text-align: right;
justify-content: right;
}

/* 드롭다운 컨테이너 스타일 */
.dropdown {
    position: relative;
    display: inline-block;
}

/* 드롭다운 버튼 스타일 */
.dropbtn {
    border: none;
    cursor: pointer;
    padding: 5px;
    font-size: 16px;
     position: relative;
    display: inline-block;
    margin-left:10px;
    margin-top:6px;
    text-align:center;
    
}

.dropbtn:hover{
background-color:#f1f1f1;
border-radius: 10%;
}

/* 드롭다운 내용 숨기기 */
.dropdown-content {
border-radius: 5%;

	font-size: 12px;
	font-weight: bold;
    display: none; /* 기본적으로 숨김 */
    position: absolute;
    right: 0; /* 드롭다운 메뉴를 아이콘 오른쪽에 맞춤 */
    background-color: #ffffff;
    min-width: 95px;
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    z-index: 1;
    list-style: none; /* li의 점 제거 */
    padding: 0;
    margin: 0;
}

/* 드롭다운 내용 항목 스타일 */
.dropdown-content li a {
border-radius: 10%;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
        text-align: left; /* 글자를 왼쪽 정렬 */
    
}

/* 드롭다운 항목 hover 효과 */
.dropdown-content li a:hover {
    background-color: #ddd;
}

.deletesurvey{
color: red;}

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

.pageHeader {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
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

<!-- 모든 페이지에 이거 추가해야함 -->
<div class="content-wrapper" style="background-color: rgb{2, 2, 2};">
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

				 </ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>

	<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
	<!-- sweetAlert -->
	<link rel="stylesheet" href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
	<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
	<!-- ///// content 시작 ///// -->

	<section class="content">
		<div class="container-fluid">
		<div class="pageHeader">
		<h2 class="pageTitle">설문 목록</h2>
		<a href="/companypage/SurveyCreate" class="surveyCreate"><ion-icon name="add-sharp"></ion-icon>설문 만들기</a>
		</div>
			<div class="row">
				<div class="col-12">

			<div class="survey-list">
					<c:forEach var="surveyVO" items="${surveyVOList}" varStatus="stat">
				<div class="card card-primary">

						<div class="survey-list-item">

							<div class="survey-list-status">
								 <c:choose>
							         <c:when test="${surveyVO.srvyStatus == 2}">
						          		<span class="status_tag stop">중지</span>
							        </c:when>
							        <c:when test="${surveyVO.srvyStatus == 3}">
							            <span class="status_tag end">종료</span>
							        </c:when>
							         <c:otherwise>
						            <c:choose>
						                <c:when test="${currentDate < surveyVO.srvyBgngData.time}">
						                    <span class="status_tag beforeStart">시작 전</span>
						                </c:when>
						                <c:when test="${currentDate >= surveyVO.srvyBgngData.time and currentDate <= surveyVO.srvyEndDate.time}">
						                    <span class="status_tag inProgress">진행 중</span>
						                </c:when>
						                <c:when test="${currentDate > surveyVO.srvyEndDate.time}">
						                    <span class="status_tag end">종료</span>
						                </c:when>
						            </c:choose>
						        </c:otherwise>
							    </c:choose>
							</div>




							<div class="survey-list-info">

								<a class="survey-list-title"
									href="/companypage/SurveyDetail?srvyNo=${surveyVO.srvyNo}"
									style="text-decoration: none; color: inherit; margin-bottom:0;"
									onmouseover="this.title='편집'">${surveyVO.srvyTtl}</a>

								<p class="survey-list-period" style="margin-bottom:0;">
									<fmt:formatDate value="${surveyVO.srvyBgngData}"
										pattern="yyyy. MM. dd. a hh:mm" />
									-
									<fmt:formatDate value="${surveyVO.srvyEndDate}"
										pattern="yyyy. MM. dd. a hh:mm" />
								</p>

							</div>

							<span class="survey-list-update update-txt"> <c:choose>
									<c:when test="${empty surveyVO.srvyUpdtDate}">
										<fmt:formatDate value="${surveyVO.srvyRegDate}"
											pattern="yyyy. MM. dd" /> 수정
							</c:when>
									<c:otherwise>
										<fmt:formatDate value="${surveyVO.srvyUpdtDate}"
											pattern="yyyy. MM. dd" /> 수정
							</c:otherwise>
								</c:choose>
							</span>
							<div class="survey-list-button">
								<a href="/companypage/SurveyResult?srvyNo=${surveyVO.srvyNo}" class="surveyResult">결과 확인</a>
<!-- 									<button type="button" class="survey-button-more"> -->

						        <a href="#" 
						        role="presentation" style="margin-left:10px; margin-top:10px;"
   								onclick="openInNewWindow('/SurveyForm?srvyNo=${surveyVO.srvyNo}')">
						        <ion-icon name="arrow-redo-outline"></ion-icon>
						        </a>
								<div class="dropdown">
									<span class="dropbtn" data-srvy-no="${surveyVO.srvyNo}">
										<ion-icon name="ellipsis-vertical-outline"></ion-icon>
									</span>
								   <ul class="dropdown-content" role="menu" id="ul${surveyVO.srvyNo}">
										<li>
										<button data-srvy-no="${surveyVO.srvyNo}" type="button"
											 class="clsX" 
											style="border: none; background: none; padding: 0; margin: 0; cursor: pointer;">
	                       					 <ion-icon name="close-outline" role="img" class="md hydrated"></ion-icon>
	                       				 </button>
										</li>
										<li><a href="/companypage/SurveyDetail?srvyNo=${surveyVO.srvyNo}" role="presentation">편집</a></li>
	        							 <c:choose>
							            <c:when test="${currentDate > surveyVO.srvyEndDate.time}">
							            </c:when>
							            <c:when test="${surveyVO.srvyStatus == 1}">
							                <li>
							                    <a href="#" role="presentation" onclick="updateSurveyStatus(${surveyVO.srvyNo}, 2)">설문 중지</a>
							                </li>
							                <li>
							                    <a href="#" role="presentation" onclick="updateSurveyStatus(${surveyVO.srvyNo}, 3)">강제 종료</a>
							                </li>
							            </c:when>
							            <c:when test="${surveyVO.srvyStatus == 2}">
							                <li>
							                    <a href="#" role="presentation" onclick="updateSurveyStatus(${surveyVO.srvyNo}, 1)">설문 재시작</a>
							                </li>
							                <li>
							                    <a href="#" role="presentation" onclick="updateSurveyStatus(${surveyVO.srvyNo}, 3)">강제 종료</a>
							                </li>
							            </c:when>
							        </c:choose>
	        							<li class="deletesurvey">
										    <a href="#" role="presentation" onclick="deleteSurvey(${surveyVO.srvyNo})"><span style="color:red;">삭제</span></a>
										</li>
        							</ul>
								</div>
							</div>



						</div>
				</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<!-- ///// content 끝 ///// -->

<script type="text/javascript">
function openInNewWindow(url) {
    window.open(
        url, 
        '_blank', 
        'width=800,height=600,scrollbars=yes,resizable=yes'
    );
}

document.addEventListener("DOMContentLoaded", function () {	
//     const dropdown = document.querySelector(".dropdown");
//     const dropdownContent = document.querySelector(".dropdown-content");
//     const dropbtn = document.querySelector(".dropbtn");

    // 드롭다운 버튼 클릭 시 메뉴 토글
//     dropbtn.addEventListener("click", function (event) {
// 	    console.log("드롭다운에 왔다");
	    
//         event.stopPropagation(); // 이벤트 버블링 방지
//         const isDisplayed = dropdownContent.style.display === "block";
//         dropdownContent.style.display = isDisplayed ? "none" : "block";
//     });

    // 드롭다운 외부 클릭 시 닫기
//     document.addEventListener("click", function () {
//         dropdownContent.style.display = "none";
//     });

    // 드롭다운 내부 클릭 시 메뉴 유지
//     dropdownContent.addEventListener("click", function (event) {
//         event.stopPropagation(); // 이벤트 버블링 방지
//     });
});

function updateSurveyStatus(srvyNo, status) {
    // 상태에 따라 메시지 설정
    const statusMessage = status === 2 ? "중지" : status === 3 ? "종료" : "업데이트";

    // Ajax 요청
    $.ajax({
        type: "POST",
        url: status === 2 ? "/companypage/stopSurvey" : "/companypage/endSurvey", // 중지 또는 종료 API 선택
        data: { srvyNo: srvyNo, status: status },
        success: function (response) {
            Swal.fire({
                icon: "success",
                title: `\${statusMessage}되었습니다.`,
                showConfirmButton: false,
                timer: 1500,
            }).then(() => {
                // 페이지 새로고침 (상태 업데이트 반영)
                location.reload();
            });
        },
        error: function (xhr, status, error) {
            Swal.fire({
                icon: "error",
                title: "오류 발생",
                text: "상태 업데이트에 실패했습니다.",
                confirmButtonText: "확인",
            });
        },
    });
}

//////////////// jquery 시작 ////////////////
$(function(){
	//dropdown-content 닫기
	$(".clsX").on("click",function(){
		//data-srvy-no
		let srvyNo = $(this).data("srvyNo");
		console.log("clsX->srvyNo : ", srvyNo);
		
		$("#ul"+srvyNo).css("display","none");
	});
	
	//쩜쩜쩜 클릭 시 실행
	$(document).on("click", ".dropbtn", function () {
		//data-srvy-no
		let srvyNo = $(this).data("srvyNo");
		
	    console.log("드롭다운에 왔다, srvyNo : ", srvyNo);
	    
//         const isDisplayed = dropdownContent.style.display === "block";
		let isdisplayed = $("#ul"+srvyNo).css("display");
		console.log("isdisplayed : ", isdisplayed);
		
	    $("#ul"+srvyNo).css("display","block");
	    
		// 드롭다운 외부 클릭 시 닫기
// 	    document.addEventListener("click", function () {
// 	    	if(isdisplayed=="block"){
// 		    	console.log("나가요");
// 	   			$("#ul"+srvyNo).css("display","none");
// 	    	}
// 	    });

// 		$("#ul"+srvyNo).on("click",function(event){
// 			event.stopPropagation(); // 이벤트 버블링 방지
// 		});
    });
	
});
//////////////// jquery 끝 ////////////////

// 설문 삭제//
function deleteSurvey(srvyNo) {
    // SweetAlert로 사용자 확인
    Swal.fire({
        title: "설문을 삭제하시겠습니까?",
        text: "삭제하면 복구할 수 없습니다!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d33",
        cancelButtonColor: "#3085d6",
        confirmButtonText: "삭제",
        cancelButtonText: "취소",
    }).then((result) => {
        if (result.isConfirmed) {
            // Ajax 요청으로 설문 삭제
            $.ajax({
                type: "POST",
                url: "/companypage/delete",
                data: { srvyNo: srvyNo },
                success: function (response) {
                    if (response.status === "success") {
                        Swal.fire("삭제 완료!", response.message, "success").then(() => {
                            location.reload(); // 페이지 새로고침
                        });
                    } else {
                        Swal.fire("삭제 실패", response.message, "error");
                    }
                },
                error: function () {
                    Swal.fire("삭제 실패", "서버 요청 중 오류가 발생했습니다.", "error");
                },
            });
        }
    });
}

</script>
<%@ include file="../include/footer.jsp"%>