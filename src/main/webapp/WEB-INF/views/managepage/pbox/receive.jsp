<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../include/header.jsp" %>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/directlyCss/main.css">
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
                  <li class="breadcrumb-item"><a href="/companypage/main">managepage</a></li>
                  <li class="breadcrumb-item active">FAQ</li>
               </ol>
            </div>
            <!-- /.col -->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
   </div>




전자결재페이지 
문서함 - 4 수신<br />
<br />
managepage/pbox/write.html 작성하기 1 <br />
managepage/appr/all.html 전체 2<br />
managepage/appr/wait.html 대기 3<br />
managepage/appr/check.html 확인 4<br />
managepage/appr/will.html 예정 5<br />
managepage/appr/process.html 진행 6<br />

managepage/pbox/all.html 전체 1<br />
managepage/pbox/draft.html 기안 2<br />
managepage/pbox/approve.html 결재 3<br />
managepage/pbox/receive.html 수신 4<br />
managepage/pbox/viewer.html 회람/참조 5<br />
managepage/pbox/stop.html 반려 6<br />               </div>
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

<%@ include file="../../include/footer.jsp" %>  