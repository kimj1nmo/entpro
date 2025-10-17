
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

<!-- sweetAlert -->
<link rel="stylesheet"
	href="/adminlte/plugins/sweetalert2/sweetalert2.min.css">
<script src="/adminlte/plugins/sweetalert2/sweetalert2.min.js"></script>

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
#message-input {
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

#keySet {
	display: none;
	font-size: 15px;
	font-weight: bold;
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

<%@ page import="kr.or.ddit.page.comm.live.DockerStatusCheck"%>
<%
// DockerStatusCheck 객체 생성
DockerStatusCheck dockerStatus = new DockerStatusCheck();
boolean isDockerRunning = dockerStatus.isDockerRunning();
%>
<!-- ///// Main content 시작 ///// -->
<section class="" style="max-width: 1555455px; margin: 0 auto;">
	<div class="">
		<!-- ///// content 시작 ///// -->
		<div class="container">

			<div class="left">
				<p>
				<div class="video-container">
					<video id="video" controls></video>
					<div class="stream-info"></div>
					<h1 id="liveNameup">라이브제목</h1>
					<div class="aaa">
						<div class="leftA">
							<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal.member" var="memberVO" />
								<img id="artistNo" class="img-circle img-bordered-sm"
									id="artistNo"
									style="cursor: pointer; height: 40px; width: 40px;"
									data-file-save-locate="" src="" alt="DHFB" title="">
								<a href="" id="link" style="font-weight: bold;">${memberVO.memName}
								</a>
								<!-- 								<a href="http://localhost/comm/artistProfile?artistNo=5#" -->
								<%-- 									style="font-weight: bold;">${memberVO} </a> --%>
							</sec:authorize>
							<div>
								<button type="button" class="btn  btn-info" id="keyMake">스트리밍키
									확인</button>
								<a id="keySet">발급받는곳</a>
							</div>
							<div class="stream-info">
								<div id="liveSetting">
									<div class="card-body">
										<div class="form-group row">
											<label for="inputEmail3" class="col-sm-2 col-form-label">제목</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="liveName"
													placeholder="제목을 작성해주세요">
											</div>
										</div>

										<div class="form-group row">
											<div class="offset-sm-2 col-sm-10">
												<div class="form-check">
													<input type="checkbox" class="form-check-input"
														id="exampleCheck2"> <label
														class="form-check-label" for="exampleCheck2"> 맴버쉽
														여부</label>
												</div>
											</div>
										</div>
										<input type="file" class="form-control" id="uploadFiles"
											name="uploadFiles" value="" placeholder="사진" multiple />
										<div id="divImage" style="width: 40%; height: 40%"></div>
									</div>
								</div>
								<button type="button" id="previewBtn" class="btn bg-Lightblue">시연용</button>
								<button type="button" class="btn  btn-success " id="liveStart">라이브
									실행</button>
								<button type="button" class="btn  btn-warning " id="liveEnd">라이브
									종료</button>

							</div>
							<script type="text/javascript">
                  // 시연용 값 채워질 버튼
                  $("#previewBtn").on("click", function(){
                     $("#liveName").val("뉴진스 KGMA Dance Practice");
                  });
                  </script>
							<br> <br> <br> <br>
							<!-- 							<h2>Docker 상태 확인</h2> -->
							<!-- 							<p> -->
							<!-- 								Docker 실행 중: -->
							<%-- 								<%=isDockerRunning ? "예" : "아니오"%></p> --%>
						</div>
					</div>
					<div class="rightA"></div>

				</div>
				<!-- 								<div class="stream-info"> -->
				<!-- 									<p> -->
				<%-- 										스트리밍 IP 주소: <span class="ip-address">${streamIp}</span> --%>
				<!-- 									</p> -->
				<!-- 									로그인 했는가? -->
				<%-- 									<sec:authorize access="isAuthenticated()"> --%>

				<%-- 										<sec:authentication property="principal.member" var="memberVO" /> --%>
				<%-- 										<div>${memberVO.memName}님로그인상태</div> --%>

				<%-- 									</sec:authorize> --%>
				<!-- 								</div> -->

				</p>
			</div>
			<div class="right">
				<!-- 채팅 창 -->
				<div class="chat-container">
					<div id="chatBox" class="chatBox">

						<!-- 실시간 채팅 메시지가 여기에 표시됩니다 -->
					</div>
					<div class="chatInput">
						<textarea id="messageInput" placeholder="채팅 입력..."
							onkeydown="fKeyDown()"></textarea>
						<button id="send-message" onclick="jcSend()">보내기</button>
					</div>
				</div>
			</div>

			<!-- 			<div class="right"> -->
			<!-- 				<p> -->
			<!-- 				<div> -->
			<!-- 					//채팅창 -->
			<!-- 					<div id="chatBox"></div> -->
			<!-- 					<input type="text" id="message-input" value="" onkeydown="fKeyDown()"> -->
			<!-- 					<button type="button" id="edit" class="btn btn-primary" -->
			<!-- 						onclick="jcSend()">전송</button> -->
			<!-- 				</div> -->
			<!-- 				</p> -->
			<!-- 			</div> -->
		</div>
		<div></div>
		<script>
	    //로그인한 사람 정보 가져오기
	let memId="";
	let liveNo=0;
    let liveName = "";
    let keySet = $('#keySet');
    let jcmcSoc = null;
    let commRegNick="";
    // 체크박스 상태를 1 (체크됨) 또는 0 (체크되지 않음)으로 변환
     let memshipState ;

	  // 페이지가 종료되거나 이동할 때 호출되는 이벤트
   window.addEventListener("beforeunload", function () {
    // 입력값을 가져옴
    let liveName = $("#liveName").val();

    // 체크박스 상태를 1 (체크됨) 또는 0 (체크되지 않음)으로 변환
    let memshipState = $("#memshipState").prop('checked') ? 1 : 0;

    console.log("liveName", liveName);
    console.log("memshipState", memshipState);

    // 데이터를 서버로 전송
    let data = {
        "memId": memId,            // 사용자 ID
        "liveName": liveName,      // 라이브 제목
        "memshipState": memshipState, // 체크박스 상태 (1 또는 0)
        "liveNo": liveNo // 라이브 방 번호
    };

    fetch(`/${groupNo}/endLiveAjax`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'  // 데이터가 JSON 형식임을 명시
        },
        body: JSON.stringify(data)  // 데이터: JSON 문자열
    })
    .then(response => response.json())

    .catch(error => {
        console.error("Error during sending data:", error);
    });
});

	    //스트림키 보엿다가 숨기기
	 function showNumber() {
         const numberDiv = document.getElementById('numberDiv');
         numberDiv.style.display = 'block'; // 숫자 보이기

         setTimeout(() => {
             numberDiv.style.display = 'none'; // 5초 후 숫자 숨기기
         }, 5000); // 5000ms = 5초
     }
	        // 비디오 요소와 HLS 스트림 URL 설정
	        console.log(window);
	        var video = document.getElementById('video');
	        var videoUrl = 'http://${streamIp}:8080/live/${streamCode}.m3u8'; // 스트리밍 URL

	        function updateVideoSource(streamKey) {
	            // Dynamically set the video URL using the stream key (aaa)
	            console.log("New Video UstreamKeyRL:", streamKey);
	            var videoUrl = 'http://${streamIp}:8080/live/' + streamKey + '.m3u8'; // 스트리밍 URL
	            console.log("New Video URL:", videoUrl);

	            // If HLS.js is supported, load the new video stream
	            if (Hls.isSupported()) {
	                var hls = new Hls();
	                hls.loadSource(videoUrl);
	                hls.attachMedia(video);
	                hls.on(Hls.Events.MANIFEST_PARSED, function () {
	                    video.play();
	                });
	            } else if (video.canPlayType('application/vnd.apple.mpegurl')) {
	                // Safari 등에서는 기본적으로 HLS 지원
	                video.src = videoUrl;
	                video.addEventListener('loadedmetadata', function () {
	                    video.play();
	                });
	            } else {
	                console.error('HLS not supported in this browser');
	            }
	        }


	      const chatInput = document.querySelector("#chatInput");
	      const messageInput = document.querySelector("#messageInput");
	      let aaa;
	      //         console.log(${memberVO.memId});
	      $("#keyMake").on("click", function() {

            conn(aaa);
            updateVideoSource(aaa);
             keySet = $('#keySet');

         // 숫자 보이기
         keySet.fadeIn();

         setTimeout(() => {
             // 5초 후 숫자 숨기기
             keySet.fadeOut();
         }, 5000); // 5000ms = 5초
	      })

	              function fKeyDown() {
	                  if (event.keyCode == 13) {//엔터키는 13번
	                      jcSend();
	                  }
	              }



	              window.onload = function() {
	                  // 여기에 자동 실행할 함수 호출
	                  console.log("페이지 로드 완료, 자동 함수 실행");
	                  $.ajax({
	                      url: '/api/userInfo',
	                      method: 'GET',
	                      success: function(data) {
	                          console.log("로그인 정보: ", data)//memId 와 authName의 authList가들어잇음
	                          memId = data.memId; // 서버에서 받은 사용자 정보를 전역 정보에 입력 가능
//  	            	            $("#liveStart").prop("disabled", true);
	                          console.log("memId 정보: ", memId)
	                           data={
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
	                    			  data={
	                                       		"memId":memId
	                                       }
	                                   	$.ajax({
	                                   		url : `/${groupNo}/setArtistSetAjax`,
	                                   		contentType : "application/json;charset=utf-8",
	                                   		data : JSON.stringify(data),
	                                   		type : "POST",
	                                   		dataType : "json",
	                                   		success : function(communityVO) {
	        	                    			console.log("communityVO",communityVO);
	        	                    			$('#artistNo').attr('src', communityVO.fileSaveLocate);
	        	                    			$('#link').attr('href', '/'+communityVO.groupNo+'/profile2?memId=' + communityVO.memId)
	        	                    		    .text(communityVO.commRegNick);
	                                   		}})

                          		}

	                    		})
	                      },
	                      error: function(xhr, status, error) {
	                          console.error('로그인 정보 가져오기 실패:', error);
	                      }
	                  })
	              }

		             $("#liveEnd").on("click", function() {
		            	 let data = {
		            		        "memId": memId,            // 사용자 ID
		            		        "liveName": liveName,      // 라이브 제목
		            		        "memshipState": memshipState, // 체크박스 상태 (1 또는 0)
		            		        "liveNo": liveNo // 라이브 방 번호
		            		    };
		            	    console.log("끝내기 data", data);

		            		    fetch(`/${groupNo}/endLiveAjax`, {
		            		        method: 'POST',
		            		        headers: {
		            		            'Content-Type': 'application/json'  // 데이터가 JSON 형식임을 명시
		            		        },
		            		        body: JSON.stringify(data)  // 데이터: JSON 문자열
		            		    })
		            		    .then(response => response.json(

		            		    		))

		            		    .catch(error => {
		            		        console.error("Error during sending data:", error);
		            		    });
		            		    Swal.fire({
									title:'방송이 종료되었습니다.',
								      showConfirmButton: false,
						  icon: "question",
						      timer: 3000

						});
   	            	            $("#liveEnd").prop("disabled", true);

		            		});

	             $("#liveStart").on("click", function() {



	            	   // 입력값을 가져옴
	            	     liveName = $("#liveName").val();

	            	    // 체크박스 상태를 1 (체크됨) 또는 0 (체크되지 않음)으로 변환
	            	     memshipState = $("#memshipState").prop('checked') ? 1 : 0;

	            	    console.log("liveName", liveName);
	            	    console.log("memshipState", memshipState);

// 	            	    // 데이터를 서버로 전송
// 	            	    let data = {
// 	            	        "memId": memId,            // 사용자 ID
// 	            	        "liveName": liveName,      // 라이브 제목
// 	            	        "memshipState": memshipState // 체크박스 상태 (1 또는 0)
// 	            	    };

	            	    console.log("liveStart");
/////////////////////////////////////////////////////

	            		//1. 가상 폼(이미지 포함) <form></form>
	        			let formData = new FormData();

	        			formData.append("memId", memId);
	        			formData.append("liveName", liveName);
	        			formData.append("memshipState", memshipState);


	        			let inputFile = $("#uploadFiles");
	        			//이미지 파일들(a001.jpg,b002.jpg)
	        			let files = inputFile[0].files;
	        			console.log("files : ", files);

	        			for (let i = 0; i < files.length; i++) {
	        				formData.append("uploadFiles", files[i]);
	        			}

	        			//4. 아작나써유.. 피씨다타써

	        				$.ajax({
		            	        url: `/${groupNo}/createLiveAjax`, // URL에 groupNo 포함
	        					processData : false,
	        					contentType : false,
	        					data : formData,
	        					type : "post",
	        					dataType : "json",
	        					   success: function(LiveVO) {
	   	            	            // 요청 성공 시 처리
	   	            	            console.log("됫다 라이브", LiveVO);
	   	            	            $("#liveSetting").hide();
	   	            	            $("#keySet").html(LiveVO.liveNo+":해당 키를 입력해주세요");
	   	            	            $("#liveNameup").html(LiveVO.liveName);
	   	            	            $("#liveStart").html("방송중");
	   	            	            $("#liveStart").prop("disabled", true);
	   	            	            liveNo=LiveVO.liveNo;
	   	            	            aaa=LiveVO.liveNo;
// 									console.log("aaa",aaa);
// 									var Toast = Swal.mixin({
// 									      toast: true,
// 									      position: 'top-end',
// 									      showConfirmButton: false,
// 									      timer: 3000
// 									    });

// 									Toast.fire({
// 										icon:'success',
// 										title:'방송이 시작되었습니다.',

// 									});
									Swal.fire({
										title:'방송이 시작되었습니다.',
									      showConfirmButton: false,
							  icon: "question",
							      timer: 3000

							});
									showNumber();
	   	            	            },
	   	            	        error: function(xhr, status, error) {
	   	            	            // 요청 실패 시 처리
	   	            	            console.error("Error starting live:", error);
	   	            	        }
	        						})
//
	            	});


	             function jcSend(aaa) {
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
//                      //로그인이 안되있으면 막아라
                     if (!memidset.trim()) {
                         alert("로그인해주세요");
                         return;
                     }

                     // div 요소 생성 및 내용 설정
                     let sDiv = document.createElement("div");
                     sDiv.innerHTML = messageInput.value;
                     sDiv.style.textAlign = "right";
                     let currentDate = new Date();
                     console.log("연결 liveNo",liveNo);

                     // liveChatVO 객체 생성
                     let liveChatVO = {
                         memId: memId,
                         commRegNick: commRegNick,
                         liveChatTime: currentDate,
                         liveChatForwardNo: "",
                         liveNo: liveNo,
                         liveChatCn: messageInput.value
                     };

                     console.log("liveChatVO",liveChatVO)
                     // 메시지를 서버로 전송
                     jcmcSoc.send(JSON.stringify(liveChatVO));

                     messageInput.value = "";  // 입력값을 비워줍니다.
                     messageInput.focus();  // 입력창 포커스

                     // 채팅창 스크롤 바닥으로 이동
                     chatBox.scrollTo(0, chatBox.scrollHeight);

	             }


	              function conn(aaa) {
	                  //클라이언트 사이드 웹소켓, http =>ws, https=> wss, 자동으로 접속 시도

	                  //roqkftl localhost 쓰거나 ip를 써서 테스트해야하는데 그떄마다 바꾸기가 많이 귀찮음
	                  //http://localhost:포트번호/....
	                  console.log("location:",  location.href);
	                  let ip = location.href.split("/")[2];

	                  console.log("ip:",  ip);
	                  let link="ws://"+ip+"/chat/"+aaa;
	            console.log("link",link);

	                  jcmcSoc = new WebSocket(link);
	                  console.log("jcmcSoc:", jcmcSoc);

	                  //클라이언트 사이드 웹소켓, http =>ws, https=> wss, 자동으로 접속 시도
	                  // let jcmcSoc=new WebSocket("ws://localhost:8080/jcmc");

	                  //접속에 성공하면 자동으로 onopen 이벤트 발생
	                  jcmcSoc.onopen = () => {
	                      console.log("웹소켓 연결 완료");
	      //                 jcmcSoc.send("나야 나 진찬만찬");// send 메세지로 중계소(endpoint에 메세지를 보낼수 있음)
	                  }

	                  // 서버에서 메세지가 도착하면 자동으로 onmessage이벤트 발생!
	                  jcmcSoc.onmessage = () => {
	                     console.log("서버로 부터 왔어용", JSON.parse(event.data));
                         let rJson = JSON.parse(event.data);


                         //                 if (rJson.sender == "수민6") {
                         //                     alert(`${rJson.sender}님이 잠에서 깨엇다`)
                         //                 }

	                         let rDiv = document.createElement("div");
	                         //  rDiv.style.border = "1px solid orange";
                         rDiv.style.textAlign = "left";
                         rDiv.innerHTML = "<div>" + rJson.liveChatCn + "</div>";
                         console.log("rJson,", rJson);

                         chatBox.appendChild(rDiv);
                         console.log(chatBox.scrollHeight);
                         chatBox.scrollTo(0, chatBox.scrollHeight); // 스크롤바를 항상 바닥에
	                  }

	                  //아래 2개 별로 안중요!
	                  jcmcSoc.onclose = () => {
	                      console.log("웹소켓 닫히면 자동으로 실행됨");
	                  }
	                  jcmcSoc.onerror = () => {
	                      console.log("에러가 발생");
	                  }
	              }


	            //e : 변경 이벤트 오브젝트
	          	function handleImg(e){
	          		console.log("개똥이");

	          		//이미지 오브젝트들
	          		let files = e.target.files;

	          		//이미지 오브젝트 배열(a.jpgb.jpgc.jpg)
	          		let fileArr = Array.prototype.slice.call(files);

	          		//미리보기 영역 초기화
	          		$("#divImage").html("");

	          		fileArr.forEach(function(f){
	          			if(!f.type.match("image.*")){
//	           				alert("이미지 확장자만 가능합니다");
	          				return;//함수 종료
	          			}
	          			//이미지 읽기
	          			let reader = new FileReader();
	          			//e : 읽는 이벤트
	          			reader.onload = function(e){
	          				let img = "<img src='" + e.target.result + "' style='width:100%; height: 100%' />";
	          				//누적 : append(), 덮어쓰기 : html()
	          				$("#divImage").append(img);
	          			}
	          			reader.readAsDataURL(f);
	          		});

	          	}

	          	$(function(){
	          		$("#uploadFiles").on("change",handleImg);

	          	});
	    </script>

		<!-- ///// content 끝 ///// -->
	</div>
	<!-- /.container-fluid -->
</section>
<!-- ///// Main content 끝 ///// -->
