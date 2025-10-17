<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 헤더 빠짐 시작 -->
<jsp:include page="../include/header_user.jsp"></jsp:include>
<!-- 헤더 빠짐 끝 -->

	<main class="main">

		<!-- Hero Section -->
		<section id="hero" class="hero section dark-background">

			<div class="container">
				<div class="row gy-4">
					<div
						class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center"
						data-aos="zoom-out"></div>
					<div class="col-lg-6 order-1 order-lg-2 hero-img"
						data-aos="zoom-out" data-aos-delay="200"></div>
				</div>
			</div>

		</section>
		<!-- /Hero Section -->








		<!-- Portfolio Section -->
		<section id="portfolio" class="portfolio section">

			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
				<h2>굿즈</h2>
			</div>
			<!-- End Section Title -->

			<div class="container">

				<div class="isotope-layout" data-default-filter="*"
					data-layout="masonry" data-sort="original-order">

					<ul class="portfolio-filters isotope-filters" data-aos="fade-up"
						data-aos-delay="100">
						<li data-filter="*" class="filter-active">전체</li>
						<li data-filter=".filter-app">라이즈</li>
						<li data-filter=".filter-product">르세라핌</li>
						<li data-filter=".filter-branding">데이식스</li>
					</ul>
					<!-- End Portfolio Filters -->

					<div class="row gy-4 isotope-container" data-aos="fade-up"
						data-aos-delay="200">

						<div
							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
							<img src="assets/img/masonry-portfolio/masonry-portfolio-1.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>App 1</h4>
								<p>Lorem ipsum, dolor sit</p>
								<a href="assets/img/masonry-portfolio/masonry-portfolio-1.jpg"
									title="App 1" data-gallery="portfolio-gallery-app"
									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
								<a href="portfolio-details.html" title="More Details"
									class="details-link"><i class="bi bi-link-45deg"></i></a>
							</div>
						</div>
						<!-- End Portfolio Item -->

						<div
							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
							<img src="assets/img/masonry-portfolio/masonry-portfolio-2.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>Product 1</h4>
								<p>Lorem ipsum, dolor sit</p>
								<a href="assets/img/masonry-portfolio/masonry-portfolio-2.jpg"
									title="Product 1" data-gallery="portfolio-gallery-product"
									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
								<a href="portfolio-details.html" title="More Details"
									class="details-link"><i class="bi bi-link-45deg"></i></a>
							</div>
						</div>
						<!-- End Portfolio Item -->

						<div
							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
							<img src="assets/img/masonry-portfolio/masonry-portfolio-3.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>Branding 1</h4>
								<p>Lorem ipsum, dolor sit</p>
								<a href="assets/img/masonry-portfolio/masonry-portfolio-3.jpg"
									title="Branding 1" data-gallery="portfolio-gallery-branding"
									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
								<a href="portfolio-details.html" title="More Details"
									class="details-link"><i class="bi bi-link-45deg"></i></a>
							</div>
						</div>
						<!-- End Portfolio Item -->

						<div
							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
							<img src="assets/img/masonry-portfolio/masonry-portfolio-4.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>App 2</h4>
								<p>Lorem ipsum, dolor sit</p>
								<a href="assets/img/masonry-portfolio/masonry-portfolio-4.jpg"
									title="App 2" data-gallery="portfolio-gallery-app"
									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
								<a href="portfolio-details.html" title="More Details"
									class="details-link"><i class="bi bi-link-45deg"></i></a>
						</div>
						<!-- End Portfolio Item -->

						<div
							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
							<img src="assets/img/masonry-portfolio/masonry-portfolio-5.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>Product 2</h4>
								<p>Lorem ipsum, dolor sit</p>
								<a href="assets/img/masonry-portfolio/masonry-portfolio-5.jpg"
									title="Product 2" data-gallery="portfolio-gallery-product"
									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
								<a href="portfolio-details.html" title="More Details"
									class="details-link"><i class="bi bi-link-45deg"></i></a>
							</div>
						</div>
						<!-- End Portfolio Item -->

						<div
							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
							<img src="assets/img/masonry-portfolio/masonry-portfolio-6.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>Branding 2</h4>
								<p>Lorem ipsum, dolor sit</p>
								<a href="assets/img/masonry-portfolio/masonry-portfolio-6.jpg"
									title="Branding 2" data-gallery="portfolio-gallery-branding"
									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
								<a href="portfolio-details.html" title="More Details"
									class="details-link"><i class="bi bi-link-45deg"></i></a>
							</div>
						</div>
						<!-- End Portfolio Item -->

						<div
							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
							<img src="assets/img/masonry-portfolio/masonry-portfolio-7.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>App 3</h4>
								<p>Lorem ipsum, dolor sit</p>
								<a href="assets/img/masonry-portfolio/masonry-portfolio-7.jpg"
									title="App 3" data-gallery="portfolio-gallery-app"
									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
								<a href="portfolio-details.html" title="More Details"
									class="details-link"><i class="bi bi-link-45deg"></i></a>
							</div>
						</div>
						<!-- End Portfolio Item -->

						<div
							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
							<img src="assets/img/masonry-portfolio/masonry-portfolio-8.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>Product 3</h4>
								<p>Lorem ipsum, dolor sit</p>
								<a href="assets/img/masonry-portfolio/masonry-portfolio-8.jpg"
									title="Product 3" data-gallery="portfolio-gallery-product"
									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
								<a href="portfolio-details.html" title="More Details"
									class="details-link"><i class="bi bi-link-45deg"></i></a>
							</div>
						</div>
						<!-- End Portfolio Item -->

						<div
							class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
							<img src="assets/img/masonry-portfolio/masonry-portfolio-9.jpg"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<h4>Branding 3</h4>
								<p>Lorem ipsum, dolor sit</p>
								<a href="assets/img/masonry-portfolio/masonry-portfolio-9.jpg"
									title="Branding 2" data-gallery="portfolio-gallery-branding"
									class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
								<a href="portfolio-details.html" title="More Details"
									class="details-link"><i class="bi bi-link-45deg"></i></a>
							</div>
						</div>
						<!-- End Portfolio Item -->

					</div>
					<!-- End Portfolio Container -->

				</div>

			</div>

		</section>
		<!-- /Portfolio Section -->

		<!-- Team Section -->
		<section id="team" class="team section">

			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
				<h2>Team</h2>
				<p>Necessitatibus eius consequatur ex aliquid fuga eum quidem
					sint consectetur velit</p>
			</div>
			<!-- End Section Title -->

			<div class="container">

				<div class="row gy-4">

					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
						<div class="team-member d-flex align-items-start">
							<div class="pic">
								<img src="assets/img/team/team-1.jpg" class="img-fluid" alt="">
							</div>
							<div class="member-info">
								<h4>Walter White</h4>
								<span>Chief Executive Officer</span>
								<p>Explicabo voluptatem mollitia et repellat qui dolorum
									quasi</p>
								<div class="social">
									<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i
										class="bi bi-facebook"></i></a> <a href=""><i
										class="bi bi-instagram"></i></a> <a href=""> <i
										class="bi bi-linkedin"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
					<!-- End Team Member -->

					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
						<div class="team-member d-flex align-items-start">
							<div class="pic">
								<img src="assets/img/team/team-2.jpg" class="img-fluid" alt="">
							</div>
							<div class="member-info">
								<h4>Sarah Jhonson</h4>
								<span>Product Manager</span>
								<p>Aut maiores voluptates amet et quis praesentium qui senda
									para</p>
								<div class="social">
									<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i
										class="bi bi-facebook"></i></a> <a href=""><i
										class="bi bi-instagram"></i></a> <a href=""> <i
										class="bi bi-linkedin"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
					<!-- End Team Member -->

					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="300">
						<div class="team-member d-flex align-items-start">
							<div class="pic">
								<img src="assets/img/team/team-3.jpg" class="img-fluid" alt="">
							</div>
							<div class="member-info">
								<h4>William Anderson</h4>
								<span>CTO</span>
								<p>Quisquam facilis cum velit laborum corrupti fuga rerum
									quia</p>
								<div class="social">
									<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i
										class="bi bi-facebook"></i></a> <a href=""><i
										class="bi bi-instagram"></i></a> <a href=""> <i
										class="bi bi-linkedin"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
					<!-- End Team Member -->

					<div class="col-lg-6" data-aos="fade-up" data-aos-delay="400">
						<div class="team-member d-flex align-items-start">
							<div class="pic">
								<img src="assets/img/team/team-4.jpg" class="img-fluid" alt="">
							</div>
							<div class="member-info">
								<h4>Amanda Jepson</h4>
								<span>Accountant</span>
								<p>Dolorum tempora officiis odit laborum officiis et et
									accusamus</p>
								<div class="social">
									<a href=""><i class="bi bi-twitter-x"></i></a> <a href=""><i
										class="bi bi-facebook"></i></a> <a href=""><i
										class="bi bi-instagram"></i></a> <a href=""> <i
										class="bi bi-linkedin"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
					<!-- End Team Member -->

				</div>

			</div>

		</section>
		<!-- /Team Section -->




		<!-- Contact Section -->
		<section id="contact" class="contact section">

			<!-- Section Title -->
			<div class="container section-title" data-aos="fade-up">
				<h2>Contact</h2>
				<p>Necessitatibus eius consequatur ex aliquid fuga eum quidem
					sint consectetur velit</p>
			</div>
			<!-- End Section Title -->

			<div class="container" data-aos="fade-up" data-aos-delay="100">

				<div class="row gy-4">

					<div class="col-lg-5">

						<div class="info-wrap">
							<div class="info-item d-flex" data-aos="fade-up"
								data-aos-delay="200">
								<i class="bi bi-geo-alt flex-shrink-0"></i>
								<div>
									<h3>Address</h3>
									<p>A108 Adam Street, New York, NY 535022</p>
								</div>
							</div>
							<!-- End Info Item -->

							<div class="info-item d-flex" data-aos="fade-up"
								data-aos-delay="300">
								<i class="bi bi-telephone flex-shrink-0"></i>
								<div>
									<h3>Call Us</h3>
									<p>+1 5589 55488 55</p>
								</div>
							</div>
							<!-- End Info Item -->

							<div class="info-item d-flex" data-aos="fade-up"
								data-aos-delay="400">
								<i class="bi bi-envelope flex-shrink-0"></i>
								<div>
									<h3>Email Us</h3>
									<p>info@example.com</p>
								</div>
							</div>
							<!-- End Info Item -->

							<iframe
								src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d48389.78314118045!2d-74.006138!3d40.710059!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a22a3bda30d%3A0xb89d1fe6bc499443!2sDowntown%20Conference%20Center!5e0!3m2!1sen!2sus!4v1676961268712!5m2!1sen!2sus"
								frameborder="0" style="border: 0; width: 100%; height: 270px;"
								allowfullscreen="" loading="lazy"
								referrerpolicy="no-referrer-when-downgrade"></iframe>
						</div>
					</div>

					<div class="col-lg-7">
						<form action="forms/contact.php" method="post"
							class="php-email-form" data-aos="fade-up" data-aos-delay="200">
							<div class="row gy-4">

								<div class="col-md-6">
									<label for="name-field" class="pb-2">Your Name</label> <input
										type="text" name="name" id="name-field" class="form-control"
										required="">
								</div>

								<div class="col-md-6">
									<label for="email-field" class="pb-2">Your Email</label> <input
										type="email" class="form-control" name="email"
										id="email-field" required="">
								</div>

								<div class="col-md-12">
									<label for="subject-field" class="pb-2">Subject</label> <input
										type="text" class="form-control" name="subject"
										id="subject-field" required="">
								</div>

								<div class="col-md-12">
									<label for="message-field" class="pb-2">Message</label>
									<textarea class="form-control" name="message" rows="10"
										id="message-field" required=""></textarea>
								</div>

								<div class="col-md-12 text-center">
									<div class="loading">Loading</div>
									<div class="error-message"></div>
									<div class="sent-message">Your message has been sent.
										Thank you!</div>

									<button type="submit">Send Message</button>
								</div>

							</div>
						</form>
					</div>
					<!-- End Contact Form -->

				</div>

			</div>

		</section>
		<!-- /Contact Section -->
<!-- footer 이사감 -->
<jsp:include page="../include/footer_user.jsp"></jsp:include>
<!-- footer 이사감 -->