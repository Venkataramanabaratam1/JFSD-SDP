<%@ page  isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <%@ include file="facultyheader.jsp" %>
</head>
<body id="bg">
<div class="page-wraper">
<div id="loading-icon-bx"></div>

   <!-- Navbar -->
   <%@ include file="facultynav.jsp" %>
   
    <!-- Content -->
    <div class="page-content bg-white">
        <!-- inner page banner -->
        <div class="page-banner ovbl-dark" style="background-image:url(assets/images/student/banner1.jpg);">
            <div class="container">
                <div class="page-banner-entry">
                    <h1 class="text-white">Profile</h1>
				 </div>
            </div>
        </div>
		<!-- Breadcrumb row -->
		<div class="breadcrumb-row">
			<div class="container">
				<ul class="list-inline">
					<li><a href="../facultyhome">Home</a></li>
					<li>Profile</li>
				</ul>
			</div>
		</div>
		<!-- Breadcrumb row END -->
        <!-- inner page banner END -->
		<div class="content-block">
            <!-- About Us -->
			<div class="section-area section-sp1">
                <div class="container">
					 <div class="row">
						<div class="col-lg-3 col-md-4 col-sm-12 m-b30">
							<div class="profile-bx text-center">
								<div class="user-profile-thumb rounded-profile-container">
                                         <img src="displayfacultyimage?id=${f.id}"  alt=""/>
								</div>
								<div class="profile-info">
									<h4>${f.firstname}</h4>
									<span>${f.email}</span>
								</div>
								<div class="profile-social">
									<ul class="list-inline m-a0">
										<li><a href="#"><i class="fa fa-facebook"></i></a></li>
										<li><a href="#"><i class="fa fa-twitter"></i></a></li>
										<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
										<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
									</ul>
								</div>
								<div class="profile-tabnav">
									<ul class="nav nav-tabs">
										<li class="nav-item">
											<a class="nav-link active" data-toggle="tab" href="#courses"><i class="ti-book"></i>Courses</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" data-toggle="tab" href="#edit-profile"><i class="ti-pencil-alt"></i>Edit Profile</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" data-toggle="tab" href="#change-password"><i class="ti-lock"></i>Change Password</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-9 col-md-8 col-sm-12 m-b30">
							<div class="profile-content-bx">
								<div class="tab-content">
									<div class="tab-pane active" id="courses">
										<div class="profile-head">
											<h3>My Courses</h3>
											<div class="feature-filters style1 ml-auto">
												<ul class="filters" data-toggle="buttons">
													<li data-filter="" class="btn active">
														<input type="radio">
														<a href="#"><span>All</span></a> 
													</li>
													<li data-filter="publish" class="btn">
														<input type="radio">
														<a href="#"><span>Publish</span></a> 
													</li>
													<li data-filter="pending" class="btn">
														<input type="radio">
														<a href="#"><span>Pending</span></a> 
													</li>
												</ul>
											</div>
										</div>
										<div class="courses-filter">
                      <div class="clearfix">
                        <ul id="masonry" class="ttr-gallery-listing magnific-image row">
                          <c:forEach items="${courses}"  var="c">
                          <li class="action-card col-xl-5 col-lg-8 col-md-16 col-sm-16 publish">
                            <div class="cours-bx">
                              <div class="action-box">
                                <img src='displaycourseimage?id=${c.id}' alt="" style="height: 200px; width: 360px">
                                <a href="#" class="btn">Read More</a>
                              </div>
                              <div class="info-bx text-center">
                                <h5><a href="#">${c.title}</a></h5>
                                <span>${c.code}</span>
                              </div>
                              <div class="cours-more-info">
                                   <div class="review">
                                     <span>${c.faculty.firstname}</span>
                                      </div>
                                  <div class="price">
                                        <button class="btn" onclick="window.location.href='courses-details?id=${c.id}'">Go to Course</button>
                                      </div>
                                    </div>
                               </div>
                          </li>
                        </c:forEach>
                        </ul>
                      </div>
                    </div>
									</div>
									<div class="tab-pane" id="edit-profile">
										<div class="profile-head">
											<h3>Edit Profile</h3>
										</div>
	<form action="updatefacultyprofile" method="post" enctype="multipart/form-data" class="edit-profile">
    <div class="">
        <div class="form-group row">
            <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                <h3> Personal Details</h3>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">First Name</label>
            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                <input class="form-control" type="text" name="facultyfname" value="${f.firstname}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Last Name</label>
            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                <input class="form-control" type="text" name="facultylname" value="${f.lastname}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Email</label>
            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                <input class="form-control" type="email" name="facultyemail" value="${f.email}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Joining Date</label>
            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                <input class="datepicker-default form-control"  name="facultyjod" id="datepicker" readonly value="${f.joiningdate}" >
            </div>
        </div>
        <div class="form-group row">
            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Faculty Id.No</label>
            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                <input class="form-control" type="text" name="facultyid" readonly  value="${f.id}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Department</label>
            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                <select class="form-control" name="facultydept">
                <option  value="${f.department}">${f.department}</option>
                    <option value="Department">Department</option>
					<option value="Computer Science & Engineering">Computer Science & Engineering</option>
		        	<option value="Electronics & Communication Engineering">Electronics & Communication Engineering</option>
					<option value="Civil Engineering">Civil Engineering</option>
					<option value="Bio Technology">Bio Technology</option>
					<option value="Information Technology">Information Technology</option>
					<option value="Mechanical Engineering">Mechanical Engineering</option>
					<option value="Electrical & Electronics Engineering">Electrical & Electronics Engineering </option>
					<option value="Electronics & Computer Engineering">Electronics & Computer Engineering </option>
                </select>
            </div>
        </div>
        <div class="form-group row">
    <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Gender</label>
    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
    <select class="form-control" name="facultygender" class="bold-option">
        <option value="${f.gender}" class="bold-option">${f.gender}</option>
        <option value="male" class="bold-option">Male</option>
        <option value="female" class="bold-option">Female</option>
    </select>
</div>
</div>
        <div class="form-group row">
            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Mobile Number</label>
            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                <input class="form-control" type="text" name="facultymobile" value="${f.contact}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Designation</label>
            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                <input class="form-control" type="text" name="facultydeg" value="${f.designation}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Salary</label>
            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                <input class="form-control" type="text" name="facultysal" value="${f.salary}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Date of Birth</label>
            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                <input class="datepicker-default form-control" name="facultydob" id="datepicker" readonly value="${f.dateofbirth}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Address</label>
            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                <textarea class="form-control" name="facultyaddress" rows="4">${f.address}</textarea>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Profile Image</label>
            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                <input type="file" class="form-control" name="facultyimg" accept=".jpg, .jpeg, .png"" required="required">
        			<p style="color: #6c757d; font-size: 14px;">Maximum size should be 10MB</p>
            </div>
        </div>
    </div>
    <div class="">
        <div class="">
            <div class="row">
                <div class="col-12 col-sm-3 col-md-3 col-lg-2">
                </div>
                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                    <button type="submit" class="btn">Save changes</button>
                    <button type="reset" class="btn-secondry">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</form>
</div>
					<div class="tab-pane" id="change-password">
                    <div class="profile-head">
                      <h3>Change Password</h3>
                    </div>
                    <form class="edit-profile" method="post" action="updatefacultypassword">
                      <div class="">
                        <div class="form-group row">
                          <div class="col-12 col-sm-8 col-md-8 col-lg-9 ml-auto">
                            <h3>Password</h3>
                          </div>
                        </div>
                        <div class="form-group row">
                          <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Current Password</label>
                          <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                            <input class="form-control" type="password" name="currentpassword" value="">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">New Password</label>
                          <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                            <input class="form-control" type="password" name="newpassword" value="">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Re Type New Password</label>
                          <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                            <input class="form-control" type="password" name="renewpassword" value="">
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-12 col-sm-4 col-md-4 col-lg-3">
                        </div>
                        <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                          <button type="submit" class="btn">Save changes</button>
                          <button type="reset" class="btn-secondry">Cancel</button>
                        </div>
                      </div>
                        
                    </form>
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
	<%@ include file="facultyfooter.jsp" %>
	
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
<script src="assets/js/functions.js"></script>
<script src="assets/js/contact.js"></script>

<!-- pickdate -->
<script src="assets/vendor/pickadate/picker.js"></script>
<script src="assets/vendor/pickadate/picker.time.js"></script>
<script src="assets/vendor/pickadate/picker.date.js"></script>

<!-- Pickdate -->
<script src="assets/js/pickadate-init.js"></script>

<script>
    document.getElementById('facultyaddress').value = ${f.address};
</script>
    
</body>

</html>
