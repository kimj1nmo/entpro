<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.container {
	display: flex;
	/*                             width: 80%; */
	min-height:400px;
	height: 100%;
	/* 화면 전체 높이 */
	/* 	background-color: yellow; */
	border-radius: 10px;
}

.left1 {
	width: 50%;
	/*             background-color: lightblue; /* 왼쪽 부분 색상 */

}

.right1 {
	width: 50%;
	/*             background-color: lightgreen; /* 오른쪽 부분 색상 */
}

.modal-dialog {
  max-height: 90vh;  /* 모달 창의 최대 높이를 화면 크기 90%로 설정 */
  overflow-y: auto;  /* 세로 스크롤 추가 */
}



</style>
<%@ include file="../../include/header.jsp"%>

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
						<li class="breadcrumb-item"><a href="/companypage/main">companypage</a></li>
						<li class="breadcrumb-item active">manageGroup</li>
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
			<!-- ///// content 시작 ///// -->
			<h3>그룹 관리</h3>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">그룹 목록</h3>
							<p>${articlePage.content}</p>
							<div class="card-tools">
								<div class="input-group input-group-sm" style="width: 150px;">
									<input type="text" name="keyword" value="${param.keyword}"
										class="form-control float-right" placeholder="검색어 입력" />

									<div class="input-group-append">
										<button type="button" ID="btnSearch" class="btn btn-default">
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
										<th value="groupNo">번호 <span class="up"></span> <span
											class="down"></span>
										</th>
										<th value="groupName">그룹이름 <span class="up"></span> <span
											class="down"></span>
										</th>
										<th value="groupBirth">그룹생성일 <span class="up"></span> <span
											class="down"></span>
										</th>
											<th value="groupBirthInputter">생성일 최종입력자 <span class="up"></span> <span
											class="down"></span>
										</th>
										<th value="groupDspgn">그룹해체일 <span class="up"></span> <span
											class="down"></span>
										</th>
											<th value="groupDspgnInputter">해체일 최종입력자 <span class="up"></span> <span
											class="down"></span>
										</th>
									</tr>
								</thead>
								<tbody id="tby">


								</tbody>
							</table>
						</div>
						<div class="card-body table-responsive p-0" id="divDetailArea">
						</div>
						<!-- /.card-header -->
						<div class="col-12" style="justify-content: right; display: flex;">
							<a data-toggle="modal" data-target="#modalAdd"
								class="btn btn-primary">등록</a>
						</div>
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
	

	<!-- ///// content 끝 ///// -->

	<script type="text/javascript">

	 let keyword="";
	 let sortName="groupNo";
	 let mode="0";

	  // 특정 모달을 여는 함수
	    function openModal() {
	        document.getElementById(`modal`).classList.add('active');
	    }

	    // 특정 모달을 닫는 함수
	    function closeModal() {
	        document.getElementById(`modal`).classList.remove('active');
	    }
		$("#artistSearchBtn").on("click", function() {
			let artistSearch=$("#artistSearch").val();
			console.log("artistSearch",artistSearch);

			let data = {
					"artistName":artistSearch
				};

				console.log("data : ", data);
				$.ajax({
					url:"/manageGroupAjax/artistSearch",
					contentType:"application/json;charset=utf-8",
					data:JSON.stringify(data),
					type:"post",
					dataType:"json",
					success:function(result){

						$.each(result,function(idx,artistVO){
						$("#artistInput").append(artistVO.artistName);

						});

						//delete 성공 : 1, delete 실패 : 0
						console.log("result : ", result);

						}
					})
				});//end ajax
	function nvl(expr1, expr2) {
		if (expr1 === undefined || expr1 == null || expr1 == "") {
			expr1 = expr2;
		}
		return expr1;
	}

	//누르는 소트
	$('.up').click(function() {
	    var value = $(this).closest('th').attr('value');
	    console.log("위에 누름",value); // 출력: "rnum"
	    sortName=value;
		getList("1", keyword,"0",sortName);

	  });

	  $('.down').click(function() {
	    var value = $(this).closest('th').attr('value');
	    console.log("아래 누름",value);
	    sortName=value;

		getList("1", keyword,"1",sortName);

	  });



	//검색 처리
	$("#btnSearch").on('click',function(){
	//input type="text" name="keyword"...
 	keyword = $("input[name='keyword']").val();//길동
 	console.log("keyword", keyword);

 	//전역함수 호출
 	getList("1", keyword,"",sortName);
	})





	//목록 가져오는 함수 sort로 가져오는거까지
	function getList(currentPage, keyword,mode,sortName) {
		//회원 목록
		let data = {
			"currentPage" : nvl(currentPage, "1"),
			"keyword" : nvl(keyword, ""),
			"mode" : nvl(mode, "0"),
			"sortName" : nvl(sortName, "")
		}
		console.log("data :", data);

		$.ajax({
			url : "/manage/calendar",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "json",
			success : function(articlePage) {
				console.log("articlePage :", articlePage);
				console.log("articlePage.content :", articlePage.content);


				let str = "";
				$.each(articlePage.content,function(idx,GroupsVO){
					 let groupBirth = new Date(nvl(GroupsVO.groupBirth,""));
					 let groupDspgn = new Date(nvl(GroupsVO.groupDspgn),"");

					  let formatGroupBirth = "";
					    if (!isNaN(groupBirth)) {
					        formatGroupBirth = groupBirth.getFullYear() + '-'
					                        + String(groupBirth.getMonth() + 1).padStart(2, '0') + '-'
					                        + String(groupBirth.getDate()).padStart(2, '0');
					    }
						let formatGroupDspgn = "";
					    if (!isNaN(groupDspgn)) {
					        formatGroupDspgn = groupDspgn.getFullYear() + '-'
					                        + String(groupDspgn.getMonth() + 1).padStart(2, '0') + '-'
					                        + String(groupDspgn.getDate()).padStart(2, '0');
					    }

					    console.log(formatGroupBirth);  // "2025-01-06"

					str+=`<tr>
                    <td>\${GroupsVO.groupNo}</td>
                    <td><a<a data-toggle="modal" data-group-no="\${GroupsVO.groupNo}" data-target="#modalInfo" id="btnUpdateSet">\${GroupsVO.groupName}</a></td>
                    <td>`+nvl(formatGroupBirth,"")+`</td>
                    <td>\${GroupsVO.groupBirthInputter}</td>
                    <td>`+ formatGroupDspgn	+`</td>
                    <td>\${GroupsVO.groupDspgnInputter}</td>
                  </tr>`;
				});//endeach
				$("#tby").html(str);
				$("#divPagingArea").html(articlePage.pagingArea);

			}
		});
	}//end getList()



	//document.ready
	//동일 jsp에서 1회 작성
	$(function() {
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
			getList(currentPage, keyword, mode, sortName);

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

	$(function(){
		$("#uploadFiles").on("change",handleImg);
	});
</script>
	<%@ include file="../../include/footer.jsp"%>