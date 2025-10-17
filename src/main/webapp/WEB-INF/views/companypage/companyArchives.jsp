<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>

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
						<li class="breadcrumb-item"><a href="/companypage/main">companypage</a></li>
						<li class="breadcrumb-item active">FAQ</li>
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
<link rel="stylesheet"
	href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- ///// content 시작 ///// -->

<section class="content">
	<div class="container-fluid">
		<!-- ///// content 시작 ///// -->
		<h3>직원 관리 목록</h3>
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">

					자료실 페이지입니다


					</div>
				</div>
				<!-- /.card-header -->

				<div class="card-body table-responsive p-0" id="divDetailArea">

				</div>
				<!-- /.card-body -->
				<!-- card-footer 시작 -->
				<div class="card-footer" id="divPagingArea"></div>
				<!-- card-footer 끝 -->
			</div>
			<!-- /.card -->

		</div>
		<div class="col-12" style="justify-content: right; display: flex;">
			<a data-toggle="modal" data-target="#modalAdd"
				class="btn btn-primary">등록</a>
		</div>



		<!-- ///// content 끝 ///// -->
	</div>
	<!-- /.container-fluid -->
</section>


<!-- /// 아티스트 등록 모달 시작 /// -->
<div class="modal fade" id="modalAdd">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">아티스트 추가</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!--  /// 내용 시작 /// -->
				<form>
					<div class="card-body">
						<div class="form-group">
							<label for="artistName">활동명</label> <input type="text"
								class="form-control" id="artistName" placeholder="이름" />
						</div>
						<div class="form-group">
							<label for="memId">아이디</label> <input type="text"
								class="form-control" id="memId" placeholder="아이디" />
							<button id="memIdChk" type="button"
								class="btn btn-block btn-success btn-sm">아이디확인</button>

						</div>
						<div class="form-group">
							<label for="artistProfile">프로필</label> <input type="text"
								class="form-control" id="artistProfile" placeholder="프로필" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">생일</label> <input type="date"
								class="form-control" id="artistBirth" placeholder="생일" />
						</div>

						<div class="form-group">
							<!-- private Date memBir;
            	2024-11-27
            	-->
							<label for="uploadFiles">회원사진</label> <input type="file"
								class="form-control" id="uploadFiles" name="uploadFiles"
								value="" placeholder="회원사진" multiple />
						</div>
						<div id="divImage"></div>

					</div>
				</form>
				<!--  /// 내용 끝 /// -->
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="btnRegist" class="btn btn-primary"
					disabled>등록</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /// 아티스트 등록 모달 끝 /// -->

<!-- /// 아티스트 수정 모달 시작 /// -->
<div class="modal fade" id="modalUpdate">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">아티스트 수정</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<!--  /// 내용 시작 /// -->
				<form>
					<div class="card-body">
						<div class="form-group">
							<label for="artistName">활동명</label> <input type="text"
								class="form-control" id="artistNameUp" placeholder="이름" />
						</div>
	<div class="form-group">

							<input type="text"	class="form-control" id="memIdUp" placeholder="아이디" hidden/>
							<input type="text"	class="form-control" id="artistNoUp" placeholder="넘버" hidden/>

						</div>
						<div class="form-group">
							<label for="artistProfile">프로필</label> <input type="text"
								class="form-control" id="artistProfileUp" placeholder="프로필" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">생일</label> <input type="date"
								class="form-control" id="artistBirthUp" placeholder="생일" />
						</div>

						<div class="form-group">
							<!-- private Date memBir;
            	2024-11-27
            	-->
							<label for="uploadFiles">회원사진</label> <input type="file"
								class="form-control" id="uploadFilesUp" name="uploadFiles"
								value="" placeholder="회원사진" multiple />
						</div>
						<div id="divImage"></div>

					</div>
				</form>
				<!--  /// 내용 끝 /// -->
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" id="btnUpdate" class="btn btn-primary"
					>수정</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /// 아티스트 수정 모달 끝 /// -->
<!-- ///// content 끝 ///// -->

<%@ include file="../include/footer.jsp"%>
