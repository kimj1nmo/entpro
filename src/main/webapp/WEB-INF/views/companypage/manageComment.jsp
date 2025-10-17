<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- css -->
<link href="/directlyCss/postManage.css" rel="stylesheet">
<style>


</style>

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
		<h3>댓글 관리</h3>
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
										<div class="row">
                <div class="col-12 table-responsive">
                  <table class="table">
                    <thead>
                    <tr>
                      <th></th>
                      <th>게시글 내용</th>
                      <th>댓글 내용</th>
                      <th>글쓴이</th>
                      <th>작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="comment" items="${comment}" varStatus="stat">
                    <tr>
                      <td><input type="checkbox">
                      </td>
                      <td>${comment.commCn}
                      </td>
                      <td>${comment.cmmtCn}
                      </td>
                      <td>${comment.commRegNick}
                      </td>
                      <td>${comment.cmmtDate}
                      </td>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
                <!-- /.col -->
              </div>
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

<!-- ///// content 끝 ///// -->

<%@ include file="../include/footer.jsp"%>
