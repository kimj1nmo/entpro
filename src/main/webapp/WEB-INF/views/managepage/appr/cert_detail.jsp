<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../include/header.jsp"%>
<link rel="stylesheet" href="./directlyCss/project.css">
<link rel="stylesheet" href="/directlyCss/main.css">
<link rel="stylesheet" href="/directlyCss/appr.css">

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- sweetAlert -->
<link rel="stylesheet"
	href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- ///// content 시작 ///// -->
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
						<li class="breadcrumb-item"><a href="/managepage/main">managepage</a></li>
						<li class="breadcrumb-item"><a href="/managepage/appr/all">전자결재</a></li>
						<li class="breadcrumb-item active"><a href="/managepage/appr/cert_detail/${atrzDocNo }">재직증명서</a></li>
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

	<!-- 시자쿠~ -->
	 <div class="col-12">
		<div class="card-header1" >
		  <div>
			<h2 style="margin-left: 22%;"><b>재직증명서</b>
			${apprDocVO }
			</h2>
		  </div>
		</div>
			<div class="card-body">
  
  
			  <table border="" style="width: 90vh; height: 100px;">
				<colgroup>
				  <col style="width:20%;">
				  <col style="width:30%;">
				  <col style="width:20%;">
				  <col style="width:30%;">
				</colgroup>
				<tr>
				  <th id="tbTtl">기안부서</th>
				  <td id="tbCn">${apprDocVO.departName }
  
					<input type="text" id="proTtl" name="proTtl" class="ctrl" value="${projectVO.proTtl}" required hidden>
					<p class="ctrl_p" style="display : none;">${projectVO.proTtl}</p>
				  </td>
				  <th id="tbTtl">기안자</th>
				  <td id="tbCn">${apprDocVO.memberVO.memName }(${apprDocVO.atrzWriter })
				  </td>
				</tr>
				<tr>
				  <th id="tbTtl">문서번호</th>
				  <td id="tbCn">${apprDocVO.atrzDocNo }
					<input type="date" id="proRegDate" name="proRegDate" class="ctrl" value="${projectVO.proRegDate}" required hidden>
					<p class="ctrl_p" style="display : none;">${projectVO.proRegDate}</p>
				  </td>
				  <th id="tbTtl">보존 연한/보안 등급</th>
				  <td id="tbCn">${apprDocVO.atrzPreserved }년 / ${apprDocVO.atrzSecurity }등급
					<input type="date" id="proDeadline" name="proDeadline" class="ctrl" value="${projectVO.proDeadline}"  required hidden>
					<p class="ctrl_p" style="display : none;">${projectVO.proDeadline}</p>
				  </td>
				</tr>
			  <div class="form-group" style="display: none;">
				<label for="proNo"><b>프로젝트 번호</b></label>
				<textarea id="proNo" name="proNo" class="form-control" rows="6" value="${projectVO.proNo}">${projectVO.proNo}</textarea>
			  </div>
		</table>
	
	
	<table class="appr_table" style="width: 90vh;">
		<tr>
			<td id="team" rowspan="3" style="width: 12%;">결재</td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team" rowspan="3" style="width: 12%;">처리</td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
		</tr>
		<tr>
			<td id="stamp"></td>
			<td id="stamp"></td>
			<td id="stamp"></td>
			<td id="stamp"></td>
			<td id="stamp"></td>
			<td id="stamp"></td>
			<td id="stamp"></td>
		</tr>
		<tr>
			<td id="name"></td>
			<td id="name"></td>
			<td id="name"></td>
			<td id="name"></td>
			<td id="name"></td>
			<td id="name"></td>
			<td id="name"></td>
			<td id="name"></td>
		</tr>
	</table>
	<table style="width: 90vh;">
		<tr>
			<td class="ref_ttl" style="width: 12%;">참조</td>
			<td colspan="8">
				<input type="text" class="ref_in" placeholder="  클릭 후 입력"  autocomplete="off">

			</td>
		</tr>
	</table>
</div>
	<div class="app_contents">
		<p class="app_ttl">제목</p>
	</div>
<style>
.cert_table{
	border: none;
	width: 90vh;
	padding-right: 20000px;
}
.cert_table td, tr{
	border: none;
}
.cert_div{
	margin-left:20px;
	padding-top: 20px;
}
</style>

<div class="cert_div">
	<table class="cert_table">
		<tr>
			<td>○○주식회사</td>
			<td rowspan="2"colspan="2" style="font-size :34px; text-align:right;">LOGO</td>
		</tr>
		<tr>
			<td colspan="2">○○도 ○○시 ○○구 ○○로 123 ○○빌딩 1234호</td>
		</tr>
		<tr>
			<td colspan="2">Tel. 1234-5678 Fax.1234-0987 www.abcd.com</td>
		</tr>
		<tr>
			<td style="font-weight: bold; font-size: 40px; text-align: center;padding: 50px;" colspan="2">재&nbsp;&nbsp;&nbsp;직&nbsp;&nbsp;&nbsp;증&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;서</td>
		</tr>
		<tr>
			<td style="width: 20vh;">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td>
			<td>${apprDocVO.memberVO.memName }</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${apprDocVO.memberVO.memBir }</td>
		</tr>
		<tr>
			<td>소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;속</td>
			<td>${apprDocVO.departName }</td>
		</tr>
		<tr>
			<td>입&nbsp;&nbsp;&nbsp;사&nbsp;&nbsp;&nbsp;일 </td>
			<td>${apprDocVO.memberVO.memRegDate }</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;"><br/><br/>이 사람은 상기 입사일 이후 현재까지 당사에 재직 중임을 확인합니다.<br/><br/><br/></td>
		</tr>
		<tr>
			<td>제&nbsp;&nbsp;&nbsp;출&nbsp;&nbsp;&nbsp;처 </td>
			<td>대덕인재개발원</td>
		</tr>
		<tr>
			<td>용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;도 </td>
			<td>취업확인용</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center; font-size: 18px;"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center; font-size: 18px;"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center; font-size: 18px;"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center; font-size: 18px;"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center; font-size: 18px;">${apprDocVO.atrzDocDt } </td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center; font-weight: bold;font-size: 24px;">○○ 주식회사 대표이사 ○○○ </td>
		</tr>

	</table>
	
</div>
<div style="height: 100px;"></div>
<hr style="width: 90vh; margin-left:0;">
	<!-- 양식 끝~!~!~! -->
	<style>
		.addfile{
			background-color: transparent; border: 0; color: darkturquoise;
		}
		</style>
		<!-- 댓글 영역 시작~ -->
		<div class="comment_area">
		
				<div >
					<div class="top">
						<span style="padding-right: 20px;">별첨</span>
							<button class="addfile" id="fileBtn">파일 첨부</button>
						<span class="weakgray">|</span>
						<button class="addfile" id="docBtn">관련문서 첨부</button>
					</div>
					<div class="filebox">
						<span class="cont_file" style="float: left;">파일목록 여기에 추가하실게요~
						</span><br/><br/>
					</div>
				</div>
		<script>
			$("#fileBtn").click(function(){
				console.log("파일첨부한당!");
				$("#file_modal").modal("show");
			})
			$("#docBtn").click(function(){
				console.log("문서첨부한당!");
				$("#doc_modal").modal("show");
			})
		</script>
		
		
				<div class="card-header p-0 pt-1">
					<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" id="custom-tabs-one-home-tab" data-toggle="pill" href="#custom-tabs-one-home" role="tab" aria-controls="custom-tabs-one-home" aria-selected="true">의견</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="custom-tabs-one-profile-tab" data-toggle="pill" href="#custom-tabs-one-profile" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false">이력</a>
						</li>
					</ul>
				</div>
		
		
				<div class="card-body">
					<div class="tab-content" id="custom-tabs-one-tabContent">
						<div class="tab-pane fade active show" id="custom-tabs-one-home" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
							 <!-- 의견 여기다 -->
									<!-- (의견 탭)댓글양식 시작~ -->
									<div class="card-footer card-comments">
										<div class="card-comment">
											<!-- User image -->
											<img class="img-circle img-sm" src="../dist/img/user3-128x128.jpg" alt="User Image">
		
											<div class="comment-text">
												<span class="username">
													사용자 이름
													<span class="text-muted float-right">8:03 PM Today</span>
												</span><!-- /.username -->
												댓글내용입.
											</div>
											<!-- /.comment-text -->
										</div>
										<!-- /.card-comment -->
										<div class="card-comment">
											<!-- User image -->
											<img class="img-circle img-sm" src="../dist/img/user5-128x128.jpg" alt="User Image">
		
											<div class="comment-text">
												<span class="username">
													사용자
													<span class="text-muted float-right">8:03 PM Today</span>
												</span><!-- /.username -->
												댓글...
											</div>
											<!-- /.comment-text -->
										</div>
										<!-- /.card-comment -->
									</div>
		
									<!-- (의견 탭)댓글양식 종료~ -->
									<!-- (의견 탭)댓글입력창 시작~ -->
							<div class="card-footer">
								<form action="#" method="post">
									<div class="input-group">
										<input type="text" name="message" placeholder="Type Message ..." class="form-control">
										<span class="input-group-append">
											<button type="submit" class="btn btn-primary">Send</button>
										</span>
									</div>
								</form>
							</div>
							<!-- (의견 탭)댓글입력창 종료~ -->
		
						</div>
						
						<div class="tab-pane fade" id="custom-tabs-one-profile" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
		
							<!-- (이력 탭)댓글양식 시작~ -->
							<div class="card-footer card-comments">
								<div class="card-comment">
									<!-- User image -->
									<img class="img-circle img-sm" src="../dist/img/user3-128x128.jpg" alt="User Image">
		
									<div class="comment-text">
										<span class="username">
											사용자 이름
											<span class="text-muted float-right">8:03 PM Today</span>
										</span><!-- /.username -->
										댓글내용입.
									</div>
									<!-- /.comment-text -->
								</div>
								<!-- /.card-comment -->
								<div class="card-comment">
									<!-- User image -->
									<img class="img-circle img-sm" src="../dist/img/user5-128x128.jpg" alt="User Image">
		
									<div class="comment-text">
										<span class="username">
											사용자
											<span class="text-muted float-right">8:03 PM Today</span>
										</span><!-- /.username -->
										댓글...
									</div>
									<!-- /.comment-text -->
								</div>
								<!-- /.card-comment -->
							</div>
		
							<!-- (이력 탭)댓글양식 종료~ -->
							
		
						</div>
					</div>
				<!-- </div> -->
		
				<!-- /.card -->
			<!-- </div> -->
		<!-- </div> -->
		<!-- 댓글 영역 종료~ -->
		</div>
		<div style="height: 100px;"></div>
		<%@ include file="../../include/footer.jsp" %>  
		
		
		
		
		<!-- 첨부파일 모달 들어가실게요~ -->
		<div class="modal fade show" id="file_modal" style="display: none; padding-right: 17px;" aria-modal="true" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">관련문서 첨부</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body" >
						<div style="border: 5px dashed #ddd; width: 100%;">
							<p>별첨</p>
							<input type="file" value="파일추가">
							<br/>
						</div>
					</div>
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- 첨부파일 모달 나가실게요~ -->
		<!-- 문서첨부 모달 들어가실게요~ -->
		<div class="modal fade show" id="doc_modal" style="display: none; padding-right: 17px;" aria-modal="true" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">관련 문서 첨부</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<section class="content">
							<div class="container-fluid">
												<div class="card">
											<div class="card-header">
												<h3 class="card-title">전체</h3>
												<p></p>
												<div class="card-tools">
													<div class="input-group input-group-sm" style="width: 150px;">
														<input type="text" name="keyword" value="" class="form-control float-right" placeholder="검색어 입력">
						
														<div class="input-group-append">
															<button type="button" id="btnSearch" class="btn btn-default">
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
															<th class="fNo">문서 번호</th>
															<th class="fTitle">제목</th>
															<th class="fName">기안자</th>
															<th class="fDate">기안일</th>
															<th class="fDiv">구분</th>
															<th class="fState">상태</th>
													</tr>
												</thead>
												<tbody id="tby">
													<tr>
																				
														<td class="fNo">TE-재직-20250108-0001</td>
														<td class="fTitle"><a href="addr_detail">[시험 사용] 푸미서</a></td>
														<td class="fName">5관리자</td>
														<td class="fDate">2025-01-08</td>
														<td class="fDiv"><span class="tag tag-success">기안</span></td>
														<td class="fState">진행</td>
													</tr>
													<tr>
														<td class="fNo">TE-재직-20250108-0001</td>
														<td class="fTitle"><a href="con_detail">[시험 사용] 엄무열락/td&gt;
														</a></td><td class="fName">5관리자</td>
														<td class="fDate">2025-01-08</td>
														<td class="fDiv"><span class="tag tag-success">기안</span></td>
														<td class="fState">진행</td>
													</tr>
													<tr>
														<td class="fNo">TE-재직-20250108-0001</td>
														<td class="fTitle"><a href="cert_detail">[시험 사용] 제직중명서</a></td>
														<td class="fName">5관리자</td>
														<td class="fDate">2025-01-08</td>
														<td class="fDiv"><span class="tag tag-success">기안</span></td>
														<td class="fState">진행</td>
													</tr>
													<tr>
														<td class="fNo">TE-재직-20250108-0001</td>
														<td class="fTitle">[시험 사용] 으걀걀</td>
														<td class="fName">5관리자</td>
														<td class="fDate">2025-01-08</td>
														<td class="fDiv"><span class="tag tag-success">기안</span></td>
														<td class="fState">진행</td>
													</tr>
																				</tbody>
											</table>
										</div>
										<div class="card-body table-responsive p-0" id="divDetailArea">
										</div>
										<!-- /.card-header -->
										</div>
						<div id="plusDoc">
							첨부영역
						</div>
						
										<div class="card-footer" id="divPagingArea"></div>
											</div>
											<!-- /.card-body -->
										</section>
					</div>
					
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		
		
		
		
		
		
		<!-- 문서첨부 모달 나가실게요~ -->
		 