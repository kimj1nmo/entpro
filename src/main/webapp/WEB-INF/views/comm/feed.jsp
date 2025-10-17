<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- 헤더 포함 -->
<jsp:include page="../include/header_user2.jsp"></jsp:include>
<jsp:include page="../include/nav.jsp"></jsp:include>
<link href="/directlyCss/join.css" rel="stylesheet">
<link href="/directlyCss/commaside.css" rel="stylesheet">
<link href="/directlyCss/main.css" rel="stylesheet">
<link href="/directlyCss/modal.css" rel="stylesheet">
<link href="/directlyCss/commdetailmodal.css" rel="stylesheet">


<!-- Bootstrap CSS (필요 시 유지) 
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">-->
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

<!-- 위버스에 포스트를 남겨보세요 -->
<link href="/directlyCss/main.css" rel="stylesheet">

<style>
.CommunityAsideNoticeView_notice_item__AyoXb {
    margin-left: 50px; /* 부모 요소의 왼쪽 여백 추가 */
}
.use-webfont body, .use-webfont button, .use-webfont input, .use-webfont select, .use-webfont table, .use-webfont textarea {
    font-family: Pretendard, -apple-system, BlinkMacSystemFont, Helvetica, Arial, sans-serif;
}
.CommunityAsideNoticeView_notice_list__Adcja {
    margin-top: 13px;
    
}
.CommunityAsideNoticeView_more_link__Mkv\+s {
    margin-left: auto;
    padding: 5px 6px;
}
.CommunityAsideNoticeView_title_wrap__iTVo3 {
    align-items: center;
    display: flex
;
    font-size: 16px;
    line-height: 19px;
    padding: 0 17px 0 19px;
}
a, a:active, a:focus, a:hover {
    cursor: pointer;
    text-decoration: none;
}
a {
    color: inherit;
}
user agent stylesheet
a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
}
.use-webfont body, .use-webfont button, .use-webfont input, .use-webfont select, .use-webfont table, .use-webfont textarea {
    font-family: Pretendard, -apple-system, BlinkMacSystemFont, Helvetica, Arial, sans-serif;
}
body, button, input, select, table, textarea {
    font-family: -apple-system, BlinkMacSystemFont, Helvetica, Arial, sans-serif;
    font-size: 13px;
}
html {
    -webkit-text-size-adjust: none;
}
.CommunityAsideNoticeView_more_link__Mkv\+s:before {
    background: no-repeat url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAcCAYAAAB75n/uAAAACXBIWXMAABYlAAAWJQFJUiTwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAANBSURBVHgBhVaxThtBEJ1ZDAXIiokEFVR0UCR8AIqiUKSlQCC+ASkNIh021HShRKIFueADEgj8ARTQUVG6sCNXlnXezFvvrMaLD490t3t7t+/NvJ2dWyIx7z1Lw9Likc3lGo2GQ6uXPqPd3t6e0u9wGZyE4WInIMd+aAVA+yR9yg1ja2tr3o4x80hLkdlnE8PbpaWl2uXlZX11dbWOvnjlcyJ59pmD1slgU0NCdnd3d6GDQfT39vZ+OueO5PHLzMzMdxlrHh4e9qRlkYafn5/VQQuIyDFfJfLQzXqS5BAub0L/tLCwcHN+fv5BwKnZbBJIbBQ+LmBm7OC0ygJwJWi1Wr9kzqMlqVart+vr6zU8C0kAfHp64viecwnB6ajE7u/vO0LyTboPlmRlZeXm7OysphErUZSHrZPHx8dBc8jk2S798GMsKl9fX1f7/f5fGftsPHsE+f7+fidKliSmLGk0h8m8dKaP94WQ1MaRvL6+bh4cHLSz+ckQicvST1MugMM72NbWVmd6evprLtfy8vKf09PT+QimDrFJgOEApMBiYeNEMtZsQQQKWhaJyoVnI9lYiey4flzYF5NIjGMekTgNxUoVpfHxwxErkwv7BNml4LhBkRSBSS/OMAsaY+MiGQwGJ7u7uyeRAJtv4Or1OimBRmyiKLVOp1P6LmL5tA9AEne0flO6BrCLi4va3Nzc2HXABjXSDoI8UriSLBoRLF8DAZ4IHiNIqY4fB0lJTrVKyeC9lQngEuV8GbhkUFudUiUAWhGP8zJhvfcWfHZ29pbK05PjDyjsLZk/AC7LyrPU/RECfKz1RcCLSeA6RKYSaIUW7LTPPPRXcPQrlUqp5y8vLxYcxkZShjKpVNDb3KednR3e2NiYX1xc/F3meay4RFkltSU7EWj2SO6GTJJCVsMPBrvUgD8I+GZcUJvKFGUhJdC2Eljk94hNoUAgkR/+jxy82+3C839aLWG2sFnwpFWcrImUJl5dXR3JWF3BRfPNXq/XBvl7htSEs7qbSTNJpYpMTn7wH4WkgQt9Gj14sT2Q2cMYnLUHLxQo6O8iMOszmdMcxouisONaJDk/+UXwoIb23xz3zOWy/tijpEZlrxgJ/QcuW1gjt6f3YAAAAABJRU5ErkJggg==) 0 0 / contain;
    content: "";
    display: block;
    height: 14px;
    width: 12px;
}
.scrollbar-custom ::-webkit-scrollbar {
    width: 15px;
}
.scrollbar-custom ::-webkit-scrollbar-corner, .scrollbar-custom ::-webkit-scrollbar-track {
    background-color: #0000;
}
.scrollbar-custom ::-webkit-scrollbar-thumb {
    background-clip: padding-box;
    background-color: #6666;
    border: 4px solid #0000;
    border-radius: 8px;
    border-right-width: 3px;
}
.scrollbar-custom ::-webkit-scrollbar-corner, .scrollbar-custom ::-webkit-scrollbar-track {
    background-color: #0000;
}
--scrollBarColor {
    syntax: "<color>";
    inherits: true;
    initial-v
    }
.CommunityAsideNoticeView_title_wrap__iTVo3 {
    align-items: center;
    display: flex
;
    font-size: 16px;
    line-height: 19px;
    padding: 0 17px 0 19px;
}
a, a:active, a:focus, a:hover {
    cursor: pointer;
    text-decoration: none;
}
a {
    color: inherit;
}
user agent stylesheet
a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}
.use-webfont body, .use-webfont button, .use-webfont input, .use-webfont select, .use-webfont table, .use-webfont textarea {
    font-family: Pretendard, -apple-system, BlinkMacSystemFont, Helvetica, Arial, sans-serif;
}
body, button, input, select, table, textarea {
    font-family: -apple-system, BlinkMacSystemFont, Helvetica, Arial, sans-serif;
    font-size: 13px;
}
html {
    -webkit-text-size-adjust: none;
}
.CommunityAsideNoticeView_title_wrap__iTVo3:before {
    background: no-repeat url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAABYlAAAWJQFJUiTwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAMLSURBVHgB7ZnNThNRFMf/Z1ooJn6wIBjiwrLRjYkFoyHoYngC4AmAXV1Rn6DlDWAliRt4AvUJrAsTEhagboybzo7E+FGoSmHaOZ47tNgyMwXbTucS+0tu7tyPJuc/99zbc88Affr83xA0g3dgwsGcWLbgdhBWaQIrQfO1ECBGD0u1DMai1EnPhCpm6CHyfr+NIyJqRi+I0XNSzJaTDXc87zfUcwGuizCyUlLSHEaH9ERAk19z50Y3EpqAJr9m8euQdltXBfyTX3eJrgiouchyzeiuush5XFgAZ8zhSrmSYjhJ1TZGSsXY/Efz1K8jOpDPFWCnn5gEzlbLx6aysW4n2XFLGklETKAA9carZfsl4JjQGF8Bynjn6PiNPKagA78Tsq+OfIcMv07n0M4ya2K84HwaXa6kpwuVp48Xzo55BBymp5JMnIF+JMG8UU1PZxs7PQJioBw0hoGcnZ4y622vAKb70BwCna6CRwCTPr4fCNOpjQYuI/T3395HAFvQHGLs1p+9Aoh2oTls0Gr92bsH2FmD3ljx5+826w2PgIH1rbzIyENLOB8bGpxo7PENJWzw0gDTTuNmiRK6efDKgbN28nKb8T2FrqxvWY5jz+iyoenW/ns/4xWBx+jgi+1dWYkZB7wJjWl5H1ArIdWixEe5GAx1H0iJ4htqjCtxQimRxLUjREnb9ygV9A3AKNDYAejuF9Dt70CiglBgrNAD5PyGOr4T8951tyjojghJ/pDyDb2iu1mJz6NuUW5FY/uge3ugkV8Ik3DyQqUEuFQTM/JzMzb/oSjOOgt0/w4dejDHX69a4r8ZmsS4StJKlzrViugSPc2N1jLMqqhc0qLkkmZlZebQAZGF05Lz35CVmRcB41KWpCs4iDRQCB6KGBFiuWImMeGKYahg0mqYooS9Dvp9ZN8H/FBipFIJhQxvu2n4Ij1Cy/BeKwGNBH2ROcvlvFI20LaAofLQhY5CIiogRNoWQBv5Ip9suFZYMa6+RYh0nBS309M5gzEr2bzmy49cvGPEz+gkou3Tp09I/AFIDffIdJ/LNQAAAABJRU5ErkJggg==) 0 0 / contain;
    content: "";
    height: 24px;
    margin-right: 12px;
    width: 24px;
}
.scrollbar-custom ::-webkit-scrollbar {
    width: 15px;
}
.scrollbar-custom ::-webkit-scrollbar-corner, .scrollbar-custom ::-webkit-scrollbar-track {
    background-color: #0000;
}
.scrollbar-custom ::-webkit-scrollbar-thumb {
    background-clip: padding-box;
    background-color: #6666;
    border: 4px solid #0000;
    border-radius: 8px;
    border-right-width: 3px;
}
.scrollbar-custom ::-webkit-scrollbar-corner, .scrollbar-custom ::-webkit-scrollbar-track {
    background-color: #0000;
}
--scrollBarColor {
    syntax: "<color>";
    inherits: true;
    initial-value: #0000;
}
.CommunityAsideNoticeView_container__cC227 {
    background: #f7f7fa;
    border-radius: 14px;
    padding: 18px 0 20px;
    position: relative;
}
user agent stylesheet
div {
    display: block;
    unicode-bidi: isolate;
}
.use-webfont body, .use-webfont button, .use-webfont input, .use-webfont select, .use-webfont table, .use-webfont textarea {
    font-family: Pretendard, -apple-system, BlinkMacSystemFont, Helvetica, Arial, sans-serif;
}
body, button, input, select, table, textarea {
    font-family: -apple-system, BlinkMacSystemFont, Helvetica, Arial, sans-serif;
    font-size: 13px;
}
html {
    -webkit-text-size-adjust: none;
}
.scrollbar-custom ::-webkit-scrollbar {
    width: 15px;
}
.scrollbar-custom ::-webkit-scrollbar-corner, .scrollbar-custom ::-webkit-scrollbar-track {
    background-color: #0000;
}
.scrollbar-custom ::-webkit-scrollbar-thumb {
    background-clip: padding-box;
    background-color: #6666;
    border: 4px solid #0000;
    border-radius: 8px;
    border-right-width: 3px;
}
.scrollbar-custom ::-webkit-scrollbar-corner, .scrollbar-custom ::-webkit-scrollbar-track {
    background-color: #0000;
}
--scrollBarColor {
    syntax: "<color>";
    inherits: true;
    initial-value: #0000;
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
	/*     background-color: #f9f9f9; /* 배경색 설정 */
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
    border-radius: 30px; /* 모서리 둥글게 */
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
/*     gap: 5px; /* 위아래 요소 간 간격 */
}

.comment-date{
	opacity: .6;
}

.post-text{
	 background-color:white; 
	 border:none; 
	 overflow:hidden; 
	 resize:none;
	 
}
.post-text:focus{
	 outline: none; /* 포커스 테두리 제거 */
}

.col-sm-6{
padding:0px;
}
.BadgeView_badge__sSoG5.BadgeView_-artist__jr7QG {
  background: no-repeat url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAABYlAAAWJQFJUiTwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAOCSURBVHgBjVW9T1RBEJ/Z9/g6IDm8AwPVvdoGK0vBWpOTSiv0H5CzkwqI1AL2Rq2wvIIYG8mVxop/QO9CgpdYnXAXDvB2nNl9H7uPM/peXvbt7uxvZn7zsQh/eVba3zZAwyb/toBgSweqUZ+PWrJXbTaLahzWkKCqCRYJ4Xl9IdodhoPDFqvtZkVp3bQSIkLy10HAIwYs8n+FN2Q0OyzRoUuI6lHUyWOpYQrCAax5FrCJRFjUhEu8sijglKg126xsFGrDsK4pEPe1oqqBZuszILTa4g/RmZDM1eo/FRhuR/UOH6iYc9ZySxOi45NVnK6jAqauUv1xvJNXgCkwB42lanygSEQOoCeaeeOOlMkQUIuDvwXBCCfFfAtX2s0NNrNGNnipIMb0eOdlHdCZu8COIfGEAlXDhyffKW+laz15ieZ7JXtTSsGt0TH42u9bXHLOIHQUW9q5xquVM4IIPveZxQhzQQivyjdhfaYE9yen7Bl0jCRoKY1qN8kWSwvGFjhKTS74igR8uzTLY2BWfw4G6R5nFEgYFdGegr7eAykis5i31qUq82qWQV3w150OfOlfeEYJM52rq7qS6uNDLS9I/NwZn4AC+t7IN8mcr98opeB7DP75/Nw7G1N41GDsuA44DpRZvlyYghczZdguz3EQgzRDBHy7VIYoHEnBD8/7aUzI8RRA/zLkSt/hcSmpXHl6WptRgF4y4CTTV1CBB/7m9DQGT2x24mY0BHeXuL6w2j5+wqF/S7FQUmT3JgrwrDhjDjd/X5ndKAzNfP+sC/vdbo4WAHs0VmCWsRayPxsUF4cWRyXY/B4yr5Ipj6anU6t98CSBTfWmuZ+lulmvhgSqkrppwGNP+BMgmT9mJRl4D7K24Y7oOINJ0S2FnJqb/LeJacaA1wo+nPU4xzX02G+bijlarAJCSlxK2wanfrBpm127XRkMBlVUSu6BSmohmcqkzDZ0PCTw0xLiti0ZSXvdy+6upGm+ZcKDk/Y7Flr1O6qNkdVk1zRbLZWJGd8i8L53eVZrODfbNQXmwhkrNFlBkZLbEjEnmu+oZt76uFCO8njXbjSpbE3cPhC93AaxOKYNUppkLd7XfAcMeYbfyZfju5QUTNa6uTKDI45Tw8TGKsHEGx1cNf5bQT2akUBtyVXIAA1QQS286EYHC6XbB/Pl5REVRkzfU6Eljs/WJ769hmH9AYN+hN+wHMHTAAAAAElFTkSuQmCC) 0 0 / contain;
  height: 13px;
  width: 13x;
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
<!-- Main Content -->
<section class="content" style="max-width: 1140px; margin: 0 auto;">
	<div class="container-fluid">
		<div class="row">
			<div class="col-8">
				<%-- <p>로그인:${user.memId}</p> --%>
				<!-- SweetAlert 등록 버튼 -->
				<c:choose>
                    <c:when test="${not empty artistBirth}">
				<div class="post-input-wrapper">
					<div class="post-button" onclick="createModal()">
						<div class="editorthumbnail-area" style="padding: 10px;">
							<div class="Profilethumbnail-area"
								style="border-radius: 50%; position: relative;">
								<div class="Profilethumbnail-wrap">
									<div class="profile-thumbnail">
										<img
											src="https://cdn-v2pstatic.weverse.io/wev_web_fe/p/2_31_1/public/static/media/icon_empty_profile.b0996808ea97350978a4.png"
											class="ProfilethumnailView" width="46" height="46"
											style="object-fit: cover; border-radius: 50%;"
											alt="Profile Thumbnail">
									</div>
								</div>
							</div>
						</div>
						
                    	
                    
                    <em class="input-placeholder">위버스에 포스트를 남겨보세요. </em>
					</div>

					<div class="attachment-area">
						<label for="photo-input" class="attachment-button photo">
							<span class="blind">Attach photo</span> <input id="photo-input"
							type="file" multiple accept="image/*" class="blind">
						</label> <label for="video-input" class="attachment-button video">
							<span class="blind">Attach video</span> <input id="video-input"
							type="file" multiple accept="video/mp4, video/*" class="blind">
						</label>
					</div>
				</div>
				<br />
				</c:when>
                    <c:otherwise></c:otherwise>
                </c:choose>

				<!-- CSRF 토큰 포함 -->
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <input type="hidden" name="groupNo"
					value="${groupNo}" />

				<!-- 로그인 테스트
		<c:if test="${empty loginUser}">
			<p>로그인하세요</p>
		</c:if>
		 -->

				<!-- 페이지별 콘텐츠는 여기 삽입 -->
				<!-- 		등록 페이지
		<div class="col-12 justify-content-right">
			<a href="/${groupNo}/create" class="btn btn-primary">등록.jsp</a>
		</div>
 -->

				<div class="timeline">
					<!-- timeline item -->
					<c:forEach var="communityVO" items="${communityVOList}" varStatus="stat">
					 <c:set var="isReported" value="false" />
					    <c:forEach var="report" items="${communityreport}">
					        <!-- communityVO와 report의 commNo를 비교 -->
					        <c:if test="${report.commNo == communityVO.commNo}">
					            <c:set var="isReported" value="${report.COMMREPORTYN == 1}" />
					        </c:if>
					    </c:forEach>
						<div>
							<div>
<%-- 							${communityreport} --%>
								<a href="/${groupNo}/profile2?memId=${communityVO.memId}"> <img
									class="img-circle img-bordered-sm"
									style="cursor: pointer; height: 40px; width: 40px;"
									<%-- 		                           data-file-save-locate="${commufileDetailVO.fileSaveLocate}" --%>
		                           src="${communityVO.proSaveLocate}"
									alt="${fileDetailVO.fileOriginalName}"
									title="${fileDetailVO.fileOriginalName}" /></a> <a
									href="/${groupNo}/profile2?memId=${communityVO.memId}"
									style="font-weight: bold; font-size: 17px;">${communityVO.commRegNick} </a>
									<em class="BadgeView_badge__sSoG5 BadgeView_-artist__jr7QG"></em>
							</div>
							                      <!-- 더 보기 버튼-->
                      <div class="PostHeaderView_button_item PostHeaderView_menu">
                      <div>
                          <!-- 더보기 버튼 -->
                          <button type="button" class="MoreButtonView_button_menu">
                              <span class="blind">Show More Content</span>
                          </button>

                          <!-- 드롭다운 옵션 리스트 -->
                          <ul class="DropdownOptionListView_option_list DropdownOptionListView_dropdown-action" 
                              role="listbox" 
                              data-use-placement="true" 
                              data-placement="top">
                               <!-- 수정하기 옵션 (작성자 또는 관리자만 가능) -->
						    <c:if test="${loginUser.memId eq communityVO.memId or loginUser.memId eq 'f001'}">
						        <li class="DropdownOptionListView_option_item" role="presentation">
						            <button id="edit" style="border:none; background-color:transparent;" 
						                    class="ContentMetaActionLayerView_button_item ContentMetaActionLayerView_copy">
						                수정하기
						            </button>
						        </li>
						        <!-- 삭제하기 옵션 -->
						        <li class="DropdownOptionListView_option_item" role="presentation">
						            <button id="delete" data-commno="${communityVO.commNo}" 
						                    style="border:none; background-color:transparent; color:red;" 
						                    class="ContentMetaActionLayerView_button_item ContentMetaActionLayerView_copy">
						                삭제하기
						            </button>
						        </li>
						    </c:if>
                               <c:if test="${loginUser.memId ne communityVO.memId}">
					        <li class="DropdownOptionListView_option_item" role="presentation">
					            <button id="report" data-commno="${communityVO.commNo}" 
					                    style="border:none; background-color:transparent;" 
					                    class="ContentMetaActionLayerView_button_item ContentMetaActionLayerView_copy">
					                신고하기
					            </button>
					        </li>
					    </c:if>
                          </ul>
                      </div>
                  </div>

							<div class="timeline-item" style="margin-bottom:5px;">
								<%-- 								<a href="/${communityVO.groupNo}/detail?commNo=${communityVO.commNo}"> --%>
								<a href="#" class="viewDetail"
   data-groupno="${communityVO.groupNo}"
   data-commno="${communityVO.commNo}"
   <c:if test="${isReported}">data-disabled="true"</c:if>>
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
										<c:choose>
                    <c:when test="${isReported}">
                        <p >신고 처리된 게시글입니다</p>
                    </c:when>
                    <c:otherwise>
                        <p id="pCommCn${communityVO.commNo}">${communityVO.commCn}</p>
                    </c:otherwise>
                </c:choose>
								</a>
								<!-- 번역보기 버튼 -->
								<span id="btn-post${communityVO.commNo}" class="translate-btn"
									data-comment-id="post" data-commno="${communityVO.commNo}"
									data-comm-cn="${communityVO.commCn}"
									style="font-size: 12px; color: rgba(0, 0, 0, 0.5); text-decoration: underline; cursor: pointer;">
									번역 보기 </span>
								<p>${communityVO.commWriteDate}</p>
								</div>
							</div>
							<div class="likecomment"
								style="display: flex; margin-left: 60px; align-items: center; gap: 10px;">
								<!-- 좋아요 버튼 및 좋아요 수 -->
								<button id="likeButton${communityVO.commNo}"
									onclick="toggleLike(${communityVO.commNo}, ${communityVO.groupNo})"
									style="border: none; background: none; padding: 0; margin: 0; cursor: pointer;  display: flex; align-items: center; gap: 5px;">
									<ion-icon id="likeIcon${communityVO.commNo}"
										name="${communityVO.isLiked == 1 ? 'heart' : 'heart-outline'}"
										style="font-size: 20px;"></ion-icon>
									<span id="likeCount${communityVO.commNo}">${communityVO.likeCount}</span>
								</button>
								<div class="comment">
									<button type="button" class="commentbutton"
										style="border: none; background: none; padding: 0; margin: 0; cursor: pointer;  display: flex; align-items: center; gap: 5px;">
										<ion-icon name="chatbubble-outline"
											style="font-size: 20px; color: #444;"></ion-icon>
										<span>${communityVO.commentCount}</span>
									</button>
								</div>
							</div>


						</div>
					</c:forEach>
					<!-- END timeline item -->
				</div>
				<!-- /Contact Section -->
			</div>
			<div class="col-4">
				<aside>
					<!-- 커뮤니티 아이돌 사진 -->
					<div class="group-picture">
						<div class="CommunityAsideView_aside_item__zFpbM">
							<div class="CommunityAsideWelcomeView_container__7vDI1">
								<div class="CommunityAsideWelcomeView_thumbnail_wrap__zIXgw">
									<div
										style="aspect-ratio: auto 353/301; content-visibility: auto; contain-intrinsic-size: 353px 301px;">
<%-- 										<c:forEach var="community" items="${communityVOList}" varStatus="status"> --%>
<%-- 										 <c:if test="${status.first}"> --%>
										<img src="${groupsVO.fileGroupVO.fileDetailVOList[0].fileSaveLocate}"
											class="CommunityAsideWelcomeView_thumbnail__5MVun"
											 witdh="353" height="301" alt="" style="width: 100%; height: 100%; object-fit: cover" />
<%-- 											 </c:if> --%>
<%-- 											</c:forEach> --%>
									</div>
									<!-- 					<div class="CommunityAsideWelcomeView_gradation__mcle5" style="background-color: rgb(10, 132, 255);"></div> -->
									<div class="CommunityAsideWelcomeView_gradation__mcle5"
										style="background-color: rgb(10, 132, 255);"></div>
								</div>
								<div class="CommunityAsideWelcomeView_info__PMqc+">
									<!-- 커뮤니티 가입자 수 -->
									<div class="CommunityAsideWelcomeView_member__25inr">
										 </div>
									<!-- 그룹 소개로 이동 버튼 -->
									<a href="/${groupNo}/artist"
										class="CommunityAsideWelcomeView_community__X1fga">
										<div class="MarqueeView_container__l4V1r">
											<!-- 그룹명 텍스트 출력 -->
											<div class="MarqueeView_content__2Qs2H">${groupsVO.groupName}</div>
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
					<c:if test="${!isMembershipActive}">
						<div class="CommunityAsideView_aside_item__zFpbM">
							<div class="CommunityAsideMembershipView_membership__zqNyr">
								<strong class="CommunityAsideMembershipView_title__Qskzy">
									<em
									class="BadgeViewV2_badge__Lz-qv BadgeViewV2_-membership_icon__5uf-z BadgeViewV2_-size_20__i-2Jy">
										<span class="blind">Membership Only Content</span>
								</em>Membership
								</strong>
								<p class="CommunityAsideMembershipView_join_text__NX6P6">지금
									멤버십에 가입하고 특별한 혜택을 누려보세요.</p>
								<button style="border: 0;"
									class="CommunityAsideDigitalMembershipView_button__SQ-EO"
									type="button" data-toggle="modal"
									data-target="#modal-membership">멤버십 가입하기</button>
							</div>
						</div>
						</c:if>

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
					<div class="user" style="margin-top: 20px;">
						<div class="CommunityAsideView_aside_item__zFpbM">
							<div
								style="aspect-ratio: auto 353/171; content-visibility: auto; contain-intrinsic-size: 353px 171px;">
								<a
									href="http://localhost/${groupNo}/profile?memId=${sessionScope.memId}"
									class="CommunityAsideMyProfileView_community_profile__2Yw1A">
									<div
										class="CommunityAsideMyProfileView_profile_thumbnail__g9xan">
										<div class="ProfileThumbnailView_thumbnail_area__u25Uf"
											style="width: 64px; height: 64px;">
											<div class="ProfileThumbnailView_thumbnail_wrap__ZgeTf">
												<div
													style="aspect-ratio: auto 64/64; content-visibility: auto; contain-intrinsic-size: 64px; width: 100%; height: 100%;">
													<img
														 src="${pageContext.request.contextPath}${fileSaveLocate}"
														class="ProfileThumbnailView_thumbnail__8W3E7" width="64"
														height="64" alt="">
												</div>
											</div>
										</div>
									</div>
									<div class="CommunityAsideMyProfileView_profile_name__GBKth">
										<strong class="CommunityAsideMyProfileView_name_text__2hNks">
											${commRegNick != null ? commRegNick : '닉네임 없음'} 
											 <c:if test="${isMembershipActive}">
            <em class="BadgeViewV2_badge__Lz-qv BadgeViewV2_-membership_icon__5uf-z BadgeViewV2_-size_20__i-2Jy"
                style="width: 18px; height: 18px; display: inline-block;">
                <span class="blind">Membership Only Content</span>
            </em>
        </c:if>
        </strong>
									</div>
									</a>
									<div class="profile-section">

</div>
<br>
<!-- 그룹 공지사항  -->
<div class="CommunityAsideView_aside_item__zFpbM">
<div style="aspect-ratio: auto 353 / 61; content-visibility: auto; contain-intrinsic-size: 353px 61px;">
<div class="CommunityAsideNoticeView_container__cC227">
<a href="/lesserafim/notice" class="CommunityAsideNoticeView_title_wrap__iTVo3">
<strong class="title_text">커뮤니티 공지사항</strong><span class="CommunityAsideNoticeView_more_link__Mkv+s">
<span class="blind">see more</span></span></a>
<ul class="CommunityAsideNoticeView_notice_list__Adcja">
<li class="CommunityAsideNoticeView_notice_item__AyoXb">
<a href="/lesserafim/notice/2561" class="CommunityAsideNoticeView_notice_link__ZhLSV">[NOTICE] LE SSERAFIM 팬레터 및 서포트 관련 안내 (+ENG/JPN)</a></li></ul></div></div></div>
							</div>
						</div>

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
		</div>
	</div>
</section>

<!-- 모달 -->
<!-- 첫 번째 모달 -->
<div class="modal fade" id="modal-membership" tabindex="-1"
	role="dialog" aria-labelledby="modalMembershipLabel" aria-hidden="true">
	<div class="modal-dialog" role="document" style="display: flex;
    justify-content: center; /* 가로 중앙 정렬 */
    align-items: center; /* 세로 중앙 정렬 (필요 시 추가) */
    min-height: 100vh; /* 화면 전체 높이 기준 정렬 */">
		<div class="modal-content" style="height:0; min-height: 600px; width: 520px; left-margin:1000px;">
			<div class="DigitalMembershipSubscribeModalView_header__wEixT">
<!-- 				<h3 class="DigitalMembershipSubscribeModalView_title__XtfS+">디지털 멤버십</h3> -->
				<button class="DigitalMembershipSubscribeModalView_close__GjhEU"
					type="button" style="border: 0; background-color: transparent;">
					<span class="blind">Close</span>
				</button>
			</div>
			<div class="modal-body">
			   <!-- Hidden Inputs -->
			    <input type="hidden" name="groupNo" value="${groupNo}">
			    <input type="hidden" name="memId" value="${loginUser.memId}">
			    <input type="hidden" name="memshipNo" value="${getMembershipList[0].MEMSHIPNO}">
				<div class="DigitalMembershipSubscribeModalView_digital_membership_info__o8nfd">
					<h4 class="DigitalMembershipSubscribeModalView_digital_membership_name__ftt-g">
						${groupName}</h4>
						
						<c:forEach var="membership" items="${getMembershipList}">
					<div
						class="DigitalMembershipSubscribeModalView_digital_membership_text__61uyL">${membership.MEMSHIPNM}</div>
					<strong class="DigitalMembershipSubscribeModalView_price__P0SSx"><span
						class="blind">Jelly</span>${membership.MEMSHIPAMOUNT} <span
						class="DigitalMembershipSubscribeModalView_per_month__yZo4s">/
							월</span></strong>
							</c:forEach>
				</div>
				<div>
					<h4
						class="DigitalMembershipSubscribeModalView_benefit_title__tTy0c">디지털멤버십
						혜택</h4>
					<p
						class="DigitalMembershipSubscribeModalView_benefit_description__--ED8">디지털
						멤버십에 가입하고 다양한 혜택을 즐겨보세요.</p>
					<ul class="DigitalMembershipSubscribeModalView_benefit_list__CGQYA">
						<li class="DigitalMembershipSubscribeModalView_benefit__Iitmp"><div
								class="DigitalMembershipBenefitView_item__r0VMI">
								<div class="DigitalMembershipBenefitView_image_wrapper__nm07V">
									<div style="aspect-ratio: auto 48/48;">
										<img
											src="https://weverse-phinf.pstatic.net/MjAyNDEyMDZfMjQ0/MDAxNzMzNDYzMDM0NDgz.dKyVWDS4UJg-sgfkgDeNT9vY4wOysn1V53GsAczISnUg.RNyOmyaw_aNc_mVcSwAIkNGXYv3S7sbxUc0GlU6ssNQg.PNG/5409840952303210008b7c06f-330f-4df1-bef0-7feb7b702f41.png?type=s100"
											class="DigitalMembershipBenefitView_image__eUU1d" width="48"
											height="48" alt="배지 지급">
									</div>
								</div>
								<div>
									<strong class="DigitalMembershipBenefitView_title__1JnEB">배지
										지급</strong>
									<p class="DigitalMembershipBenefitView_description__hUy0w">디지털
										멤버십 구독 인증 배지 제공</p>
								</div>
							</div></li>
						<li class="DigitalMembershipSubscribeModalView_benefit__Iitmp"><div
								class="DigitalMembershipBenefitView_item__r0VMI">
								<div class="DigitalMembershipBenefitView_image_wrapper__nm07V">
									<div style="aspect-ratio: auto 48/48;">
										<img
											src="https://weverse-phinf.pstatic.net/MjAyNTAxMDJfMjc5/MDAxNzM1ODEwODEyNDY5.AVnJr2Egprd8E8O6N7Y1OPnhd79tyb-F5ghqBBWRx3Mg.hjkuyY7dBXubwwkI3gof-pV0IecTX5HApdbnJGSyiwMg.PNG/37784408523377977db1f0c93-cff1-4c77-9575-74207823d64a.png?type=s100"
											class="DigitalMembershipBenefitView_image__eUU1d" width="48"
											height="48" alt="멤버십 전용 콘텐츠 조회">
									</div>
								</div>
								<div>
									<strong class="DigitalMembershipBenefitView_title__1JnEB">멤버십
										전용 콘텐츠 조회</strong>
									<p class="DigitalMembershipBenefitView_description__hUy0w">멤버십
										전용으로 등록된 콘텐츠 조회 가능</p>
								</div>
							</div></li>
					</ul>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-block btn-light"
					id="start-subscription">가입하기</button>
			</div>
		</div>
	</div>
</div>

<!-- 두 번째 모달 -->
<div class="modal fade" id="modal-membership2" tabindex="-1"
	role="dialog" aria-labelledby="modalMembershipLabel2"
	aria-hidden="true">
	<div
		style="display: flex; justify-content: center; align-items: center; top: 0; bottom: 0; left: 0; right: 0; padding: 30px;">
		<!-- 	<div id="modal-membership2" -->
		<!-- 		class="ReactModal__Content ReactModal__Content--after-open BaseModalView_modal__wjtT1" -->
		<!-- 	tabindex="-1" role="dialog" aria-label="modalMembershipLabel2" -->
		<!-- 	aria-modal="true"> -->
		<div class="BaseModalViewContent BaseModalView_content__ipny1"
			style="width: 428px; border-radius: 14px;">
			<div class="JellyOrderModalLayoutView_modal_inner__RoNcU">
				<strong class="JellyOrderModalLayoutView_title__rLXTY">젤리
					정기 구독</strong>
				<div class="JellyOrderModalLayoutView_content__mXNj9">
					<dl class="JellySubscriptionModalView_info_list__yU7GO">
						<dt class="JellySubscriptionModalView_info_title__ysmJK">상품명</dt>
						<dd class="JellySubscriptionModalView_info_text__2r5sp">LE
							SSERAFIM Digital Membership</dd>
						<dt class="JellySubscriptionModalView_info_title__ysmJK">옵션</dt>
						<dd
							class="JellySubscriptionModalView_info_text__2r5sp JellySubscriptionModalView_-option__WIWkB">월
							정기구독</dd>
						<dt class="JellySubscriptionModalView_info_title__ysmJK">구독
							가격</dt>
						<dd
							class="JellySubscriptionModalView_info_text__2r5sp JellySubscriptionModalView_-jelly_text__PRagP">
							<span class="blind">Jelly</span><em
								class="JellySubscriptionModalView_highlight__4B+B7">9/월</em>
						</dd>
						<dt class="JellySubscriptionModalView_info_title__ysmJK">젤리
							자동 결제</dt>
						<dd class="JellySubscriptionModalView_info_text__2r5sp">
							<div class="JellyAutoPaymentInfoView_card_info__y20Lc">
								<em
									class="JellyAutoPaymentInfoView_card_wrap__pQ5RT JellyAutoPaymentInfoView_empty__4XFy4">미등록</em>
								<div class="JellyAutoPaymentInfoView_refresh_wrap__BLz6R">
									<button type="button"
										class="JellyAutoPaymentInfoView_refresh_button__w7Q8X">
										<span class="blind">refresh</span>
									</button>
									<em class="JellyAutoPaymentInfoView_tooltip__Psz2+">결제 수단
										갱신</em>
								</div>
							</div>
							<a href="https://jelly.weverse.io/setting/card"
								class="JellyAutoPaymentInfoView_setting__rSbQm">설정</a>
						</dd>
					</dl>
					<div class="JellySubscriptionNoticeView_checkbox_wrapper__me4vY">
						<input id="sub-agree" type="checkbox"
							class="JellySubscriptionNoticeView_checkbox_input__BMXSn blind"
							style="opacity: unset; appearance: auto;"><label
							for="sub-agree"
							class="JellySubscriptionNoticeView_checkbox_label__Z1Z+o">위
							내용으로 매월 정기 구독(젤리 충전/사용)에 동의합니다.</label>
					</div>
					<ul class="JellySubscriptionNoticeView_notice_list__pZ9WW">
						<li class="JellySubscriptionNoticeView_notice_item__1bGaj">정기
							구독은 젤리 샵에서 자동 결제 카드 등록이 필요합니다.</li>
						<li class="JellySubscriptionNoticeView_notice_item__1bGaj">구독
							결제 시 젤리가 부족하면 등록된 자동 결제카드로 바로 충전됩니다.</li>
					</ul>
				</div>
				<div class="JellyOrderModalLayoutView_button_area__VULZ+">
					<div class="ModalButtonView_button_wrap__cqUzx">
						<button aria-label="cancel modal" type="button"
							style="border: 0; background-color: transparent;" type="button"
							class="ModalButtonView_button__B5k-Z ModalButtonView_-cancel__q7X7J">취소</button>
						<button aria-label="confirm modal"
							style="border: 0; background-color: transparent;" type="button"
							class="ModalButtonView_button__B5k-Z ModalButtonView_-confirm__2YBz1"
							disabled="">구독 시작</button>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<!-- 모달 HTML -->
<div class="modal fade" id="modal-detail" tabindex="-1" role="dialog"
	aria-labelledby="modalDetailLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
		<!--  
			<div class="modal-header">
				<h5 class="modal-title" id="modalDetailLabel">글 상세보기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			-->
			<div class="modal-body">
			<!-- 
				<div>
					<span id="spn1" class="justify-between">
						<button type="button" id="edit" class="btn btn-primary">수정</button>
						<button type="button" id="delete" class="btn btn-danger">삭제</button>
					</span> <span id="spn2" class="justify-between" style="display: none;">
						<button id="updateSubmit" type="submit" class="btn btn-success">확인</button>
						<a href="/${communityVO.groupNo}/detail?commNo=${param.commNo}"
						class="btn btn-secondary">취소</a>
					</span>
				</div>
				-->
				<!-- 여기에 AJAX로 데이터를 로드 -->
				<div id="postContent"></div>
				<!-- 댓글 목록 -->

<!-- 				<div class="modal-footer"> -->
<!-- 					<button type="button" class="btn btn-secondary" -->
<!-- 						data-dismiss="modal">닫기</button> -->
<!-- 				</div> -->
			</div>
		</div>
	</div>
</div>




<!-- SweetAlert 등록 버튼 스크립트 -->
<script>
        

                const groupNo = $("input[name='groupNo']").val();

            // 로그인 모달 표시 함수
            function showLoginModal() {
                Swal.fire({
                    title: '로그인이 필요합니다!',
                    text: '로그인 후 이 페이지를 이용할 수 있습니다.',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: '로그인하기',
                    cancelButtonText: '취소',
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = '/login'; // 로그인 페이지로 이동
                    }
                });
            }

            // 가입 모달 표시 함수
            function showJoinModal(groupNo) {
                Swal.fire({
                    title: `${groupName} 커뮤니티 가입`,
                    html: `
                        <label for="uploadFiles" style="font-size: 14px; font-weight: bold; display: block; text-align: center;">
                            <div style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden; display: inline-block; margin: 0 auto;">
                                <img id="profileThumbnail"
                                     src="https://cdn-v2pstatic.weverse.io/wev_web_fe/p/2_31_1/public/static/media/icon_empty_profile.b0996808ea97350978a4.png"
                                     style="width: 100%; height: 100%; object-fit: cover;" 
                                     alt="Profile Thumbnail">
                                <input type="file" id="uploadFiles" class="swal2-file" accept="image/*" style="display:none;">
                                프로필 사진 업로드
                            </div>
                        </label>
                        <br />
                        <label for="commRegNick" style="font-size: 14px; font-weight: bold; display: block; text-align: center;">
                            <input type="text" id="commRegNick" class="swal2-input" placeholder="닉네임을 입력하세요">
                        </label><button type="button" id="previewBtn" style="border:none; color:grey; background-color:white;">시연용</button>
                    `,
                    showCancelButton: true,
                    confirmButtonText: '완료',
                    cancelButtonText: '취소',
                    focusConfirm: false,
                    preConfirm: () => {
                        const nickname = document.getElementById('commRegNick').value;
                        const fileInput = document.getElementById('uploadFiles');
                        if (!nickname) {
                            Swal.showValidationMessage('닉네임을 입력해주세요.');
                            return false;
                        }
                        if (fileInput.files.length === 0) {
                            Swal.showValidationMessage('프로필 사진을 선택해주세요.');
                            return false;
                        }
                        return { nickname: nickname, file: fileInput.files[0] };
                    }
                }).then((result) => {
                    if (result.isConfirmed) {
                        submitJoinForm(groupNo, result.value.nickname, result.value.file);
                    }
                });
                
                document.getElementById("previewBtn").addEventListener("click", () => {

                	document.getElementById("commRegNick").value = "고양이";
                });

                // 파일 선택 이벤트 처리
                document.getElementById('uploadFiles').addEventListener('change', (event) => {
                    const file = event.target.files[0];
                    if (file) {
                        const reader = new FileReader();
                        reader.onload = (e) => {
                            document.getElementById('profileThumbnail').src = e.target.result;
                        };
                        reader.readAsDataURL(file);
                    }
                });
            }

            // 가입 요청 처리 함수
            function submitJoinForm(groupNo, nickname, file) {
                const formData = new FormData();
                formData.append('commRegNick', nickname);
                formData.append('uploadFiles', file);

                // CSRF 토큰 처리 (필요 시 추가)
                const csrfToken = $('input[name="${_csrf.parameterName}"]').val();
                const csrfHeader = 'X-CSRF-TOKEN';

                // 서버로 데이터 전송
                $.ajax({
                    url: `/${groupNo}/join`, // URL 확인
                    type: 'POST',
                    data: formData,
                    contentType: false,
                    processData: false,
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader(csrfHeader, csrfToken);
                    },
                    success: function (response) {
                        if (response.message === "커뮤니티 가입이 완료되었습니다!") {
                            Swal.fire({
                                icon: 'success',
                                title: '가입 성공',
                                text: '커뮤니티 가입이 완료되었습니다!',
                                timer: 3000,
                                showConfirmButton: false
                            }).then(() => {
                                location.reload(); // 가입 후 새로고침
                            });
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: '가입 실패',
                                text: '다시 시도해주세요.',
                            });
                        }
                    },
                    error: function () {
                        Swal.fire({
                            icon: 'error',
                            title: '오류 발생',
                            text: '가입 중 문제가 발생했습니다.',
                        });
                    }
                });
            }

            // 커뮤니티 콘텐츠 로드 함수
            function loadCommunityFeed(groupNo) {
                $.get(`/${groupNo}/feed`, function (data) {
                    $("#feedContainer").html(data);
                });
            }

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
	            <button type="button" id="previewBtn" style="border:none; color:grey; background-color:white;">시연용</button>
	            <button type="button" id="confirmButton" class="btn btn-primary" style="padding: 8px 16px;">등록</button>
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
	// 시연용 버튼 클릭 시 텍스트 영역에 값 추가
	document.getElementById("previewBtn").addEventListener("click", () => {
	    document.getElementById("commCn").value = "버니즈여러분~~~!!!!!!!!!! I've seen so many clips of you guys unboxing our new album and decorating the beach bag and all the events you guys held to celebrate our 1 year anniversary and watching all this videos made me smile so widely and reminded how lucky the five of us are to have such sincere and loving fans like you all!! I feel so happy seeing you all enjoy all 6 tracks and meeting up with each other to celebrate and 그냥 다 너무 너무 기분이 좋게 해주 더라고요!!! 그래서 그냥 말해주고싶었어요!!! 너무 너무 사랑하 고 감사하고 버니즈분들은 행복하시면 저도 마음이 곽 채워지는 느낌이라 너무 너무 너무 너무 너무 너무너무 좋아요!! 0W S just wanted to let you all know!!! we always feel all your love and support even if you don't think so!!! 오늘 하루도 잘 보내요!! 이따가 나올 뮤비도 많이 기대하시구~~~";
	});
    // 파일 선택 이벤트 추가
    document.getElementById('uploadFiles').addEventListener('change', (event) => {
        const files = event.target.files;
        const previewArea = document.getElementById('previewArea');
        previewArea.innerHTML = ''; // 기존 미리보기 초기화

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
    });
    document.getElementById('confirmButton').addEventListener('click', () => {
        const commCn = document.getElementById('commCn').value;
        const fileInput = document.getElementById('uploadFiles').files;
        const memshipState = document.getElementById('memshipState').checked;

        if (!commCn) {
            Swal.showValidationMessage('글을 작성해 주세요.');
            return;
        }

        // 데이터 처리 함수 호출
        createForm(groupNo, commCn, fileInput, memshipState);
    });

}


            // 글 업로드
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
            
            document.getElementById("start-subscription").addEventListener("click", function () {
                // 첫 번째 모달 닫기
                $('#modal-membership').modal('hide');

                // 두 번째 모달 열기
//                 $('#modal-membership2').modal('show');
                
            });

//[1] 번역 *************** (게시글 상세)
$(document).on("click", ".translate-btn", function () {
	const commno = $(this).data('commno'); // 커뮤니티 번호 가져오기
	let mode = $("#modal-btn-post" + commno).html();
	mode = mode.substr(0, 1);  // '원' 또는 '번'
	let commCn;

	if (mode == "원") {
		commCn = $(this).data("commCn");
		// 버튼 텍스트를 '번역 보기'로 변경하고 언어 정보 복구
		$("#modal-btn-post" + commno).html("번역 보기");
		$("#commCn" + commno).html(commCn);
		return;
	}

	const textToTranslate = $("#commCn" + commno).val(); // 번역할 텍스트 가져오기
	const sourceLang = ""; // 빈 값을 넣어 자동 언어 감지 활성화
	const targetLang = "ko"; // 대상 언어를 한국어로 고정

	let data = {
		text: textToTranslate,
		sourceLang: sourceLang,
		targetLang: targetLang
	};

	console.log("translate-btn클릭->data : ", data);

	// Ajax 요청으로 번역 처리
	$.ajax({
		url: "/translation/api", // 컨트롤러에서 설정한 경로
		type: "POST",
		contentType: "application/json",
		data: JSON.stringify(data),
		success: function (response) {
			console.log("번역 결과:", response);
                        if (response && response.translatedText) {
                            // 번역된 텍스트로 교체
                            $("#commCn" + commno).html(response.translatedText);

                            const sourceLang = response.sourceLang || 'unknown'; // 번역된 언어의 감지된 원본 언어
                            // 버튼 텍스트를 '원문 보기'로 변경하고 언어 정보 추가
                            $("#modal-btn-post" + commno).html("원문 보기 (" + response.sourceLang + ")");

                            // 한국어(ko)일 경우 번역 보기 버튼 숨기기, 그 외 언어는 버튼 보이기
                            if (sourceLang === "ko") {
                                // 한국어일 경우 버튼 숨기기
                                $("#modal-btn-post" + commno).hide();
                            } else {
                                // 한국어가 아니면 버튼 보이기
                                $("#modal-btn-post" + commno).show();
                            }
                        }
		},
		error: function (xhr, status, error) {
			console.error("번역 중 오류:", xhr, status, error);
		}
	});
});


//[2] 댓글 번역*********************(댓글)
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
    	//개똥이->cmmtNo :  18  및 respn :
    	console.log("개똥이->cmmtNo : ",cmmtNo," 및 respn : ", respn);
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
//                 $commentElement.text(response.translatedText);
                $("#respn"+cmmtNo).html(response.translatedText);
                // 원본 텍스트 저장
//                 $commentElement.data('original-text', originalText);

                const sourceLang = response.sourceLang || 'unknown'; // 번역된 언어의 감지된 원본 언어
                // 버튼 텍스트를 '원문 보기'로 변경하고 언어 정보 추가
//                 $(`#btn-${commentId}`).text('원문 보기').append(` (${sourceLang})`);
                $("#re-btn-"+cmmtNo).html("원문 보기 ("+response.sourceLang+")");

                //  버튼을 숨기고 원문 보기 버튼을 표시
//                 $(this).hide(); // '' 버튼 숨기기
//                 $(`#btn-original-${commentId}`).show(); // '원문 보기' 버튼 표시
             // 한국어(ko)일 경우 번역 보기 버튼 숨기기, 그 외 언어는 버튼 보이기
                if (sourceLang === "ko") {
                    // 한국어일 경우 버튼 숨기기
                    $("#re-btn-"+cmmtNo).hide();
                } else {
                    // 한국어가 아니면 버튼 보이기
                    $("#re-btn-"+cmmtNo).show();
                }
            }
},
        error: function (xhr, status, error) {
            console.error("번역 중 오류:", xhr, status, error);
        }
    });
});
//번역 보기 버튼 숨기기 및 보이기 (한국어는 숨기기) (댓글)
$('.re-translate-btn').each(function () {
    const cmmtNo = $(this).data('cmmtNo'); // 게시글 내용 가져오기

    // 한국어 확인 (예시로 간단히 'ko'를 감지)
    if (isKorean(cmmtNo)) {
        // 한국어일 경우 번역 보기 버튼 숨기기
        $(this).hide();
    } else {
        // 한국어가 아닌 경우 번역 보기 버튼 보이기
        $(this).show();
    }
})

// 한국어 여부를 확인하는 함수 (기본적인 예시)
function isKorean(text) {
    const koreanRegExp = /[\u3131-\u3163\uac00-\ud7a3]/;
    return koreanRegExp.test(text);
}

//날짜 형식 변환 함수 (ISO 8601 → YYYY-MM-DD HH:mm:ss)
function formatDate(isoString) {
    if (!isoString) return ""; // 값이 없을 경우 빈 문자열 반환

    const date = new Date(isoString);
    if (isNaN(date)) return ""; // 변환이 실패하면 빈 값 반환

    return date.getFullYear() + "-" +
        String(date.getMonth() + 1).padStart(2, '0') + "-" +
        String(date.getDate()).padStart(2, '0') + " " +
        String(date.getHours()).padStart(2, '0') + ":" +
        String(date.getMinutes()).padStart(2, '0') + ":" +
        String(date.getSeconds()).padStart(2, '0');
}

//******* 댓글 모달
 $(document).on("click", ".viewDetail", function (e) {
	    e.preventDefault();

	    const groupNo = $(this).data("groupno");
	    const commNo = $(this).data("commno");
	    
	    let data = {
	    	"groupNo":groupNo,
	    	"commNo":commNo
	    }
	    
	    //{"groupNo": 3,"commNo": 126}
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
                          <button type="button" class="MoreButtonView_button_menu">
                              <span class="blind">Show More Content</span>
                          </button>

                          <!-- 드롭다운 옵션 리스트 -->
                          <ul class="DropdownOptionListView_option_list DropdownOptionListView_dropdown-action" 
                              role="listbox" 
                              data-use-placement="true" 
                              data-placement="top">
                              <!-- 수정하기 옵션 -->
                              <li class="DropdownOptionListView_option_item" role="presentation">
                                  <button id="edit" style="border:none; background-color:transparent;" class="ContentMetaActionLayerView_button_item ContentMetaActionLayerView_copy">
                                      수정하기
                                  </button>
                              </li>
                              <!-- 삭제하기 옵션 -->
                              <li class="DropdownOptionListView_option_item" role="presentation">
                                  <button id="delete" style="border:none; background-color:transparent; color:red;" class="ContentMetaActionLayerView_button_item ContentMetaActionLayerView_copy">
                                      삭제하기
                                  </button>
                              </li>
                              <li class="DropdownOptionListView_option_item" role="presentation">
                                  <button id="report" style="border:none; background-color:transparent;" class="ContentMetaActionLayerView_button_item ContentMetaActionLayerView_copy">
                                      신고하기
                                  </button>
                              </li>
                          </ul>
                      </div>
                  </div>

                      
                      </div>
                      </div>
                      <div class="post-body height:100%;">
                      <br />
	                    <pre style="background-color:white; border:none; resize:none;overflow:hidden;white-space: pre-wrap;height:auto;" class="form-control" id="commCn\${commNo}" data-comm-cn="\${communityVO.commCn}">\${communityVO.commCn}</pre>
	                    <br />
	                `;
					//<div style="background-color:white; border:none; overflow:hidden; resize:none;" class="form-control" id="commCn\달러{commNo}" data-comm-cn="\달러{communityVO.commCn}">\달러{communityVO.commCn}</div>
	                // 파일 그룹이 있을 경우 이미지 추가
	                if (communityVO.fileGroupVO && communityVO.fileGroupVO.fileDetailVOList) {
	                    communityVO.fileGroupVO.fileDetailVOList.forEach(file => {
	                        modalContent += `
	                            <div><img src="\${file.fileSaveLocate}" alt="\${file.fileOriginalName}" class="img-fluid"></div>
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
					                <a class="PostHeaderView_thumbnail_wrap" href="/${groupNo}/profile2?memId=${communityVO.memId}">              <!-- 썸네일 -->
					                    <div class="ProfileThumbnailView_thumbnail_area" style="width: 35px; height: 35px;">
					                        <div class="ProfileThumbnailView_thumbnail_wrap ProfileThumbnailView_-has_border__UG1nQ">
					                            <div style="aspect-ratio: auto 35 / 35; content-visibility: auto; contain-intrinsic-size: 35px; width: 100%; height: 100%;">
					                                <img  src="\${comment.fileSaveLocate}"
					                                    class="ProfileThumbnailView_thumbnail" width="35" height="35" alt="">
					                            </div>
					                        </div>
					                    </div>
				                    <div class="comment-text-wrap">
					                <a href="/${groupNo}/profile2?memId=${communityVO.memId}"><strong>\${comment.commRegNick} \${comment.isMembership === 1 
					                    ? `<em class="BadgeViewV2_badge__Lz-qv BadgeViewV2_-membership_icon__5uf-z BadgeViewV2_-size_20__i-2Jy" style="width: 12px; height: 12px; display: inline-block;">
					                            <span class="blind">Membership Only Content</span>
					                          </em>` 
					                       : ""}</strong></a>
					            <div class="comment-date">
					            <span>\${formatDate(comment.cmmtDate)}</span>
					            </div>
					            </div>
					            </div>
					            <p style="margin-left:43px; padding-top:10px;"><span id="respn\${comment.cmmtNo}">\${comment.cmmtCn}</span>`;
					            
					            let commCn = comment.cmmtCn; // 게시글 내용 가져오기
					            console.log("RE) commCn : ", commCn);

					            // 한국어 확인 (예시로 간단히 'ko'를 감지)
					            if (isKorean(commCn)) {
					                // 한국어일 경우 번역 보기 버튼 숨기기
					            } else {
					                // 한국어가 아닌 경우 번역 보기 버튼 보이기
					            	modalContent += `
							            <!-- 댓글 번역보기 버튼 -->
							            <span id="re-btn-\${comment.cmmtNo}" 
							                  class="re-translate-btn" 
							                  data-comment-id="post2" 
							                  data-cmmt-no="\${comment.cmmtNo}"
							                  data-cmmt-cn="\${comment.cmmtCn}"
							                  style="font-size: 12px; color: rgba(0, 0, 0, 0.5); text-decoration: underline; cursor: pointer;">
							                <br>번역 보기
							            </span>`;
					            }
					            
					            modalContent += `
					        </p>
					        
					        
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
	    
//페이지 로드 시, 한국어 텍스트인 경우  버튼 숨기기
 $(document).ready(function () {
     $(".re-translate-btn").each(function () {
         const cmmtCn = $(this).data("cmmtCn"); // 게시글 내용 가져오기

         // 한국어 확인 (예시로 간단히 'ko'를 감지)
         if (isKorean(cmmtCn)) {
             // 한국어일 경우 번역 보기 버튼 숨기기
             $(this).hide();
         } else {
             // 한국어가 아닌 경우 번역 보기 버튼 보이기
             $(this).show();
         }
     }).fail(function () {
         Swal.fire({
             icon: 'error',
             title: '오류 발생',
             text: '서버 상태 확인 중 문제가 발생했습니다.',
         });
     });
 });

 // 한국어 여부를 확인하는 함수 (기본적인 예시)
 function isKorean(text) {
     const koreanRegExp = /[\u3131-\u3163\uac00-\ud7a3]/;
     return koreanRegExp.test(text);
 }
 
 
		//
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

    // 번역************************** (피드)
    $('.translate-btn').click(function () {
        const commno = $(this).data('commno'); // 커뮤니티 번호 가져오기
        let mode = $("#btn-post" + commno).html();
        mode = mode.substr(0, 1);  // '원' 또는 '번'
        let commCn;

        if (mode == "원") {
            commCn = $(this).data("commCn");
            // 버튼 텍스트를 '번역 보기'로 변경하고 언어 정보 복구
            $("#btn-post" + commno).html("번역 보기");
            $("#pCommCn" + commno).html(commCn);
            return;
        }

        const $commentElement = $(`#comment-${commno}`); // 댓글 요소 가져오기
        const textToTranslate = $("#pCommCn" + commno).html(); // 번역할 텍스트 가져오기
        const originalText = $commentElement.data('original-text') || textToTranslate; // 원본 텍스트 저장

        const sourceLang = ""; // 빈 값을 넣어 자동 언어 감지 활성화
        const targetLang = "ko"; // 대상 언어를 한국어로 고정

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
                console.log("번역 결과:", response);
                if (response && response.translatedText) {
                    // 번역된 텍스트로 교체
                    $("#pCommCn" + commno).html(response.translatedText);
                    // 원본 텍스트 저장
                    $commentElement.data('original-text', originalText);

                    const sourceLang = response.sourceLang || 'unknown'; // 번역된 언어의 감지된 원본 언어
                    // 버튼 텍스트를 '원문 보기'로 변경하고 언어 정보 추가
                    $("#btn-post" + commno).html("원문 보기 (" + response.sourceLang + ")");

                    // 번역 보기 버튼을 숨기고 원문 보기 버튼을 표시
                }
            },
            error: function (xhr, status, error) {
                console.error("번역 중 오류:", xhr, status, error);
            }
        });
    });

    // 번역 보기 버튼 숨기기 및 보이기 (한국어는 숨기기) (피드)
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
});


    // 원문 보기 버튼 클릭 시(게시글)
//     $('.original-btn').click(function () {
//         const commentId = $(this).data('comment-id'); // 댓글 ID 가져오기
//         const $commentElement = $(`#comment-${commentId}`); // 댓글 요소 가져오기
//         const originalText = $commentElement.data('original-text'); // 원본 텍스트 가져오기

//         // 원본 텍스트로 되돌리기
//         $commentElement.text(originalText);

//         // '번역 보기' 버튼 텍스트로 변경하고, 원문 보기 버튼 숨기기
//         $(`#btn-${commentId}`).text('번역 보기').hide();
//         // '번역 보기' 버튼을 표시
//         $(`#btn-${commentId}`).siblings('.translate-btn').show();
//     });
    
 // 원문 보기 버튼 클릭 시(댓글)
//     $('.original-btn').click(function () {
//         const commentId = $(this).data('comment-id'); // 댓글 ID 가져오기
//         const $commentElement = $(`#comment-${commentId}`); // 댓글 요소 가져오기
//         const originalText = $commentElement.data('original-text'); // 원본 텍스트 가져오기

//         // 원본 텍스트로 되돌리기
//         $commentElement.text(originalText);

//         // '번역 보기' 버튼 텍스트로 변경하고, 원문 보기 버튼 숨기기
//         $(`#btn-${commentId}`).text('번역 보기').hide();
//         // '번역 보기' 버튼을 표시
//         $(`#btn-${commentId}`).siblings('.re-translate-btn').show();
//     });




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
                                            </a><strong>\${comment.commRegNick} \${comment.isMembership === 1 
        					                    ? `<em class="BadgeViewV2_badge__Lz-qv BadgeViewV2_-membership_icon__5uf-z BadgeViewV2_-size_20__i-2Jy" style="width: 12px; height: 12px; display: inline-block;">
        					                            <span class="blind">Membership Only Content</span>
        					                          </em>` 
        					                       : ""}</strong>
                                        </div>
                                        <div class="comment-date">
                                        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\${formatDate(comment.cmmtDate)}</span>
                                        </div>
                                        <p style="margin-left:43px;padding-top:5px;"><span id="respn\${comment.cmmtNo}">\${comment.cmmtCn}</span>
                                        <!-- 댓글 번역보기 버튼 -->
                                        <span id="re-btn\${comment.cmmtNo}" 
                                              class="re-translate-btn" 
                                              data-comment-id="post2" 
                                              data-cmmt-no="\${comment.cmmtNo}"
                                              data-cmmt-cn="\${comment.cmmtCn}"
                                              style="font-size: 12px; color: rgba(0, 0, 0, 0.5); text-decoration: underline; cursor: pointer;">
                                            <br>번역보기
                                        </span>
                                    </p>
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
 
 
//  댓글 갱신
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
<!--         기존 좋아요
<script>
//좋아요 기능 구현
 function toggleLikeInModal() {
    const commNo = $("#modal-commNo").val();
    const groupNo = $("#modal-groupNo").val();

    console.log("commNo:", commNo, "groupNo:", groupNo);

    if (!commNo || !groupNo) {
        console.error("commNo 또는 groupNo 값이 없습니다.");
        return;
    }

    $.ajax({
        url: `/${groupNo}/like/`+commNo,
        type: 'POST',
        success: function (response) {
            console.log("response:", response);
            $("#modal-likeIcon").attr("name", response.isLiked ? "heart" : "heart-outline");
            $("#modal-likeCount").text(response.likeCount);
        },
        error: function (xhr, status, error) {
            console.error("Error:", xhr.responseText);
            alert("로그인이 필요합니다.");
        }
    });
}

//  좋아요
function toggleLike(commNo, groupNo) {
    console.log("commNo:", commNo, "groupNo:", groupNo);

    $.ajax({
        url: `/${groupNo}/like/`+commNo,
        type: "POST",
        success: function (response) {
            console.log("response:", response);

            // 좋아요 상태와 수 업데이트
            const isLiked = response.isLiked; // 서버에서 반환된 좋아요 상태
            const likeCount = response.likeCount; // 서버에서 반환된 좋아요 수

            // 버튼에 저장된 좋아요 상태 업데이트
            const likeButton = $(`#likeButton\${commNo}`);
            likeButton.attr("data-is-liked", isLiked ? 1 : 0);

            // 아이콘 업데이트
            $(`#likeIcon\${commNo}`).attr("name", isLiked ? 'heart' : 'heart-outline');

            // 좋아요 수 업데이트
            $(`#likeCount\${commNo}`).text(likeCount);
        },
        error: function (xhr, status, error) {
            console.error("Error:", xhr.responseText);
            alert("좋아요 요청에 실패했습니다.");
        }
    });
}
$(document).ready(function () {
    $("button[id^='likeButton']").each(function () {
        const isLiked = $(this).data("is-liked"); // 저장된 좋아요 상태
        const commNo = $(this).attr("id").replace("likeButton", "");

        // 아이콘 상태 초기화
        $(`#likeIcon${commNo}`).attr("name", isLiked ? 'heart' : 'heart-outline');
    });
});
</script>
 -->

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
	// 디테일 게시글 삭제
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
         // 피드 게시글 삭제
            $(document).on("click", "#delete", function () {
                const groupNo = $("input[name='groupNo']").val(); // 그룹 번호
                // 삭제 버튼에서 가장 가까운 .timeline-item의 data-commno 값을 가져옴
//                 const commNo = $(this).closest(".timeline-item").data("commno");
//                 const commNo = $(this).parents(".timeline-item").data("commno");
// const commNo = $(this).siblings(".viewDetail").data("commno");
// const commNo = $(this).attr("data-commno");
const commNo = $(this).closest("[data-commno]").data("commno");


                console.log("groupNo:", groupNo); // 디버깅용 로그
                console.log("commNo:", commNo);   // 디버깅용 로그

                if (!commNo || commNo === 0) {
                    Swal.fire("오류", "게시글 번호를 가져올 수 없습니다.", "error");
                    return;
                }
                console.log("commNo:", commNo); // 로그로 commNo 값 확인

                Swal.fire({
                    title: "삭제하시겠습니까?",
                    text: "삭제 후에는 복구할 수 없습니다.",
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
                            data: JSON.stringify({ commNo: commNo }), // JSON 데이터로 전달
                            success: function (response) {
                                if (response.result > 0) {
                                    Swal.fire({
                                        icon: "success",
                                        title: "삭제 성공!",
                                        showConfirmButton: false,
                                        timer: 3000,
                                    }).then(() => {
                                        location.reload(); // 성공 시 새로고침
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
// 피드 게시글 신고
document.getElementById('report').addEventListener('click', function(event) {
    event.preventDefault();
    const commNo = $(this).closest("[data-commno]").data("commno");

//     const commNo = this.getAttribute('data-comm-no'); // 게시글 번호 가져오기
    console.log("commNo:", commNo);   // 디버깅용 로그
    const reportReason = prompt("신고 사유를 입력해주세요:"); // 신고 사유 입력받기
    if (!reportReason) {
        alert("신고 사유를 입력하지 않으면 신고할 수 없습니다.");
        return;
    }

    // 신고 데이터 생성
    const reportData = {
        commNo: commNo,
        commReportCn: reportReason,
        commReportYn: 0, // 기본값: 처리되지 않음
        commReportAc: null // 조치 내용은 기본적으로 null
    };

    // AJAX 요청
    fetch(`/${groupNo}/report`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(reportData)
    })
    .then(response => response.json())
    .then(data => {
    if (data.status === 'error') {
        alert(data.message); // "이미 신고한 게시글입니다." 또는 기타 에러 메시지
    } else {
        alert(data.message); // "신고가 접수되었습니다."
    }
    })
    .catch(error => {
        console.error("Error:", error);
        alert("신고 처리 중 오류가 발생했습니다.");
    });
});

        </script>

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
document.getElementById("start-subscription").addEventListener("click", function() {
    // 모달 내부에서 값 가져오기
    const groupNo = document.querySelector('[name="groupNo"]').value;
    const memshipNo = document.querySelector('[name="memshipNo"]').value;
    const memId = document.querySelector('[name="memId"]').value;

    console.log("groupNo:", groupNo);
    console.log("memId:", memId);
    console.log("memshipNo:", memshipNo);

    // POST 요청을 서버로 전송
    fetch(`/${groupNo}/registerMembership`, {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
        },
        body: new URLSearchParams({
            groupNo: groupNo,
            memshipNo: memshipNo,
            memId: memId
        }),
    })
    .then(response => response.text())
    .then(message => {
        let iconType = 'error';
        let titleText = '가입 실패';
        
        if (message.includes("성공")) {
            iconType = 'success';
            titleText = '가입 완료!';
        } else if (message.includes("가상 화폐 잔액이 부족")) {
            titleText = '잔액 부족!';
        }

        Swal.fire({
            icon: iconType,
            title: titleText,
            text: message,
        }).then(() => {
            if (message.includes("성공")) {
                location.reload();
            }
        });
    })
    .catch(error => {
        console.error("Error:", error);
        Swal.fire({
            icon: 'error',
            title: '오류 발생',
            text: '가입 중 오류가 발생했습니다. 다시 시도해주세요.',
        });
    });
});

</script>


<script>
document.getElementById("start-subscription").addEventListener("click", function() {
    // 모달 내부 값 가져오기
    const groupNo = document.querySelector('[name="groupNo"]').value;
    const memshipNo = document.querySelector('[name="memshipNo"]').value;
    const memId = document.querySelector('[name="memId"]').value;

    // POST 요청을 서버로 전송
    fetch(`/${groupNo}/registerMembership`, {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
        },
        body: new URLSearchParams({
            groupNo: groupNo,
            memshipNo: memshipNo,
            memId: memId
        }),
    })
    .then(response => response.json()) // JSON 형식으로 응답 받기
    .then(data => {
        Swal.fire({
            icon: data.status === "success" ? 'success' : 'error',
            title: data.status === "success" ? '가입 완료!' : '가입 실패',
            text: data.message,
        }).then(() => {
            if (data.status === "success") {
                location.reload();
            }
        });
    })
    .catch(error => {
        console.error("Error:", error);
        Swal.fire({
            icon: 'error',
            title: '오류 발생',
            text: '가입 중 오류가 발생했습니다. 다시 시도해주세요.',
        });
    });
});
</script>


<!-- footer 포함 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
