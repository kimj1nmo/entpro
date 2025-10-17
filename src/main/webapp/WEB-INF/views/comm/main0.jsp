<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<link href="/directlyCss/main.css" rel="stylesheet">
<link href="/directlyCss/modal.css" rel="stylesheet">
<title>Enter</title>
</head>
<body>
<div class="post-input-wrapper">
  <div class="post-button">
    <div class="thumbnail-area">
      <div class="profile-thumbnail">
        <div class="thumbnail-wrap" style="width: 46px; height: 46px;">
          <img src="https://cdn-v2pstatic.weverse.io/wev_web_fe/p/2_31_1/public/static/media/icon_empty_profile.b0996808ea97350978a4.png" alt="Profile Thumbnail">
        </div>
      </div>
    </div>
    <em class="input-placeholder">위버스에 포스트를 남겨보세요.</em>
  </div>
  <div class="attachment-area">
    <label for="photo-input" class="attachment-button photo">
      <span class="blind">Attach photo</span>
      <input id="photo-input" type="file" multiple accept="image/*" class="blind">
    </label>
    <label for="video-input" class="attachment-button video">
      <span class="blind">Attach video</span>
      <input id="video-input" type="file" multiple accept="video/mp4, video/*" class="blind">
    </label>
  </div>
</div>



<script>
    // 모달 관련 변수
    var modal = document.getElementById("modal"); // 수정: ID 맞추기
    var postButton = document.querySelector(".post-button");
    var closeModal = document.getElementById("closeModal"); // 수정: ID 맞추기

    // post-button을 클릭했을 때 모달 열기
    postButton.onclick = function() {
        modal.style.display = "block";
    }

    // 닫기 버튼을 클릭했을 때 모달 닫기
    closeModal.onclick = function() {
        modal.style.display = "none";
    }

    // 모달 외부를 클릭하면 모달 닫기
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
</body>
</html>
