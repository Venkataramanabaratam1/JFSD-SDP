<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 
<!DOCTYPE html>
<html lang="en">

<head>
	
	<%@ include file="adminheader.jsp" %>
	
	<style>
	.form-group-clo{
    width: 38px; /* Set the width and height to create a square */
    height: 30px;
    border: 2px solid transparent; /* Set an initial transparent border */
    transition: border-color 0.3s, background-color 0.3s; /* Add transitions for smooth color change */
    border-color: red;
    border-radius: 10px;
    margin-top: 2px; /* Add a 2 cm margin at the top to move the div down */
    position: relative;
  }

  .form-group-clo:hover {
    border-color: red; /* Change the border color to red on hover */
    background-color: red; /* Change the background color to red on hover */
  }
  
  .form-group-clo:hover .delete {
  color: white; /* Change the color of the close icon to white on hover */
}

  .delete {
    text-decoration: none;
    color: inherit;
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
                            <h4>Add Course</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="../adminhome">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Courses</a></li>
                            <li class="breadcrumb-item active"><a href="add-course">Add Course</a></li>
                        </ol>
                    </div>
                </div>
				
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Courses Details</h4>
							</div>
							<div class="card-body">
								<form action="insertcourse" method="post" enctype="multipart/form-data">
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label class="form-label">Course Title</label>
												<input type="text" class="form-control" name="coursetitle">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label class="form-label">Course Code</label>
												<input type="text" class="form-control" name="coursecode">
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label class="form-label">Department</label>
												<select class="form-control" name="coursedept" >
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
										<div class="col-lg-6 col-md-6 col-sm-12">
											<div class="form-group">
												<label class="form-label">Professor</label>
												<select class="form-control" name="professor">
												<option value="">Professor</option>
													<c:forEach items="${professors}" var="p">
                                                        <option value="${p.id}">${p.firstname} ${p.lastname} - ${p.id}</option>
                                                    </c:forEach>
												</select>
											</div>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<div class="form-group">
												<label class="form-label">Course Details</label>
												<textarea class="form-control" rows="5" name="coursedetails"></textarea>
											</div>
										</div>
										<div class="col-lg-10 col-md-10 col-sm-12">
    									<div class="form-group">
        									<label class="form-label">Course Image</label>
        									<input type="file" class="form-control" name="courseimage" style="border: 1px solid #ced4da; padding: 5px; max-width: 100%; height: auto;" required="required">
        									<p style="color: #6c757d; font-size: 14px;">Maximum size should be 10MB</p>
    									</div>
										</div>
										<div class="col-lg-10 col-md-10 col-sm-12">
										<table id="item-add" style="width:80%;">
											<tr class="list-item">
												<td>
													<div class="row">
														<div class="col-md-6">
															<label class="form-label">Course Material Type</label>
												                 <select class="form-control" name="coursetype" >
												    <option value="">Material Type</option>
													<option value="CO-1">CO - 1</option>
													<option value="CO-2">CO - 2</option>
													<option value="CO-3">CO - 3</option>
													<option value="CO-4">CO - 4</option>
													<option value="Practice-Material">Practice Materials</option>
													<option value="SLM">SLM</option>
													<option value="Question-Bank">Question Bank</option>
												                 </select>
														</div>
														<div class="col-md-6">
															<label class="form-label">File</label>
															<div>
																<input class="form-control" type="file" name="files" multiple required>
															</div>
														</div>
													</div>
												</td>
											</tr>
										</table>
										<br><br><br>
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
                <p>Copyright © Designed &amp; Developed by <a href="../index.jsp" target="_blank">AcademeX</a> 2020</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->

		<!--**********************************
           Support ticket button start
        ***********************************-->

        <!--**********************************
           Support ticket button end
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