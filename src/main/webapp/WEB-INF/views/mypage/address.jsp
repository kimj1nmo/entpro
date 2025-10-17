
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header_user.jsp"%>

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
	/* 수평/수직 중앙 정렬을 위한 설정 */
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
	/* 	display: flex; */
	align-items: center;
	gap: 20px;
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
	background-color: #f0f0f0;
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
	.addressList {
		border: 1px solid grey;
	}
	.container1 strong {

	}
	.button-group {
		display: flex; /* 버튼들을 가로로 배치 */
		justify-content: flex-end; /* 버튼들을 오른쪽으로 정렬 */
		gap: 10px; /* 버튼들 사이의 간격 */
	}
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="/adminlte/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">

<section class="content" style="max-width: 1140px; margin: 0 auto;">

	<!-- 프로필 섹션 -->
	<div class="mypage-profile-section">
		<div class="mypage-profile-header">

			<div class="mypage-profile-info">
				<h2></h2>
			</div>
		</div>
	</div>

	<div class="mypage-settings-section" style="margin: 10px">
		<h2>배송지 목록</h2>
		<div id="addressList">
			<h2>등록된 배송지가 없습니다.</h2>
			<h3>주소를 등록해주세요</h3>

		</div>
	</div>
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#addressAdd">배송지주소 추가</button>



	</div>
</section>

<!-- 모달 등록 부분 -->
<div class="modal fade" id="addressAdd" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- 모달 헤더 -->
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">배송지 주소 추가</h5>
				</button>
			</div>
			<!-- 모달 본문 -->
			<div class="modal-body">
				<div class="card-body">
					<div class="form-group">
						<label for="exampleInputEmail1">주소 이름</label> <input type="text"
							class="form-control" id="addName" name="addName"
							placeholder="주소 별명">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">전화번호</label> <input type="text"
							class="form-control" id="addTel" name="addTel" placeholder="전화번호">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">우편 번호</label>
						<button type="button" class="btn btn-primary"
							onclick="searchAddress()">주소 검색</button>

						<input type="text" class="form-control" id="addZip" name="addZip"
							placeholder="우편번호">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">주소</label> <input type="text"
							class="form-control" id="add1" name="add1" placeholder="주소">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">상세 주소</label> <input type="text"
							class="form-control" id="add2" name="add2" placeholder="상세주소">
					</div>

				</div>
			</div>
			<!-- 모달 푸터 -->
			<div class="modal-footer">
				<button type="button" id="previewBtn" class="btn btn-warning">시연용</button>
				<script type="text/javascript">
                  // 시연용 값 채워질 버튼
                  $("#previewBtn").on("click", function(){
                     $("#addName").val("제주도 집");
                     $("#addTel").val("010-5420-5340");
                     $("#add2").val("42번지");
                  });
                  </script>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="addressAddChk">저장</button>
			</div>
		</div>
	</div>
</div>

<!-- 주소 변경 모달 부분 -->
<div class="modal fade" id="addressChange" tabindex="-1"
	aria-labelledby="addressChange" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- 모달 헤더 -->
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">주소 변경</h5>
				</button>
			</div>
			<!-- 모달 본문 -->
			<div class="modal-body">
				<div class="card-body">
					<div class="form-group">
						<label for="exampleInputEmail1">주소 이름</label> <input type="text"
							class="form-control" id="addNameUp" name="addName"
							placeholder="주소 별명"> <input type="text"
							class="form-control" id="snUp" name="sn" placeholder="" hidden>

					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">전화번호</label> <input type="text"
							class="form-control" id="addTelUp" name="addTel"
							placeholder="전화번호">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">우편 번호</label>
						<button type="button" class="btn btn-primary"
							onclick="searchAddress1()">주소 검색</button>

						<input type="text" class="form-control" id="addZipUp"
							name="addZip" placeholder="우편번호">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">주소</label> <input type="text"
							class="form-control" id="add1Up" name="add1" placeholder="주소">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">상세 주소</label> <input type="text"
							class="form-control" id="add2Up" name="add2" placeholder="상세주소">
					</div>

				</div>
			</div>
			<!-- 모달 푸터 -->
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="addressUpdate">저장</button>
			</div>
		</div>
	</div>
</div>

<!-- sweetAlert -->
<link rel="stylesheet"
	href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>

<!-- ///// content 끝 ///// -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	    let memId = `<%=session.getAttribute("memId") != null ? session.getAttribute("memId") : "Guest"%>`;
	let addNo="";
	    $(function() {

			// 사용자 정보를 받음
			$.ajax({
				url : '/api/userInfo',
				method : 'GET',
				success : function(memVO) {
					console.log("로그인 정보: ", memVO);
					memId = memVO.memId; // 서버에서 받은 사용자 정보
					console.log("memId: ", memId);
					 let data={
					    		"memId":memId
					    }
					 $.ajax({
						    url: '/mypage/getMemberAddNO',
						    contentType: "application/json;charset=utf-8",
						    data: JSON.stringify(data),
						    type: "POST",
						    dataType: "json",
						    success: function(memberVO) {
						    	addNo = memberVO.addNo;
								console.log("addNo: ", addNo);



						    },
						    error: function(xhr, status, error) {
						        // 요청이 실패했을 때 처리할 코드
						        console.error("Request failed: " + error);
						    }
						});

					// 두 번째 AJAX 요청을 보내기 위한 데이터
					// 주소 목록 요청
					$.ajax({
						url : '/mypage/addressList',
						contentType : "application/json;charset=utf-8",
						data : JSON.stringify(data),
						type : "POST",
						dataType : "json",
						success : function(AddressVOList) {
							// 서버에서 받은 주소 정보를 처리하는 부분
							console.log("주소 정보:", AddressVOList);
							let input = "";
							$.each(AddressVOList, function(idx, AddressVO) {
// 								addNo=AddressVO.addNo;
								input += ` <ul class="addressList"style="border: 1px solid grey;">

								<div class="container1" ">
							    <strong>\${AddressVO.addName}</strong>

							  </div>
								      <p class="">
								        <span class="">\${AddressVO.addTel}</span>
								      </p>
								      <p class="">
								      \${AddressVO.add1}, \${AddressVO.add2} (\${AddressVO.addZip})
								      </p>
							      <div class="button-group">
							      <button type="button" data-toggle="modal"
							  		data-target="#addressChange" id="addressChangeIn" class="btn  btn-info" data-add-no="\${AddressVO.addNo}"  data-sn="\${AddressVO.sn}">수정</button>
							      <button type="button"  id="addressDel" class="btn  btn-danger" data-add-no="\${AddressVO.addNo}"  data-sn="\${AddressVO.sn}">삭제</button>
							      </div>
								  </ul>
					  `

							})
							if (input != "") {
								//스타일 적용용
								$("#addressList").html(input);
							    $(".addressList").css({
							        "list-style-type": "none",   // 리스트 스타일 제거 (선택적)
							        "padding": "10px"
							    });

							    $(".button-group").css({
							        "display": "flex", // 버튼들을 가로로 배치
							        "gap": "10px",     // 버튼들 사이의 간격
							        "justify-content": "flex-end" // 버튼들을 오른쪽 정렬
							    });

							    $(".btn").css({
							        "padding": "10px 20px", // 버튼 크기 조정
							        "font-size": "14px"
							    });
							}
						},
						error : function(xhr, status, error) {
							console.error("주소 목록 요청 실패:", error);
						}
					});
				},
				error : function(xhr, status, error) {
					console.error("로그인 정보 요청 실패:", error);
				}
			});
		});

		// 주소 검색 함수
		function searchAddress1() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = ''; // 주소 변수

					// 도로명 주소 또는 지번 주소를 선택했을 때 처리
					if (data.userSelectedType === 'R') { // 도로명 주소
						addr = data.roadAddress;
					} else { // 지번 주소
						addr = data.jibunAddress;
					}

					// 주소 정보를 해당 입력 필드에 넣기
					document.getElementById('addZipUp').value = data.zonecode; // 우편번호
					document.getElementById('add1Up').value = addr; // 주소
					document.getElementById('add2Up').focus(); // 상세 주소 입력 필드 포커스
				}
			}).open();
		}
		// 주소 검색 함수
		function searchAddress() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = ''; // 주소 변수

					// 도로명 주소 또는 지번 주소를 선택했을 때 처리
					if (data.userSelectedType === 'R') { // 도로명 주소
						addr = data.roadAddress;
					} else { // 지번 주소
						addr = data.jibunAddress;
					}

					// 주소 정보를 해당 입력 필드에 넣기
					document.getElementById('addZip').value = data.zonecode; // 우편번호
					document.getElementById('add1').value = addr; // 주소
					document.getElementById('add2').focus(); // 상세 주소 입력 필드 포커스
				}
			}).open();
		}
		// 비동기 주소 등록
		$("#addressAddChk").on("click", function() {

		    // 1. 가상 폼(이미지 포함) <form></form>
		    let formData = new FormData();

		    // 2. 엘리먼트들을 가상 폼에 넣기
		    let addName = $("#addName").val();
		    let addTel = $("#addTel").val();
		    let addZip = $("#addZip").val();
		    let add1 = $("#add1").val();
		    let add2 = $("#add2").val();

		    // 3. 입력값이 비어있다면
		    if (!addName || !addTel || !addZip || !add1 || !add2) {
		        var Toast = Swal.mixin({
		            toast: true,
		            position: 'top-end',
		            showConfirmButton: false,
		            timer: 1500
		        });
		        Toast.fire({
		            icon: 'warning',
		            title: '목록을 모두 채워주세요'
		        });
		        return;  // 값이 비어있으면 함수를 종료
		    }

		    // 입력 값들이 모두 존재하면 폼 데이터에 추가
		    formData.append("memId", memId);
		    formData.append("addNo", addNo);
		    formData.append("addName", addName);
		    formData.append("addTel", addTel);
		    formData.append("addZip", addZip);
		    formData.append("add1", add1);
		    formData.append("add2", add2);

		    // 4. 아작나써유.. 피씨다타써
		    $.ajax({
		        url: "/mypage/addAddressAjax",
		        processData: false,
		        contentType: false,
		        data: formData,
		        type: "post",
		        dataType: "text",
		        success: function(result) {
		            // 5. 결과 확인(1 또는 0)
		            if (result == 1) {
		                var Toast = Swal.mixin({
		                    toast: true,
		                    position: 'top-end',
		                    showConfirmButton: false,
		                    timer: 1500
		                });
		                Toast.fire({
		                    icon: 'success',
		                    title: '등록성공'
		                });
		                setTimeout(function() {
		                    location.href = "/mypage/address";
		                }, 1500);
		            } else {
		                var Toast = Swal.mixin({
		                    toast: true,
		                    position: 'top-end',
		                    showConfirmButton: false,
		                    timer: 1500
		                });
		                Toast.fire({
		                    icon: 'warning',
		                    title: '등록실패'
		                });
		            }
		        }
		    });
		});

		// 비동기 주소 수정
		$("#addressUpdate").on("click",function(){

			//1. 가상 폼(이미지 포함) <form></form>
			let formData = new FormData();

			//2. 엘리먼트들을 가상 폼에 넣기
			let addName=$("#addNameUp").val();
			let sn=$("#snUp").val();
			let addTel=$("#addTelUp").val();
			let addZip=$("#addZipUp").val();
			let add1=$("#add1Up").val();
			let add2=$("#add2Up").val();

			formData.append("memId", memId);
			formData.append("addNo", addNo);
			formData.append("sn", sn);
			formData.append("addName", addName);
			formData.append("addTel", addTel);
			formData.append("addZip", addZip);
			formData.append("add1", add1);
			formData.append("add2", add2);



			//4. 아작나써유.. 피씨다타써

				$.ajax({
					url : "/mypage/UpdateAddressAjax",
					processData : false,
					contentType : false,
					data : formData,
					type : "post",
					dataType : "text",
					success : function(result) {
						//5. 결과 확인(1 또는 0)
						//0 또는 1
						console.log("result : ", result);
						if(result==1){
							var Toast = Swal.mixin({
								toast : true,
								position : 'top-end',
								showConfirmButton : false,
								timer : 1500
							});
							Toast.fire({
								icon : 'success',
								title : '등록성공'
							});
							setTimeout(function(){
								location.href="/mypage/address";
							},1500);

						}else{
							var Toast = Swal.mixin({
								toast : true,
								position : 'top-end',
								showConfirmButton : false,
								timer : 1500
							});

							Toast.fire({
								icon : 'warning',
								title : '등록실패'
							});
						}
					}
				});
		})
		$(document).on("click", "#addressChangeIn", function() {
	    var addNo = $(this).data('add-no');
	    var sn = $(this).data('sn');

	    // 주소 변경 모달을 여는 코드
	    console.log("addNo:", addNo);
	    console.log("sn:", sn);
	    data={
	    		"addNo":addNo,
	    		"sn":sn
	    }
		$.ajax({
			url : '/mypage/addressDetailAjax',
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "json",
			success : function(addressVO) {
	console.log(addressVO);
	$("#addNameUp").val(addressVO.addName);
	$("#addTelUp").val(addressVO.addTel);
	$("#addZipUp").val(addressVO.addZip);
	$("#add1Up").val(addressVO.add1);
	$("#add2Up").val(addressVO.add2);
	$("#snUp").val(addressVO.sn);
			}
			})
			})
		$(document).on("click", "#addressDel", function() {
	    var addNo = $(this).data('add-no');
	    var sn = $(this).data('sn');

	    // 주소 변경 모달을 여는 코드
	    console.log("addNo:", addNo);
	    console.log("sn:", sn);
	    data={
	    		"addNo":addNo,
	    		"sn":sn
	    }

		$.ajax({
			url : '/mypage/addressDelAjax',
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "POST",
			dataType : "json",
		 success : function(result) {
				//5. 결과 확인(1 또는 0)
				//0 또는 1
				console.log("result : ", result);
				if(result==1){
					var Toast = Swal.mixin({
						toast : true,
						position : 'top-end',
						showConfirmButton : false,
						timer : 1500
					});
					Toast.fire({
						icon : 'success',
						title : '삭제성공'
					});
					setTimeout(function(){
						location.href="/mypage/address";
					},1500);

				}else{
					var Toast = Swal.mixin({
						toast : true,
						position : 'top-end',
						showConfirmButton : false,
						timer : 1500
					});

					Toast.fire({
						icon : 'warning',
						title : '등록실패'
					});
				}
			}
			})
			})
	</script>

<%@ include file="../include/footer_user.jsp"%>