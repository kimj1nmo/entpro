<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet"
	href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/hls.js@latest"></script>
<style>
.video-container {
	display: flex;
	justify-content: center;
	align-items: baseline;
	flex-direction: column;
	margin-top: 30px;
}

#video {
	width: 100%;
	max-width: 1000px;
	justify-content: center;
	align-items: center;
	height: auto;
	border: 5px solid #333;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.stream-info {
	text-align: center;
	margin-top: 20px;
	font-size: 18px;
	color: #666;
}

.stream-info .ip-address {
	font-weight: bold;
	color: #007bff;
}

/* 전체 화면을 반으로 나누기 */
.container {
	display: flex;
	/*                             width: 80%; */
	height: 100vh;
	/* 화면 전체 높이 */
	/* 	background-color: yellow; */
	border-radius: 10px;
}

.aaa {
	display: flex;
	width: 100%;
	height: 100%;
	/* 화면 전체 높이 */
	/*                             background-color: green; */
	border-radius: 10px;
}

.left {
	width: 80%;
	/*             background-color: lightblue; /* 왼쪽 부분 색상 */
}

.right {
	width: 20%;
	/*             background-color: lightgreen; /* 오른쪽 부분 색상 */
}

.leftA {
	width: 80%;
	/*             background-color: lightblue; /* 왼쪽 부분 색상 */
}

.rightA {
	width: 20%;
	display: flex;
	justify-content: flex-end;
} /* 채팅창 컨테이너 */
.chat-container {
	font-size: 10px; /* 폰트 크기 5px로 고정 */
	display: flex;
	flex-direction: column;
	height: 80%;
	border: 1px solid #ddd;
	padding: 10px;
	background-color: #f9f9f9;
}

/* 채팅 메시지를 보여주는 박스 */
.chatBox {
	flex-grow: 1;
	overflow-y: auto;
	margin-bottom: 10px;
	padding: 5px;
	background-color: #fff;
	border: 1px solid #ccc;
}

/* 개별 채팅 메시지 */
.chat-message {
	padding: 5px;
	margin-bottom: 5px;
	background-color: #e0e0e0;
	border-radius: 4px;
}

/* 메시지 입력창 */
.chatInput {
	display: flex;
	gap: 5px;
}

/* 메시지 입력을 위한 텍스트 영역 */
#messageInput {
	flex-grow: 1;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: none;
}

/* 보내기 버튼 */
#send-message {
	padding: 8px 15px;
	border: none;
	background-color: #007bff;
	color: white;
	cursor: pointer;
	border-radius: 4px;
}

/* 보내기 버튼 hover 상태 */
#send-message:hover {
	background-color: #0056b3;
}

.comment-box {
	max-width: 1600px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.comment {
	border-bottom: 1px solid #ddd;
	padding: 10px;
	margin-bottom: 10px;
}

.reply {
	margin-left: 20px;
	border-left: 2px solid #ddd;
	padding-left: 10px;
}

.comment-header {
	font-weight: bold;
	color: #333;
}

.comment-body {
	margin: 5px 0;
}

.comment-footer {
	font-size: 12px;
	color: #777;
}

.reply-btn {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
	font-size: 12px;
	border-radius: 3px;
}

.reply-btn:hover {
	background-color: #0056b3;
}

.reply-form {
	display: none;
	margin-top: 10px;
}
</style>
<!-- ///// header 시작 ///// -->
<jsp:include page="../include/header_user2.jsp"></jsp:include>
<!-- ///// header 끝 ///// -->

<!-- ///// nav 시작 ///// -->
<jsp:include page="../include/nav.jsp"></jsp:include>
<!-- ///// nav 끝 ///// -->

<!-- ///// css 시작 ///// -->
<link href="/directlyCss/main.css" rel="stylesheet">
<!-- ///// css 끝 ///// -->


<!-- ///// Main content 시작 ///// -->
<section class="" style="max-width: 1555455px; margin: 0 auto;">
	<div class="">
		<!-- ///// content 시작 ///// -->
		<div class="container">

			<div class="left">
				<p>
				<div class="video-container">
					<video id="video" controls>
						<!-- 	<source src="/resources/upload/2025/01/체크용/2025-01-04 12-08-58.mp4" type="video/mp4"> -->
						<source src="${VodVO.vodPath}" type="video/mp4">
					</video>
					<div class="stream-info"></div>
					<h1 id="liveName">${LiveVO.liveName}</h1>
					<%-- 					<h1 id="asdsa">${VodVO}</h1> --%>
					<div class="aaa">
						<div class="leftA">

							<img id="artistNo" class="img-circle img-bordered-sm"
								id="artistNo"
								style="cursor: pointer; height: 40px; width: 40px;"
								data-file-save-locate=""
								src="${VodVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}"
								alt="" title=""> <a
								href="/comm/artistProfile?artistNo=5#"
								style="font-weight: bold;" id="artistName">${VodVO.commRegNick}
							</a>
						</div>
						<div class="rightA">
							<a id="like"> <svg xmlns="http://www.w3.org/2000/svg"
									width="40" height="40" fill="currentColor"
									class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
  <path
										d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z" />
</svg>
							</a>
							<svg id="getURL" xmlns="http://www.w3.org/2000/svg" width="40"
								height="40" fill="currentColor" class="bi bi-share"
								viewBox="0 0 16 16">
  							<path
									d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.5 2.5 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5m-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3" />
							</svg>
							<!-- 							<button id="getURL">링크 복사</button> -->
						</div>
					</div>

				</div>
				<div class="stream-info">
					<p>
						<%-- 										스트리밍 IP 주소: <span class="ip-address">${streamIp}</span> --%>
					</p>
					<!-- 									로그인 했는가? -->
					<sec:authorize access="isAuthenticated()">

						<sec:authentication property="principal.member" var="memberVO" />
						<%-- 										<div>${memberVO.memName}님로그인상태</div> --%>

					</sec:authorize>
				</div>
<!-- 				<div class="comment-box"> -->
<!-- 					<h3>댓글</h3> -->

<!-- 					맨 위 댓글 입력 -->
<!-- 					<div class="new-comment"> -->
<!-- 						<input type="text" id="new-comment-input" -->
<!-- 							placeholder="댓글을 입력하세요..."> -->
<!-- 						<button onclick="addNewComment()">등록</button> -->
<!-- 					</div> -->

<!-- 					<div id="comment-list"> -->
<!-- 						기존 댓글 -->
<!-- 						<div class="comment" id="comment-1"> -->
<!-- 							<div class="comment-header">민지짱</div> -->
<!-- 							<div class="comment-body">언제한 방송인가요</div> -->
<!-- 							<div class="comment-footer"> -->
<!-- 								2024-02-01 12:00 -->
<!-- 								<button class="reply-btn" onclick="toggleReplyForm(1)">답글</button> -->
<!-- 							</div> -->

<!-- 							대댓글 -->
<!-- 							<div class="reply"> -->
<!-- 								<div class="comment-header">conn_123</div> -->
<!-- 								<div class="comment-body">어제 방송입니다</div> -->
<!-- 									<div class="comment-footer">2024-02-01 12:05</div> -->
<!-- 							</div> -->

<!-- 							대댓글 입력 폼 -->
<!-- 							<div class="reply-form" id="reply-form-1"> -->
<!-- 								<input type="text" placeholder="답글을 입력하세요..." id="reply-input-1"> -->
<!-- 								<button onclick="submitReply(1)">등록</button> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="comment" id="comment-2"> -->
<!-- 							<div class="comment-header">수원</div> -->
<!-- 							<div class="comment-body">잘보고 갑니다</div> -->
<!-- 							<div class="comment-footer"> -->
<!-- 								2024-02-01 13:00 -->
<!-- 								<button class="reply-btn" onclick="toggleReplyForm(2)">답글</button> -->
<!-- 							</div> -->

<!-- 							대댓글 입력 폼 -->
<!-- 							<div class="reply-form" id="reply-form-2"> -->
<!-- 								<input type="text" placeholder="답글을 입력하세요..." id="reply-input-2"> -->
<!-- 								<button onclick="submitReply(2)">등록</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 				</div> -->

				<script>
        let commentCount = 2; // 기존 댓글 개수

        function toggleReplyForm(commentId) {
            let form = document.getElementById("reply-form-" + commentId);
            form.style.display = form.style.display === "block" ? "none" : "block";
        }

        function submitReply(commentId) {
            let inputField = document.getElementById("reply-input-" + commentId);
            let replyText = inputField.value.trim();
            if (replyText === "") {
                alert("답글을 입력하세요.");
                return;
            }

            let replyDiv = document.createElement("div");
            replyDiv.className = "reply";
            replyDiv.innerHTML = `
                <div class="comment-header">userX</div>
                <div class="comment-body">${replyText}</div>
                <div class="comment-footer">방금 전</div>
            `;

            let commentBox = document.getElementById("comment-" + commentId);
            commentBox.appendChild(replyDiv);

            inputField.value = "";
            document.getElementById("reply-form-" + commentId).style.display = "none";
        }

        function addNewComment() {
            let inputField = document.getElementById("new-comment-input");
            let commentText = inputField.value.trim();
            if (commentText === "") {
                alert("댓글을 입력하세요.");
                return;
            }

            commentCount++;
            let newComment = document.createElement("div");
            newComment.className = "comment";
            newComment.id = "comment-" + commentCount;
            newComment.innerHTML = `
                <div class="comment-header">userX</div>
                <div class="comment-body">${commentText}</div>
                <div class="comment-footer">방금 전 <button class="reply-btn" onclick="toggleReplyForm(${commentCount})">답글</button></div>

                <!-- 대댓글 입력 폼 -->
                <div class="reply-form" id="reply-form-${commentCount}">
                    <input type="text" placeholder="답글을 입력하세요..." id="reply-input-${commentCount}">
                    <button onclick="submitReply(${commentCount})">등록</button>
                </div>
            `;

            let commentList = document.getElementById("comment-list");
            commentList.insertBefore(newComment, commentList.firstChild); // 최신 댓글이 위에 오도록 추가

            inputField.value = "";
        }
    </script>

				</p>
			</div>
			<div class="right">
				<!-- 채팅 창 -->
				<div class="chat-container">
					<div id="chatBox" class="chatBox"></div>

				</div>

			</div>


		</div>

		<div></div>
		<script>
		let commRegNick="";
		function nvl(expr1, expr2) {
			if (expr1 === undefined || expr1 == null || expr1 == "") {
				expr1 = expr2;
			}
			return expr1;
		}

		        // 비디오 요소와 HLS 스트림 URL 설정
// 		        console.log(window);
// 		        var video = document.getElementById('video');
// 		        var videoUrl = 'http://${streamIp}:8080/live/${streamCode}.m3u8'; // 스트리밍 URL
// 		        let liveLikeYn=0;
// 		        // HLS.js 객체 생성
// 		       if (Hls.isSupported()) {
// 		           var hls = new Hls();
// 		           hls.loadSource(videoUrl);
// 		           hls.attachMedia(video);
// 		            hls.on(Hls.Events.MANIFEST_PARSED, function () {
// 		                video.play();
// 		            });
// 		       } else if (video.canPlayType('application/vnd.apple.mpegurl')) {
// 		           // Safari 등에서는 기본적으로 HLS 지원
// 		            video.src = videoUrl;
// 		            video.addEventListener('loadedmetadata', function () {
// 		               video.play();
// 		            });
// 		        } else {
// 		            console.error('HLS not supported in this browser');
// 		        }


                                const chatBox = document.querySelector("#chatBox");
                                const messageInput = document.querySelector("#messageInput");
                                //         console.log(${memberVO.memId});

    	$("#like").on("click", function() {
            console.log("라이크 변화");
        	let streamCode=${streamCode};
            let memId="${memberVO.memId}";

            console.log("streamCode",streamCode);

        	let data = {
        			"memId" : memId,
        			"liveNo" : streamCode,
        			"liveLikeYn":liveLikeYn
        		}
         	$.ajax({
        		url : `/${groupNo}/setliveLikeAjax`,
        		contentType : "application/json;charset=utf-8",
        		data : JSON.stringify(data),
        		type : "POST",
        		dataType : "json",
        		success : function(LiveLikeVO) {
        			if(liveLikeYn==0){
        				let fill=`<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
        					  <path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
        						  </svg>`;
        				$("#like").html(fill);
        				console.log("진행",LiveLikeVO.liveLikeYn);
        				liveLikeYn=1;

        			}else{
        				let nonFill=`<svg xmlns="http://www.w3.org/2000/svg"
							width="40" height="40" fill="currentColor"
							class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z" />
</svg>`;
      				$("#like").html(nonFill);
    				console.log("진행",LiveLikeVO.liveLikeYn);
    				liveLikeYn=0;

        			}

        		}
        })
    	})
	$("#getURL").on("click", function() {
		   var currentUrl = window.location.href;
		   navigator.clipboard.writeText(currentUrl).then(function() {
            var Toast = Swal.mixin({
						      toast: true,
						      position: 'top-end',
						      showConfirmButton: false,
						      timer: 3000
						    });

						Toast.fire({
							icon:'success',
							title:'복사되었습니다'
						});

// 						//4) /member/list로 3초 후에 이동
// 	 					setTimeout(function(){
// 							setTimeout(()=>location.href="/companypage/manageArtist");
// 	 					},3000);

           }).catch(function(err) {
               $("#status").text("Failed to copy URL: " + err); // 실패 시 메시지
           });


	});
                                function fKeyDown() {
                                    if (event.keyCode == 13) {//엔터키는 13번
                                        jcSend();
                                    }
                                }

                                function jcSend() {
                                    // 연결 상태 확인
                                    if (!jcmcSoc) {
                                        alert("연결이 제대로 되어있지 않습니다. 새로고침해주세요.");
                                        return;
                                    }

                                    // messageInput.value가 비어있거나 null이면 함수 종료
                                    if (!messageInput.value.trim()) {
                                        alert("채팅 내용을 입력해주세요.");
                                        return;
                                    }
                                    // memidset 변수 설정
                                    let memidset = "${memberVO.memName}";
                                    console.log("memidset",memidset);
//                                     //로그인이 안되있으면 막아라
                                    if (!memidset.trim()) {
                                        alert("로그인해주세요");
                                        return;
                                    }

                                    // div 요소 생성 및 내용 설정
                                    let sDiv = document.createElement("div");
                                    sDiv.innerHTML = messageInput.value;
                                    sDiv.style.textAlign = "right";
                                    let currentDate = new Date();


                                    // liveChatVO 객체 생성
                                    let liveChatVO = {
                                        memId: memidset,
                                        liveChatTime: currentDate,
                                        liveChatForwardNo: "",
                                        liveNo: ${streamCode},
                                        liveChatCn: messageInput.value,
                                        commRegNick: commRegNick
                                    };

                                    // 메시지를 서버로 전송
                                    jcmcSoc.send(JSON.stringify(liveChatVO));

                                    messageInput.value = "";  // 입력값을 비워줍니다.
                                    messageInput.focus();  // 입력창 포커스

                                    // 채팅창 스크롤 바닥으로 이동
                                    chatBox.scrollTo(0, chatBox.scrollHeight);
                                }


                                let jcmcSoc = null;

                                window.onload = function () {
                                    // 여기에 자동 실행할 함수 호출
                                    console.log("페이지 로드 완료, 자동 함수 실행");
//                                     conn(); //채팅 서버 참가
                                    let memId="${memberVO.memId}";
                                    console.log("memId",memId);
                                    likeChk(memId);

                                    let data={
                                    		"memId":memId
                                    }
                                	$.ajax({
                                		url : `/${groupNo}/setCommRegNick`,
                                		contentType : "application/json;charset=utf-8",
                                		data : JSON.stringify(data),
                                		type : "POST",
                                		dataType : "json",
                                		success : function(CommunityVO) {

                                			commRegNick=CommunityVO.commRegNick;
                                			console.log("commRegNick",commRegNick);


                                		}
                                	});
                                $.ajax({
                            		url : `/${groupNo}/chatSetAjax`,
                                    type: 'GET',
                                    data: { "streamCode": "${ streamCode }" },  // streamCode를 쿼리 파라미터로 전달
                                    success: function(chatVOList) {
                                        console.log('chatVOList:', chatVOList);
                						$.each(chatVOList, function(idx, chatVO) {
                							 let liveChatTime = new Date(chatVO.liveChatTime);
                							 let formatliveChatTime = "";

                							 if (!isNaN(liveChatTime)) {
                								    formatliveChatTime = liveChatTime.getHours() + '시'
                								                        + String(liveChatTime.getMinutes()).padStart(2, '0')+'분';
                								}

                								console.log("formatliveChatTime",formatliveChatTime);  // 포맷된 시간 출력

                							  let rDiv = document.createElement("div");
                                              //  rDiv.style.border = "1px solid orange";
                                              rDiv.style.textAlign = "left";
                                              rDiv.innerHTML = "<div>" +chatVO.commRegNick+"("+formatliveChatTime+"):<br>"+ chatVO.liveChatCn + "</div>";
                                              chatBox.appendChild(rDiv);
                                              chatBox.scrollTo(0, chatBox.scrollHeight); // 스크롤바를 항상 바닥에

                						})
                                    },
                                    error: function(xhr, status, error) {
                                        console.error('Error:', error);
                                    }
                                });

                                };
                                function likeChk(memId){
                                	let streamCode=${streamCode};
                                    console.log("streamCode",streamCode);

                                	let data = {
                                			"memId" : memId,
                                			"liveNo" : streamCode
                                		}
                                	$.ajax({
                                		url : `/${groupNo}/liveLikeChkAjax`,
                                		contentType : "application/json;charset=utf-8",
                                		data : JSON.stringify(data),
                                		type : "POST",
                                		dataType : "json",
                                		success : function(LiveLikeVO) {
                                			if(LiveLikeVO.liveLikeYn==1){
                                				let fill=`<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
                                					  <path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
                                						  </svg>`;
                                				$("#like").html(fill);
                                				console.log("진행",LiveLikeVO.liveLikeYn);
                                			}
                                				liveLikeYn=LiveLikeVO.liveLikeYn;

                                		}
                                })

                                }

//                                 function conn() {
//                                     //클라이언트 사이드 웹소켓, http =>ws, https=> wss, 자동으로 접속 시도

//                                     //roqkftl localhost 쓰거나 ip를 써서 테스트해야하는데 그떄마다 바꾸기가 많이 귀찮음
//                                     //http://localhost:포트번호/....
//                                     console.log("location:", location.href);
//                                     let ip = location.href.split("/")[2];
//                                     console.log("ip:", ip);
//                                     let link = "ws://" + ip + "/chat/" + ${ streamCode };
//                                     //             jcmcSoc = new WebSocket(`ws://${jcName}/jcmc`);
//                                     jcmcSoc = new WebSocket(link);
//                                     console.log("jcmcSoc:", jcmcSoc);



//                                     //클라이언트 사이드 웹소켓, http =>ws, https=> wss, 자동으로 접속 시도
//                                     // let jcmcSoc=new WebSocket("ws://localhost:8080/jcmc");

//                                     //접속에 성공하면 자동으로 onopen 이벤트 발생
//                                     jcmcSoc.onopen = () => {
//                                         console.log("웹소켓 연결 완료");
//                                         //                 jcmcSoc.send("나야 나 진찬만찬");// send 메세지로 중계소(endpoint에 메세지를 보낼수 있음)
//                                     }

//                                     // 서버에서 메세지가 도착하면 자동으로 onmessage이벤트 발생!
//                                     jcmcSoc.onmessage = () => {
//                                         console.log("서버로 부터 왔어용", JSON.parse(event.data));
//                                         let rJson = JSON.parse(event.data);


//                                         //                 if (rJson.sender == "수민6") {
//                                         //                     alert(`${rJson.sender}님이 잠에서 깨엇다`)
//                                         //                 }

//                                         let rDiv = document.createElement("div");
//                                         //  rDiv.style.border = "1px solid orange";
//                                         rDiv.style.textAlign = "left";
//                                         rDiv.innerHTML = "<div>" + rJson.liveChatCn + "</div>";
//                                         console.log("rJson,", rJson);

//                                         chatBox.appendChild(rDiv);
//                                         console.log(chatBox.scrollHeight);
//                                         chatBox.scrollTo(0, chatBox.scrollHeight); // 스크롤바를 항상 바닥에
//                                     }


//                                     //아래 2개 별로 안중요!
//                                     jcmcSoc.onclose = () => {
//                                         console.log("웹소켓 닫히면 자동으로 실행됨");
//                                     }

//                                     jcmcSoc.onerror = () => {
//                                         console.log("에러가 발생");
//                                     }
//                                 }






                            </script>

		<!-- ///// content 끝 ///// -->
	</div>
	<!-- /.container-fluid -->
</section>
<!-- ///// Main content 끝 ///// -->