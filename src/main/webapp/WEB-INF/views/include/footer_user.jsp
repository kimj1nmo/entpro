<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</main>

	<footer id="footer" class="footer">
		<!-- URL 주소에 따라 footer 달라지게 하기 시작 -->
		<c:set var="currentUri" value="${pageContext.request.requestURI}" />
		<c:if test="${currentUri == '/WEB-INF/views/main/main.jsp'}">
			<div class="container footer-top">
		</c:if>
		<div class="container footer-top footerMargin">
		<!-- URL 주소에 따라 footer 달라지게 하기 끝 -->
			<div class="row gy-4">
					<div class="col-lg-12 col-md-12 footer-about">
							<a href="/" class="d-flex align-items-center aWidth">
									<span class="sitename2">ENTERTAINMENT</span>
							</a>
							<div class="footer-contact pt-3 d-flex justify-content-between">
									<div class="contact-item">
											<p>대전 중구</p>
											<p>오류동 175-13</p>
									</div>
									<div class="contact-item">
											<p class="mt-3"><strong>Phone:</strong> <span>+82 5589 5548</span></p>
									</div>
									<div class="contact-item">
											<p><strong>Email:</strong> <span>entertainment@gmail.com</span></p>
									</div>
									<div class="contact-item">
									<p id="openPopup" style="cursor: pointer;"><strong>오디션 신청하기</strong> </p>


<script>
$(document).ready(function() {
    $("#openPopup").click(function() {
        let options = "width=1000,height=700,left=100,top=100,resizable=no";
        window.open("/auditionReqstCreate", "오디션 신청하기", options);
    });
});
</script>
									</div>
							</div>
					</div>
			</div>
		</div>


		<div class="container copyright text-center mt-4">
			<p>
				© <span>Copyright</span> <strong class="px-1 sitename">Arsha</strong>
				<span>All Rights Reserved</span>
			</p>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you've purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>

	</footer>

	<!-- Scroll Top -->
	<a href="#" id="scroll-top"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Preloader -->
	<div id="preloader"></div>


	<!-- Vendor JS Files -->
	<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/vendor/php-email-form/validate.js"></script>
	<script src="/assets/vendor/aos/aos.js"></script>
	<script src="/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script src="/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script src="/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

	<!-- Main JS File -->
	<script src="/assets/js/main.js"></script>


</body>

</html>