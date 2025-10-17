<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../include/header_user.jsp"></jsp:include>
<link href="/directlyCss/modal.css" rel="stylesheet">

<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<!-- ///// content 시작 ///// -->
<style>
/* 컨테이너 중앙 정렬 */
.mypage-container {
	width: 80%;
	max-width: 1200px;
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	margin: 0 auto;
}

/* Section 타이틀 */
.section-title h2 {
	text-align: center;
	font-size: 32px;
	font-weight: 600;
	color: #333;
	margin-bottom: 20px;
}

/* 프로필 섹션 */
.mypage-profile-section {
	display: flex;
	justify-content: space-between;
	padding: 20px 0;
	border-bottom: 1px solid #e0e0e0;
}

.mypage-profile-header {
	display: flex;
	justify-content: space-between; /* 양쪽 끝으로 정렬 */
	align-items: center;
	width: 100%;
}

.mypage-profile-info {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
}

.mypage-profile-picture img {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	object-fit: cover;
}

.mypage-profile-info h2 {
	font-size: 24px;
	font-weight: 600;
}

.mypage-profile-info p {
	font-size: 14px;
	color: #888;
}

.mypage-edit-profile-btn {
	padding: 8px 15px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.mypage-edit-profile-btn:hover {
	background-color: #0056b3;
}

/* 오른쪽 버튼 */
.mypage-profile-actions {
	display: flex;
	justify-content: flex-end; /* 오른쪽 정렬 */
}

.mypage-profile-actions .btn {
	padding: 8px 15px;
	background-color: #28a745;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.mypage-profile-actions .btn:hover {
	background-color: #218838;
}

/* 최근 활동 섹션 */
.mypage-activity-section {
	margin-top: 40px;
}

.mypage-activity-section h3 {
	font-size: 22px;
	font-weight: 600;
	margin-bottom: 15px;
}

.mypage-activity-list {
	list-style-type: none;
}

.mypage-activity-list li {
	/* 	background-color: #f0f0f0; */
	padding: 10px;
	margin-bottom: 10px;
	border-radius: 5px;
	font-size: 14px;
}

.mypage-activity-list li:hover {
	background-color: #e0e0e0;
}

/* 설정 섹션 */
.mypage-settings-section {
	margin-top: 40px;
}

.mypage-settings-section h3 {
	font-size: 22px;
	font-weight: 600;
	margin-bottom: 15px;
}

.mypage-settings-list {
	list-style-type: none;
}

.mypage-settings-list li {
	padding: 10px 0;
	border-bottom: 1px solid #e0e0e0;
}

.mypage-settings-list li a {
	color: #007bff;
	text-decoration: none;
	font-size: 16px;
}

.mypage-settings-list li a:hover {
	text-decoration: underline;
}

/* 반응형 디자인 */
@media screen and (max-width: 768px) {
	.mypage-container {
		width: 95%;
	}
	.mypage-profile-header {
		flex-direction: column;
		align-items: center;
	}
	.mypage-profile-picture img {
		width: 100px;
		height: 100px;
	}
	.mypage-profile-info {
		text-align: center;
	}
}

/* 상자 안 */

.mypage-activity-section {
	width: 100%;
	max-width: 100%;
	padding: 20px;
	text-align: center;
	position: relative;
}

.slider-container {
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative;
	width: 100%;
}

.mypage-activity-list {
	display: flex;
	justify-content: flex-start;
	align-items: center;
	overflow: hidden;
	padding: 0;
	margin: 0;
	list-style: none;
	transition: transform 0.3s ease-in-out;
	position: relative;
	width: 100%;
	gap: 10px; /* 항목 간의 간격 추가 */
}

.activity-item {
	flex: 0 0 auto;
	width: calc(25% - 10px); /* 기본적으로 4개의 항목이 25%씩 차지 */
	text-align: center;
	margin: 0;
}

@media screen and (max-width: 768px) {
	.mypage-activity-list {
		justify-content: flex-start; /* 3개일 때 왼쪽 정렬 */
	}
	.activity-item {
		width: calc(33.33% - 10px); /* 3개일 때는 각각 33.33% 크기 */
	}
}

@media screen and (max-width: 480px) {
	.mypage-activity-list {
		justify-content: flex-start;
	}
	.activity-item {
		width: 100%; /* 모바일 화면에서는 한 줄에 하나씩 배치 */
	}
}

.image-container {
	width: 100%;
	height: 0;
	padding-top: 100%;
	position: relative;
	overflow: hidden;
	border-radius: 8px;
	background-color: #f0f0f0;
}

.activity-item img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.activity-item p {
	margin-top: 10px;
	font-size: 14px;
	color: #333;
}

.arrow-container {
	width: 40px;
	height: 100px;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #f0f0f0;
	border-radius: 20px;
	cursor: pointer;
	z-index: 10;
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
}

.arrow-container:hover {
	background-color: #ddd;
}

.arrow {
	font-size: 30px;
	color: #333;
	font-weight: bold;
}

.left-arrow {
	left: -40px;
		top: 100px;

}

.right-arrow {
	right: -30px;
		top: 100px;

}
</style>
<!-- Bootstrap CSS (필요 시 유지)
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">-->
<!-- <link -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet"> -->

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 아이콘 -->
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<section class="content" style="max-width: 1140px; margin: 0 auto;">
	<div class="container mypage-container">
		<!-- 프로필 섹션 -->
		<div class="mypage-profile-section">
			<div class="mypage-profile-header">
				<!-- 왼쪽 프로필 정보 -->
				<div class="mypage-profile-info">
					<h2 id="memName">사용자 이름 뜰예정</h2>
					<p class="mypage-user-id" id="memId">사용자 아이디 뜰예정</p>
					<p class="mypage-user-id" id="memEmail"></p>
					<p class="mypage-user-id" id="memRegDate">가입일:</p>
					<button type="button"
						class="btn btn-block btn-info text-black px-3"
						onclick="location.href='mypage/myProfile'">회원 정보 수정</button>
				</div>

				<!-- 오른쪽 버튼 -->
				<div class="mypage-profile-actions">
					<!--                     <button type="button" class="btn btn-block btn-success text-white px-3">추가 작업</button> -->
					<div
						style="width: 100%; min-width: 300px; height: 100px; display: flex; justify-content: center; align-items: center;">
						<div
							style="height: 100%; display: flex; flex-direction: column; justify-content: center; align-items: center;">
							<div style="height: 60%; width: 100%;">
								<img alt="적당한 그림 넣기" src="/resources/upload/2024/jelley.png"
									style="width: 100%; height: 100%; object-fit: cover;">
<!-- 									<strong class="DigitalMembershipSubscribeModalView_price__P0SSx"> -->

							</strong>
							</div>
							<div id="crrncySum">aaa</div>
							<button type="button"
								class="btn btn-block btn-info text-black px-3" id="chargeCrrncy">충전</button>

						</div>
					</div>


				</div>
			</div>
		</div>

		<div class="mypage-activity-section">
			<h3>가입한 커뮤니티</h3>
			<div class="slider-container">
				<div class="arrow-container left-arrow" id="prevArrowComm" hidden>
					<span class="arrow">&lt;</span>
				</div>
				<ul class="mypage-activity-list" id="comm">
				<li class="activity-item">
						<div class="image-container">
<!-- 							<img src="image1.jpg" alt="Community 1"> -->
						</div>
						<p style="width: 100%;height: 100%;">가입한 맴버쉽이 없습니다</p>
					</li>
				</ul>
				<div class="arrow-container right-arrow" id="nextArrowComm" hidden>
					<span class="arrow">&gt;</span>
				</div>
			</div>
		</div>



		<div class="mypage-activity-section">
			<h3>가입한 맴버쉽</h3>
			<div class="slider-container">
				<div class="arrow-container left-arrow" id="prevArrowMemShip" hidden>
					<span class="arrow">&lt;</span>
				</div>
				<ul class="mypage-activity-list" id="memberShip">
					<li class="activity-item">
						<div class="image-container">
<!-- 							<img src="image1.jpg" alt="Community 1"> -->
						</div>
						<p style="width: 100%;height: 100%;">가입한 맴버쉽이 없습니다</p>
					</li>
				</ul>
				<div class="arrow-container right-arrow" id="nextArrowMemShip" hidden>
					<span class="arrow">&gt;</span>
				</div>
			</div>
		</div>




		<!-- 설정 섹션 -->
		<div class="mypage-settings-section">
			<h3>설정</h3>
			<ul class="mypage-settings-list">
				<!-- 				<li><a href="#">알림 설정</a></li> -->
				<li><a href="/mypage/address">배송지 주소 설정</a></li>
				<li><a href="/logout">로그아웃</a></li>
			</ul>
		</div>
		<div class="row no-print">
			<div class="col-12">

				<button type="button" class="btn btn-danger float-left"
					style="margin-right: 5px;" id="deleteMember">회원 탈퇴</button>
			</div>
		</div>
	</div>
	</div>
</section>

<!-- sweetAlert -->
<link rel="stylesheet"
	href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>

<!-- ///// content 끝 ///// -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
    let memId = `<%=session.getAttribute("memId") != null ? session.getAttribute("memId") : "Guest"%>`;

    let commPage=1;
    let memshipPage=1;
    let commTotal = 0;
	let memshipTotal = 0;

	   $(document).on('click', '#chargeCrrncy', function() {

	        // 팝업 창 열기 (주소창을 없애기 위한 옵션 추가)
	        const newWindow = window.open('/mypage/chargeCrrncy', '젤리 충전', 'width=900,height=600,toolbar=no,location=no,menubar=no,scrollbars=yes,resizable=yes');

	        // 새 창이 로드되었을 때 memId를 전달
	        newWindow.onload = function() {
	            newWindow.postMessage({ memId: memId }, '*');  // memId를 전달
	        };
	    });
	 $("#prevArrowMemShip").click(function () {
		 memshipPage-=1;
		  if(memshipPage==1){
             $("#prevArrowMemShip").prop("hidden", true);
             if(memshipPage*4>memshipTotal){
                 $("#nextArrowMemShip").prop("hidden", false);

   		  }
		  }
		  else{
             $("#prevArrowMemShip").prop("hidden", false);
             $("#nextArrowMemShip").prop("hidden", false);

		  }
		  console.log("memshipPage-=",memshipPage);
		  console.log("memshipTotal-=",memshipTotal);
		  getCommList(commPage,memId);
	  })
	    $("#nextArrowMemShip").click(function () {
	    	memshipPage+=1;
		  if(memshipPage*4>memshipTotal){
             $("#nextArrowMemShip").prop("hidden", true);
             $("#prevArrowMemShip").prop("hidden", false);

		  }
		  else{
             $("#prevArrowMemShip").prop("hidden", false); // 메시지 숨김
             $("#nextArrowMemShip").prop("hidden", false); // 메시지 숨김

		  }
		  console.log("memshipPage+=",memshipPage);
		  console.log("memshipTotal+=",memshipTotal);
		  getCommList(memshipPage,memId);
	  })



	  $("#prevArrowComm").click(function () {
		  commPage-=1;
		  if(commPage==1){
              $("#prevArrowComm").prop("hidden", true);
              if(commPage*4>commTotal){
                  $("#nextArrowComm").prop("hidden", false);

    		  }
		  }
		  else{
              $("#prevArrowComm").prop("hidden", false);
              $("#nextArrowComm").prop("hidden", false);

		  }
		  console.log("commPage-=",commPage);
		  console.log("commTotal-=",memshipTotal);
		  getCommList(commPage,memId);
	  })
	    $("#nextArrowComm").click(function () {
		  commPage+=1;
		  if(commPage*4>memshipTotal){
              $("#nextArrowComm").prop("hidden", true);
              $("#prevArrowComm").prop("hidden", false);

		  }
		  else{
              $("#prevArrowComm").prop("hidden", false); // 메시지 숨김
              $("#nextArrowComm").prop("hidden", false); // 메시지 숨김

		  }
		  console.log("commPage+=",commPage);
		  console.log("commTotal+=",memshipTotal);
		  getCommList(commPage,memId);
	  })
console.log("memIdF",memId);
$(function() {

		$.ajax({
			url : '/api/userInfo',
			method : 'GET',
			success : function(memVO) {
				console.log("로그인 정보: ", memVO);
				memId = memVO.memId; // 서버에서 받은 사용자 정보
				console.log("memId: ", memId);
				let data = {
					"memId" : memId
				};
				$.ajax({
					url : "/mypage/getListSumAjax",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify(data),
					type : "POST",
					dataType : "json",
					success : function(map) {
						console.log("map", map);
						 commTotal = map.commTotal;
						 memshipTotal = map.memshipTotal;
						getCommList("1", memId);
						getMemShipList("1", memId);
					}
				});
			},
			error : function(xhr, status, error) {
				console.error('로그인 정보 가져오기 실패:', error);
			}
		});

		let data={
				"memId" : memId
		}
		$.ajax({
			url : '/mypage/myProfileAjax',
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "json",
				success : function(memberVO) {
					console.log('memberVO', memberVO);

					/*            <h2 id="memName">사용자 이름 뜰예정</h2>
					 <p class="mypage-user-id" id="memEmail"></p>
					 <p class="mypage-user-id" id="memRegDate">가입일: </p> */

					 let memRegDate = new Date(memberVO.memRegDate);
					 let formatMemRegDate = "";
						console.log("memRegDate",memRegDate);  // 포맷된 시간 출력

					 if (!isNaN(memRegDate)) {
						    formatMemRegDate = memRegDate.getFullYear() + '.'
						                        + String(memRegDate.getMonth()+1).padStart(2, '0')+'.'
						                        + String(memRegDate.getDate()).padStart(2, '0');
						}

						console.log("formatMemRegDate",formatMemRegDate);  // 포맷된 시간 출력
					 $("#memName").html(memberVO.memName);
					 $("#memId").html(memberVO.memId);
					 $("#memEmail").html(memberVO.memEmail);
	 				 $("#memRegDate").append(formatMemRegDate);
				}

		});


		$.ajax({
			url : '/api/crrncySumAjax',
			method : 'GET',
			success : function(sum) {
				console.log("sum=", sum);
				$("#crrncySum").html(sum + "개 ");
			}
		});

	});

	function getCommList(page, memId) {
		let data = {
			"page" : page,
			"memId" : memId
		};
		$.ajax({
			url : "/mypage/getCommListmAjax",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "json",
			success : function(groupsVO) {
				if (groupsVO != null) {
					console.log("groupsVO", groupsVO);
					let input = "";
					$.each(groupsVO, function(idx, groupVO) {
// 						input += `<li>\${commRegVO.groupName}</li>`;
// 					console.log("[0].fileGroupVO.fileDetailVOList[0].fileSaveLocate", groupVO);
						input += `
							<li class="activity-item">
		                    <a href="/\${groupVO.groupNo}/feed">
		                    <div class="image-container">
		                        <img src="\${groupVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}" alt="Community 1">
		                    </div>
		                    <p>\${groupVO.groupName}</p>
		                    </a>
		                </li>
						`;
					});
					if (input != "") {
						$("#comm").html(input);
					}
					 if(commPage*4<commTotal){
			              $("#nextArrowComm").prop("hidden", false); // 메시지 숨김
					  }
				}
			}
		});
	}

	function getMemShipList(page, memId) {
		let data = {
			"page" : page,
			"memId" : memId
		};
		$.ajax({
			url : "/mypage/getMemShipListmAjax",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "json",
			success : function(groupsVO) {
				if (groupsVO != null) {
					console.log("groupVO", groupsVO);
					let input = "";
					$.each(groupsVO, function(idx, groupVO) {
// 						input += `<li>\${commRegVO.groupName}</li>`;
// 					console.log("[0].fileGroupVO.fileDetailVOList[0].fileSaveLocate", groupVO);
						input += `
							<li class="activity-item">
		                    <a href="/\${groupVO.groupNo}/feed">
		                    <div class="image-container">
		                        <img src="\${groupVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}" alt="Community 1">
		                    </div>
		                    <p>\${groupVO.groupName}</p>
		                    </a>
		                </li>
						`;
					});
					if (input != "") {
						$("#memberShip").html(input);
					} if(memshipPage*4<memshipTotal){
			              $("#nextArrowMemShip").prop("hidden", false); // 메시지 숨김
					  }
				}
			}
		});
	}
	  $("#deleteMember").click(function () {
		    Swal.fire({
		      title: '회원탈퇴하시겠습니까?',
		      text: "",
		      icon: 'warning',
		      showCancelButton: true,
		      confirmButtonColor: '#3085d6',
		      cancelButtonColor: '#d33',
		      confirmButtonText: '승인',
		      cancelButtonText: '취소',
		      reverseButtons: true,

		    }).then((result) => {
		      if (result.isConfirmed) {
		        Swal.fire(
		          '회원 탈퇴되었습니다.',
		          'success'
		        )
		        let data = {
					"memId" : memId
				};
				$.ajax({
					url : "/mypage/deleteMemberAjax",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify(data),
					type : "POST",
					dataType : "json",
					success : function(result) {
console.log("됫나");
setTimeout(function() {
location.href="/logout";
}, 3000);  // 3000ms = 3초
					}
				});
		      }
		    })
		  });

	  let currentIndex = 0;
//    const items = document.querySelectorAll('.activity-item');
//    const totalItems = items.length;
//    const visibleItems = 4;

//    const updateSlider = () => {
//        const list = document.getElementById('comm');
//        const itemWidth = items[0].offsetWidth + 20;
//        const offset = -currentIndex * itemWidth;
//        list.style.transform = `translateX(${offset}px)`;
//    };

//    document.getElementById('nextArrow').addEventListener('click', () => {
//        if (currentIndex < totalItems - visibleItems) {
//            currentIndex++;
//            updateSlider();
//        }
//    });

//    document.getElementById('prevArrow').addEventListener('click', () => {
//        if (currentIndex > 0) {
//            currentIndex--;
//            updateSlider();
//        }
//    });

   const adjustImageSize = () => {
       const list = document.getElementById('comm');
       const itemWidth = (list.offsetWidth / totalItems) - 20;  // Dynamically calculate width based on the total number of items
       items.forEach(item => {
           item.style.width = `${itemWidth}px`;
       });
   };


   adjustImageSize();

   window.addEventListener('resize', adjustImageSize);
</script>
<%@ include file="../include/footer_user.jsp"%>