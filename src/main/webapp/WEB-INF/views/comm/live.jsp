
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- ///// header 시작 ///// -->
<jsp:include page="../include/header_user2.jsp"></jsp:include>
<!-- ///// header 끝 ///// -->

<!-- ///// nav 시작 ///// -->
<jsp:include page="../include/nav.jsp"></jsp:include>
<!-- ///// nav 끝 ///// -->

<!-- ///// css 시작 ///// -->
<link href="/directlyCss/main.css" rel="stylesheet">
<link href="/directlyCss/membership.css" rel="stylesheet">

<!-- ///// css 끝 ///// -->


<style>
#roleUserButton {
	position: fixed;
	right: 20px;
	top: 150px;
	padding: 10px 15px;
	background-color: #007BFF;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	display: block; /* Initially hidden */
}

#roleUserButton.show {
	display: block; /* Show the button when the class 'show' is added */
}

section.content {
	position: relative; /* 문서 흐름 내 배치 */
	top: 10px; /* header와 nav의 총 높이 */
	padding: 20px;
}

textarea#commCn {
	width: 100%;
	resize: none;
	outline: none;
	border: none; /* 테두리 제거 */
	padding: 10px;
	/*     background-color: #f9f9f9; /* 배경색 설정 */ */
	border-radius: 8px; /* 둥근 모서리 */
}

textarea#commCn:focus {
	outline: none; /* 포커스 시 추가 테두리 제거 */
	background-color: #ffffff; /* 포커스 시 배경색 변경 */
}
</style>
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>

<!-- ///// Main content 시작 ///// -->
<section class="content" style="max-width: 1200px; margin: 0 auto;">
	<div class="container-fluid">
		<!-- ///// content 시작 ///// -->
		<sec:authorize access="isAuthenticated()">
			<sec:authorize access="hasAnyRole('ROLE_ARTIST')">
				<div id="liveBtn"></div>
			</sec:authorize>

		</sec:authorize>
		<!--  커뮤니티 멤버십 -->
		<div class="MediaNavigationLayoutView_container__v9SMN">
			<div class="MediaNavigationLayoutView_content_wrap__1fOeP">
				<div>
					<div class="MediaListView_wrap__O26oo">
						<h3
							class="MediaTitleView_title__USbgd MediaTitleView_-list__bUuZ9">진행중인
							라이브</h3>
						<div class="MediaListView_list__Dait0" id="LiveList"></div>
						<div id="liveEmpty">
							<div class="no-live-message"
										style="text-align: center; margin-top: 50px; padding: 20px; background-color: #f8f9fa; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); max-width: 100%; margin-left: auto; margin-right: auto;">
										<h1
											style="font-size: 24px; color: #343a40; font-weight: 600; margin-bottom: 15px;">
											현재 진행중인 라이브가 없습니다.</h1>
										<p style="font-size: 16px; color: #6c757d; line-height: 1.5;">현재
											확인할 수 있는 라이브 방송이 없습니다.</p>
									</div>
						</div>
					</div>


				</div>
			</div>
		</div>
		<br>
		<br>
		<br>
		<div class="MediaNavigationLayoutView_container__v9SMN">
			<div class="MediaNavigationLayoutView_content_wrap__1fOeP">
				<div>

					<div class="MediaListView_wrap__O26oo">
						<h3
							class="MediaTitleView_title__USbgd MediaTitleView_-list__bUuZ9">지난
							라이브</h3>
						<div class="MediaListView_list__Dait0" id="oldLiveList"></div>
						<div id="oldLiveEmpty">
							<div class="container"
								style="width: 100%; max-width: 1200px; margin: 0 auto; padding: 20px;">
								<div id="oldLiveEmpty">
									<div class="no-live-message"
										style="text-align: center; margin-top: 50px; padding: 20px; background-color: #f8f9fa; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); max-width: 100%; margin-left: auto; margin-right: auto;">
										<h1
											style="font-size: 24px; color: #343a40; font-weight: 600; margin-bottom: 15px;">지난
											라이브가 없습니다</h1>
										<p style="font-size: 16px; color: #6c757d; line-height: 1.5;">현재
											시청할 수 있는 지난 라이브 방송이 없습니다.</p>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>


			<!-- ///// content 끝 ///// -->
		</div>
		<!-- /.container-fluid -->
</section>
<!-- ///// Main content 끝 ///// -->

<script type="text/javascript">
		$(function(){
		    let groupNo = `<%=session.getAttribute("groupNo") != null ? session.getAttribute("groupNo") : "Guest"%>`;
		    console.log(groupNo);
		    let memId = `<%=session.getAttribute("memId") != null ? session.getAttribute("memId") : "Guest"%>`;
		    console.log("memId",memId);
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
							let commTotal = map.commTotal;
							let memshipTotal = map.memshipTotal;
// 							getCommList("1", memId);
// 							getMemShipList("1", memId);
							memId=map.memId;
<%-- 						     groupNo = `<%=session.getAttribute("groupNo") != null ? session.getAttribute("groupNo") : "Guest"%>`; --%>
							console.log("memId2: ", memId);
							console.log("groupNo2: ", groupNo);
						    let data ={
						    		"memId":memId,
						    		"groupNo":groupNo
						    }
					    $.ajax({
			                url: `/${groupNo}/getArtistAuthChk`,
			                contentType: "application/json;charset=utf-8",  // 요청 타입 설정
			                data: JSON.stringify(data),  // 데이터를 JSON 형식으로 변환
			                type: "POST",  // 요청 방식 (POST)
			                dataType: "json",  // 응답 데이터 형식 (JSON)
			                success: function(result) {
			        		    console.log("result",result);

			        		    if(result==1){

			                	let str =`   <a href="/${groupNo}/liveStream">
			                		<button type="button" class="btn  btn-dark btn-lg"  id="roleUserButton">방송하기	</button>
			                        </a>`;
			                	$("#liveBtn").append(str);
			        		    }

			                }
			                });
						}
					});
				},
				error : function(xhr, status, error) {
					console.error('로그인 정보 가져오기 실패:', error);
				}
			});

		    $.ajax({
		        url: `/${groupNo}/liveListAjax`,
		        method: 'GET',
		        success: function (liveVOList) {
		            console.log('liveVOList:', liveVOList);

		            // 리스트가 비어 있는지 확인
		            if (liveVOList == null || liveVOList.length === 0) {
		                $("#liveEmpty").prop("hidden", false); // 비어 있는 경우 메시지 표시
		                $("#LiveList").prop("hidden", true);  // 진행 중인 라이브 목록 숨김
		            } else {
		                $("#liveEmpty").prop("hidden", true); // 메시지 숨김
		                $("#LiveList").prop("hidden", false); // 목록 표시

		                // 비동기 요청을 배열에 추가
		                $.each(liveVOList, function (idx, liveVO) {
		                    let liveDate = new Date(liveVO.liveDate);
		                    console.log('liveVO:', liveVO);

		                    let data1 = {
		                        "liveNo": liveVO.liveNo
		                    };

// 		                    $.ajax({
// 		                        url: `/${groupNo}/getSumnail`,
// 		                        contentType: "application/json;charset=utf-8",
// 		                        data: JSON.stringify(data1),
// 		                        type: "POST",
// 		                        dataType: "json",
// 		                        success: function (vodVO) {
// 		                            console.log("vodVO", vodVO);

		                            // 썸네일 경로
// 		                            let src = vodVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate;
		                            let src = liveVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate	;

		                            // 날짜 포맷팅
		                            let formatliveDate = "";
		                            if (!isNaN(liveDate)) {
		                                formatliveDate = liveDate.getFullYear() + '. '
		                                    + String(liveDate.getMonth() + 1).padStart(2, '0') + '. '
		                                    + String(liveDate.getDate()).padStart(2, '0');
		                            }

		                            // insertLiveList에 동적으로 항목 추가
		                            let insertLiveList = `
		                                <div class="item">
		                                    <div class="RelatedProductItemView_thumbnail_wrap__ylVG8">
		                                        <div class="VideoThumbnailView_thumbnail_wrap__ZHomL">
		                                            <div style="aspect-ratio: auto 320/180;">
		                                                <a href="/\${groupNo}/liveWatch?streamCode=\${liveVO.liveNo}">
		                                                    <img src="\${src}" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt="">
		                                                </a>
		                                            </div>
		                                        </div>
		                                    </div>

		                                    <div class="RelatedProductItemView_pakage_detail__gQVU+">
		                                        <strong class="RelatedProductItemView_package_name__-Xmh0">\${liveVO.liveName}</strong>
		                                        <div class="RelatedProductItemView_package_info__R7Ce1">
		                                            <div class="RelatedProductItemView_info_item__E6C-5">
		                                                <span class="RelatedProductItemView_package_date__cTAZL"> \${liveVO.commRegNick}</span>
		                                            </div>
		                                            <div class="RelatedProductItemView_info_item__E6C-5">
		                                                <div class="RelatedProductItemView_package_count__pzkhA">
		                                                    날짜. \${formatliveDate}
		                                                </div>
		                                            </div>
		                                            <div class="RelatedProductItemView_info_item__E6C-5">
		                                                <div class="RelatedProductItemView_package_count__pzkhA">
		                                                    <span class="RelatedProductItemView_count_badge__uS2QK">라이브</span>
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            `;
		                            $("#LiveList").append(insertLiveList);
// 		                        },
// 		                        error: function (xhr, status, error) {
// 		                            console.error('썸네일 가져오기 실패:', error);
// 		                        }
// 		                    });
		                });
		            }
		        },
		        error: function (xhr, status, error) {
		            console.error('정보 가져오기 실패:', error);
		        }
		    });


		    $.ajax({
		        url: `/${groupNo}/oldLiveListAjax`,
		        method: 'GET',
		        success: function (liveVOList) {
		            console.log('liveVOList:', liveVOList);

		            // 리스트가 비어 있는지 확인
		            if (liveVOList == null || liveVOList.length === 0) {
		                $("#oldLiveEmpty").prop("hidden", false); // 비어 있는 경우 메시지 표시
		                $("#oldLiveList").prop("hidden", true);  // 진행 중인 라이브 목록 숨김
		            } else {
		            	   $("#oldLiveEmpty").prop("hidden", true); // 메시지 숨김
			                $("#oldLiveList").prop("hidden", false); // 목록 표시

			                $.each(liveVOList, function(idx, liveVO) {
				                let liveDate = new Date(liveVO.liveDate);
				                console.log('아카이브 liveVO:', liveVO);
				                console.log('fileSaveLocate:', liveVO.vodVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate);

				                let data = {
				                    "liveNo": liveVO.liveNo
				                };

				                // Default thumbnail image in case of error
				                let defaultThumbnail = '/resources/upload/2025/01/03/d910a41a-5938-4dcb-bfed-b6e756ccbb5d_KakaoTalk_20241204_145136660_01.jpg';



				                        // 썸네일 경로
				                        let src = liveVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate || defaultThumbnail;
				                        console.log('src', src);

				                        // 날짜 포맷팅
				                        let formatliveDate = "";
				                        if (!isNaN(liveDate)) {
				                            formatliveDate = liveDate.getFullYear() + '. '
				                                             + String(liveDate.getMonth() + 1).padStart(2, '0') + '. '
				                                             + String(liveDate.getDate()).padStart(2, '0');
				                        }

				                        // insertLiveList에 동적으로 항목 추가
				                        let insertLiveList = `
				                            <div class="item">
				                                <div class="RelatedProductItemView_thumbnail_wrap__ylVG8">
				                                    <div class="VideoThumbnailView_thumbnail_wrap__ZHomL">
				                                        <div style="aspect-ratio: auto 320/180;">
				                                            <a href="/\${groupNo}/vodWatch?streamCode=\${liveVO.liveNo}">
				                                                <img src="\${src}" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt="Thumbnail">
				                                            </a>
				                                        </div>
				                                    </div>
				                                </div>
				                                <div class="RelatedProductItemView_pakage_detail__gQVU+">
				                                    <strong class="RelatedProductItemView_package_name__-Xmh0">\${liveVO.liveName}</strong>
				                                    <div class="RelatedProductItemView_package_info__R7Ce1">
				                                        <div class="RelatedProductItemView_info_item__E6C-5">
				                                            <span class="RelatedProductItemView_package_date__cTAZL">\${liveVO.commRegNick}</span>
				                                        </div>
				                                        <div class="RelatedProductItemView_info_item__E6C-5">
				                                            <div class="RelatedProductItemView_package_count__pzkhA">
				                                                날짜. \${formatliveDate}
				                                            </div>
				                                        </div>
				                                        <div class="RelatedProductItemView_info_item__E6C-5">
				                                            <div class="RelatedProductItemView_package_count__pzkhA">
				                                                <span class="RelatedProductItemView_count_badge__uS2QK">라이브</span>
				                                            </div>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                        `;

				                        // Add the item to the LiveList container
				                        $("#oldLiveList").append(insertLiveList);

				            });

		            }
		        },
		        error: function (xhr, status, error) {
		            console.error('정보 가져오기 실패:', error);
		        }
		    });




// 		    $.ajax({
// 		        url: `/${groupNo}/oldLiveListAjax`,
// 		        method: 'GET',
// 		        success: function(liveVOList) {
// 		            console.log('liveVOList:', liveVOList);

// 		            if (liveVOList == null) {
// 		                $("#oldLiveEmpty").prop("hidden", true);
// 		            }

// 		            // 비동기 요청을 배열에 추가
// 		            $.each(liveVOList, function(idx, liveVO) {
// 		                let liveDate = new Date(liveVO.liveDate);
// 		                console.log('아카이브 liveVO:', liveVO);
// 		                console.log('fileSaveLocate:', liveVO.vodVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate);

// 		                let data = {
// 		                    "liveNo": liveVO.liveNo
// 		                };

// 		                // Default thumbnail image in case of error
// 		                let defaultThumbnail = '/resources/upload/2025/01/03/d910a41a-5938-4dcb-bfed-b6e756ccbb5d_KakaoTalk_20241204_145136660_01.jpg';

// 		                $.ajax({
// 		                    url: `/${groupNo}/getSumnail`,
// 		                    contentType: "application/json;charset=utf-8",
// 		                    data: JSON.stringify(data),
// 		                    type: "POST",
// 		                    dataType: "json",
// 		                    success: function(vodVO) {
// 		                        console.log("아카이브vodVO", vodVO);

// 		                        // 썸네일 경로
// 		                        let src = vodVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate || defaultThumbnail;

// 		                        // 날짜 포맷팅
// 		                        let formatliveDate = "";
// 		                        if (!isNaN(liveDate)) {
// 		                            formatliveDate = liveDate.getFullYear() + '. '
// 		                                             + String(liveDate.getMonth() + 1).padStart(2, '0') + '. '
// 		                                             + String(liveDate.getDate()).padStart(2, '0');
// 		                        }

// 		                        // insertLiveList에 동적으로 항목 추가
// 		                        let insertLiveList = `
// 		                            <div class="item">
// 		                                <div class="RelatedProductItemView_thumbnail_wrap__ylVG8">
// 		                                    <div class="VideoThumbnailView_thumbnail_wrap__ZHomL">
// 		                                        <div style="aspect-ratio: auto 320/180;">
// 		                                            <a href="/${groupNo}/liveWatch?streamCode=${liveVO.liveNo}">
// 		                                                <img src="${src}" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt="Thumbnail">
// 		                                            </a>
// 		                                        </div>
// 		                                    </div>
// 		                                </div>
// 		                                <div class="RelatedProductItemView_pakage_detail__gQVU+">
// 		                                    <strong class="RelatedProductItemView_package_name__-Xmh0">${liveVO.liveName}</strong>
// 		                                    <div class="RelatedProductItemView_package_info__R7Ce1">
// 		                                        <div class="RelatedProductItemView_info_item__E6C-5">
// 		                                            <span class="RelatedProductItemView_package_date__cTAZL">${liveVO.commRegNick}</span>
// 		                                        </div>
// 		                                        <div class="RelatedProductItemView_info_item__E6C-5">
// 		                                            <div class="RelatedProductItemView_package_count__pzkhA">
// 		                                                날짜. ${formatliveDate}
// 		                                            </div>
// 		                                        </div>
// 		                                        <div class="RelatedProductItemView_info_item__E6C-5">
// 		                                            <div class="RelatedProductItemView_package_count__pzkhA">
// 		                                                <span class="RelatedProductItemView_count_badge__uS2QK">라이브</span>
// 		                                            </div>
// 		                                        </div>
// 		                                    </div>
// 		                                </div>
// 		                            </div>
// 		                        `;

// 		                        // Add the item to the LiveList container
// 		                        $("#oldLiveList").append(insertLiveList);
// 		                    },
// 		                    error: function(xhr, status, error) {
// 		                        console.error('썸네일 가져오기 실패:', error);

// 		                        // In case of failure, use default thumbnail
// 		                        let src = defaultThumbnail;

// 		                        // 날짜 포맷팅
// 		                        let formatliveDate = "";
// 		                        if (!isNaN(liveDate)) {
// 		                            formatliveDate = liveDate.getFullYear() + '. '
// 		                                             + String(liveDate.getMonth() + 1).padStart(2, '0') + '. '
// 		                                             + String(liveDate.getDate()).padStart(2, '0');
// 		                        }

// 		                        // insertLiveList에 동적으로 항목 추가
// 		                        let insertLiveList = `
// 		                            <div class="item">
// 		                                <div class="RelatedProductItemView_thumbnail_wrap__ylVG8">
// 		                                    <div class="VideoThumbnailView_thumbnail_wrap__ZHomL">
// 		                                        <div style="aspect-ratio: auto 320/180;">
// 		                                            <a href="/${groupNo}/liveWatch?streamCode=${liveVO.liveNo}">
// 		                                                <img src="${src}" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt="Thumbnail">
// 		                                            </a>
// 		                                        </div>
// 		                                    </div>
// 		                                </div>
// 		                                <div class="RelatedProductItemView_pakage_detail__gQVU+">
// 		                                    <strong class="RelatedProductItemView_package_name__-Xmh0">${liveVO.liveName}</strong>
// 		                                    <div class="RelatedProductItemView_package_info__R7Ce1">
// 		                                        <div class="RelatedProductItemView_info_item__E6C-5">
// 		                                            <span class="RelatedProductItemView_package_date__cTAZL">${liveVO.commRegNick}</span>
// 		                                        </div>
// 		                                        <div class="RelatedProductItemView_info_item__E6C-5">
// 		                                            <div class="RelatedProductItemView_package_count__pzkhA">
// 		                                                날짜. ${formatliveDate}
// 		                                            </div>
// 		                                        </div>
// 		                                        <div class="RelatedProductItemView_info_item__E6C-5">
// 		                                            <div class="RelatedProductItemView_package_count__pzkhA">
// 		                                                <span class="RelatedProductItemView_count_badge__uS2QK">라이브</span>
// 		                                            </div>
// 		                                        </div>
// 		                                    </div>
// 		                                </div>
// 		                            </div>
// 		                        `;
// 		                        // Add the item to the LiveList container
// 		                        $("#oldLiveList").append(insertLiveList);
// 		                    }
// 		                });
// 		            });
// 		        },
// 		        error: function(xhr, status, error) {
// 		            console.error('정보 가져오기 실패:', error);
// 		        }
// 		    });



		});
		</script>

<!-- ///// footer 시작 ///// -->
<!-- ///// footer 끝 ///// -->


