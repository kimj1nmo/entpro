<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link href="/directlyCss/commdetailmodal.css" rel="stylesheet">



<!-- 모달 HTML -->
<!-- <div class="BaseModalView_modal_overlay" id="modal-detail" tabindex="-1" role="dialog" -->
<!-- 	aria-labelledby="modalDetailLabel" aria-hidden="true"> -->

<div class="ReactModalPortal">
  <div
    class="ReactModal__Overlay ReactModal__Overlay--after-open BaseModalView_modal_overlay__ap5fH BaseModalView_-post_1100__JUsSr"
    id="modal-detail" >
    <div id="modal" class="ReactModal__Content ReactModal__Content--after-open BaseModalView_modal__wjtT1" tabindex="-1"
      role="dialog" aria-label="Reading artist post" aria-modal="true">
      <div class="BaseModalViewContent BaseModalView_content__ipny1" style="width: 1100px; border-radius: 20px;">
        <div id="epmv" class="PostModalView_container__dBrYU" data-appearance="DEFAULT">
          <div class="PostModalView_content__9h+w+">
            <div class="PostModalView_post_wrap__Aby4s">
              <div class="PostModalView_post_header__ZXdw9">
                <div id="postHeader" class="PostHeaderView_header_wrap__CbRCi PostHeaderView_-header_type_post__TezQR">
<!--                   ajax에 가져감 -->
                  <div class="PostHeaderView_group_wrap__GshcX PostHeaderView_-button_area__yleim">
                    <div class="PostHeaderView_button_item__Q8PxN PostHeaderView_-menu__tmYfi">
                      <div><button type="button" class="MoreButtonView_button_menu__05Y26"><span class="blind">Show More
                            Content</span></button></div>
                    </div>
                  </div>
                </div>
              </div>
<!-- 			PostModalView_post_header 끝 -->
                <!-- 글 내용 -->
              <div class="PostModalView_post_body__Ni5Ja">
                <div>
                  <div class="styles_scrollStartPointer__tXizD undefined"></div>
                </div>
                <div class="WeverseViewer">
                  <p class="p" id="postContent">
<!--                   글 내용 ajax로 가져감 -->
                  </p>
                  <div data-media-attachment="photo.0-289616203" style="position: relative; min-height: 942.667px;">
                    <div class="WidgetMedia WidgetPhoto">
<!--                       <div class="photo_wrap" style="aspect-ratio: 2544 / 3392;"><img -->
<!--                           src="https://phinf.wevpstatic.net/MjAyNDEyMjBfMjU4/MDAxNzM0NjgyNjgzNDU5.O89VOCF1-eiRf4MpUQGodoZZgVo839ITyyJZ0Ws4kxQg.0Zbdw4LMhJzN7prryLvo9G3k8h3J17_sRUdS7Lmtnskg.JPEG/Weverse_d9cd8.jpg?type=w1414" -->
<!--                           class="photo" data-display-placeholder="false" style="aspect-ratio: 2544 / 3392;"></div> -->
                    </div>
                  </div>
                  <div id="ve"></div>
                </div>
                <div>
                  <div class="styles_scrollEndPointer__4c+-K undefined"></div>
                </div>
                <div class="styles_scrollButtonWrap__EsL1C undefined" data-visible="false"><button type="button"
                    class="ScrollUpDownButtonView_scroll_down__m9jac -color-light -direction-down"><span
                      class="blind">move scroll to down</span></button></div>
              </div>
			</div>
<!-- 			PostModalView_content 게시글 영역 끝 -->
			            <!-- 댓글 -->
            <div class="PostModalView_comment_wrap__hMtW1">
              <div class="CommentView_container__Yu5S3">
                <div id="commentViewer" data-comment-type="comment"
                  class="CommentViewerView_container__78kdv -comment_viewer_post" style="padding-bottom: 0px;">
                  <div class="CommentViewerView_title__qfI1k">
                    <div class="CommentTitleView_container__rNruB -comment_client_post"><strong
                        class="CommentTitleView_title__wIQq2">\${communityVO.commentCount}개의 댓글</strong><button type="button"
                        class="CommentTitleView_refresh_button__vaYE9"><span
                          class="CommentTitleView_refresh_icon__vc0WO"><span
                            class="blind">refresh</span></span></button></div>
                  </div>
                  <div class="commentList CommentViewerView_scrollable_area__-by2I">
                    <div>
                      <div class="styles_scrollStartPointer__Z1+-5"></div>
                    </div>
                    <div class="wrap_comment_list">
                      <div class="list">
                        <div class="CommentListView_list_content__5wsjS -comment_depth_depth1 -comment_client_post">
                          <div>
                            <div class="comment_item CommentView_comment_item__pDMEf" data-comment-id="4-357732210"
                              data-comment-anchored="false" data-comment-alias="COMMENT" data-comment-depth="depth1"
                              data-comment-client="post" data-comment-use-background="false">
                              <div class="CommentView_comment_content__P941+ -comment_client_post">
                                <div
                                  class="PostHeaderView_header_wrap__CbRCi PostHeaderView_-header_type_post__TezQR PostHeaderView_-comment_depth1__h6kCS">
                                  <div class="PostHeaderView_group_wrap__GshcX PostHeaderView_-profile_area__i8d-j"><a
                                      class="PostHeaderView_thumbnail_wrap__zzDv7"
                                      href="/lesserafim/profile/55dcaee155467115ffa0ba7ccfa82814">
                                      <div class="ProfileThumbnailView_thumbnail_area__u25Uf"
                                        style="width: 32px; height: 32px;">
                                        <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf">
                                          <div
                                            style="aspect-ratio: auto 32 / 32; content-visibility: auto; contain-intrinsic-size: 32px; width: 100%; height: 100%;">
                                            <img
                                              src="https://phinf.wevpstatic.net/MjAyNDEwMThfMTI4/MDAxNzI5MjQ1NTE2NDgw.NLgkK9_YT23x6HrvkE9MUXoBe5fQ0kRlKDdlNCpAChwg.12fym-qshqF_pXPYSPDvDw2uMBULh-pJGA6rgbVzK38g.JPEG/Weverse_fc7ef.jpg?type=s68"
                                              class="ProfileThumbnailView_thumbnail__8W3E7" width="32" height="32"
                                              alt=""></div>
                                        </div>
                                      </div>
                                    </a>
                                    <div class="PostHeaderView_text_wrap__EFgIq"><a
                                        href="/lesserafim/profile/55dcaee155467115ffa0ba7ccfa82814">
                                        <div class="PostHeaderView_nickname_wrap__LgVkc"><strong
                                            class="PostHeaderView_nickname__6Cb7X">\${comment.commRegNick}</strong></div>
                                      </a>
                                      <div class="PostHeaderView_info_wrap__l8QU+"><span
                                          class="PostHeaderView_date__XJXBZ">\${comment.cmmtDate}</span></div>
                                    </div>
                                  </div>
                                  <div class="PostHeaderView_group_wrap__GshcX PostHeaderView_-button_area__yleim">
                                    <div class="PostHeaderView_button_item__Q8PxN PostHeaderView_-menu__tmYfi">
                                      <div><button type="button"
                                          class="MoreButtonView_button_menu__05Y26 MoreButtonView_-comment__GmpKR MoreButtonView_-post__Zd-wn"><span
                                            class="blind">Show More Content</span></button></div>
                                    </div>
                                  </div>
                                </div>
                                <div class="CommentView_comment_text__tlVgA">
                                  <div>
                                    <div>
                                      <div class="SimpleShowMoreCommentView_container__HH0qw">
                                        <div class="wrap-comment">\${comment.cmmtCn}</div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="CommentView_comment_actions__AbNBZ">
                                  <div class="CommentView_comment_action_item__ClS5x"><button type="button"
                                      class="EmotionButtonView_button_emotion__eGktL EmotionButtonView_-comment__xhaZX -post"
                                      aria-pressed="false"><svg width="20" height="18" viewBox="0 0 20 18" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <path
                                          d="M17.7403 13.2023L16.3865 10.844C16.8756 9.9444 17.1551 8.9225 17.1551 7.83072C17.1551 7.61236 17.1464 7.40274 17.1202 7.18439C17.0765 6.76514 16.9891 6.3459 16.8669 5.95286C16.6834 5.35894 16.4127 4.80868 16.0721 4.30209C15.9585 4.13614 15.8362 3.97019 15.7139 3.82171C15.4607 3.50728 15.1724 3.22779 14.858 2.96576C13.7662 2.06613 12.3775 1.52461 10.849 1.52461C9.3205 1.52461 7.93176 2.06613 6.83998 2.96576C6.52555 3.21905 6.24605 3.50728 5.98402 3.82171C5.85301 3.97893 5.73073 4.13614 5.62592 4.30209C5.58225 4.36323 5.55605 4.43311 5.52111 4.49425L4.96212 4.08374C4.7263 3.91779 4.473 3.83045 4.20224 3.83045C3.86161 3.83045 3.52097 3.97019 3.28515 4.22349C3.04933 4.46804 2.91831 4.80868 2.92705 5.15805C2.92705 5.18425 2.92705 5.20172 2.92705 5.22792L3.10173 7.03591L1.62565 7.96173C1.62565 7.96173 1.57324 7.99667 1.54704 8.01414C1.154 8.30237 0.970582 8.78275 1.05792 9.26313C1.14527 9.74351 1.49464 10.1278 1.96628 10.2588L3.76553 10.713L4.23718 12.3812C4.23718 12.3812 4.24592 12.4162 4.25465 12.4337C4.42933 12.949 4.91845 13.2983 5.45997 13.2983C5.88795 13.2983 6.28099 13.0887 6.51681 12.7306L6.64783 12.5297C7.75707 13.5254 9.22442 14.1281 10.8315 14.1281C11.2246 14.1281 11.6001 14.0844 11.9757 14.0233L13.8012 16.0933C14.4737 16.8357 15.1724 16.9842 15.6441 16.9842C16.1681 16.9842 16.6922 16.8008 17.1202 16.4689C17.6355 16.0671 17.8451 15.6566 17.9761 15.3159C18.2294 14.6521 18.1333 13.8835 17.7228 13.2023H17.7403ZM7.0758 10.0579H7.06707C7.0234 10.0579 6.98846 10.0754 6.95352 10.0841C6.93605 10.0841 6.90985 10.0841 6.89238 10.1016C6.84871 10.1278 6.80504 10.1715 6.7701 10.2239L6.51681 10.6257L5.87048 11.665L5.59972 12.1018C5.59972 12.1018 5.52985 12.1629 5.48617 12.1629C5.48617 12.1629 5.48617 12.1629 5.47744 12.1629C5.47744 12.1629 5.46871 12.1629 5.45997 12.1629C5.4163 12.1542 5.37263 12.128 5.35516 12.0755L4.76123 9.9706C4.7263 9.84832 4.63022 9.76098 4.50794 9.72604L2.29818 9.16705C2.24578 9.14959 2.21084 9.10592 2.20211 9.06224C2.19337 9.00984 2.20211 8.95743 2.25451 8.9225L4.09743 7.76958C4.24592 7.68224 4.31579 7.54249 4.29832 7.35907L4.07996 5.12311C4.07996 5.12311 4.09743 5.05324 4.1149 5.02703C4.1149 5.02703 4.12364 5.0183 4.13237 5.00957C4.15857 4.9921 4.18478 4.98336 4.21098 4.97463H4.21971C4.21971 4.97463 4.27212 4.97463 4.29832 5.00083L6.24605 6.44198L6.36833 6.45945L8.48201 5.55982C8.48201 5.55982 8.51695 5.55982 8.53442 5.55982C8.53442 5.55982 8.53442 5.55982 8.54315 5.55982C8.57809 5.55982 8.61303 5.57729 8.63923 5.60349C8.63923 5.60349 8.63923 5.61223 8.64796 5.62096C8.66543 5.6559 8.6829 5.69084 8.66543 5.73451L7.92302 7.86566C7.89682 7.93553 7.89682 7.99667 7.90555 8.05781C7.91429 8.11895 7.94922 8.16262 7.98416 8.20629L9.42531 9.88326C9.49518 9.9706 9.42531 10.1016 9.3205 10.1104L7.08454 10.0667L7.0758 10.0579ZM10.8577 13.0014C9.46898 13.0014 8.21125 12.4511 7.28542 11.5515L7.50378 11.2021L9.29429 11.2371C9.81835 11.2371 10.2551 10.9576 10.4647 10.5121C10.6743 10.0754 10.6219 9.56009 10.3162 9.17579C10.3075 9.16705 10.2987 9.14959 10.2813 9.14085L9.13708 7.80452L9.73101 6.10134C9.86202 5.6821 9.79215 5.25412 9.55632 4.93096C9.3205 4.60779 8.93619 4.4069 8.53442 4.4069C8.38594 4.4069 8.23745 4.43311 8.09771 4.48551C8.08024 4.48551 8.06277 4.50298 8.0453 4.50298L6.46441 5.17552H6.45567C7.36403 3.67323 8.99733 2.66006 10.8752 2.66006C13.7225 2.66006 16.0371 4.97463 16.0371 7.82198C16.0371 10.6693 13.7225 12.9839 10.8752 12.9839L10.8577 13.0014ZM16.928 14.9229C16.8494 15.1413 16.7446 15.3421 16.4389 15.578C16.1856 15.7701 15.8886 15.8487 15.6615 15.8487C15.6179 15.8487 15.5655 15.84 15.5218 15.8313C15.4869 15.8313 15.4519 15.8313 15.417 15.8138C15.3646 15.8051 15.3209 15.7789 15.2685 15.7614C15.2336 15.7439 15.1986 15.7439 15.1637 15.7265C15.1026 15.7003 15.0414 15.6566 14.989 15.6129C14.9628 15.5954 14.9453 15.5867 14.9191 15.5692C14.8405 15.5081 14.7532 15.4295 14.6746 15.3421L13.2072 13.6739C14.168 13.2896 15.0152 12.6695 15.679 11.8834L16.7708 13.7875C17.0066 14.1805 17.0503 14.5997 16.9367 14.9142L16.928 14.9229Z"
                                          fill="#8E8E8E"></path>
                                      </svg><span class="blind">cheering</span></button></div>
                                  <div class="CommentView_comment_action_item__ClS5x"><button type="button"
                                      class="CommentButtonView_button_comment__uq1n3 CommentButtonView_-comment__ikcQa -post"><svg
                                        width="20" height="18" viewBox="0 0 20 18" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <path
                                          d="M16.9987 8.45003C16.9987 4.72476 13.9753 1.70135 10.25 1.70135C6.52475 1.70135 3.50134 4.72476 3.50134 8.45003C3.50134 11.3038 5.27528 13.741 7.77422 14.7282C7.77422 14.7282 7.80507 14.7436 7.8282 14.7514C8.11358 14.8593 8.40666 14.9519 8.70746 15.0213C11.1524 15.6615 14.0524 15.5458 15.4484 15.3144C15.8263 15.245 15.9729 14.9133 15.7801 14.574C15.5718 14.2038 15.2787 13.7564 15.2247 13.3553C15.0474 12.0056 16.9987 11.1186 16.991 8.52715C16.991 8.50402 16.991 8.48088 16.991 8.45774L16.9987 8.45003Z"
                                          stroke="#8E8E8E" stroke-width="1.2" stroke-miterlimit="10"></path>
                                      </svg><span class="blind">Leave a comment</span></button></div>
                                </div>
                              </div>
                            </div>
                            <div class="loader"><span class="blind">Loading</span></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="styles_scrollButtonWrap__NXZnL undefined" data-visible="false"><button type="button"
                        class="ScrollUpDownButtonView_scroll_down__m9jac -color-light -direction-down"><span
                          class="blind">move scroll to down</span></button></div>
                  </div>
                  <div class="CommentViewerView_input_area__onBCJ" data-comment-emphasize="false"
                    data-has-limit-description="false">
                    <div class="CommentViewerView_input_wrap__qLa5a">
                      <div class="container -comment_client_post">
                        <div class="CommentInputView_form__+hOS9">
                          <div class="CommentInputView_textarea_wrap__KM2T7"><textarea
                              class="CommentInputView_textarea__wWwlC" spellcheck="false" placeholder="댓글을 입력하세요."
                              style="height: 22px !important;"></textarea></div><button type="button"
                            class="CommentInputView_send_button__17Hla" disabled=""><svg width="36" height="36"
                              viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg">
                              <path
                                d="M18 26C17.4477 26 17 25.5523 17 25L17 12C17 11.4477 17.4477 11 18 11C18.5523 11 19 11.4477 19 12L19 25C19 25.5523 18.5523 26 18 26Z"
                                fill="currentColor"></path>
                              <path d="M12 17L18 11L24 17" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round"></path>
                            </svg><span class="blind">send</span></button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="CommentAsideDrawerView_drawer__E0cxX CommentAsideDrawerView_-post__KKjLy"></div>
              </div>
            </div>
<!--             댓글 끝 -->
			</div>
<!-- 			PostModalView_content end -->
<!-- 			여기부터 좋아요 댓글 아이콘인듯 -->
			<div class="PostModalView_post_action__Fiydu"><button type="button"
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
              </svg><span class="blind">cheering</span>10K+</button><button type="button"
              class="ShareButtonView_button_share__MEfnf ShareButtonView_-post__+qlWU"><svg width="24" height="22"
                viewBox="0 0 24 22" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                <path
                  d="M22.6697 9.89199L13.9914 1.66256C13.2682 0.976778 12.1211 1.52541 12.1211 2.56032V6.79972C5.05244 6.79666 0.788919 12.2629 0.954716 19.4474C0.967184 20.2704 1.94425 20.5077 2.35123 19.809C4.95833 15.3333 9.29166 14.25 12.1335 14.7548V19.0192C12.1335 20.0541 13.2807 20.6027 14.0039 19.9169L22.6822 11.6875C23.1809 11.2137 23.1684 10.3783 22.6697 9.89199Z"
                  stroke="#444444" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"></path>
              </svg><span class="blind">share</span></button></div>
              
			<!-- 좋아요 댓글 아이콘 끝-->
		</div>
<!-- 		PostModalView_container  end -->

	</div>
<!-- 	BaseModalViewContent 종료 -->
			<!--  
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
			-->
			<button type="button" class="BaseModalView_close_button__+0N-m"><span class="blind">close
          popup</span></button>
</div>
</div>