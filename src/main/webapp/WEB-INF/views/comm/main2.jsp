<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title></title>

<link href="/directlyCss/main2.css" rel="stylesheet">
<link href="/directlyCss/modal.css" rel="stylesheet">
</head>
<body>
<!-- ///// header 시작 ///// -->
<jsp:include page="../include/header_user.jsp"></jsp:include>
<!-- ///// header 끝 ///// -->
<!-- 컨테이너 -->
<div class="container">
<!-- 아티클 -->

<article>
	<!-- 글 작성 -->	
	<div class="post-input">
		<div class="EditorInputView_editor_input_wrap__T1dmr" data-client="FEED" data-testid="write">
			<div role="button" tabindex="0" class="DivAsButtonView_div_as_button__jl7Xf EditorInputView_input_button__qjPaD">
				<div class="EditorInputView_thumbnail_area__sWRRX">
					<div class="ProfileThumbnailView_thumbnail_area__u25Uf" style="width: 46px; height: 46px;">
						<div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf ProfileThumbnailView_-has_border__UG1nQ">
							<div style="aspect-ratio: auto 46 / 46; content-visibility: auto; contain-intrinsic-size: 46px; width: 100%; height: 100%;">
							<img src="https://cdn-v2pstatic.weverse.io/wev_web_fe/p/2_31_1/public/static/media/icon_empty_profile.b0996808ea97350978a4.png" class="ProfileThumbnailView_thumbnail__8W3E7" width="46" height="46" alt="">
							</div>
						</div>
					</div>
				</div>
				<em class="EditorInputView_text_area__W0aw-">
				위버스에 포스트를 남겨보세요.
				</em>
			</div>
			<div class="EditorInputView_attach_area__kohJ5">
				<label for="apei" class="EditorInputView_attach_button__AbHFp" data-testid="attach-photo">
					<span class="blind">
					Attach photo
					</span>
					<input class="blind" id="apei" type="file" multiple="" accept="image/*">
				</label>
				<label for="avei" class="EditorInputView_attach_button__AbHFp EditorInputView_-video__b1lP+">
					<span class="blind">
					Attach video
					</span>
					<input class="blind" id="avei" type="file" multiple="" accept="video/mp4, video/*">
				</label>
		 </div>
	 </div>
<%-- 		<jsp:include page="main0.jsp"></jsp:include> --%>
	</div>
	<!-- 글 정렬 -->
	<div clsas="post-array" aria-haspopup="listbox">
		<button class="post_Array_drop">
		최신글
		</button>
		<ul class="DropdownOptionListView_option_list__y90kx DropdownOptionListView_dropdown-order__gJZjY" role="listbox" data-use-placement="false" data-placement="top">
		<li class="DropdownOptionListView_option_item__mEVZG" role="presentation">
		<button class="PostListLanguageFilterView_option_button__BDQwx" aria-current="true">
		<svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" color="#25272E" aria-hidden="true">
		<mask id="path-1-inside-1_30196_2726" fill="white">
		<path fill-rule="evenodd" clip-rule="evenodd" d="M12.4176 2.72859C12.53 1.89273 11.4719 1.43792 10.9428 2.09466L4.29879 10.3406C3.85954 10.8858 4.24759 11.6968 4.9477 11.6968H8.636L7.90004 17.1684C7.78761 18.0042 8.84569 18.459 9.37484 17.8023L16.0188 9.55634C16.4581 9.01118 16.07 8.20017 15.3699 8.20017L11.6816 8.20017L12.4176 2.72859Z"></path></mask><path d="M10.9428 2.09466L9.9694 1.3104L9.9694 1.3104L10.9428 2.09466ZM12.4176 2.72859L11.1787 2.56196V2.56196L12.4176 2.72859ZM4.29879 10.3406L5.27215 11.1249L5.27215 11.1249L4.29879 10.3406ZM8.636 11.6968L9.87484 11.8634C9.92291 11.5061 9.81432 11.1454 9.57695 10.8739C9.33959 10.6025 8.99658 10.4468 8.636 10.4468V11.6968ZM7.90004 17.1684L9.13888 17.335V17.335L7.90004 17.1684ZM9.37484 17.8023L10.3482 18.5866L9.37484 17.8023ZM16.0188 9.55634L16.9922 10.3406L16.0188 9.55634ZM15.3699 8.20017V9.45017V8.20017ZM11.6816 8.20017L10.4428 8.03354C10.3947 8.39089 10.5033 8.7516 10.7406 9.02303C10.978 9.29446 11.321 9.45017 11.6816 9.45017V8.20017ZM11.9161 2.87892C11.8681 2.93855 11.7817 2.99842 11.673 3.02161C11.5755 3.04241 11.4907 3.02764 11.4271 3.0003C11.3635 2.97296 11.2945 2.92165 11.2425 2.83655C11.1845 2.74173 11.1685 2.63785 11.1787 2.56196L13.6564 2.89522C13.9375 0.805561 11.2923 -0.331447 9.9694 1.3104L11.9161 2.87892ZM5.27215 11.1249L11.9161 2.87892L9.9694 1.3104L3.32543 9.55635L5.27215 11.1249ZM4.9477 10.4468C5.29775 10.4468 5.49178 10.8523 5.27215 11.1249L3.32543 9.55635C2.2273 10.9193 3.19743 12.9468 4.9477 12.9468V10.4468ZM8.636 10.4468H4.9477V12.9468H8.636V10.4468ZM9.13888 17.335L9.87484 11.8634L7.39716 11.5302L6.66119 17.0017L9.13888 17.335ZM8.40148 17.018C8.44952 16.9584 8.53591 16.8985 8.6446 16.8754C8.74215 16.8545 8.82686 16.8693 8.89047 16.8967C8.95408 16.924 9.02309 16.9753 9.07512 17.0604C9.13309 17.1552 9.14909 17.2591 9.13888 17.335L6.66119 17.0017C6.38012 19.0914 9.02533 20.2284 10.3482 18.5866L8.40148 17.018ZM15.0455 8.77208L8.40148 17.018L10.3482 18.5866L16.9922 10.3406L15.0455 8.77208ZM15.3699 9.45017C15.0199 9.45017 14.8258 9.04466 15.0455 8.77208L16.9922 10.3406C18.0903 8.9777 17.1202 6.95017 15.3699 6.95017V9.45017ZM11.6816 9.45017L15.3699 9.45017V6.95017L11.6816 6.95017V9.45017ZM11.1787 2.56196L10.4428 8.03354L12.9204 8.3668L13.6564 2.89522L11.1787 2.56196Z" fill="currentColor" mask="url(#path-1-inside-1_30196_2726)">
		</path>
		</svg>
		오래된순		
		</button>
		</li><li class="DropdownOptionListView_option_item__mEVZG" role="presentation">
		<button class="PostListLanguageFilterView_option_button__BDQwx" aria-current="false"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" color="#25272E" aria-hidden="true"><path fill="currentColor" d="m15.339 11.743.623.04a.579.579 0 0 0 .002-.053l-.625.013Zm-5.517 4.953-.012-.625.012.625Zm-5.16-5.08.624.005-.625-.005ZM9.43 2.752l.325-.534a.625.625 0 0 0-.925.358l.6.176Zm2.47 2.001-.442.442.442-.442ZM5.874 8.115l.517.351-.517-.35Zm8.841 3.587c-.158 2.43-2.005 4.31-4.905 4.37l.025 1.25c3.51-.072 5.925-2.424 6.127-5.539l-1.247-.08Zm-4.905 4.37c-1.393.027-2.52-.593-3.31-1.48-.8-.9-1.22-2.04-1.214-2.97l-1.25-.01c-.01 1.273.548 2.705 1.53 3.81.995 1.118 2.456 1.936 4.27 1.9l-.026-1.25ZM9.43 2.75l-.326.533.002.001.007.005a4.27 4.27 0 0 1 .177.114 15.088 15.088 0 0 1 2.168 1.79l.884-.884a16.336 16.336 0 0 0-2.358-1.945 8.993 8.993 0 0 0-.21-.137L9.76 2.22l-.004-.002h-.002v-.001l-.325.534Zm2.028 2.443c1.46 1.461 3.194 3.385 3.256 6.56l1.25-.024c-.073-3.692-2.123-5.92-3.622-7.42l-.884.884Zm-2.883.44c.372-.528.703-1.099.953-1.58.243-.468.433-.895.501-1.128l-1.2-.35c-.03.107-.17.442-.41.901-.231.445-.533.965-.865 1.435l1.02.722ZM5.286 11.62c.008-1.023.372-2.076 1.105-3.155l-1.034-.702c-.837 1.231-1.31 2.522-1.32 3.848l1.25.01Zm2.268-6.709c-.337.477-.673.88-1.039 1.327-.364.445-.75.924-1.158 1.525l1.034.702c.375-.553.732-.996 1.091-1.435.357-.435.724-.876 1.093-1.397l-1.021-.722Z"></path><path stroke="currentColor" stroke-width="1.25" d="M12.282 14.428c0 1.195-1.004 2.196-2.283 2.196-1.278 0-2.282-1-2.282-2.196 0-.677.373-1.453.913-2.199a11.286 11.286 0 0 1 1.371-1.535c.362.338.902.885 1.368 1.528.54.742.913 1.52.913 2.206Z">
		</path>
		</svg>
		Hot
		</button>
		</li>
		</ul>
	</div>
	
	<div>
	
	
		<div>
  <div class="FeedPostListView_list_wrap__EQSO0">
    <div class="PostListItemView_post_item__XJ0uc">
      <div class="PostHeaderView_header_wrap__CbRCi PostHeaderView_-header_type_feed__-MYm-">
        <div class="PostHeaderView_group_wrap__GshcX PostHeaderView_-profile_area__i8d-j"><a
            class="PostHeaderView_thumbnail_wrap__zzDv7"
            href="/newjeansofficial/profile/ec4dae1d31aa0a1522f42bb56f1f07a0">
            <div class="ProfileThumbnailView_thumbnail_area__u25Uf" style="width: 36px; height: 36px;">
              <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf ProfileThumbnailView_-has_border__UG1nQ">
                <div
                  style="aspect-ratio: auto 36 / 36; content-visibility: auto; contain-intrinsic-size: 36px; width: 100%; height: 100%;">
                  <img
                    src="https://phinf.wevpstatic.net/MjAyNDEyMDdfMjI1/MDAxNzMzNTE5NTkwNDg0.o4ySimBleZBUv3EuB8fZK0u0M9DGNGyqiMqy9z1483og.2zEKgmOVjsuGT-zaSfYE0GKJMi26_1bVZKYUjivXT6Yg.JPEG/image.jpg?type=s72"
                    class="ProfileThumbnailView_thumbnail__8W3E7" width="36" height="36" alt=""></div>
              </div>
            </div>
          </a>
          <div class="PostHeaderView_text_wrap__EFgIq">
            <a href="/newjeansofficial/profile/ec4dae1d31aa0a1522f42bb56f1f07a0">
              <!-- 작성자 닉네임 -->
              <div class="PostHeaderView_nickname_wrap__LgVkc"><strong class="PostHeaderView_nickname__6Cb7X">
                닉네임</strong></div>
            </a>
             <!-- 작성 시간 -->
            <div class="PostHeaderView_info_wrap__l8QU+"><span class="PostHeaderView_date__XJXBZ">12. 26. 10:38</span>
            </div>
          </div>
        </div>
         <!-- 신고 버튼 -->
        <div class="PostHeaderView_group_wrap__GshcX PostHeaderView_-button_area__yleim">
          <div class="PostHeaderView_button_item__Q8PxN PostHeaderView_-menu__tmYfi">
            <div><button type="button" class="MoreButtonView_button_menu__05Y26"><span class="blind">Show More
                  Content</span></button></div>
          </div>
        </div>
      </div>
       <!-- 본문 -->
      <div class="PostListItemView_content_wrap__CvnVo">
        <div class="PostListItemView_content_item__J0b1V PostListItemView_-text_preview__6AcM1">
          <div class="PostPreviewTextView_text__93Php">
            메리 크리스마스🤍🎄</div>
        </div>
         <!-- 번역 버튼 -->
        <div class="PostListItemView_translate_wrap__+Tjry"><button type="button"
            class="AutoTranslationButtonView_translate_button__oK2a6"><span
              class="AutoTranslationButtonView_translate_text__4Vtes">번역 보기</span></button></div>
      </div>
       <!-- 좋아요 -->
      <div class="PostListItemView_button_wrap__kMkeR">
        <div class="PostListItemView_group_wrap__y8XtS">
          <div class="PostListItemView_button_item__BFpfP"><button type="button"
              class="EmotionButtonView_button_emotion__eGktL" aria-pressed="false"><svg width="26" height="26"
                viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g clip-path="url(#clip0_7_57)">
                  <path
                    d="M24.4473 18.9094L22.5435 15.5931C23.2313 14.328 23.6244 12.891 23.6244 11.3557C23.6244 11.0486 23.6121 10.7538 23.5752 10.4468C23.5138 9.85721 23.391 9.26766 23.219 8.71494C22.9611 7.87973 22.5803 7.10594 22.1013 6.39355C21.9417 6.16018 21.7697 5.92682 21.5977 5.71801C21.2416 5.27584 20.8362 4.8828 20.3941 4.51433C18.8587 3.24923 16.9058 2.48772 14.7564 2.48772C12.607 2.48772 10.654 3.24923 9.11873 4.51433C8.67656 4.87052 8.28352 5.27584 7.91504 5.71801C7.7308 5.9391 7.55885 6.16018 7.41146 6.39355C7.35005 6.47953 7.3132 6.57779 7.26407 6.66377L6.47799 6.08649C6.14636 5.85312 5.79017 5.7303 5.40941 5.7303C4.93039 5.7303 4.45138 5.92682 4.11975 6.28301C3.78812 6.62692 3.60388 7.10594 3.61617 7.59724C3.61617 7.63408 3.61617 7.65865 3.61617 7.6955L3.86182 10.238L1.78608 11.5399C1.78608 11.5399 1.71238 11.589 1.67553 11.6136C1.12282 12.0189 0.864888 12.6945 0.987713 13.37C1.11054 14.0455 1.60184 14.586 2.26509 14.7702L4.79529 15.4089L5.45854 17.7549C5.45854 17.7549 5.47082 17.804 5.48311 17.8286C5.72876 18.5532 6.41658 19.0445 7.17809 19.0445C7.77993 19.0445 8.33265 18.7497 8.66427 18.2462L8.84851 17.9637C10.4084 19.3639 12.4718 20.2114 14.7318 20.2114C15.2845 20.2114 15.8127 20.1499 16.3408 20.064L18.9079 22.9749C19.8536 24.0189 20.8362 24.2277 21.4995 24.2277C22.2364 24.2277 22.9734 23.9698 23.5752 23.5031C24.2999 22.9381 24.5947 22.3608 24.7789 21.8818C25.1351 20.9483 25 19.8674 24.4227 18.9094H24.4473ZM9.45035 14.4877H9.43807C9.37666 14.4877 9.32753 14.5123 9.2784 14.5246C9.25383 14.5246 9.21699 14.5246 9.19242 14.5491C9.13101 14.586 9.0696 14.6474 9.02047 14.7211L8.66427 15.2861L7.75537 16.7477L7.37461 17.3618C7.37461 17.3618 7.27635 17.4478 7.21494 17.4478C7.21494 17.4478 7.21494 17.4478 7.20266 17.4478C7.20266 17.4478 7.19037 17.4478 7.17809 17.4478C7.11668 17.4355 7.05527 17.3987 7.0307 17.325L6.19549 14.3649C6.14636 14.1929 6.01125 14.0701 5.8393 14.021L2.73183 13.2349C2.65813 13.2103 2.609 13.1489 2.59672 13.0875C2.58444 13.0138 2.59672 12.9401 2.67042 12.891L5.26202 11.2697C5.47082 11.1469 5.56908 10.9504 5.54452 10.6924L5.23746 7.54811C5.23746 7.54811 5.26202 7.44985 5.28659 7.413C5.28659 7.413 5.29887 7.40072 5.31115 7.38843C5.348 7.36387 5.38485 7.35159 5.42169 7.3393H5.43398C5.43398 7.3393 5.50767 7.3393 5.54452 7.37615L8.28352 9.40276L8.45547 9.42733L11.4278 8.16223C11.4278 8.16223 11.477 8.16223 11.5015 8.16223C11.5015 8.16223 11.5015 8.16223 11.5138 8.16223C11.5629 8.16223 11.6121 8.1868 11.6489 8.22364C11.6489 8.22364 11.6489 8.23593 11.6612 8.24821C11.6858 8.29734 11.7103 8.34647 11.6858 8.40788L10.6418 11.4048C10.6049 11.5031 10.6049 11.589 10.6172 11.675C10.6295 11.761 10.6786 11.8224 10.7277 11.8838L12.7543 14.2421C12.8526 14.3649 12.7543 14.5491 12.607 14.5614L9.46264 14.5L9.45035 14.4877ZM14.7687 18.6269C12.8158 18.6269 11.0471 17.8531 9.74513 16.588L10.0522 16.0967L12.5701 16.1459C13.3071 16.1459 13.9212 15.7528 14.216 15.1264C14.5107 14.5123 14.437 13.7876 14.0072 13.2472C13.9949 13.2349 13.9826 13.2103 13.958 13.1981L12.349 11.3188L13.1842 8.92375C13.3685 8.33419 13.2702 7.73234 12.9386 7.27789C12.607 6.82344 12.0665 6.54094 11.5015 6.54094C11.2927 6.54094 11.0839 6.57779 10.8874 6.65148C10.8628 6.65148 10.8383 6.67605 10.8137 6.67605L8.59058 7.6218H8.5783C9.85568 5.50921 12.1525 4.08444 14.7932 4.08444C18.7973 4.08444 22.0522 7.3393 22.0522 11.3434C22.0522 15.3475 18.7973 18.6024 14.7932 18.6024L14.7687 18.6269ZM23.305 21.3291C23.1945 21.6361 23.0471 21.9186 22.6172 22.2503C22.261 22.5205 21.8434 22.631 21.524 22.631C21.4626 22.631 21.3889 22.6187 21.3275 22.6064C21.2784 22.6064 21.2293 22.6064 21.1801 22.5819C21.1064 22.5696 21.045 22.5328 20.9713 22.5082C20.9222 22.4836 20.8731 22.4836 20.8239 22.4591C20.738 22.4222 20.652 22.3608 20.5783 22.2994C20.5414 22.2748 20.5169 22.2625 20.48 22.238C20.3695 22.152 20.2467 22.0415 20.1361 21.9186L18.0727 19.5727C19.4237 19.0322 20.6151 18.1602 21.5486 17.0548L23.0839 19.7323C23.4156 20.2851 23.477 20.8746 23.3173 21.3168L23.305 21.3291Z"
                    fill="#444444"></path>
                </g>
                <defs>
                  <clipPath id="clip0_7_57">
                    <rect width="24" height="21.7277" fill="white" transform="translate(1 2.5)"></rect>
                  </clipPath>
                </defs>
              </svg><span class="blind">cheering</span></button></div>
           <!-- 댓글 -->    
          <div class="PostListItemView_button_item__BFpfP"><button type="button"
              class="CommentButtonView_button_comment__uq1n3"><svg width="26" height="26" viewBox="0 0 26 26"
                fill="none" xmlns="http://www.w3.org/2000/svg">
                <path
                  d="M22.7912 12.25C22.7912 6.98327 18.5168 2.7088 13.25 2.7088C7.98327 2.7088 3.7088 6.98327 3.7088 12.25C3.7088 16.2846 6.21678 19.7303 9.74976 21.1261C9.74976 21.1261 9.79338 21.1479 9.82609 21.1588C10.2295 21.3115 10.6439 21.4423 11.0692 21.5405C14.5258 22.4455 18.6258 22.2819 20.5995 21.9548C21.1338 21.8567 21.341 21.3878 21.0684 20.908C20.774 20.3846 20.3596 19.7522 20.2833 19.1851C20.0325 17.2769 22.7912 16.0229 22.7803 12.3591C22.7803 12.3264 22.7803 12.2936 22.7803 12.2609L22.7912 12.25Z"
                  stroke="#444444" stroke-width="1.6" stroke-miterlimit="10"></path>
              </svg><span class="blind">Leave a comment</span></button></div>
        </div>
      </div>
    </div>
    <div class="PostListItemView_post_item__XJ0uc">
      <div class="PostHeaderView_header_wrap__CbRCi PostHeaderView_-header_type_feed__-MYm-">
        <div class="PostHeaderView_group_wrap__GshcX PostHeaderView_-profile_area__i8d-j"><a
            class="PostHeaderView_thumbnail_wrap__zzDv7"
            href="/newjeansofficial/profile/44024c5f239fbcaffb04fb61b7bdac60">
            <div class="ProfileThumbnailView_thumbnail_area__u25Uf" style="width: 36px; height: 36px;">
              <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf ProfileThumbnailView_-has_border__UG1nQ">
                <div
                  style="aspect-ratio: auto 36 / 36; content-visibility: auto; contain-intrinsic-size: 36px; width: 100%; height: 100%;">
                  <img
                    src="https://phinf.wevpstatic.net/MjAyNDAxMDhfOTgg/MDAxNzA0NjY4OTk3Mjkx.-mLkS6xbcm4mF8EHoATfSQB3L_h5ouEP1GJLG7Iy9mAg.E1I0CHZqy4V5QTnWO5K72dIKXxHzXJcBrJdFhsVPvyMg.JPEG/image.jpg?type=s72"
                    class="ProfileThumbnailView_thumbnail__8W3E7" width="36" height="36" alt=""></div>
              </div>
            </div>
          </a>
          <div class="PostHeaderView_text_wrap__EFgIq"><a
              href="/newjeansofficial/profile/44024c5f239fbcaffb04fb61b7bdac60">
               <!-- 작성자 닉네임 -->
              <div class="PostHeaderView_nickname_wrap__LgVkc"><strong
                  class="PostHeaderView_nickname__6Cb7X">닉네임</strong>
                   <!-- 작성자 멤버십 배지 -->
                  <span class="PostHeaderView_badge_wrap__EgdA9"><em
                    class="BadgeViewV2_badge__Lz-qv BadgeViewV2_-membership_icon__5uf-z BadgeViewV2_-size_12__PwdlI"><span
                      class="blind">Membership Only Content</span></em></span></div>
            </a>
             <!-- 작성 시간 -->
            <div class="PostHeaderView_info_wrap__l8QU+"><span class="PostHeaderView_date__XJXBZ">12. 26. 10:19</span>
            </div>
          </div>
        </div>
        <div class="PostHeaderView_group_wrap__GshcX PostHeaderView_-button_area__yleim">
          <div class="PostHeaderView_button_item__Q8PxN PostHeaderView_-menu__tmYfi">
            <div><button type="button" class="MoreButtonView_button_menu__05Y26"><span class="blind">Show More
                  Content</span></button></div>
          </div>
        </div>
      </div>
      <div class="PostListItemView_content_wrap__CvnVo">
        <div class="PostListItemView_content_item__J0b1V"><a href="/newjeansofficial/fanpost/4-188541901"
            class="PostListItemView_content_link__f8ecu">
            <div>
              <ul class="PostPreviewImageView_preview_image_wrap__Q29V8 -feed PostPreviewImageView_-one__-6MMx">
                <li class="PostPreviewImageView_image_item__dzD2P"><img
                    src="https://phinf.wevpstatic.net/MjAyNDEyMjZfODQg/MDAxNzM1MTc1OTU4Mjc4.5d9pNo7oTRUntVM_7w7MDNWBuYqWpB7c7C--xPpN4dUg.IHaJEWoXkOsvMB74Cx6Q2rqG32H2MPfE21dKG6LX7vgg.JPEG/image.jpg?type=e1414_1414_stopgif"
                    class="PostPreviewImageView_post_image__zLzXH" width="40%" height="40%" alt=""></li>
              </ul>
            </div>
          </a></div>
        <div class="PostListItemView_content_item__J0b1V PostListItemView_-text_preview__6AcM1">
           <!-- 작성 내용 -->
          <div class="PostPreviewTextView_text__93Php">
            <div role="button" tabindex="0" class="DivAsButtonView_div_as_button__jl7Xf">
              <div style="overflow-wrap: break-word; display: block;">내용<span class="ellipsis_text">... </span><button type="button"
                  class="PostPreviewTextView_more__39Lls">더 보기</button></div>
            </div>
          </div>
        </div>
         <!-- 번역 -->
        <div class="PostListItemView_translate_wrap__+Tjry"><button type="button"
            class="AutoTranslationButtonView_translate_button__oK2a6"><span
              class="AutoTranslationButtonView_translate_text__4Vtes">번역 보기</span></button></div>
      </div>
      <div class="PostListItemView_button_wrap__kMkeR">
        <div class="PostListItemView_group_wrap__y8XtS">
          <div class="PostListItemView_button_item__BFpfP"><button type="button"
              class="EmotionButtonView_button_emotion__eGktL" aria-pressed="false"><svg width="26" height="26"
                viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g clip-path="url(#clip0_7_57)">
                  <path
                    d="M24.4473 18.9094L22.5435 15.5931C23.2313 14.328 23.6244 12.891 23.6244 11.3557C23.6244 11.0486 23.6121 10.7538 23.5752 10.4468C23.5138 9.85721 23.391 9.26766 23.219 8.71494C22.9611 7.87973 22.5803 7.10594 22.1013 6.39355C21.9417 6.16018 21.7697 5.92682 21.5977 5.71801C21.2416 5.27584 20.8362 4.8828 20.3941 4.51433C18.8587 3.24923 16.9058 2.48772 14.7564 2.48772C12.607 2.48772 10.654 3.24923 9.11873 4.51433C8.67656 4.87052 8.28352 5.27584 7.91504 5.71801C7.7308 5.9391 7.55885 6.16018 7.41146 6.39355C7.35005 6.47953 7.3132 6.57779 7.26407 6.66377L6.47799 6.08649C6.14636 5.85312 5.79017 5.7303 5.40941 5.7303C4.93039 5.7303 4.45138 5.92682 4.11975 6.28301C3.78812 6.62692 3.60388 7.10594 3.61617 7.59724C3.61617 7.63408 3.61617 7.65865 3.61617 7.6955L3.86182 10.238L1.78608 11.5399C1.78608 11.5399 1.71238 11.589 1.67553 11.6136C1.12282 12.0189 0.864888 12.6945 0.987713 13.37C1.11054 14.0455 1.60184 14.586 2.26509 14.7702L4.79529 15.4089L5.45854 17.7549C5.45854 17.7549 5.47082 17.804 5.48311 17.8286C5.72876 18.5532 6.41658 19.0445 7.17809 19.0445C7.77993 19.0445 8.33265 18.7497 8.66427 18.2462L8.84851 17.9637C10.4084 19.3639 12.4718 20.2114 14.7318 20.2114C15.2845 20.2114 15.8127 20.1499 16.3408 20.064L18.9079 22.9749C19.8536 24.0189 20.8362 24.2277 21.4995 24.2277C22.2364 24.2277 22.9734 23.9698 23.5752 23.5031C24.2999 22.9381 24.5947 22.3608 24.7789 21.8818C25.1351 20.9483 25 19.8674 24.4227 18.9094H24.4473ZM9.45035 14.4877H9.43807C9.37666 14.4877 9.32753 14.5123 9.2784 14.5246C9.25383 14.5246 9.21699 14.5246 9.19242 14.5491C9.13101 14.586 9.0696 14.6474 9.02047 14.7211L8.66427 15.2861L7.75537 16.7477L7.37461 17.3618C7.37461 17.3618 7.27635 17.4478 7.21494 17.4478C7.21494 17.4478 7.21494 17.4478 7.20266 17.4478C7.20266 17.4478 7.19037 17.4478 7.17809 17.4478C7.11668 17.4355 7.05527 17.3987 7.0307 17.325L6.19549 14.3649C6.14636 14.1929 6.01125 14.0701 5.8393 14.021L2.73183 13.2349C2.65813 13.2103 2.609 13.1489 2.59672 13.0875C2.58444 13.0138 2.59672 12.9401 2.67042 12.891L5.26202 11.2697C5.47082 11.1469 5.56908 10.9504 5.54452 10.6924L5.23746 7.54811C5.23746 7.54811 5.26202 7.44985 5.28659 7.413C5.28659 7.413 5.29887 7.40072 5.31115 7.38843C5.348 7.36387 5.38485 7.35159 5.42169 7.3393H5.43398C5.43398 7.3393 5.50767 7.3393 5.54452 7.37615L8.28352 9.40276L8.45547 9.42733L11.4278 8.16223C11.4278 8.16223 11.477 8.16223 11.5015 8.16223C11.5015 8.16223 11.5015 8.16223 11.5138 8.16223C11.5629 8.16223 11.6121 8.1868 11.6489 8.22364C11.6489 8.22364 11.6489 8.23593 11.6612 8.24821C11.6858 8.29734 11.7103 8.34647 11.6858 8.40788L10.6418 11.4048C10.6049 11.5031 10.6049 11.589 10.6172 11.675C10.6295 11.761 10.6786 11.8224 10.7277 11.8838L12.7543 14.2421C12.8526 14.3649 12.7543 14.5491 12.607 14.5614L9.46264 14.5L9.45035 14.4877ZM14.7687 18.6269C12.8158 18.6269 11.0471 17.8531 9.74513 16.588L10.0522 16.0967L12.5701 16.1459C13.3071 16.1459 13.9212 15.7528 14.216 15.1264C14.5107 14.5123 14.437 13.7876 14.0072 13.2472C13.9949 13.2349 13.9826 13.2103 13.958 13.1981L12.349 11.3188L13.1842 8.92375C13.3685 8.33419 13.2702 7.73234 12.9386 7.27789C12.607 6.82344 12.0665 6.54094 11.5015 6.54094C11.2927 6.54094 11.0839 6.57779 10.8874 6.65148C10.8628 6.65148 10.8383 6.67605 10.8137 6.67605L8.59058 7.6218H8.5783C9.85568 5.50921 12.1525 4.08444 14.7932 4.08444C18.7973 4.08444 22.0522 7.3393 22.0522 11.3434C22.0522 15.3475 18.7973 18.6024 14.7932 18.6024L14.7687 18.6269ZM23.305 21.3291C23.1945 21.6361 23.0471 21.9186 22.6172 22.2503C22.261 22.5205 21.8434 22.631 21.524 22.631C21.4626 22.631 21.3889 22.6187 21.3275 22.6064C21.2784 22.6064 21.2293 22.6064 21.1801 22.5819C21.1064 22.5696 21.045 22.5328 20.9713 22.5082C20.9222 22.4836 20.8731 22.4836 20.8239 22.4591C20.738 22.4222 20.652 22.3608 20.5783 22.2994C20.5414 22.2748 20.5169 22.2625 20.48 22.238C20.3695 22.152 20.2467 22.0415 20.1361 21.9186L18.0727 19.5727C19.4237 19.0322 20.6151 18.1602 21.5486 17.0548L23.0839 19.7323C23.4156 20.2851 23.477 20.8746 23.3173 21.3168L23.305 21.3291Z"
                    fill="#444444"></path>
                </g>
                <defs>
                  <clipPath id="clip0_7_57">
                    <rect width="24" height="21.7277" fill="white" transform="translate(1 2.5)"></rect>
                  </clipPath>
                </defs>
              </svg><span class="blind">cheering</span></button></div>
          <div class="PostListItemView_button_item__BFpfP"><button type="button"
              class="CommentButtonView_button_comment__uq1n3"><svg width="26" height="26" viewBox="0 0 26 26"
                fill="none" xmlns="http://www.w3.org/2000/svg">
                <path
                  d="M22.7912 12.25C22.7912 6.98327 18.5168 2.7088 13.25 2.7088C7.98327 2.7088 3.7088 6.98327 3.7088 12.25C3.7088 16.2846 6.21678 19.7303 9.74976 21.1261C9.74976 21.1261 9.79338 21.1479 9.82609 21.1588C10.2295 21.3115 10.6439 21.4423 11.0692 21.5405C14.5258 22.4455 18.6258 22.2819 20.5995 21.9548C21.1338 21.8567 21.341 21.3878 21.0684 20.908C20.774 20.3846 20.3596 19.7522 20.2833 19.1851C20.0325 17.2769 22.7912 16.0229 22.7803 12.3591C22.7803 12.3264 22.7803 12.2936 22.7803 12.2609L22.7912 12.25Z"
                  stroke="#444444" stroke-width="1.6" stroke-miterlimit="10"></path>
              </svg><span class="blind">Leave a comment</span></button></div>
        </div>
      </div>
    </div>
  </div>
  <div class="loader"><span class="blind">Loading</span></div>
</div>


	
	
	
		<!-- 작성자  -->
<!-- 		<div class="writer"> -->
<!-- 			<!-- 작성자 프로필 사진 --> -->
<!-- 			<span class="writer-profile">작성자 프로필 사진</span> -->
<!-- 			<!-- 닉네임--> -->
<!-- 			<span class="writer-nick"> 닉네임 -->
<!-- 			</span> -->
<!-- 			<!-- 날짜 --> -->
<!-- 			<span class="writer-date"> 날짜 -->
<!-- 			</span> -->
<!-- 			<!--신고 --> -->
<!-- 			<span class="writer-report">신고</span> -->
<!-- 		</div> -->
<!-- 		<!-- 업로드한 사진 컨테이너 --> -->
<!-- 		<div class="picture-container"> -->
<!-- 			<!-- 업로드한 사진 --> -->
<!-- 			<div class="upload-picture">사진</div> -->
<!-- 		</div> -->
<!-- 		<!-- 글 내용 --> -->
<!-- 		<div class="contents"> 올린 글 내용 -->
<!-- 		</div> -->
<!-- 		<!-- 번역 버튼 --> -->
<!-- 		<div class="translation"> 번역 -->
<!-- 		</div> -->
<!-- 		<!-- 댓글 컨테이너 --> -->
<!-- 		<div class="comment-container"> -->
<!-- 			<!-- 게시글 좋아요 --> -->
<!-- 			<span class="post-like">게시글 좋아요 -->
<!-- 			</span> -->
<!-- 			<!-- 댓글 --> -->
<!-- 			<span class="comment">댓글</span> -->
<!-- 		</div> -->


	</div>
</article>
<!-- 어사이드 -->
<aside>
	<!-- 커뮤니티 아이돌 사진 -->
	<div class="group-picture">
		<div class="CommunityAsideView_aside_item__zFpbM">
			<div class="CommunityAsideWelcomeView_container__7vDI1">
				<div class="CommunityAsideWelcomeView_thumbnail_wrap__zIXgw">
					<div style="aspect-ratio: auto 353 / 301; content-visibility: auto; contain-intrinsic-size: 353px 301px;">
						<img src="https://phinf.wevpstatic.net/MjAyNDA2MjFfMTAw/MDAxNzE4OTQyOTI4OTU4.W737ocCc1HzjedvouBaoxegRatIW-bHyg1bGqRP9bX0g.4DAmqlmO8eyPRUPHradG-1BC_IPprQnfy7yw1R-3Cjog.JPEG/470a163f-20ca-4168-ba77-e3c09acd7bf1.jpeg?type=f706_602" class="CommunityAsideWelcomeView_thumbnail__5MVun" width="353" height="301" alt="">
					</div>
					<div class="CommunityAsideWelcomeView_gradation__mcle5" style="background-color: rgb(10, 132, 255);"></div>
				</div>
				<div class="CommunityAsideWelcomeView_info__PMqc+">
				<!-- 커뮤니티 가입자 수 -->
					<div class="CommunityAsideWelcomeView_member__25inr">
					263만 members
					</div>
					<!-- 그룹 소개로 이동 버튼 -->
					<a href="/newjeansofficial/artistpedia" class="CommunityAsideWelcomeView_community__X1fga">
						<div class="MarqueeView_container__l4V1r">
							<!-- 그룹명 텍스트 출력 -->
							<div class="MarqueeView_content__2Qs2H">
							NewJeans
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>	
	
	<!-- 
	아이돌 사진
		커뮤니티 가입자 수
		<div class="group-user">가입자수</div>
		그룹 소개로 이동 버튼
		<div class="group-intro ">그룹 소개로 ㄱㄱ
			그룹명 텍스트 출력
			<div class="group-name">그룹명
			</div>
		</div> 
	 -->
	</div>
	<!-- 멤버십 컨테이너 -->
	<div class="membership-container">
		<div class="CommunityAsideView_aside_item__zFpbM">
		<div class="CommunityAsideMembershipView_membership__zqNyr">
		<strong class="CommunityAsideMembershipView_title__Qskzy">
		<em class="BadgeViewV2_badge__Lz-qv BadgeViewV2_-membership_icon__5uf-z BadgeViewV2_-size_20__i-2Jy">
		<span class="blind">Membership Only Content</span>
		</em>Membership
		</strong>
		<p class="CommunityAsideMembershipView_join_text__NX6P6">
		지금 멤버십에 가입하고 특별한 혜택을 누려보세요.</p>
		<a href="#" class="CommunityAsideMembershipView_link_join__HkCXl">
		멤버십 가입하기</a></div></div>
	
<!-- 			<!-- 멤버십 아이콘 -->
<!-- 			<div class="membership-icon">멤버십 아이콘 -->
<!-- 			</div> -->
<!-- 			<!-- 멤버십 텍스트--> 
<!-- 			<div class="membershinp-text">걍 멤버십 텍스트 내보낼 거 -->
<!-- 			</div> -->
<!-- 		<!-- 멤버십 가입해 보세요~--> 
<!-- 		<div class="membership-join">가입하세용 txt~ -->
<!-- 		</div> -->
<!-- 		<!--  가입하기 버튼 --> 
<!-- 		<div class="membership-button">가입하기 버튼</div> -->
	</div>

	<!-- 내 프로필 -->
	<div class="user">
		<div class="CommunityAsideView_aside_item__zFpbM"><div style="aspect-ratio: auto 353 / 171; content-visibility: auto; contain-intrinsic-size: 353px 171px;"><a href="/newjeansofficial/profile/946f8a6ae08df27aff6b884875cd94ed" class="CommunityAsideMyProfileView_community_profile__2Yw1A"><div class="CommunityAsideMyProfileView_profile_thumbnail__g9xan"><div class="ProfileThumbnailView_thumbnail_area__u25Uf" style="width: 64px; height: 64px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 64 / 64; content-visibility: auto; contain-intrinsic-size: 64px; width: 100%; height: 100%;"><img src="https://cdn-v2pstatic.weverse.io/wev_web_fe/p/2_31_1/public/static/media/icon_empty_profile.b0996808ea97350978a4.png" class="ProfileThumbnailView_thumbnail__8W3E7" width="64" height="64" alt=""></div></div></div></div><div class="CommunityAsideMyProfileView_profile_name__GBKth"><strong class="CommunityAsideMyProfileView_name_text__2hNks">별사탕1</strong></div><div class="CommunityAsideMyProfileView_follower__Z5Nme"><em class="CommunityAsideMyProfileView_follower_count__5JfEt">0</em> 팔로워</div></a></div></div>
	
<!-- 		<!-- 프로필 사진 -->
<!-- 		<div class="user-profile"> 프로필 사진 -->
<!-- 		</div> -->
<!-- 		<!-- 닉네임 -->
<!-- 		<div class="user-nick">닉네임 -->
<!-- 		</div> -->
<!-- 		<!-- 팔로워 --> 
<!-- 		<div class="user-follower">팔로워 -->
<!-- 		</div> -->
	</div>
</aside>
</div>



</body>

</html>