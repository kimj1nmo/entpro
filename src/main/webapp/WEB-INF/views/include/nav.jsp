<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>

 <nav>
	<div class="CommunityNavigationLayoutView_navigation__kY3y8">
		<nav
			class="CommunityHeaderNavigationView_community_header_navigation__rn6YS"
			style="background-color: rgb(71, 178, 228);">
			<a href="/${groupNo}/feed"
				class="CommunityHeaderNavigationView_link__iN5es"
				aria-current="true"><span
				class="CommunityHeaderNavigationView_tab__SgmtP">Artist</span></a><a
				href="/${groupNo}/calendar"
				class="CommunityHeaderNavigationView_link__iN5es"
				aria-current="false"><span
				class="CommunityHeaderNavigationView_tab__SgmtP">Calendar</span></a><a
				href="/${groupNo}/membership"
				class="CommunityHeaderNavigationView_link__iN5es"
				aria-current="false"><span
				class="CommunityHeaderNavigationView_tab__SgmtP">Membership</span></a><a
				id="chnlive" href="/${groupNo}/live"
				class="CommunityHeaderNavigationView_link__iN5es"
				aria-current="false" data-is-live="false"><span
				class="CommunityHeaderNavigationView_tab__SgmtP">LIVE</span></a>
			<div class="CommunityHeaderNavigationView_shop_link_wrapper__3budV">
				<a href="/${groupNo}/shop"
					class="CommunityHeaderNavigationView_link__iN5es CommunityHeaderNavigationView_-shop__XhDxS">Shop</a>
			</div>
		</nav>
	</div>
	    </nav>

<style>
.CommunityHeaderNavigationView_community_header_navigation__rn6YS {
  align-items: center;
  box-sizing: border-box;
  display: flex;
  height: 50px;
  justify-content: center;
  padding: 10px 0;
  position: relative;
      position: fixed;
    top: 60px; /* header 높이만큼 아래로 배치 */
    left: 0;
    width: 100%;
    z-index: 999;
    background-color: #f8f9fa;
  
  
}

.CommunityNavigationLayoutView_navigation__kY3y8 {
  position: sticky;
  top: 89.5px;
  z-index: 1000;
}

.CommunityHeaderNavigationView_link__iN5es {
  color: #ffffffb3;
  display: block;
  font-size: 16px;
  font-weight: 700;
  line-height: 19px;
  margin: 0 30px;
  padding: 8px 10px;
  position: relative;
}



.CommunityHeaderNavigationView_link__iN5es[aria-current=true] .CommunityHeaderNavigationView_tab__SgmtP {
  position: relative;
}
</style>


</body>
</html>