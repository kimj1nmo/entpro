<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../include/header.jsp"%>

<!-- sweetAlert -->
<link rel="stylesheet"
	href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>

<style>
.fNo {
	text-align: center;
	width: 200px;
}
.fTitle{
	text-align: left;
	width: 545px;
}
.fName, .fDate, .fDiv, .fState{
	text-align: center;
	width: 145px;
}
/* <span class="tag tag-success">${apprDocVO.atrzStep}</span> */
</style>

<link 
 rel="stylesheet" 
 href="/directlyCss/main.css"
/>
<link 
 rel="stylesheet" 
 href="/directlyCss/project.css"
/>
<link 
 rel="stylesheet" 
 href="/directlyCss/appr.css"
/>





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
					<div class="card-header">
						<h3 class="card-title"><h2><b>완료된 문서함</b></h2>
						</h3>
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


				<div class="card-body table-responsive p-0">
				
					<!-- 성명으로 오름차순 정렬 -->
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
							  <th class="fNo">문서 번호</th>
			                  <th class="fTitle">제목</a></th>
			                  <th class="fName">기안자</th>
			                  <th class="fDate">기안일</th>
			                  <th class="fDiv">구분${apprDocVO.atrzFormNo }</th>
			                  <th class="fState">상태</th>
							</tr>
						</thead>
						<tbody id="tby">
						<c:forEach var="apprDocVO" items="${articlePage.content}" varStatus="stat">
						
						<c:set var="link" value="#" />

						<c:if test="${apprDocVO.atrzFormNo == 100}">
						    <c:set var="link" value="addr_detail/" />
						</c:if>
						<c:if test="${apprDocVO.atrzFormNo == 103}">
						    <c:set var="link" value="con_detail/" />
						</c:if>
						<c:if test="${apprDocVO.atrzFormNo == 104}">
						    <c:set var="link" value="cert_detail/" />
						</c:if>
						
							<tr>
								<td class="fNo">${apprDocVO.rnum}</td>
								<td class="fTitle" ><a href="${link}${apprDocVO.atrzDocNo}">${apprDocVO.atrzDocNm}</a></td>
								<td class="fName">${apprDocVO.atrzWriter}</td>
								<td class="fDate"><fmt:formatDate value="${apprDocVO.atrzDocDt}" pattern="yyyy-MM-dd" /></td>
								<td class="fDiv">
								
								
<%-- 								<c:set var="apprDocVO.atrzStep" value="부장" scope="session"/> --%>
									<c:choose>
									    <c:when test="${apprDocVO.atrzStep == 0}">
									        <span class="tag tag-success">완료</span>
									    </c:when>
									    <c:when test="${apprDocVO.atrzStep == 1}">
									        <span class="tag tag-success">진행</span>
									    </c:when>
									    <c:otherwise>
									        <span class="tag tag-success">기타</span>
									    </c:otherwise>
									</c:choose>
								</td>
								<td class="fState">
 
 
 
									<!-- 조건문 시작 -->
									<c:choose>
									    <c:when test="${apprDocVO.atrzDocState == 1}">
									        <span class="tag tag-success">기안</span>
									    </c:when>
									    <c:when test="${apprDocVO.atrzDocState == 2}">
									        <span class="tag tag-success">승인</span>
									    </c:when>
									    <c:when test="${apprDocVO.atrzDocState == 3}">
									        <span class="tag tag-success">반려</span>
									    </c:when>
									    <c:when test="${apprDocVO.atrzDocState == 4}">
									        <span class="tag tag-success">결재완료</span>
									    </c:when>
									    <c:otherwise>
									        <span class="tag tag-success">기타</span>
									    </c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
						
							<tr>
								<td class="fNo">20</td>
								<td class="fTitle" ><a href="/managepage/appr/pt_addr_detail">차세대 시스템 도입을 위한 신규 서버 및 개발 장비 구매 요청</td>
								<td class="fName">김은대</td>
								<td class="fDate">2025-02-04</td>
								<td class="fDiv"><span class="tag tag-success">기안</span></td>
								<td class="fState">완료</td>
							</tr>
							
					                  </tbody>
					</table>
				</div>
				<div class="card-body table-responsive p-0" id="divDetailArea">
				</div>
				<!-- /.card-header -->
				</div>


          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
    </div>





























</div>
            </div>
            <!-- /.card-header -->

            <div class="card-body table-responsive p-0" id="divDetailArea">

            </div>
            <!-- /.card-body -->
            <!-- card-footer 시작 -->
            <div class="card-footer" id="divPagingArea" style="display : flex; justify-content: center; align-content: center;">${articlePage.pagingArea }
            </div>
            <!-- card-footer 끝 -->
         </div>
         <!-- /.card -->

      </div>



      <!-- ///// content 끝 ///// -->
   </div>
   <!-- /.container-fluid -->
</section>

<!-- <%@ include file="../../include/footer.jsp" %>   -->