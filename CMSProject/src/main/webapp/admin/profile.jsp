<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>AcademeX-Profile Page</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <link href="vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="css/style.css" rel="stylesheet">
    <link href="css/profile.css" rel="stylesheet">
    <link rel="stylesheet" href="css/skin.css">
      
    <link href="css/profile.css" rel="stylesheet">
 
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

       <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <a href="../adminhome" class="brand-logo">
                <img class="logo-abbr" src="images/logo-1.png" alt="" style="height: 80px; width: 150px; ">
            </a>

            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <div class="header">
            <div class="header-content">
                <nav class="navbar navbar-expand">
                    <div class="collapse navbar-collapse justify-content-between">
                        <div class="header-left">
                            <div class="search_bar dropdown">
                                <span class="search_icon p-3 c-pointer" data-toggle="dropdown">
                                    <i class="mdi mdi-magnify"></i>
                                </span>
                                <div class="dropdown-menu p-0 m-0">
                                    <form>
                                        <input class="form-control" type="search" placeholder="Search" aria-label="Search">
                                    </form>
                                </div>
                            </div>
                        </div>

                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown header-profile">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <img src="displayadminimage?id=${a.id}" width="20" alt="" style="border: 2px solid #fff; object-fit: cover; border-radius: 50%; height: 70px; width: 70px;">
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a href="profile" class="dropdown-item ai-icon">
                                        <svg id="icon-user1" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                                        <span class="ml-2">Profile </span>
                                    </a>
                                    <a href="add-admin" class="dropdown-item ai-icon">
                                        <svg id="icon-user1" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                                        <span class="ml-2">Add-Admin </span>
                                    </a>
                                    <a href="logout" class="dropdown-item ai-icon">
                                        <svg id="icon-logout" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
                                        <span class="ml-2">Logout </span>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="dlabnav">
            <div class="dlabnav-scroll">
                <ul class="metismenu" id="menu">
                    <li class="nav-label first">Main Menu</li>
                    <li><a class="ai-icon" href="../adminhome">
							<i class="la la-home"></i>
							<span class="nav-text">Dashboard</span>
						</a>
                    </li>
					<li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
							<i class="la la-user"></i>
							<span class="nav-text">Professors</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="all-professors">All Professor</a></li>
                            <li><a href="add-professor">Add Professor</a></li>
                            <li><a href="professor-issue">Professor Issue</a></li>
                        </ul>
                    </li>
					<li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
							<i class="la la-users"></i>
							<span class="nav-text">Students</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="all-students">All Students</a></li>
                            <li><a href="add-student">Add Students</a></li>
                            <li><a href="student-issue">Student Issue</a></li>
                        </ul>
                    </li>
					<li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
							<i class="la la-graduation-cap"></i>
							<span class="nav-text">Courses</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="all-courses">All Courses</a></li>
                            <li><a href="add-course">Add Courses</a></li>
                            <li><a href="StudentRegisteredCourses">Student Registered Courses</a></li>
                            <li><a href="FacultyRegisteredCourses">Faculty Assigned Course</a></li>
                        </ul>
                    </li>				
                    <li><a class="ai-icon" href="logout">
                        <i class="la la-sign-out"></i>
                        <span class="nav-text">Log out</span>
                    </a>
                    </li>
				</ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->
       

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
              
              <div class="row page-titles mx-0">
                <div class="col-sm-6 p-md-0">
                    <div class="welcome-text">
                        <a href="profile"><h4>Profile</h4></a>
                    </div>
                </div>
                <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="../adminhome">Home</a></li>
                        <li class="breadcrumb-item active"><a href="profile">Profile</a></li>
                    </ol>
                </div>
              </div>


                <div class="row">
                    <div class="col-xl-4">
                      <div class="card">
                        <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
            
                          <img src="displayadminimage?id=${a.id}" alt="Profile" class="rounded-circle">
                          <h3 align="center">${a.name}</h3>
                          <h5>${a.role}</h5>
                          <div class="social-links mt-2">
                            <a href="${a.github}" class="github"><i class="bi bi-github"></i></a>
                            <a href="${a.insta}" class="instagram"><i class="bi bi-instagram"></i></a>
                            <a href="${a.linkedin}" class="linkedin"><i class="bi bi-linkedin"></i></a>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <div class="col-xl-8">

                      <div class="card">
                        <div class="card-body pt-3">
                          <!-- Bordered Tabs -->
                          <ul class="nav nav-tabs nav-tabs-bordered">
            
                            <li class="nav-item">
                              <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Overview</button>
                            </li>
            
                            <li class="nav-item">
                              <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                            </li>
            
                            <li class="nav-item">
                              <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Change Password</button>
                            </li>
            
                          </ul>

                          <div class="tab-content pt-2">
            
                            <div class="tab-pane fade show active profile-overview" id="profile-overview">
                              <h5 class="card-title">About</h5>
                              <p class="times-new-roman">${a.about}</p>
            
                              <h5 class="card-title">Profile Details</h5>
            
                              <div class="row">
                                <div class="col-lg-3 col-md-4 label ">Full Name</div>
                                <div class="col-lg-9 col-md-8">${a.name}</div>
                              </div>
            
                              <div class="row">
                                <div class="col-lg-3 col-md-4 label">Role</div>
                                <div class="col-lg-9 col-md-8">${a.role}</div>
                              </div>
            
                              <div class="row">
                                <div class="col-lg-3 col-md-4 label">Gender</div>
                                <div class="col-lg-9 col-md-8">${a.gender}</div>
                              </div>
            
                              <div class="row">
                                <div class="col-lg-3 col-md-4 label">Address</div>
                                <div class="col-lg-9 col-md-8">${a.address}</div>
                              </div>
            
                              <div class="row">
                                <div class="col-lg-3 col-md-4 label">Phone</div>
                                <div class="col-lg-9 col-md-8">${a.contact}</div>
                              </div>
            
                              <div class="row">
                                <div class="col-lg-3 col-md-4 label">Email</div>
                                <div class="col-lg-9 col-md-8">${a.email}</div>
                              </div>
            
                            </div>
            
                            <div class="tab-pane fade profile-edit pt-3" id="profile-edit">
            
                              <!-- Profile Edit Form -->
                              <form action="updateadminprofile" method="post" enctype="multipart/form-data">
                                <div class="row mb-3">
                                  <label for="adminimg" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                                  <div class="col-md-8 col-lg-9">
                                    <div class="mb-2">
                                      <input type="file" name="adminimg" id="profileImage"  style="display: none;">
                                      <label for="profileImage" class="form-control" title="Upload new profile image" style="position: relative;">
                                      <i class="bi bi-upload" style="position: absolute; right: 5px; top: 50%; transform: translateY(-50%); background-color: #007bff; color: #fff; padding: 5px 10px; cursor: pointer;"></i>
                                    Upload
                                      </label>
                                    
                                    </div>
                                  </div>
                                </div>
            
                                <div class="row mb-3">
                                  <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Full Name</label>
                                  <div class="col-md-8 col-lg-9">
                                    <input name="adminname" type="text" class="form-control" id="fullName" value="${a.name}">
                                  </div>
                                </div>
                                
                                <div class="row mb-3">
                                  <label for="Id No" class="col-md-4 col-lg-3 col-form-label">ID No</label>
                                  <div class="col-md-8 col-lg-9">
                                  <input name="adminid" type="text" class="form-control" id="idno" value="${a.id}" readonly>
                                  </div>
                                </div>
            
                                <div class="row mb-3">
                                  <label for="about" class="col-md-4 col-lg-3 col-form-label">About</label>
                                  <div class="col-md-8 col-lg-9">
                                    <textarea name="adminabout" class="form-control" id="about"  style="height: 100px">${a.about}</textarea>
                                  </div>
                                </div>
            
                                <div class="row mb-3">
                                  <label for="company" class="col-md-4 col-lg-3 col-form-label">Role</label>
                                  <div class="col-md-8 col-lg-9">
                                    <input name="adminrole" type="text" class="form-control" id="role" value="${a.role}">
                                  </div>
                                </div>
            
                                <div class="row mb-3">
                                  <label for="Gender" class="col-md-4 col-lg-3 col-form-label">Gender</label>
                                  <div class="col-md-8 col-lg-9">
                                    <select class="form-control" name="admingender" class="bold-option">
                                         <option value="${a.gender}" class="bold-option">${a.gender}</option>
                                         <option value="male" class="bold-option">Male</option>
                                         <option value="female" class="bold-option">Female</option>
                                    </select>
                                  </div>
                                </div>
            
                                <div class="row mb-3">
                                  <label for="Address" class="col-md-4 col-lg-3 col-form-label">Address</label>
                                  <div class="col-md-8 col-lg-9">
                                    <input name="adminaddress" type="text" class="form-control" id="Address" value="${a.address}">
                                  </div>
                                </div>
            
                                <div class="row mb-3">
                                  <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                                  <div class="col-md-8 col-lg-9">
                                    <input name="adminmobile" type="text" class="form-control" id="Phone" value="${a.contact}">
                                  </div>
                                </div>
            
                                <div class="row mb-3">
                                  <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                                  <div class="col-md-8 col-lg-9">
                                    <input name="adminemail" type="email" class="form-control" id="Email" value="${a.email}">
                                  </div>
                                </div>
            
                                <div class="row mb-3">
                                  <label for="Github" class="col-md-4 col-lg-3 col-form-label">Github Profile</label>
                                  <div class="col-md-8 col-lg-9">
                                    <input name="admingithub" type="text" class="form-control" id="Github" value="${a.github}">
                                  </div>
                                </div>
            
                                <div class="row mb-3">
                                  <label for="Instagram" class="col-md-4 col-lg-3 col-form-label">Instagram Profile</label>
                                  <div class="col-md-8 col-lg-9">
                                    <input name="admininsta" type="text" class="form-control" id="Instagram" value="${a.insta}">
                                  </div>
                                </div>
            
                                <div class="row mb-3">
                                <label for="Linkedin" class="col-md-4 col-lg-3 col-form-label">Linkedin Profile</label>
                                  <div class="col-md-8 col-lg-9">
                                    <input name="adminlinkedin" type="text" class="form-control" id="Linkedin" value="${a.linkedin}">
                                  </div>
                                </div>
            
                                <div class="text-center">
                                  <button type="submit" class="btn btn-primary">Save Changes</button>
                                </div>
                              </form><!-- End Profile Edit Form -->
            
                            </div>
                            <div class="tab-pane fade pt-3" id="profile-change-password">
                              <!-- Change Password Form -->
                              <form action="updateadminpassword" method="post">
            
                                <div class="row mb-3">
                                  <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                                  <div class="col-md-8 col-lg-9">
                                    <input name="currentpassword" type="password" class="form-control" id="currentPassword">
                                  </div>
                                </div>
            
                                <div class="row mb-3">
                                  <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                                  <div class="col-md-8 col-lg-9">
                                    <input name="newpassword" type="password" class="form-control" id="newPassword">
                                  </div>
                                </div>
            
                                <div class="row mb-3">
                                  <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                                  <div class="col-md-8 col-lg-9">
                                    <input name="renewpassword" type="password" class="form-control" id="renewPassword">
                                  </div>
                                </div>
            
                                <div class="text-center">
                                  <button type="submit" class="btn btn-primary">Change Password</button>
                                </div>
                              </form><!-- End Change Password Form -->
            
                            </div>
            
                          </div>
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

        
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->
	
	<!--removeIf(production)-->
        
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

    <script>
      const fileInput = document.getElementById('profileImage');
      const selectedImage = document.getElementById('selectedImage');
  
      fileInput.addEventListener('change', function (event) {
          const file = event.target.files[0];
  
          if (file) {
              const reader = new FileReader();
  
              reader.onload = function (e) {
                  selectedImage.src = e.target.result;
                  selectedImage.style.display = 'block'; // Show the selected image
              };
  
              reader.readAsDataURL(file);
          } else {
              selectedImage.src = '#'; // Clear the image source
              selectedImage.style.display = 'none'; // Hide the image
          }
      });
  </script>
  
	
		
</body>

</html>