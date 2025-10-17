<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            display: none; /* 기본적으로 숨김 처리 */
        }
        li, ol, ul {
  list-style: none;
}
      li {
  display: list-item;
  text-align: -webkit-match-parent;
  unicode-bidi: isolate;
  padding: 7px;
}  
.flicking-camera {
	gap:16px;
  display: flex;
  flex-direction: row;
  height: 100%;
  position: relative;
  width: 100%;
  will-change: transform;
  z-index: 1;
}
    </style>
</head>
<body>

    <iframe class="video-iframe" id="img_w20220211cc477db2cd9a9" src="https://www.youtube.com/embed/ft70sAYrFyY?loop=1&amp;rel=0&amp;playlist=ft70sAYrFyY&amp;showinfo=0&amp;controls=0&amp;mute=1&amp;autoplay=1&amp;enablejsapi=1&amp;origin=https%3A%2F%2Fantenna.co.kr&amp;widgetid=1" frameborder="0" allowfullscreen title="NewJeans (뉴진스) 'Bubble Gum' Official MV"></iframe>
    
    <iframe class="video-iframe" id="img_w20220211cc477db2cd9b0" src="https://www.youtube.com/embed/ekr2nIex040?loop=1&amp;rel=0&amp;playlist=ekr2nIex040&amp;showinfo=0&amp;controls=0&amp;mute=1&amp;autoplay=1&amp;enablejsapi=1&amp;origin=https%3A%2F%2Fantenna.co.kr&amp;widgetid=2" frameborder="0" allowfullscreen title="ROSÉ &amp; Bruno Mars - APT. (Official Music Video)"></iframe>

    <iframe class="video-iframe" id="img_aespa_whiplash" src="https://www.youtube.com/embed/jWQx2f-CErU?loop=1&amp;rel=0&amp;playlist=jWQx2f-CErU&amp;showinfo=0&amp;controls=0&amp;mute=1&amp;autoplay=1&amp;enablejsapi=1&amp;origin=https%3A%2F%2Fantenna.co.kr&amp;widgetid=3" frameborder="0" allowfullscreen title="aespa 에스파 'Whiplash' MV"></iframe>

    <iframe class="video-iframe" id="img_gdragon_power" src="https://www.youtube.com/embed/NMjhjrBIrG8?loop=1&amp;rel=0&amp;playlist=NMjhjrBIrG8&amp;showinfo=0&amp;controls=0&amp;mute=1&amp;autoplay=1&amp;enablejsapi=1&amp;origin=https%3A%2F%2Fantenna.co.kr&amp;widgetid=4" frameborder="0" allowfullscreen title="G-DRAGON - POWER (Official Video)"></iframe>
    
    <iframe class="video-iframe" id="img_seventeen_fighting" src="https://www.youtube.com/embed/mBXBOLG06Wc?loop=1&amp;rel=0&amp;playlist=mBXBOLG06Wc&amp;showinfo=0&amp;controls=0&amp;mute=1&amp;autoplay=1&amp;enablejsapi=1&amp;origin=https%3A%2F%2Fantenna.co.kr&amp;widgetid=5" frameborder="0" allowfullscreen title="부석순 (SEVENTEEN) '파이팅 해야지 (Feat. 이영지)' Official MV"></iframe>


    <script>
        // iframe 요소를 배열로 가져옵니다.
        const videos = document.querySelectorAll('.video-iframe');
        
        // 영상 인덱스 배열을 만듭니다.
        const videoIndices = [0, 1, 2, 3, 4];
        
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
        text-align: center; /* 컨텐츠 중앙 정렬 */
        position: relative; /* 위치 설정 */
        right: 20px; /* 컨텐츠를 오른쪽으로 이동
    }


    /* Home Artist List Styles */
.HomeArtistListSlotView_artist_list__3fPzz {
    display: flex;
    flex-wrap: wrap; /* 한 줄에 공간 부족 시 다음 줄로 넘어감 */
    gap: 16px; /* 아이템 간 간격 */
    justify-content: center; /* 아이템 중앙 정렬 */
}
.HomeArtistListSlotView_artist_item__a6gAX {
    flex: 0 0 calc(25% - 12px); /* 한 줄에 4개 배치 */
    background-color: white;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
    transition: transform 0.2s;
    text-align: center; /* 아이템 내부 컨텐츠 중앙 정렬 */
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
    justify-content: flex-start; /* 좌측 정렬 */
}
.HomeArtistListSlotView_artist_item__a6gAX:nth-child(1):only-child {
    flex: 0 0 calc(25% - 12px); /* 4개 중 하나 크기로 고정 */
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
        flex: 0 0 calc(50% - 16px); /* 작은 화면에서 한 줄에 2개 */
    }
    .HomeArtistListSlotView_artist_item__a6gAX:nth-child(1):only-child {
        flex: 0 0 calc(50% - 16px); /* 작은 화면에서도 크기 고정 */
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
    width: calc(25% - 50px) ;
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

			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
    <br><br>
    <h2>나의 커뮤니티</h2>
    <ul class="HomeArtistListSlotView_artist_list__3fPzz">
        <c:forEach var="groupsVO" items="${groupsVOList}" varStatus="stat">
            <li class="HomeArtistListSlotView_artist_item__a6gAX">
                <a class="HomeArtistListSlotView_artist_link__Mjm6r" href="${groupsVO.groupNo}/feed">
                    <div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP">
                        <img 
                            src="<c:choose>
                                    <c:when test='${groupsVO.groupName == "BTS"}'>
                                        https://phinf.wevpstatic.net/MjAyMzA2MDlfMjA5/MDAxNjg2MjgyOTI4MjM4.uzwN0D1RUzZ7zjv451iLx3k58NbU5tuNGQcNriaLGMog.8BqToW1rnUi10zbpxcvjow74zOJ8mUCJ49z2yGQVaEMg.PNG/8799005373953432ff510aa1-b04b-40f8-8b6d-1e7883e7a481.png?type=f416_354
                                    </c:when>
                                    <c:otherwise>
                                        https://phinf.wevpstatic.net/MjAyNDA2MjFfMTAw/MDAxNzE4OTQyOTI4OTU4.W737ocCc1HzjedvouBaoxegRatIW-bHyg1bGqRP9bX0g.4DAmqlmO8eyPRUPHradG-1BC_IPprQnfy7yw1R-3Cjog.JPEG/470a163f-20ca-4168-ba77-e3c09acd7bf1.jpeg?type=f416_354
                                    </c:otherwise>
                                </c:choose>" 
                            width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt="Artist Cover">
                    </div>
                    <div class="HomeArtistListSlotView_artist_thumb_wrap__du30B">
                        <div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;">
                            <c:choose>
                                <c:when test="${groupsVO.groupName == 'BTS'}">
                                    <img src="https://phinf.wevpstatic.net/MjAyMzA1MzBfMTkg/MDAxNjg1NDU3ODk5MDE0.FKKdn9RYRUJ25lqMga8pdd42p1Pb335WN9Rgr47uqVcg.LbmfkK-VlDQRN0rKZjuHZuzPZxX78tQr4PvCCef0CGog.JPEG/f6902dd4-b005-466b-921b-5d51aeff4ab5.jpeg?type=s86" 
                                        class="ProfileThumbnailView_thumbnail__8W3E7" width="43" height="43" alt="샘플그룹2 Thumbnail">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://phinf.wevpstatic.net/MjAyNDA2MjFfMTEx/MDAxNzE4OTQxOTc3OTI1.g7jmV_cjMXMpusiBe8ED3FZ88lRxOlNPZZsloeI5hn0g.2D4UR-KoD4E8RTEOleCPSfkm-Lg8Wo3AbFBF78Ze5T8g.JPEG/27be858c-c09f-495d-9119-340ac801489f.jpeg?type=s86" class="ProfileThumbnailView_thumbnail__8W3E7" width="43" height="43" alt="">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
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
<%--         <c:forEach var="groupsVO" items="${groupsVOList}" varStatus="stat"> --%>
<!--             <h1> -->
<%--                 <a href="${groupsVO.groupNo}/feed">${groupsVO.groupName}</a><br> --%>
<!--             </h1> -->
<%--         </c:forEach> --%>
<!--     </div> -->
<!-- </div> -->








		<!-- Portfolio Section -->
<!-- 		<section id="portfolio" class="portfolio section"> -->

			<!-- Section Title -->
<!-- 			<div class="container section-title" data-aos="fade-up"> -->
<!-- 				<h2>굿즈(테스트4)</h2> -->
<!-- 			</div> -->
			<!-- End Section Title -->

			<div class="container">
			<div class="HomeComponentView_component_area__nBJJk HomeComponentView_-merch__g7KSQ">
  <div class="HomeComponentView_inner__+jTrx">
    <h2 class="HomeComponentView_title__wTRwM">Merch</h2>
    <div class="HomeComponentView_component__oey5Q">
      <div class="HomeMerchView_container__riz0P">
        <div class="HomeMerchView_tab_list__igmXw" role="tablist">
          <button type="button" role="tab" aria-selected="true" class="HomeMerchView_tab_item__msTtD">전체</button>
          <button type="button" role="tab" aria-selected="false" class="HomeMerchView_tab_item__msTtD">NewJeans</button>
          <button type="button" role="tab" aria-selected="false" class="HomeMerchView_tab_item__msTtD">BTS</button>
        </div>
      </div>
      <div class="HomeMerchView_flicking_wrap__7yUEK" role="tabpanel">
        <div class="flicking-viewport HomeMerchView_list__rnjxo" style="user-select: none; -webkit-user-drag: none; touch-action: pan-y; display: flex; flex-wrap: wrap;">
          <ul class="flicking-camera product-list">
            <!-- 상품 항목들 -->
            <li class="product-item">
              <div role="button" tabindex="0" class="DivAsButtonView_div_as_button__jl7Xf PcWeverseShopArrivalItemView_arrival__brlxG PcWeverseShopArrivalItemView_-home__9Ox4o">
                <div class="PcWeverseShopArrivalItemView_image_wrapper__68vpb">
                  <img class="PcWeverseShopArrivalItemView_image__Kt6Sl" src="https://cdn-contents.weverseshop.io/public/shop/ecaeb8ed5ea7d4c0595005207183ee5b.jpg" alt="" loading="lazy">
                </div>
                <em class="PcWeverseShopArrivalItemView_product__gnn7H product-title">LE SSERAFIM 2025 SEASON'S GREETINGS</em>
                <div class="PcWeverseShopArrivalItemView_price_wrapper__05mXU">
                  <strong class="PcWeverseShopArrivalItemView_price__nQrit product-price">₩45,000</strong>
                </div>
              </div>
            </li>
            <li class="product-item">
              <div role="button" tabindex="0" class="DivAsButtonView_div_as_button__jl7Xf PcWeverseShopArrivalItemView_arrival__brlxG PcWeverseShopArrivalItemView_-home__9Ox4o">
                <div class="PcWeverseShopArrivalItemView_image_wrapper__68vpb">
                  <img class="PcWeverseShopArrivalItemView_image__Kt6Sl" src="https://cdn-contents.weverseshop.io/public/shop/ac5a8cd835c9c0f1dde14f3d74e5e197.png" alt="" loading="lazy">
                </div>
                <div class="PcWeverseShopArrivalItemView_label_wrapper__9vTcb">
                  <span class="PcWeverseShopArrivalItemView_label__FlsbE PcWeverseShopArrivalItemView_-only__FAIUl">Only</span>
                  <span class="PcWeverseShopArrivalItemView_label__FlsbE PcWeverseShopArrivalItemView_-exclusive__c-T6F">단독판매</span>
                </div>
                <em class="PcWeverseShopArrivalItemView_product__gnn7H product-title">GLLIT WELCOME GIFT</em>
                <div class="PcWeverseShopArrivalItemView_price_wrapper__05mXU">
                  <strong class="PcWeverseShopArrivalItemView_price__nQrit product-price">₩0</strong>
                </div>
              </div>
            </li>
            <li class="product-item">
              <div role="button" tabindex="0" class="DivAsButtonView_div_as_button__jl7Xf PcWeverseShopArrivalItemView_arrival__brlxG PcWeverseShopArrivalItemView_-home__9Ox4o">
                <div class="PcWeverseShopArrivalItemView_image_wrapper__68vpb">
                  <img class="PcWeverseShopArrivalItemView_image__Kt6Sl" src="https://cdn-contents.weverseshop.io/public/shop/68b43823716a52272e25fbc9706d26e7.png" alt="" loading="lazy">
                </div>
                <div class="PcWeverseShopArrivalItemView_label_wrapper__9vTcb">
                  <span class="PcWeverseShopArrivalItemView_label__FlsbE PcWeverseShopArrivalItemView_-exclusive__c-T6F">단독판매</span>
                </div>
                <em class="PcWeverseShopArrivalItemView_product__gnn7H product-title">Official Light Stick</em>
                <div class="PcWeverseShopArrivalItemView_price_wrapper__05mXU">
                  <strong class="PcWeverseShopArrivalItemView_price__nQrit product-price">₩49,000</strong>
                </div>
              </div>
            </li>
            <li class="product-item">
              <div role="button" tabindex="0" class="DivAsButtonView_div_as_button__jl7Xf PcWeverseShopArrivalItemView_arrival__brlxG PcWeverseShopArrivalItemView_-home__9Ox4o">
                <div class="PcWeverseShopArrivalItemView_image_wrapper__68vpb">
                  <img class="PcWeverseShopArrivalItemView_image__Kt6Sl" src="https://cdn-contents.weverseshop.io/public/shop/f478d6863adbccb96b6043aa7b47a8ef.png" alt="" loading="lazy">
                </div>
                <em class="PcWeverseShopArrivalItemView_product__gnn7H product-title">2nd Mini Album 'I'LL LIKE YOU' (Weverse Albums ver.)</em>
                <div class="PcWeverseShopArrivalItemView_price_wrapper__05mXU">
                  <strong class="PcWeverseShopArrivalItemView_price__nQrit product-price">₩11,100</strong>
                </div>
              </div>
            </li>
            <!-- 추가 상품들... -->
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>





<!-- 				<div class="isotope-layout" data-default-filter="*" -->
<!-- 					data-layout="masonry" data-sort="original-order"> -->

<!-- 					<ul class="portfolio-filters isotope-filters" data-aos="fade-up" -->
<!-- 						data-aos-delay="100"> -->
<!-- 						<li data-filter="*" class="filter-active">전체</li> -->
<!-- 						<li data-filter=".filter-app">라이즈</li> -->
<!-- 						<li data-filter=".filter-product">르세라핌</li> -->
<!-- 						<li data-filter=".filter-branding">데이식스</li> -->
<!-- 					</ul> -->
<!-- 					End Portfolio Filters -->

<!-- 					<div class="row gy-4 isotope-container" data-aos="fade-up" -->
<!-- 						data-aos-delay="200"> -->

<!-- 						<div -->
<!-- 							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app"> -->
<!-- 							<img src="assets/img/masonry-portfolio/masonry-portfolio-1.jpg" -->
<!-- 								class="img-fluid" alt=""> -->
<!-- 							<div class="portfolio-info"> -->
<!-- 								<h4>App 1</h4> -->
<!-- 								<p>Lorem ipsum, dolor sit</p> -->
<!-- 								<a href="assets/img/masonry-portfolio/masonry-portfolio-1.jpg" -->
<!-- 									title="App 1" data-gallery="portfolio-gallery-app" -->
<!-- 									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a> -->
<!-- 								<a href="portfolio-details.html" title="More Details" -->
<!-- 									class="details-link"><i class="bi bi-link-45deg"></i></a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						End Portfolio Item -->

<!-- 						<div -->
<!-- 							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product"> -->
<!-- 							<img src="assets/img/masonry-portfolio/masonry-portfolio-2.jpg" -->
<!-- 								class="img-fluid" alt=""> -->
<!-- 							<div class="portfolio-info"> -->
<!-- 								<h4>Product 1</h4> -->
<!-- 								<p>Lorem ipsum, dolor sit</p> -->
<!-- 								<a href="assets/img/masonry-portfolio/masonry-portfolio-2.jpg" -->
<!-- 									title="Product 1" data-gallery="portfolio-gallery-product" -->
<!-- 									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a> -->
<!-- 								<a href="portfolio-details.html" title="More Details" -->
<!-- 									class="details-link"><i class="bi bi-link-45deg"></i></a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						End Portfolio Item -->

<!-- 						<div -->
<!-- 							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding"> -->
<!-- 							<img src="assets/img/masonry-portfolio/masonry-portfolio-3.jpg" -->
<!-- 								class="img-fluid" alt=""> -->
<!-- 							<div class="portfolio-info"> -->
<!-- 								<h4>Branding 1</h4> -->
<!-- 								<p>Lorem ipsum, dolor sit</p> -->
<!-- 								<a href="assets/img/masonry-portfolio/masonry-portfolio-3.jpg" -->
<!-- 									title="Branding 1" data-gallery="portfolio-gallery-branding" -->
<!-- 									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a> -->
<!-- 								<a href="portfolio-details.html" title="More Details" -->
<!-- 									class="details-link"><i class="bi bi-link-45deg"></i></a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						End Portfolio Item -->

<!-- 						<div -->
<!-- 							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app"> -->
<!-- 							<img src="assets/img/masonry-portfolio/masonry-portfolio-4.jpg" -->
<!-- 								class="img-fluid" alt=""> -->
<!-- 							<div class="portfolio-info"> -->
<!-- 								<h4>App 2</h4> -->
<!-- 								<p>Lorem ipsum, dolor sit</p> -->
<!-- 								<a href="assets/img/masonry-portfolio/masonry-portfolio-4.jpg" -->
<!-- 									title="App 2" data-gallery="portfolio-gallery-app" -->
<!-- 									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a> -->
<!-- 								<a href="portfolio-details.html" title="More Details" -->
<!-- 									class="details-link"><i class="bi bi-link-45deg"></i></a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						End Portfolio Item -->

<!-- 						<div -->
<!-- 							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product"> -->
<!-- 							<img src="assets/img/masonry-portfolio/masonry-portfolio-5.jpg" -->
<!-- 								class="img-fluid" alt=""> -->
<!-- 							<div class="portfolio-info"> -->
<!-- 								<h4>Product 2</h4> -->
<!-- 								<p>Lorem ipsum, dolor sit</p> -->
<!-- 								<a href="assets/img/masonry-portfolio/masonry-portfolio-5.jpg" -->
<!-- 									title="Product 2" data-gallery="portfolio-gallery-product" -->
<!-- 									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a> -->
<!-- 								<a href="portfolio-details.html" title="More Details" -->
<!-- 									class="details-link"><i class="bi bi-link-45deg"></i></a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						End Portfolio Item -->

<!-- 						<div -->
<!-- 							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding"> -->
<!-- 							<img src="assets/img/masonry-portfolio/masonry-portfolio-6.jpg" -->
<!-- 								class="img-fluid" alt=""> -->
<!-- 							<div class="portfolio-info"> -->
<!-- 								<h4>Branding 2</h4> -->
<!-- 								<p>Lorem ipsum, dolor sit</p> -->
<!-- 								<a href="assets/img/masonry-portfolio/masonry-portfolio-6.jpg" -->
<!-- 									title="Branding 2" data-gallery="portfolio-gallery-branding" -->
<!-- 									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a> -->
<!-- 								<a href="portfolio-details.html" title="More Details" -->
<!-- 									class="details-link"><i class="bi bi-link-45deg"></i></a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						End Portfolio Item -->

<!-- 						<div -->
<!-- 							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app"> -->
<!-- 							<img src="assets/img/masonry-portfolio/masonry-portfolio-7.jpg" -->
<!-- 								class="img-fluid" alt=""> -->
<!-- 							<div class="portfolio-info"> -->
<!-- 								<h4>App 3</h4> -->
<!-- 								<p>Lorem ipsum, dolor sit</p> -->
<!-- 								<a href="assets/img/masonry-portfolio/masonry-portfolio-7.jpg" -->
<!-- 									title="App 3" data-gallery="portfolio-gallery-app" -->
<!-- 									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a> -->
<!-- 								<a href="portfolio-details.html" title="More Details" -->
<!-- 									class="details-link"><i class="bi bi-link-45deg"></i></a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						End Portfolio Item -->

<!-- 						<div -->
<!-- 							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product"> -->
<!-- 							<img src="assets/img/masonry-portfolio/masonry-portfolio-8.jpg" -->
<!-- 								class="img-fluid" alt=""> -->
<!-- 							<div class="portfolio-info"> -->
<!-- 								<h4>Product 3</h4> -->
<!-- 								<p>Lorem ipsum, dolor sit</p> -->
<!-- 								<a href="assets/img/masonry-portfolio/masonry-portfolio-8.jpg" -->
<!-- 									title="Product 3" data-gallery="portfolio-gallery-product" -->
<!-- 									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a> -->
<!-- 								<a href="portfolio-details.html" title="More Details" -->
<!-- 									class="details-link"><i class="bi bi-link-45deg"></i></a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						End Portfolio Item -->

<!-- 						<div -->
<!-- 							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding"> -->
<!-- 							<img src="assets/img/masonry-portfolio/masonry-portfolio-9.jpg" -->
<!-- 								class="img-fluid" alt=""> -->
<!-- 							<div class="portfolio-info"> -->
<!-- 								<h4>Branding 3</h4> -->
<!-- 								<p>Lorem ipsum, dolor sit</p> -->
<!-- 								<a href="assets/img/masonry-portfolio/masonry-portfolio-9.jpg" -->
<!-- 									title="Branding 2" data-gallery="portfolio-gallery-branding" -->
<!-- 									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a> -->
<!-- 								<a href="portfolio-details.html" title="More Details" -->
<!-- 									class="details-link"><i class="bi bi-link-45deg"></i></a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						End Portfolio Item -->

<!-- 					</div> -->
					<!-- End Portfolio Container -->

				</div>

			</div>

		</section>
		<!-- /Portfolio Section -->

		<!-- Team Section -->
<!-- 		<section id="team" class="team section"> -->
<!-- 		<div class="container"> -->
			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
				<h2>새로운 아티스트를 만나보세요!</h2>
			</div>
			<!-- End Section Title -->
			<div class="container">
			<div class="HomeComponentView_component__oey5Q"><div><ul class="HomeArtistListSlotView_artist_list__3fPzz"><li class="HomeArtistListSlotView_artist_item__a6gAX"><div><a class="HomeArtistListSlotView_artist_link__Mjm6r" href="/bigbang/feed"><div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img src="https://phinf.wevpstatic.net/MjAyMjExMjRfNjIg/MDAxNjY5MjU0MjkzNzMy.vbBBtEv6KkSsmVVsfHVN6iBOcSynDpK5EvCM4PPhA5Qg.wYPiQLm4dq-n_M6VUNJtUaRpxFJVBAvYUWAg_2Cz6gcg.PNG/513312278141071311944ca9f-1c16-4083-9b4f-3e102d837e4e.png?type=f416_354" width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt=""></div><div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"><div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"></div></div></div></div><div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong class="HomeArtistListSlotView_artist_name__RFLuB"><div class="MarqueeView_container__l4V1r"><div class="MarqueeView_content__2Qs2H">BIGBANG</div></div></strong></div></a> </div></li><li class="HomeArtistListSlotView_artist_item__a6gAX"><a class="HomeArtistListSlotView_artist_link__Mjm6r" href="/tws/feed"><div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img src="https://phinf.wevpstatic.net/MjAyNDExMTVfMjU5/MDAxNzMxNjc1NzUzMDAw.PASkkyDtQLsNogjkYL1Ez31SQUVxt32KFyP5p_4WExwg.t0xjqNhrrofEhs9UgvOU-2iKRri6-v_r-iRVB3GdjCog.JPEG/72d4b0da-d537-481f-804e-d44fdae55cd6.jpeg?type=f416_354" width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt=""></div><div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"><div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"></div></div></div></div><div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong class="HomeArtistListSlotView_artist_name__RFLuB"><div class="MarqueeView_container__l4V1r"><div class="MarqueeView_content__2Qs2H">TWS</div></div></strong></div></a></li><li class="HomeArtistListSlotView_artist_item__a6gAX"><a class="HomeArtistListSlotView_artist_link__Mjm6r" href="/babymonster/feed"><div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img src="https://phinf.wevpstatic.net/MjAyNDExMDFfMTk1/MDAxNzMwNDM0MDMzNjk5.OS-VillPnTC5Y59ykq-Upy1QwURZ50QIvODG03GZbcMg.WVg6zIbkWubivSpWmrwafKv0y5naMh4WX2AST0cOjbsg.PNG/b94de7aa-38a2-475e-ad0e-4eba716a2eb3.png?type=f416_354" width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt=""></div><div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"><div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"></div></div></div></div><div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong class="HomeArtistListSlotView_artist_name__RFLuB"><div class="MarqueeView_container__l4V1r"><div class="MarqueeView_content__2Qs2H">BABYMONSTER</div></div></strong></div></a></li><li class="HomeArtistListSlotView_artist_item__a6gAX"><a class="HomeArtistListSlotView_artist_link__Mjm6r" href="/newjeansofficial/feed"><div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img src="https://phinf.wevpstatic.net/MjAyNDA2MjFfMTAw/MDAxNzE4OTQyOTI4OTU4.W737ocCc1HzjedvouBaoxegRatIW-bHyg1bGqRP9bX0g.4DAmqlmO8eyPRUPHradG-1BC_IPprQnfy7yw1R-3Cjog.JPEG/470a163f-20ca-4168-ba77-e3c09acd7bf1.jpeg?type=f416_354" width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt=""></div><div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"><div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"></div></div></div></div><div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong class="HomeArtistListSlotView_artist_name__RFLuB"><div class="MarqueeView_container__l4V1r"><div class="MarqueeView_content__2Qs2H">NewJeans</div></div></strong></div></a></li><li class="HomeArtistListSlotView_artist_item__a6gAX"><a class="HomeArtistListSlotView_artist_link__Mjm6r" href="/saymyname/feed"><div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img src="https://phinf.wevpstatic.net/MjAyNDExMDVfMTMz/MDAxNzMwNzg3MTg5MjM3.CGkY-FGSobE7QDNQLQhhy8P-JQVEJIQJXyAghOt7_Gog.awV3WdS8pK38LCEQocBiFVu1TlmoRrVR5Fy9ZRKLEu8g.PNG/327607851795022446b4b0fcf-2432-4c99-8ead-6554373e6f94.png?type=f416_354" width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt=""></div><div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"><div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"></div></div></div></div><div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong class="HomeArtistListSlotView_artist_name__RFLuB"><div class="MarqueeView_container__l4V1r"><div class="MarqueeView_content__2Qs2H">SAY MY NAME</div></div></strong></div></a></li><li class="HomeArtistListSlotView_artist_item__a6gAX"><div><a class="HomeArtistListSlotView_artist_link__Mjm6r" href="/nowadays/feed"><div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img src="https://phinf.wevpstatic.net/MjAyNDExMTNfMTU2/MDAxNzMxNDc0NzAzMTU3.yDpzb9yBTq5n4GChsdEqLvIdFe2i-h5yxYPOA5LGZ24g.lm2vFW_KvqMhdQFnt-qu6S0k_REYw66BZnSsIEezw2og.JPEG/566c09ac-d36b-4c8f-bc32-3cbbed5a9640.jpeg?type=f416_354" width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt=""></div><div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"><div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"></div></div></div></div><div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong class="HomeArtistListSlotView_artist_name__RFLuB"><div class="MarqueeView_container__l4V1r"><div class="MarqueeView_content__2Qs2H">NOWADAYS</div></div></strong></div></a> </div></li><li class="HomeArtistListSlotView_artist_item__a6gAX"><div><a class="HomeArtistListSlotView_artist_link__Mjm6r" href="/enhypen/feed"><div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img src="https://phinf.wevpstatic.net/MjAyNDEwMjVfMTE4/MDAxNzI5ODQ4MzMzMTEy.dmvjeA8vD61kf9KdoJx-TFRBGI_Qq1Q5Le2BMKG4qZEg.ivsLNXcJvSlioifndSZK0__G6_SdFIIuXW1qlppgHiEg.JPEG/67906065383058806c8fd54b6-69d8-4738-826c-13b333a676c3.jpg?type=f416_354" width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt=""></div><div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"><div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"></div></div></div></div><div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong class="HomeArtistListSlotView_artist_name__RFLuB"><div class="MarqueeView_container__l4V1r"><div class="MarqueeView_content__2Qs2H">ENHYPEN</div></div></strong></div></a> </div></li><li class="HomeArtistListSlotView_artist_item__a6gAX"><div><a class="HomeArtistListSlotView_artist_link__Mjm6r" href="/apink/feed"><div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img src="https://phinf.wevpstatic.net/MjAyNDExMTVfMjYg/MDAxNzMxNjQwMDY2MTk2.MXcXxlrdLoz11Xqix5MCdzbTwRcxpAempw7XheNJ0GUg.gIh-uHfIcX-gNFT5jevBavEXfcyXBJ5i6QiBjoHmmvog.JPEG/9cc695f3-ad2c-4f1f-9802-0b7784fcab5a.jpeg?type=f416_354" width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt=""></div><div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"><div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"></div></div></div></div><div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong class="HomeArtistListSlotView_artist_name__RFLuB"><div class="MarqueeView_container__l4V1r"><div class="MarqueeView_content__2Qs2H">Apink</div></div></strong></div></a> </div></li><li class="HomeArtistListSlotView_artist_item__a6gAX"><div><a class="HomeArtistListSlotView_artist_link__Mjm6r" href="/gidle/feed"><div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img src="https://phinf.wevpstatic.net/MjAyNDA2MjNfMTg2/MDAxNzE5MTU0NzU2Njg4.qt5cNc7YIJsdggtrdBH_avkerRE2K4-bHplAkvmwDdIg.Zjj-kW3jBdaiurpe9fFeYPxL2BipE5f9q_J6Yr9Gf_Eg.JPEG/1c4e5de8-6eb4-457f-8c06-502c09785914.jpeg?type=f416_354" width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt=""></div><div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"><div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"></div></div></div></div><div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong class="HomeArtistListSlotView_artist_name__RFLuB"><div class="MarqueeView_container__l4V1r"><div class="MarqueeView_content__2Qs2H">(G)I-DLE</div></div></strong></div></a> </div></li><li class="HomeArtistListSlotView_artist_item__a6gAX"><div><a class="HomeArtistListSlotView_artist_link__Mjm6r" href="/lightsum/feed"><div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img src="https://phinf.wevpstatic.net/MjAyNDEwMTVfMTA4/MDAxNzI4OTczOTk5ODI4.nCWXZQmsWkIofIxnJldFAgSxENIPKMoCY6rmR16TzzIg.6e-CNlz365BgPk7tUonmlmmEVrFbDNc58QV8bbeHdskg.PNG/640125188200932442f125175-8798-432b-8079-9a4e9ccc17ef.png?type=f416_354" width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt=""></div><div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"><div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"></div></div></div></div><div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong class="HomeArtistListSlotView_artist_name__RFLuB"><div class="MarqueeView_container__l4V1r"><div class="MarqueeView_content__2Qs2H">LIGHTSUM</div></div></strong></div></a> </div></li><li class="HomeArtistListSlotView_artist_item__a6gAX"><div><a class="HomeArtistListSlotView_artist_link__Mjm6r" href="/nctwish/feed"><div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img src="https://phinf.wevpstatic.net/MjAyNDA5MjRfMTU0/MDAxNzI3MTY4MzQwODAz.inbxWmasfUxMZ6aK-CtXze5AY7GpGqCmjhBrrFjKMIIg.tRb51nQXrv-IPd9D1sraaYHnadDBh_93mVHX2T90H7Eg.JPEG/0b97f398-b833-4283-a1ba-7acaa3249370.jpeg?type=f416_354" width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt=""></div><div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"><div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"></div></div></div></div><div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong class="HomeArtistListSlotView_artist_name__RFLuB"><div class="MarqueeView_container__l4V1r"><div class="MarqueeView_content__2Qs2H">NCT WISH</div></div></strong></div></a> </div></li><li class="HomeArtistListSlotView_artist_item__a6gAX"><div><a class="HomeArtistListSlotView_artist_link__Mjm6r" href="/atbo/feed"><div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img src="https://phinf.wevpstatic.net/MjAyNDA1MTBfNyAg/MDAxNzE1MzIzMTU4ODUy.uiufXSMWyzU6hrPgVDJO_gllHORdDLDvf8U9TtN6AUsg.zNuC33YbXX1NXi0LrhX7Y5VQM-eUi8EAnzIBBnckP-wg.JPEG/40cd80b4-0d65-43a3-89f8-a2ed51ac740f.jpeg?type=f416_354" width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt=""></div><div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"><div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"></div></div></div></div><div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong class="HomeArtistListSlotView_artist_name__RFLuB"><div class="MarqueeView_container__l4V1r"><div class="MarqueeView_content__2Qs2H">ATBO</div></div></strong></div></a> </div></li><li class="HomeArtistListSlotView_artist_item__a6gAX"><div><a class="HomeArtistListSlotView_artist_link__Mjm6r" href="/riize/feed"><div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img src="https://phinf.wevpstatic.net/MjAyNDEwMTVfMjc0/MDAxNzI4OTc2MDQyNDIw.BCx0oviqEeHAivIycODYCfScHloZCHIiGDrE81xNWeMg.AniauJKY3r0DcCVrWBqgqH0aUfHp-Cj-yGdfcH92zTQg.PNG/2425932261864622f8373afe-0d95-41ae-8629-2be0d1aadfdc.png?type=f416_354" width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt=""></div><div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"><div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"></div></div></div></div><div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong class="HomeArtistListSlotView_artist_name__RFLuB"><div class="MarqueeView_container__l4V1r"><div class="MarqueeView_content__2Qs2H">RIIZE</div></div></strong></div></a> </div></li><li class="HomeArtistListSlotView_artist_item__a6gAX"><div><a class="HomeArtistListSlotView_artist_link__Mjm6r" href="/lun8/feed"><div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img src="https://phinf.wevpstatic.net/MjAyNDA3MzBfMjc4/MDAxNzIyMzM3MjgyMTY3._qEec9jzPxQzTZZakLVZE7T05lJtnBVeuUABM-C753Ug.IH8J9YZd7L6DTSEC8GlnoxWSaelQFjEItpiJGpKaTGgg.JPEG/f7c77665-1c9c-4446-96b6-4dfa655409be.jpeg?type=f416_354" width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt=""></div><div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"><div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"></div></div></div></div><div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong class="HomeArtistListSlotView_artist_name__RFLuB"><div class="MarqueeView_container__l4V1r"><div class="MarqueeView_content__2Qs2H">LUN8</div></div></strong></div></a> </div></li><li class="HomeArtistListSlotView_artist_item__a6gAX"><div><a class="HomeArtistListSlotView_artist_link__Mjm6r" href="/tempest/feed"><div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img src="https://phinf.wevpstatic.net/MjAyNDA4MDhfMjQ5/MDAxNzIzMTAzMjU5OTY0.uqa1c-EfCmS6mAcinP3YDd4gz9Ks6qpsqIaRq3uwFVog.j2YsrHi2F3neG4l0RgelszoxsuAbxlVEa91XVSX3tNcg.PNG/58150296919550998f7d84b2d-0bae-4121-b259-bdd8432e43a6.png?type=f416_354" width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt=""></div><div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"><div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"></div></div></div></div><div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong class="HomeArtistListSlotView_artist_name__RFLuB"><div class="MarqueeView_container__l4V1r"><div class="MarqueeView_content__2Qs2H">TEMPEST</div></div></strong></div></a> </div></li><li class="HomeArtistListSlotView_artist_item__a6gAX"><div><a class="HomeArtistListSlotView_artist_link__Mjm6r" href="/syudou/feed"><div class="HomeArtistListSlotView_artist_cover_wrap__TGsNP"><img src="https://phinf.wevpstatic.net/MjAyNDAzMjFfMjg2/MDAxNzExMDA3MjIwNDM2.C51Xqk_-K1N-44rLvnk1kV6a9Udm4ss0vPCCwHmONN8g.ifoxuMZcBQtQ-zP1FN0AGcDjQt7xHGfx9spi0ze0NLgg.PNG/44688218401714915c47c8dfa-cf28-48c3-904f-7016c6b90125.png?type=f416_354" width="208" height="177" class="HomeArtistListSlotView_cover_img__a2krk" alt=""></div><div class="HomeArtistListSlotView_artist_thumb_wrap__du30B"><div class="ProfileThumbnailView_thumbnail_area__u25Uf ProfileThumbnailView_-community__+PkFD" style="width: 43px; height: 43px;"><div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf"><div style="aspect-ratio: auto 43 / 43; content-visibility: auto; contain-intrinsic-size: 43px; width: 100%; height: 100%;"></div></div></div></div><div class="HomeArtistListSlotView_artist_text_wrap__6GDpJ"><strong class="HomeArtistListSlotView_artist_name__RFLuB"><div class="MarqueeView_container__l4V1r"><div class="MarqueeView_content__2Qs2H">syudou</div></div></strong></div></a> </div></li>
<!-- 			<div class="container"> -->
<!-- 				<div class="row gy-4"> -->

<!-- 					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="100"> -->
<!-- 						<div class="team-member d-flex align-items-start"> -->
<!-- 							<div class="pic"> -->
<!-- 								<img src="assets/img/team/team-1.jpg" class="img-fluid" alt=""> -->
<!-- 							</div> -->
<!-- 							<div class="member-info"> -->
<!-- 								<h4>Walter White</h4> -->
<!-- 								<span>Chief Executive Officer</span> -->
<!-- 								<p>Explicabo voluptatem mollitia et repellat qui dolorum -->
<!-- 									quasi</p> -->
<!-- 								<div class="social"> -->
<!-- 									<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i -->
<!-- 										class="bi bi-facebook"></i></a> <a href=""><i -->
<!-- 										class="bi bi-instagram"></i></a> <a href=""> <i -->
<!-- 										class="bi bi-linkedin"></i> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					End Team Member -->

<!-- 					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="200"> -->
<!-- 						<div class="team-member d-flex align-items-start"> -->
<!-- 							<div class="pic"> -->
<!-- 								<img src="assets/img/team/team-2.jpg" class="img-fluid" alt=""> -->
<!-- 							</div> -->
<!-- 							<div class="member-info"> -->
<!-- 								<h4>Sarah Jhonson</h4> -->
<!-- 								<span>Product Manager</span> -->
<!-- 								<p>Aut maiores voluptates amet et quis praesentium qui senda -->
<!-- 									para</p> -->
<!-- 								<div class="social"> -->
<!-- 									<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i -->
<!-- 										class="bi bi-facebook"></i></a> <a href=""><i -->
<!-- 										class="bi bi-instagram"></i></a> <a href=""> <i -->
<!-- 										class="bi bi-linkedin"></i> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					End Team Member -->

<!-- 					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="300"> -->
<!-- 						<div class="team-member d-flex align-items-start"> -->
<!-- 							<div class="pic"> -->
<!-- 								<img src="assets/img/team/team-3.jpg" class="img-fluid" alt=""> -->
<!-- 							</div> -->
<!-- 							<div class="member-info"> -->
<!-- 								<h4>William Anderson</h4> -->
<!-- 								<span>CTO</span> -->
<!-- 								<p>Quisquam facilis cum velit laborum corrupti fuga rerum -->
<!-- 									quia</p> -->
<!-- 								<div class="social"> -->
<!-- 									<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i -->
<!-- 										class="bi bi-facebook"></i></a> <a href=""><i -->
<!-- 										class="bi bi-instagram"></i></a> <a href=""> <i -->
<!-- 										class="bi bi-linkedin"></i> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					End Team Member -->

<!-- 					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="400"> -->
<!-- 						<div class="team-member d-flex align-items-start"> -->
<!-- 							<div class="pic"> -->
<!-- 								<img src="assets/img/team/team-4.jpg" class="img-fluid" alt=""> -->
<!-- 							</div> -->
<!-- 							<div class="member-info"> -->
<!-- 								<h4>Amanda Jepson</h4> -->
<!-- 								<span>Accountant</span> -->
<!-- 								<p>Dolorum tempora officiis odit laborum officiis et et -->
<!-- 									accusamus</p> -->
<!-- 								<div class="social"> -->
<!-- 									<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i -->
<!-- 										class="bi bi-facebook"></i></a> <a href=""><i -->
<!-- 										class="bi bi-instagram"></i></a> <a href=""> <i -->
<!-- 										class="bi bi-linkedin"></i> -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<!-- End Team Member -->

				</div>

			</div>
	</div>
	
		</section>
		<!-- /Team Section -->




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
<!-- footer 이사감 -->
<jsp:include page="../include/footer_user.jsp"></jsp:include>
<!-- footer 이사감 -->