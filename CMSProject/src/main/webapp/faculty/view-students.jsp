<%@ page  isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

	<%@ include file="facultyheader.jsp" %>
	
	<style>
		  table {
    border-collapse: collapse;
    width: 100%;
    text-align: center;
  }

  th, td {
    padding: 8px;
  }

  th {
    background-color: ;
    border-bottom: 2px solid #666;
  }

  tr:nth-child(odd) {
    background-color: #f2f2f2; /* Apply background color to odd rows */
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
                    <h1 class="text-white">View Students</h1>
				 </div>
            </div>
        </div>
		<!-- Breadcrumb row -->
		<div class="breadcrumb-row">
			<div class="container">
                        <div class="welcome-text">
                            <h4 align="center">All Students</h4>
                        </div>
                </div>
			</div>
		</div>
		<br><br>
		<div class="dropdown" align="center">
		 <form:form method="post" action="view-students">
		
               <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 250px">
                    Select Course
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <c:forEach items="${courses}" var="c">
                    <a class="dropdown-item" href="displaystudents?id=${c.id}" >${c.title}</a>
                </c:forEach>
                </div>
          </form:form>
         </div>
         <br><br>
		<!-- Breadcrumb row END -->
    </div>
    <div class="content-body">
            <!-- row -->
            <div class="container-fluid">
				
				<div class="row">
					<div class="col-lg-12">
						<div class="row tab-content">
							<div id="list-view" class="tab-pane fade active show col-lg-12">
								<div class="card">
									<div class="card-body">
										<div class="table-responsive">
											<table id="example3" class="display" style="min-width: 845px">
						<thead>
                          <tr style="align-items: center;">
                            <th>Image</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Gender</th>
                            <th>Mobile</th>
                            <th>Year</th>
                            <th>Date of Birth</th>
                            <th>Email</th>
                            <th>Admission Date</th>
                            <th>Address</th>
                          </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${students}"  var="s"> 
                          <tr>
                            <td>
                            <img src='displaystudentimage?id=${s.id}' class="rounded-circle" width="35" alt="">
                            </td>
                            <td><strong><c:out value="${s.id}" /></strong></td>
                            <td><c:out value="${s.firstname} ${s.lastname}" /></td>
                            <td><c:out value="${s.gender}" /></td>
                            <td><a href="javascript:void(0);"><strong><c:out value="${s.contact}" /></strong></a></td>
                            <td><c:out value="${s.year}" /></td>
                            <td><c:out value="${s.dateofbirth}"/></td>
                            <td><a href="javascript:void(0);"><strong><c:out value="${s.email}" /></strong></a></td>
                            <td><c:out value="${s.regdate}" /></td>
                            <td><c:out value="${s.address}" /></td>
                          </tr>
                        </c:forEach>
                        </tbody>
											</table>
										</div>
									</div>
                                </div>
                            </div>
						</div>
					</div>
				</div>
			   
            </div>
        </div>
    <!-- Content END-->
    <br><br><br><br><br>

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
</body>

</html>
