<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/directlyCss/main.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn-v2pstatic.weverse.io/wev_web_fe/p/2_32_4/public/static/css/9990.c5b06815.chunk.css">
<link href="https://cdn-v2pstatic.weverse.io/wev_web_fe/p/2_32_4/public/static/css/main.9d86b0f6.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn-v2pstatic.weverse.io/wev_web_fe/p/2_32_4/public/static/css/6312.cadbe1e5.chunk.css">
<title>ENTERTAINMENT</title>
<style>
    .video-iframe {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: -1;
        object-fit: cover;
        object-position: center top;
        overflow: hidden;
        display: none;
        /* 기본적으로 숨김 처리 */
    }

    li,
    ol,
    ul {
        list-style: none;
    }

    li {
        display: list-item;
        text-align: -webkit-match-parent;
        unicode-bidi: isolate;
        padding: 7px;
    }

    .flicking-camera {
        gap: 16px;
        display: flex;
        flex-direction: row;
        height: 100%;
        position: relative;
        width: 100%;
        will-change: transform;
        z-index: 1;
    }
    .BaseModalViewContent {
    width: 450px;  /* 너비 유지 */
    border-radius: 14px;  /* 기존 설정 유지 */
    margin: 0 auto;  /* 가로 정렬 */
    display: block;  /* 블록 요소로 변경 */
}


    /* 모달 스타일 */
    /*
    #surveyModal {
        display: none;
        position: fixed;
        z-index: 1000;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        width: 400px;
        background: white;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        padding: 20px;
        border-radius: 10px;
        text-align: center;
    }*/

    #surveyModal img {
        width: 100%;
        height: auto;
        border-radius: 10px;
    }

    #surveyModal button {
        margin: 10px;
        padding: 10px 15px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        font-size: 16px;
    }

    #surveyModal .btn-primary {
        background: #007bff;
        color: white;
    }

    #surveyModal .btn-secondary {
        background: #6c757d;
        color: white;
    }

    #surveyModal .btn-close {
        background: #dc3545;
        color: white;
    }

    #surveyOverlay {
        display: none; /* 기본적으로 숨김 */
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: 999;
    }
    */
</style>
</head>

<body>

<!-- <iframe class="video-iframe" id="img_w20220211cc477db2cd9a9" -->
<!--     src="https://www.youtube.com/embed/ft70sAYrFyY?loop=1&amp;rel=0&amp;playlist=ft70sAYrFyY&amp;showinfo=0&amp;controls=0&amp;mute=1&amp;autoplay=1&amp;enablejsapi=1&amp;origin=https%3A%2F%2Fantenna.co.kr&amp;widgetid=1" -->
<!--     frameborder="0" allowfullscreen title="NewJeans (뉴진스) 'Bubble Gum' Official MV"></iframe> -->

<!-- <iframe class="video-iframe" id="img_w20220211cc477db2cd9b0" -->
<!--     src="https://www.youtube.com/embed/ekr2nIex040?loop=1&amp;rel=0&amp;playlist=ekr2nIex040&amp;showinfo=0&amp;controls=0&amp;mute=1&amp;autoplay=1&amp;enablejsapi=1&amp;origin=https%3A%2F%2Fantenna.co.kr&amp;widgetid=2" -->
<!--     frameborder="0" allowfullscreen -->
<!--     title="ROSÉ &amp; Bruno Mars - APT. (Official Music Video)"></iframe> -->

<iframe class="video-iframe" id="img_aespa_whiplash"
    src="https://www.youtube.com/embed/jWQx2f-CErU?loop=1&amp;rel=0&amp;playlist=jWQx2f-CErU&amp;showinfo=0&amp;controls=0&amp;mute=1&amp;autoplay=1&amp;enablejsapi=1&amp;origin=https%3A%2F%2Fantenna.co.kr&amp;widgetid=3"
    frameborder="0" allowfullscreen title="aespa 에스파 'Whiplash' MV"></iframe>

<iframe class="video-iframe" id="img_gdragon_power"
    src="https://www.youtube.com/embed/NMjhjrBIrG8?loop=1&amp;rel=0&amp;playlist=NMjhjrBIrG8&amp;showinfo=0&amp;controls=0&amp;mute=1&amp;autoplay=1&amp;enablejsapi=1&amp;origin=https%3A%2F%2Fantenna.co.kr&amp;widgetid=4"
    frameborder="0" allowfullscreen title="G-DRAGON - POWER (Official Video)"></iframe>

<iframe class="video-iframe" id="img_seventeen_fighting"
    src="https://www.youtube.com/embed/mBXBOLG06Wc?loop=1&amp;rel=0&amp;playlist=mBXBOLG06Wc&amp;showinfo=0&amp;controls=0&amp;mute=1&amp;autoplay=1&amp;enablejsapi=1&amp;origin=https%3A%2F%2Fantenna.co.kr&amp;widgetid=5"
    frameborder="0" allowfullscreen
    title="부석순 (SEVENTEEN) '파이팅 해야지 (Feat. 이영지)' Official MV"></iframe>


<script>
    // iframe 요소를 배열로 가져옵니다.
    const videos = document.querySelectorAll('.video-iframe');

    // 영상 인덱스 배열을 만듭니다.
    const videoIndices = [0,1,2];

    // 인덱스를 무작위로 섞는 함수
    function shuffle(array) {
        for (let i = array.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [array[i], array[j]] = [array[j], array[i]]; // 두 요소를 교환
        }
    }

    // 영상 표시 함수 (인덱스 순으로 보여주기)
    function showVideosInRandomOrder() {
        shuffle(videoIndices);  // 영상 인덱스를 무작위로 섞기

        let currentIndex = 0;

        // 첫 번째 영상부터 순차적으로 보여주기
        function displayNextVideo() {
            // 모든 iframe을 숨깁니다.
            videos.forEach(video => video.style.display = 'none');

            // 현재 인덱스에 해당하는 iframe만 보이게 합니다.
            videos[videoIndices[currentIndex]].style.display = 'block';
            currentIndex++;

            // 모든 영상이 끝났으면 처음으로 돌아갑니다.
            if (currentIndex >= videoIndices.length) {
                currentIndex = 0;
                shuffle(videoIndices); // 영상 순서 무작위로 섞기
            }

            // 12초 후 다음 영상 표시
            setTimeout(displayNextVideo, 12000);
        }

        // 첫 번째 영상부터 보여주기 시작
        displayNextVideo();
    }

    // 페이지 로드 시 영상들을 무작위 순서로 보여줍니다.
    window.onload = showVideosInRandomOrder;
</script>

</body>

</html>









<!-- 헤더 -->
<div style="margin: 0; padding: 0; box-sizing: border-box; width: 100%; height: 100vh; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; width: 100%; z-index: 10;">
        <jsp:include page="../include/header_user.jsp"></jsp:include>
    </div>
</div>


<!-- 헤더 빠짐 끝 -->
<style>
/* 전체 섹션 중앙 정렬 */
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f9fafb;
}

.container {
    max-width: 1100px;
    margin: 0 auto;
    padding: 20px;
    text-align: center;
    /* 컨텐츠 중앙 정렬 */
    position: relative;
    /* 위치 설정 */
    right: 20px;

    /* 컨텐츠를 오른쪽으로 이동
}


/* Home Artist List Styles */
    .HomeArtistListSlotView_artist_list__3fPzz {
        display: flex;
        flex-wrap: wrap;
        /* 한 줄에 공간 부족 시 다음 줄로 넘어감 */
        gap: 16px;
        /* 아이템 간 간격 */
        justify-content: center;
        /* 아이템 중앙 정렬 */
    }

    .HomeArtistListSlotView_artist_item__a6gAX {
        flex: 0 0 calc(25% - 12px);
        /* 한 줄에 4개 배치 */
        background-color: white;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
        transition: transform 0.2s;
        text-align: center;
        /* 아이템 내부 컨텐츠 중앙 정렬 */
    }

    .HomeArtistListSlotView_artist_item__a6gAX:hover {
        transform: translateY(-5px);
    }

    .artist-item-image {
        width: 100%;
        height: 150px;
        background-color: #e5e7eb;
        object-fit: cover;
    }

    .artist-item-title {
        padding: 10px;
        font-size: 1.1rem;
        font-weight: bold;
    }

    /* 아티스트가 1명일 때 크기 유지 */
    .HomeArtistListSlotView_artist_list__3fPzz:has(.HomeArtistListSlotView_artist_item__a6gAX:nth-child(1)) {
        justify-content: flex-start;
        /* 좌측 정렬 */
    }

    .HomeArtistListSlotView_artist_item__a6gAX:nth-child(1):only-child {
        flex: 0 0 calc(25% - 12px);
        /* 4개 중 하나 크기로 고정 */
    }
}

/* 반응형 스타일 */
@media (max-width: 768px) {
    .hero h1 {
        font-size: 2rem;
    }

    .hero p {
        font-size: 1rem;
    }

    .HomeArtistListSlotView_artist_item__a6gAX {
        flex: 0 0 calc(50% - 16px);
        /* 작은 화면에서 한 줄에 2개 */
    }

    .HomeArtistListSlotView_artist_item__a6gAX:nth-child(1):only-child {
        flex: 0 0 calc(50% - 16px);
        /* 작은 화면에서도 크기 고정 */
    }
}

/* 상품 리스트 스타일 */
.HomeMerchView_list__rnjxo {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 10px;
}

.product-item {
    width: calc(25% - 50px);
    padding: 10px;
    box-sizing: border-box;
    transition: transform 0.3s ease;
    background-color: white;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    text-align: center;
}

.product-item img {
    width: 100% !important;
    height: auto;
    object-fit: cover;
}

.product-item .product-title {
    font-size: 14px;
    font-weight: bold;
    margin-top: 10px;
}

.product-item .product-price {
    font-size: 12px;
    color: #333;
}

.product-item:hover {
    transform: scale(1.05);
}

/* 반응형 스타일 */
@media (max-width: 768px) {
    .product-item {
        width: calc(50% - 10px);
    }
}

@media (max-width: 480px) {
    .product-item {
        width: 100%;
    }
}



/* 탭 스타일 */
.HomeMerchView_tab_list__igmXw {
    display: flex;
    justify-content: center;
    gap: 16px;
}

.HomeMerchView_tab_item__msTtD {
    padding: 10px 20px;
    background-color: #e5e7eb;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.HomeMerchView_tab_item__msTtD[aria-selected="true"] {
    background-color: #1d4ed8;
    color: white;
}

.HomeMerchView_tab_item__msTtD:hover {
    background-color: #2563eb;
}
</style>






<!-- 	<main class="main"> -->

<!-- 		<!-- Hero Section -->
<!-- 		<section id="hero" class="hero section dark-background"> -->

<!-- 			<div class="container"> -->
<!-- 				<div class="row gy-4"> -->
<!-- 					<div -->
<!-- 						class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center" -->
<!-- 						data-aos="zoom-out"></div> -->
<!-- 					<div class="col-lg-6 order-1 order-lg-2 hero-img" -->
<!-- 						data-aos="zoom-out" data-aos-delay="200"></div> -->
<!-- 				</div> -->
<!-- <iframe width="1250" height="703" src="https://www.youtube.com/embed/ft70sAYrFyY" title="NewJeans (뉴진스) &#39;Bubble Gum&#39; Official MV" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe> -->
<!-- 			</div> -->

<!-- 		</section> -->
<!-- 		<!-- /Hero Section -->

<!-- </main> -->

<!-- <section id="portfolio" class="portfolio section"> -->


<c:if test="${not empty groupsCommVOs}">

				<div class="container section-title divTitle" data-aos="fade-up">
<%-- <br>${groupsVOList}<br> --%>
<c:set var="currentUri" value="${pageContext.request.requestURI}" />
<h2 class="text-center">나의 커뮤니티</h2>
<%-- <h2 class="text-center">${groupsCommVOs}</h2> --%>
<ul class="HomeArtistListSlotView_artist_list__3fPzz d-flex justify-content-center">
    <c:forEach var="groupsVO" items="${groupsCommVOs}" varStatus="stat">
        <li class="HomeArtistListSlotView_artist_item__a6gAX" style="padding:0px;">
            <a class="HomeArtistListSlotView_artist_link__Mjm6r" href="${groupsVO.groupNo}/feed">
                <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP">
                    <img src="${groupsVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}"
                    width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk"
                    alt="Artist Cover">
                </div>
<!--                 <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                     <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                         style="width: 43px; height: 43px;"> -->
                        <c:choose>
                            <c:when test="${groupsVO.groupName == 'BTS'}">
                            </c:when>
                            <c:otherwise>
                            </c:otherwise>
                        </c:choose>
<!--                     </div> -->
<!--                 </div> -->
                <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ">
                    <strong class="HomeArtistListSlotView_artist_name__RFLuB">
                        ${groupsVO.groupName}
                    </strong>
                </div>
            </a>
        </li>
    </c:forEach>
</ul>
<br><br>
</div>
</c:if>

<!-- Section Title -->
<







        <!-- Portfolio Section -->
        <!-- 		<section id="portfolio" class="portfolio section"> -->

        <!-- Section Title -->
        <!-- 			<div class="container section-title" data-aos="fade-up"> -->
        <!-- 				<h2>굿즈(테스트4)</h2> -->
        <!-- 			</div> -->
        <!-- End Section Title -->

        <!-- 굿즈 -->
        <section id="portfolio" class="portfolio section sectionMargin">
    <!-- Section Title -->
    <div class="container section-title aos-init aos-animate divTitle" data-aos="fade-up">
        <h2>굿즈</h2>
    </div>
    <!-- End Section Title -->

    <div class="container">
        <div class="isotope-layout" data-default-filter="*" data-layout="masonry" data-sort="original-order">

            <!-- 카테고리 필터 동적 생성 -->
            <!--<ul class="portfolio-filters isotope-filters aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
                <li data-filter="*" class="filter-active">All</li>
                <c:forEach var="category" items="${categoryList}">
                    <li data-filter=".filter-${category.ctgryNo}">${category.categoryName}</li>
                </c:forEach>
            </ul>-->
            <!-- End Portfolio Filters -->

            <div class="row gy-4 isotope-container aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">

                <!-- 굿즈 리스트 출력 (최대 6개) -->
                <c:forEach var="goods" items="${goodsList}" varStatus="status">
                    <c:if test="${status.index < 6}">
                        <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-${goods.ctgryNo}">
                            <a href="/goods/detail?gdsNo=${goods.gdsNo}" title="More Details" class="details-link">
                            	<img src="${goods.fileGroupVO.fileDetailVOList[0].fileSaveLocate}" class="img-fluid" alt="${goods.gdsNm}">
                            </a>
                            <div class="portfolio-info">
                                <h4>${goods.gdsNm}</h4>
                                <p><fmt:formatNumber value="${goods.gdsPrice}" type="currency" currencyCode="KRW" /></p>
                                <a href="${goods.fileGroupVO.fileDetailVOList[0].fileSaveLocate}" title="${goods.gdsNm}" data-gallery="portfolio-gallery-${goods.ctgryNo}" class="glightbox preview-link">
                                    <i class="bi bi-zoom-in"></i>
                                </a>
                                <a href="/goods/detail?gdsNo=${goods.gdsNo}" title="More Details" class="details-link">
                                    <i class="bi bi-link-45deg"></i>
                                </a>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>

            </div>
            <!-- End Portfolio Container -->
        </div>
    </div>
</section>


<div class="container section-title divTitle" data-aos="fade-up">
<%-- <br>${groupsVOList}<br> --%>
<c:set var="currentUri" value="${pageContext.request.requestURI}" />
<h2 class="text-center">아티스트 커뮤니티</h2>
<ul class="HomeArtistListSlotView_artist_list__3fPzz d-flex justify-content-center">
    <c:forEach var="groupsVO" items="${groupsVOList}" varStatus="stat">
        <li class="HomeArtistListSlotView_artist_item__a6gAX" style="padding:0px";>
            <a class="HomeArtistListSlotView_artist_link__Mjm6r" href="${groupsVO.groupNo}/artist">
                <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP">
                    <img src="${groupsVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}"
                    width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk"
                    alt="Artist Cover">
                </div>
<!--                 <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                     <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                         style="width: 43px; height: 43px;"> -->
                        <c:choose>
                            <c:when test="${groupsVO.groupName == 'BTS'}">
                            </c:when>
                            <c:otherwise>
                            </c:otherwise>
                        </c:choose>
<!--                     </div> -->
<!--                 </div> -->
                <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ">
                    <strong class="HomeArtistListSlotView_artist_name__RFLuB">
                        ${groupsVO.groupName}
                    </strong>
                </div>
            </a>
        </li>
    </c:forEach>
</ul>
<br><br>
</div>

<!--     <div class="isotope-layout" data-default-filter="*" data-layout="masonry" data-sort="original-order"> -->
<!--         그룹 리스트 반복문 -->
<%-- <c:forEach var="groupsVO" items="${groupsVOList}" varStatus="stat"> --%>
<!--             <h1> -->
<%-- <a href="${groupsVO.groupNo}/feed">${groupsVO.groupName}</a><br> --%>
    <!--             </h1> -->
    <%-- </c:forEach> --%>
        <!--     </div> -->
        <!-- </div> -->






        <!-- /Portfolio Section -->

        <!-- Team Section -->
        <!-- 		<section id="team" class="team section"> -->
        <!-- 		<div class="container"> -->
        <!-- Section Title -->
<!--         <div class="container section-title" data-aos="fade-up"> -->
<!--             <h2>새로운 아티스트를 만나보세요!</h2> -->
<!--         </div> -->
        <!-- End Section Title -->
<!--         <div class="container"> -->
<!--             <div class="HomeComponentView_component__oey5Q"> -->
<!--                 <div> -->
<!--                     <ul class="HomeArtistListSlotView_artist_list__3fPzz"> -->
<!--                         <li class="HomeArtistListSlotView_artist_item__a6gAX"> -->
<!--                             <div><a class="HomeArtistListSlotView_artist_link__Mjm6r" -->
<!--                                     href="/bigbang/feed"> -->
<!--                                     <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"> -->
<!--                                         <img src="https://phinf.wevpstatic.net/MjAyMjExMjRfNjIg/MDAxNjY5MjU0MjkzNzMy.vbBBtEv6KkSsmVVsfHVN6iBOcSynDpK5EvCM4PPhA5Qg.wYPiQLm4dq-n_M6VUNJtUaRpxFJVBAvYUWAg_2Cz6gcg.PNG/513312278141071311944ca9f-1c16-4083-9b4f-3e102d837e4e.png?type=f416_354" -->
<!--                                             width="208" height="177" -->
<!--                                             class="HomeArtistListSlotView_cover_img__a2krk" alt=""> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                                         <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                                             style="width: 43px; height: 43px;"> -->
<!--                                             <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"> -->
<!--                                                 <div -->
<!--                                                     style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"> -->
<!--                                         <strong class="HomeArtistListSlotView_artist_name__RFLuB"> -->
<!--                                             <div class="MarqueeView_container__l4V1r"> -->
<!--                                                 <div class="MarqueeView_content__2Qs2H">BIGBANG -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </strong></div> -->
<!--                                 </a> </div> -->
<!--                         </li> -->
<!--                         <li class="HomeArtistListSlotView_artist_item__a6gAX"><a -->
<!--                                 class="HomeArtistListSlotView_artist_link__Mjm6r" href="/tws/feed"> -->
<!--                                 <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img -->
<!--                                         src="https://phinf.wevpstatic.net/MjAyNDExMTVfMjU5/MDAxNzMxNjc1NzUzMDAw.PASkkyDtQLsNogjkYL1Ez31SQUVxt32KFyP5p_4WExwg.t0xjqNhrrofEhs9UgvOU-2iKRri6-v_r-iRVB3GdjCog.JPEG/72d4b0da-d537-481f-804e-d44fdae55cd6.jpeg?type=f416_354" -->
<!--                                         width="208" height="177" -->
<!--                                         class="HomeArtistListSlotView_cover_img__a2krk" alt=""> -->
<!--                                 </div> -->
<!--                                 <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                                     <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                                         style="width: 43px; height: 43px;"> -->
<!--                                         <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"> -->
<!--                                             <div -->
<!--                                                 style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong -->
<!--                                         class="HomeArtistListSlotView_artist_name__RFLuB"> -->
<!--                                         <div class="MarqueeView_container__l4V1r"> -->
<!--                                             <div class="MarqueeView_content__2Qs2H">TWS</div> -->
<!--                                         </div> -->
<!--                                     </strong></div> -->
<!--                             </a></li> -->
<!--                         <li class="HomeArtistListSlotView_artist_item__a6gAX"><a -->
<!--                                 class="HomeArtistListSlotView_artist_link__Mjm6r" -->
<!--                                 href="/babymonster/feed"> -->
<!--                                 <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img -->
<!--                                         src="https://phinf.wevpstatic.net/MjAyNDExMDFfMTk1/MDAxNzMwNDM0MDMzNjk5.OS-VillPnTC5Y59ykq-Upy1QwURZ50QIvODG03GZbcMg.WVg6zIbkWubivSpWmrwafKv0y5naMh4WX2AST0cOjbsg.PNG/b94de7aa-38a2-475e-ad0e-4eba716a2eb3.png?type=f416_354" -->
<!--                                         width="208" height="177" -->
<!--                                         class="HomeArtistListSlotView_cover_img__a2krk" alt=""> -->
<!--                                 </div> -->
<!--                                 <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                                     <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                                         style="width: 43px; height: 43px;"> -->
<!--                                         <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"> -->
<!--                                             <div -->
<!--                                                 style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong -->
<!--                                         class="HomeArtistListSlotView_artist_name__RFLuB"> -->
<!--                                         <div class="MarqueeView_container__l4V1r"> -->
<!--                                             <div class="MarqueeView_content__2Qs2H">BABYMONSTER -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </strong></div> -->
<!--                             </a></li> -->
<!--                         <li class="HomeArtistListSlotView_artist_item__a6gAX"><a -->
<!--                                 class="HomeArtistListSlotView_artist_link__Mjm6r" -->
<!--                                 href="/newjeansofficial/feed"> -->
<!--                                 <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img -->
<!--                                         src="https://phinf.wevpstatic.net/MjAyNDA2MjFfMTAw/MDAxNzE4OTQyOTI4OTU4.W737ocCc1HzjedvouBaoxegRatIW-bHyg1bGqRP9bX0g.4DAmqlmO8eyPRUPHradG-1BC_IPprQnfy7yw1R-3Cjog.JPEG/470a163f-20ca-4168-ba77-e3c09acd7bf1.jpeg?type=f416_354" -->
<!--                                         width="208" height="177" -->
<!--                                         class="HomeArtistListSlotView_cover_img__a2krk" alt=""> -->
<!--                                 </div> -->
<!--                                 <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                                     <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                                         style="width: 43px; height: 43px;"> -->
<!--                                         <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"> -->
<!--                                             <div -->
<!--                                                 style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong -->
<!--                                         class="HomeArtistListSlotView_artist_name__RFLuB"> -->
<!--                                         <div class="MarqueeView_container__l4V1r"> -->
<!--                                             <div class="MarqueeView_content__2Qs2H">NewJeans</div> -->
<!--                                         </div> -->
<!--                                     </strong></div> -->
<!--                             </a></li> -->
<!--                         <li class="HomeArtistListSlotView_artist_item__a6gAX"><a -->
<!--                                 class="HomeArtistListSlotView_artist_link__Mjm6r" -->
<!--                                 href="/saymyname/feed"> -->
<!--                                 <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img -->
<!--                                         src="https://phinf.wevpstatic.net/MjAyNDExMDVfMTMz/MDAxNzMwNzg3MTg5MjM3.CGkY-FGSobE7QDNQLQhhy8P-JQVEJIQJXyAghOt7_Gog.awV3WdS8pK38LCEQocBiFVu1TlmoRrVR5Fy9ZRKLEu8g.PNG/327607851795022446b4b0fcf-2432-4c99-8ead-6554373e6f94.png?type=f416_354" -->
<!--                                         width="208" height="177" -->
<!--                                         class="HomeArtistListSlotView_cover_img__a2krk" alt=""> -->
<!--                                 </div> -->
<!--                                 <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                                     <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                                         style="width: 43px; height: 43px;"> -->
<!--                                         <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"> -->
<!--                                             <div -->
<!--                                                 style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong -->
<!--                                         class="HomeArtistListSlotView_artist_name__RFLuB"> -->
<!--                                         <div class="MarqueeView_container__l4V1r"> -->
<!--                                             <div class="MarqueeView_content__2Qs2H">SAY MY NAME -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </strong></div> -->
<!--                             </a></li> -->
<!--                         <li class="HomeArtistListSlotView_artist_item__a6gAX"> -->
<!--                             <div><a class="HomeArtistListSlotView_artist_link__Mjm6r" -->
<!--                                     href="/nowadays/feed"> -->
<!--                                     <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"> -->
<!--                                         <img src="https://phinf.wevpstatic.net/MjAyNDExMTNfMTU2/MDAxNzMxNDc0NzAzMTU3.yDpzb9yBTq5n4GChsdEqLvIdFe2i-h5yxYPOA5LGZ24g.lm2vFW_KvqMhdQFnt-qu6S0k_REYw66BZnSsIEezw2og.JPEG/566c09ac-d36b-4c8f-bc32-3cbbed5a9640.jpeg?type=f416_354" -->
<!--                                             width="208" height="177" -->
<!--                                             class="HomeArtistListSlotView_cover_img__a2krk" alt=""> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                                         <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                                             style="width: 43px; height: 43px;"> -->
<!--                                             <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"> -->
<!--                                                 <div -->
<!--                                                     style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"> -->
<!--                                         <strong class="HomeArtistListSlotView_artist_name__RFLuB"> -->
<!--                                             <div class="MarqueeView_container__l4V1r"> -->
<!--                                                 <div class="MarqueeView_content__2Qs2H">NOWADAYS -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </strong></div> -->
<!--                                 </a> </div> -->
<!--                         </li> -->
<!--                         <li class="HomeArtistListSlotView_artist_item__a6gAX"> -->
<!--                             <div><a class="HomeArtistListSlotView_artist_link__Mjm6r" -->
<!--                                     href="/enhypen/feed"> -->
<!--                                     <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"> -->
<!--                                         <img src="https://phinf.wevpstatic.net/MjAyNDEwMjVfMTE4/MDAxNzI5ODQ4MzMzMTEy.dmvjeA8vD61kf9KdoJx-TFRBGI_Qq1Q5Le2BMKG4qZEg.ivsLNXcJvSlioifndSZK0__G6_SdFIIuXW1qlppgHiEg.JPEG/67906065383058806c8fd54b6-69d8-4738-826c-13b333a676c3.jpg?type=f416_354" -->
<!--                                             width="208" height="177" -->
<!--                                             class="HomeArtistListSlotView_cover_img__a2krk" alt=""> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                                         <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                                             style="width: 43px; height: 43px;"> -->
<!--                                             <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"> -->
<!--                                                 <div -->
<!--                                                     style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"> -->
<!--                                         <strong class="HomeArtistListSlotView_artist_name__RFLuB"> -->
<!--                                             <div class="MarqueeView_container__l4V1r"> -->
<!--                                                 <div class="MarqueeView_content__2Qs2H">ENHYPEN -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </strong></div> -->
<!--                                 </a> </div> -->
<!--                         </li> -->
<!--                         <li class="HomeArtistListSlotView_artist_item__a6gAX"> -->
<!--                             <div><a class="HomeArtistListSlotView_artist_link__Mjm6r" -->
<!--                                     href="/apink/feed"> -->
<!--                                     <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"> -->
<!--                                         <img src="https://phinf.wevpstatic.net/MjAyNDExMTVfMjYg/MDAxNzMxNjQwMDY2MTk2.MXcXxlrdLoz11Xqix5MCdzbTwRcxpAempw7XheNJ0GUg.gIh-uHfIcX-gNFT5jevBavEXfcyXBJ5i6QiBjoHmmvog.JPEG/9cc695f3-ad2c-4f1f-9802-0b7784fcab5a.jpeg?type=f416_354" -->
<!--                                             width="208" height="177" -->
<!--                                             class="HomeArtistListSlotView_cover_img__a2krk" alt=""> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                                         <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                                             style="width: 43px; height: 43px;"> -->
<!--                                             <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"> -->
<!--                                                 <div -->
<!--                                                     style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"> -->
<!--                                         <strong class="HomeArtistListSlotView_artist_name__RFLuB"> -->
<!--                                             <div class="MarqueeView_container__l4V1r"> -->
<!--                                                 <div class="MarqueeView_content__2Qs2H">Apink</div> -->
<!--                                             </div> -->
<!--                                         </strong></div> -->
<!--                                 </a> </div> -->
<!--                         </li> -->
<!--                         <li class="HomeArtistListSlotView_artist_item__a6gAX"> -->
<!--                             <div><a class="HomeArtistListSlotView_artist_link__Mjm6r" -->
<!--                                     href="/gidle/feed"> -->
<!--                                     <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"> -->
<!--                                         <img src="https://phinf.wevpstatic.net/MjAyNDA2MjNfMTg2/MDAxNzE5MTU0NzU2Njg4.qt5cNc7YIJsdggtrdBH_avkerRE2K4-bHplAkvmwDdIg.Zjj-kW3jBdaiurpe9fFeYPxL2BipE5f9q_J6Yr9Gf_Eg.JPEG/1c4e5de8-6eb4-457f-8c06-502c09785914.jpeg?type=f416_354" -->
<!--                                             width="208" height="177" -->
<!--                                             class="HomeArtistListSlotView_cover_img__a2krk" alt=""> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                                         <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                                             style="width: 43px; height: 43px;"> -->
<!--                                             <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"> -->
<!--                                                 <div -->
<!--                                                     style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"> -->
<!--                                         <strong class="HomeArtistListSlotView_artist_name__RFLuB"> -->
<!--                                             <div class="MarqueeView_container__l4V1r"> -->
<!--                                                 <div class="MarqueeView_content__2Qs2H">(G)I-DLE -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </strong></div> -->
<!--                                 </a> </div> -->
<!--                         </li> -->
<!--                         <li class="HomeArtistListSlotView_artist_item__a6gAX"> -->
<!--                             <div><a class="HomeArtistListSlotView_artist_link__Mjm6r" -->
<!--                                     href="/lightsum/feed"> -->
<!--                                     <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"> -->
<!--                                         <img src="https://phinf.wevpstatic.net/MjAyNDEwMTVfMTA4/MDAxNzI4OTczOTk5ODI4.nCWXZQmsWkIofIxnJldFAgSxENIPKMoCY6rmR16TzzIg.6e-CNlz365BgPk7tUonmlmmEVrFbDNc58QV8bbeHdskg.PNG/640125188200932442f125175-8798-432b-8079-9a4e9ccc17ef.png?type=f416_354" -->
<!--                                             width="208" height="177" -->
<!--                                             class="HomeArtistListSlotView_cover_img__a2krk" alt=""> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                                         <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                                             style="width: 43px; height: 43px;"> -->
<!--                                             <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"> -->
<!--                                                 <div -->
<!--                                                     style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"> -->
<!--                                         <strong class="HomeArtistListSlotView_artist_name__RFLuB"> -->
<!--                                             <div class="MarqueeView_container__l4V1r"> -->
<!--                                                 <div class="MarqueeView_content__2Qs2H">LIGHTSUM -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </strong></div> -->
<!--                                 </a> </div> -->
<!--                         </li> -->
<!--                         <li class="HomeArtistListSlotView_artist_item__a6gAX"> -->
<!--                             <div><a class="HomeArtistListSlotView_artist_link__Mjm6r" -->
<!--                                     href="/nctwish/feed"> -->
<!--                                     <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"> -->
<!--                                         <img src="https://phinf.wevpstatic.net/MjAyNDA5MjRfMTU0/MDAxNzI3MTY4MzQwODAz.inbxWmasfUxMZ6aK-CtXze5AY7GpGqCmjhBrrFjKMIIg.tRb51nQXrv-IPd9D1sraaYHnadDBh_93mVHX2T90H7Eg.JPEG/0b97f398-b833-4283-a1ba-7acaa3249370.jpeg?type=f416_354" -->
<!--                                             width="208" height="177" -->
<!--                                             class="HomeArtistListSlotView_cover_img__a2krk" alt=""> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                                         <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                                             style="width: 43px; height: 43px;"> -->
<!--                                             <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"> -->
<!--                                                 <div -->
<!--                                                     style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"> -->
<!--                                         <strong class="HomeArtistListSlotView_artist_name__RFLuB"> -->
<!--                                             <div class="MarqueeView_container__l4V1r"> -->
<!--                                                 <div class="MarqueeView_content__2Qs2H">NCT WISH -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </strong></div> -->
<!--                                 </a> </div> -->
<!--                         </li> -->
<!--                         <li class="HomeArtistListSlotView_artist_item__a6gAX"> -->
<!--                             <div><a class="HomeArtistListSlotView_artist_link__Mjm6r" -->
<!--                                     href="/atbo/feed"> -->
<!--                                     <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"> -->
<!--                                         <img src="https://phinf.wevpstatic.net/MjAyNDA1MTBfNyAg/MDAxNzE1MzIzMTU4ODUy.uiufXSMWyzU6hrPgVDJO_gllHORdDLDvf8U9TtN6AUsg.zNuC33YbXX1NXi0LrhX7Y5VQM-eUi8EAnzIBBnckP-wg.JPEG/40cd80b4-0d65-43a3-89f8-a2ed51ac740f.jpeg?type=f416_354" -->
<!--                                             width="208" height="177" -->
<!--                                             class="HomeArtistListSlotView_cover_img__a2krk" alt=""> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                                         <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                                             style="width: 43px; height: 43px;"> -->
<!--                                             <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"> -->
<!--                                                 <div -->
<!--                                                     style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"> -->
<!--                                         <strong class="HomeArtistListSlotView_artist_name__RFLuB"> -->
<!--                                             <div class="MarqueeView_container__l4V1r"> -->
<!--                                                 <div class="MarqueeView_content__2Qs2H">ATBO</div> -->
<!--                                             </div> -->
<!--                                         </strong></div> -->
<!--                                 </a> </div> -->
<!--                         </li> -->
<!--                         <li class="HomeArtistListSlotView_artist_item__a6gAX"> -->
<!--                             <div><a class="HomeArtistListSlotView_artist_link__Mjm6r" -->
<!--                                     href="/riize/feed"> -->
<!--                                     <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"> -->
<!--                                         <img src="https://phinf.wevpstatic.net/MjAyNDEwMTVfMjc0/MDAxNzI4OTc2MDQyNDIw.BCx0oviqEeHAivIycODYCfScHloZCHIiGDrE81xNWeMg.AniauJKY3r0DcCVrWBqgqH0aUfHp-Cj-yGdfcH92zTQg.PNG/2425932261864622f8373afe-0d95-41ae-8629-2be0d1aadfdc.png?type=f416_354" -->
<!--                                             width="208" height="177" -->
<!--                                             class="HomeArtistListSlotView_cover_img__a2krk" alt=""> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                                         <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                                             style="width: 43px; height: 43px;"> -->
<!--                                             <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"> -->
<!--                                                 <div -->
<!--                                                     style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"> -->
<!--                                         <strong class="HomeArtistListSlotView_artist_name__RFLuB"> -->
<!--                                             <div class="MarqueeView_container__l4V1r"> -->
<!--                                                 <div class="MarqueeView_content__2Qs2H">RIIZE</div> -->
<!--                                             </div> -->
<!--                                         </strong></div> -->
<!--                                 </a> </div> -->
<!--                         </li> -->
<!--                         <li class="HomeArtistListSlotView_artist_item__a6gAX"> -->
<!--                             <div><a class="HomeArtistListSlotView_artist_link__Mjm6r" -->
<!--                                     href="/lun8/feed"> -->
<!--                                     <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"> -->
<!--                                         <img src="https://phinf.wevpstatic.net/MjAyNDA3MzBfMjc4/MDAxNzIyMzM3MjgyMTY3._qEec9jzPxQzTZZakLVZE7T05lJtnBVeuUABM-C753Ug.IH8J9YZd7L6DTSEC8GlnoxWSaelQFjEItpiJGpKaTGgg.JPEG/f7c77665-1c9c-4446-96b6-4dfa655409be.jpeg?type=f416_354" -->
<!--                                             width="208" height="177" -->
<!--                                             class="HomeArtistListSlotView_cover_img__a2krk" alt=""> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                                         <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                                             style="width: 43px; height: 43px;"> -->
<!--                                             <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"> -->
<!--                                                 <div -->
<!--                                                     style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"> -->
<!--                                         <strong class="HomeArtistListSlotView_artist_name__RFLuB"> -->
<!--                                             <div class="MarqueeView_container__l4V1r"> -->
<!--                                                 <div class="MarqueeView_content__2Qs2H">LUN8</div> -->
<!--                                             </div> -->
<!--                                         </strong></div> -->
<!--                                 </a> </div> -->
<!--                         </li> -->
<!--                         <li class="HomeArtistListSlotView_artist_item__a6gAX"> -->
<!--                             <div><a class="HomeArtistListSlotView_artist_link__Mjm6r" -->
<!--                                     href="/tempest/feed"> -->
<!--                                     <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"> -->
<!--                                         <img src="https://phinf.wevpstatic.net/MjAyNDA4MDhfMjQ5/MDAxNzIzMTAzMjU5OTY0.uqa1c-EfCmS6mAcinP3YDd4gz9Ks6qpsqIaRq3uwFVog.j2YsrHi2F3neG4l0RgelszoxsuAbxlVEa91XVSX3tNcg.PNG/58150296919550998f7d84b2d-0bae-4121-b259-bdd8432e43a6.png?type=f416_354" -->
<!--                                             width="208" height="177" -->
<!--                                             class="HomeArtistListSlotView_cover_img__a2krk" alt=""> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                                         <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                                             style="width: 43px; height: 43px;"> -->
<!--                                             <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"> -->
<!--                                                 <div -->
<!--                                                     style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"> -->
<!--                                         <strong class="HomeArtistListSlotView_artist_name__RFLuB"> -->
<!--                                             <div class="MarqueeView_container__l4V1r"> -->
<!--                                                 <div class="MarqueeView_content__2Qs2H">TEMPEST -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </strong></div> -->
<!--                                 </a> </div> -->
<!--                         </li> -->
<!--                         <li class="HomeArtistListSlotView_artist_item__a6gAX"> -->
<!--                             <div><a class="HomeArtistListSlotView_artist_link__Mjm6r" -->
<!--                                     href="/syudou/feed"> -->
<!--                                     <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"> -->
<!--                                         <img src="https://phinf.wevpstatic.net/MjAyNDAzMjFfMjg2/MDAxNzExMDA3MjIwNDM2.C51Xqk_-K1N-44rLvnk1kV6a9Udm4ss0vPCCwHmONN8g.ifoxuMZcBQtQ-zP1FN0AGcDjQt7xHGfx9spi0ze0NLgg.PNG/44688218401714915c47c8dfa-cf28-48c3-904f-7016c6b90125.png?type=f416_354" -->
<!--                                             width="208" height="177" -->
<!--                                             class="HomeArtistListSlotView_cover_img__a2krk" alt=""> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"> -->
<!--                                         <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" -->
<!--                                             style="width: 43px; height: 43px;"> -->
<!--                                             <div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"> -->
<!--                                                 <div -->
<!--                                                     style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"> -->
<!--                                         <strong class="HomeArtistListSlotView_artist_name__RFLuB"> -->
<!--                                             <div class="MarqueeView_container__l4V1r"> -->
<!--                                                 <div class="MarqueeView_content__2Qs2H">syudou</div> -->
<!--                                             </div> -->
<!--                                         </strong></div> -->
<!--                                 </a> </div> -->
<!--                         </li> -->

<!--                         			<div class="container"> -->
<!--                         				<div class="row gy-4"> -->

<!--                         					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="100"> -->
<!--                         						<div class="team-member d-flex align-items-start"> -->
<!--                         							<div class="pic"> -->
<!--                         								<img src="assets/img/team/team-1.jpg" class="img-fluid" alt=""> -->
<!--                         							</div> -->
<!--                         							<div class="member-info"> -->
<!--                         								<h4>Walter White</h4> -->
<!--                         								<span>Chief Executive Officer</span> -->
<!--                         								<p>Explicabo voluptatem mollitia et repellat qui dolorum -->
<!--                         									quasi</p> -->
<!--                         								<div class="social"> -->
<!--                         									<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i -->
<!--                         										class="bi bi-facebook"></i></a> <a href=""><i -->
<!--                         										class="bi bi-instagram"></i></a> <a href=""> <i -->
<!--                         										class="bi bi-linkedin"></i> -->
<!--                         									</a> -->
<!--                         								</div> -->
<!--                         							</div> -->
<!--                         						</div> -->
<!--                         					</div> -->
<!--                         					End Team Member -->

<!--                         					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="200"> -->
<!--                         						<div class="team-member d-flex align-items-start"> -->
<!--                         							<div class="pic"> -->
<!--                         								<img src="assets/img/team/team-2.jpg" class="img-fluid" alt=""> -->
<!--                         							</div> -->
<!--                         							<div class="member-info"> -->
<!--                         								<h4>Sarah Jhonson</h4> -->
<!--                         								<span>Product Manager</span> -->
<!--                         								<p>Aut maiores voluptates amet et quis praesentium qui senda -->
<!--                         									para</p> -->
<!--                         								<div class="social"> -->
<!--                         									<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i -->
<!--                         										class="bi bi-facebook"></i></a> <a href=""><i -->
<!--                         										class="bi bi-instagram"></i></a> <a href=""> <i -->
<!--                         										class="bi bi-linkedin"></i> -->
<!--                         									</a> -->
<!--                         								</div> -->
<!--                         							</div> -->
<!--                         						</div> -->
<!--                         					</div> -->
<!--                         					End Team Member -->

<!--                         					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="300"> -->
<!--                         						<div class="team-member d-flex align-items-start"> -->
<!--                         							<div class="pic"> -->
<!--                         								<img src="assets/img/team/team-3.jpg" class="img-fluid" alt=""> -->
<!--                         							</div> -->
<!--                         							<div class="member-info"> -->
<!--                         								<h4>William Anderson</h4> -->
<!--                         								<span>CTO</span> -->
<!--                         								<p>Quisquam facilis cum velit laborum corrupti fuga rerum -->
<!--                         									quia</p> -->
<!--                         								<div class="social"> -->
<!--                         									<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i -->
<!--                         										class="bi bi-facebook"></i></a> <a href=""><i -->
<!--                         										class="bi bi-instagram"></i></a> <a href=""> <i -->
<!--                         										class="bi bi-linkedin"></i> -->
<!--                         									</a> -->
<!--                         								</div> -->
<!--                         							</div> -->
<!--                         						</div> -->
<!--                         					</div> -->
<!--                         					End Team Member -->

<!--                         					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="400"> -->
<!--                         						<div class="team-member d-flex align-items-start"> -->
<!--                         							<div class="pic"> -->
<!--                         								<img src="assets/img/team/team-4.jpg" class="img-fluid" alt=""> -->
<!--                         							</div> -->
<!--                         							<div class="member-info"> -->
<!--                         								<h4>Amanda Jepson</h4> -->
<!--                         								<span>Accountant</span> -->
<!--                         								<p>Dolorum tempora officiis odit laborum officiis et et -->
<!--                         									accusamus</p> -->
<!--                         								<div class="social"> -->
<!--                         									<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i -->
<!--                         										class="bi bi-facebook"></i></a> <a href=""><i -->
<!--                         										class="bi bi-instagram"></i></a> <a href=""> <i -->
<!--                         										class="bi bi-linkedin"></i> -->
<!--                         									</a> -->
<!--                         								</div> -->
<!--                         							</div> -->
<!--                         						</div> -->
<!--                         					</div> -->
<!--                         End Team Member -->

<!--                 </div> -->

<!--             </div> -->
<!--         </div> -->

        </section>
        <!-- /Team Section -->
<!-- 모달 팝업
<div id="surveyOverlay"></div>
<div id="surveyModal">
    <img src="https://via.placeholder.com/400x200?text=설문조사+이미지" alt="설문조사 이미지">
    <h3>내가 가장 선호하는 디지털 멤버십 혜택은?</h3>
    <p>설문조사에 참여하고 100 젤리 받아가세요!</p>
        <button class="btn-primary"  id="surveyParticipate" onclick="openInNewWindow('http://localhost/SurveyForm?srvyNo=28')">설문조사 참여하기</button>
    <button class="btn-secondary" id="surveyDontShow">하루 보지 않기</button>
    <button class="btn-close" id="surveyClose">닫기</button>
</div>
-->

	<div id="surveyOverlay" class="ReactModal__Overlay ReactModal__Overlay--after-open BaseModalView_modal_overlay__ap5fH BaseModalView_modal_overlay_bg_default__tT-Fd" style="z-index: 20000;">
	<div id="surveyModal" class="ReactModal__Content ReactModal__Content--after-open BaseModalView_modal__wjtT1" tabindex="-1" role="dialog" aria-label="modal" aria-modal="true">
	<div class="BaseModalViewContent BaseModalView_content__ipny1 BaseModalView_-image_promotion__15Im3 BaseModalView_-transparent_bg__53rxD BaseModalView_-has_bottom_button__M2n9q" style="width: 450px; border-radius: 14px;">
	<div class="ImagePromotionModalView_container__X08Wo">
	<div style="aspect-ratio: auto 450 / 686; content-visibility: auto; contain-intrinsic-size: 450px 686px;">
	<img src="/resources/upload/2025/01/31/c8818b0e-cc01-4b32-9b5e-5f07cee9d69c_surveyEvent.jpg?type=w900" class="ImagePromotionModalView_image__kuOLl" width="450" height="686" alt="promotion">
	</div>
	</div>
	<div class="ImagePromotionModalView_button_wrap__FJXhW">
	<button type="button" id="surveyParticipate" class="ImagePromotionModalView_button__FwnP8" onclick="openInNewWindow('/SurveyForm?srvyNo=34')" style="background-color: rgb(0, 203, 213);">
	<span class="ImagePromotionModalView_button_text__jdIjt" style="color: rgb(0, 0, 0);">설문조사 참여하기</span></button></div></div>
	<div class="BaseModalView_button_container__IHoFw">
	<div class="BaseModalView_button_wrap__sIIXN">
	<button type="button" id="surveyDontShow" class="BaseModalView_bottom_button__XNhOi">오늘 하루 보지 않기</button></div>
	<div class="BaseModalView_button_wrap__sIIXN"><button type="button" id="surveyClose" class="BaseModalView_bottom_button__XNhOi">닫기</button></div></div></div></div>
<!-- 	</div> -->


        <!-- Contact Section -->
        <!-- 		<section id="contact" class="contact section"> -->

        <!-- 			<!-- Section Title -->
        <!-- 			<div class="container section-title" data-aos="fade-up"> -->
        <!-- 				<h2>Contact</h2> -->
        <!-- 				<p>Necessitatibus eius consequatur ex aliquid fuga eum quidem -->
        <!-- 					sint consectetur velit</p> -->
        <!-- 			</div> -->
        <!-- 			<!-- End Section Title -->

        <!-- 			<div class="container" data-aos="fade-up" data-aos-delay="100"> -->

        <!-- 				<div class="row gy-4"> -->

        <!-- 					<div class="col-lg-5"> -->

        <!-- 						<div class="info-wrap"> -->
        <!-- 							<div class="info-item d-flex" data-aos="fade-up" -->
        <!-- 								data-aos-delay="200"> -->
        <!-- 								<i class="bi bi-geo-alt flex-shrink-0"></i> -->
        <!-- 								<div> -->
        <!-- 									<h3>Address</h3> -->
        <!-- 									<p>A108 Adam Street, New York, NY 535022</p> -->
        <!-- 								</div> -->
        <!-- 							</div> -->
        <!-- 							End Info Item -->

        <!-- 							<div class="info-item d-flex" data-aos="fade-up" -->
        <!-- 								data-aos-delay="300"> -->
        <!-- 								<i class="bi bi-telephone flex-shrink-0"></i> -->
        <!-- 								<div> -->
        <!-- 									<h3>Call Us</h3> -->
        <!-- 									<p>+1 5589 55488 55</p> -->
        <!-- 								</div> -->
        <!-- 							</div> -->
        <!-- 							End Info Item -->

        <!-- 							<div class="info-item d-flex" data-aos="fade-up" -->
        <!-- 								data-aos-delay="400"> -->
        <!-- 								<i class="bi bi-envelope flex-shrink-0"></i> -->
        <!-- 								<div> -->
        <!-- 									<h3>Email Us</h3> -->
        <!-- 									<p>info@example.com</p> -->
        <!-- 								</div> -->
        <!-- 							</div> -->
        <!-- End Info Item -->

        <!-- 							<iframe -->
        <!-- 								src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d48389.78314118045!2d-74.006138!3d40.710059!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a22a3bda30d%3A0xb89d1fe6bc499443!2sDowntown%20Conference%20Center!5e0!3m2!1sen!2sus!4v1676961268712!5m2!1sen!2sus" -->
        <!-- 								frameborder="0" style="border: 0; width: 100%; height: 270px;" -->
        <!-- 								allowfullscreen="" loading="lazy" -->
        <!-- 								referrerpolicy="no-referrer-when-downgrade"></iframe> -->
        <!-- 						</div> -->
        <!-- 					</div> -->

        <!-- 					<div class="col-lg-7"> -->
        <!-- 						<form action="forms/contact.php" method="post" -->
        <!-- 							class="php-email-form" data-aos="fade-up" data-aos-delay="200"> -->
        <!-- 							<div class="row gy-4"> -->

        <!-- 								<div class="col-md-6"> -->
        <!-- 									<label for="name-field" class="pb-2">Your Name</label> <input -->
        <!-- 										type="text" name="name" id="name-field" class="form-control" -->
        <!-- 										required=""> -->
        <!-- 								</div> -->

        <!-- 								<div class="col-md-6"> -->
        <!-- 									<label for="email-field" class="pb-2">Your Email</label> <input -->
        <!-- 										type="email" class="form-control" name="email" -->
        <!-- 										id="email-field" required=""> -->
        <!-- 								</div> -->

        <!-- 								<div class="col-md-12"> -->
        <!-- 									<label for="subject-field" class="pb-2">Subject</label> <input -->
        <!-- 										type="text" class="form-control" name="subject" -->
        <!-- 										id="subject-field" required=""> -->
        <!-- 								</div> -->

        <!-- 								<div class="col-md-12"> -->
        <!-- 									<label for="message-field" class="pb-2">Message</label> -->
        <!-- 									<textarea class="form-control" name="message" rows="10" -->
        <!-- 										id="message-field" required=""></textarea> -->
        <!-- 								</div> -->

        <!-- 								<div class="col-md-12 text-center"> -->
        <!-- 									<div class="loading">Loading</div> -->
        <!-- 									<div class="error-message"></div> -->
        <!-- 									<div class="sent-message">Your message has been sent. -->
        <!-- 										Thank you!</div> -->

        <!-- 									<button type="submit">Send Message</button> -->
        <!-- 								</div> -->

        <!-- 							</div> -->
        <!-- 						</form> -->
        <!-- 					</div> -->
        <!-- 					End Contact Form -->

        <!-- 				</div> -->

        <!-- 			</div> -->

        <!-- 		</section> -->
        <!-- /Contact Section -->
        <script>
            let uurl = `${currentUri}`;
            console.log("currentUri : ", uurl);
        </script>
<script>
    // 전역에서 openInNewWindow 함수 정의
    function openInNewWindow(url) {
        let newWindow = window.open(url, "surveyPopup", "width=600,height=800,scrollbars=yes");

        //버튼 클릭 후 1초 뒤에 모달 닫기 (팝업 차단 여부와 상관없이 실행)
        setTimeout(closeSurveyModal, 1000);

        // 팝업 차단 감지 (선택 사항)
        if (!newWindow) {
            alert("팝업이 차단되었습니다. 팝업 차단을 해제해주세요.");
        }
    }

    document.addEventListener("DOMContentLoaded", function() {
        // 로그인 여부 확인 (서버에서 loginUser가 있는지 확인)
        var isLoggedIn = "${loginUser}" !== "";

        // 로그인한 경우에만 팝업 표시 + "하루 보지 않기" 안 눌렀을 때만 표시
        if (isLoggedIn && !document.cookie.includes("surveyPopup=hidden")) {
            document.getElementById("surveyModal").style.display = "block";
            document.getElementById("surveyOverlay").style.display = "block";
        }

        // 하루 보지 않기 버튼
        document.getElementById("surveyDontShow").addEventListener("click", function() {
            document.cookie = "surveyPopup=hidden; path=/; max-age=86400"; // 1일 동안 유지
            closeSurveyModal();
        });

        // 닫기 버튼
        document.getElementById("surveyClose").addEventListener("click", function() {
            closeSurveyModal();
        });

        document.getElementById("surveyParticipate").addEventListener("click", function() {
            closeSurveyModal();
        });

        // 모달 닫기 함수
        function closeSurveyModal() {
            document.getElementById("surveyModal").style.display = "none";
            document.getElementById("surveyOverlay").style.display = "none";
        }
    });
</script>

        <!-- footer 이사감 -->
        <jsp:include page="../include/footer_user.jsp"></jsp:include>
        <!-- footer 이사감 -->