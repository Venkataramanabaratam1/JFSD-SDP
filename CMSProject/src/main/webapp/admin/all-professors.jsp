<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 
<html lang="en">

<head>
	
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Admin Dashboard </title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <link rel="stylesheet" href="vendor/bootstrap-select/dist/css/bootstrap-select.min.css">
	<!-- Datatable -->
    <link href="vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
	<link href="css/profile.css" rel="stylesheet">
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
                            <h4></h4>
                            <a href="all-professors"><h4>All Professors</h4></a>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="../adminhome">Home</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0);">Professors</a></li>
                            <li class="breadcrumb-item active"><a href="all-professors">All Professors</a></li>
                        </ol>
                    </div>
                </div>
				
				<div class="row">
					<div class="col-lg-12">
						<ul class="nav nav-pills mb-3">
							<li class="nav-item"><a href="#list-view" data-toggle="tab" class="nav-link btn-primary mr-1 show active">List View</a></li>
							<li class="nav-item"><a href="#grid-view" data-toggle="tab" class="nav-link btn-primary">Grid View</a></li>
						</ul>
					</div>
					<div class="col-lg-12">
						<div class="row tab-content">
							<div id="list-view" class="tab-pane fade active show col-lg-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">All Professors  </h4>
										<a href="add-professor.jsp" class="btn btn-primary">+ Add new</a>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table id="example3" class="display" style="min-width: 845px">
												<thead>
													<tr>
														<th>Image</th>
                                                        <th>ID</th>
                                                        <th>Name</th>
                                                        <th>Department</th>
                                                        <th>Mobile</th>
                                                        <th>Email</th>
                                                        <th>Joining Date</th>
                                                        <th>Action</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach items="${professors}"  var="p"> 
													<tr>
														<td>
														<img src='displayfacultyimage?id=${p.id}' class="rounded-circle" width="35" alt="" style="border: 2px solid #fff; object-fit: cover; border-radius: 50%; height: 100px; width: 100px;">
														</td>
														<td><c:out value="${p.id}" /></td>
														<td><c:out value="${p.firstname} ${p.lastname}" /></td>
														<td><c:out value="${p.department}" /></td>
														<td><a href="https://wa.me/${p.contact}" target="_blank"><strong><c:out value="${p.contact}" /></strong></a></td>
														<td><a href="mailto:${p.email}" target="_blank"><strong><c:out value="${p.email}" /></strong></a></td>
														<td><c:out value="${p.joiningdate}" /></td>
														<td>
															<a href="./edit-professor?id=${p.id}" class="btn btn-sm btn-primary"><i class="la la-pencil"></i></a>
															<a href='<c:url value="deleteprofessor/${p.id}"></c:url>' class="btn btn-sm btn-danger" id="deleteButton"><i class="la la-trash-o"></i></a>

														</td>												
													</tr>
													</c:forEach> 
												</tbody>
											</table>
										</div>
									</div>
                                </div>
                            </div>
							<div id="grid-view" class="tab-pane fade col-lg-12">
								<div class="row">
								<c:forEach items="${professors}"  var="p"> 
									<div class="col-lg-4 col-md-6 col-sm-6 col-12">
										<div class="card card-profile">
											<div class="card-header justify-content-end pb-0">
												<div class="dropdown">
													<button class="btn btn-link" type="button" data-toggle="dropdown">
														<span class="dropdown-dots fs--1"></span>
													</button>
													<div class="dropdown-menu dropdown-menu-right border py-0">
														<div class="py-2">
															<a class="dropdown-item" href="./edit-professor?id=${p.id}">Edit</a>
															<a class="dropdown-item text-danger" href='<c:url value="deleteprofessor/${p.id}"></c:url>'>Delete</a>
														</div>
													</div>
												</div>
											</div>
											<div class="card-body pt-2">
												<div class="text-center">
													<div class="profile-photo">
														<img src='displayfacultyimage?id=${p.id}' width="100" class="img-fluid rounded-circle" alt="" style="border: 2px solid #fff; object-fit: cover; border-radius: 50%; height: 100px; width: 100px;">
													</div>
													<h3 class="mt-4 mb-1"><c:out value="${p.firstname} ${p.lastname}" /></h3>
													<p class="text-muted"><c:out value="${p.department}" /></p>
													<ul class="list-group mb-3 list-group-flush">
														<li class="list-group-item px-0 d-flex justify-content-between">
															<span class="mb-0">Phone No. :</span><strong><c:out value="${p.contact}" /></strong></li>
														<li class="list-group-item px-0 d-flex justify-content-between">
															<span class="mb-0">Email:</span><strong><c:out value="${p.email}" /></strong></li>
														<li class="list-group-item px-0 d-flex justify-content-between">
															<span class="mb-0">Address:</span><c:out value="${p.address}" /></li>
													</ul>
													<a class="btn btn-outline-primary btn-rounded mt-3 px-4" href="#">Read More</a>
												</div>
											</div>
										</div>
									</div>
									</c:forEach> 
								</div>
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
	
	<!-- Datatable -->
    <script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="js/plugins-init/datatables.init.js"></script>
	
    <!-- Svganimation scripts -->
    <script src="vendor/svganimation/vivus.min.js"></script>
    <script src="vendor/svganimation/svg.animation.js"></script>
    <script src="js/styleSwitcher.js"></script>

</body>
</html>