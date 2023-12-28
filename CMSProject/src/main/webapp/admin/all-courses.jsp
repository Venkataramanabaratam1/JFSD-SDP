<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">

<head>
	
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Admin Dashboard </title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <link rel="stylesheet" href="vendor/bootstrap-select/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/skin.css">

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
                            <h4>All Courses</h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="../adminhome">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Courses</a></li>
                            <li class="breadcrumb-item active"><a href="all-courses">All Courses</a></li>
                        </ol>
                    </div>
                </div>
				
				<div class="row">
				<c:forEach items="${courses}"  var="c"> 
					<div class="col-xl-3 col-xxl-4 col-lg-4 col-md-6 col-sm-6">
						<div class="card">
							<img class="img-fluid" src='displaycourseimage?id=${c.id}' alt="" style="width: 400px;height: 250px">
							<div class="card-body">
								<h4><center>${c.title}</center></h4>
								<ul class="list-group mb-3 list-group-flush">
									<li class="list-group-item px-0 d-flex justify-content-between">
										<span class="mb-0">Code :</span><strong>${c.code}</strong></li>
									<li class="list-group-item px-0 d-flex justify-content-between">
										<span class="mb-0">Professor :</span><strong>${c.faculty.firstname}</strong></li>
									<li class="list-group-item px-0 d-flex justify-content-between">
										<span><i class="fa fa-graduation-cap text-primary mr-2"></i></span><strong>${c.department}</strong></li>
								</ul>
								<div class="row">
                                   <div class="col">
                                        <a href="#" class="btn btn-primary">Read More</a>
                                   </div>
                                   <div class="col d-flex align-items-center justify-content-start"> <!-- Adjust the margin as needed -->
                                        <div class="dropdown" >
                                             <button class="btn btn-link" type="button" data-toggle="dropdown">
                                                  <span class="dropdown-dots fs--1" style="margin-left: 90px;"></span>
                                             </button>
                                        <div class="dropdown-menu dropdown-menu-right border py-0">
                                           <div class="py-2">
                                               <a class="dropdown-item" href="./edit-courses?id=${c.id}">Edit</a>
                                               <a class="dropdown-item text-danger" href='<c:url value="deletecourse/${c.id}"></c:url>'>Delete</a>
                                          </div>
                                       </div>
                                       </div>
                                 </div>
                               </div>
							</div>
						</div>
					</div>
			</c:forEach> 
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
	
</body>
</html>