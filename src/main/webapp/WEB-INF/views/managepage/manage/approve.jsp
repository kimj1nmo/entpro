<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- ///// header 시작 ///// -->
<jsp:include page="../../include/header.jsp"></jsp:include>
<!-- ///// header 끝 ///// -->

	<!-- sweetAlert -->
	<link rel="stylesheet" href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
	<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>

<!-- 모든 페이지에 이거 추가해야함 -->
<div class="content-wrapper">
	<!--     Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6"></div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/managepage/manage/list">프로젝트 리스트</a></li>
						<li class="breadcrumb-item active">프로젝트 기안</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!--  /.content-header -->
	<!-- Main content -->
<!-- 직접 추가한 CSS -->
<link rel="stylesheet" href="/directlyCss/project.css">

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(function(){
// 비동기 등록
$("#btnSubmit").on("click", function(){
	console.log("비동기 등록 시작")
	// let proNo = $("#proNo").val();
	let proTtl = $("#proTtl").val().trim();
	let proManager = $("#proManager").val().trim();
	let proRegDate = $("#proRegDate").val().trim();
	let proEndDate = $("#proEndDate").val().trim();
	let proComment = $("#proComment").val().trim();
	let groupNo = $("#groupNo").val().trim();

	if(!proTtl || !proManager || !proRegDate || !proEndDate || !proComment)	{
		alert("모든 값을 제대로 입력해주세요")
		return;
	}

	let data = {
		"proTtl" : proTtl
		, "proManager" : proManager
		, "proRegDate" : proRegDate
		, "proDeadline" : proEndDate
		, "proComment" : proComment
		, "groupNo" : groupNo
	}
	console.log("createPostAjax -> data : ", data);

	$.ajax({
			url:"/managepage/manage/createPostAjax",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			dataType:"json",
			success:function(result){
				console.log("result : ", result);
				Swal.fire({
					title: '등록 완료',
					text: '',
					icon: 'success',
					position: 'top-end',
					showConfirmButton: false,
					timer: 1500,
					toast: true, // 토스트 모드 활성화
					width: '300px',  // 가로 길이를 넓게 설정
				}).then(() => {
					location.href = "/managepage/manage/list";
				});
			}
		});
});

// 시연용 값 채워질 버튼
$("#previewBtn").on("click", function(){
	$("#proTtl").val("[NewJeans] 스테이지 인 도쿄");
	$("#proComment").val("콘서트의 목표 정의: 콘서트가 단순한 공연인지, 앨범 발매 기념인지, 팬들과의 소통을 위한 자리인지 목표를 분명히 합니다.타겟 관객층 설정: 주로 어떤 사람들이 올지 예측하고 그에 맞는 콘텐츠와 마케팅 전략을 구상합니다.전체 예산 산정: 공연장 대관비, 출연자 비용, 무대 및 음향 장비 비용, 마케팅 비용 등 모든 경비를 포함한 예산을 마련합니다.수익 예측: 티켓 판매, 스폰서, 굿즈 판매 등을 통해 예상되는 수익을 계산합니다.공연장 선택: 공연장의 규모와 위치를 고려하여 알맞은 장소를 예약합니다.날짜와 시간 선택: 아티스트의 일정, 타겟 관객층의 특성, 공연장 예약 상황 등을 고려하여 날짜와 시간을 정합니다.");
	$("#proManager").val("e001");
	$("#groupNo").val("1");
	// 날짜도 되긴 하는데 꼭 직접 넣어보시고 사용 바랍니다
	$("#proRegDate").val("2025-02-06");
	$("#proEndDate").val("2025-02-27");
});



});


</script>

<!-- ///// content 시작 ///// -->
<section class="d-flex vh-100">

  <div class="container-fluid">
    <div class="col-12">
      <div class="card card-primary">
        <div class="card-header">
          <h3 class="card-title">프로젝트 기안</h3>

        </div>
        <form id="frm" action="/manage/approve/createPostAjax" method="post" enctype="multipart/form-data">
					<div class="card-body">
						<div class="form-group" style="display: none;">
							<label for="proNo">프로젝트 번호</label>
							<textarea id="proNo" name="proNo" class="form-control" rows="6"></textarea>
						</div>
            <div class="form-group">
              <label for="proTtl">프로젝트 명</label>
              <input type="text" id="proTtl" name="proTtl" class="form-control" value="" required>
            </div>
            <div class="form-group">
              <label for="groupNo">그룹</label>
              <select id="groupNo" name="groupNo" class="form-control custom-select">
                <c:forEach var="groupsVO" items="${groupsVOList}" varStatus="stat">
                  <option value="${groupsVO.groupNo}">
                    ${groupsVO.groupName}
                  </option>
                </c:forEach>
              </select>
            </div>
            <div class="form-group">
              <label for="proManager">담당자</label>
              <select id="proManager" name="proManager" class="form-control custom-select">
                <c:forEach var="projectEmpVO" items="${projectEmpVOList}" varStatus="stat">
                  <option value="${projectEmpVO.memId}">
                    ${projectEmpVO.memName}
                  </option>
                </c:forEach>
              </select>
            </div>
            <div class="form-group">
              <label for="proComment">프로젝트 내용</label>
              <textarea id="proComment" name="proComment" class="form-control" rows="6" required></textarea>
            </div>
            <div class="form-group">
              <label for="proRegDate">등록일자</label>
              <input type="date" id="proRegDate" name="proRegDate" class="form-control" required>
            </div>
            <div class="form-group">
              <label for="proEndDate">마감일자</label>
              <input type="date" id="proEndDate" name="proEndDate" class="form-control" required>
            </div>
            <div id="projectReg" class="col-12">
              <button type="button" id="previewBtn" class="btn btn-primary btn-user">시연용</button>
              <button type="button" id="btnSubmit" class="btn btn-primary btn-user">등록</button>
              <a href="/managepage/manage/list" class="btn btn-primary">목록</a>
            </div>
          </div>
        </form>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
  </div>

</section>
<!-- ///// content 끝 ///// -->

<!-- ///// footer 시작 ///// -->
<jsp:include page="../../include/footer.jsp"></jsp:include>
<!-- ///// footer 끝 ///// -->