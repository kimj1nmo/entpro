<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../../include/header.jsp" %>

<!--  /.content-header -->
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- sweetAlert -->
<link rel="stylesheet" href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- ///// content 시작 ///// -->

<!-- 직접만든 CSS -->
<link href="/directlyCss/filebox.css" rel="stylesheet">

<div class="content-wrapper">
	<!-- 현재 페이지 정보 -->
	<div class="row mb-2">
		<div class="col-sm-6"></div>
		<div class="col-sm-6">
			<ol class="breadcrumb float-sm-right" style="background-color: rgb(244, 246, 249);">
				<li class="breadcrumb-item"><a href="/managepage/manage/list">프로젝트 리스트</a></li>
				<li class="breadcrumb-item active"><a href="/managepage/manage/detail/${proNo}">프로젝트 상세정보</a></li>
				<li class="breadcrumb-item active">파일함</li>
			</ol>
		</div>
	</div>
			 
	<div class="content-header">
		<div class="container-fluid">
			<!-- 프로젝트명 -->
			<div class="d-flex justify-content-center align-items-center">
				<div class="callout callout-info col-md-6 d-flex align-items-center" onclick="location.href=`/managepage/manage/detail/${proNo}`" style="cursor: pointer;">
					<i class="fas fa-arrow-circle-left me-2 fa-2x"></i>
					<h2 class="flex-grow-1 text-center" style="text-align: center;">${projectVO.proTtl}</i></h2>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</div>

	<section class="content" style="min-height: 350vh;">
		<div class="d-flex justify-content-center" style="height: 100vh;">
			<div class="col-10">
				<div class="card">
					<div class="card-header d-flex justify-content-between align-items-center">
						<i class="fas fa-align-center">&nbsp;&nbsp;각 파트별 파일</i>
						<!-- 등록 버튼 -->
						<div class="d-flex justify-content-end" style="margin-left: 50vw;">
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-xl">
								등록
							</button>
						</div>
					</div>
					<!-- ./card-header -->
					<div class="card-body p-0">
						<table class="table table-hover">
							
							<!-- 파일 전체 반복 횟수 예제 -->
<%-- 						<c:set var="size" value="${fn:length(projectVO.ganttVOList)}" /> --%>

							<!-- 간트차트의 갯수만큼 리스트 뽑기 -->
							<c:forEach var="ganttVO" items="${projectVO.ganttVOList}" varStatus="stat">
								<c:if test="${ganttVO.proYn == 1}">
									<tbody>
										<tr data-widget="expandable-table" aria-expanded="false">
											<td style="position: relative;">
												&nbsp;&nbsp;&nbsp;&nbsp;
												<!-- 간트차트 별 이름 -->
												<p><i class="expandable-table-caret fas fa-caret-right fa-fw"></i>${ganttVO.proJobNm}</p> 
												<p>${ganttVO.proStartDate} ~ ${ganttVO.proEndDate}</p>
												<div class="d-flex justify-content-end align-items-center" style="gap: 20px;">
													<!-- <i class="fas fa-arrow-left">&nbsp;파일현황</i> -->
														<c:forEach var="fileVO" items="${ganttVOList}" varStatus="status">
															<c:if test="${fileVO.ganttChartsNo eq ganttVO.ganttChartsNo && fileVO.fileExt eq 'jpg'}">
																<i class="fas fa-image me-3">이미지:&nbsp;${fileVO.fileCnt}</i>
															</c:if><!-- c:when으로 교체 -->
															<c:if test="${fileVO.ganttChartsNo eq ganttVO.ganttChartsNo && fileVO.fileExt eq 'xlsx'}">
																<i class="fas fa-file-alt me-3">&nbsp;문서:&nbsp;${fileVO.fileCnt}</i>
															</c:if>
														</c:forEach>
														<div class="icon-container">
															<div class="icon-box">
																<i class="fas fa-arrow-left"></i>
															</div>
															<span class="text">파일현황</span>
														</div>
												</div>
											</td>
										</tr>
										<tr class="expandable-body d-none">
											<td>
												<div class="p-0" style="display: none;">
													<table class="table table-hover">
														<tbody>
															<tr data-widget="expandable-table" aria-expanded="false">
                                <td>
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="expandable-table-caret fas fa-caret-right fa-fw"></i>
                                  <i class="fas fa-file-alt"></i>&nbsp;&nbsp;&nbsp;파일
                                </td>
                              </tr>
															<tr class="expandable-body d-none">
                                <td>
                                  <div class="p-0" style="display: none; margin-left: 6vw !important;">
                                    <table class="table table-hover">
                                      <tbody>
																				<!-- txt 형식의 파일 리스트 -->
                                        <c:forEach var="projectFileVO"
																				items="${projectFileVOList}" varStatus="stat">
																					<c:if test="${projectFileVO.ganttChartsNo eq ganttVO.ganttChartsNo && projectFileVO.fileExt == 'xlsx'}">
																						<!-- <input type="checkbox" />&nbsp;&nbsp;&nbsp;&nbsp; -->
																						<label class="img-fluid imgFileSaveLocate" style="cursor:pointer;" data-file-save-locate="${projectFileVO.fileSaveLocate}"><i class='fas fa-file-alt'></i>&nbsp;&nbsp;${projectFileVO.fileOriginalName}</label><br>
																					</c:if>
																				</c:forEach>
                                      </tbody>
                                    </table>
                                  </div>
                                </td>
                              </tr>
															<tr data-widget="expandable-table" aria-expanded="false">
                                <td>
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="expandable-table-caret fas fa-caret-right fa-fw"></i>
                                  <i class="fas fa-image"></i>&nbsp;&nbsp;&nbsp;이미지
                                </td>
                              </tr>
															<tr class="expandable-body d-none">
                                <td>
                                  <div class="p-0" style="display: none; margin-left: 5vw !important;">
                                    <table class="table table-hover">
                                      <tbody>
																				<!-- jpg 형식의 파일 리스트 -->
																				<div class="col-sm-12 d-flex flex-wrap justify-content-start gap-3">
																					<c:forEach var="projectFileVO"
																					items="${projectFileVOList}" varStatus="stat">
																						<c:if test="${projectFileVO.ganttChartsNo eq ganttVO.ganttChartsNo && projectFileVO.fileExt == 'jpg'}">
																							<div class="d-flex align-items-center gap-2">
																								<div>
																									<img class="img-fluid imgFileSaveLocate" style="cursor:pointer; width: 100px; height: 100px; object-fit: cover; margin-left: 1vw;" 
																									data-file-save-locate="${projectFileVO.fileSaveLocate}" 
																									src="${projectFileVO.fileSaveLocate}" 
																									alt="${projectFileVO.fileOriginalName}" title="${projectFileVO.fileOriginalName}" />
																								</div>
																								<div class="divModalImg"
																									data-file-original-name="${projectFileVO.fileOriginalName}"
																									data-file-save-locate="${projectFileVO.fileSaveLocate}" 
																									style="cursor:pointer;" data-toggle="modal" data-target="#modalImgShow">
																									<i class="fas fa-search"></i>
																								</div>
																							</div>
																						</c:if>
																					</c:forEach>
																				</div>
                                      </tbody>
                                    </table>
                                  </div>
                                </td>
                              </tr>
														</tbody>
													</table>
												</div>
											</td>
										</tr>
									</tbody>
								</c:if>
							</c:forEach>
							<%-- </c:forEach> --%>
						</table>
					</div>
					</td>
					</tr>
					</tbody>
					</table>
				</div>
				</td>
				</tr>
				</tbody>
				</table>
			</div>
			<!-- /.card-body -->
		</div>
	</section>
</div>

<!-- 모달 시작 -->
<div class="modal fade show" id="modal-xl" style="display: none; padding-right: 17px;" aria-modal="true"
	role="dialog">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">파일 등록</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="frm" action="/manage/filebox/updateFileAjax" method="post" enctype="multipart/form-data">
					<div class="card-body">

						<div class="form-group" style="display: none;">
							<label for="ganttChartsNo">프로젝트 번호</label>
							<textarea id="ganttChartsNo" name="ganttChartsNo" class="form-control" rows="6"></textarea>
						</div>
						<div class="form-group">
							<label for="proJobNm">프로젝트명</label>
							<select id="proJobNm" name="proJobNm" class="form-control custom-select">
								<c:forEach var="ganttVO" items="${projectVO.ganttVOList}" varStatus="stat">
									<option data-pro-job-nm="${ganttVO.proJobNm}" value="${ganttVO.ganttChartsNo}">
										${ganttVO.proJobNm}
									</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="uploadFiles">첨부파일</label>
							<div class="input-group">
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="uploadFiles" name="uploadFiles" value=""
										multiple>
									<label class="custom-file-label" for="uploadFiles">파일 선택</label>
								</div>
							</div>
						</div>
						<div class="form-group" id="divImages">

						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer justify-content-between">
				<button id="btnSubmit" type="button" class="btn btn-primary">저장</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- 모달 끝 -->
<!-- /.card -->
</div>
</div>
</section>
<!-- ///// content 끝 ///// -->

<!-- 사진 모달 -->
<div class="modal fade" id="modalImgShow">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="modalImgName"></h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p id="modalImgBody"></p>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<script type="text/javascript">
$(function () {
	//파일 다운로드
	$(document).on("click",".imgFileSaveLocate",function(){
		//imgFileSaveLocate 클래스 속성을 갖고있는 요소들이 많은데 그 중 클릭한 바로 그 엘리먼트
		let fileSaveLocate = $(this).data("fileSaveLocate");// /resources/upload...
		//before : /resources/upload/project/이동관리계획/82462b65-4b8f-4681-bce9-e3e260820079_dad.jpg
		//after  : /project/이동관리계획/82462b65-4b8f-4681-bce9-e3e260820079_dad.jpg
		console.log("fileSaveLocate : " + fileSaveLocate);
		// 파일 다운로드를 위한 앞 이름 잘라내기
		fileSaveLocate = fileSaveLocate.replaceAll("/resources/upload","");

		///download?fileName=/project/이동관리계획/82462b65-4b8f-4681-bce9-e3e260820079_dad.jpg
		location.href="/download?fileName="+fileSaveLocate;
		
		return;
	});

	//이미지 크게 보기
	$(document).on("click",".divModalImg",function(){
		let fileOriginalName = $(this).data("fileOriginalName");
		let fileSaveLocation = $(this).data("fileSaveLocate");
		
		console.log("fileOriginalName : " + fileOriginalName);
		console.log("fileSaveLocation : " + fileSaveLocation);
		
		//모달에 반영
		$("#modalImgName").html(fileOriginalName);
		
		let str = "<img src='"+fileSaveLocation+"' style='width:60%; height: 60%' />";
		$("#modalImgBody").html(str);
	});


	/*
	function getList(){
		// 상세페이지
	
		let proNo = `${proNo}`;
		console.log("proNo", proNo);
	
		let data = {
			"proNo" : proNo
		}
		
		$.ajax({
			url: "/managepage/manage/fileboxInfo",
			contentType: "application/json;charset=utf-8",
			data: JSON.stringify(data),
			type: "post",
			dataType: "json",
			success: function (result) {
				console.log("result : ", result);
				// articlePage.content : List<ProjectVO>
				// console.log("articlePage.content : ", articlePage.content);
	
				let str = "";
				$.each(result, function (ganttChartsNo, ganttVOList) {
					str += `<tr>
										<p>\${ganttChartsNo}</p>
										<img style="width: 10%;" src="\${ganttVOList.proFileNo}" alt="로딩 실패">
									</tr>`;	// end each
	
					// 엘리먼트.append() : 누적 / 엘리먼트.html() : 덮어쓰기
					$("#tby").html(str);
				})
			}
		});
	};	
	getList();
	*/

	//모달창에서 기존 이미지 보이기
	$("#proJobNm").on("change", function () {
		let ganttChartsNo = $(this).val();

		console.log("ganttChartsNo : ", ganttChartsNo);

		$.ajax({
			url: "/managepage/manage/filebox/updateFileAjax",
			data: { "ganttChartsNo": ganttChartsNo },
			type: "post",
			success: function (result) {
				location.href = location.href;
				console.log("result : ", result);
			}
		});
	});

	// 파일 업로드
	$("#btnSubmit").on("click", function () {
		console.log("파일업로드");
		//1. 가상 폼(이미지 포함) <form></form>
		let formData = new FormData();

		let ganttChartsNo = $("#proJobNm").val();
		let proJobNm = $("#proJobNm option:selected").data("pro-job-nm");
		//ganttChartsNo:  9
		console.log("ganttChartsNo: ", ganttChartsNo);
		//proJobNm:  부모가 103
		console.log("proJobNm: ", proJobNm);
		formData.append("ganttChartsNo", ganttChartsNo);
		formData.append("proJobNm", proJobNm);


		//2. 엘리먼트들을 가상 폼에 넣기
		let inputFile = $("#uploadFiles");
		let files = inputFile[0].files;
		console.log("files : ", files);

		for (let i = 0; i < files.length; i++) {
			formData.append("uploadFiles", files[i]);
		}

		$.ajax({
			url: `/managepage/manage/updateFileAjax`,
			processData: false,
			contentType: false,
			data: formData,
			type: "post",
			dataType: "text",
			success: function (result) {
				console.log("result : ", result);

			}
		});
	});
	
	// 파일 업로드 시 이미지 미리보기
	$('#uploadFiles').on('change', function(event) {
		var files = event.target.files;
		console.log("이게 뭐징(files) : ", files);
		$.each(files, function(idx, file){
			var reader = new FileReader();

			reader.onload = function(e) {
				var img = $('<img>').attr('src', e.target.result);
				// 크기조절
				img.css("width", "20%");
				img.css("height", "20%");
				$('#divImages').append(img);
			};
			reader.readAsDataURL(file);
		})
	});
});
</script>
<%@ include file="../../include/footer.jsp" %>