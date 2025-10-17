<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- ///// header 시작 ///// -->
<jsp:include page="../include/header_group.jsp"></jsp:include>
<!-- ///// header 끝 ///// -->

<!-- ///// nav 시작 ///// -->
<%-- <jsp:include page="../include/nav.jsp"></jsp:include> --%>
<!-- ///// nav 끝 ///// -->

<!-- ///// css 시작 ///// -->
<link href="/directlyCss/main.css" rel="stylesheet">
<link href="/directlyCss/artist.css" rel="stylesheet">


<style>
/* 페이지 전체 배경을 검은색으로 설정 */
body {
    background-color: #000; /* 검은색 */
    color: #fff; /* 기본 텍스트를 흰색으로 설정 */
}
/* section 콘텐츠의 배경색과 텍스트 색상 조정 */
section.content {
    background-color: #000; /* 어두운 회색 */
    color: #fff; /* 흰색 텍스트 */
    position: relative; /* 문서 흐름 내 배치 */
    top: -75px; /* header와 nav의 총 높이 */
    padding: 20px;
    border-radius: 8px; /* 섹션 모서리를 둥글게 */
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

.PcArtistPediaJumboIntro_cover__JcGS8:after {
	background: linear-gradient(0deg, #0d0e12, #0d0e1200);
	bottom: 0;
	content: "";
	height: 160px;
	left: 0;
	position: absolute;
	right: 0;
}

/* 그룹 소개 */
.PcArtistPediaDescriptionView_community_text__zBIBn {
  color: white;
  font-size: 15px;
  line-height: 21px;
  margin: 20px auto 0;
  white-space: pre-line;
  width: 450px;
}

.PcArtistPediaDescriptionView_info_wrap__nzixZ {
  display: flex;
  margin: 30px auto 0;
  width: -webkit-fit-content;
  width: fit-content;
}

.PcArtistPediaDescriptionView_event_wrap__IDHik {
  margin-left: 12px;
  padding-top: 2px;
  text-align: left;
}

.PcArtistPediaDescriptionView_event_text__YhGYU {
  color: grey;
  font-size: 15px;
  font-weight: 500;
  line-height: 21px;
}

.PcArtistPediaDescriptionView_event_day__PuyeB {
  color: white;
  display: block;
  font-size: 16px;
  line-height: 21px;
}
.MobileArtistPediaTitleView_title__i1MYr{
	color: white;
}
.MobileArtistPediaMemberProfilesView_artist__NevxP{
	color: white;
}
.PcArtistPediaTitleView_title__5VRG9{
	color: white;
}
.PcArtistPediaMediaOfMonthItemView_title__hNMjk{
	color: white;
}
.PcArtistPediaFanPickedLiveItemView_title__bFyLq{
	color: white;
}
.PcWeverseShopArrivalItemView_image_wrapper__68vpb{
	color: white;
}
.
</style>
<!-- ///// css 끝 ///// -->


<!-- ///// Main content 시작 ///// -->
<section class="content" style="max-width: 1200px; margin: 0 auto;">
	<div class="container-fluid">

		<!-- ///// content 시작 ///// -->
		<div class="ArtistPediaHomePage_wrapper__bOugz">
			<!-- 			<div -->
			<!-- 				class="MobileArtistPediaHeaderNavigation_header_wrap__Qmg2X MobileArtistPediaHeaderNavigation_is_scroll__Pxp6Q"> -->
			<!-- 				<strong -->
			<!-- 					class="MobileArtistPediaHeaderNavigation_community_name__I4I05 MobileArtistPediaHeaderNavigation_is_visible__dC5Qq" -->
			<!-- 					aria-hidden="true">NewJeans</strong> -->
			<!-- 				<div class="MobileArtistPediaHeaderNavigation_button_wrap__fDvIg"> -->
			<!-- 					<a href="/" -->
			<!-- 						class="MobileArtistPediaBackButtonView_button_wrapper__QrKzN MobileArtistPediaBackButtonView_is_scroll__Sv-94"><div -->
			<!-- 							class="MobileArtistPediaBackButtonView_icon_back__Uq9Z5"> -->
			<!-- 							<span class="blind">go back</span> -->
			<!-- 						</div></a><a -->
			<!-- 						class="MobileArtistPediaShareButtonView_button_wrapper__5tsus MobileArtistPediaShareButtonView_is_scroll__rhLlk" -->
			<!-- 						href="https://weverse.io/newjeansofficial/artistpedia?hl=ko"><div -->
			<!-- 							class="MobileArtistPediaShareButtonView_icon_share__U81tk"> -->
			<!-- 							<span class="blind">share</span> -->
			<!-- 						</div></a> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<!-- 			<div class="MobileArtistPediaJumboIntro_cover__Jb1os" -->
			<!-- 				data-cover-type="IMAGE"> -->
			<!-- 				<div class="MobileArtistPediaJumboIntro_wrap_cover_media__3pRvK"> -->
			<!-- 					<div class="MobileArtistPediaJumboImageView_blur__a6sXL" -->
			<!-- 						aria-hidden="true" -->
			<!-- 						style="background-image: url(&quot;https://phinf.wevpstatic.net/MjAyNDA2MjFfMTAw/MDAxNzE4OTQyOTI4OTU4.W737ocCc1HzjedvouBaoxegRatIW-bHyg1bGqRP9bX0g.4DAmqlmO8eyPRUPHradG-1BC_IPprQnfy7yw1R-3Cjog.JPEG/470a163f-20ca-4168-ba77-e3c09acd7bf1.jpeg&quot;);"></div> -->
			<!-- 					<div> -->
			<!-- 						<img -->
			<!-- 							src="https://phinf.wevpstatic.net/MjAyNDA2MjFfMTAw/MDAxNzE4OTQyOTI4OTU4.W737ocCc1HzjedvouBaoxegRatIW-bHyg1bGqRP9bX0g.4DAmqlmO8eyPRUPHradG-1BC_IPprQnfy7yw1R-3Cjog.JPEG/470a163f-20ca-4168-ba77-e3c09acd7bf1.jpeg?type=w2200" -->
			<!-- 							class="MobileArtistPediaJumboImageView_image__DFhMl" alt=""> -->
			<!-- 					</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="MobileArtistPediaDescriptionView_container__EPjkP"> -->
			<!-- 					<h2 class="MobileArtistPediaDescriptionView_community_name__0OvCN">NewJeans</h2> -->
			<!-- 				</div> -->
			<!-- 			</div> -->

			<div class="PcArtistPediaJumboIntro_intro__BOVBM">
				<div class="PcArtistPediaJumboIntro_cover__JcGS8"
					data-cover-type="IMAGE" data-shape-type="PORTRAIT">
					<div class="PcArtistPediaJumboImageView_image_wrap__pAIwS"
						data-shape-type="PORTRAIT">
						<div style="aspect-ratio: auto 1500/1280;">
						<c:forEach var="group" items="${groupsVOList}">

							<img
								src="${group.fileSaveLocate}"
								class="PcArtistPediaJumboImageView_image__fLqoW" width="1500"
								height="1280" alt="">
								</c:forEach>

						</div>
					</div>
				</div>
				<div class="PcArtistPediaJumboIntro_description__+Aprn">
					<h2 class="PcArtistPediaDescriptionView_community_name__UIJOl">${groupName}</h2>
				</div>
				<c:forEach var="group" items="${groupsVOList}">
				<p class="PcArtistPediaDescriptionView_community_text__zBIBn">${group.groupIntrcn}</p>
				<div class="PcArtistPediaDescriptionView_info_wrap__nzixZ"><div style="aspect-ratio: auto 46 / 46; overflow: hidden; border-radius: 50px;">
				</div>
				<div class="PcArtistPediaDescriptionView_event_wrap__IDHik">
				<div class="PcArtistPediaDescriptionView_event_text__YhGYU">데뷔일</div>
				<strong class="PcArtistPediaDescriptionView_event_day__PuyeB"> + ${daysSinceDebut}</strong></div>
				<!--
				<button type="button" class="PcArtistPediaDescriptionView_info_button__06-LP">
				아티스트 정보</button>
				 -->
				</div>
				</c:forEach>
			</div>
<!--
<p>데뷔일로부터: ${daysSinceDebut}</p>

<p>${groupsVOList} 왜 안 보이지</p>
<%-- <c:forEach var="group" items="${groupsVOList}"> --%>
<%--     그룹 번호: ${group.groupNo}<br> --%>
<%--     그룹 이름: ${group.groupName}<br> --%>
<%--     그룹 이름: ${group.fileSaveLocate}<br> --%>
<%-- </c:forEach> --%>
			 -->

			<!-- 프로필 -->
			<div class="ArtistPediaMemberProfiles_mobile_profile__aFh+w">
				<h3 class="PcArtistPediaTitleView_title__5VRG9">프로필</h3>
				<div class="flicking-viewport MobileArtistPediaMemberProfiles_flicking__yT4pJ"
         style="user-select: none; -webkit-user-drag: none; touch-action: pan-y;">
        <div class="flicking-camera" style="transform: translate(0px);">
            <!-- 아티스트 리스트 반복 -->
            <c:forEach var="artist" items="${artistList}">
                <a href="/${groupNo}/profile2?memId=${artist.memId}"
                   class="MobileArtistPediaMemberProfiles_flicking_item__7oRYs">
                    <div style="aspect-ratio: auto 106/106; overflow: hidden; border-radius: 30px;">
                        <!-- 아티스트 이미지 출력 -->
                        <img src="${artist.fileGroupVO.fileDetailVOList[0].fileSaveLocate}"
                             class="ArtistPediaProfileImageView_image__8aUhn" width="106"
                             height="106" alt="${artist.artistName}">
                    </div>
                    <!-- 아티스트 이름 출력 -->
                    <div class="MobileArtistPediaMemberProfilesView_artist__NevxP">${artist.artistName}</div>
                </a>
            </c:forEach>
        </div>
    </div>
			</div>
			<div class="ArtistPediaFanPickedLive_pc_fan_picked__Yj05g">
				<h3 class="PcArtistPediaTitleView_title__5VRG9">LIVE</h3>
				<ul class="PcArtistPediaFanPickedLive_live_list__nwpzt">
					<li><a
						class="PcArtistPediaFanPickedLiveItemView_thumbnail_link__exZJV"
						href="/${groupNo}/media"><div
								class="PcArtistPediaFanPickedLiveItemView_thumbnail_wrap__cKKNC">
								<div style="aspect-ratio: auto 351/220;">
									<img
										src="https://phinf.wevpstatic.net/MjAyMzA4MjdfMjcg/MDAxNjkzMTQxMjQ0ODk2.M1QjQro5DUFrCQLL1lIsZHQzhk7eumXudKmFtW7TVxgg.2HWfRnFolU_NN2xBMEuDMo0g3oeQ8FPW8Z1c3TMjB00g.JPEG/37a842c9-44d9-11ee-89eb-d4f5ef5a9532_03.jpg?type=f_or_off_640_360"
										class="PcArtistPediaFanPickedLiveItemView_thumbnail__VpXIq"
										width="351" height="220" alt="">
								</div>
								<em class="PcArtistPediaFanPickedLiveItemView_play_time__Pchic">11:24</em>
							</div>
							<div class="PcArtistPediaFanPickedLiveItemView_date__TbrnU">2023.
								08. 27. 21:44</div> <strong
							class="PcArtistPediaFanPickedLiveItemView_title__bFyLq">🐰🐰🐰🐰🐰🤍</strong></a></li>
					<li><a
						class="PcArtistPediaFanPickedLiveItemView_thumbnail_link__exZJV"
						href="/${groupNo}/media""><div
								class="PcArtistPediaFanPickedLiveItemView_thumbnail_wrap__cKKNC">
								<div style="aspect-ratio: auto 351/220;">
									<img
										src="https://phinf.wevpstatic.net/MjAyMzAxMTBfMjQx/MDAxNjczMzQ4MTE3NDU5.pGRA6syfvuKr1VeQrfUruH_fFt-G-yrw6YGBPJ3SQ_Eg.H2JIrpnYuqFid3ycushhE-6n4qtg2c8Dst61E1cHe84g.PNG/148dfb76-2de8-45e1-9dee-0f270e330573.png?type=f_or_off_640_360"
										class="PcArtistPediaFanPickedLiveItemView_thumbnail__VpXIq"
										width="351" height="220" alt="">
								</div>
								<em class="PcArtistPediaFanPickedLiveItemView_play_time__Pchic">54:59</em>
							</div>
							<div class="PcArtistPediaFanPickedLiveItemView_date__TbrnU">2023.
								01. 02. 16:52</div> <strong
							class="PcArtistPediaFanPickedLiveItemView_title__bFyLq">NewJeans
								"OMG" COUNTDOWN LIVE</strong></a></li>
				</ul>
			</div>
			<div class="ArtistPediaMediaOfMonth_pc_media_of_month__sMeRA">
				<h3 class="PcArtistPediaTitleView_title__5VRG9">멤버십</h3>
				<ul class="PcArtistPediaMediaOfMonth_list__B9LNZ">
					<li class="PcArtistPediaMediaOfMonth_item__p5R7Y"><a
						href="/${groupNo}/media"
						class="PcArtistPediaMediaOfMonthItemView_container__26enP"><div
								class="PcArtistPediaMediaOfMonthItemView_preview_area__GIrG7">
								<div style="aspect-ratio: auto 260/146;">
									<img
										src="https://phinf.wevpstatic.net/MjAyNDEyMTFfMTIw/MDAxNzMzODkxMjQyODY3.buqCWQNc5hMKcbipoH3sOLJO10jvCTSzz0muO8OGzxQg.J43Vx_nN8HJwUp8m002TIeZZvakO_39CcebwPxmy00kg.JPEG/66e2066b-5f43-44e3-a7c0-04ab97aa0b2c.jpeg?type=f_or_off_640_360"
										class="PcArtistPediaMediaOfMonthItemView_preview__UC+OZ"
										width="260" height="146" alt="">
								</div>
							</div> <strong class="PcArtistPediaMediaOfMonthItemView_title__hNMjk">The
								NewJeans Fairies mission is to protect our Bunnies and assist
								them whenever they are in need 👼</strong>
							<div class="PcArtistPediaMediaOfMonthItemView_date__BirsF">2024.12.12</div></a></li>
					<li class="PcArtistPediaMediaOfMonth_item__p5R7Y"><a
						href="/${groupNo}/media"
						class="PcArtistPediaMediaOfMonthItemView_container__26enP"><div
								class="PcArtistPediaMediaOfMonthItemView_preview_area__GIrG7">
								<div style="aspect-ratio: auto 260/146;">
									<img
										src="https://phinf.wevpstatic.net/MjAyNDEyMTlfMjg4/MDAxNzM0NTc1NDE0MzE4.Bw4NTkrbBvJG6s8T8y1t3cXYG7WwFknWL_MQyBJdg48g.9syvrnpAJ2vzTdBq1rmIq-Oek2ecVj0D_R-2_48eruMg.PNG/f4ff748f-33ed-4a8b-b037-2acdc144d3c7.png?type=f_or_off_640_360"
										class="PcArtistPediaMediaOfMonthItemView_preview__UC+OZ"
										width="260" height="146" alt="">
								</div>
							</div> <strong class="PcArtistPediaMediaOfMonthItemView_title__hNMjk">🐰+🥞=
								?</strong>
							<div class="PcArtistPediaMediaOfMonthItemView_date__BirsF">2024.12.19</div></a></li>
					<li class="PcArtistPediaMediaOfMonth_item__p5R7Y"><a
						href="/${groupNo}/media"
						class="PcArtistPediaMediaOfMonthItemView_container__26enP"><div
								class="PcArtistPediaMediaOfMonthItemView_preview_area__GIrG7">
								<span
									class="PcArtistPediaMediaOfMonthItemView_badge-unpurchased__Taxnw"></span>
								<div style="aspect-ratio: auto 260/146;">
									<img
										src="https://phinf.wevpstatic.net/MjAyNDExMjZfMTk1/MDAxNzMyNjAyODUwMTIw.wv8cmb8s7OVnfI39XJf1rIqngVgvEernuRhe5HPpvgkg.sttdRAyvSPu8I3YhaFtophcWJT9PIPwpUEga2XqUkcIg.JPEG/345751820997367914e8ecd9c-ebda-42d0-9830-6760c3bb50b8.jpg?type=f_or_off_640_360"
										class="PcArtistPediaMediaOfMonthItemView_preview__UC+OZ"
										width="260" height="146" alt="">
								</div>
								<em class="PcArtistPediaMediaOfMonthItemView_playtime__06YyN">01:20:32</em>
							</div> <strong class="PcArtistPediaMediaOfMonthItemView_title__hNMjk">NewJeans
								2025 SEASON'S GREETINGS Special Video</strong>
							<div class="PcArtistPediaMediaOfMonthItemView_date__BirsF">2024.12.12</div></a></li>
					<li class="PcArtistPediaMediaOfMonth_item__p5R7Y"><a
						href="/${groupNo}/media""
						class="PcArtistPediaMediaOfMonthItemView_container__26enP"><div
								class="PcArtistPediaMediaOfMonthItemView_preview_area__GIrG7">
								<div style="aspect-ratio: auto 260/146;">
									<img
										src="https://phinf.wevpstatic.net/MjAyNDEyMTNfMTA1/MDAxNzM0MDY4MzE4MjIy.9OxRu_xa09IedoaYPZRaNex9__gtcmut7iVEGU-0fEcg.q8kRE7mwcGC5HfjwNlZCXs6RWyDzPGLl4ZlryDB-LnQg.PNG/63c1effe-6fb1-4f31-84ea-add6d7d601e3.png?type=f_or_off_640_360"
										class="PcArtistPediaMediaOfMonthItemView_preview__UC+OZ"
										width="260" height="146" alt="">
								</div>
								<em class="PcArtistPediaMediaOfMonthItemView_playtime__06YyN">05:11</em>
							</div> <strong class="PcArtistPediaMediaOfMonthItemView_title__hNMjk">[Light
								Jeans] HANNI Marie Claire Photoshoot Behind💎 | NewJeans</strong>
							<div class="PcArtistPediaMediaOfMonthItemView_date__BirsF">2024.12.13</div></a></li>
				</ul>
			</div>
<!-- 			<div class="ArtistPediaWeverseShopArrivals_pc_new_arrivals__MrrPG"> -->
<!-- 				<div class="PcArtistPediaWeverseShopArrivals_title_wrap__H0VU-"> -->
<!-- 					<h3 class="PcArtistPediaTitleView_title__5VRG9">Merch</h3> -->
<%-- 					<a href="/${groupNo}/shop"  --%>
<!-- 						class="PcArtistPediaWeverseShopArrivals_shop__mEZsR">Artist -->
<!-- 						Shop ></button> -->
				</div>

				<br><br><h3 class="PcArtistPediaTitleView_title__5VRG9">Merch</h3>
				<ul class="PcArtistPediaWeverseShopArrivals_list__b24tr">
					<li class="item"><div role="button" tabindex="0"
							class="DivAsButtonView_div_as_button__jl7Xf PcWeverseShopArrivalItemView_arrival__brlxG PcWeverseShopArrivalItemView_-home__9Ox4o PcWeverseShopArrivalItemView_-dark__cbtG6">
							<div class="PcWeverseShopArrivalItemView_image_wrapper__68vpb">
								<img class="PcWeverseShopArrivalItemView_image__Kt6Sl"
									src="https://cdn-contents.weverseshop.io/public/shop/a158162fde1069e4ede95b02006c3dc9.png"
									alt="" loading="lazy">
							</div>
							<div class="PcWeverseShopArrivalItemView_label_wrapper__9vTcb">
								<span
									class="PcWeverseShopArrivalItemView_label__FlsbE PcWeverseShopArrivalItemView_-by_fans__lJKtj">by
									Fans</span><span
									class="PcWeverseShopArrivalItemView_label__FlsbE PcWeverseShopArrivalItemView_-exclusive__c-T6F">단독판매</span>
							</div>
							<em class="PcWeverseShopArrivalItemView_product__gnn7H">SWEATSHIRT
								TOKKI (IVORY)</em>
							<div class="PcWeverseShopArrivalItemView_price_wrapper__05mXU">
								<strong class="PcWeverseShopArrivalItemView_price__nQrit">₩79,000</strong>
							</div>
						</div></li>
					<li class="item"><div role="button" tabindex="0"
							class="DivAsButtonView_div_as_button__jl7Xf PcWeverseShopArrivalItemView_arrival__brlxG PcWeverseShopArrivalItemView_-home__9Ox4o PcWeverseShopArrivalItemView_-dark__cbtG6">
							<div class="PcWeverseShopArrivalItemView_image_wrapper__68vpb">
								<img class="PcWeverseShopArrivalItemView_image__Kt6Sl"
									src="https://cdn-contents.weverseshop.io/public/shop/a8080b237dd0b6af0c64332371a54eb1.png"
									alt="" loading="lazy">
							</div>
							<em class="PcWeverseShopArrivalItemView_product__gnn7H">Bunnies
								MEMBERSHIP</em>
							<div class="PcWeverseShopArrivalItemView_price_wrapper__05mXU">
								<strong class="PcWeverseShopArrivalItemView_price__nQrit">₩25,000</strong>
							</div>
						</div></li>
					<li class="item"><div role="button" tabindex="0"
							class="DivAsButtonView_div_as_button__jl7Xf PcWeverseShopArrivalItemView_arrival__brlxG PcWeverseShopArrivalItemView_-home__9Ox4o PcWeverseShopArrivalItemView_-dark__cbtG6">
							<div class="PcWeverseShopArrivalItemView_image_wrapper__68vpb">
								<img class="PcWeverseShopArrivalItemView_image__Kt6Sl"
									src="https://cdn-contents.weverseshop.io/public/shop/1f6792197b6bff2133d2ae368aaa7743.png"
									alt="" loading="lazy">
							</div>
							<div class="PcWeverseShopArrivalItemView_label_wrapper__9vTcb">
								<span
									class="PcWeverseShopArrivalItemView_label__FlsbE PcWeverseShopArrivalItemView_-exclusive__c-T6F">단독판매</span>
							</div>
							<em class="PcWeverseShopArrivalItemView_product__gnn7H">Light
								Stick</em>
							<div class="PcWeverseShopArrivalItemView_price_wrapper__05mXU">
								<strong class="PcWeverseShopArrivalItemView_price__nQrit">₩49,000</strong>
							</div>
						</div></li>
					<li class="item"><div role="button" tabindex="0"
							class="DivAsButtonView_div_as_button__jl7Xf PcWeverseShopArrivalItemView_arrival__brlxG PcWeverseShopArrivalItemView_-home__9Ox4o PcWeverseShopArrivalItemView_-dark__cbtG6">
							<div class="PcWeverseShopArrivalItemView_image_wrapper__68vpb">
								<img class="PcWeverseShopArrivalItemView_image__Kt6Sl"
									src="https://cdn-contents.weverseshop.io/public/shop/9c9fa9a74fb7f9df3dc8dd3fb381ca4b.png"
									alt="" loading="lazy">
							</div>
							<em class="PcWeverseShopArrivalItemView_product__gnn7H">NJ
								Supernatural FAN</em>
							<div class="PcWeverseShopArrivalItemView_price_wrapper__05mXU">
								<strong class="PcWeverseShopArrivalItemView_price__nQrit">₩12,000</strong>
							</div>
						</div></li>
					<li class="item"><div role="button" tabindex="0"
							class="DivAsButtonView_div_as_button__jl7Xf PcWeverseShopArrivalItemView_arrival__brlxG PcWeverseShopArrivalItemView_-home__9Ox4o PcWeverseShopArrivalItemView_-dark__cbtG6">
							<div class="PcWeverseShopArrivalItemView_image_wrapper__68vpb">
								<img class="PcWeverseShopArrivalItemView_image__Kt6Sl"
									src="https://cdn-contents.weverseshop.io/public/shop/795aa57905fba40bd9a6243d62310dcc.png"
									alt="" loading="lazy">
							</div>
							<em class="PcWeverseShopArrivalItemView_product__gnn7H">THE
								POWERPUFF GIRLS X NJ PHONE GRIP</em>
							<div class="PcWeverseShopArrivalItemView_price_wrapper__05mXU">
								<strong class="PcWeverseShopArrivalItemView_price__nQrit">₩13,000</strong>
							</div>
						</div></li>
					<li class="item"><div role="button" tabindex="0"
							class="DivAsButtonView_div_as_button__jl7Xf PcWeverseShopArrivalItemView_arrival__brlxG PcWeverseShopArrivalItemView_-home__9Ox4o PcWeverseShopArrivalItemView_-dark__cbtG6">
							<div class="PcWeverseShopArrivalItemView_image_wrapper__68vpb">
								<img class="PcWeverseShopArrivalItemView_image__Kt6Sl"
									src="https://cdn-contents.weverseshop.io/public/shop/f5d8066c4d3f18d0294dcb5c307e3b80.png"
									alt="" loading="lazy">
							</div>
							<em class="PcWeverseShopArrivalItemView_product__gnn7H">NewJeans
								'Supernatural' NJ X MURAKAMI Drawstring Bag ver.</em>
							<div class="PcWeverseShopArrivalItemView_price_wrapper__05mXU">
								<strong class="PcWeverseShopArrivalItemView_price__nQrit">₩22,500</strong>
							</div>
						</div></li>
				</ul>
			</div>
			<div
				class="fixed_bottom_layer FixedBottomLayerView_fixed_wrap__J2yYZ">
				<div id="fblpp" data-portal-ready="true">
					<div
						class="ArtistPediaGoToCommunityButton_wrapper__9QHTw ArtistPediaGoToCommunityButton_-pc__VZ1mx"
						data-is-mobile="false">
						<a class="PcArtistPediaGoToCommunityButtonView_link__SrrYQ"
							href="/${groupNo}/feed">커뮤니티 바로가기</a>
					</div>
				</div>
			</div>
		</div>


		<!-- ///// content 끝 ///// -->
	</div>
	<!-- /.container-fluid -->
</section>
<!-- ///// Main content 끝 ///// -->

<!-- ///// footer 시작 ///// -->
<!-- ///// footer 끝 ///// -->


