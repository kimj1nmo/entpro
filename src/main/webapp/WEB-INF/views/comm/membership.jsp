<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- ///// header 시작 ///// -->
<jsp:include page="../include/header_user2.jsp"></jsp:include>
<!-- ///// header 끝 ///// -->

<!-- ///// nav 시작 ///// -->
<jsp:include page="../include/nav.jsp"></jsp:include>
<!-- ///// nav 끝 ///// -->

<!-- ///// css 시작 ///// -->
<link href="/directlyCss/main.css" rel="stylesheet">
<link href="/directlyCss/membership.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn-v2pstatic.weverse.io/wev_web_fe/p/2_32_4/public/static/css/9992.601c24fa.chunk.css">
<!-- ///// css 끝 ///// -->


<style>

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

/* 부모 요소: 이미지가 확대될 때 넘치는 부분을 숨김 */
.VideoThumbnailView_thumbnail_wrap__ZHomL {
    position: relative;
    overflow: hidden; /* 확대된 이미지가 틀을 벗어나지 않도록 */
    display: inline-block;
    border-radius: 10px; /* 둥근 모서리 효과 (선택 사항) */
}

/* 이미지 확대 효과 */
.VideoThumbnailView_thumbnail__1I-71 {
    transition: transform 0.3s ease-in-out; /* 부드러운 확대 효과 */
}

/* 마우스를 올렸을 때 확대 */
.VideoThumbnailView_thumbnail_wrap__ZHomL:hover .VideoThumbnailView_thumbnail__1I-71 {
    transform: scale(1.1); /* 1.2배 확대 */
}


/* 모달 배경 */
.membership-modal {
    position: fixed;
    top: 50px; /* 네비게이션 아래에 위치 */
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* 투명한 검정 배경 */
    backdrop-filter: blur(2px); /* 흐림 효과 */
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 999; /* 네비게이션 위로 표시 */
}

/* 모달 컨텐츠 */
.membership-modal-content {
/*     background: rgba(255, 255, 255, 0.9); /* 투명한 흰색 배경 */ */
    padding: 20px;
    border-radius: 10px;
    text-align: center;
    width: 400px;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
}
ReactModal__Overlay ReactModal__Overlay--after-open BaseModalView_modal_overlay__ap5fH{
background-color:white;}

/* 닫기 버튼 */
#closeModal {
    background: #007bff;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 5px;
    cursor: pointer;
}

#closeModal:hover {
    background: #0056b3;
}

</style>
<!-- ///// Main content 시작 ///// -->
<section class="content" style="max-width: 1200px; margin: 0 auto;">
	<div class="container-fluid">
		<!-- ///// content 시작 ///// -->

		<!--  커뮤니티 멤버십 -->
		<div class="MediaNavigationLayoutView_container__v9SMN">
		<div class="MediaNavigationLayoutView_content_wrap__1fOeP">
			<div>
				<div class="MediaListView_wrap__O26oo">
					<h3 class="MediaTitleView_title__USbgd MediaTitleView_-list__bUuZ9">최신
						미디어</h3>
					<div class="MediaListView_list__Dait0">
					

<!-- 멤버십 제한 모달 (멤버십이 없을 경우 표시) -->
<c:if test="${!isMembershipActive}">
<div id="membershipModal" class="membership-modal"><div class="ReactModal__Overlay ReactModal__Overlay--after-open BaseModalView_modal_overlay__ap5fH" style="z-index: 20003;"><div id="modal" class="ReactModal__Content ReactModal__Content--after-open BaseModalView_modal__wjtT1" tabindex="-1" role="dialog" aria-label="modal" aria-modal="true"><div class="BaseModalViewContent BaseModalView_content__ipny1" style="width: 428px; border-radius: 14px; background-color:white;"><div class="MembershipJoinModalView_modal_inner__n3v3U"><p class="MembershipJoinModalView_description__yjxU-">멤버십 가입자만 볼 수 있어요.<br>지금 멤버십에 가입해 보세요!</p><div class="MembershipJoinModalView_button_wrap__I8YZ5"><button type="button" style="width:100%;"class="MembershipJoinModalView_button__jG5-X" onclick="window.location.href='/${groupNo}/feed'">닫기</button></div></div></div></div></div></div>
</c:if>
<%-- 			<c:forEach var="membershipVO" items="${membershipVOList}"
					varStatus="stat">
					 --%>
						<a href="/${groupNo}/media">
							<div class="item">
								<div class="RelatedProductItemView_thumbnail_wrap__ylVG8">
									<div
										class="VideoThumbnailView_thumbnail_wrap__ZHomL   color: #111;VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz">
										<div style="aspect-ratio: auto 320/180;">
											<img
												src="https://phinf.wevpstatic.net/MjAyNDEyMjZfMTEx/MDAxNzM1MjA3MzcyNTM5.IDbidNkkGmqmXI2tRkchgDlydtyD314Gyy1VWWwHKLwg.lvhnfeSaIi966p8xO5Xp2BdhvT0GbgNa2INHnrwlLp8g.JPEG/maxresdefault.jpg?type=f_or_off_640_360"
												class="VideoThumbnailView_thumbnail__1I-71" width="320"
												height="180" alt="">
										</div>
										<em
											class="DimmedBadgeTextView_badge_text__NQTPZ -text_shadow false"><span
											class="blind">playtime</span>23:54</em>
										<div class="VideoThumbnailView_badge_wrap__9m6hh"></div>
									</div>
									<div class="ThumbnailBadgeView_container__N1zJb"></div>
								</div>
								<div
									class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G">
									<strong class="RelatedProductItemView_package_name__-Xmh0">[Jeans'
										ZINE] 요리퀸을 찾아라 EP.3 어차피 주인공은 나👸 | NewJeans</strong>
									<div class="RelatedProductItemView_package_info__R7Ce1">
										<div class="RelatedProductItemView_info_item__E6C-5">
											<span class="RelatedProductItemView_package_date__cTAZL">2024.
												12. 26</span>
										</div>
										<div class="RelatedProductItemView_info_item__E6C-5">
											<div class="RelatedProductItemView_package_count__pzkhA">
												<span
													class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-video__yz2qw"><span
													class="blind">video</span></span>영상
											</div>
										</div>
									</div>
								</div>
							</div>
						</a>
						<a href="/newjeansofficial/media/2-155029602"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNTAxMjRfNTAg/MDAxNzM3NzA5MDk0NTI5.fQDwxxUM6ABdl4J7nDteygdo-mPDNRaR4-oPl3XefEEg.oGl5vxb1G4jnP6NWtEsR7cCaCAWMh_luvWOdNy-nY44g.PNG/f176d7f4-f437-45c2-aeac-272448e68496.png?type=f640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><em class="DimmedBadgeTextView_badge_text__NQTPZ -text_shadow false"><span class="blind">playtime</span>07:59</em><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">[Light Jeans] MINJI &amp; HANNI SPUR Photoshoot Behind 💐ㅣNewJeans</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2025. 01. 30</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-video__yz2qw"><span class="blind">video</span></span>영상</div></div></div></div></div></a>
						<a href="/newjeansofficial/media/2-155029499"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNTAxMjRfMTEg/MDAxNzM3NzA4Njc4ODM1.YznrP7xQJgdNVQzJDukRmpEH3ql_HU4FMZJhOyoyuhog.Zv30ljHNXDDnY2F88ynL5mCOrDghU3HVXZoLkxw0LNIg.PNG/87e2c0e9-0376-410d-b8e1-ece59e782fb6.png?type=f640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><em class="DimmedBadgeTextView_badge_text__NQTPZ -text_shadow false"><span class="blind">playtime</span>07:04</em><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">[Light Jeans] OLENS Behind💫 | NewJeans</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2025. 01. 28</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-video__yz2qw"><span class="blind">video</span></span>영상</div></div></div></div></div></a>
						<a href="/newjeansofficial/media/4-190713088"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNTAxMjRfMTQz/MDAxNzM3NjkxMTU2NTY2.DhLzT7u3qGAKnTCXhjvwb2nrjiOhsi2yvnXTQiQQ644g.Qfbzc91odKnf82M0oqIRY2sDEdZuj2wG-9N18TSnYlkg.JPEG/c54e4809-629b-4d21-ab63-878761b761d0.jpeg?type=f_or_off_640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">🥬</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2025. 01. 24</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-image__k-Uet"><span class="blind">image</span></span>53개의 이미지</div></div></div></div></div></a>
						<a href="/newjeansofficial/media/2-154988505"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNTAxMjNfMjQz/MDAxNzM3NjIyMTQ0ODM2.6bNqLhLtnKHVQixgNDfvtwk5C7CpfnWcecwQtWX4ng0g.pel6RhKLh0ydwp9psmI-KUqgQ1OLVdt9IACjYkhp4c0g.JPEG/b2c45d9a-1adc-423e-b6e5-b32af05c4122.jpeg?type=f_or_off_640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">뉴진스네 김장대소동! 🏡</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2025. 01. 23</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-image__k-Uet"><span class="blind">image</span></span>3개의 이미지</div></div></div></div></div></a>
						<a href="/newjeansofficial/media/3-190637518"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNTAxMjNfMjMw/MDAxNzM3NjA4NzI2NzQ5.uTU0KlQ0K37Mx2QkcqECkiwzqXaAti9RTWm4H9jtPQUg.PGJ43u0y0VQPF2QumVvq3e3qAaAAhayzhjCqiP8PcBQg.JPEG/ea8ad85a-d431-4f9c-8be6-e417627c6bd8.jpeg?type=f640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><em class="DimmedBadgeTextView_badge_text__NQTPZ -text_shadow false"><span class="blind">playtime</span>21:27</em><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">[Jeans' ZINE] 김장대소동 EP.3 모두 모두~ 김치✌️🙂✌️ | NewJeans</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2025. 01. 23</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-video__yz2qw"><span class="blind">video</span></span>영상</div></div></div></div></div></a>
						<a href="/newjeansofficial/media/4-190470069"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNTAxMjFfMTg1/MDAxNzM3NDQyMjc5NzE4.K1CTKE9xgNYK988jbGt4mL2XXO3Hf26kqYy761leO5Mg.GXmc3crJC1TFQgZ0Kd19s6iwHrJvxG7vipuZUN47B0Eg.PNG/9b7048a2-1eec-4203-be75-8bcafd72135b.png?type=f640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><em class="DimmedBadgeTextView_badge_text__NQTPZ -text_shadow false"><span class="blind">playtime</span>06:32</em><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">[Light Jeans] HYEIN DAZED KOREA Photoshoot Behind 👜  | NewJeans</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2025. 01. 21</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-video__yz2qw"><span class="blind">video</span></span>영상</div></div></div></div></div></a>
						<a href="/newjeansofficial/media/2-154761168"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNTAxMTdfNzIg/MDAxNzM3MTAwMDAyNDk5.8W4pjEhCviMPLCgz1xlRvsBZPgA1GvSqQDEmliJL-kwg.xGjHRvY5QBhUJhz0YlV3HZcnGiBkLwpKRuWvLXDeOLEg.PNG/d26b7975-aa68-4e1e-8171-c7f0ddf3674b.png?type=f640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><em class="DimmedBadgeTextView_badge_text__NQTPZ -text_shadow false"><span class="blind">playtime</span>08:39</em><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">[Light Jeans] HANNI Gucci Horsebit Campaign Behind🤎 | NewJeans</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2025. 01. 17</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-video__yz2qw"><span class="blind">video</span></span>영상</div></div></div></div></div></a>
						<a href="/newjeansofficial/media/0-154705927"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNTAxMTZfMTAy/MDAxNzM3MDEwODgyNDA2.8iUQAcOEdSsrCKoXUAAn6iS6KeGhCsKm4TrSoQDFW6Yg.OsywYOP7_VZZRf6QoBDlwxCsykza3n24-RLOyqwiEW0g.JPEG/97635643-789b-49a2-a489-20db7f5f2e4e.jpeg?type=f640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><em class="DimmedBadgeTextView_badge_text__NQTPZ -text_shadow false"><span class="blind">playtime</span>20:10</em><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">[Jeans' ZINE] 김장대소동 EP.2 김장.. 시작이 반이다 🥬 | NewJeans</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2025. 01. 16</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-video__yz2qw"><span class="blind">video</span></span>영상</div></div></div></div></div></a>
						<a href="/newjeansofficial/media/1-154610639"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNTAxMTRfMTYx/MDAxNzM2ODM0NDg1NjM4.a8aErlfHFe4rinCa0aTsPNTGVWzeqgm8j1OLV47aylEg.S6p0FoDJ4FNjlYZKEH5C7tMAG2ni_eLzrS2P6qvcQWcg.PNG/f7bf6c83-298c-4546-bd56-40f6a4bc1e2e.png?type=f640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><em class="DimmedBadgeTextView_badge_text__NQTPZ -text_shadow false"><span class="blind">playtime</span>11:18</em><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">[Light Jeans] STONEHENgE F/W Campaign Behind ❄️ | NewJeans</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2025. 01. 14</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-video__yz2qw"><span class="blind">video</span></span>영상</div></div></div></div></div></a>
						<a href="/newjeansofficial/media/1-154385643"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNTAxMDlfMjA3/MDAxNzM2NDE2NTUyNTk5.j9O7zJSriiPJjGWp_g74j6y229ueTb8SMel7l5yvsogg.2Cc937dAVv-8iCkxmW_zKNe61_GjOeh6u3zan6xY0bgg.JPEG/c8b2ae2b-6ec7-42a6-920e-8f6df74c1fa0.jpeg?type=f_or_off_640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">새해 맞이 김장하는 날..☀️</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2025. 01. 09</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-image__k-Uet"><span class="blind">image</span></span>6개의 이미지</div></div></div></div></div></a>
						<a href="/newjeansofficial/media/3-189438643"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNTAxMDlfMjMz/MDAxNzM2NDExOTc2NDc3.IzZXW7YZmU7TqXs3wO7QgPL750sxOWb74YeczgMzINwg.62v7uogpj_uj8_bBQRzrqpJh5FsAjcLK3rlUj5tPnmcg.PNG/92a98361-de19-4228-b5f8-f137383dcdab.png?type=f640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><em class="DimmedBadgeTextView_badge_text__NQTPZ -text_shadow false"><span class="blind">playtime</span>22:57</em><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">[Jeans' ZINE] 김장대소동 EP.1 입 풀기? 손 풀기? 몸 풀기? 시간 🎶 | NewJeans</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2025. 01. 09</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-video__yz2qw"><span class="blind">video</span></span>영상</div></div></div></div></div></a>
						<a href="/newjeansofficial/media/1-154329878"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNTAxMDhfMTAx/MDAxNzM2MzA0MDEyMjY2.dkSnUx20nSnz7J2JBmuc9mkMycoqsdaKF4F-hEaT6sAg.vFMPPZIknVwgzd_zCUwGqEwTCTRFYPn1ZhUAwRipvlMg.PNG/f838a55d-e305-4677-a4a3-d949e3364927.png?type=f_or_off_640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">요리 대결 완료…🍽️</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2025. 01. 08</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-image__k-Uet"><span class="blind">image</span></span>8개의 이미지</div></div></div></div></div></a>
						<a href="/newjeansofficial/media/4-189323225"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNTAxMDhfMjE3/MDAxNzM2MzAzMzg1NTk1.mfqZReDeARM3i-GhSpw4VtjmyqKQH86qejAWtDM-aoIg.IkEjEDw9AoLMe1t1K8OvmbXV0KCd3HCaY-VJ9ugCOYkg.JPEG/8e2ea14a-cfdf-4609-9f0c-fead5f5e2b12.jpeg?type=f_or_off_640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">👩‍🍳</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2025. 01. 08</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-image__k-Uet"><span class="blind">image</span></span>50개의 이미지</div></div></div></div></div></a>
						<a href="/newjeansofficial/media/3-189058968"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNTAxMDZfMTMw/MDAxNzM2MTQ2ODg2MzAx.Ez6Vbu6QAGAPRH45FRp2XfI1dJVB8e2rMRwXSEj2REYg.vvSPJzjXd4ZwvXi2VOV1om5jDGxqsIaELj8KtaStxX4g.JPEG/5d71ba75-f919-406a-a40b-2581303629dc.jpeg?type=f640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><em class="DimmedBadgeTextView_badge_text__NQTPZ -text_shadow false"><span class="blind">playtime</span>03:10</em><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"><em class="ThumbnailBadgeView_badge_item__zAt1v ThumbnailBadgeView_-membership__BFLHC"><span class="blind">membership</span></em></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">January Birthday🎁 Voice Call 📞</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2025. 01. 06</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-video__yz2qw"><span class="blind">video</span></span>영상</div></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_icon_cc__yHzDd"><span class="blind">Closed caption</span></div></div></div></div></div></a>
						<a href="/newjeansofficial/media/3-188564422"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNDEyMjZfMTEx/MDAxNzM1MjA3MzcyNTM5.IDbidNkkGmqmXI2tRkchgDlydtyD314Gyy1VWWwHKLwg.lvhnfeSaIi966p8xO5Xp2BdhvT0GbgNa2INHnrwlLp8g.JPEG/maxresdefault.jpg?type=f_or_off_640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><em class="DimmedBadgeTextView_badge_text__NQTPZ -text_shadow false"><span class="blind">playtime</span>23:54</em><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">[Jeans' ZINE] 요리퀸을 찾아라 EP.3 어차피 주인공은 나👸 | NewJeans</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2024. 12. 26</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-video__yz2qw"><span class="blind">video</span></span>영상</div></div></div></div></div></a>
						<a href="/newjeansofficial/media/3-188423909"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNDEyMjRfMzAg/MDAxNzM1MDI4NDQ5MjY3.r_xSLt8kjSEwtALcRn_8ktJ2KjsbKvhxX_dw0U6O4uYg.cPY87IcbH2UPH13HV5I7sXePwTj6kiLkzlrp4Z2ztlgg.PNG/db639c6d-26b6-4aaf-ad15-e6a232ff849a.png?type=f640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><em class="DimmedBadgeTextView_badge_text__NQTPZ -text_shadow false"><span class="blind">playtime</span>14:45</em><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">[Light Jeans] 2025 SEASON'S GREETINGS Behind🧚🏻ㅣ NewJeans</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2024. 12. 24</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-video__yz2qw"><span class="blind">video</span></span>영상</div></div></div></div></div></a>
						<a href="/newjeansofficial/media/4-188126302"><div class="item"><div class="RelatedProductItemView_thumbnail_wrap__ylVG8"><div class="VideoThumbnailView_thumbnail_wrap__ZHomL VideoThumbnailView_-has_border__ddmXr VideoThumbnailView_-dark__h+Kkz"><div style="aspect-ratio: auto 320 / 180;"><img src="https://phinf.wevpstatic.net/MjAyNDEyMjBfMTk4/MDAxNzM0NjgzNzgxMDg2.6L9-w1Fh4doBf4RvQSoW54RD31zPmlPQPsSLmfiURMkg.10yUne7NRglTJWU6odTjYYXKwAY5NVQZ_7yKvRsYSkwg.PNG/583780e0-886f-4b73-92fd-8022e9560806.png?type=f640_360" class="VideoThumbnailView_thumbnail__1I-71" width="320" height="180" alt=""></div><em class="DimmedBadgeTextView_badge_text__NQTPZ -text_shadow false"><span class="blind">playtime</span>11:05</em><div class="VideoThumbnailView_badge_wrap__9m6hh"></div></div><div class="ThumbnailBadgeView_container__N1zJb"></div></div><div class="RelatedProductItemView_pakage_detail__gQVU+ RelatedProductItemView_-info__izW2G"><strong class="RelatedProductItemView_package_name__-Xmh0">[Light Jeans] Indomie Behind 🍝 | NewJeans</strong><div class="RelatedProductItemView_package_info__R7Ce1"><div class="RelatedProductItemView_info_item__E6C-5"><span class="RelatedProductItemView_package_date__cTAZL">2024. 12. 20</span></div><div class="RelatedProductItemView_info_item__E6C-5"><div class="RelatedProductItemView_package_count__pzkhA"><span class="RelatedProductItemView_count_badge__uS2QK RelatedProductItemView_-video__yz2qw"><span class="blind">video</span></span>영상</div></div></div></div></div></a>
<%-- 				</c:forEach> --%>
						
					</div>
				</div>
				<div class="loader">
					<span class="blind">Loading</span>
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
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const modal = document.getElementById("membershipModal");
        const cancelButton = document.querySelector(".MembershipJoinModalView_button__jG5-X"); // 첫 번째 버튼 (취소 버튼)

        if (cancelButton && modal) {
            cancelButton.addEventListener("click", function () {
                modal.style.display = "none"; // 모달 숨기기
            });
        }
    });
</script>

<style>
.MembershipJoinModalView_button__jG5-X {
    border: none;
    background-color: white;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out, color 0.2s ease-in-out;
}

/* 취소 버튼: 회색 배경 */
.MembershipJoinModalView_button__jG5-X:first-child:hover {
    background-color: #e0e0e0; /* 연한 회색 */
}

.MembershipJoinModalView_button__jG5-X:first-child:active {
    background-color: #d6d6d6; /* 클릭 시 더 진한 회색 */
}

/* 가입하기 버튼: 파란색 배경 */
.MembershipJoinModalView_button__jG5-X:last-child:hover {
    background-color: #007bff; /* 마우스 올리면 파란색 */
    color: white; /* 글자색 변경 */
}

.MembershipJoinModalView_button__jG5-X:last-child:active {
    background-color: #0056b3; /* 클릭 시 더 진한 파란색 */
}
</style>