<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- SweetAlert2 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

<!-- SweetAlert2 JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<style>
table th {
	text-align: center;
	/* 	font-size: 10px;" */
}

.flex-container {
	display: flex;
	align-items: center; /* 수직 정렬 */
	gap: 10px; /* 요소 간 간격 */
}

.chart-wrapper {
	display: flex;
	width: 100%;
}

/* 차트 영역 (좌측) */
#chart-container {
	width: 100%; /* 차트는 화면의 절반 */
	display: flex;
	justify-content: center;
	align-items: center;
}

/* 버튼 영역 (우측) */
#button-container {
	width: 40%; /* 버튼 영역은 화면의 절반 */
	display: flex;
	flex-direction: column; /* 버튼들을 세로로 배치 */
	justify-content: space-between; /* 위 아래로 배치 */
	gap: 10px; /* 위아래 버튼들 사이의 간격 */
}

/* 위쪽 버튼 컨테이너 */
#button-top-container {
	display: flex;
	justify-content: space-evenly; /* 버튼들을 좌우로 배치 */
}

/* 아래쪽 버튼 컨테이너 */
#button-bottom-container {
	display: flex;
	justify-content: space-evenly; /* 버튼들을 좌우로 배치 */
	gap: 10px;
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

.pageTitle {
	font-weight: bold;
}
</style>

<div class="content-wrapper" style="background-color: white;">
	<!--     Content Header (Page header) -->
	<div class="content-header">
		<div class="row mb-2">
			<div class="col-sm-6"></div>
			<!-- /.col -->
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="/companypage/main">companypage</a></li>
					<li class="breadcrumb-item active">오디션 관리</li>
				</ol>
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
		<!-- /.container-fluid -->
	</div>

	<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
	<!-- sweetAlert -->
	<link rel="stylesheet"
		href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
	<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
	<!-- ///// content 시작 ///// -->

	<section class="content">
		<h2 class="pageTitle">오디션 관리 관리</h2>
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 col-sm-12">
					<div class="card card-primary card-tabs">
						<div class="card-header p-0 pt-1">
							<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="custom-tabs-one-home-tab" data-toggle="pill"
									href="#custom-tabs-one-home" role="tab"
									aria-controls="custom-tabs-one-home" aria-selected="false">오디션
										목록</a></li>
								<li class="nav-item"><a class="nav-link "
									id="custom-tabs-one-profile-tab" data-toggle="pill"
									href="#custom-tabs-one-profile" role="tab"
									aria-controls="custom-tabs-one-profile" aria-selected="true">오디션
										신청 목록</a></li>

							</ul>
						</div>
						<div class="card-body">
							<div class="tab-content" id="custom-tabs-one-tabContent">
								<div class="tab-pane fade show active" id="custom-tabs-one-home"
									role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
									<div class="card-header"
										style="display: flex; justify-content: flex-end;">

										<div class="card-tools">
										</div>
									</div>
									<!-- /.card-header -->
									<div class="card-body table-responsive p-0">
										<!-- 성명으로 오름차순 정렬 -->
										<table class="table table-bordered table-hover">
											<thead>
												<tr>
													<th>번호</th>
													<th>오디션 이름</th>
													<th>오디션 종류</th>
													<th>오디션 기한 날짜</th>
													<th>오디션 날짜</th>
													<th>진행 여부</th>


												</tr>
											</thead>
											<tbody id="tbyAud">


											</tbody>
										</table>
									</div>
									<div
										class="card-footer2 d-flex justify-content-between align-items-center">
										<div id="divPagingAreaAud"
											style="background-color: white; flex-grow: 1;"></div>
										<div class="d-flex" style="gap: 15px; padding-right: 15px;">
											<a data-toggle="modal" data-target="#modal-aud"
												class="btn btn-primary">등록</a>
										</div>
									</div>

								</div>


								<div class="tab-pane fade  " id="custom-tabs-one-profile"
									role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
									<div>
										<div class="dropdown">
											<button class="btn btn-secondary dropdown-toggle"
												type="button" id="groupDropdown" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false">
												전체 보기
												<!-- 기본 텍스트 -->
											</button>
											<div class="dropdown-menu" aria-labelledby="groupDropdown">
												<!-- 전체 보기 -->
												<a class="dropdown-item" href="#" data-type="3">전체 보기</a>
												<!-- 그룹 목록 -->
												<a class="dropdown-item" href="#" data-type="0">종료된 오디션</a>
												<a class="dropdown-item" href="#" data-type="1">진행중인 오디션</a>
											</div>
										</div>

										<div id="putAudition"></div>
										<br>
										<button type="button" class="btn btn-primary" id="all"
											disabled>전체보기</button>
										<button type="button" class="btn  btn-success" id="noResp">미응답</button>
									</div>
									<div class="card-header"
										style="display: flex; justify-content: flex-end;">

										<div class="card-tools">
											<div class="input-group input-group-sm" style="width: 150px;">
												<input type="text" name="keyword" value="${param.keyword}"
													class="form-control float-right" placeholder="검색어 입력" />

												<div class="input-group-append">
													<button type="button" ID="btnSearch"
														class="btn btn-default">
														<i class="fas fa-search"></i>
													</button>

												</div>
											</div>
											<!-- /// 검색 끝 /// -->
										</div>
									</div>

									<div class="card-body table-responsive p-0">
										<!-- 성명으로 오름차순 정렬 -->
										<table class="table table-bordered table-hover">
											<thead>
												<tr>
													<th value="audReqstNo">번호 <span class="up"
														style="cursor: pointer;"></span> <span class="down"
														style="cursor: pointer;"></span>
													</th>
													<th value="audReqstNm">이름 <span class="up"
														style="cursor: pointer;"></span> <span class="down"
														style="cursor: pointer;"></span>
													</th>
													<th value="audNm">신청 오디션<span class="up"
														style="cursor: pointer;"></span> <span class="down"
														style="cursor: pointer;"></span>
													</th>
													<th value="audType">오디션 종류<span class="up"
														style="cursor: pointer;"></span> <span class="down"
														style="cursor: pointer;"></span>
													</th>
													<th value="audReqstDt">신청 날짜 <span class="up"
														style="cursor: pointer;"></span> <span class="down"
														style="cursor: pointer;"></span>
													</th>
													<th value="audReqstGen">성별 <span class="up"
														style="cursor: pointer;"></span> <span class="down"
														style="cursor: pointer;"></span>
													</th>
													<th value="audReqstState">확인여부 <span class="up"
														style="cursor: pointer;"></span> <span class="down"
														style="cursor: pointer;"></span>
													</th>
												</tr>
											</thead>
											<tbody id="tby">


											</tbody>
										</table>
										<div class="card-footer" id="divPagingArea"
											style="background-color: white; flex-grow: 1;"></div>
									</div>
									<div
										class="card-footer2 d-flex justify-content-between align-items-center">
										<div id="divDetailArea"
											style="background-color: white; flex-grow: 1;"></div>
										<div class="d-flex" style="gap: 15px; padding-right: 15px;">
										</div>
									</div>
									<div class="card-body table-responsive p-0" id="divDetailArea">




									</div>

								</div>
							</div>
							<!-- /.card -->
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
</div>




<!-- ///// content 끝 ///// -->

<%@ include file="../include/footer.jsp"%>




<style>
table th {
	text-align: center;
}

/* 전체 셀렉트 박스 컨테이너 스타일 */
.select-container {
	position: relative;
	display: inline-block;
	width: 200px; /* 원하는 너비로 조정 */
}

/* 셀렉트 박스 스타일 */
.custom-select {
	width: 100%;
	padding: 8px;
	padding-right: 30px; /* 화살표 공간 확보 */
	background-color: #ffffff;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 16px;
	color: #333;
	outline: none;
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	cursor: pointer;
	/* 화살표 추가 */
	background-image:
		url('data:image/svg+xml;charset=UTF-8,<svg xmlns%3D%22http://www.w3.org/2000/svg%22 viewBox%3D%220 0 24 24%22 fill%3D%22%23333%22><path d%3D%22M7 10l5 5 5-5z%22/></svg>');
	background-repeat: no-repeat;
	background-position: right 10px center;
	background-size: 12px;
}

/* 포커스 시 스타일 */
.custom-select:focus {
	border-color: #007BFF;
	box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}
</style>



<!-- 오디션 정보 모달 -->
<div class="modal fade" id="modal-audDetail" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">오디션 상세</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card-body">
					<div class="form-group">
						<input type="text" class="form-control" id="audNoDetail"
							placeholder="제목" disabled hidden> <input type="text"
							class="form-control" id="audCheckDetail" placeholder="제목"
							disabled hidden> <input type="text" class="form-control"
							id="audNmDetail" placeholder="제목" disabled>
					</div>
					<div
						style="display: flex; justify-content: space-between; align-items: center; gap: 15px; margin-top: 10px; margin-bottom: 10px;">
						<div class="select-container">
							<!-- 커스텀 셀렉트 박스 -->
							<select class="custom-select" id="audTypeDetail" disabled>
								<option value="0">오디션 종류 선택</option>
								<option value="1">통합</option>
								<option value="2">춤</option>
								<option value="3">노래</option>
								<option value="4">랩</option>
							</select>
						</div>

						<!-- Label (50% 공간 차지) -->
						<label for="exampleInputEmail1"
							style="flex: 1; text-align: right; padding-right: 10px;">오디션
							장소</label>

						<!-- Input (50% 공간 차지) -->
						<div class="form-group" style="flex: 1;">
							<input type="text" class="form-control" id="audLcDetail" value=""
								placeholder="오디션 장소" disabled
								style="width: 100%; padding: 10px;">
						</div>
					</div>

					<div
						style="display: flex; justify-content: space-between; align-items: center; gap: 15px; margin-top: 10px; margin-bottom: 10px;">
						<label for="exampleInputEmail1">오디션 신청 기한</label> <input
							type="date" class="form-control" id="audDateDetail"
							placeholder="오디션 신청 날짜" disabled
							style="flex: 1; margin-right: 10px; padding: 10px;"> <label
							for="exampleInputEmail1">오디션 날짜</label> <input type="date"
							class="form-control" id="audAuddateDetail" placeholder="오디션 날짜"
							disabled style="flex: 1; padding: 10px;">
					</div>
					<div
						style="width: 100%; height: 200px; border: 1px solid #ccc; padding: 10px;">
						<textarea id="audDtlsDetail" disabled
							style="width: 100%; height: 100%; box-sizing: border-box; border: none; padding: 10px; font-size: 14px; resize: none;"></textarea>
					</div>
					<div id="audImgDetail"
						style="width: 100%; height: auto; border: 1px solid #ccc; position: relative;">

					</div>
					<div id="uploadUpdate" hidden>
						<input type="file" class="form-control" id="uploadFilesUpdate"
							name="uploadFiles" value="" placeholder="사진" multiple />
						<div id="divImageUpdate" style="width: 100%; height: 80%"></div>
					</div>

				</div>
				<div class="modal-footer justify-content-end ">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="audUdate">수정</button>
					<button type="button" class="btn btn-primary" id="audUpdateFin"
						hidden>완료</button>
					<a class="btn btn-danger" href="/companypage/auditionList"
						id="audCancel" hidden>취소</a>
					<button type="button" class="btn btn-primary" id="audEnd">오디션
						조기 종료</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</div>
<!-- 오디션 추가 모달 -->
<div class="modal fade" id="modal-aud" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">
					오디션 일정 추가
					<button type="button" class="btn btn-warning" id="previewBtn">시연용</button>

					<script type="text/javascript">
                  // 시연용 값 채워질 버튼
                  $("#previewBtn").on("click", function(){
                     $("#audNmAdd").val("2025 싱어송라이터 공개 오디션");
                     $("#audTypeAdd").val(3);
                     $("#audLcAdd").val("본사 4층 한마음관");
                     $("#audDateAdd").val("2024-04-01");
                     $("#audAuddateAdd").val("2024-04-06");
                     $("#audDtlsAdd").val(`2025 싱어송라이터 공개 오디션은 창작력과 음악적 역량을 지닌 싱어송라이터를 발굴하여, 그들의 음악을 전 세계에 알리고, 글로벌 음악 시장에서 활약할 기회를 제공합니다. 새로운 음악적 아이디어와 독특한 색깔을 가진 아티스트를 찾습니다.

                    		 참가 자격
                    		 만 18세 이상, 35세 이하의 개인
                    		 가창, 작곡, 편곡 능력을 보유한 사람
                    		 자작곡을 발표할 수 있는 창작력을 지닌 사람
                    		 최소 1곡 이상의 자작곡을 가진 사람 (선택사항)

                    		 참가 방법

                    		 자작곡을 포함한 오디션 영상 (최대 3분)을 온라인으로 제출`);
                  });
                  </script>
				</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">

				<div class="card-body">
					<div class="form-group">
						<input type="text" class="form-control" id="audNmAdd"
							placeholder="제목">
					</div>
					<div
						style="display: flex; justify-content: space-between; align-items: center; gap: 15px; margin-top: 10px; margin-bottom: 10px;">
						<div class="select-container">
							<!-- 커스텀 셀렉트 박스 -->
							<select class="custom-select" id="audTypeAdd">
								<option value="0">오디션 종류 선택</option>
								<option value="1">통합</option>
								<option value="2">춤</option>
								<option value="3">노래</option>
								<option value="4">랩</option>
							</select>
						</div>

						<!-- Label (50% 공간 차지) -->
						<label for="exampleInputEmail1"
							style="flex: 1; text-align: right; padding-right: 10px;">오디션
							장소</label>

						<!-- Input (50% 공간 차지) -->
						<div class="form-group" style="flex: 1;">
							<input type="text" class="form-control" id="audLcAdd" value=""
								placeholder="오디션 장소" style="width: 100%; padding: 10px;">
						</div>
					</div>

					<div
						style="display: flex; justify-content: space-between; align-items: center; gap: 15px; margin-top: 10px; margin-bottom: 10px;">
						<label for="exampleInputEmail1">오디션 신청 기한</label> <input
							type="date" class="form-control" id="audDateAdd"
							placeholder="오디션 신청 날짜"
							style="flex: 1; margin-right: 10px; padding: 10px;"> <label
							for="exampleInputEmail1">오디션 날짜</label> <input type="date"
							class="form-control" id="audAuddateAdd" placeholder="오디션 날짜"
							style="flex: 1; padding: 10px;">
					</div>
					<div
						style="width: 100%; height: 200px; border: 1px solid #ccc; padding: 10px;">
						<textarea id="audDtlsAdd"
							style="width: 100%; height: 100%; box-sizing: border-box; border: none; padding: 10px; font-size: 14px; resize: none;"></textarea>
					</div>
					<input type="file" class="form-control" id="uploadFiles"
						name="uploadFiles" value="" placeholder="사진" multiple />
					<div id="divImage" style="width: 100%; height: 80%"></div>

				</div>

			</div>
			<div class="modal-footer justify-content-between">

				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" id="audAdd">등록</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<!-- ///// content 끝 ///// -->
<div class="modal fade" id="modal-req" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">신청 내역</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card-body">
					<div class="form-group">
						<input type="text" class="form-control" id="audNoReqstDetail"
							placeholder="오디션 넘버" disabled hidden> <input type="text"
							class="form-control" id="audReqstNoReqstDetail"
							placeholder="오디션 신청 넘버" disabled hidden> <input
							type="text" class="form-control" id="audReqstStateReqstDetail"
							placeholder="합격 여부" disabled hidden> <input type="text"
							class="form-control" id="audNmReqstDetail" placeholder="오디션 이름"
							disabled>
					</div>
					<div
						style="display: flex; justify-content: space-between; align-items: center; gap: 15px; margin-top: 10px; margin-bottom: 10px;">
						<div class="select-container">
							<!-- 커스텀 셀렉트 박스 -->
							<select class="custom-select" id="audTypeReqstDetail" disabled>
								<option value="0">오디션 종류 선택</option>
								<option value="1">통합</option>
								<option value="2">춤</option>
								<option value="3">노래</option>
								<option value="4">랩</option>
							</select>
						</div>

						<!-- Label (50% 공간 차지) -->
						<label for="exampleInputEmail1"
							style="flex: 1; text-align: right; padding-right: 10px;">신청자</label>

						<!-- Input (50% 공간 차지) -->
						<div class="form-group" style="flex: 1;">
							<input type="text" class="form-control"
								id="audReqstNmReqstDetail" value="" placeholder="신청자" disabled
								style="width: 100%; padding: 10px;">
						</div>
					</div>
					<div
						style="display: flex; justify-content: space-between; align-items: center; gap: 15px; margin-top: 10px; margin-bottom: 10px;">
						<label for="exampleInputEmail1">주소</label> <input type="text"
							class="form-control" id="audReqstAddReqstDetail"
							placeholder="신청자 주소" disabled
							style="flex: 1; margin-right: 10px; padding: 10px;"> <label
							for="exampleInputEmail1">이메일</label> <input type="email"
							class="form-control" id="audReqstEmailReqstDetail"
							placeholder="신청자 이메일" disabled style="flex: 1; padding: 10px;">
					</div>
					<div
						style="width: 100%; height: 200px; border: 1px solid #ccc; padding: 10px;">
						<textarea id="audReqstDtlsReqstDetail" disabled
							style="width: 100%; height: 100%; box-sizing: border-box; border: none; padding: 10px; font-size: 14px; resize: none;"></textarea>
					</div>

					<div id="audReqstFileReqstDetail"></div>


				</div>
				<label for="exampleInputEmail1">답변</label>
				<div
					style="width: 100%; height: 200px; border: 1px solid #ccc; padding: 10px;">
					<textarea id="emailinsert" placeholder="세부 사항을 작성해주세요..."
						style="width: 100%; height: 100%; box-sizing: border-box; border: none; padding: 10px; font-size: 14px; resize: none;"></textarea>
				</div>
			</div>
			<div class="modal-footer justify-content-end" id="audInsert">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" id="audPass">합격</button>
				<button type="button" class="btn btn-danger" id="audFail">불합</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<script type="text/javascript">

	//전역변수 , 전역함수
	/*
	 ==는 Equal Operator이고,  ===는 Strict Equal Operator이다.

	 ==는 a == b 라고 할때, a와 b의 값이 같은지를 비교해서, 같으면 true, 다르면 false라고 한다.(값만 같으면 true이다.)



	 ===는 Strict, 즉 엄격한 Equal Operator로써, "엄격하게" 같음을 비교할 때 사용하는 연산자이다.

	 ===는 a === b 라고 할때, 값과 값의 종류(Data Type)가 모두 같은지를 비교해서, 같으면 true, 다르면 false라고 한다.

	 */
	/**
	 * NVL: expr1 값이 null(undefined) 또는 공백인 경우 expr2 값을 반환, 그렇지 않으면 expr1 값 반환
	 * @return expr1
	 */
	 let keyword="";
	 let sortName="audReqstNo";
	 let mode="0";
	 let audNo="";
	 let type="3";
	 let searchNo="";
	 let check=0;

	 ///오디션 할목
	 let keywordAud="";
	 let modeAud="0";
	 let searchNoAud="";

	function nvl(expr1, expr2) {
		if (expr1 === undefined || expr1 == null || expr1 == "") {
			expr1 = expr2;
		}
		return expr1;
	}

	//미응답 건 갯수 확인
	function checkNoRespTotal(){
		 $.ajax({
		        url: '/AuditionAjax/checkNoRespTotalAjax',  // 데이터를 처리할 서블릿 URL
		        method: 'GET',
		        success: function(response) {
		        	console.log("갯수",response);
		        	$("#noResp").html("미응답:"+response+"건");
		        }
		 })
	}

	/* <button type="button" class="btn btn-primary" id="all">전체보기</button>
	<button type="button" class="btn  btn-success" id="noResp">미응답</button> */
	$("#all").on("click", function() {
		check=0;
	    $("#all").prop("disabled", true);
	    $("#noResp").prop("disabled", false);
		getList("1", keyword,"0",sortName);

	})
	$("#noResp").on("click", function() {
		check=1;
	    $("#noResp").prop("disabled", true);
	    $("#all").prop("disabled", false);
		getList("1", keyword,"0",sortName);

	})
	//누르는 소트
	$('.up').click(function() {
	    var value = $(this).closest('th').attr('value');
	    console.log("위에 누름",value); // 출력: "rnum"
	    sortName=value;
    	console.log("sortName",sortName);

		getList("1", keyword,"0",sortName);

	  });

	  $('.down').click(function() {
	    var value = $(this).closest('th').attr('value');
	    console.log("아래 누름",value);
	    sortName=value;

    	console.log("sortName",sortName);
		getList("1", keyword,"1",sortName);

	  });
	  //통과 메일 보내기
	  $('#audPass').click(function() {
		    let email = $("#audReqstEmailReqstDetail").val();
		    let audNm = $("#audNmReqstDetail").val();
		    let audReqNm = $("#audReqstNmReqstDetail").val();
		    let audReqstState = $("#audReqstStateReqstDetail").val();
		    let page = $("#emailinsert").val();
		    let audReqstNo = $("#audReqstNoReqstDetail").val();

		    if (audReqNm.trim() !== "" && audReqstState == "0") {
		        let data = { "email": email, "audNm": audNm, "audReqNm": audReqNm, "page": page };
		        console.log("data", data);

		        Swal.fire({
		            title: '메일을 보내는 중입니다...',
		            text: '잠시만 기다려주세요.',
		            allowOutsideClick: false,
		            allowEscapeKey: false,
		            didOpen: () => { Swal.showLoading(); }
		        });

		        $.ajax({
		            url: "/api/mail/sendPassMessage",
		            contentType: "application/json;charset=utf-8",
		            data: JSON.stringify(data),
		            type: "POST",
		            dataType: "json",
		            success: function(result) {
		                Swal.fire({
		                    icon: 'success',
		                    title: '합격 메일이 발송되었습니다.',
		                    timer: 1500,
		                    showConfirmButton: false
		                }).then(() => {
		                    location.href = "/companypage/auditionList";
		                });

		                let data1 = { "audReqstNo": audReqstNo, "audReqstState": 1 };
		                console.log("data1", data1);

		                $.ajax({
		                    url: "/AuditionAjax/audReqstStateUpt",
		                    contentType: "application/json;charset=utf-8",
		                    data: JSON.stringify(data1),
		                    type: "POST",
		                    dataType: "json",
		                    success: function(result) {
		                        console.log("오디션 상태 업데이트 완료");
		                    }
		                });
		            },
		            error: function(xhr, status, error) {
		                Swal.fire({
		                    icon: 'error',
		                    title: '메일 전송 실패',
		                    text: '메일을 보내는 도중 문제가 발생했습니다. 다시 시도해주세요.'
		                });
		                console.error("AJAX 오류: ", error);
		            }
		        });
		    } else {
		        Swal.fire({
		            icon: 'warning',
		            title: audReqstState != "0" ? '이미 결과가 전송된 신청입니다' : '다음 단계 세부 사항을 작성해주세요.'
		        });
		    }
		});

	  //탈락 메일 보내기
	  $('#audFail').click(function() {
		    let email = $("#audReqstEmailReqstDetail").val();
		    let audNm = $("#audNmReqstDetail").val();
		    let audReqNm = $("#audReqstNmReqstDetail").val();
		    let audReqstState = $("#audReqstStateReqstDetail").val();
		    let page = $("#emailinsert").val();
		    let audReqstNo = $("#audReqstNoReqstDetail").val();

		    if (audReqNm.trim() !== "" && audReqstState == "0") {
		        let data = { "email": email, "audNm": audNm, "audReqNm": audReqNm, "page": page };
		        console.log("data", data);

		        Swal.fire({
		            title: '메일을 보내는 중입니다...',
		            text: '잠시만 기다려주세요.',
		            allowOutsideClick: false,
		            allowEscapeKey: false,
		            didOpen: () => { Swal.showLoading(); }
		        });

		        $.ajax({
		            url: "/api/mail/sendFailMessage",
		            contentType: "application/json;charset=utf-8",
		            data: JSON.stringify(data),
		            type: "POST",
		            dataType: "json",
		            success: function(result) {
		                Swal.fire({
		                    icon: 'success',
		                    title: '불합격 메일이 발송되었습니다.',
		                    timer: 1500,
		                    showConfirmButton: false
		                }).then(() => {
		                    location.href = "/companypage/auditionList";
		                });

		                let data1 = { "audReqstNo": audReqstNo, "audReqstState": 2 };
		                console.log("data1", data1);

		                $.ajax({
		                    url: "/AuditionAjax/audReqstStateUpt",
		                    contentType: "application/json;charset=utf-8",
		                    data: JSON.stringify(data1),
		                    type: "POST",
		                    dataType: "json",
		                    success: function(result) {
		                        console.log("오디션 상태 업데이트 완료");
		                    }
		                });
		            },
		            error: function(xhr, status, error) {
		                Swal.fire({
		                    icon: 'error',
		                    title: '메일 전송 실패',
		                    text: '메일을 보내는 도중 문제가 발생했습니다. 다시 시도해주세요.'
		                });
		                console.error("AJAX 오류: ", error);
		            }
		        });
		    } else {
		        Swal.fire({
		            icon: 'warning',
		            title: audReqstState != "0" ? '이미 결과가 전송된 신청입니다' : '다음 단계 세부 사항을 작성해주세요.'
		        });
		    }
		});



//오디션 세부 내용 변경
	  $("#audUpdateFin").on('click', function () {

			//1. 가상 폼(이미지 포함) <form></form>
			let formData = new FormData();

		  let audNo = $("#audNoDetail").val();
			let audNm = $("#audNmDetail").val();
			let audType = $("#audTypeDetail").val();
			let audLc = $("#audLcDetail").val();
			let audDtls = $("#audDtlsDetail").val();
			let audDate = $("#audDateDetail").val();
			let audAuddate = $("#audAuddateDetail").val();


			formData.append("audNo", audNo);
			formData.append("audNm", audNm);
			formData.append("audType", audType);
			formData.append("audLc", audLc);
			formData.append("audDtls", audDtls);
			formData.append("audDate", audDate);
			formData.append("audAuddate", audAuddate);

			//3. 파일 엘리먼트를 선택하여 가상 폼에 넣기


			let inputFile = $("#uploadFilesUpdate");
			//이미지 파일들(a001.jpg,b002.jpg)
			let files = inputFile[0].files;
			console.log("files : ", files);

			for (let i = 0; i < files.length; i++) {
				formData.append("uploadFiles", files[i]);
			}

			console.log("formData : ", formData);

			//4. 아작나써유.. 피씨다타써

			$.ajax({
				url : "/AuditionAjax/updateAuditionAjax",
				processData : false,
				contentType : false,
				data : formData,
				type : "post",
				dataType : "text",
				success : function(result) {
					//5. 결과 확인(1 또는 0)
					//0 또는 1
					console.log("result : ", result);
					if(result==1){
						var Toast = Swal.mixin({
							toast : true,
							position : 'top-end',
							showConfirmButton : false,
							timer : 3000
						});
						Toast.fire({
							icon : 'success',
							title : '수정성공'
						});
						setTimeout(function(){
							location.href="/companypage/auditionList";
						},3000);

					}else{
						var Toast = Swal.mixin({
							toast : true,
							position : 'top-end',
							showConfirmButton : false,
							timer : 3000
						});

						Toast.fire({
							icon : 'warning',
							title : '수정실패'
						});
					}
				}
			});
	  })

	  $("#audUdate").on('click', function () {
	        $("#audNmDetail").prop("disabled", false);
	        $("#audTypeDetail").prop("disabled", false);
	        $("#audLcDetail").prop("disabled", false);
	        $("#audDateDetail").prop("disabled", false);
	        $("#audAuddateDetail").prop("disabled", false);
	        $("#audDtlsDetail").prop("disabled", false);

/*						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" id="audUdate">수정</button>
						<button type="button" class="btn btn-primary" id="audUpdateFin" hidden>완료</button>
						<a  class="btn btn-danger" href="/companypage/auditionList" id="audCancel" hidden >취소</a>
						<button type="button" class="btn btn-primary" id="audEnd">오디션 조기 종료</button>
  */
	        $("#audUdate").prop("hidden", true);
	        $("#audEnd").prop("hidden", true);
	        $("#uploadUpdate").prop("hidden", false);
	        $("#audUpdateFin").prop("hidden", false);
	        $("#audCancel").prop("hidden", false);
	        $("#audImgDetail").html("");
// 	        let str=`<input type="file" class="form-control" id="uploadFilesUpdate"
// 				name="uploadFiles" value="" placeholder="사진" multiple />
// 				<div id="divImageUpdate" style="width: 100%; height: 80%"></div>`;
// 	        $("#audImgDetail").html(str);
	  })

	  //오디션 종료시키기
	  $("#audEnd").on('click', function () {
		    let audNo = $("#audNoDetail").val();
		    let audCheck = $("#audCheckDetail").val();
		    console.log("audNo", audNo);

		    let data = {
		        "audNo": audNo
		    };
		    console.log("data", data);

		    $.ajax({
		        url: "/AuditionAjax/audEndAjax",
		        contentType: "application/json;charset=utf-8",
		        data: JSON.stringify(data),
		        type: "POST",
		        dataType: "json", // 서버에서 JSON 형식으로 응답을 반환해야 합니다.
		        success: function (result) { // 서버의 응답 데이터가 이 매개변수로 전달됩니다.
		            console.log("result:", result);
if(audCheck==1){
	 var Toast = Swal.mixin({
         toast: true,
         position: 'top-end',
         showConfirmButton: false,
         timer: 3000
     });

     Toast.fire({
         icon: 'warning',
         title: '이미 종료한 오디션입니다'
     });
     return;
}
		            // 응답값에 따라 처리
		            if (result === 1) { // 성공 시
		                var Toast = Swal.mixin({
		                    toast: true,
		                    position: 'top-end',
		                    showConfirmButton: false,
		                    timer: 3000
		                });
		                Toast.fire({
		                    icon: 'success',
		                    title: '종료성공'
		                });
		                setTimeout(function () {
		                    location.href = "/companypage/auditionList";
		                }, 3000);

		            } else { // 실패 시
		                var Toast = Swal.mixin({
		                    toast: true,
		                    position: 'top-end',
		                    showConfirmButton: false,
		                    timer: 3000
		                });

		                Toast.fire({
		                    icon: 'warning',
		                    title: '종료실패'
		                });
		            }
		        },
		        error: function (xhr, status, error) {
		            console.error("오류 발생", error);
		        }
		    });
		});

	//검색 처리
	$("#btnSearch").on('click',function(){
	//input type="text" name="keyword"...
 	keyword = $("input[name='keyword']").val();//길동
 	console.log("keyword", keyword);

 	//전역함수 호출
 	getList("1", keyword,"",sortName);
	})


	//오디션 정보 추가
	$("#audAdd").on("click", function() {
			console.log("그룹 정보");

			//1. 가상 폼(이미지 포함) <form></form>
			let formData = new FormData();

			//2. 엘리먼트들을 가상 폼에 넣기
			let audNm = $("#audNmAdd").val();
			let audType = $("#audTypeAdd").val();
			let audLc = $("#audLcAdd").val();
			let audDtls = $("#audDtlsAdd").val();
			let audDate = $("#audDateAdd").val();
			let audAuddate = $("#audAuddateAdd").val();

			formData.append("audNm", audNm);
			formData.append("audType", audType);
			formData.append("audLc", audLc);
			formData.append("audDtls", audDtls);
			formData.append("audDate", audDate);
			formData.append("audAuddate", audAuddate);

			//3. 파일 엘리먼트를 선택하여 가상 폼에 넣기


			let inputFile = $("#uploadFiles");
			//이미지 파일들(a001.jpg,b002.jpg)
			let files = inputFile[0].files;
			console.log("files : ", files);

			for (let i = 0; i < files.length; i++) {
				formData.append("uploadFiles", files[i]);
			}

			//4. 아작나써유.. 피씨다타써

				$.ajax({
					url : "/AuditionAjax/createAuditionAjax",
					processData : false,
					contentType : false,
					data : formData,
					type : "post",
					dataType : "text",
					success : function(result) {
						//5. 결과 확인(1 또는 0)
						//0 또는 1
						console.log("result : ", result);
						if(result==1){
							var Toast = Swal.mixin({
								toast : true,
								position : 'top-end',
								showConfirmButton : false,
								timer : 3000
							});
							Toast.fire({
								icon : 'success',
								title : '등록성공'
							});
							setTimeout(function(){
								location.href="/companypage/auditionList";
							},3000);

						}else{
							var Toast = Swal.mixin({
								toast : true,
								position : 'top-end',
								showConfirmButton : false,
								timer : 3000
							});

							Toast.fire({
								icon : 'warning',
								title : '등록실패'
							});
						}
					}
				});
		});

	//오디션 목록 가져오는 함수
	function getAudList(currentPage, keyword,mode) {
		//회원 목록
		let data = {
			"currentPage" : nvl(currentPage, "1"),
			"keyword" : nvl(keyword, ""),
			"mode" : nvl(mode, "0")
			}
		console.log("dataaud :", data);

		$.ajax({
			url : "/AuditionAjax/auditonListSortAjax",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "json",
			success : function(articlePage) {
				console.log("articlePageaud :", articlePage);

				let str = "";
				let audType="";
				let audCheck="";

			$.each(articlePage.content,function(idx,AuditionVO){
				switch(AuditionVO.audType){
				case 1:
					audType="통합";
					break;
				case 2:
					audType="춤";
					break;
				case 3:
					audType="노래";
					break;
				default:
					audType="통합";
				}

				 let audDate = new Date((AuditionVO.audDate));
					  let formataudDate = "";

					    if (!isNaN(audDate)) {
					    	formataudDate = audDate.getFullYear() + '-'
					                        + String(audDate.getMonth() + 1).padStart(2, '0') + '-'
					                        + String(audDate.getDate()).padStart(2, '0');
					    }
					     if(formataudDate=="1970-01-01")
					    	{
					    	 formataudDate="상시";
					    	};
				 let audAuddate = new Date((AuditionVO.audAuddate));
					  let formatAudAuddate = "";

					    if (!isNaN(audAuddate)) {
					    	formatAudAuddate	 = audAuddate.getFullYear() + '-'
					                        + String(audAuddate.getMonth() + 1).padStart(2, '0') + '-'
					                        + String(audAuddate.getDate()).padStart(2, '0');
					    }
					     if(formatAudAuddate=="1970-01-01")
					    	{
					    	 formatAudAuddate="상시";
					    	 console.log("여	기 들어감",formatAudAuddate);
					    	};
				if(AuditionVO.audCheck==1){
					audCheck="모집종료";
				}
				else{
					audCheck="모집 중";

				}

					console.log("지금 상태",audCheck);
				str+=`<tr style="cursor: pointer;"  data-toggle="modal" data-target="#modal-audDetail" data-aud-no="\${AuditionVO.audNo}" id="audDetail">
                <td style=" text-align: center;">\${AuditionVO.audNo}</td>
                <td >\${AuditionVO.audNm}</td>
                <td style=" text-align: center;">\${audType}</td>
                <td style=" text-align: center;">\${formataudDate}</td>
                <td style=" text-align: center;">\${formatAudAuddate}</td>
                <td style=" text-align: center;">\${audCheck}</td>
              </tr>`;
			});//endeach
				$("#tbyAud").html(str);
				$("#divPagingAreaAud").html(articlePage.pagingArea);

			}
		});
	}//end getList()

	//오디션 신청 목록 가져오는 함수
	function getList(currentPage, keyword,mode,sortName) {
		//회원 목록
		let data = {
			"currentPage" : nvl(currentPage, "1"),
			"keyword" : nvl(keyword, ""),
			"mode" : nvl(mode, "0"),
			"sortName" : nvl(sortName, ""),
			"audNo":audNo,
			"type":type,
			"searchNo":searchNo,
			"check":check
		}
		console.log("data :", data);

		$.ajax({
			url : "/AuditionAjax/auditonReqListSortAjax",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "json",
			success : function(articlePage) {
				console.log("articlePage :", articlePage);
				console.log("articlePage.content :", articlePage.content);


				let str = "";
					let audType="";
					let audReqstDt="";
					let audReqstGen="";
					let audReqstState="";
				$.each(articlePage.content,function(idx,AuditionReqstVO){

					switch(AuditionReqstVO.audType){
					case 1:
						audType="통합";
						break;
					case 2:
						audType="춤";
						break;
					case 3:
						audType="노래";
						break;
					case 3:
						audType="랩";
						break;
					default:
						audType="통합";
					}


					switch(AuditionReqstVO.audReqstGen){
					case 0:
						audReqstGen="남자";
						break;
					case 1:
						audReqstGen="여자";
						break;
					default:
						audReqstGen="남자";
					}
					switch(AuditionReqstVO.audReqstState){
					case 1:
						audReqstState="합격";
						break;
					case 2:
						audReqstState="불합격";
						break;
					default:
						audReqstState="미열람";
					}

					 let audReqstDt = new Date((AuditionReqstVO.audReqstDt));

						  let formatAudReqstDt = "";
						    if (!isNaN(audReqstDt)) {
						    	formatAudReqstDt = audReqstDt.getFullYear() + '-'
						                        + String(audReqstDt.getMonth() + 1).padStart(2, '0') + '-'
						                        + String(audReqstDt.getDate()).padStart(2, '0');
						    }
					str+=`<tr style="cursor: pointer;"  data-toggle="modal" data-target="#modal-req" data-aud-reqst-no="\${AuditionReqstVO.audReqstNo}" id="audReqstDetail">
                    <td>\${AuditionReqstVO.audReqstNo}</td>
                    <td><a<a id="">\${AuditionReqstVO.audReqstNm}</a></td>
                    <td>\${AuditionReqstVO.audNm}</td>
                    <td style=" text-align: center;">\${audType}</td>
                    <td style=" text-align: center;">\${formatAudReqstDt}</td>
                    <td style=" text-align: center;">\${audReqstGen}</td>
                    <td style=" text-align: center;">\${audReqstState}</td>
                  </tr>`;
				});//endeach
				$("#tby").html(str);
				$("#divPagingArea").html(articlePage.pagingArea);
				checkNoRespTotal();
			}
		});
	}//end getList()


	//오디션 신청 정보 미리 널기
	$(document).on("click", "#audReqstDetail", function (e) {
    let audReqstNo = $(this).data("aud-reqst-no"); // 속성 이름 수정
    console.log("audReqstNo", audReqstNo);

    let data = {
        "audReqstNo": nvl(audReqstNo, "")
    };
    console.log("data :", data);

    $.ajax({
        url: "/AuditionAjax/audReqstDetailAjax",
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(data),
        type: "POST",
        dataType: "json",
        success: function (audReqstVO) {
            console.log("audReqstVO :", audReqstVO);

            // 입력 필드 값 설정
            $("#audNoReqstDetail").val(audReqstVO.audNo);
            $("#audReqstNoReqstDetail").val(audReqstVO.audReqstNo);
            $("#audNmReqstDetail").val(audReqstVO.audNm);
            $("#audTypeReqstDetail").val(audReqstVO.audNo);
            $("#audReqstNmReqstDetail").val(audReqstVO.audReqstNm);
            $("#audReqstAddReqstDetail").val(audReqstVO.audReqstAdd);
            $("#audReqstDtlsReqstDetail").val(audReqstVO.audReqstDtls);
            $("#audReqstEmailReqstDetail").val(audReqstVO.audReqstEmail);
            $("#audReqstStateReqstDetail").val(audReqstVO.audReqstState);

            // 파일 리스트 처리
            if (!audReqstVO.fileGroupVO || !audReqstVO.fileGroupVO.fileDetailVOList) {
                $("#file").html("<p>파일이 없습니다.</p>");
            } else {
                $("#audReqstFileReqstDetail").html(""); // 기존 콘텐츠 초기화
                $.each(audReqstVO.fileGroupVO.fileDetailVOList, function (idx, file) {
                    console.log("file:", file);

                    let fileMime = file.fileMime;
                    let fileUrl = file.fileSaveLocate; // 파일 URL 생성
                    let fileDiv = $("#audReqstFileReqstDetail");

                    if (fileMime.startsWith("image/")) {
                    	console.log("aa",fileUrl);
                        fileDiv.append(`<img src="\${fileUrl}" alt="이미지 파일" style="max-width: 60%; height: auto;">`);
                    } else if (fileMime.startsWith("audio/")) {
                        fileDiv.append(`
                            <audio controls>
                                <source src="\${fileUrl}" type="${fileMime}">
                                Your browser does not support the audio element.
                            </audio>
                        `);
                    } else if (fileMime.startsWith("video/")) {
                        fileDiv.append(`
                            <video controls style="max-width: 100%; height: auto;">
                                <source src="\${fileUrl}" type="${fileMime}">
                                Your browser does not support the video element.
                            </video>
                        `);
                    } else {
                        fileDiv.append(`<p>지원되지 않는 파일 형식입니다.</p>`);
                    }
                    fileDiv.append(`<br>`	)
                });
            }
        },
        error: function (xhr, status, error) {
            console.error("Error loading file content:", error);
            $("#file").html("<p>파일을 불러오는 데 실패했습니다.</p>");
        }
    });
});

	//오디션 정보 미리 널기
		$(document).on("click","#audDetail",function(){
			//data-reply-content
			//				str+=`<tr  data-toggle="modal" data-target="#modal-audDetail" data-aud-no="\${AuditionVO.audNo}"
			let audNo= $(this).data("audNo");
	        $("#audUdate").prop("hidden", false);
	        $("#audEnd").prop("hidden", false);
	        $("#uploadUpdate").prop("hidden", true);
	        $("#audUpdateFin").prop("hidden", true);
	        $("#audCancel").prop("hidden", true);

	        $("#audNmDetail").prop("disabled", true);
	        $("#audTypeDetail").prop("disabled", true);
	        $("#audLcDetail").prop("disabled", true);
	        $("#audDateDetail").prop("disabled", true);
	        $("#audAuddateDetail").prop("disabled", true);
	        $("#audDtlsDetail").prop("disabled", true);


		 	console.log("audNo", audNo);
			let data = {
					"audNo" : nvl(audNo, "")
				}
				console.log("data :", data);
		 	$.ajax({
				url : "/AuditionAjax/audDetailAjax",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				type : "POST",
				dataType : "json",
				success : function(audVO) {
					console.log("audVO :", audVO);




					 let audDate = new Date((audVO.audDate));
					 let audAuddate = new Date((audVO.audAuddate));

				console.log("audVO.audCheck :", audVO.audCheck);
					$("#audCheckDetail").val(audVO.audCheck);
					$("#audNmDetail").val(audVO.audNm);
					$("#audLcDetail").val(audVO.audLc);
					$("#audNoDetail").val(audVO.audNo);
					  let formataudDate = "";
					    if (!isNaN(audDate)) {
					    	formataudDate = audDate.getFullYear() + '-'
					                        + String(audAuddate.getMonth() + 1).padStart(2, '0') + '-'
					                        + String(audAuddate.getDate()).padStart(2, '0');
					    }
				console.log("dformataudDate :", formataudDate);

				$("#audLcDetail").val(audVO.audLc);
				  let formataudAuddate = "";
				    if (!isNaN(audAuddate)) {
				    	formataudAuddate = audAuddate.getFullYear() + '-'
				                        + String(audAuddate.getMonth() + 1).padStart(2, '0') + '-'
				                        + String(audAuddate.getDate()).padStart(2, '0');
				    }
			console.log("dformataudDate :", formataudDate);
					$("#audDateDetail").val(formataudDate);
					$("#audAuddateDetail").val(formataudAuddate);
					$("#audDtlsDetail").val(audVO.audDtls);
   				   $("#audTypeDetail").val(audVO.audType);
// 				    }
// 					$("#groupDspgnSet").val(formatGroupDspgn);
				$("#audImgDetail").html("");
				$.each(audVO.fileGroupVO.fileDetailVOList,function(idx,file){

					let img = "<img src='" + file.fileSaveLocate + "' style='width:100%; height: auto' />";
// 					let img = "<img src='" + file.fileSaveLocate + "' style='width: 100%; height: 100%; object-fit: cover; object-position: center;' />";
// 					//누적 : append(), 덮어쓰기 : html()

					$("#audImgDetail").append(img);
				});

				}
			});


		});

	$('.dropdown-item').click(function (e) {
        e.preventDefault(); // 기본 동작 방지
        type  = $(this).data('type'); // 선택한 종류
        const auditionFinsh = $(this).text(); // 선택한 그룹 이름
                console.log("type",type);
	        // AJAX 요청: 그룹별 게시글 조회
        $.ajax({
            url: '/AuditionAjax/auditonListFinishAjax',
            type: 'GET',
            data: { "type": type },
            success: function (auditonList) {
                // 테이블 업데이트
                console.log(auditonList);
                str=`
                	<div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="groupDropdown1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        전체 보기 <!-- 기본 텍스트 -->
                    </button>
                    <div class="dropdown-menu" aria-labelledby="groupDropdown">`

				$.each(auditonList,function(idx,auditonVO){

                    str+=
                    <!-- 전체 보기 -->
                      `  <a class="dropdown-item aaa" href="#" data-aud-no="\${auditonVO.audNo}">\${auditonVO.audNm}</a>`
				})
                        str+=  `</div>
                </div>
                `;
                if(type=="3")
                {
                	str="";

                }
         	    searchNo="";
        		getList("1", keyword,"",sortName);
                 $('#putAudition').html(str);

                // 드롭다운 버튼 텍스트 변경
                $('#groupDropdown').text(auditionFinsh);
            },
            error: function () {
                Swal.fire('오류', '데이터를 가져오는 중 문제가 발생했습니다.', 'error');
            }
        });
    });


	$(document).on('click', '.dropdown-item.aaa', function (e) {
	    e.preventDefault(); // 기본 동작 방지
	    const audNo = $(this).data('aud-no'); // 선택한 종류
	    const auditionNm = $(this).text(); // 선택한 그룹 이름
	    console.log("audNo", audNo);
	    console.log("auditionNm", auditionNm);
	    searchNo=audNo;
	    console.log("searchNo", searchNo);
		getList("1", keyword,"",sortName);
	    // 드롭다운 버튼 텍스트 변경
	    $('#groupDropdown1').text(auditionNm);
	});
	//document.ready
	//동일 jsp에서 1회 작성
	$(function() {


		getAudList("1",keyword,"0",sortName);

		getList("1", "","0",sortName);
        const upIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-up icon" viewBox="0 0 16 16"><path d="M3.204 11h9.592L8 5.519zm-.753-.659 4.796-5.48a1 1 0 0 1 1.506 0l4.796 5.48c.566.647.106 1.659-.753 1.659H3.204a1 1 0 0 1-.753-1.659"/></svg>';
        const upIconChk = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-up-fill" viewBox="0 0 16 16"> <path d="m7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/></svg>';
        const downIcon='<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down" viewBox="0 0 16 16">  <path d="M3.204 5h9.592L8 10.481zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659"/> </svg>'
        const downIconChk='<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16"> <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/></svg>'
        	memId="";
        	   $('.up').removeClass('active').html('').append(upIcon);
        $('.down').removeClass('active').html('').append(downIcon);

		//검색 처리
		$("#btnSearch").on('click', function() {
			//input type="text" name="keyword"...
			let keyword = $("input[name='keyword']").val();//길동
			console.log("keyword", keyword);

			//전역함수 호출
			getList("1", keyword,"0",sortName);
		})


		 $.ajax({
        url: '/api/userInfo',
        method: 'GET',
        success: function(data) {
            console.log("로그인 정보: ", data)
             memId = data.memId; // 서버에서 받은 사용자 정보
            console.log("memId: ", memId)
        },
        error: function(xhr, status, error) {
            console.error('로그인 정보 가져오기 실패:', error);
        }
    });
		//페이지 클릭 처리
		//class="clsPagingArea" : 여러개(오브젝트 배열)
		//정적요소 	   $(".clsPagingArea").on("click",function(){
		//동적요소
		$(document).on("click", ".clsPagingArea1", function() {

			//클릭한 것은 하나
			//<a .. data-current-page="2" data-keyword="".. class="page-link clsPagingArea">2</a>
			let currentPage = $(this).data("currentPage");//2
			 keyword = $(this).data("keyword");//""

			 let mode = $(this).data("mode");//0 또는 1

			console.log("페이지 클릭 처리->current11Page : " + currentPage);
			console.log("페이지 클릭 처리->111 : " + keyword);
			console.log("페이지 클릭 처리->mo11de : " + mode);
			console.log("페이지 클릭 처리->s11ortName : " + sortName);
			getList(currentPage, keyword, mode, sortName);
		});



		//페이지 클릭 처리 (2번째 이상부터)
		//class="clsPagingArea" : 여러개(오브젝트 배열)
		//정적요소 	   $(".clsPagingArea").on("click",function(){
		//동적요소
		$(document).on("click", ".clsPagingArea", function() {

			//클릭한 것은 하나
			//<a .. data-current-page="2" data-keyword="".. class="page-link clsPagingArea">2</a>
			let currentPage = $(this).data("currentPage");//2
			 keyword = $(this).data("keyword");//""

			 let mode = $(this).data("mode");//0 또는 1
			 sortName = $(this).data("sortName");//""

			console.log("페이지 클릭 처리->currentPage : " + currentPage);
			console.log("페이지 클릭 처리->keyword : " + keyword);
			console.log("페이지 클릭 처리->mode : " + mode);
			console.log("페이지 클릭 처리->sortName : " + sortName);
			getAudList(currentPage, keyword, mode,sortName);

		});
		   $('.up').click(function(){
               $('.up').removeClass('active').html('').append(upIcon);
               $('.down').removeClass('active').html('').append(downIcon);

	                $(this).addClass('active').html('').append(upIconChk);
           });
		   $('.down').click(function(){
               $('.down').removeClass('active').html('').append(downIcon);
               $('.up').removeClass('active').html('').append(upIcon);

	                $(this).addClass('active').html('').append(downIconChk);
           });
	});
	//e : 변경 이벤트 오브젝트
	function handleImg(e){
		console.log("개똥이");

		//이미지 오브젝트들
		let files = e.target.files;

		//이미지 오브젝트 배열(a.jpgb.jpgc.jpg)
		let fileArr = Array.prototype.slice.call(files);

		//미리보기 영역 초기화
		$("#divImage").html("");

		fileArr.forEach(function(f){
			if(!f.type.match("image.*")){
// 				alert("이미지 확장자만 가능합니다");
				return;//함수 종료
			}
			//이미지 읽기
			let reader = new FileReader();
			//e : 읽는 이벤트
			reader.onload = function(e){
				let img = "<img src='" + e.target.result + "' style='width:100%; height: 100%' />";
				//누적 : append(), 덮어쓰기 : html()
				$("#divImage").append(img);
			}
			reader.readAsDataURL(f);
		});

	}
	//e : 변경 이벤트 오브젝트
	function handleImgUpdate(e){
		console.log("멍똥이");

		//이미지 오브젝트들
		let files = e.target.files;

		//이미지 오브젝트 배열(a.jpgb.jpgc.jpg)
		let fileArr = Array.prototype.slice.call(files);

		//미리보기 영역 초기화
		$("#audImgDetail").html("");

		fileArr.forEach(function(f){
			if(!f.type.match("image.*")){
// 				alert("이미지 확장자만 가능합니다");
				return;//함수 종료
			}
			//이미지 읽기
			let reader = new FileReader();
			//e : 읽는 이벤트
			reader.onload = function(e){
				let img = "<img src='" + e.target.result + "' style='width:100%; height: 100%' />";
				//누적 : append(), 덮어쓰기 : html()
				$("#audImgDetail").append(img);
			}
			reader.readAsDataURL(f);
		});

	}
	$(function(){
		$("#uploadFiles").on("change",handleImg);
		$("#uploadFilesUpdate").on("change",handleImgUpdate);
	});
	//페이징 처리
	$(document).on("click", ".clsPagingArea", function() {

		//클릭한 것은 하나
		//<a .. data-current-page="2" data-keyword="".. class="page-link clsPagingArea">2</a>
		let currentPage = $(this).data("currentPage");//2
		 keyword = $(this).data("keyword");//""

		 let mode = $(this).data("mode");//0 또는 1

		console.log("페이지 클릭 처리->currentPage : " + currentPage);
		console.log("페이지 클릭 처리->keyword : " + keyword);
		console.log("페이지 클릭 처리->mode : " + mode);
		console.log("페이지 클릭 처리->sortName : " + sortName);
		getList(currentPage, keyword, mode, sortName);

	});
</script>

<%@ include file="../include/footer.jsp"%>