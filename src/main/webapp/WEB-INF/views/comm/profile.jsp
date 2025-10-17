<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Header Include -->
<jsp:include page="../include/header_user2.jsp"></jsp:include>

<!-- Navigation Bar Include -->
<jsp:include page="../include/nav.jsp"></jsp:include>
<!-- ///// nav 끝 ///// -->
<link href="/directlyCss/join.css" rel="stylesheet">
<link href="/directlyCss/commaside.css" rel="stylesheet">
<link href="/directlyCss/main.css" rel="stylesheet">
<link href="/directlyCss/modal.css" rel="stylesheet">
<link href="/directlyCss/commdetailmodal.css" rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 아이콘 -->
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap JS (필요 시 유지) -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- SweetAlert2 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css"
	rel="stylesheet">

<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- ///// css 시작 ///// -->
<!-- <link href="/directlyCss/main.css" rel="stylesheet"> -->
<!-- ///// css 끝 ///// -->

<style>
    /* 기존 CSS */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    .navbar {
        background-color: #3b82f6;
        padding: 10px 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
    }
    .navbar a {
        color: white;
        margin: 0 15px;
        text-decoration: none;
    }
    .profile-section {
        display: flex;
        align-items: center;
        margin: 30px 20px;
        justify-content: flex-start;
    }
    .profile-photo {
        width: 140px;
        height: 140px;
        border-radius: 50%;
        object-fit: cover;
        margin-right: 20px;
    }
    .artist-info {
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
    .artist-name-check {
        display: flex;
        align-items: center;
    }
    .artist-name {
        font-size: 35px;
        font-weight: bold;
        margin-right: 5px;
    }
    .verification {
        color: #3b82f6;
        font-size: 20px;
    }
    .artist-birthday {
        margin-top: -5px;
        font-size: 16px;
        color: #555;
    }
    .nickname-change {
        font-size: 14px;
        color: gray;
        margin-top: 5px;
    }
    .nickname-change a {
        text-decoration: underline;
        color: gray;
        cursor: pointer;
    }
    .nickname-change a:hover {
        color: #3b82f6;
    }
    .tabs {
        margin-left: 20px;
        display: flex;
        margin: 20px 0;
    }
    .tabs button {
        background-color: #f3f4f6;
        border: none;
        padding: 10px 20px;
        margin: 0 5px;
        cursor: pointer;
        border-radius: 5px;
    }
    .tabs button.active {
        background-color: #3b82f6;
        color: white;
    }

    /* 닉네임 변경 모달창 CSS */
.modal-nickname {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
}
.modal-nickname-content {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    width: 400px;
    text-align: center;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* 약간의 그림자 추가 */
}
.modal-nickname-header {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 10px;
}
.modal-nickname-body input {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}
.modal-nickname-footer {
    margin-top: 20px;
}
.modal-nickname-footer button {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin: 0 10px;
}
.modal-nickname-footer .btn-save {
    background-color: #3b82f6;
    color: white;
}
.modal-nickname-footer .btn-cancel {
    background-color: #e5e7eb;
}

/* 프로필 사진 변경 모달 */
.modal-photo {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
}
.modal-photo-content {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    width: 400px;
    text-align: center;
}
.modal-photo-content input[type="file"] {
    margin-top: 10px;
}

    .BadgeView_badge__sSoG5.BadgeView_-artist__jr7QG {
  background: no-repeat url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAABYlAAAWJQFJUiTwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAOCSURBVHgBjVW9T1RBEJ/Z9/g6IDm8AwPVvdoGK0vBWpOTSiv0H5CzkwqI1AL2Rq2wvIIYG8mVxop/QO9CgpdYnXAXDvB2nNl9H7uPM/peXvbt7uxvZn7zsQh/eVba3zZAwyb/toBgSweqUZ+PWrJXbTaLahzWkKCqCRYJ4Xl9IdodhoPDFqvtZkVp3bQSIkLy10HAIwYs8n+FN2Q0OyzRoUuI6lHUyWOpYQrCAax5FrCJRFjUhEu8sijglKg126xsFGrDsK4pEPe1oqqBZuszILTa4g/RmZDM1eo/FRhuR/UOH6iYc9ZySxOi45NVnK6jAqauUv1xvJNXgCkwB42lanygSEQOoCeaeeOOlMkQUIuDvwXBCCfFfAtX2s0NNrNGNnipIMb0eOdlHdCZu8COIfGEAlXDhyffKW+laz15ieZ7JXtTSsGt0TH42u9bXHLOIHQUW9q5xquVM4IIPveZxQhzQQivyjdhfaYE9yen7Bl0jCRoKY1qN8kWSwvGFjhKTS74igR8uzTLY2BWfw4G6R5nFEgYFdGegr7eAykis5i31qUq82qWQV3w150OfOlfeEYJM52rq7qS6uNDLS9I/NwZn4AC+t7IN8mcr98opeB7DP75/Nw7G1N41GDsuA44DpRZvlyYghczZdguz3EQgzRDBHy7VIYoHEnBD8/7aUzI8RRA/zLkSt/hcSmpXHl6WptRgF4y4CTTV1CBB/7m9DQGT2x24mY0BHeXuL6w2j5+wqF/S7FQUmT3JgrwrDhjDjd/X5ndKAzNfP+sC/vdbo4WAHs0VmCWsRayPxsUF4cWRyXY/B4yr5Ipj6anU6t98CSBTfWmuZ+lulmvhgSqkrppwGNP+BMgmT9mJRl4D7K24Y7oOINJ0S2FnJqb/LeJacaA1wo+nPU4xzX02G+bijlarAJCSlxK2wanfrBpm127XRkMBlVUSu6BSmohmcqkzDZ0PCTw0xLiti0ZSXvdy+6upGm+ZcKDk/Y7Flr1O6qNkdVk1zRbLZWJGd8i8L53eVZrODfbNQXmwhkrNFlBkZLbEjEnmu+oZt76uFCO8njXbjSpbE3cPhC93AaxOKYNUppkLd7XfAcMeYbfyZfju5QUTNa6uTKDI45Tw8TGKsHEGx1cNf5bQT2akUBtyVXIAA1QQS286EYHC6XbB/Pl5REVRkzfU6Eljs/WJ769hmH9AYN+hN+wHMHTAAAAAElFTkSuQmCC) 0 0 / contain;
  height: 30px;
  width: 30px;
}
    .BadgeView_badge__sSoG5 {
    display: inline-block;
    width: 20px;
    height: 20px;
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAABYlAAAWJQFJUiTwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAOCSURBVHgBjVW9T1RBEJ/Z9/g6IDm8AwPVvdoGK0vBWpOTSiv0H5CzkwqI1AL2Rq2wvIIYG8mVxop/QO9CgpdYnXAXDvB2nNl9H7uPM/peXvbt7uxvZn7zsQh/eVba3zZAwyb/toBgSweqUZ+PWrJXbTaLahzWkKCqCRYJ4Xl9IdodhoPDFqvtZkVp3bQSIkLy10HAIwYs8n+FN2Q0OyzRoUuI6lHUyWOpYQrCAax5FrCJRFjUhEu8sijglKg126xsFGrDsK4pEPe1oqqBZuszILTa4g/RmZDM1eo/FRhuR/UOH6iYc9ZySxOi45NVnK6jAqauUv1xvJNXgCkwB42lanygSEQOoCeaeeOOlMkQUIuDvwXBCCfFfAtX2s0NNrNGNnipIMb0eOdlHdCZu8COIfGEAlXDhyffKW+laz15ieZ7JXtTSsGt0TH42u9bXHLOIHQUW9q5xquVM4IIPveZxQhzQQivyjdhfaYE9yen7Bl0jCRoKY1qN8kWSwvGFjhKTS74igR8uzTLY2BWfw4G6R5nFEgYFdGegr7eAykis5i31qUq82qWQV3w150OfOlfeEYJM52rq7qS6uNDLS9I/NwZn4AC+t7IN8mcr98opeB7DP75/Nw7G1N41GDsuA44DpRZvlyYghczZdguz3EQgzRDBHy7VIYoHEnBD8/7aUzI8RRA/zLkSt/hcSmpXHl6WptRgF4y4CTTV1CBB/7m9DQGT2x24mY0BHeXuL6w2j5+wqF/S7FQUmT3JgrwrDhjDjd/X5ndKAzNfP+sC/vdbo4WAHs0VmCWsRayPxsUF4cWRyXY/B4yr5Ipj6anU6t98CSBTfWmuZ+lulmvhgSqkrppwGNP+BMgmT9mJRl4D7K24Y7oOINJ0S2FnJqb/LeJacaA1wo+nPU4xzX02G+bijlarAJCSlxK2wanfrBpm127XRkMBlVUSu6BSmohmcqkzDZ0PCTw0xLiti0ZSXvdy+6upGm+ZcKDk/Y7Flr1O6qNkdVk1zRbLZWJGd8i8L53eVZrODfbNQXmwhkrNFlBkZLbEjEnmu+oZt76uFCO8njXbjSpbE3cPhC93AaxOKYNUppkLd7XfAcMeYbfyZfju5QUTNa6uTKDI45Tw8TGKsHEGx1cNf5bQT2akUBtyVXIAA1QQS286EYHC6XbB/Pl5REVRkzfU6Eljs/WJ769hmH9AYN+hN+wHMHTAAAAAElFTkSuQmCC) 0 0 / contain; /* 이모티콘 이미지 경로 */
    background-size: cover;
}

.BadgeView_-artist__jr7QG span {
    display: none; /* 텍스트 숨기기 */
}
.post-section {
    margin: 30px 20px; /* 페이지 왼쪽 여백 추가 */
    max-width: 800px; /* 콘텐츠의 최대 너비를 제한 */
    text-align: left; /* 왼쪽 정렬 */
}
.post {
    border: 1px solid #ddd;
    padding: 15px;
    margin-bottom: 10px;
    border-radius: 5px;
}
.BadgeViewV2_badge__Lz-qv.BadgeViewV2_-membership_icon__5uf-z.BadgeViewV2_-size_12__PwdlI
	{
	background: no-repeat
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAABYlAAAWJQFJUiTwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAQzSURBVHgBjVV7iFRlFP+dO3dmt1Vzdq3YHtBogVHg2kNp6TXSH7sqpKZQBAsNEiUIswYRhDWzf/iXwa4QSBBsEmRZstuDNktq1B4S5W5aS4HYDV3RddFRWV13HsfzPe5jd3bFD+797j33nN8553fOdy7hBmtpHyfLc5EFI01AihkpYoAIRa5gKAZ8AUL/0EryZsOgGYEHOCU4vWyAoUDBZhdwRlU21qqsv1exS5x1HV5X66jGwbKvOFsB8gKSVGBiTAGQ78jI1C1wJs9FCSj/64u0Y1YHy/s4Jyb5AMgHhXGklXlaRpj67EhwP3RQV42D1j2clZduHd1042j06m6+UzQQJfVlDmPLvleoJ3CQ3s2pahmD8pKcZhR1pGgiocSPih0LyFE9k+3FBOHh/k3kuUoSm0Auxhbc8r2kGdTxCNDSDIxPAr94oPd/BubdAmxZAdzXBJpTBxw7Dez+DfjrVJClonK+7L3ytoLad0rHxHBCFcuxUbcuBN5uQ83q2Q+8tBy449bab+/tAwp/G3ufyvI4mtxYBWupbAsIw+OrreZl9BLw9RFgbp0xarkrBP9MsrlyDVj1KHD7fCCTBo4MA1evhTiJOLJuvIQ1QbuJ44fuCUG294O9M7ozqKEO3Js1NO89BPQdMkAnR0BbOwBF15K7xck/OnriqrZLu/FJtCiBX9w754RpF89JFJO6Ffj+5rDjBoUKCUzzPTKiSdHf5rlWXg1oSjkiaHQFxL/EIFgbnjAGSQKtf9rIxi4Ap08aXQkOK5eFjgN5KbhSrhJojarpHlGif08AixcBbY8DTy01xg31Zj/8uzGWjHlBI+i5Z4386DHgjAeOw54ji+m4JXgqkrgUWgxJPe/6VAp4NQQOwKUdB74xkSvd118z8vPnpSafBxgqC1Y6iTKKbkIciKdU9LReGhWgb4H160KAjz8Cjh8XEHvQ2lYDC5rM9+++BC5LM7j2MPo4ovinI0U8oPkSrwF/sv/0vRyeIQPQJEBOOeCXF8s5aV9lvv0h7Tp0MMK7qqVklzDP/dTZyUlnAheoakcBBzsa5NRm3wEab5P+vgIMD8o+Djz2JFDfIF02BnywDbg4Zvo+amtHx0Jdizc38o/i4BlE0lNFVPuiB0Ab30LNmhCHn7wL/D9sdO2YMaPCgH+4dS9l9CyiCjKuGnY8ZdgpRT51FLxjMyi9Abj3QYMx6gEH9wBn/9O8+7omKOgDVqwSujS2H1H+Be6ULLqVihO2Ldl35nAUm/KFgFFwM11lHr4xEBnX/tr2POedCnJ+D9vJOOOPBZGfjgay3SVXPrt/hh+Ov7av1pnkLF2MqbOeVDPURG0cFuXetblgIp/VgVrd7ZyKlZCTLF62GfhFDKjx6bP1KsgRzmwq3MRPP7p2puVfUcJah7BGnLXorAywJ7snrBxI1KMnU6DibBjXASgh5RFmfgMQAAAAAElFTkSuQmCC)
		0 0/contain;
	height: 12px;
	width: 12px;
}

.translate-btn {
	cursor: pointer;
}

section.content {
	position: relative; /* 문서 흐름 내 배치 */
	top: 10px; /* header와 nav의 총 높이 */
	padding: 20px;
}

ion-icon[name="heart"] {
	color: red; /* 빨간색으로 설정 */
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

/* 모달 구조 css */
#postContent {
    display: flex; /* 좌우로 배치 */
    position: relative; /* 자식 요소의 기준이 되는 컨테이너 */
     flex: 1;
    overflow: hidden; /* 내용 넘침 방지 */
    /*     overflow-y: auto; */
}
#postContent2 {
    display: flex; /* 좌우로 배치 */
    position: relative; /* 자식 요소의 기준이 되는 컨테이너 */
     flex: 1;
    overflow: hidden; /* 내용 넘침 방지 */
    /*     overflow-y: auto; */
}



#commentFormContainer {
    position: absolute; /* 부모(#postContent) 내부에 고정 */
    bottom: 20px; /* 부모 컨테이너 하단에서 간격 */
    right: 20px; /* 부모 컨테이너 오른쪽에서 간격 */
    width: 300px; /* 적절한 너비 */
    background-color: white; /* 배경색 */
    border: 1px solid #ddd; /* 경계선 */
    border-radius: 8px; /* 둥근 모서리 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    padding: 10px; /* 내부 여백 */
    z-index: 1000; /* 다른 요소 위에 표시 */
}
/* 모달 다이얼로그 크기 설정 */
.modal-dialog {
    max-width: 1200px; /* 모달 넓이를 950px로 고정 */
    width: 100%; /* 화면 크기에 맞게 조정 가능 */
    margin: auto; /* 가운데 정렬 */
    
}
/* 모달 전체 영역 */
.modal-content {
	margin-top:30px;
    height: calc(100vh - 60px); /* 전체 높이 설정 */
    min-height: 540px; /* 최소 높이 */
    display: flex;
    flex-direction: column; /* 수직 배치 */
    border-radius: 50px; /* 모서리 둥글게 */
}
.post-footer{
border-radius: 50px; /* 모서리 둥글게 */
}

.post-header{
padding: 26px 30px 14px;
}

.post-header-date-wrap{
opacity: .6;
}
/* 모달 본문 */
.modal-body {
    flex: 1; /* 본문이 남은 공간을 채우도록 설정 */
    display: flex;
    flex-direction: column;
      padding: 0; /* 내부 여백 제거 */
      overflow: hidden; /* 넘침 방지 */
   
}


.post-body {
padding: 10px;
 height: 100%; /* 부모 컨테이너 높이 채우기 */
    flex: 1;
    max-height: calc(100vh - 135px); /* 모달 높이에서 header/footer 제외한 최대 높이 */
    overflow-y: auto; /* 스크롤 활성화 */
/*     background-color: #f0f0f0; */
/*     padding: 10px; */
/*     margin-bottom: 10px; */
}

.post-body::-webkit-scrollbar {
    display: none; /* Webkit 기반 브라우저에서 스크롤바 숨기기 */
}
/* 왼쪽: post-info */
.post-info {
    flex: 2; /* 너비 비율 */
/*     background-color: rgb(254, 228, 232); */
/*     padding: 10px; */
    color: black;
    display: flex;
    flex-direction: column;
    justify-content: space-between; /* 상하 배치 */
    overflow: hidden; /* 내용 넘침 방지 */
    border-radius: 5px; /* 모서리 둥글게 */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

.post-footer {
    height: 75px;
    background-color: #f9f9f9;
    border-top: 1px solid #ddd;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
/*     border-radius: inherit; */
border-bottom-left-radius: 30px; /* 모서리 둥글게 */

}

/* 오른쪽: comment-info */
.comment-info {
    flex: 1; /* 너비 비율 */
/*     background-color: rgb(239, 254, 228); */
	color: black; /* 글자색 */
/*  padding: 10px;  내부 여백 */
    display: flex;
    flex-direction: column; /* 댓글 리스트와 footer 세로 배치 */
    justify-content: space-between;
    border-radius: 5px; /* 모서리 둥글게 */
    max-height: 890px; /* 댓글 영역 최대 높이 */
    overflow-y: auto; /* 스크롤 */
    overflow: hidden; /* 넘침 방지 */
}



/* 댓글 리스트 */
#commentList {
    flex: 1; /* 스크롤 가능한 영역 */
    overflow-y: auto; /* 스크롤 활성화 */ 
    padding: 10px;
    height: 696px;
/*     max-height: calc(100vh - 500px); */
/*     width: 728px; */
    
}

#commentList::-webkit-scrollbar {
    display: none; /* Webkit 기반 브라우저에서 스크롤바 숨기기 */
}

/* footer 고정 */
.post-footer,
.comment-footer {
    height: 75px; /* 고정 높이 */
    background-color: #f9f9f9;
    border-top: 1px solid #ddd;
/*     display: flex; */
    align-items: center;
    justify-content: center;
    padding: 0px;
    box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
}

.comment-header{
/* margin-left: 10px; */
  box-sizing: border-box;
  flex-shrink: 0;
  height: 56px;
  padding: 24px 20px 8px;
}
.form-horizontal{
display: flex; 
align-items: center; 
justify-content: center; 
height: 100%;
}
#cmmtCn{
height: 100%;
  background-color: rgb(247, 247, 248);
  border-radius: 23px;
  box-sizing: border-box;
  flex-grow: 1;
  min-height: 46px;
  padding: 12px 18px;
}
.comment-footer {
 border-bottom-right-radius: 30px; /* 모서리 둥글게 */
 padding: 10px;
 }
/* .PostHeaderView_button_item  */

.PostHeaderView_menu{
/* background-color: pink; */
    display: flex;
    justify-content: flex-end; /* 요소를 오른쪽으로 정렬 */
    align-items: center; /* 세로 가운데 정렬 */
    position: relative; /* 자식 요소의 위치 기준 설정 */
    width: 100%; /* 전체 너비 */
}
.PostHeaderView {

}

/* 기본 버튼 스타일 */
.MoreButtonView_button_menu {
    background: none;
    border: none;
    cursor: pointer;
    padding: 5px;
    font-size: 16px;
}

/* 드롭다운 리스트 스타일 */
.DropdownOptionListView_option_list {
    display: none; /* 기본적으로 숨김 */
    position: absolute;
    top: 100%; /* 버튼 바로 아래 */
    right: 0;
    background: white;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    list-style: none;
    padding: 0;
    margin: 0;
    z-index: 100;
}

.DropdownOptionListView_option_item {
    padding: 10px 15px;
    cursor: pointer;
}

.DropdownOptionListView_option_item:hover {
    background-color: #f5f5f5;
}

/* 드롭다운 활성화 시 */
.MoreButtonView_button_menu:focus + .DropdownOptionListView_option_list,
.DropdownOptionListView_option_list:hover {
    display: block;
}
.post-header-text {
    display: inline-block; /* 내부 콘텐츠 크기에 맞춰 너비 설정 */
    vertical-align: top; /* 주변 요소와의 세로 정렬 조정 (선택 사항) */
    width: 300px;
}

.comment-text-wrap {
    display: flex;
    flex-direction: column; /* 위아래로 배치 */
    	justify-content: space-between; /* 위와 아래로 균등 배치 */
/*     gap: 5px; /* 위아래 요소 간 간격 */ */
}

.comment-date{
	opacity: .6;
}

.post-text{
	 background-color:white; 
	 border:none; 
	 overflow:hidden; 
	 resize:none;"
	 
}
.post-text:focus{
	 outline: none; /* 포커스 테두리 제거 */
}

.col-sm-6{
padding:0px;
}

#commentsContent {
    margin-top: 20px;
    padding: 10px;
    background-color: #f9fdfc;
    border-radius: 8px;
}

.comment-section {
    margin-bottom: 20px;
    padding: 10px;
    background-color: #e8fbf8;
    border-radius: 8px;
}

.post-title p {
    font-size: 18px;
    font-weight: bold;
    margin: 0;
    color: #333;
}

.post-author p {
    font-size: 14px;
    font-weight: 500;
    margin: 5px 0;
    color: #007b83;
}

.comment-content p {
    font-size: 16px;
    margin: 10px 0;
    color: #444;
}

.comment-date p {
    font-size: 12px;
    color: #888;
    text-align: right;
    margin: 0;
}

hr {
    border: none;
    border-top: 1px solid #ccc;
    margin: 10px 0;
}
.comment-box {
    background-color: #e6f9f0; /* 연한 초록색 배경 */
    border-radius: 10px; /* 둥근 모서리 */
    padding: 15px;
    margin-bottom: 15px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    cursor: pointer;
}
.comment-box:hover {
    background-color: #f1f1f1; /* 호버 시 밝게 */
}

.comment-box .icon {
    font-size: 13px;
    margin-right: 3px; /* 아이콘과 텍스트 간격 */
    display: inline-block; /* 아이콘을 인라인 블록으로 설정하여 텍스트와 나란히 배치 */
    vertical-align: middle; /* 세로 정렬을 가운데로 맞춤 */
}

.timeline-body {
    display: inline-block; /* 글 내용도 인라인 블록으로 설정하여 아이콘 옆에 배치 */
    color: gray;
    margin-left: 0px; /* 이모티콘과 내용 사이의 간격 */
}
.post-content {
    font-weight: bold; /* 게시글 내용 강조 */
    font-size: 16px;
     color: gray;  /* 회색으로 변경 */
    margin-bottom: 2px;
}
.author-nickname {
     color: gray;  /* 회색으로 변경 */
    font-size: 10px;
    margin-top: -15px;
    margin-bottom: 12px;
}

.comment-content {
    color: 000; /* 댓글 내용 색상 */
    font-weight: bold; /* 댓글 내용 글씨 두껍게 */
    margin-bottom: 8px;
    padding-top: 10px; /* 위쪽 여백을 추가해서 선과 내용 사이의 간격을 줍니다 */
    border-top: 1px solid #ccc; /* 회색 가로선 */
}

.comment-date {
    font-size: 12px; /* 댓글 작성일 폰트 크기 */
    color: #888;
    text-align: left; /* 오른쪽 정렬 */
}
.no-underline {
    text-decoration: none; /* 밑줄 제거 */
}

.no-underline:hover {
    text-decoration: none; /* 호버 시에도 밑줄 제거 */
}
a {
    text-decoration: none; /* 링크의 기본 밑줄 제거 */
}

a:hover {
    text-decoration: none; /* 호버 시에도 밑줄 제거 */
}
.BadgeView_badge__sSoG5.BadgeView_-artist__jr7QG {
  background: no-repeat url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAABYlAAAWJQFJUiTwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAOCSURBVHgBjVW9T1RBEJ/Z9/g6IDm8AwPVvdoGK0vBWpOTSiv0H5CzkwqI1AL2Rq2wvIIYG8mVxop/QO9CgpdYnXAXDvB2nNl9H7uPM/peXvbt7uxvZn7zsQh/eVba3zZAwyb/toBgSweqUZ+PWrJXbTaLahzWkKCqCRYJ4Xl9IdodhoPDFqvtZkVp3bQSIkLy10HAIwYs8n+FN2Q0OyzRoUuI6lHUyWOpYQrCAax5FrCJRFjUhEu8sijglKg126xsFGrDsK4pEPe1oqqBZuszILTa4g/RmZDM1eo/FRhuR/UOH6iYc9ZySxOi45NVnK6jAqauUv1xvJNXgCkwB42lanygSEQOoCeaeeOOlMkQUIuDvwXBCCfFfAtX2s0NNrNGNnipIMb0eOdlHdCZu8COIfGEAlXDhyffKW+laz15ieZ7JXtTSsGt0TH42u9bXHLOIHQUW9q5xquVM4IIPveZxQhzQQivyjdhfaYE9yen7Bl0jCRoKY1qN8kWSwvGFjhKTS74igR8uzTLY2BWfw4G6R5nFEgYFdGegr7eAykis5i31qUq82qWQV3w150OfOlfeEYJM52rq7qS6uNDLS9I/NwZn4AC+t7IN8mcr98opeB7DP75/Nw7G1N41GDsuA44DpRZvlyYghczZdguz3EQgzRDBHy7VIYoHEnBD8/7aUzI8RRA/zLkSt/hcSmpXHl6WptRgF4y4CTTV1CBB/7m9DQGT2x24mY0BHeXuL6w2j5+wqF/S7FQUmT3JgrwrDhjDjd/X5ndKAzNfP+sC/vdbo4WAHs0VmCWsRayPxsUF4cWRyXY/B4yr5Ipj6anU6t98CSBTfWmuZ+lulmvhgSqkrppwGNP+BMgmT9mJRl4D7K24Y7oOINJ0S2FnJqb/LeJacaA1wo+nPU4xzX02G+bijlarAJCSlxK2wanfrBpm127XRkMBlVUSu6BSmohmcqkzDZ0PCTw0xLiti0ZSXvdy+6upGm+ZcKDk/Y7Flr1O6qNkdVk1zRbLZWJGd8i8L53eVZrODfbNQXmwhkrNFlBkZLbEjEnmu+oZt76uFCO8njXbjSpbE3cPhC93AaxOKYNUppkLd7XfAcMeYbfyZfju5QUTNa6uTKDI45Tw8TGKsHEGx1cNf5bQT2akUBtyVXIAA1QQS286EYHC6XbB/Pl5REVRkzfU6Eljs/WJ769hmH9AYN+hN+wHMHTAAAAAElFTkSuQmCC) 0 0 / contain;
  height: 30px;
  width: 30px;
}
    .BadgeView_badge__sSoG5 {
    display: inline-block;
    width: 20px;
    height: 20px;
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAABYlAAAWJQFJUiTwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAOCSURBVHgBjVW9T1RBEJ/Z9/g6IDm8AwPVvdoGK0vBWpOTSiv0H5CzkwqI1AL2Rq2wvIIYG8mVxop/QO9CgpdYnXAXDvB2nNl9H7uPM/peXvbt7uxvZn7zsQh/eVba3zZAwyb/toBgSweqUZ+PWrJXbTaLahzWkKCqCRYJ4Xl9IdodhoPDFqvtZkVp3bQSIkLy10HAIwYs8n+FN2Q0OyzRoUuI6lHUyWOpYQrCAax5FrCJRFjUhEu8sijglKg126xsFGrDsK4pEPe1oqqBZuszILTa4g/RmZDM1eo/FRhuR/UOH6iYc9ZySxOi45NVnK6jAqauUv1xvJNXgCkwB42lanygSEQOoCeaeeOOlMkQUIuDvwXBCCfFfAtX2s0NNrNGNnipIMb0eOdlHdCZu8COIfGEAlXDhyffKW+laz15ieZ7JXtTSsGt0TH42u9bXHLOIHQUW9q5xquVM4IIPveZxQhzQQivyjdhfaYE9yen7Bl0jCRoKY1qN8kWSwvGFjhKTS74igR8uzTLY2BWfw4G6R5nFEgYFdGegr7eAykis5i31qUq82qWQV3w150OfOlfeEYJM52rq7qS6uNDLS9I/NwZn4AC+t7IN8mcr98opeB7DP75/Nw7G1N41GDsuA44DpRZvlyYghczZdguz3EQgzRDBHy7VIYoHEnBD8/7aUzI8RRA/zLkSt/hcSmpXHl6WptRgF4y4CTTV1CBB/7m9DQGT2x24mY0BHeXuL6w2j5+wqF/S7FQUmT3JgrwrDhjDjd/X5ndKAzNfP+sC/vdbo4WAHs0VmCWsRayPxsUF4cWRyXY/B4yr5Ipj6anU6t98CSBTfWmuZ+lulmvhgSqkrppwGNP+BMgmT9mJRl4D7K24Y7oOINJ0S2FnJqb/LeJacaA1wo+nPU4xzX02G+bijlarAJCSlxK2wanfrBpm127XRkMBlVUSu6BSmohmcqkzDZ0PCTw0xLiti0ZSXvdy+6upGm+ZcKDk/Y7Flr1O6qNkdVk1zRbLZWJGd8i8L53eVZrODfbNQXmwhkrNFlBkZLbEjEnmu+oZt76uFCO8njXbjSpbE3cPhC93AaxOKYNUppkLd7XfAcMeYbfyZfju5QUTNa6uTKDI45Tw8TGKsHEGx1cNf5bQT2akUBtyVXIAA1QQS286EYHC6XbB/Pl5REVRkzfU6Eljs/WJ769hmH9AYN+hN+wHMHTAAAAAElFTkSuQmCC) 0 0 / contain; /* 이모티콘 이미지 경로 */
    background-size: cover;
}

.BadgeView_-artist__jr7QG span {
    display: none; /* 텍스트 숨기기 */
}



    
</style>
	<section class="content" style="max-width: 1200px; margin: 0 auto;">
	    <div class="container-fluid">
	        <!-- 프로필 섹션 -->
	        <div class="profile-section">
	            <c:if test="${not empty fileSaveLocate}">
	                <div>
	                    <img class="profile-photo" src="${pageContext.request.contextPath}${fileSaveLocate}" alt="Profile Photo"  onclick="openPhotoChangeModal()" />
	                </div>
	            </c:if>
	            <c:if test="${empty fileSaveLocate}">
	                <div>
	                    <img class="profile-photo" src="${pageContext.request.contextPath}/images/default-profile.jpg" alt="Default Profile"  onclick="openPhotoChangeModal()"/>
	                </div>
	            </c:if>

	            <div class="artist-info">
	            <div class="nickname-change">
	                    <a href="#" onclick="openNicknameChangeModal()">닉네임 변경</a>
	                </div>
	                <div class="artist-name-check">
	                    <span class="artist-name"><c:out value="${commRegNick}" /></span>
	                    <c:choose>
	                        <c:when test="${not empty artistBirth}">
	                            <em class="BadgeView_badge__sSoG5 BadgeView_-artist__jr7QG"></em>
	                        </c:when>
	                        <c:otherwise></c:otherwise>
	                    </c:choose>
	                </div>
	<!--                 <div class="nickname-change"> -->
	<!--                     <a href="#" onclick="openNicknameChangeModal()">닉네임 변경</a> -->
	<!--                 </div> -->
	                <div class="artist-birthday">
	                    <c:choose>
	                    <c:when test="${not empty artistBirth}">
	                        🎂<fmt:formatDate value="${artistBirth}" pattern="yyyy.MM.dd" />
	                    </c:when>
	                    <c:otherwise></c:otherwise>
	                </c:choose>
	                </div>
	            </div>
	        </div>

	        <!-- 로그인한 회원 정보 -->
	        <div>
	            로그인한 회원아이디: <c:out value="${sessionScope.memId}" />
	        </div>

<!-- 프로필 사진 변경 모달 -->
<div id="photoChangeModal" class="modal-photo" style="display: none;">
    <div class="modal-photo-content">
        <div class="modal-photo-header">프로필 사진 변경</div>
        <div class="modal-photo-body">
            <input type="file" id="newProfilePhoto" accept="image/*" />
        </div>
        <div class="modal-photo-footer">
            <button class="btn-save" onclick="uploadPhoto()">저장</button>
            <button class="btn-cancel" onclick="closePhotoChangeModal()">취소</button>
        </div>
    </div>
</div>

<!-- 닉네임 변경 모달 -->
<div id="nicknameChangeModal" class="modal-nickname">
    <div class="modal-nickname-content">
        <div class="modal-nickname-header">닉네임 변경</div>
        <div class="modal-nickname-body">
            <input type="text" value="${commRegNick}" id="newNickname" placeholder="닉네임을 입력하세요" />
        </div>
        <div class="modal-nickname-footer">
            <button class="btn-save" onclick="saveNickname()">저장</button>
            <button class="btn-cancel" onclick="closeNicknameChangeModal()">취소</button>
        </div>
    </div>
</div>

<div class="tabs">
    <button onclick="showPosts()" class="active">포스트</button>
    <button onclick="showComments()">댓글</button>
</div>

    
<div id="commentsContent" style="display: none;">  
  <!-- 댓글 목록 -->
    <c:forEach var="communityVO" items="${commentList}" varStatus="stat">
    <div class="comment-box viewDetail2"
     data-groupno="${communityVO.groupNo}"
     data-commno="${communityVO.commNo}">
     <div class="icon">📋</div>
    <!-- 글 내용 -->
    <div class="timeline-body">
        <c:if test="${communityVO.fileGroupVO != null}">
            <div class="form-group">
                <div class="row mb-3" style="padding-left:15px; padding-right:15px;">
                    <c:forEach var="fileDetailVO" items="${communityVO.fileGroupVO.fileDetailVOList}">
                        <div class="col-sm-6">
                            <img class="img-fluid"
                                 src="${fileDetailVO.fileSaveLocate}"
                                 alt="${fileDetailVO.fileOriginalName}" />
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>
        <p id="pCommCn${communityVO.commNo}" style="color: gray;">${communityVO.commCn}</p>
    </div>
    <!-- 작성자 정보 -->
    <div class="author-nickname">${communityVO.commRegNick}</div>
    <div class="comment-content">${communityVO.cmmtCn}</div>
    <div class="comment-date">${communityVO.cmmtDate}</div>
</div>

</c:forEach>
    
					<!-- 댓글 목록이 여기에 동적으로 삽입됩니다 -->
					
					
         
 <!-- 닫힌 script 태그 추가 -->

</div>
</div>



    <div id="postsContent" style="display: block;">
    <div class="timeline">
					<!-- timeline item -->
					<c:forEach var="communityVO" items="${communityVOList}"
						varStatus="stat">
						<div>
							<div>
								<a href="/${groupNo}/profile2?memId=${communityVO.memId}"> <img
									class="img-circle img-bordered-sm"
									style="cursor: pointer; height: 40px; width: 40px;"
		                           src="${communityVO.proSaveLocate}"
									alt="${fileDetailVO.fileOriginalName}"
									title="${fileDetailVO.fileOriginalName}" /></a> <a
									href="/${groupNo}/profile2?memId=${communityVO.memId}"
									style="font-weight: bold;">${communityVO.commRegNick} </a>
							</div>
							
							<div class="timeline-item" style="margin-bottom:5px;">
								<a href="#" class="viewDetail" class="no-underline"
									data-groupno="${communityVO.groupNo}"
									data-commno="${communityVO.commNo}">
									<div class="timeline-body">
										<c:if test="${communityVO.fileGroupVO != null}">
											<div class="form-group">
												<div class="row mb-3" style="padding-left:15px; padding-right:15px;">
													<c:forEach var="fileDetailVO"
														items="${communityVO.fileGroupVO.fileDetailVOList}">
														<div class="col-sm-6">
															<img class="img-fluid"
																src="${fileDetailVO.fileSaveLocate}"
																alt="${fileDetailVO.fileOriginalName}" />
														</div>
													</c:forEach>
												</div>
											</div>
										</c:if>
										
										<p id="pCommCn${communityVO.commNo}" class="no-underline"
											style="color:black;  text-decoration: none;">${communityVO.commCn}</p>
									</div>
								</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- 번역보기 버튼 -->
								<span id="btn-post${communityVO.commNo}" class="translate-btn"
									data-comment-id="post" data-commno="${communityVO.commNo}"
									data-comm-cn="${communityVO.commCn}"
									style="font-size: 12px; color: rgba(0, 0, 0, 0.5); text-decoration: underline; cursor: pointer;">
									<br>번역 보기 </span>
								<p>${communityVO.commWriteDate}</p>
								<br>
							</div>
							<div class="likecomment"
								style="display: flex; margin-left: 60px; align-items: center; gap: 10px;">
								<!-- 좋아요 버튼 및 좋아요 수 -->
								<button id="likeButton${communityVO.commNo}"
									onclick="toggleLike(${communityVO.commNo}, ${communityVO.groupNo})"
									style="border: none; background: none; padding: 0; margin: 0; cursor: pointer;">
									<ion-icon id="likeIcon${communityVO.commNo}"
										name="${communityVO.isLiked == 1 ? 'heart' : 'heart-outline'}"
										style="font-size: 20px;"></ion-icon>
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
					</c:forEach>
						</div>
					<!-- END timeline item -->
				</div>
	
	<!-- 모달 HTML -->
<!-- 모달을 여는 버튼 -->

<!-- 포스트 상세 모달 -->
<div class="modal fade" id="modal-detail" tabindex="-1" role="dialog" aria-labelledby="modalDetailLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <!-- AJAX로 데이터를 로드할 부분 -->
        <div id="postContent"></div>
      </div>
    </div>
  </div>
</div>

<!-- 댓글 상세 모달 -->
<div class="modal fade" id="modal-detail2" tabindex="-1" role="dialog" aria-labelledby="modalDetailLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div id="postContent2"></div>
            </div>
        </div>
    </div>
</div>
</section>


<script>

//커뮤니티 콘텐츠 로드 함수
function loadCommunityFeed(groupNo) {
    $.get(`/${groupNo}/list`, function (data) {
        $("#feedContainer").html(data);
    });
}
// //파일 선택 이벤트 처리
// document.getElementById('uploadFiles').addEventListener('change', (event) => {
//     const file = event.target.files[0];
//     if (file) {
//         const reader = new FileReader();
//         reader.onload = (e) => {
//             document.getElementById('profileThumbnail').src = e.target.result;
//         };
//         reader.readAsDataURL(file);
//     }
// });
// 글 작성 표시 함수
function createModal(groupNo, commCn) {
	Swal.fire({
	    title: '<h5 style="font-weight: bold;">포스트 쓰기</h5>',
	    html: `
	        <textarea id="commCn" name="commCn" rows="10" style="width: 100%; resize: none;" placeholder="위버스에 남겨 보세요"></textarea>
	        <br>
	        <div id="previewArea" style="margin-top: 10px; display: flex; flex-wrap: wrap; gap: 10px;"></div>
	        <div style="display: flex; align-items: center; justify-content: space-between; margin-top: 10px;">
	            <label for="memshipState" style="display: flex; align-items: center; font-size: 15px;"">
	                <input type="checkbox" id="memshipState" name="memshipState" value="1" />멤버십 전용
	            </label>
	            <label for="uploadFiles" class="attachment-button photo" style="display: flex; align-items: center;">
	                <div class="attachment-area">
	                    <span class="blind">Attach photo</span>
	                    <input id="uploadFiles" type="file" multiple accept="image/*" style="display:none;" class="swal2-file">
	                </div>
	            </label>
	            <button type="button" id="confirmButton" class="btn btn-primary" style="padding: 8px 16px;">완료</button>
	        </div>
	    `,
	    showCancelButton: false, // 취소 버튼 비활성화
	    showConfirmButton: false, // SweetAlert 기본 버튼 숨기기
        focusConfirm: false,
        preConfirm: () => {
            const commCn = document.getElementById('commCn').value;
            const fileInput = document.getElementById('uploadFiles').files;
            const memshipState = document.getElementById('memshipState').checked;
            if (!commCn) {
                Swal.showValidationMessage('글을 작성해 주세요.');
                return false;
            }
            return { commCn: commCn, uploadFiles: fileInput, memshipState: memshipState };
        }
    }).then((result) => {
        if (result.isConfirmed) {
            createForm(groupNo, result.value.commCn, result.value.uploadFiles, result.value.memshipState);
        }
    });

// // 파일 선택 이벤트 추가
// document.getElementById('uploadFiles').addEventListener('change', (event) => {
// const files = event.target.files;
// const previewArea = document.getElementById('previewArea');
// previewArea.innerHTML = ''; // 기존 미리보기 초기화

Array.from(files).forEach((file) => {
if (file.type.startsWith('image/')) {
    const reader = new FileReader();
    reader.onload = (e) => {
        const img = document.createElement('img');
        img.src = e.target.result;
        img.style.width = '100px';
        img.style.height = '100px';
        img.style.objectFit = 'cover';
        img.style.borderRadius = '8px';
        previewArea.appendChild(img);
    };
    reader.readAsDataURL(file);
}
});
// document.getElementById('confirmButton').addEventListener('click', () => {
// const commCn = document.getElementById('commCn').value;
// const fileInput = document.getElementById('uploadFiles').files;
// const memshipState = document.getElementById('memshipState').checked;

// if (!commCn) {
// Swal.showValidationMessage('글을 작성해 주세요.');
// return;
// }

// 데이터 처리 함수 호출
createForm(groupNo, commCn, fileInput, memshipState);
};



//글 업로드
function createForm(groupNo, commCn, uploadFiles, memshipState) {
    const formData = new FormData();
    formData.append('commCn', commCn);
    for (let i = 0; i < uploadFiles.length; i++) {
        formData.append('uploadFiles', uploadFiles[i]);
    }
    formData.append('memshipState', memshipState ? 1 : 0);

    // CSRF 토큰 처리 (필요 시 추가)
    const csrfToken = $('input[name="${_csrf.parameterName}"]').val();
    const csrfHeader = 'X-CSRF-TOKEN';

    // 서버로 데이터 전송
    $.ajax({
        url: `/${groupNo}/create`, // URL 확인
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        beforeSend: function (xhr) {
            xhr.setRequestHeader(csrfHeader, csrfToken);
        },
        success: function (response) {
                    location.reload(); // 등록 후 새로고침
        },
        error: function () {
            Swal.fire({
                icon: 'error',
                title: '오류 발생',
                text: '등록 중 문제가 발생했습니다.',
            });
        }
    });
}

// document.getElementById("start-subscription").addEventListener("click", function () {
//     // 첫 번째 모달 닫기
//     $('#modal-membership').modal('hide');

//     // 두 번째 모달 열기
//     $('#modal-membership2').modal('show');
    
// });
// 번역 ********************(게시글상세)
        $(document).on("click", ".translate-btn", function () {
            const commentId = $(this).data("comment-id") || $(this).closest('.modal').find('#modal-commNo').val();
            let commno = $(this).data("commno");
            let cmmtNo = $(this).data("cmmtNo");
            let textToTranslate = $("#commCn"+commno).val();
            let targetLang = "ko";
            let sourceLang = "";
            // 번역 요청을 위한 로직 추가
            //commentId:  post
            console.log("번역 버튼 클릭됨, commentId: ", commentId);
            
            
            let mode = $("#modal-btn-post"+commno).html();
            mode = mode.substr(0,1);
            console.log("mode : ", mode);
            let commCn;

            if(mode=="원"){
            	commCn = $(this).data("commCn");
            	// 버튼 텍스트를 '번역 보기'로 변경하고 언어 정보 복구
                $("#modal-btn-post"+commno).html("번역 보기");
                $("#commCn"+commno).html(commCn);
                return;
            }
            
            
            // 이곳에 번역 처리 로직을 추가합니다.
            //{"text": "なんでそんなにかわいいの。","sourceLang": "","targetLang": "ko"}
            let data = {
                text: textToTranslate,
                sourceLang: sourceLang,
                targetLang: targetLang
            };
            
            console.log("translate-btn->data : ", data);
            
         // Ajax 요청으로 번역 처리
            $.ajax({
                url: "/translation/api", // 컨트롤러에서 설정한 경로
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function (response) {
               		//{"translatedText": "왜 그렇게 귀엽다.","sourceLang": "일본어"}
                    console.log("번역 결과:", response);
                    if (response && response.translatedText) {
                        // 번역된 텍스트로 교체
//                         $commentElement.text(response.translatedText);
                        $("#commCn"+commno).html(response.translatedText);
                        // 원본 텍스트 저장
//                         $commentElement.data('original-text', originalText);

                        const sourceLang = response.sourceLang || 'unknown'; // 번역된 언어의 감지된 원본 언어
                        // 버튼 텍스트를 '원문 보기'로 변경하고 언어 정보 추가
//                         $(`#btn-${commentId}`).text('원문 보기').append(` (${sourceLang})`);
                        $("#modal-btn-post"+commno).html("원문 보기 ("+response.sourceLang+")");

                        // 번역 보기 버튼을 숨기고 원문 보기 버튼을 표시
                        $(this).hide(); // '번역 보기' 버튼 숨기기
                        $(`#btn-original-${commentId}`).show(); // '원문 보기' 버튼 표시
                    }
                },
                error: function (xhr, status, error) {
                    console.error("번역 중 오류:", xhr, status, error);
                }
            });
        });
        
     // 번역*********************(댓글)
        $(document).on("click", ".re-translate-btn", function () {
            const commentId = $(this).data("comment-id") || $(this).closest('.modal').find('#modal-cmmtNo').val();
            let commno = $(this).data("commno");
            let cmmtNo = $(this).data("cmmtNo");
            console.log("cmmtNo : " + cmmtNo);
            let textToTranslate = $("#respn"+cmmtNo).html();
            console.log("textToTranslate : " + textToTranslate);
            let targetLang = "ko";
            let sourceLang = "";
            // 번역 요청을 위한 로직 추가
            //commentId:  post
            console.log("re-번역 버튼 클릭됨, commentId: ", commentId);
            
            
            let mode = $("#re-btn-"+cmmtNo).html();
            mode = mode.substr(0,1);
            console.log("mode : ", mode);
            let respn;

            if(mode=="원"){
            	respn = $(this).data("cmmtCn");
            	// 버튼 텍스트를 '번역 보기'로 변경하고 언어 정보 복구
                $("#re-btn-"+cmmtNo).html("번역 보기");
                $("#respn"+cmmtNo).html(respn);
                return;
            }
            
            
            // 이곳에 번역 처리 로직을 추가합니다.
            //{"text": "なんでそんなにかわいいの。","sourceLang": "","targetLang": "ko"}
            let data = {
                text: textToTranslate,
                sourceLang: sourceLang,
                targetLang: targetLang
            };
            
            console.log("translate-btn->data : ", data);
            
         // Ajax 요청으로 번역 처리
            $.ajax({
                url: "/translation/api", // 컨트롤러에서 설정한 경로
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function (response) {
               		//{"translatedText": "왜 그렇게 귀엽다.","sourceLang": "일본어"}
                    console.log("번역 결과:", response);
                    if (response && response.translatedText) {
                        // 번역된 텍스트로 교체
//                         $commentElement.text(response.translatedText);
                        $("#respn"+cmmtNo).html(response.translatedText);
                        // 원본 텍스트 저장
//                         $commentElement.data('original-text', originalText);

                        const sourceLang = response.sourceLang || 'unknown'; // 번역된 언어의 감지된 원본 언어
                        // 버튼 텍스트를 '원문 보기'로 변경하고 언어 정보 추가
//                         $(`#btn-${commentId}`).text('원문 보기').append(` (${sourceLang})`);
                        $("#re-btn-"+cmmtNo).html("원문 보기 ("+response.sourceLang+")");

                        // 번역 보기 버튼을 숨기고 원문 보기 버튼을 표시
                        $(this).hide(); // '번역 보기' 버튼 숨기기
                        $(`#btn-original-${commentId}`).show(); // '원문 보기' 버튼 표시
                    }
                },
                error: function (xhr, status, error) {
                    console.error("번역 중 오류:", xhr, status, error);
                }
            });
        });

//******* 댓글 모달
 $(document).on("click", ".viewDetail", function (e) {
	    e.preventDefault();

	    const groupNo = $(this).data("groupno");
	    const commNo = $(this).data("commno");
	    
	    let data = {
	    	"groupNo":groupNo,
	    	"commNo":commNo
	    }
	    
	    //{"groupNo": 1,"commNo": 98}
	    console.log("viewDetail->data : ", data);

	    $.ajax({
	        url: `/${groupNo}/detail`, // 엔드포인트 URL
	        method: "GET",
	        data: { commNo: commNo },
	        	success: function (response) {
	                // 서버에서 받은 데이터를 모달에 렌더링
	                const communityVO = response.communityVO;
	                const commentVOList = response.commentVOList;
	                console.log("Response:", response); // 응답 데이터 전체 확인
	                console.log("commNo:", communityVO.commNo); // 값 확인
	                console.log("groupNo:", communityVO.groupNo); // 값 확인
	                

	                let modalContent = `
	                <div class="post-info">
	                	<input type="hidden" id="modal-commNo" value="${communityVO.commNo}">
	                	<input type="hidden" id="modal-groupNo" value="${communityVO.groupNo}">
						<div class="post-header">
	                	<div style="display: flex; align-items: center; gap: 8px;">
	                	<a class="PostHeaderView_thumbnail_wrap"
                        href="/${groupNo}/profile2?memId=${communityVO.memId}">
                        <!-- 썸네일 -->
                        <div class="ProfileThumbnailView_thumbnail_area" style="width: 46px; height: 46px;">
                          <div class="ProfileThumbnailView_thumbnail_wrap ProfileThumbnailView_-has_border__UG1nQ">
                            <div
                              style="aspect-ratio: auto 46 / 46; content-visibility: auto; contain-intrinsic-size: 46px; width: 100%; height: 100%;">
                              <img
                                src="\${communityVO.proSaveLocate}"
                                class="ProfileThumbnailView_thumbnail" width="46" height="46" alt=""></div>
                          </div>
                        </div>
                      </a>
                      <div class="post-header-text">
	                      <div class="post-header-nickname-wrap">
	                      	<a href="/${groupNo}/profile2?memId=${communityVO.memId}"><strong>\${communityVO.commRegNick}</strong></a>
	                      </div>
	                      <div class="post-header-date-wrap">
	                      	<p style="margin:0;">\${communityVO.commWriteDate}</p>
	                      </div>
                      </div>
                      <!-- 더 보기 버튼-->
                      <div class="PostHeaderView_button_item PostHeaderView_menu">
                      <div>
                          <!-- 더보기 버튼 -->

                          <!-- 드롭다운 옵션 리스트 -->
                      </div>
                  </div>

                      
                      </div>
                      </div>
                      <div class="post-body height:100%;">
                      <br>
	                    <h4><textarea style="background-color:white; border:none; overflow:hidden; resize:none;" class="form-control" id="commCn\${commNo}" data-comm-cn="\${communityVO.commCn}" readonly>\${communityVO.commCn}</textarea></h4>
	                    
	                `;

	                // 파일 그룹이 있을 경우 이미지 추가
	                if (communityVO.fileGroupVO && communityVO.fileGroupVO.fileDetailVOList) {
	                    communityVO.fileGroupVO.fileDetailVOList.forEach(file => {
	                        modalContent += `
	                            <img src="\${file.fileSaveLocate}" alt="\${file.fileOriginalName}" class="img-fluid">
	                        `;
	                    });
	                }

	                let commCn = communityVO.commCn; // 게시글 내용 가져오기
	                console.log("모달의 본론댓글commCn : ", commCn);

	                // 한국어 확인 (예시로 간단히 'ko'를 감지)
	                if (isKorean(commCn)) {
	                    // 한국어일 경우 번역 보기 버튼 숨기기
	                } else {
	                    // 한국어가 아닌 경우 번역 보기 버튼 보이기
	                	modalContent += `<span id="modal-btn-post\${commNo}" 
		                    class="translate-btn" 
		                    data-comment-id="post" 
		                    data-commno="\${commNo}"
		                    data-comm-cn="\${communityVO.commCn}"
							
		                   <span style="font-size: 12px; color: rgba(0, 0, 0, 0.5); text-decoration: underline; cursor: pointer;">
		                  번역 보기 </span>`;
	                }					
	                
	                  modalContent += `</span>
	                  </div>
	                    <div class="post-footer" style="display: flex; justify-content: space-between; align-items: center;">
	                    <div class="likecomment" style="display: flex; align-items: center; gap: 10px;  margin-left:20px;">
	                        <button id="modalLikeButton\${communityVO.commNo}"
	                            onclick="toggleLike(\${communityVO.commNo}, \${groupNo})"
	                            style="border: none; background: none; padding: 0; margin: 0; cursor: pointer;  display: flex; align-items: center; gap: 5px;">
	                            <ion-icon id="modalLikeIcon\${communityVO.commNo}" 
	                                name="\${communityVO.isLiked == 1 ? 'heart' : 'heart-outline'}" 
	                                style="font-size: 25px;"></ion-icon>
	                            <span id="modalLikeCount\${communityVO.commNo}">\${communityVO.likeCount}</span>
	                        </button>
	                    </div>
	                    </div>
	                    </div>
	                `;
        
       //댓글 등록
	                modalContent += `
	                <div class="comment-info">
					<div class="comment-header">
	                    <strong>\${communityVO.commentCount}개의 댓글 </h5>
	                    </strong>
	                    </div>
	                    <div id="commentList">
	                    
	                `;
					
	                // 댓글 목록 추가
					commentVOList.forEach(comment => {
					    modalContent += `
					    	
					        <div class="comment-item">
					            <div style="display: flex; align-items: center; gap: 8px;">
					                <a class="PostHeaderView_thumbnail_wrap"
					                    	href="/${groupNo}/profile2?memId=${communityVO.memId}">              <!-- 썸네일 -->
					                    <div class="ProfileThumbnailView_thumbnail_area" style="width: 35px; height: 35px;">
					                        <div class="ProfileThumbnailView_thumbnail_wrap ProfileThumbnailView_-has_border__UG1nQ">
					                            <div style="aspect-ratio: auto 35 / 35; content-visibility: auto; contain-intrinsic-size: 35px; width: 100%; height: 100%;">
					                                <img  src="\${comment.fileSaveLocate}"
					                                    class="ProfileThumbnailView_thumbnail" width="35" height="35" alt="">
					                            </div>
					                        </div>
					                    </div>
				                    <div class="comment-text-wrap">
					                <a href="/${groupNo}/profile2?memId=${communityVO.memId}"><strong>\${comment.commRegNick}</strong></a>
					            
					            <div class="comment-date">
					            <span>\${comment.cmmtDate}</span>
					            </div>
					            </div>
					            </div>
					            <p style="margin-left:43px; padding-top:10px;"><span id="respn\${comment.cmmtNo}">\${comment.cmmtCn}</span>`;
					            
					            const commCn = comment.cmmtCn; // 게시글 내용 가져오기
					            console.log("모달 댓글목록->commCn : ", commCn);

					            // 한국어 확인 (예시로 간단히 'ko'를 감지)
					            if (isKorean(commCn)) {
					                // 한국어일 경우 번역 보기 버튼 숨기기
					            } else {
					                // 한국어가 아닌 경우 번역 보기 버튼 보이기
					            	modalContent += `<span id="re-btn-\${comment.cmmtNo}" 
						                  class="re-translate-btn" 
						                  data-comment-id="post2" 
						                  data-cmmt-no="\${comment.cmmtNo}"
						                  data-cmmt-cn="\${comment.cmmtCn}"
						                  style="font-size: 12px; color: rgba(0, 0, 0, 0.5); text-decoration: underline; cursor: pointer;">
						                <br>번역 보기
						            </span>`;
					            }
					            
					            modalContent += `</p>
					        </div>
					    `;
					});
					modalContent += `
						</div>
		                <div class="comment-footer">
		        			<form id="createCommentFrm" class="form-horizontal"
		        				action="/${communityVO.groupNo}/createComment"
		        				method="post">
		        				<div class="input-group input-group-sm mb-0" style="text-">
		        					<input type="hidden" name="commNo" value="\${communityVO.commNo}" />
		        					<input type="hidden" name="memId" value="${loginUser.memId}" /> 
		        					<input type="text" id="cmmtCn" name="cmmtCn"
		        						class="form-control form-control-sm" placeholder="댓글을 입력하세요" required />
	
		        					<div class="input-group-append">
		        						<button type="submit" id="commentSubmit" style="border: none; background: none; padding: 0; margin: 0; cursor: pointer;"><ion-icon name="arrow-up-circle" style="width:38px; height:38px; opacity: .6; "></ion-icon></button>
		        					</div>
		        				</div>
		        			</form>
	                    </div>
					    </div> <!-- #commentList 닫기 -->
					`;

	                modalContent += `

	                `;

	                $("#postContent").html(modalContent);
	                // 모달 내용 추가 후 높이 조정
	                document.querySelectorAll("textarea").forEach(textarea => {
	                    autoResize(textarea); // 높이 조정
	                });

	                $("#modal-detail").modal("show");
	                
	              //******* 댓글 목록 표시
// 	                $(document).on("click", ".viewDetail", function (e) {
// 	                    e.preventDefault();

// 	                    const groupNo = $(this).data("groupno");
// 	                    const commNo = $(this).data("commno");

// 	                    let data = {
// 	                        "groupNo": groupNo,
// 	                        "commNo": commNo
// 	                    }

// 	                    console.log("viewDetail->data : ", data);

// 	                    $.ajax({
// 	                        url: `/${groupNo}/detail`, // 엔드포인트 URL
// 	                        method: "GET",
// 	                        data: { commNo: commNo },
// 	                        success: function (response) {
// 	                            // 서버에서 받은 데이터를 처리
// 	                            const communityVO = response.communityVO;
// 	                            const commentVOList = response.commentVOList;

// 	                            console.log("Response:", response);
// 	                            console.log("commNo:", communityVO.commNo);
// 	                            console.log("groupNo:", communityVO.groupNo);

// 	                            // 댓글 목록을 출력할 HTML 생성
// 	                            let commentsHTML = `
// 	                                <strong>${communityVO.commentCount}개의 댓글</strong>
// 	                                <div class="comment-list">
// 	                            `;

// 	                            commentVOList.forEach(comment => {
// 	                                commentsHTML += `
// 	                                    <div class="comment-item">
// 	                                        <div style="display: flex; align-items: center; gap: 8px;">
// 	                                            <a class="PostHeaderView_thumbnail_wrap" href="/${groupNo}/profile2?memId=${communityVO.memId}">
// 	                                                <div class="ProfileThumbnailView_thumbnail_area" style="width: 35px; height: 35px;">
// 	                                                    <div class="ProfileThumbnailView_thumbnail_wrap ProfileThumbnailView_-has_border__UG1nQ">
// 	                                                        <div style="aspect-ratio: auto 35 / 35; content-visibility: auto; contain-intrinsic-size: 35px; width: 100%; height: 100%;">
// 	                                                            <img src="${comment.fileSaveLocate}" class="ProfileThumbnailView_thumbnail" width="35" height="35" alt="">
// 	                                                        </div>
// 	                                                    </div>
// 	                                                </div>
// 	                                            </a>
// 	                                            <div class="comment-text-wrap">
// 	                                                <a href="/${groupNo}/profile2?memId=${communityVO.memId}"><strong>${comment.commRegNick}</strong></a>
// 	                                                <div class="comment-date">
// 	                                                    <span>${comment.cmmtDate}</span>
// 	                                                </div>
// 	                                            </div>
// 	                                        </div>
// 	                                        <p style="margin-left:43px; padding-top:10px;">
// 	                                            <span id="respn${comment.cmmtNo}">${comment.cmmtCn}</span>
// 	                                            <!-- 댓글 번역보기 버튼 -->
// 	                                            <span id="re-btn-${comment.cmmtNo}" 
// 	                                                  class="re-translate-btn" 
// 	                                                  data-comment-id="post2" 
// 	                                                  data-cmmt-no="${comment.cmmtNo}"
// 	                                                  data-cmmt-cn="${comment.cmmtCn}"
// 	                                                  style="font-size: 12px; color: rgba(0, 0, 0, 0.5); text-decoration: underline; cursor: pointer;">
// 	                                                <br>번역보기
// 	                                            </span>
// 	                                        </p>
// 	                                    </div>
// 	                                `;
// 	                            });

// 	                            commentsHTML += `</div>`; // 댓글 목록 닫기

// 	                            // 댓글 섹션에 삽입
// 	                            $("#commentsContent .timeline").html(commentsHTML);
// 	                            $("#commentsContent").show(); // 댓글 섹션 표시
// 	                        },
// 	                        error: function (xhr, status, error) {
// 	                            console.error("댓글 데이터를 가져오는 중 오류 발생:", error);
// 	                        }
// 	                    });//end 2차 ajax
// 	                });//end click


    },
    error: function () {
        alert("글 상세 정보를 가져오는데 실패했습니다.");
    }
});
});

//페이지 로드 시, 한국어 텍스트인 경우 번역 보기 버튼 숨기기
 $(document).ready(function () {
     $(".translate-btn").each(function () {
         const commCn = $(this).data("commCn"); // 게시글 내용 가져오기

         // 한국어 확인 (예시로 간단히 'ko'를 감지)
         if (isKorean(commCn)) {
             // 한국어일 경우 번역 보기 버튼 숨기기
             $(this).hide();
         } else {
             // 한국어가 아닌 경우 번역 보기 버튼 보이기
             $(this).show();
         }
     });
 });

 // 한국어 여부를 확인하는 함수 (기본적인 예시)
 function isKorean(text) {
     const koreanRegExp = /[\u3131-\u3163\uac00-\ud7a3]/;
     return koreanRegExp.test(text);
 }


 document.addEventListener("DOMContentLoaded", function() {
	    // 페이지 로드 시 초기 상태 설정
	    document.getElementById("postsContent").style.display = "block";  // 포스트 목록 보이기
	    document.getElementById("commentsContent").style.display = "none"; // 댓글 목록 숨기기
	});

	function showPosts() {
	    document.getElementById("postsContent").style.display = "block";  // 포스트 목록 보이기
	    document.getElementById("commentsContent").style.display = "none"; // 댓글 목록 숨기기

	    // 버튼 스타일 변경
	    document.querySelectorAll(".tabs button")[0].classList.add("active");  // 첫 번째 버튼 활성화
	    document.querySelectorAll(".tabs button")[1].classList.remove("active"); // 두 번째 버튼 비활성화
	}

	function showComments() {
	    document.getElementById("postsContent").style.display = "none"; // 포스트 목록 숨기기
	    document.getElementById("commentsContent").style.display = "block";  // 댓글 목록 보이기

	    // 버튼 스타일 변경
	    document.querySelectorAll(".tabs button")[0].classList.remove("active"); // 첫 번째 버튼 비활성화
	    document.querySelectorAll(".tabs button")[1].classList.add("active");  // 두 번째 버튼 활성화

	    // 댓글 목록을 AJAX로 불러오는 부분
	    loadComments(); // 댓글 목록을 AJAX로 불러오는 함수 호출  
	}
	


	// 모달이 열리기 직전에 댓글 목록을 숨기고 포스트 목록만 보이게 설정
	$('#modal-detail').on('show.bs.modal', function () {
	    // 화면에 모달이 열리기 전 댓글 목록을 미리 숨깁니다.
	    document.getElementById("commentsContent").style.display = "none";  // 댓글 목록 숨기기
	    document.getElementById("postsContent").style.display = "block";   // 포스트 목록 보이게
	});

	// 모달이 열리고 나서 (완전히 열린 뒤에도 계속 포스트 목록만 보이게 설정)
	$('#modal-detail').on('shown.bs.modal', function () {
	    document.getElementById("commentsContent").style.display = "none";  // 댓글 목록 숨기기
	    document.getElementById("postsContent").style.display = "block";   // 포스트 목록 보이게
	});

	// 모달이 닫힐 때 상태 초기화
	$('#modal-detail').on('hidden.bs.modal', function () {
	    document.getElementById("commentsContent").style.display = "none";  // 댓글 목록 숨기기
	    document.getElementById("postsContent").style.display = "block";   // 포스트 목록 보이게
	});
	
	
	
	




	//******* 댓글 모달
	 $(document).on("click", ".viewDetail2", function (e) {
		    e.preventDefault();

		    const groupNo = $(this).data("groupno");
		    const commNo = $(this).data("commno");
		    
		    let data = {
		    	"groupNo":groupNo,
		    	"commNo":commNo
		    }
		    
		    //{"groupNo": 1,"commNo": 98}
		    console.log("viewDetail2->data : ", data);

		    $.ajax({
		        url: `/${groupNo}/detail`, // 엔드포인트 URL
		        method: "GET",
		        data: { commNo: commNo },
		        	success: function (response) {
		                // 서버에서 받은 데이터를 모달에 렌더링
		                const communityVO = response.communityVO;
		                const commentVOList = response.commentVOList;
		                console.log("Response:", response); // 응답 데이터 전체 확인
		                console.log("commNo:", communityVO.commNo); // 값 확인
		                console.log("groupNo:", communityVO.groupNo); // 값 확인
		                

		                let modalContent = `
		                <div class="post-info">
		                	<input type="hidden" id="modal-commNo" value="${communityVO.commNo}">
		                	<input type="hidden" id="modal-groupNo" value="${communityVO.groupNo}">
							<div class="post-header">
		                	<div style="display: flex; align-items: center; gap: 8px;">
		                	<a class="PostHeaderView_thumbnail_wrap"
	                        href="/${groupNo}/profile2?memId=${communityVO.memId}">
	                        <!-- 썸네일 -->
	                        <div class="ProfileThumbnailView_thumbnail_area" style="width: 46px; height: 46px;">
	                          <div class="ProfileThumbnailView_thumbnail_wrap ProfileThumbnailView_-has_border__UG1nQ">
	                            <div
	                              style="aspect-ratio: auto 46 / 46; content-visibility: auto; contain-intrinsic-size: 46px; width: 100%; height: 100%;">
	                              <img
	                                src="\${communityVO.proSaveLocate}"
	                                class="ProfileThumbnailView_thumbnail" width="46" height="46" alt=""></div>
	                          </div>
	                        </div>
	                      </a>
	                      <div class="post-header-text">
		                      <div class="post-header-nickname-wrap">
		                      	<a href="/${groupNo}/profile2?memId=${communityVO.memId}"><strong>\${communityVO.commRegNick}</strong></a>
		                      </div>
		                      <div class="post-header-date-wrap">
		                      	<p style="margin:0;">\${communityVO.commWriteDate}</p>
		                      </div>
	                      </div>
	                      <!-- 더 보기 버튼-->
	                      <div class="PostHeaderView_button_item PostHeaderView_menu">
	                      <div>
	                          <!-- 더보기 버튼 -->

	                          <!-- 드롭다운 옵션 리스트 -->
	                      </div>
	                  </div>

	                      
	                      </div>
	                      </div>
	                      <div class="post-body height:100%;">
	                      <br>
		                    <h4><textarea style="background-color:white; border:none; overflow:hidden; resize:none;" class="form-control" id="commCn\${commNo}" data-comm-cn="\${communityVO.commCn}" readonly>\${communityVO.commCn}</textarea></h4>
		                    
		                `;

		                // 파일 그룹이 있을 경우 이미지 추가
		                if (communityVO.fileGroupVO && communityVO.fileGroupVO.fileDetailVOList) {
		                    communityVO.fileGroupVO.fileDetailVOList.forEach(file => {
		                        modalContent += `
		                            <img src="\${file.fileSaveLocate}" alt="\${file.fileOriginalName}" class="img-fluid">
		                        `;
		                    });
		                }


		                modalContent += `<span id="modal-btn-post\${commNo}" 
		                    class="translate-btn" 
		                    data-comment-id="post" 
		                    data-commno="\${commNo}"
		                    data-comm-cn="\${communityVO.commCn}"
							
		                   <span style="font-size: 12px; color: rgba(0, 0, 0, 0.5); text-decoration: underline; cursor: pointer;">
		                  번역 보기 </span>
		              </span>
		                  </div>
		                    <div class="post-footer" style="display: flex; justify-content: space-between; align-items: center;">
		                    <div class="likecomment" style="display: flex; align-items: center; gap: 10px;  margin-left:20px;">
		                        <button id="modalLikeButton\${communityVO.commNo}"
		                            onclick="toggleLike(\${communityVO.commNo}, \${groupNo})"
		                            style="border: none; background: none; padding: 0; margin: 0; cursor: pointer;  display: flex; align-items: center; gap: 5px;">
		                            <ion-icon id="modalLikeIcon\${communityVO.commNo}" 
		                                name="\${communityVO.isLiked == 1 ? 'heart' : 'heart-outline'}" 
		                                style="font-size: 25px;"></ion-icon>
		                            <span id="modalLikeCount\${communityVO.commNo}">\${communityVO.likeCount}</span>
		                        </button>
		                    </div>
		                    </div>
		                    </div>
		                `;
	        
	       //댓글 등록
		                modalContent += `
		                <div class="comment-info">
						<div class="comment-header">
		                    <strong>\${communityVO.commentCount}개의 댓글 </h5>
		                    </strong>
		                    </div>
		                    <div id="commentList">
		                    
		                `;
						
		                // 댓글 목록 추가
						commentVOList.forEach(comment => {
						    modalContent += `
						    	
						        <div class="comment-item">
						            <div style="display: flex; align-items: center; gap: 8px;">
						                <a class="PostHeaderView_thumbnail_wrap"
						                    	href="/${groupNo}/profile2?memId=${communityVO.memId}">              <!-- 썸네일 -->
						                    <div class="ProfileThumbnailView_thumbnail_area" style="width: 35px; height: 35px;">
						                        <div class="ProfileThumbnailView_thumbnail_wrap ProfileThumbnailView_-has_border__UG1nQ">
						                            <div style="aspect-ratio: auto 35 / 35; content-visibility: auto; contain-intrinsic-size: 35px; width: 100%; height: 100%;">
						                                <img  src="\${comment.fileSaveLocate}"
						                                    class="ProfileThumbnailView_thumbnail" width="35" height="35" alt="">
						                            </div>
						                        </div>
						                    </div>
					                    <div class="comment-text-wrap">
						                <a href="/${groupNo}/profile2?memId=${communityVO.memId}"><strong>\${comment.commRegNick}</strong></a>
						            
						            <div class="comment-date">
						            <span>\${comment.cmmtDate}</span>
						            </div>
						            </div>
						            </div>
						            <p style="margin-left:43px; padding-top:10px;"><span id="respn\${comment.cmmtNo}">\${comment.cmmtCn}</span>`;
						            <!-- 댓글 번역보기 버튼 -->
									const commCn = comment.cmmtCn; // 게시글 내용 가져오기
													            console.log("모달 댓글목록->commCn : ", commCn);

													            // 한국어 확인 (예시로 간단히 'ko'를 감지)
													            if (isKorean(commCn)) {
													                // 한국어일 경우 번역 보기 버튼 숨기기
													            } else {
													                // 한국어가 아닌 경우 번역 보기 버튼 보이기
													            	modalContent += `<span id="re-btn-\${comment.cmmtNo}" 
														                  class="re-translate-btn" 
														                  data-comment-id="post2" 
														                  data-cmmt-no="\${comment.cmmtNo}"
														                  data-cmmt-cn="\${comment.cmmtCn}"
														                  style="font-size: 12px; color: rgba(0, 0, 0, 0.5); text-decoration: underline; cursor: pointer;">
														                <br>번역 보기
														            </span>`;
													            }
													            
													            modalContent += `</p>
													        </div>
													    `;
													});
						modalContent += `
							</div>
			                <div class="comment-footer">
			        			<form id="createCommentFrm" class="form-horizontal"
			        				action="/${communityVO.groupNo}/createComment"
			        				method="post">
			        				<div class="input-group input-group-sm mb-0" style="text-">
			        					<input type="hidden" name="commNo" value="\${communityVO.commNo}" />
			        					<input type="hidden" name="memId" value="${loginUser.memId}" /> 
			        					<input type="text" id="cmmtCn" name="cmmtCn"
			        						class="form-control form-control-sm" placeholder="댓글을 입력하세요" required />
		
			        					<div class="input-group-append">
			        						<button type="submit" id="commentSubmit" style="border: none; background: none; padding: 0; margin: 0; cursor: pointer;"><ion-icon name="arrow-up-circle" style="width:38px; height:38px; opacity: .6; "></ion-icon></button>
			        					</div>
			        				</div>
			        			</form>
		                    </div>
						    </div> <!-- #commentList 닫기 -->
						`;

		                modalContent += `

		                `;

		                $("#postContent2").html(modalContent);
		                // 모달 내용 추가 후 높이 조정
		                document.querySelectorAll("textarea").forEach(textarea => {
		                    autoResize(textarea); // 높이 조정
		                });

		                $("#modal-detail2").modal("show");
		                
		              //******* 댓글 목록 표시
		                $(document).on("click", ".viewDetail2", function (e) {
		                    e.preventDefault();

		                    const groupNo = $(this).data("groupno");
		                    const commNo = $(this).data("commno");

		                    let data = {
		                        "groupNo": groupNo,
		                        "commNo": commNo
		                    }

		                    console.log("viewDetail2->data : ", data);

		                    $.ajax({
		                        url: `/${groupNo}/detail`, // 엔드포인트 URL
		                        method: "GET",
		                        data: { commNo: commNo },
		                        success: function (response) {
		                            // 서버에서 받은 데이터를 처리
		                            const communityVO = response.communityVO;
		                            const commentVOList = response.commentVOList;

		                            console.log("Response:", response);
		                            console.log("commNo:", communityVO.commNo);
		                            console.log("groupNo:", communityVO.groupNo);

		                            // 댓글 목록을 출력할 HTML 생성
		                            let commentsHTML = `
		                                <strong>${communityVO.commentCount}개의 댓글</strong>
		                                <div class="comment-list">
		                            `;

		                            commentVOList.forEach(comment => {
		                                commentsHTML += `
		                                    <div class="comment-item">
		                                        <div style="display: flex; align-items: center; gap: 8px;">
		                                            <a class="PostHeaderView_thumbnail_wrap" href="/${groupNo}/profile2?memId=${communityVO.memId}">
		                                                <div class="ProfileThumbnailView_thumbnail_area" style="width: 35px; height: 35px;">
		                                                    <div class="ProfileThumbnailView_thumbnail_wrap ProfileThumbnailView_-has_border__UG1nQ">
		                                                        <div style="aspect-ratio: auto 35 / 35; content-visibility: auto; contain-intrinsic-size: 35px; width: 100%; height: 100%;">
		                                                            <img src="${comment.fileSaveLocate}" class="ProfileThumbnailView_thumbnail" width="35" height="35" alt="">
		                                                        </div>
		                                                    </div>
		                                                </div>
		                                            </a>
		                                            <div class="comment-text-wrap">
		                                                <a href="/${groupNo}/profile2?memId=${communityVO.memId}"><strong>${comment.commRegNick}</strong></a>
		                                                <div class="comment-date">
		                                                    <span>${comment.cmmtDate}</span>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <p style="margin-left:43px; padding-top:10px;">
		                                            <span id="respn${comment.cmmtNo}">${comment.cmmtCn}</span>
		                                            <!-- 댓글 번역보기 버튼 -->
		                                            <span id="re-btn-${comment.cmmtNo}" 
		                                                  class="re-translate-btn" 
		                                                  data-comment-id="post2" 
		                                                  data-cmmt-no="${comment.cmmtNo}"
		                                                  data-cmmt-cn="${comment.cmmtCn}"
		                                                  style="font-size: 12px; color: rgba(0, 0, 0, 0.5); text-decoration: underline; cursor: pointer;">
		                                                <br>번역보기
		                                            </span>
		                                        </p>
		                                    </div>
		                                `;
		                            });

		                            commentsHTML += `</div>`; // 댓글 목록 닫기

		                            // 댓글 섹션에 삽입
		                            $("#commentsContent .timeline").html(commentsHTML);
		                            $("#commentsContent").show(); // 댓글 섹션 표시
		                        },
		                        error: function (xhr, status, error) {
		                            console.error("댓글 데이터를 가져오는 중 오류 발생:", error);
		                        }
		                    });
		                });

	        
	     	
	     // 페이지 로드 시, 한국어 텍스트인 경우 번역 보기 버튼 숨기기
	        $(document).ready(function () {
	            $(".translate-btn").each(function () {
	                const commCn = $(this).data("commCn"); // 게시글 내용 가져오기

	                // 한국어 확인 (예시로 간단히 'ko'를 감지)
	                if (isKorean(commCn)) {
	                    // 한국어일 경우 번역 보기 버튼 숨기기
	                    $(this).hide();
	                } else {
	                    // 한국어가 아닌 경우 번역 보기 버튼 보이기
	                    $(this).show();
	                }
	            });
	        });

	        // 한국어 여부를 확인하는 함수 (기본적인 예시)
	        function isKorean(text) {
	            const koreanRegExp = /[\u3131-\u3163\uac00-\ud7a3]/;
	            return koreanRegExp.test(text);
	        }
	     	
	     	
	     
	    },
	    error: function () {
	        alert("글 상세 정보를 가져오는데 실패했습니다.");
	    }
	});
	});








//번역 기능
$(document).ready(function () {
// 두 번째 모달이 닫힐 때 남아 있는 어두운 배경 제거
$('#modal-membership2').on('hidden.bs.modal', function () {
$('body').removeClass('modal-open'); // body에 남아 있는 모달 상태 제거
$('.modal-backdrop').remove();       // 어두운 배경 제거
});

// 서버로 상태 확인 요청
$.getJSON(`/${groupNo}/feed/status`, function (response) {
if (!response.isLoggedIn) {
 // 로그인하지 않은 경우 SweetAlert로 로그인 모달 표시
 showLoginModal();
} else if (!response.isCommunityMember) {
 // 가입하지 않은 경우 SweetAlert로 가입 모달 표시
 showJoinModal(groupNo);
} else {
 // 로그인 및 가입 상태가 정상인 경우 콘텐츠 로드
 loadCommunityFeed(groupNo);
}
}).fail(function () {
Swal.fire({
 icon: 'error',
 title: '오류 발생',
 text: '서버 상태 확인 중 문제가 발생했습니다.',
});
});

$('#createModalButton').on('click', function () {
const groupNo = $("input[name='groupNo']").val();
createModal(groupNo);
});

// 번역 보기 버튼 클릭 시*******피드쪽
$('.translate-btn').click(function () {

const commentId = $(this).data('comment-id'); // 댓글 ID 가져오기
const commno = $(this).data('commno'); // 댓글 ID 가져오기
console.log("commno : " + commno);


let mode = $("#btn-post"+commno).html();
mode = mode.substr(0,1);
console.log("mode : ", mode);
let commCn;

if(mode=="원"){
commCn = $(this).data("commCn");
// 버튼 텍스트를 '번역 보기'로 변경하고 언어 정보 복구
$("#btn-post"+commno).html("번역 보기");
$("#pCommCn"+commno).html(commCn);
return;
}

const $commentElement = $(`#comment-${commentId}`); // 댓글 요소 가져오기
//const textToTranslate = $commentElement.text(); // 번역할 텍스트 가져오기
const textToTranslate = $("#pCommCn"+commno).html(); // 번역할 텍스트 가져오기
const originalText = $commentElement.data('original-text') || textToTranslate; // 원본 텍스트 저장

const sourceLang = ""; // 빈 값을 넣어 자동 언어 감지 활성화
const targetLang = "ko"; // 대상 언어를 한국어로 고정

//{"text": "なんでそんなにかわいいの。","sourceLang": "","targetLang": "ko"}
let data = {
text: textToTranslate,
sourceLang: sourceLang,
targetLang: targetLang
};

console.log("data : ", data);

// Ajax 요청으로 번역 처리
$.ajax({
url: "/translation/api", // 컨트롤러에서 설정한 경로
type: "POST",
contentType: "application/json",
data: JSON.stringify(data),
success: function (response) {
	//{"translatedText": "왜 그렇게 귀엽다.","sourceLang": "일본어"}
    console.log("번역 결과:", response);
    if (response && response.translatedText) {
        // 번역된 텍스트로 교체
//         $commentElement.text(response.translatedText);
        $("#pCommCn"+commno).html(response.translatedText);
        // 원본 텍스트 저장
        $commentElement.data('original-text', originalText);

        const sourceLang = response.sourceLang || 'unknown'; // 번역된 언어의 감지된 원본 언어
        // 버튼 텍스트를 '원문 보기'로 변경하고 언어 정보 추가
        $("#btn-post"+commno).html("원문 보기 ("+response.sourceLang+")");

        // 번역 보기 버튼을 숨기고 원문 보기 버튼을 표시
//         $(this).hide(); // '번역 보기' 버튼 숨기기
//         $(`#btn-original-${commentId}`).show(); // '원문 보기' 버튼 표시
    }
},
error: function (xhr, status, error) {
    console.error("번역 중 오류:", xhr, status, error);
}
});
});
//번역 보기 버튼 숨기기 및 보이기 (한국어는 숨기기)
$('.translate-btn').each(function () {
    const commCn = $(this).data('commCn'); // 게시글 내용 가져오기

    // 한국어 확인 (예시로 간단히 'ko'를 감지)
    if (isKorean(commCn)) {
        // 한국어일 경우 번역 보기 버튼 숨기기
        $(this).hide();
    } else {
        // 한국어가 아닌 경우 번역 보기 버튼 보이기
        $(this).show();
    }
});

// 한국어 여부를 확인하는 함수 (기본적인 예시)
function isKorean(text) {
    const koreanRegExp = /[\u3131-\u3163\uac00-\ud7a3]/;
    return koreanRegExp.test(text);
}

// 원문 보기 버튼 클릭 시(게시글)
//$('.original-btn').click(function () {
//const commentId = $(this).data('comment-id'); // 댓글 ID 가져오기
//const $commentElement = $(`#comment-${commentId}`); // 댓글 요소 가져오기
//const originalText = $commentElement.data('original-text'); // 원본 텍스트 가져오기

//// 원본 텍스트로 되돌리기
//$commentElement.text(originalText);

//// '번역 보기' 버튼 텍스트로 변경하고, 원문 보기 버튼 숨기기
//$(`#btn-${commentId}`).text('번역 보기').hide();
//// '번역 보기' 버튼을 표시
//$(`#btn-${commentId}`).siblings('.translate-btn').show();
//});

// 원문 보기 버튼 클릭 시(댓글)
//$('.original-btn').click(function () {
//const commentId = $(this).data('comment-id'); // 댓글 ID 가져오기
//const $commentElement = $(`#comment-${commentId}`); // 댓글 요소 가져오기
//const originalText = $commentElement.data('original-text'); // 원본 텍스트 가져오기

//// 원본 텍스트로 되돌리기
//$commentElement.text(originalText);

//// '번역 보기' 버튼 텍스트로 변경하고, 원문 보기 버튼 숨기기
//$(`#btn-${commentId}`).text('번역 보기').hide();
//// '번역 보기' 버튼을 표시
//$(`#btn-${commentId}`).siblings('.re-translate-btn').show();
//});
});




//댓글 작성
$(document).on("click", "#commentSubmit", function (event) {
    event.preventDefault(); // 기본 제출 방지

    const commNo = $("input[name='commNo']").val();
    const memId = $("input[name='memId']").val();
    const cmmtCn = $("#cmmtCn").val();
    const groupNo = $("#modal-groupNo").val();

    if (!cmmtCn.trim()) {
        Swal.fire("오류", "댓글 내용을 입력하세요.", "error");
        return;
    }

    const formData = {
        commNo: commNo,
        memId: memId,
        cmmtCn: cmmtCn,
    };

    $.ajax({
        url: `/${groupNo}/createComment`,
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(formData),
        success: function (response) {
            if (response > 0) {
                Swal.fire("성공", "댓글이 등록되었습니다!", "success").then(() => {
                    $.ajax({
                        url: `/${groupNo}/detail`,
                        method: "GET",
                        data: { commNo: commNo },
                        success: function (res) {
                            const newComments = res.commentVOList;
                            let updatedComments = "";
                            newComments.forEach(comment => {
                                updatedComments += `
                                    <div>
                                        <div style="display: flex; align-items: center; gap: 8px;">
                                            <a class="PostHeaderView_thumbnail_wrap" href="/comm/profile?memId=${comment.memId}">
                                                <div class="ProfileThumbnailView_thumbnail_area" style="width: 35px; height: 35px;">
                                                    <div class="ProfileThumbnailView_thumbnail_wrap ProfileThumbnailView_-has_border__UG1nQ">
                                                        <div style="aspect-ratio: auto 35 / 35; content-visibility: auto; contain-intrinsic-size: 35px; width: 100%; height: 100%;">
                                                            <img src="\${comment.fileSaveLocate}" class="ProfileThumbnailView_thumbnail" width="35" height="35" alt="">
                                                        </div>
                                                    </div>
                                                </div>
                                            </a><strong>\${comment.commRegNick}</strong>
                                        </div>
                                        </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\${comment.cmmtDate}</span>
                                        <p style="margin-left:43px;padding-top:20px;"><span id="respn\${comment.cmmtNo}">\${comment.cmmtCn}</span>`;
										
                                        const commCn = comment.cmmtCn; // 게시글 내용 가져오기
                                        console.log("모달 댓글목록->commCn : ", commCn);

                                        // 한국어 확인 (예시로 간단히 'ko'를 감지)
                                        if (isKorean(commCn)) {
                                            // 한국어일 경우 번역 보기 버튼 숨기기
                                        } else {
                                            // 한국어가 아닌 경우 번역 보기 버튼 보이기
                                        	updatedComments += `<span id="re-btn\${comment.cmmtNo}" 
                                                class="re-translate-btn" 
                                                data-comment-id="post2" 
                                                data-cmmt-no="\${comment.cmmtNo}"
                                                data-cmmt-cn="\${comment.cmmtCn}"
                                                style="font-size: 12px; color: rgba(0, 0, 0, 0.5); text-decoration: underline; cursor: pointer;">
                                              <br>번역보기
                                          </span>`;
                                        }
                                            
                           updatedComments += `</p>
                                    </div>
                                    
                                    
                                `;
                            });
                            $("#commentList").html(updatedComments); // 댓글 목록 업데이트
                            $("#cmmtCn").val(""); // 입력창 초기화
                        },
                        error: function () {
                            Swal.fire("오류", "댓글 목록을 가져오는데 실패했습니다.", "error");
                        }
                    });
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
//댓글 갱신
function updateCommentCount() {
    const commNo = getCommNo(); // 현재 게시글 번호를 가져오는 함수
    const groupNo = getGroupNo(); // 현재 그룹 번호를 가져오는 함수

    fetch(`/api/${groupNo}/commentCount?commNo=${commNo}`)
        .then(response => response.json())
        .then(data => {
            // 댓글 수 갱신
            document.getElementById('commentCount').textContent = data.commentCount;
        })
        .catch(error => console.error('Error fetching comment count:', error));
}


</script>

<script>
function toggleLike(commNo, groupNo) {
    console.log("commNo : " + commNo + ", groupNo : " + groupNo);

    $.ajax({
        url: `/${groupNo}/like/` + commNo,
        type: 'POST',
        success: function(response) {
            console.log("response : ", response);

            // 피드에서 좋아요 상태에 따라 아이콘과 숫자 변경
            const feedLikeIcon = $(`#likeIcon\${commNo}`);
            const feedLikeCount = $(`#likeCount\${commNo}`);

            feedLikeIcon.attr('name', response.isLiked ? 'heart' : 'heart-outline');
            feedLikeCount.text(response.likeCount);

            // 모달 내부에서 좋아요 상태에 따라 아이콘과 숫자 변경
            const modalLikeIcon = $(`#modalLikeIcon\${commNo}`);
            const modalLikeCount = $(`#modalLikeCount\${commNo}`);

            if (modalLikeIcon.length > 0 && modalLikeCount.length > 0) {
                modalLikeIcon.attr('name', response.isLiked ? 'heart' : 'heart-outline');
                modalLikeCount.text(response.likeCount);
            }
        },
        error: function(xhr, status, error) {
            console.error("Error:", xhr.responseText);
            alert("좋아요 처리에 실패했습니다. 로그인 여부를 확인하세요.");
        }
    });
}



</script>
<body>

	<!-- 댓글 목록 -->
	<div id="comments">
		<c:forEach var="comment" items="${comments}">
			<div class="comment">
				<p id="comment-${comment.cmmtNo}"
					data-original-text="${comment.cmmtCn}">${comment.cmmtCn}</p>
				<button class="translate-btn" data-comment-id="${comment.cmmtNo}"></button>
				<button id="btn-${comment.cmmtNo}" class="original-btn"
					data-comment-id="${comment.cmmtNo}" style="display: none;">원문
					보기</button>
				<div id="translated-comment-${comment.cmmtNo}"></div>
			</div>
			<hr>
		</c:forEach>
	</div>
</body>
<script>
        function autoResize(textarea) {
            const rowCount = textarea.value.split(/\r\n|\r|\n/).length;
            if (rowCount < 4) {
                textarea.style.height = "52px"; // 최소 높이 유지
            } else {
                textarea.style.height = (rowCount * 18) + "px"; // 줄 수에 맞게 높이 설정
            }
        }
		
        $('#modal-detail').on('shown.bs.modal', function () {
            document.querySelectorAll('textarea').forEach(textarea => {
                autoResize(textarea);
            });
        });

        $(document).on('input', 'textarea', function () {
            autoResize(this);
        });

        </script>
<!-- <body> -->

<!-- 	댓글 목록 -->
<!-- 	<div id="comments"> -->
<%-- 		<c:forEach var="comment" items="${comments}"> --%>
<!-- 			<div class="comment"> -->
<%-- 				<p id="comment-${comment.cmmtNo}" --%>
<%-- 					data-original-text="${comment.cmmtCn}">${comment.cmmtCn}</p> --%>
<%-- 				<button class="translate-btn" data-comment-id="${comment.cmmtNo}"></button> --%>
<%-- 				<button id="btn-${comment.cmmtNo}" class="original-btn" --%>
<%-- 					data-comment-id="${comment.cmmtNo}" style="display: none;">원문 --%>
<!-- 					보기</button> -->
<%-- 				<div id="translated-comment-${comment.cmmtNo}"></div> --%>
<!-- 			</div> -->
<!-- 			<hr> -->
<%-- 		</c:forEach> --%>
<!-- 	</div> -->
<!-- </body> -->
<!--         게시글 수정 삭제 -->
<script>
        $(document).on("click", "#edit", function () {
            $("#spn1").hide();
            $("#spn2").show();
            $("#commCn").removeAttr("readonly");
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
                                timer: 2000,
                            }).then(() => {
                                // 비동기로 수정된 내용만 다시 로드
                                $.ajax({
                                    url: `/${groupNo}/detail`,
                                    method: "GET",
                                    data: { commNo: commNo },
                                    success: function (response) {
                                        const updatedData = response.communityVO;
                                        $("#commCn").val(updatedData.commCn); // 내용 업데이트
                                        $("#commCn").attr("readonly", true); // 수정 완료 후 다시 읽기 전용 설정
                                        $("#spn2").hide();
                                        $("#spn1").show();
                                    },
                                    error: function () {
                                        alert("수정된 데이터를 가져오는 데 실패했습니다.");
                                    },
                                });
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
         // 삭제 버튼 클릭 -> AJAX 요청
            $(document).on("click", "#delete", function () {
                const groupNo = $("input[name='groupNo']").val(); // 그룹 번호
                const commNo = $("input[name='commNo']").val(); // 게시글 번호

                Swal.fire({
                    title: "삭제하시겠습니까?",
                    text: "삭제 후에는 복구할 수 없습니다",
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
                                        window.location.href = `/${groupNo}/feed`; // 성공 시 피드로 이동
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

        </script>
    <!-- 로그인한 회원 정보 -->
    <div>
        로그인한 회원아이디: <c:out value="${sessionScope.memId}" />
    </div> 


<script>
        function autoResize(textarea) {
            const rowCount = textarea.value.split(/\r\n|\r|\n/).length;
            if (rowCount < 4) {
                textarea.style.height = "52px"; // 최소 높이 유지
            } else {
                textarea.style.height = (rowCount * 18) + "px"; // 줄 수에 맞게 높이 설정
            }
        }
		
        $('#modal-detail').on('shown.bs.modal', function () {
            document.querySelectorAll('textarea').forEach(textarea => {
                autoResize(textarea);
            });
        });

        $(document).on('input', 'textarea', function () {
            autoResize(this);
        });

        </script>
<script>
    // 닉네임 변경 모달 열기
    function openNicknameChangeModal() {
        document.getElementById('nicknameChangeModal').style.display = 'flex';
    }

    // 닉네임 변경 모달 닫기
    function closeNicknameChangeModal() {
        document.getElementById('nicknameChangeModal').style.display = 'none';
    }

    // 닉네임 저장 로직
    function saveNickname() {
        const newNickname = document.getElementById('newNickname').value;
        const memId = '${sessionScope.memId}'; // 세션에서 memId 가져오기

        if (newNickname.trim() === '') {
            alert('닉네임을 입력해주세요.');
            return;
        }
		
        var groupNo = ${groupNo};
        // AJAX 요청
        $.ajax({
            url: '/' + groupNo + '/updateNickname',  // 서버로 요청을 보낼 URL
            type: 'POST',
            data: { 
                memId: memId,  // memId 추가
                newNickname: newNickname 
            },
            success: function(response) {
                if (response.message === '닉네임이 성공적으로 변경되었습니다.') {
                    alert('닉네임이 변경되었습니다: ' + newNickname);
                    location.reload(); // 페이지 새로 고침
                } else {
                    alert('닉네임이 변경되었습니다. 바뀐 닉네임 : ' + newNickname);
                    location.reload();
                }
                closeNicknameChangeModal();
            },
            error: function() {
                alert('서버와의 통신 오류가 발생했습니다.');
                closeNicknameChangeModal();
            }
        });
    }
 </script>
 <script>
    // 프로필 사진 변경 모달 열기
    function openPhotoChangeModal() {
        document.getElementById('photoChangeModal').style.display = 'flex';
    }

    // 프로필 사진 변경 모달 닫기
    function closePhotoChangeModal() {
        document.getElementById('photoChangeModal').style.display = 'none';
    }

    // 사진 업로드 처리
    function uploadPhoto() {
        var formData = new FormData();
        var fileInput = document.getElementById('newProfilePhoto');
        var file = fileInput.files[0];

        if (!file) {
            alert('사진을 선택해주세요.');
            return;
        }

        var memId = '${sessionScope.memId}';  // 세션에서 memId 가져오기

        formData.append('memId', memId);
//         formData.append('groupNo', groupNo);
        formData.append('profilePhoto', file);
	
        var groupNo = ${groupNo};
        $.ajax({
            url: '/' + groupNo + '/uploadProfilePhoto',  // 서버에서 처리할 URL
            type: 'POST',
            data: formData,
            processData: false,  // 필수: 파일 데이터를 처리하도록 설정
            contentType: false,  // 필수: 자동으로 Content-Type을 설정하지 않음
            success: function(response) {
                if (response.message === '사진이 성공적으로 업로드되었습니다.') {
                    alert('프로필 사진이 변경되었습니다.');
                    location.reload();  // 페이지 새로 고침
                } else {
                    alert('프로필 사진이 변경되었습니다. ');
                    location.reload();  // 페이지 새로 고침

                }
                closePhotoChangeModal();
            },
            error: function() {
                alert('서버와의 통신 오류가 발생했습니다.');
                closePhotoChangeModal();
            }
        });
    }
</script>



 

        <!-- 포스트 섹션 -->
        

<!-- Footer Include -->
<jsp:include page="../include/footer.jsp"></jsp:include>
