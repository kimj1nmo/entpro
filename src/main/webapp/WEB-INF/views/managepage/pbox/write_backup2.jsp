<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- ///// header 시작 ///// -->
<%@ include file="../../include/header.jsp"%>
<script 
src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"
></script>
<!-- css -->
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

 <!-- Additional icon fonts. Wunderbaum uses bootstrap icons by default. -->
<link
 rel="stylesheet"
 href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
/>
<!-- Wunderbaum CSS and Library -->
<link
 rel="stylesheet"
 href="https://cdn.jsdelivr.net/npm/wunderbaum@0/dist/wunderbaum.min.css"
/>
<script
 defer
 src="https://cdn.jsdelivr.net/npm/wunderbaum@0/dist/wunderbaum.umd.min.js"
></script>
<!-- Your application code -->
<script>

/* wunderbaum 실행 함수 시작 */
let selectedMember=[];
// 각 트리에 사용할 데이터를 별도로 정의

// 트리 구조로 변환하는 함수
function buildTree(flatData) {
	// flatData.sort((a, b) => a.DEPART_PARENT - b.DEPART_PARENT || a.DEPART_NO - b.DEPART_NO);
	flatData.sort((a, b) => 
		a.DEPART_PARENT - b.DEPART_PARENT || 
		a.DEPART_NO - b.DEPART_NO || 
		b.POS_NO - a.POS_NO // POS_NO를 내림차순으로 정렬
	);
  const departmentMapping = {}; // 부서별로 트리 구조 저장
  const tree = []; // 최상위 트리
	
  flatData.forEach((item) => {
		const {  DEPART_NO ,DEPART_NAME, DEPART_PARENT, MEM_ID, POS_NO, POS_NAME, MEM_NAME } = item;
    
		// 부서가 이미 존재하지 않으면 초기화
    if (!departmentMapping[DEPART_NO]) {
			departmentMapping[DEPART_NO] = {
        title: DEPART_NAME,
				departName: DEPART_NAME, // 부서 이름 추가
        children: [], // 직원들을 추가할 배열
      };
			
      // 최상위 부서라면 트리에 추가
      if (DEPART_PARENT ===0 || DEPART_PARENT == null || DEPART_PARENT === 'undefined') {
				tree.push(departmentMapping[DEPART_NO]);
      } else {
				// 상위 부서에 연결
        const parent = departmentMapping[DEPART_PARENT];
        if (parent) {
          parent.children.push(departmentMapping[DEPART_NO]);
        }
      }
    }
    // 직원을 해당 부서에 추가
    if (MEM_NAME) {
			departmentMapping[DEPART_NO].children.push({
        title: MEM_NAME + `(` + POS_NAME + `)`,
				departName: DEPART_NAME, // 부서 이름 추가
				posName: POS_NAME,
				icon : 'fa-regular fa-user'
      });
    }
  });
  return tree;
}

/* wunderbaum 실행 함수 종료 */
// DOMContentLoaded 이벤트
document.addEventListener("DOMContentLoaded", () => {
  // 데이터를 서버에서 가져오기
  fetch('/managepage/getTreeData')
    .then((response) => response.json())
    .then((flatData) => {
      // 트리 구조로 변환
      const treeData = buildTree(flatData);
      // Wunderbaum 초기화
      const tree = new mar10.Wunderbaum({
        element: document.getElementById("demo-tree1"),
        source: treeData, // 변환된 트리 데이터를 사용
        init: (e) => {
          e.tree.setFocus();
                                                                                        },
        activate: (e) => {
          // console.log(`Activated:`+ e.node.title);
					if (!e.node.children || e.node.children.length === 0) {// 잎노드일 때만 selectedMember에 저장
            // selectedMember = e.node.title + e.node.id; 
						selectedMember.push({
							id: e.node.id,
							title: e.node.title,
							departName: e.node.data.departName, // 부서 이름 추가
							posName: e.node.data.posName,       // 직급 이름 추가
						});
            // console.log(`Activated: \${e.node.title}`); // 잘 동작함
          }
					selectedMember.forEach(member => { // 잘 담김
						console.log("Title:", member.title);
						console.log("Department:", member.departName);
						console.log("Position:", member.posName);
					});
        },
      });
    })
    .catch((error) => console.error('Error fetching tree data:', error));
});



/* 
// demo-tree2 설정
document.addEventListener("DOMContentLoaded", () => {
  const tree2 = new mar10.Wunderbaum({
    element: document.querySelector("#demo-tree2"),
    source: data2,
    init: (e) => {
      e.tree.setFocus();
    },
    activate: (e) => {
      console.log("Tree 2 Active Node:", e.node.title);
    },
  });
});

// demo-tree3 설정
document.addEventListener("DOMContentLoaded", () => {
  const tree3 = new mar10.Wunderbaum({
    element: document.querySelector("#demo-tree3"),
    source: data3,
    init: (e) => {
      e.tree.setFocus();
    },
    activate: (e) => {
      console.log("Tree 3 Active Node:", e.node.title);
    },
  }); */
// });

</script>



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
						<li class="breadcrumb-item"><a href="/managepage/appr/all">전자결재</a></li>
						<li class="breadcrumb-item active"><a href="/managepage/pbox/write">기안하기</a></li>
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
	 
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->


<div id="wrapper">
<div id="pageTtl" class="card-header1" >
	<div style=" width: 120vh; display: flex; justify-content: left; align-items: space-between;">
		<h2 id="pageTtlCn" style="margin: 50px; margin-left: 0; margin-top: 0; width: 120vh; display: flex; justify-content: left; align-items: space-between;"><b>   기안하기</b></h2>
		${memberVO}
			<button  id="submitButton"
				 style="background-color: greenyellow;width:15vh; height:50px; font-size: 18px; vertical-align: middle; align-items: center;" >등록</button>
	</div><!-- data-toggle="modal" data-target="#modalAdd" -->
	<table id="apprSetting" border="" style="width: 120vh; height:100px;">
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
					<input id="writer" type="hidden" value="e001"><span><p>${memberVO.memName}(${memberVO.memId})</p></span></input>
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
						<select id="securityLevel">
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
	<hr style="width: 120vh; margin-left:0"/>

		<div id="appr-title">
			<div id="approvalDocumentLine" style="margin-bottom: 8px;" >
				<h4>결재선</h4>
				문서 종류 선택 시 결재선이 노출됩니다.
		</div>
	</div>

<!-- .......... 품의서 결재선 시작 .......... -->
<div  id="apprTable100" style="display:none;">
		<div id="appr-title">
			<h4 style="display: inline-block;">결재선</h4>
			<button class="addr_select" type="button" id="addrSelect100">품의서 결재선설정</button>
		</div>
	
	<table class="appr_table" style="width: 120vh;">
		<tr>
			<td id="team" rowspan="4" style="width: 12%;">결재</td>
			<td id="team">부서:${memberVO.departNo}</td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
			<td id="team"></td>
		</tr>
		<tr>
			<td id="team">직급:${memberVO.posNo}</td>
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
			<td id="name">이름 : ${memberVO.memName}</td>
			<td id="name"></td>
			<td id="name"></td>
			<td id="name"></td>
			<td id="name"></td>
			<td id="name"></td>
			<td id="name"></td>
		</tr>
	</table>
	<table style="width: 120vh;">
		<tr>
			<td class="ref_ttl" style="width: 12%;">참조</td>
			<td colspan="8" id="refPlus">
				<input type="text" class="ref_in" placeholder="   클릭 후 입력"  autocomplete="off">
				<p id="ref_p"></p>
			</td>
		</tr>
	</table>
</div>
<!-- .......... 품의서 결재선 종료 ........ -->
<!-- .......... 업무연락 결재선 시작 .......... -->
<div id="apprTable103" style="display:none;">
	<div id="appr-title">
		<h4 style="display: inline-block;">결재선</h4>
		<button class="addr_select" type="button" id="addrSelect103">업무연락 결재선설정</button>
	</div>
	<table class="appr_table" style="width: 120vh;">
		<tr>
			<td id="team" rowspan="3" style="width: 12%;">결재</td>
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
	<table style="width: 120vh;">
		<tr>
			<td class="ref_ttl" style="width: 12%;">참조</td>
			<td colspan="8">
				<input type="text" class="ref_in" placeholder="   클릭 후 입력"  autocomplete="off">
			</td>
		</tr>
		<tr>
			<td class="ref_ttl" style="width: 12%;">수신</td>
			<td colspan="8">
				<input type="text" class="ref_in" placeholder="  클릭 후 입력" autocomplete="off">
			</td>
		</tr>

	</table>
</div>
<!-- .......... 업무연락 결재선 종료 ........ -->
<!-- .......... 재직증명서 결재선 시작 .......... -->
<div id="apprTable104" style="display:none;">
	<div id="appr-title">
		<h4 style="display: inline-block;">결재선</h4>
		<button class="addr_select" type="button" id="addrSelect104">재직증명서 결재선설정</button>
	</div>
	<table class="appr_table" style="width: 120vh;">
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
	</table>
	<table style="width: 120vh;">
		<tr>
			<td class="ref_ttl" style="width: 12%;">참조</td>
			<td colspan="8">
				<input type="text" class="ref_in" placeholder="  클릭 후 입력"  autocomplete="off">

			</td>
		</tr>
	</table>
</div>
<!-- .......... 재직증명서 결재선 종료 ........ -->

	<div id="writeInput">
		<h4 id="inputTitle" style="margin: 50px; margin-left: 0; margin-bottom: 8px;">본문</h4>
		<div id="title">
		</div>
	</div>

	<!-- <h4 id="inputCn">상세 입력</h4> -->
	<div id="contentInform" >문서 종류 선택 시 상세 입력이 노출됩니다.</div>



<!-- .......... 품의서 텍스트본문 시작 .......... -->
<div id="contentWrapper" style="display:none;">
	<div id="content" style="width: 120vh !important;">
		<input width="120vh;" type="text" name="approval_document_title" id="approval_document_title" placeholder="제목을 입력해 주세요." value=""  tabindex="-1">
	</div>
	<link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/44.1.0/ckeditor5.css">

	<div id="container"  style="width: 120vh;">
		<div id="editor"></div>
	</div>

</div>
<!-- .......... 품의서 텍스트본문 종료 ..........-->
<!-- .......... 품의서 오로지 저장 스크립트 시작 ........... -->
<script type="text/javascript">

	$("#preservedTerm").on("change", function(){
		const selectedValue= $(this).val(); // 선택된 값 가져오기
		console.log("나오냐?;;selectedValue : ", selectedValue);
	});

	$("#securityLevel").on("change", function(){
		const selectedValue= $(this).val(); // 선택된 값 가져오기
		console.log("나오냐?;;selectedValue : ", selectedValue);
	});

	// 버튼 클릭 시 서버로 값 전송
	document.getElementById("submitButton").addEventListener("click", function() {
			const title = document.querySelector("#approval_document_title").value;  // 제목
			const content = editor.getData();  // CKEditor 내용
			const formNo = document.querySelector("#formSelect").value;

			const preserved = document.getElementById('preservedTerm').value; // select 요소 가져오기
			const security = document.getElementById('securityLevel').value;

			console.log("title", title);
			console.log("content", content);
			console.log("formNo", formNo);
			console.log("preserved", preserved);
			console.log("security", security);
			// 데이터 전송
			axios.post('/managepage/pbox/write/save', {
				atrzDocNm: title,
				atrzDocCn: content,
				atrzFormNo : formNo,
				atrzPreserved : preserved,
				atrzSecurity : security
			})
			.then(response => {
					console.log("서버 응답:", response);
					console.log("되었다옹");
					// 예: 전송 성공 시 처리할 로직 (페이지 리다이렉트 등)

					// 일단 if문으로 처리하는데 이거 detail경로는 하나로 하는 게 맞는 거 같기도 해..

					if(formNo == 100){
						window.location.href = `/managepage/appr/aaddr_detail/${atrzDocVO.atrzDocNo}`;
					}else if(formNo == 103){
						window.location.href = `/managepage/appr/con_detail/${atrzDocNo}`;
					}else{
						window.location.href = `/managepage/appr/cert_detail/${atrzDocNo}`;
					}

			})
			.catch(error => {
					console.error("서버 요청 실패:", error);
					if(formNo == 100){
						window.location.href = `/managepage/appr/aaddr_detail/${atrzDocNo}`;
					}else if(formNo == 103){
						window.location.href = `/managepage/appr/con_detail/${atrzDocNo}`;
					}else{
						window.location.href = `/managepage/appr/cert_detail/${atrzDocNo}`;
					}
			});
	});


  const selectElement = document.getElementById('formSelect');
	const submitButton = document.getElementById('submitButton');

// 클릭 이벤트 리스너 추가
submitButton.addEventListener('click', () => {
		console.log("버튼이 클릭되었습니다!"); // 로그 출력
});









</script>




<!-- .......... 품의서 스크립트 종료 ........... -->
<!-- .......... 업무연락 텍스트본문 시작 .......... -->
<div id="contentWrapper103" style="display:none;">
	<div id="content">
		<input width="120vh" type="text" name="approval_document_title" id="approval_document_title" 
		placeholder="업무연락 제목을 입력해 주세요." value=""  tabindex="-1">
	</div>
	<link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/44.1.0/ckeditor5.css">

	<div id="container">
		<div id="editor103"></div>
	</div>
</div>
<!-- .......... 업무연락 텍스트본문 종료 ..........-->
<!-- .......... 재직증명서 텍스트본문 시작 .......... -->
<div id="contentWrapper104" style="display:none;">
	<div id="content">
		<input width="120vh" type="text" name="approval_document_title" id="approval_document_title" 
		placeholder="재직증명서 제목을 입력해 주세요." value="" tabindex="-1">
	</div>
	
	<table id="cert_table">
		<tr>
			<td><p id="p_cert" ><b>이름</b></p></td>
			<td id="certCn"><p>name</p></td>
		</tr>
		<tr>
			<td><p id="p_cert"><b>소속</b></p></td>
			<td id="certCn"><p></p>4</td>
		</tr>
		<tr>
			<td><p id="p_cert"><b>생년월일</b></p></td>
			<td id="certCn"><p></p>4</td>
		</tr>
		<tr>
			<td><p id="p_cert"><b>입사일</b></p></td>
			<td id="certCn"><p></p>4</td>
		</tr>
		<tr>
			<td><p id="p_cert"><b>주소</b></p></td>
			<td id="certCn"><p></p>4</td>
		</tr>
		<tr>
			<td><p id="p_cert"><b>제출처</b></p></td>
			<td id="certCn"><input class="p_cert_pl" type="text"></td>
		</tr>
		<tr>
			<td><p id="p_cert"><b>용도</b></p></td>
			<td id="certCn"><input class="p_cert_us" type="text"></td>
		</tr>
		<tr>
			<td><p id="p_cert"><b>발행일</b></p></td>
			<td id="certCn"><input class="p_cert_da" type="date"></td>
		</tr>
	</table>
	
</div>
<!-- .......... 재직증명서 텍스트본문 종료 ..........-->


				</div><!-- /.wrapper -->
		</div>
	</div>
	<!-- /.card-header -->
	<div style="height: 300px;"></div>
	<div class="card-body table-responsive p-0" id="divDetailArea">

	</div>
	<!-- /.card-body -->
	<!-- card-footer 시작 -->
	<div class="card-footer" id="divPagingArea"></div>
	<!-- card-footer 끝 -->
</div>
<!-- /.card -->

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
			$("#apprTable100").css("display", "block");
			//품의서 본문
			$("#contentWrapper").css("display", "block");
		}else if(selectedValue === "103"){//업무연락
			console.log("103 selected");
			//공통
			$("#contentInform").css("display", "none");
			$("#approvalDocumentLine").css("display", "none");
			$("#apprTable100").css("display", "none");
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
			$("#apprTable100").css("display", "none");
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
			$("#apprTable100").css("display", "none");
			$("#apprTable103").css("display", "none");
			$("#apprTable104").css("display", "none");
			//본문
			$("#contentWrapper").css("display", "none");
			$("#contentWrapper103").css("display", "none");
			$("#contentWrapper104").css("display", "none");
			// 버튼
			$("#submitButton").attr("disabled", "true");
		}
	})
</script>




<!-- .......... script 종료 .......... -->

<!-- .......... Modal <<품의서모달>> 결재선 시작 .......... -->

<div class="modal fade show" id="modalAddr" area-hidden="true" style="display: none;  padding-right: 17px;" aria-modal="true" role="dialog">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
<!-- .......... //// Modal 헤더영역 //// .......... -->
			<div class="modal-header">
				<h4 class="modal-title">결재선 설정</h4><br/>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<!-- .......... ////. Modal 헤더영역 ////.......... -->
			<!-- .......... //// Modal 바디영역 //// .......... -->
			<div class="modal-body modal-scrollable">
		 	<div id="rowFlex" style="display: flex; align-items: center; gap: 10px;">
			<!-- .......... 직원영역 .......... -->
			<div id="addrNames" style="overflow-y: auto;">
							<!-- .......... 검색영역 .......... -->
						<div id="searchEmp">
						    <input type="text" class="schBox" value="">
								<i onclick="fSch()" class="search-icon bi bi-search"></i>
							<!-- 새로고침 아이콘 -->
						</div>
						<i onclick="fSch()"  class="refresh-icon bi bi-arrow-clockwise"></i>
							<!-- .......... /. 검색영역 .......... -->
						<!-- .......... tree 시작 .......... -->
						<div
						id="demo-tree1"
						class="demo-tree"
						style="height: 60vh;
						border: none;"
					></div>
			</div>
			<!-- .......... /. 직원영역 .......... -->
			<!-- ..........    버튼영역 .......... -->
			<div id="aplBtn" style="width: 15vh;">
			<button type="button" class="modal_btn" id="addBtn">결재</button>
			<button type="button" class="modal_btn" id="btnRef">참조</button>
			</div>
			<!-- .......... /. 버튼영역 .......... -->
<!-- 결재선, 참조 div box -->
<style>
	#aplTextarea, #aplRef{
		-ms-overflow-style: none;
	}
	#aplTextarea::-webkit-scrollbar{
		display: none;
	}
</style>
			<div id="right">
			<div id="aplTextarea" style="overflow: scroll;">
				<table >
				</table>
			</div>
			<!-- ..........  참조영역 .......... -->
			 <p style="font-style: bold; font-size: 20px;">참조</p>
			<div id="aplRef" style="width: 100%;overflow: scroll;">
			</div>
			<!-- .......... /. 참조영역 .......... -->
		</div>
<!-- /. 결재선, 참조 div box -->
		</div> <!-- end RowFlex -->
			<!-- .......... ////. Modal 바디영역 ////.......... -->
			</div>
			<div class="modal-footer justify-content-between">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" id="saveBtn">Save changes</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- .......... 품의서 결재라인 스크립트 시작 .......... -->
<script type="text/javascript">
$("#addrSelect100").click(function(){
	console.log("결재선 모달이 열렸습니다.");
	$("#modalAddr").modal("show");
})

// 선택된 사람들 콘솔로 확인하기




let str; // 일단 이미 사용자 값은 담겨있어야됨


 selectedMember.forEach(member => {
						console.log("////", member);
						console.log("Title:", member.title);
						console.log("Department:", member.departName);
						console.log("Position:", member.posName);
					}); 


// 결재선설정 모달 (참조) 중복 여부 체크 //
function isMemInRef(selectedMember){ // 참조에 등록된 사람인지 체크
	const aplRef = document.querySelector("#aplRef"); // 참조박스 선택
	const existingValues =[ // aplRef에서 data-name속성을 가진 요소 모두 선택 (nodeList -> 배열로 변환)
		...Array.from(aplRef.querySelectorAll('div [data-name]')).map(tr=>tr.dataset.name)
	];
	return existingValues.includes(selectedMember);
}
let count= 0;
// 결재선설정 모달 (결재) 중복 여부 체크
function isMemInText(selectedMember){
	
	const aplTextarea = document.querySelector("#aplTextarea");
	const existingValues = [
		...Array.from(aplTextarea.querySelectorAll('tr [data-name]')).map(tr => tr.dataset.name)
	];
	return existingValues.includes(selectedMember);
}
$("#addBtn").click(function(){
	//
	const selectedCount = $("#aplTextarea tr").length + 1; // 현재 추가된 결재자 수
	console.log("selectedCount",selectedCount);
  if (selectedCount > 6) {
    alert("결재자 설정은 7명을 넘을 수 없습니다.");
    return;
  }
	//
	// 중복 체크
	if(isMemInRef(selectedMember)){
		alert("참조에 추가된 값을 결재로 중복으로 추가할 수 없습니다.");
	}else{
		if(isMemInText(selectedMember)){
			alert("이미 결재선에 추가된 회원입니다.리액트 게시판 하나만 하자...");
		}else{
			str = selectedMember.map(member =>`<tr>
				<td style="vertical-align: middle;width:200px;height:50px;">\${count}</td>
				<td style="vertical-align: middle;width:400px;">결재</td>
				<td style="vertical-align: middle;width:600px;" data-name="\${member.departName}">\${member.departName}</td>
				<td style="vertical-align: middle;width:600px;" data-name="\${member.title}">\${member.title}</td>
				<td><input type="button" class="btn_delete" value="X"></td>
			</tr>`);
			// console.log("apl의 총합 ", existingValues);
			console.log(`selectedMember : \${selectedMember}`);
			$("#aplTextarea").append(str);
			// count++; // 번호 증가
			updateRowNumbers(); // 번호 갱신 함수 호출
		}
	}
})
	

$("#btnRef").click(function(){
	// 중복 체크
	if(isMemInText(selectedMember)){
		alert("결재선에 추가된회원으로 참조에 추가할 수 없습니다.");
	}else{
		if(isMemInRef(selectedMember)){
			alert("이미 참조된 회원입니다.")
		}else{
			 str = selectedMember.map(member =>`
            <div style="display: flex; align-items: center; padding: 10px; border: 1px solid #ccc; border-radius: 5px; min-width: 100px; max-width: 200px; box-sizing: border-box; flex: none;">
                <span data-name="\${member.title}" data-type="참조" data-no="\${count}">\${member.title}</span>
                <input type="button" class="btn_delete" value="X" style="margin-left: 10px;">
            </div>`);
			$("#aplRef").append(str);
		}
	}
})
$(document).on('click', '.btn_delete', function() {
 	$(this).closest('tr').remove();
 	$(this).closest('div').remove();
 	updateRowNumbers(); // 삭제 후 번호 갱신
 });
 


// 번호 갱신 함수
function updateRowNumbers() {
	$("#aplTextarea tr").each(function(index) {
		$(this).find('td').first().text(index + 1); // 첫 번째 td에 번호 재매기기
	});
}

// 결재선 내용을 json으로 처리해서 저장하자
function tableToJson() { 
    const tableRows = $("#aplTextarea tr");
    const divRows = $("#aplRef div");
    const data = [];

    // 테이블 데이터 처리
    tableRows.each(function () {
        const row = $(this);
        const rowData = {
            no: row.find('td').eq(0).text(),
            type: row.find('td').eq(1).text(),
            departName: row.find('td').eq(2).text(),
            name: row.find('td').eq(3).text(),
        };
        data.push(rowData);
    });

    // 참조 데이터 처리
    divRows.each(function () {
        const div = $(this);
        const divData = {
            no: "-", // 참조에는 번호가 없으므로 '-'로 처리
            type: "참조", // 참조 타입 지정
            name: div.find('span[data-name]').text(), // 참조 이름 가져오기
        };
        data.push(divData);
    });

    return JSON.stringify(data);
}

$("#saveBtn").click(function () {
    const jsonData = tableToJson();
    console.log('테이블 데이터를 JSON으로 변환:', jsonData);

    // JSON 데이터 파싱
    const data = JSON.parse(jsonData);

    // 테이블 row 요소
		const teamRow = $(".appr_table tr").eq(0).find("td").slice(1);
		const posRow = $(".appr_table tr").eq(1).find("td").slice(1);
    const nameRow = $(".appr_table tr").eq(3).find("td[id='name']");
		const pRow = $("#ref_p");

    // 데이터 초기화 (필요 시 주석 처리)
    teamRow.empty();
    posRow.empty();
    nameRow.empty();
		pRow.empty();

    let teamIndex = 0; // 결재 데이터를 삽입할 위치
		// 참조 데이터 저장 배열 (중복 방지용)
		let selectedRefs = [];

    // JSON 데이터를 순회하며 테이블에 데이터 추가
    data.forEach((item) => {
        if (item.type === '결재' && teamIndex < teamRow.length) {
            // 이름과 직급을 분리
						const departName = item.departName;
            const nameWithPosition = item.name; // e.g., "홍길동(과장)"
            const name = nameWithPosition.split("(")[0] || ""; // 이름 추출
            const position = nameWithPosition.match(/\(([^)]+)\)/)?.[1] || ""; // 직급 추출

						console.log("item", item);
            // console.log(`Processing: Name=\${name}, Position=\${position}`);

            // 자식 노드가 없는 경우에만 데이터 추가
            if (!$(teamRow[teamIndex]).children().length) {
                $(teamRow[teamIndex]).text(departName); // 직급 추가
            }

            if (!$(posRow[teamIndex]).children().length) {
                $(posRow[teamIndex]).text(position); // 필요시 수정
            }

            if (!$(nameRow[teamIndex]).children().length) {
                $(nameRow[teamIndex]).text(name); // 이름 추가
            }

            teamIndex++;
        } else if (item.type === '참조') {
					
               // 인풋 박스 옆에 참조 데이터 추가
		// $("#refPlus").find("p").remove(); // 기존 참조 데이터 제거

    data.forEach((ref) => {
        if (ref.type === '참조' && !selectedRefs.includes(ref.name)) {
            // 중복 방지 처리
            selectedRefs.push(ref.name);
						console.log(selectedRefs);

            // 참조 데이터를 인풋 박스 옆에 <p>로 추가
							const refHTML = `
										<p style="display: inline-block; margin: 0 5px; padding: 3px 5px; border: 1px solid #ccc; border-radius: 3px;" 
											data-name="\${ref.name}">
												\${ref.name}
										</p>`;

										$("#ref_p").append(refHTML);


        }
    });

    console.log("테이블 업데이트 완료");
		$("#modalAddr").modal("hide");
};
});
});


</script>
<!-- ..........Modal <<품의서모달>> 결재선 종료 .......... -->


<style>
#aplRef {
    display: flex; /* 가로로 배치 */
    gap: 10px; /* 요소 간 간격 */
    overflow-x: auto; /* 수평 스크롤 허용 */
    white-space: nowrap; /* 줄바꿈 방지 */
}
#aplRef div {
    display: flex;
    align-items: center; /* 텍스트와 버튼 수직 정렬 */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
    min-width: 100px; /* 최소 너비 */
    max-width: 200px; /* 최대 너비 */
    flex: none; /* 크기 고정 */
}

#aplRef .btn_delete {
    margin-left: 10px;
    flex-shrink: 0; /* 버튼 크기 유지 */
}


</style>


<!-- ..........Modal <<업무연락모달>> 결재선 시작 .......... -->


<div class="modal fade show" id="modalCon" style="padding-right: 17px; display: none;" aria-modal="true" role="dialog">
	<div class="modal-dialog modal-xl">
	  <div class="modal-content">
		<div class="modal-header">
		  <h4 class="modal-title">결재선 설정</h4>
		  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">×</span>
		  </button>
		</div>
		<div class="modal-body" style="display: flex; justify-content: center; align-items: center;">




<!-- 왼쪽 컨테이너 -->
<div class="left-container" >
		<!-- .......... 검색영역 .......... -->
		<div id="searchEmp" >
			<input type="text" class="schBox" value="">
			<i onclick="fSch()" class="search-icon bi bi-search"></i>
		<!-- 새로고침 아이콘 -->
	</div>
	<i onclick="fSch()"  class="refresh-icon bi bi-arrow-clockwise"></i>
		<!-- .......... /. 검색영역 .......... -->
	<!-- <div id="div1">						 -->
		<div id="demo-tree2"
		class="demo-tree"
		style="height: 60vh;
		border: none;"></div></div>
<!-- </div> -->

<!-- 오른쪽 컨테이너 -->
<div class="divs-container">
	<div class="btn-row">
		<div class="btn-column">
				<p id="modal_p">결재</p>
					<button id="btn2"><i class="bi bi-caret-right-fill"></i></button>
					<button id="btn3"><i class="bi bi-caret-left-fill"></i></button>
			</div>
			<div class="div-box" id="div2"></div>
	</div>
	<div class="btn-row">
		<div class="btn-column">
				<p id="modal_p">참조</p>
				<button id="btn2"><i class="bi bi-caret-right-fill"></i></button>
				<button id="btn3"><i class="bi bi-caret-left-fill"></i></button>
			</div>
			<div class="div-box" id="div3"></div>
	</div>
	<div class="btn-row">
		<div class="btn-column">
				<p id="modal_p">수신</p>
				<button id="btn2"><i class="bi bi-caret-right-fill"></i></button>
				<button id="btn3"><i class="bi bi-caret-left-fill"></i></button>
			</div>
			<div class="div-box" id="div4"></div>
		</div>
		<div class="div-box" style="border: 0;padding-left: 80px; height: 5vh;">	참조:문서를 공식적으로 확인(수신참조)
</div>
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



<script type="text/javascript">




$("#addrSelect103").click(function(){
	console.log("ㅋㅋ");
	$("#modalCon").modal("show");
})


$("#addrSelect104").click(function(){
	console.log("ㅋㅋ");
	$("#modalCert").modal("show");
})



</script>

<!-- ..........Modal <<업무연락모달>> 결재선 종료 .......... -->
<!-- ..........Modal <<재직증명서모달>> 결재선 시작 .......... -->


<div class="modal fade show" id="modalCert" style="padding-right: 17px; display: none;" aria-modal="true" role="dialog">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">결재선 설정
				</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body" style="display: flex; justify-content: center; align-items: center;">




				<!-- 왼쪽 컨테이너 -->
				<div class="left-container" >
						<!-- .......... 검색영역 .......... -->
						<div id="searchEmp" >
							<input type="text" class="schBox" value="">
							<i onclick="fSch()" class="search-icon bi bi-search"></i>
						<!-- 새로고침 아이콘 -->
					</div>
					<i onclick="fSch()"  class="refresh-icon bi bi-arrow-clockwise"></i>
						<!-- .......... /. 검색영역 .......... -->
					<!-- <div id="div1">						 -->
						<div id="demo-tree3"
						class="demo-tree"
						style="height: 60vh;
						border: none;"></div></div>
				<!-- </div> -->
				
				<!-- 오른쪽 컨테이너 -->
				<div class="divs-container">
					<div class="btn-row">
						<div class="btn-column">
								<p id="modal_p">신청</p>
									<button id="btn2"><i class="bi bi-caret-right-fill"></i></button>
									<button id="btn3"><i class="bi bi-caret-left-fill"></i></button>
							</div>
							<div class="div-box" id="div2"></div>
					</div>
					<div class="btn-row">
						<div class="btn-column">
								<p id="modal_p">처리</p>
								<button id="btn2"><i class="bi bi-caret-right-fill"></i></button>
								<button id="btn3"><i class="bi bi-caret-left-fill"></i></button>
							</div>
							<div class="div-box" id="div3"></div>
					</div>
					<div class="btn-row">
						<div class="btn-column">
								<p id="modal_p">참조</p>
								<button id="btn2"><i class="bi bi-caret-right-fill"></i></button>
								<button id="btn3"><i class="bi bi-caret-left-fill"></i></button>
							</div>
							<div class="div-box" id="div4"></div>
						</div>
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

<!-- ..........Modal <<재직증명서모달>> 결재선 종료 .......... -->

<!-- .......... ckeditor 스크립트 시작 ........... -->
<!--
	The "superbuild" of CKEditor&nbsp;5 served via CDN contains a large set of plugins and multiple editor types.
	See https://ckeditor.com/docs/ckeditor5/latest/installation/getting-started/quick-start.html#running-a-full-featured-editor-from-cdn
-->
<script src="https://cdn.ckeditor.com/ckeditor5/41.4.2/super-build/ckeditor.js"></script>
<script src="/js/ckeditor_script.js"></script>
	<!-- .......... ckeditor 스크립트 종료 ........... -->

	<!-- 아까워서 남겨두는 합의 템플릿 시작 -->
<!-- 
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
-->
	<!-- 아까워서 남겨두는 합의 템플릿 종료 -->