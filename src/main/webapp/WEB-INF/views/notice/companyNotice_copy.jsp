<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header_user2.jsp" %>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- SweetAlert2 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<!-- SweetAlert2 JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- Axios -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

  
  
  <!-- ///// header 끝 ///// -->

  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Notice</h3>

          <div class="card-tools">
            <div class="input-group input-group-sm" style="width: 150px;">
              <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

              <div class="input-group-append">
                <button type="submit" class="btn btn-default">
                  <i class="fas fa-search"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
        <!-- /.card-header -->
        <div class="card-body table-responsive p-0">
          <table class="table table-hover text-nowrap">
            <thead>
              <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>업로드날짜</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="NoticeVO" items="${articlePage.content}" varStatus="stat">
            <tr>
            <td>${NoticeVO.ntceBoardNo }</td>
            <td>${NoticeVO.ntceBoardTtl }</td>
            <td>${NoticeVO.regDate }</td>
            
            </tr>
            
            </c:forEach>
            </tbody>
          </table>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
  </div>

<!-- 게시판 종료 -->

<!-- /. modal시작 -->
<div class="modal fade" id="modalDetail" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content" style="overflow-y: auto;">
			<div class="modal-header">
				<h4 class="modal-title" id="modalImgName">Large Modal</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

			</div>
			<div class="modal-body modal-scrollable">
				<h6 class="modal-date">작성일자<br /></h4> 
				<p id="modalContent">내용</p> 
				<p id="modalImgBody"></p> 
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default copy-btn" onclick="copyUrl()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-copy" viewBox="0 0 16 16">
				<path fill-rule="evenodd" d="M4 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 5a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1v-1h1v1a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h1v1z"/></svg></button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /. modal 종료  -->



























<%@ include file="../include/footer.jsp" %>  