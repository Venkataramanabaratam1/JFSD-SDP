<%@ page  isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<html lang="en">

<head>

     <%@ include file="studentheader.jsp" %>	
	
</head>

<body id="bg">
<div class="page-wraper">
<div id="loading-icon-bx"></div>

<!-- Navbar -->
       <%@ include file="studentnav.jsp" %>

    <!-- Content -->
    <div class="page-content bg-white">
        <!-- inner page banner -->
        <div class="page-banner ovbl-dark" style="background-image:url(assets/images/student/banner2.jpg);">
            <div class="container">
                <div class="page-banner-entry">
                    <h1 class="text-white">Courses Details</h1>
				 </div>
            </div>
        </div>
		<!-- Breadcrumb row -->
		<div class="breadcrumb-row">
			<div class="container">
				<ul class="list-inline">
					<li><a href="#">Home</a></li>
					<li>Courses Details</li>
				</ul>
			</div>
		</div>
		<!-- Breadcrumb row END -->
        <!-- inner page banner END -->
		<div class="content-block">
            <!-- About Us -->
			<div class="section-area section-sp1">
                <div class="container">
					 <div class="row d-flex flex-row-reverse">
						<div class="col-lg-3 col-md-4 col-sm-12 m-b30">
							<div class="course-detail-bx">
								<h2 align="center">Details</h2>
								<div class="teacher-bx">
									<div class="teacher-info">
										<div class="teacher-thumb">
											<img src="displaystudentimage?id=${s.id}" alt="" style="max-height: 50px; max-width: 80px; border-radius: 30%;object-fit: cover;">
											
										</div>
										<div class="teacher-name" align="center">
											<h5 align="center">${s.firstname}</h5>
											<span>${s.id}</span>
										</div>
									</div>
								</div>
								<div class="course-info-list scroll-page">
									<ul class="navbar">
										<li><a class="nav-link" href="#overview"><i class="ti-zip"></i>Overview</a></li>
										<li><a class="nav-link" href="#curriculum"><i class="ti-bookmark-alt"></i>Curriculum</a></li>
										<li><a class="nav-link" href="#instructor"><i class="ti-user"></i>Instructor</a></li>
									</ul>
								</div>
							</div>
						</div>
					
						<div class="col-lg-9 col-md-8 col-sm-12">
							<div class="courses-post">
								<div class="ttr-post-media media-effect">
								</div>
								<div class="ttr-post-info">
									<div class="ttr-post-title ">
										<h2 class="post-title">${c.title}</h2>
									</div>
									<div class="ttr-post-text">
										<p>${c.description}</p>
									</div>
								</div>
							</div>
							<div class="courese-overview" id="overview">
								<h4>Overview</h4>
								<div class="row">
									<div class="col-md-12 col-lg-4">
										<ul class="course-features">
											<li><i class="ti-book"></i> <span class="label">Lectures</span> <span class="value">8</span></li>
											<li><i class="ti-help-alt"></i> <span class="label">Quizzes</span> <span class="value">1</span></li>
											<li><i class="ti-time"></i> <span class="label">Duration</span> <span class="value">60 hours</span></li>
											<li><i class="ti-stats-up"></i> <span class="label">Skill level</span> <span class="value">Beginner</span></li>
											<li><i class="ti-smallcap"></i> <span class="label">Language</span> <span class="value">English</span></li>
											<li><i class="ti-user"></i> <span class="label">Students</span> <span class="value">32</span></li>
											<li><i class="ti-check-box"></i> <span class="label">Assessments</span> <span class="value">Yes</span></li>
										</ul>
									</div>
									<div class="col-md-12 col-lg-8">
										<h5 class="m-b5">Course Description</h5>
										<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
										<h5 class="m-b5">Certification</h5>
										<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
										<h5 class="m-b5">Learning Outcomes</h5>
										<ul class="list-checked primary">
											<li>Over 37 lectures and 55.5 hours of content!</li>
											<li>LIVE PROJECT End to End Software Testing Training Included.</li>
											<li>Learn Software Testing and Automation basics from a professional trainer from your own desk.</li>
											<li>Information packed practical training starting from basics to advanced testing techniques.</li>
											<li>Best suitable for beginners to advanced level users and who learn faster when demonstrated.</li>
											<li>Course content designed by considering current software testing technology and the job market.</li>
											<li>Practical assignments at the end of every session.</li>
											<li>Practical learning experience with live project work and examples.cv</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="m-b30" id="curriculum">
								<h4>Curriculum</h4>
								<ul class="curriculum-list">
										<li>
											<h5>First Level</h5>
											<ul>
												<li>
													<div class="curriculum-list-box">
														<span>Lesson 1.</span> Introduction to UI Design
													</div>
													<span>120 minutes</span>
												</li>
												<li>
													<div class="curriculum-list-box">
														<span>Lesson 2.</span> User Research and Design
													</div>
													<span>60 minutes</span>
												</li>
												<li>
													<div class="curriculum-list-box">
														<span>Lesson 3.</span> Evaluating User Interfaces Part 1
													</div>
													<span>85 minutes</span>
												</li>
											</ul>
										</li>
										<li>
											<h5>Second Level</h5>
											<ul>
												<li>
													<div class="curriculum-list-box">
														<span>Lesson 1.</span> Prototyping and Design
													</div>
													<span>110 minutes</span>
												</li>
												<li>
													<div class="curriculum-list-box">
														<span>Lesson 2.</span> UI Design Capstone
													</div>
													<span>120 minutes</span>
												</li>
												<li>
													<div class="curriculum-list-box">
														<span>Lesson 3.</span> Evaluating User Interfaces Part 2
													</div>
													<span>120 minutes</span>
												</li>
											</ul>
										</li>
										<li>
											<h5>Final</h5>
											<ul>
												<li>
													<div class="curriculum-list-box">
													<c:forEach items="${docs}" var="doc">
                                                     <li>
													         <div class="curriculum-list-box">
														         <span>Lesson ${doc.id}.</span> ${doc.docName}
													         </div>
													             <span><a href="<c:url value='download?id=${doc.id}' />">Download</a></span>
												     </li>
                                                     </c:forEach>
													</div>
												</li>
											</ul>
										</li>
									</ul>
							</div>
							<div class="" id="instructor">
								<h4>Instructor</h4>
								<div class="instructor-bx">
									<div class="instructor-author">
										<img src="displayfacultyimage?id=${c.faculty.id}" alt="" style="max-height: 100px; max-width: 100px">
									</div>
									<div class="instructor-info">
										<h6>${c.faculty.firstname}</h6>
										<span>${c.faculty.designation}</span>
										<ul class="list-inline m-tb10">
											<li><a href="#" class="btn sharp-sm whatsapp"><i class="fa fa-whatsapp"></i></a></li>
											<li><a href="#" class="btn sharp-sm telegram"><i class="fa fa-telegram"></i></a></li>
											<li><a href="#" class="btn sharp-sm linkedin"><i class="fa fa-linkedin"></i></a></li>
											<li><a href="#" class="btn sharp-sm instagram"><i class="fa fa-instagram"></i></a></li>
										</ul>
										<p class="m-b0">${c.faculty.department}</p>
									</div>
								</div>
							</div>	
						</div>
						
					</div>
				</div>
            </div>
        </div>
		<!-- contact area END -->
		
    </div>
    <!-- Content END-->
	
	<!-- Footer -->
	<%@ include file="studentfooter.jsp" %>
	
    <button class="back-to-top fa fa-chevron-up" ></button>
</div>
<!-- External JavaScripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/vendors/bootstrap/js/popper.min.js"></script>
<script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
<script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
<script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
<script src="assets/vendors/counter/waypoints-min.js"></script>
<script src="assets/vendors/counter/counterup.min.js"></script>
<script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
<script src="assets/vendors/masonry/masonry.js"></script>
<script src="assets/vendors/masonry/filter.js"></script>
<script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
<script src="assets/js/jquery.scroller.js"></script>
<script src="assets/js/functions.js"></script>
<script src="assets/js/contact.js"></script>
</body>

</html>
