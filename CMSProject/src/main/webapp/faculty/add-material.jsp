<%@ page  isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
     
      <%@ include file="facultyheader.jsp" %>
		
	<style>
	.form-group-clo{
    width: 38px; /* Set the width and height to create a square */
    height: 30px;
    border: 2px solid transparent; /* Set an initial transparent border */
    transition: border-color 0.3s, background-color 0.3s; /* Add transitions for smooth color change */
    border-color: red;
    border-radius: 10px;
    margin-top: 5px; /* Add a 2 cm margin at the top to move the div down */
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
<body id="bg">
<div class="page-wraper">
<div id="loading-icon-bx"></div>

    <!-- Navbar -->
	<%@ include file="facultynav.jsp" %>
    
    <!-- Content -->
    <div class="page-content bg-white">
        <!-- inner page banner -->
        <div class="page-banner ovbl-dark" style="background-image:url(assets/images/student/banner3.jpg);">
            <div class="container">
                <div class="page-banner-entry">
                    <h1 class="text-white">Our Courses</h1>
				 </div>
            </div>
        </div>
		<!-- Breadcrumb row -->
		<div class="breadcrumb-row">
			<div class="container">
				<ul class="list-inline">
					<li><a href="../facultyhome">Home</a></li>
					<li>Our Courses</li>
				</ul>
			</div>
		</div>
		<!-- Breadcrumb row END -->
        <!-- inner page banner END -->
      </div>
      
      <!--Main container start -->
	<main class="ttr-wrapper">
		<div class="container-fluid">
			<div class="row">
				<!-- Your Profile Views Chart -->
				<div class="col-lg-12 m-b30">
					<div class="widget-box">
						<div class="wc-title">
						       <br><br>
							<center><h4>Add Course Materials</h4></center>
						</div>
						<div class="widget-inner">
							<form action="updatecourses" method="post" enctype="multipart/form-data">
								<div class="row">
									<div class="col-12">
										<div class="ml-auto">
											<h3>1. Basic info</h3>
										</div>
									</div>
									<div class="form-group col-6">
										<label class="col-form-label">Course Title</label>
										<input type="text" class="form-control" name="coursetitle" value="${c.title}" disabled="disabled">
									</div>
									<div class="form-group col-6">
										<label class="col-form-label">Course Code</label>
										<input type="text" class="form-control" name="coursecode" value="${c.code}" disabled="disabled">
									</div>
									<div class="form-group col-6">
										<label class="col-form-label">Department</label>
												<select class="form-control" name="coursedept" id="coursedept" disabled="disabled">
													<option value="${c.department}" selected>${c.department}</option>
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
									<div class="form-group col-6">
										<label class="col-form-label">Professor</label>
										<select class="form-control" name="professor" id="professor" disabled="disabled">
											<option value="${c.faculty.id}" selected>${c.faculty.firstname}</option>
											<c:forEach items="${professorS}" var="p">
                                                 <option value="${p.id}" >${p.firstname} ${p.lastname} - ${p.id}</option>
                                             </c:forEach>
										</select>
									</div>
									<input type="hidden" id="hiddenInput" name="courseid" value="${c.id}"/>
									<div class="form-group col-6">
										<label class="col-form-label">Course Image</label>
        								<div class="image-container">
      									      <img src='displaycourseimage?id=${c.id}' alt="Course Image" height="250px" width="300px"> 
    									</div>
    									<%-- <input type="file" class="form-control" data-default-file="${c.cimage}" name="courseimage" accept=".jpg, .jpeg, .png" style="border: 1px solid #ced4da; " required="required">
        							    <p style="color: #6c757d; font-size: 14px;">Maximum size should be 10MB</p> --%>
									</div>
									<div class="seperator"></div>
									
									<div class="col-12 m-t20">
										<div class="ml-auto m-b5">
											<h3>2. Description</h3>
										</div>
									</div>
									<div class="form-group col-12">
										<label class="col-form-label">Course description</label>
										<div>
											<textarea class="form-control" rows="5" name="coursedetails">${c.description}</textarea>
										</div>
									</div>
									
									<div class="col-lg-12 col-md-10 col-sm-12">
        <table style="width:80%;  border-collapse: separate; border-spacing: 10px;">
        <thead>
            <tr align="center">
                <th>Course Material Type</th>
                <th>File Name</th>
                <th>File</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${docs}" var="doc">
                <tr align="center">
                    <td>${doc.docCategory}</td>
                    <td>${doc.docName}</td>
                    <td><a href="<c:url value='download?id=${doc.id}' />">Download</a></td>
                    <td><a class="dropdown-item text-danger" href='<c:url value="deletematerial/${doc.id}"></c:url>'>
                             <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br><br><br>
</div>
									<div class="col-12 m-t20">
										<div class="ml-auto">
											<h3 class="m-form__section">3. Add Item</h3>
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
																<input class="form-control" type="file" name="files" multiple >
															</div>
														</div>
													</div>
												</td>
											</tr>
										</table>
										<br><br><br>
										</div>
									<div class="col-12">
									&nbsp;&nbsp;
										<button type="submit" class="btn btn-primary">Save changes</button>
										<button type="reset" class="btn-secondry" onclick="window.location.href = 'courses';">Cancel</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Your Profile Views Chart END-->
			</div>
		</div>
	</main>
	<div class="ttr-overlay"></div>
    
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
<script src="assets/vendors/file-upload/imageuploadify.min.js"></script>
<script>
document.getElementById('coursedetails').value = ${p.description};
</script>
</body>

</html>
