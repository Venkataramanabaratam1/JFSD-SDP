<!DOCTYPE html>
<html lang="en">

<head>
	
   <%@ include file="adminheader.jsp" %>

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
                            <a href="add-student"><h4>Add Student</h4></a>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="../adminhome">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Students</a></li>
                            <li class="breadcrumb-item active"><a href="add-student">Add Student</a></li>
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
                                <form action="insertstudent" method="post" enctype="multipart/form-data">
                  <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                      <div class="form-group">
                        <label class="form-label">First Name</label>
                        <input type="text" name="studentfname" class="form-control" required="required">
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                      <div class="form-group">
                        <label class="form-label">Last Name</label>
                        <input type="text" name="studentlname" class="form-control" required="required">
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                      <div class="form-group">
                        <label class="form-label">Email</label>
                        <input type="text" name="studentemail" class="form-control" required="required">
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                      <div class="form-group">
                        <label class="form-label">Registration Date</label>
                        <input name="studentregdate" class="datepicker-default form-control" id="datepicker" required="required">
                      </div>
                    </div>
                      <div class="col-lg-6 col-md-6 col-sm-12">
                      <div class="form-group">
                        <label class="form-label">Password</label>
                        <input type="password" name="studentpass" class="form-control" required="required">
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                      <div class="form-group">
                        <label class="form-label">Roll No.</label>
                        <input type="text" name="studentid" class="form-control" required="required">
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                      <div class="form-group">
                        <label class="form-label">Year</label>
                        <select class="form-control" name="studentyear">
                          <option value="Year">Year</option>
                          <option value="year1">I Year</option>
                          <option value="year2">II Year</option>
                          <option value="year2">III Year</option>
                          <option value="year2">IV Year</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                      <div class="form-group">
                        <label class="form-label">Gender</label>
                        <select class="form-control" name="studentgender">
                          <option value="Gender">Gender</option>
                          <option value="Male">Male</option>
                          <option value="Female">Female</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                      <div class="form-group">
                        <label class="form-label">Mobile Number</label>
                        <input type="text" class="form-control" name="studentmobile" required="required">
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                      <div class="form-group">
                        <label class="form-label">Parents Name</label>
                        <input type="text" class="form-control" name="studentpname">
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                      <div class="form-group">
                        <label class="form-label">Parents Mobile Number</label>
                        <input type="text" class="form-control" name="studentpmobile">
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                      <div class="form-group">
                        <label class="form-label">Date of Birth</label>
                        <input class="datepicker-default form-control" id="datepicker1" name="studentdob" required="required">
                      </div>
                    </div>
                    <div class="col-lg-10 col-md-10 col-sm-12">
    				<div class="form-group">
        				<label class="form-label">Profile Image</label>
        				<input type="file" class="form-control" name="studentimg" accept=".jpg, .jpeg, .png" style="border: 1px solid #ced4da; padding: 5px; max-width: 100%; height: auto;" required="required">
        				<p style="color: #6c757d; font-size: 14px;">Maximum size should be 10MB</p>
    				</div>
					</div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div class="form-group">
                        <label class="form-label">Address</label>
                        <textarea class="form-control" rows="5" name="studentaddress" required="required"></textarea>
                      </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <button type="submit" class="btn btn-primary">Submit</button>
                      <button type="submit" class="btn btn-light">Cancel</button>
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
	
</body>
</html>