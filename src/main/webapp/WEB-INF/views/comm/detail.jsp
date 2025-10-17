<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../include/header_user2.jsp"></jsp:include>
<jsp:include page="../include/nav.jsp"></jsp:include>
<link href="/directlyCss/main.css" rel="stylesheet">

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- 아이콘 -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	
<style>
section.content {
    position: relative; /* 문서 흐름 내 배치 */
    top: 10px; /* header와 nav의 총 높이 */
}</style>
<section class="content" style="max-width: 1200px; margin: 0 auto;">


	<%--   	 <p>${loginUser.memId}</p> --%>
<%-- 	로그인 유저 확인 <p>${loginUser}</p> --%>
	<%-- 	 <p>${communityVO.commRegNick}</p> --%>
	<div class="container-fluid">
		<form id="frm">
			<!-- Hidden input for commNo and groupNo -->
			<input type="hidden" name="commNo" value="${communityVO.commNo}" />
			<input type="hidden" name="groupNo" value="${communityVO.groupNo}" />

			<div class="card-body">
				<div class="form-group">
					<label for="commRegNick">닉네임</label> <span>${communityVO.commRegNick}</span>
				</div>
				<div class="form-group">
					<label for="commWriteDate">작성일</label> <span>${communityVO.commWriteDate}</span>
				</div>
				<div class="form-group">
					<label for="memshipState">멤버십 전용 여부</label> <span>${communityVO.memshipState}</span>
				</div>
				<div class="form-group">
					<label for="commCn">내용</label> <input type="text"
						class="form-control" id="commCn" name="commCn"
						value="${communityVO.commCn}" readonly />
				</div>

				<!-- File List -->
				<c:if test="${communityVO.fileGroupVO != null}">
					<div class="form-group">
						<div class="row mb-3">
							<c:forEach var="fileDetailVO"
								items="${communityVO.fileGroupVO.fileDetailVOList}">
								<div class="col-sm-6">
									<img class="img-fluid img-thumbnail"
										src="${fileDetailVO.fileSaveLocate}"
										alt="${fileDetailVO.fileOriginalName}" />
								</div>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<div class="likecomment"
								style="display: flex; margin-left: 0px; align-items: center; gap: 10px;">
								<!-- 좋아요 버튼 및 좋아요 수 -->

								<button id="likeButton${communityVO.commNo}"
									onclick="toggleLike(${communityVO.commNo}, ${groupNo})"
									style="border: none; /* 테두리 제거 */ background: none; /* 배경색 제거 */ padding: 0; /* 내부 여백 제거 */ margin: 0; /* 외부 여백 제거 */ cursor: pointer;">
									<ion-icon name="heart-outline" style="font-size: 20px;"></ion-icon>
									<span id="likeCount${communityVO.commNo}">${communityVO.likeCount}</span>
								</button>
								<div class="comment">
									<button type="button" class="commentbutton"
										style="border: none; background: none; padding: 0; margin: 0; cursor: pointer;">
										<ion-icon name="chatbubble-outline"
											style="font-size: 20px; color: #444;"></ion-icon>
										<span style="margin-left: 5px;">${communityVO.commentCount}</span>
									</button>
								</div>
							</div>
			</div>

			<div class="card-footer">
				<span id="spn1" class="justify-between">
					<button type="button" id="edit" class="btn btn-primary">수정</button>
					<button type="button" id="delete" class="btn btn-danger">삭제</button>
				</span> <span id="spn2" class="justify-between" style="display: none;">
					<button id="updateSubmit" type="submit" class="btn btn-success">확인</button>
					<a
					href="/${communityVO.groupNo}/detail?commNo=${param.commNo}"
					class="btn btn-secondary">취소</a>
				</span>
			</div>
		</form>

		<a href="/${groupNo}/feed">게시글 목록</a>
	</div>

	<!-- /// 댓글 카드 시작 /// -->
	<div class="card">
		<!-- ///댓글 등록 영역 시작 /// -->
		<div class="card-header">
			<!-- 
      		요청URI : /member/createReplyPost
      		요청파라미터 : request{memId=u001,replyContent=댓글내용}
      		요청방식 : post
      		 -->
			<form id="createCommentFrm" class="form-horizontal"
				action="/${communityVO.groupNo}/createComment"
				method="post">
				<div class="input-group input-group-sm mb-0">
					<input type="hidden" name="commNo" value="${communityVO.commNo}" />
					<input type="hidden" name="memId" value="${user.memId}" /> <input
						type="text" id="cmmtCn" name="cmmtCn"
						class="form-control form-control-sm" placeholder="댓글내용" required />

					<div class="input-group-append">
						<button type="submit" id="commentSubmit" class="btn btn-danger" style="border-color: rgb(71, 178, 228); background-color: rgb(71, 178, 228)">댓글등록</button>
					</div>
				</div>
			</form>
		</div>
		<!-- ///댓글 등록 영역 끝 /// -->
		<!-- ///댓글 목록 영역 시작 /// -->
		<div class="card-body">
			<!-- 
      		model.addAttribute("memberReplyVOList", memberReplyVOList);
      		 -->
			<%-- 			<p>${commentVOList}</p> --%>
			<c:forEach var="commentVO" items="${commentVOList}">
				<div class="post clearfix"
					style="margin-left:${commentVO.lvl * 50}px;">
					<div class="user-block">

						<img class="img-circle img-bordered-sm"
							src="${commentVO.fileSaveLocate}" alt="User Image"> <span
							class="username"> <a href="#">${commentVO.commRegNick}</a>
							<a href="#" class="float-right btn-tool"><i
								class="fas fa-times"></i></a>
						</span> <fmt:formatDate
								value="${commentVO.cmmtDate}" pattern="yyyy-MM-dd" />
						</span>
					</div>
					<!-- /.user-block -->
					<span id="spanReplyContent${commentVO.cmmtNo}">${commentVO.cmmtCn}</span>
					<span class="spnReplyUpdate"
						data-reply-content="${commentVO.cmmtCn}"
						data-cmmt-no="${commentVO.cmmtNo}" data-toggle="modal"
						data-target="#modalReplyUpdate" style="cursor: pointer;"><i
						class="far fa-file-alt mr-1"></i></span> <span class="spnReplyDelete"
						data-cmmt-no="${commentVO.cmmtNo}" style="cursor: pointer;">
						<i class="fas fa-trash-alt"></i>
					</span>

					<div class="input-group input-group-sm mb-0">
						<input type="text" id="txt${commentVO.cmmtNo}" 
							class="form-control form-control-sm" placeholder="대댓글 입력" />
						<div class="input-group-append">
							<!-- request{memId=u001,parentIdx=8,replyContent=대댓글내용} 
	                    parentIdx : 부모글의 idx
	                    -->
							<button type="button" data-comm-no="${commentVO.commNo}" style="border-color: rgb(71, 178, 228); background-color: rgb(71, 178, 228)"
								data-cmmt-parent-no="${commentVO.cmmtNo}"
								class="btn btn-danger clsReplyBtn">대댓글입력</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- ///댓글 목록 영역 끝 /// -->
	</div>
	<!-- /// 댓글 카드 끝 /// -->
</section>


<script>

$(function () {
    // 수정 모드 전환
    $("#edit").on("click", function () {
        $("#spn1").hide();
        $("#spn2").show();
        $(".form-control").removeAttr("readonly");
    });

    // 확인 버튼 클릭 -> AJAX 요청
    $("#updateSubmit").on("click", function (event) {
        event.preventDefault(); // 기본 제출 동작 방지

        const groupNo = $("input[name='groupNo']").val();
        const commNo = $("input[name='commNo']").val();
        const commCn = $("#commCn").val();

        console.log("groupNo:", groupNo);
        console.log("commNo:", commNo);

        const url = `/${groupNo}/updatePost`;

        const formData = {
            commNo: commNo,
            groupNo: groupNo,
            commCn: commCn,
        };

        $.ajax({
            url: url,
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(formData),
            success: function (response) {
                if (response.result > 0) {
                    Swal.fire({
                        icon: "success",
                        title: "수정 성공!",
                        showConfirmButton: false,
                        timer: 3000,
                    }).then(() => {
                        window.location.href = `/${groupNo}/detail?commNo=${communityVO.commNo}`;
                    });
                } else {
                    Swal.fire({
                        icon: "error",
                        title: "수정 실패",
                        text: response.message,
                        showConfirmButton: true,
                    });
                }
            },
            error: function () {
                Swal.fire({
                    icon: "error",
                    title: "서버 요청 실패",
                    text: "네트워크 오류가 발생했습니다.",
                    showConfirmButton: true,
                });
            },
        });
    });

    // 삭제 버튼 클릭 -> AJAX 요청
    $("#delete").on("click", function () {
        const groupNo = $("input[name='groupNo']").val();
        const commNo = $("input[name='commNo']").val();

        Swal.fire({
            title: "정말 삭제하시겠습니까?",
            text: "삭제 후에는 복구할 수 없습니다!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#d33",
            cancelButtonColor: "#3085d6",
            confirmButtonText: "삭제",
            cancelButtonText: "취소",
        }).then((result) => {
            if (result.isConfirmed) {
                const url = `/${groupNo}/deletePost`;

                $.ajax({
                    url: url,
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify({ commNo: commNo }),
                    success: function (response) {
                        if (response.result > 0) {
                            Swal.fire({
                                icon: "success",
                                title: "삭제 성공!",
                                showConfirmButton: false,
                                timer: 3000,
                            }).then(() => {
                                window.location.href = `/${groupNo}/feed`;
                            });
                        } else {
                            Swal.fire({
                                icon: "error",
                                title: "삭제 실패",
                                text: response.message,
                                showConfirmButton: true,
                            });
                        }
                    },
                    error: function () {
                        Swal.fire({
                            icon: "error",
                            title: "서버 요청 실패",
                            text: "네트워크 오류가 발생했습니다.",
                            showConfirmButton: true,
                        });
                    },
                });
            }
        });
    });
//     console.log("COMM_NO:", commNo);
//     console.log("MEM_ID:", memId);
//     console.log("CMMT_CN:", cmmtCn);

    // 댓글 등록 AJAX 요청
    $("#commentSubmit").on("click", function (event) {
        event.preventDefault(); // 기본 제출 방지

        // Hidden Input 및 Textarea 값 가져오기
        const commNo = $("input[name='commNo']").val();
        const memId = $("input[name='memId']").val();
        const cmmtCn = $("#cmmtCn").val();
        const groupNo = $("input[name='groupNo']").val(); // 추가로 groupNo를 가져올 수도 있음

        if (!cmmtCn.trim()) {
            Swal.fire("오류", "댓글 내용을 입력하세요.", "error");
            return;
        }

        // 데이터 객체 생성
        const formData = {
            commNo: commNo,
            memId: memId,
            cmmtCn: cmmtCn,
        };

        // AJAX 요청
        $.ajax({
            url: `/${groupNo}/createComment`, // Controller URL
            type: "POST",
            contentType: "application/json", // JSON 형식으로 전송
            data: JSON.stringify(formData), // 데이터를 JSON으로 변환하여 전송
            success: function (response) {
                if (response > 0) {
                    Swal.fire("성공", "댓글이 등록되었습니다!", "success").then(() => {
                        location.reload(); // 페이지 새로고침
                    });
                } else {
                    Swal.fire("실패", "댓글 등록에 실패했습니다.", "error");
                }
            },
            error: function (xhr, status, error) {
                console.error("XHR 상태:", status);
                console.error("에러:", error);
                Swal.fire("오류", "서버와의 통신에 실패했습니다.", "error");
            },
        });
    });
    
    
  //대댓글 입력
	$(document).on("click",".clsReplyBtn",function(){
		//data-mem-id="u001"
		let commNo = $(this).data("commNo");
		//data-parent-idx="7"
		let cmmtParentNo = $(this).data("cmmtParentNo");
		//<input type="text" id="txt7"..
		let cmmtCn = $("#txt"+cmmtParentNo).val();
		
		//request{memId=u001,parentIdx=8,replyContent=대댓글내용}
		//JSON Object
		let data = {
			"commNo":commNo,
			"cmmtParentNo":cmmtParentNo,
			"cmmtCn":cmmtCn
		};
		console.log("data : ", data);
		
		//아작나써유..(피씨)다타써
		$.ajax({
            url: "/${groupNo}/createComment", // Controller URL
            contentType: "application/json", // JSON 데이터 전송
            data: JSON.stringify(data), // 데이터를 JSON 문자열로 변환
			type:"post",
			success:function(result){
				console.log("result : ", result);
				
				  location.reload(); // 페이지 새로고침
			}
		});
	});
    
    
    //댓글 삭제
    $(document).on("click", ".spnReplyDelete", function () {
        const cmmtNo = $(this).data("cmmtNo"); // data-cmmtNo 값 가져오기
        console.log("cmmtNo:", cmmtNo);
        console.log(`Request URL: /${groupNo}/updateDelete/`+cmmtNo);


        if (!cmmtNo) {
            console.error("cmmtNo 값이 없습니다.");
            return;
        }

        const groupNo = $("input[name='groupNo']").val(); // Hidden Input에서 groupNo 가져오기
        if (!groupNo) {
            console.error("groupNo 값이 없습니다.");
            return;
        }

        const data = { cmmtNo: cmmtNo };

        fetch(`/${groupNo}/updateDelete/`+cmmtNo, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(data),
        })
            .then((response) => {
                if (response.ok) {
                    console.log("댓글 삭제 성공");
                    $(this).closest(".post").remove(); // 해당 댓글 DOM 요소 삭제
                    Swal.fire("삭제되었습니다.", "", "success");
                } else {
                    console.error("댓글 삭제 실패:", response);
                    Swal.fire("삭제 실패", "댓글 삭제에 실패했습니다.", "error");
                }
            })
            .catch((error) => {
                console.error("네트워크 오류:", error);
                Swal.fire("오류", "서버와의 통신에 실패했습니다.", "error");
            });
    });

    
    
    

});

//좋아요
function toggleLike(commNo, groupNo) {
$.ajax({
url: `/${groupNo}/like/`+commNo,
type: 'POST',
success: function(response) {
// 버튼 텍스트 업데이트
$(`#likeButton${commNo}`).text(response.isLiked ? "좋아요 취소" : "좋아요");

// 좋아요 수 업데이트
$(`#likeCount${commNo}`).text(`${response.likeCount}명`);

location.reload();
},
error: function(xhr, status, error) {
console.error("Error:", xhr.responseText);
alert("로그인이 필요합니다.");
}
});
}

</script>


