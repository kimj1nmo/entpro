<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- ///// header 시작 ///// -->
<jsp:include page="../../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="/directlyCss/main.css">
<link rel="stylesheet" href="/directlyCss/project.css">
<link rel="stylesheet" href="/directlyCss/appr.css">

<!-- ///// header 끝 ///// -->
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
						<li class="breadcrumb-item active">여기 입력필요</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!--  /.content-header -->

	<!-- .......... body 시작 .......... -->
	 
<style>

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<div id="wrapper">
<div id="pageTtl" class="card-header1" >
	<div>
		<h2 id="pageTtlCn"><b>   프로젝트 기안서</b></h2>
	</div>
	<table id="apprSetting" border="" style="width: 90vh; height:100px;">
		<!-- <caption>전자결재 기본 설정</caption> -->
		<colgroup>
			<col style="width:20%;">
			<col style="width:30%;">
			<col style="width:20%;">
			<col style="width:30%;">
		</colgroup>
		<tbody id="tableBody">
			<tr>
				<th scope="row" id="tbTtl">문서 종류</th>
				<td id="tbCn">
					<select id="formSelect" autocomplete="off">
						<option value="" selected>문서 종류를 선택하세요</option>
						<option value="100" >품의서</option>
						<option value="101" disabled>지출 결의서</option>
						<option value="102" disabled>(기업용) 공문</option>
						<option value="103">업무연락</option>
						<option value="104">재직증명서</option>
						<option value="105" disabled>(비영리 기관용) 공문</option>
					</select>
				</td>
				<th scope="row" id="tbTtl">작성자</th>
				<td id="tbCn">
					<input id="writer" type="hidden" value="e001"><span>이공공</span></input>
				</td>
			</tr>
			<tr>
				<th scope="row" id="tbTtl">보존 연한</th>
				<td id="tbCn">
					<select id="preservedTerm">
						<option value="">보존 연한</option>
							<option value="1">1년</option>
							<option value="3">3년</option>
							<option value="5">5년</option>
							<option value="10">10년</option>
							<option value="0">영구</option>
					</select>
				</td>
				<th scope="row" id="tbTtl">보안 등급</th>
					<td id="tbCn">
						<select id="security_level">
							<option value="">보안 등급</option>
								<option value="S">S등급</option>
								<option value="A">A등급</option>
								<option value="B">B등급</option>
								<option value="C">C등급</option>
						</select>
					</td>
			</tr>
		</tbody>
	</table>
	<hr />

	<div id="after">
		<div id="appr-title">
			<h4>결재선</h4>
			<!-- <button type="button" id="apprbtn" onclick="ApprovalDocument.get()">결재선설정</button> -->
		</div>
	</div>
	<div id="approvalDocumentLine">
		문서 종류 선택 시 결재선이 노출됩니다.
	</div>

<!-- .......... 품의서 결재선 시작 .......... -->
<div id="apprTable" style="display:none;">
	<button type="button" id="addrSelect" style="display: inline-block;">결재선설정</button>
	<table style="width: 90vh;">
		<tr>
			<td rowspan="3" style="width: 12%;">결재</td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
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
		</tr>
	</table>
	<table style="width: 90vh;">
		<tr>
			<td rowspan="3" style="width: 12%;">합의</td>
			<td >2</td>
			<td >3</td>
			<td rowspan="3" style="width: 12%;">재무 합의</td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td id="stamp"></td>
			<td id="stamp"></td>
			<td id="stamp"></td>
			<td id="stamp"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td id="name"></td>
			<td id="name"></td>
			<td id="name"></td>
			<td id="name"></td>
		</tr>
	</table>
	<table style="width: 90vh;">
		<tr>
			<td style="width: 12%;">참조</td>
			<td colspan="8">
				<input type="text" class="refer-add js-complete ui-autocomplete-input" placeholder="클릭 후 입력" id="inputApprovalFourthLine" autocomplete="off">

			</td>
		</tr>
	</table>
</div>
<!-- .......... 품의서 결재선 종료 ........ -->
<!-- .......... 업무연락 결재선 시작 .......... -->
<div id="apprTable103" style="display:none;">
	<button type="button" id="addrSelect" style="display: inline-block;">업무연락 결재선설정</button>
	<table style="width: 90vh;">
		<tr>
			<td rowspan="3" style="width: 12%;">결재</td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
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
		</tr>
	</table>
	<table style="width: 90vh;">
		<tr>
			<td rowspan="3" style="width: 12%;">합의</td>
			<td >2</td>
			<td >3</td>
			<td rowspan="3" style="width: 12%;">재무 합의</td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td id="stamp"></td>
			<td id="stamp"></td>
			<td id="stamp"></td>
			<td id="stamp"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td id="name"></td>
			<td id="name"></td>
			<td id="name"></td>
			<td id="name"></td>
		</tr>
	</table>
	<table style="width: 90vh;">
		<tr>
			<td style="width: 12%;">참조</td>
			<td colspan="8">
				<input type="text" class="refer-add js-complete ui-autocomplete-input" placeholder="클릭 후 입력" id="inputApprovalFourthLine" autocomplete="off">

			</td>
		</tr>
	</table>
</div>
<!-- .......... 업무연락 결재선 종료 ........ -->
<!-- .......... 재직증명서 결재선 시작 .......... -->
<div id="apprTable104" style="display:none;">
	<button type="button" id="addrSelect" style="display: inline-block;">재직증명서 결재선설정</button>
	<table style="width: 90vh;">
		<tr>
			<td rowspan="3" style="width: 12%;">결재</td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
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
		</tr>
	</table>
	<table style="width: 90vh;">
		<tr>
			<td rowspan="3" style="width: 12%;">합의</td>
			<td >2</td>
			<td >3</td>
			<td rowspan="3" style="width: 12%;">재무 합의</td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td id="stamp"></td>
			<td id="stamp"></td>
			<td id="stamp"></td>
			<td id="stamp"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td id="name"></td>
			<td id="name"></td>
			<td id="name"></td>
			<td id="name"></td>
		</tr>
	</table>
	<table style="width: 90vh;">
		<tr>
			<td style="width: 12%;">참조</td>
			<td colspan="8">
				<input type="text" class="refer-add js-complete ui-autocomplete-input" placeholder="클릭 후 입력" id="inputApprovalFourthLine" autocomplete="off">

			</td>
		</tr>
	</table>
</div>
<!-- .......... 재직증명서 결재선 종료 ........ -->

	<br/><br/>
	<div id="writeInput">
		<h4 id="inputTitle">본문</h4>
		<div id="title">
		</div>
	</div>

	<!-- <h4 id="inputCn">상세 입력</h4> -->
	<div id="contentInform">문서 종류 선택 시 상세 입력이 노출됩니다.</div>
	<br />



<!-- .......... 품의서 텍스트본문 시작 .......... -->
<div id="contentWrapper" style="display:none;">
	<div id="content">
		<input width="90vh" type="text" name="approval_document_title" id="approval_document_title" placeholder="제목을 입력해 주세요." value="" oninput="checkTitleLength(this)" tabindex="-1">
	</div>
	<br/>
	<link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/44.1.0/ckeditor5.css">

	<div id="container">
		<div id="editor"></div>
	</div>
</div>
<!-- .......... 품의서 텍스트본문 종료 ..........-->
<!-- .......... 업무연락 텍스트본문 시작 .......... -->
<div id="contentWrapper103" style="display:none;">
	<div id="content">
		<input width="90vh" type="text" name="approval_document_title" id="approval_document_title" 
		placeholder="업무연락 제목을 입력해 주세요." value="" oninput="checkTitleLength(this)" tabindex="-1">
	</div>
	<br/>
	<link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/44.1.0/ckeditor5.css">

	<div id="container">
		<div id="editor103"></div>
	</div>
</div>
<!-- .......... 업무연락 텍스트본문 종료 ..........-->
<!-- .......... 재직증명서 텍스트본문 시작 .......... -->
<div id="contentWrapper104" style="display:none;">
	<div id="content">
		<input width="90vh" type="text" name="approval_document_title" id="approval_document_title" 
		placeholder="재직증명서 제목을 입력해 주세요." value="" oninput="checkTitleLength(this)" tabindex="-1">
	</div>
	<br/>
	<link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/44.1.0/ckeditor5.css">

	<div id="container">
		<div id="editor104"></div>
	</div>
</div>
<!-- .......... 재직증명서 텍스트본문 종료 ..........-->


				</div><!-- /.wrapper -->
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

<%@ include file="../../include/footer.jsp" %>  







<!-- .......... script 시작 .......... -->
<script type="text/javascript">
	$("#formSelect").on("change", function(){
		const selectedValue= $(this).val(); // 선택된 값 가져오기
		console.log("뭐해;;selectedValue : ", selectedValue);
		
		if(selectedValue === "100"){//품의서
			console.log("100 selected");
			
			$("#contentInform").css("display", "none");
			$("#approvalDocumentLine").css("display", "none");
			$("#apprTable103").css("display", "none");
			$("#apprTable104").css("display", "none");
			$("#contentWrapper103").css("display", "none");
			$("#contentWrapper104").css("display", "none");
			
			//품의서 결재선
			$("#apprTable").css("display", "block");
			//품의서 본문
			$("#contentWrapper").css("display", "block");
		}else if(selectedValue === "103"){//업무연락
			console.log("103 selected");
			//공통
			$("#contentInform").css("display", "none");
			$("#approvalDocumentLine").css("display", "none");
			$("#apprTable").css("display", "none");
			$("#apprTable104").css("display", "none");
			$("#contentWrapper").css("display", "none");
			$("#contentWrapper104").css("display", "none");
			
			//업무연락 결재선
			$("#apprTable103").css("display", "block");
			//업무연락 본문
			$("#contentWrapper103").css("display", "block");
		}else if(selectedValue === "104"){//재직증명서
			console.log("104 selected");
			//공통
			$("#contentInform").css("display", "none");
			$("#approvalDocumentLine").css("display", "none");
			$("#apprTable").css("display", "none");
			$("#apprTable103").css("display", "none");
			$("#contentWrapper").css("display", "none");
			$("#contentWrapper103").css("display", "none");
			
			//재직증명서 결재선
			$("#apprTable104").css("display", "block");
			//재직증명서 본문
			$("#contentWrapper104").css("display", "block");
		}else{
			//공통
			$("#contentInform").css("display", "block");
			$("#approvalDocumentLine").css("display", "block");
			
			//결재선
			$("#apprTable").css("display", "none");
			$("#apprTable103").css("display", "none");
			$("#apprTable104").css("display", "none");
			//본문
			$("#contentWrapper").css("display", "none");
			$("#contentWrapper103").css("display", "none");
			$("#contentWrapper104").css("display", "none");
		}
	})
</script>




<!-- .......... script 종료 .......... -->
<style>
	#rowFlex {
		display: flex;
		justify-content: space-between; /* div들 사이 간격을 동일하게 */
		width: 100%;
		height: auto;
	}
#searchEmp{
	display: flex;
	align-items: center;
	gap: 5em;
	position: relative; 
	display: inline-block; 
}
#searchEmp input{
	width: 25vh;
}
#addrNames{
	/* border: 1px solid #ddd; 
	height: 65vh; 
	width: 35vh;  
	padding: 10px; */
	border: 2px solid #ddd;
	padding: 20px;
	width: 35vh;
	height: 75vh; /* 내용에 따라 조정 */
	/* display: flex; */
}
#schBox{
	border: 1px solid #ddd; padding-right: 24px; padding-left: 8px; width: 100%; box-sizing: border-box;
}
#aplBtn{
	display: flex; flex-direction: column; align-items: right; gap: 5px;
}
#aplTextarea{
	border: 1px solid #ddd; height: 65vh; width: 50vh;
}
#aplRef{
	border: 1px solid #ddd;
}
#right{
	display: flex;
	flex-direction: column;
	gap: 10px;
	width: 80vh;
}
#right div{
	border: 2px solid #ddd;
	padding: 20px;
	width: 100%;
	text-align: center;
}
.search-icon {
		position:absolute;
		left: 225px;
		top: 50%;
		transform: translateY(-50%);
		pointer-events: none; /* 클릭되지 않도록 설정 */
}

.refresh-icon {
		margin-left: 10px; /* `input`과 새로고침 아이콘 간의 간격 */
		cursor: pointer;
}
</style>

<!-- .......... Modal 결재선 시작 .......... -->

<div class="modal fade show" id="modalAddr" area-hidden="true" style="display: none;  padding-right: 17px;" aria-modal="true" role="dialog">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
<!-- .......... //// Modal 헤더영역 //// .......... -->
			<div class="modal-header">
				<h4 class="modal-title">결재선설정</h4><br/>



				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<!-- .......... ////. Modal 헤더영역 ////.......... -->


			<!-- .......... //// Modal 바디영역 //// .......... -->
			<div class="modal-body modal-scrollable">
		 <div id="rowFlex" style="display: flex; align-items: center; gap: 10px;">

		

			<!-- .......... 직원영역 .......... -->
			<div id="addrNames">
							<!-- .......... 검색영역 .......... -->
						<div id="searchEmp" >
						    <input type="text" id="schBox">
						    <svg class="search-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16" style="position: absolute; right: 8px; top: 50%; transform: translateY(-50%);">
						        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
						    </svg>
							<!-- 새로고침 아이콘 -->
							<svg class="refresh-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
									<path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2z"/>
									<path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466"/>
							</svg>
						</div>
							<!-- .......... /. 검색영역 .......... -->
				 
			</div>


			<!-- .......... /. 직원영역 .......... -->
			<!-- ..........    버튼영역 .......... -->
			<div id="aplBtn">
			<button type="button" id="addBtn" style="margin: 5px;">결재</button>
			<button type="button" id="btnSec" style="margin: 5px;"">합의</button>
			<button type="button" id="btnThr" style="margin: 5px;">재무합의</button>
			<button type="button" id="btnFou" style="margin: 5px;">참조</button>
			</div>
			<!-- .......... /. 버튼영역 .......... -->
<!-- 결재선, 참조 div box -->
			<div id="right">
			<div id="aplTextarea">
				<textarea id="approval-line" rows="10" cols="30" placeholder="결재선이 여기에 표시됩니다."></textarea>
			</div>
			
			<!-- ..........  참조영역 .......... -->
			<div id="aplRef">dd</div>

			
			
			<!-- .......... /. 참조영역 .......... -->
		</div>
<!-- /. 결재선, 참조 div box -->
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
		</div> <!-- end RowFlex -->
				
				
				
			<!-- .......... ////. Modal 바디영역 ////.......... -->
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

<script type="text/javascript">

$("#addrSelect").click(function(){
	console.log("ㅋㅋ");
	$("#modalAddr").modal("show");

})
























</script>


<!-- .......... Modal 결재선 종료 .......... -->
























<!-- .......... ckeditor 스크립트 시작 ........... -->
<!--
	The "superbuild" of CKEditor&nbsp;5 served via CDN contains a large set of plugins and multiple editor types.
	See https://ckeditor.com/docs/ckeditor5/latest/installation/getting-started/quick-start.html#running-a-full-featured-editor-from-cdn
-->
<script src="https://cdn.ckeditor.com/ckeditor5/41.4.2/super-build/ckeditor.js"></script>
<script src="/js/ckeditor_script.js"></script>
	<!-- .......... ckeditor 스크립트 종료 ........... -->