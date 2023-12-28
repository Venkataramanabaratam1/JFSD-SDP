<!DOCTYPE html>
<html lang="en">

<head>
	
    <%@ include file="adminheader.jsp" %>
    
    <style>
	.image-container {
  width: 200px; 
  height: 200px; 
  overflow: hidden; 
}

.image-container img {
  width: 100%;
  height: 100%;
  object-fit: cover; 
}	
	</style>

</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

       <!-- AdminNavbar Start -->

     <!-- adminheader1 navbar in adminpages -->
     <%@ include file="adminheader1.jsp" %>
        
        <!-- AdminNavbar End -->


        <!-- Sidebar -->
     <%@ include file="adminsidebar.jsp" %>

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <!-- row -->
            <div class="container-fluid">
			
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <a href="#"><h4>Edit Professor</h4></a>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="all-professors">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">Professors</a></li>
                            <li class="breadcrumb-item active"><a href="#">Edit Professor</a></li>
                        </ol>
                    </div>
                </div>
				
				<div class="row">
					<div class="col-xl-12 col-xxl-12 col-sm-12">
                        <div class="card">
                            <div class="card-header">
								<h5 class="card-title">Basic Info</h5>
							</div>
							<div class="card-body">
                                <form action="updatefaculty" method="post" enctype="multipart/form-data">
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label class="form-label">First Name</label>
												<input type="text" class="form-control" name="facultyfname" value="${p.firstname}">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label class="form-label">Last Name</label>
												<input type="text" class="form-control" name="facultylname" value="${p.lastname}">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label class="form-label">Email Here</label>
												<input type="text" class="form-control" name="facultyemail"  value="${p.email}">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label class="form-label">Joining Date</label>
												<input name="facultyjod" class="datepicker-default form-control" id="datepicker" value="${p.joiningdate}">
											</div>
										</div>
                                        <div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label class="form-label">Roll No.</label>
												<input type="text" class="form-control" name="facultyid" value="${p.id}">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label class="form-label">Password</label>
												<input type="password" class="form-control" name="facultypass" value="${p.password}">
											</div>
										</div>

										<div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label class="form-label">Mobile Number</label>
												<input type="text" class="form-control" name="facultymobile" value="${p.contact}">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label class="form-label">Gender</label>
												<select class="form-control" name="facultygender">
												<option value="${p.gender}" selected>${p.gender}</option>
													<option value="Male">Male</option>
													<option value="Female">Female</option>
												</select>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label class="form-label">Designation</label>
												<input type="text" class="form-control" name="facultydeg" value="${p.designation}">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label class="form-label">Department</label>
												<select class="form-control" name="facultydept" >
												<option value="${p.department}" selected>${p.department}</option>
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
										<div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label class="form-label">Date of Birth</label>
												<input name="facultydob" class="datepicker-default form-control" id="datepicker1" value="${p.dateofbirth}">
											</div>
										</div>
                                        <div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label class="form-label">Salary</label>
												<input type="number" class="form-control" name="facultysal" value="${p.salary}">
											</div>
										</div>
										<div class="col-lg-10 col-md-10 col-sm-12">
  											<div class="form-group">
    											<label class="form-label">Profile Image</label>
    											<div class="image-container">
      												<img src='displayfacultyimage?id=${p.id}' alt="Professor Image">
    											</div>
    											<input type="file" class="form-control" name="facultyimg" accept=".jpg, .jpeg, .png" style="border: 1px solid #ced4da; padding: 5px; max-width: 100%; height: auto;" required="required">
        									<p style="color: #6c757d; font-size: 14px;">Maximum size should be 10MB</p>
  											</div>
										</div>
                                        <div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label class="form-label">Address</label>
												<textarea class="form-control" rows="5" name="facultyaddress">${p.address}</textarea>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<button type="submit" class="btn btn-primary">Submit</button>
											<button type="submit" class="btn btn-light" onclick="window.location.href = 'all-professors';">Cancel</button>
										</div>
									</div>
								</form>
                            </div>
                        </div>
                    </div>
				</div>
				
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->


        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="../index.jsp" target="_blank">AcademeX</a> 2023</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->



    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
<script src="vendor/global/global.min.js"></script>
	<script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="js/custom.min.js"></script>
	<script src="js/dlabnav-init.js"></script>

    <!-- Demo scripts -->
    <script src="js/dashboard/dashboard-2.js"></script>

	<!-- Svganimation scripts -->
    <script src="vendor/svganimation/vivus.min.js"></script>
    <script src="vendor/svganimation/svg.animation.js"></script>
    <script src="js/styleSwitcher.js"></script>
	
	<!-- pickdate -->
    <script src="vendor/pickadate/picker.js"></script>
    <script src="vendor/pickadate/picker.time.js"></script>
    <script src="vendor/pickadate/picker.date.js"></script>
	
	<!-- Pickdate -->
    <script src="js/plugins-init/pickadate-init.js"></script>
	<script>
    document.getElementById('facultyaddress').value = ${p.address};
    </script>
</body>
</html>