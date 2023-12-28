<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<style>

@keyframes blink {
  0%, 50% {
    opacity: 1;
  }
  25%, 75% {
    opacity: 0;
  }
}

.blink h3 {
  animation: blink 1s infinite;
  animation-duration: 5s;
  animation-iteration-count: 1;
  display: block;
}

.cta {
    background-color: transparent;
    display: flex;  /* Use a flex container to make the buttons side by side */
    justify-content: center;
    gap: 30px;
}

</style>

<head>
    <meta charset="utf-8">
    <title>Landing Page-AcademeX</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <!-- Favicon -->
    <link rel="icon" type="image/png" sizes="16x16" href="landingsource/img/Acadamex.png">
	<link rel="stylesheet" href="vendor/bootstrap-select/dist/css/bootstrap-select.min.css">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="landingsource/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="landingsource/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Navbar Start -->
    <div class="container-fluid p-0">
        <nav class="navbar navbar-expand-lg bg-white navbar-light py-2 py-lg-0 px-lg-3">
            <a href="../index" class="navbar-brand ml-lg-3">
                <h1 class="m-0 text-primary">AcademeX</h1>
            </a>
            <div class="collapse navbar-collapse justify-content-between px-lg-3" id="navbarCollapse">
                <div class="navbar-nav mx-auto py-0">
                    <div></div>
                </div>
                <div class="navbar-nav mx-auto py-0">
                    <div></div>
                </div>
                <div class="navbar-nav mx-auto py-0">
                    <div></div>
                </div>
                <div class="navbar-nav mx-auto py-0">
                    <div></div>
                </div>
                <div class="navbar-nav mx-auto py-0">
                    <div></div>
                </div>
                <div class="navbar-nav mx-auto py-0">
                    <div></div>
                </div>
                <div class="navbar-nav mx-auto py-0">
                    <div></div>
                </div>
                <a href="../login" style="border-radius: 30px" class="btn btn-primary py-2 px-4 d-none d-lg-block">Login</a>
            </div>
        </nav>
    </div>
    <!-- Navbar End -->


    <!-- Header Start -->
    <div class="jumbotron jumbotron-fluid page-header" style="margin-top:-60px;">
        <div class="container text-center my-5 py-5">
    
         <span class="blink">
            <h3 align=center style="color:white;">${message}</h3>
         </span>
         
            <h1 class="text-white mt-4 mb-4">Transform Your Future with Education</h1>
            <h1 class="text-white display-1 mb-3">Education Courses</h1>
            </br>
             <div class=cta>
               <a href="../index" style="background-color: transparent; border: 2px solid white; color: white; padding: 10px 20px; text-decoration: none; border-radius: 40px;">DashBoard</a>
               <a href="../login" style="background-color: transparent; border: 2px solid white; color: white; padding: 10px 20px; text-decoration: none; border-radius: 40px;">Access Here</a>
            </div>
            
        </div>
    </div>    
    <!-- Header End -->


    <!-- About Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row">
                <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 500px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute w-100 h-100" src="landingsource/img/about.jpg" style="object-fit: cover;">
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="section-title position-relative mb-4">
                        <h6 class="d-inline-block position-relative text-secondary text-uppercase pb-2">About Us</h6>
                        <h1 class="display-4">First Choice For Online Education Anywhere</h1>
                    </div>
                    <p>AcademeX is an educational website based in India. We are committed to 
                        providing high-quality education and empowering individuals to reach their full potential.
                        With a team of experienced educators and a comprehensive curriculum, we strive to create a 
                        conducive learning environment that fosters intellectual growth and personal development. 
                        Our mission is to inspire and equip our students with the knowledge, skills, and values 
                        needed to succeed in today's competitive world. Whether you are a student looking for 
                        academic excellence or a professional seeking to enhance your skills, AcademeX is here to
                        support you on your educational journey.</p>
                    <div class="row pt-3 mx-0">
                        <div class="col-3 px-0">
                            <div class="bg-success text-center p-4">
                                <h1 class="text-white" data-toggle="counter-up">75</h1>
                                <h6 class="text-uppercase text-white">Available<span class="d-block">Subjects</span></h6>
                            </div>
                        </div>
                        <div class="col-3 px-0">
                            <div class="bg-primary text-center p-4">
                                <h1 class="text-white" data-toggle="counter-up">150</h1>
                                <h6 class="text-uppercase text-white">Online<span class="d-block">Courses</span></h6>
                            </div>
                        </div>
                        <div class="col-3 px-0">
                            <div class="bg-secondary text-center p-4">
                                <h1 class="text-white" data-toggle="counter-up">1500</h1>
                                <h6 class="text-uppercase text-white">Skilled<span class="d-block">Instructors</span></h6>
                            </div>
                        </div>
                        <div class="col-3 px-0">
                            <div class="bg-warning text-center p-4">
                                <h1 class="text-white" data-toggle="counter-up">6000</h1>
                                <h6 class="text-uppercase text-white">Happy<span class="d-block">Students</span></h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->

    <!-- Feature Start -->
    <div class="container-fluid bg-image" style="margin: 90px 0;">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 my-5 pt-5 pb-lg-5">
                    <div class="section-title position-relative mb-4">
                        <h6 class="d-inline-block position-relative text-secondary text-uppercase pb-2">Why Choose Us?</h6>
                        <h1 class="display-4">Why You Should Start Learning with Us?</h1>
                    </div>
                    <p class="mb-4 pb-2">You should start learning with AcademeX because we offer a diverse range of high-quality educational resources and experienced instructors to support your learning journey.</p>
                    <div class="d-flex mb-3">
                        <div class="btn-icon bg-primary mr-4">
                            <i class="fa fa-2x fa-graduation-cap text-white"></i>
                        </div>
                        <div class="mt-n1">
                            <h4>Skilled Instructors</h4>
                            <p>The skilled instructors at AcademeX are dedicated to providing high-quality education and mentorship to students.</p>
                        </div>
                    </div>
                    <div class="d-flex mb-3">
                        <div class="btn-icon bg-secondary mr-4">
                            <i class="fa fa-2x fa-certificate text-white"></i>
                        </div>
                        <div class="mt-n1">
                            <h4>International Certificate</h4>
                            <p>AcademeX offers powerful and highly professional international certificates that are enriched with valuable skills.</p>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="btn-icon bg-warning mr-4">
                            <i class="fa fa-2x fa-book-reader text-white"></i>
                        </div>
                        <div class="mt-n1">
                            <h4>Online Classes</h4>
                            <p class="m-0">AcademeX provides online classes to accommodate flexible and accessible learning for students.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5" style="min-height: 500px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute w-100 h-100" src="landingsource/img/feature.jpg" style="object-fit: cover;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Feature End -->


    <!-- Team Details Start-->
    <div class="section-title position-relative mb-4">
        <h1 class="display-4" style="text-align:center;">Our Team</h1>
    </div>
    <div class="profile-card">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="img2"><img src="landingsource/img/a2.jpeg" alt=""></div>
                        <div class="main-text">
                            <h2>Suraj Kumar</h2>
                            <p>Suraj Kumar also takes on the role of a full-stack developer to help expedite the project's completion. 
                            As a full-stack developer, he will not only oversee the project's management and architecture but also actively 
                            participate in both front-end and back-end development tasks. </p>
                        </div>
                       <div class="social">
                          <a href="https://wa.me/+918530527876" target="_blank"><i class="fab fa-whatsapp"></i></a>
                          <a href="https://www.linkedin.com/in/surajkumar25/" target="_blank"><i class="fab fa-linkedin"></i></a>
                          <a href="https://www.instagram.com/__.suraj.25__/?hl=en" target="_blank"><i class="fab fa-instagram"></i></a>  
                          <a href="https://github.com/Surajk7725" target="_blank"><i class="fab fa-github"></i></a>      
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div class="img2"><img src="landingsource/img/a4.png" alt=""></div>
                        <div class="main-text">
                            <h2>Venkata Ramana</h2>
                            <p>Venkata Ramana is the front-end developer and user interface (UI) designer. 
                            His primary focus is on creating an intuitive and user-friendly interface for the website. 
                            He designs the layout, navigation, and visual elements of the system to ensure a pleasant user experience.</p>
                        </div>
                        <div class="social">
                          <a href="https://wa.me/+916304345373" target="_blank"><i class="fab fa-whatsapp"></i></a>
                          <a href="https://www.linkedin.com/in/venkataramanabaratam" target="_blank"><i class="fab fa-linkedin"></i></a>
                          <a href="https://www.instagram.com/its_me_yours_venky/?hl=en" target="_blank"><i class="fab fa-instagram"></i></a>  
                          <a href="https://github.com/venkataramanabaratam1" target="_blank"><i class="fab fa-github"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div class="img2"><img src="landingsource/img/a6.jpg" alt=""></div>
                        <div class="main-text">
                            <h2>Vachaspathi</h2>
                            <p>Vachaspathi Gnaneswar is the back-end developer and database specialist. 
                            He is responsible for developing the server-side logic using Spring Boot, handling data storage and retrieval, 
                            and ensuring the website's functionality runs smoothly.</p>
                        </div>
                        <div class="social">
                          <a href="https://wa.me/+919347835425" target="_blank"><i class="fab fa-whatsapp"></i></a>
                          <a href="https://www.linkedin.com/in/gvachaspathi-gnaneswar/" target="_blank"><i class="fab fa-linkedin"></i></a>
                          <a href="https://www.instagram.com/vachaspathi6/?hl=en" target="_blank"><i class="fab fa-instagram"></i></a>  
                          <a href="https://github.com/vachaspathi6" target="_blank"><i class="fab fa-github"></i></a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!--Team Details End-->

    <!-- Contact Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row align-items-center">
                <div class="col-lg-5 mb-5 mb-lg-0">
                    <div class="bg-light d-flex flex-column justify-content-center px-5" style="height: 450px;">
                        <div class="d-flex align-items-center mb-5">
                            <div class="btn-icon bg-primary mr-4">
                                <i class="fa fa-2x fa-map-marker-alt text-white"></i>
                            </div>
                            <div class="mt-n1">
                                <h4>Our Location</h4>
                                <p class="m-0">Green Fields, Vaddeswaram, Andhra Pradesh </p>
                            </div>
                        </div>
                        <div class="d-flex align-items-center mb-5">
                            <div class="btn-icon bg-secondary mr-4">
                                <i class="fa fa-2x fa-phone-alt text-white"></i>
                            </div>
                            <div class="mt-n1">
                                <h4>Call Us</h4>
                                <p class="m-0">+91 8530527876</p>
                            </div>
                        </div>
                        <div class="d-flex align-items-center">
                            <div class="btn-icon bg-warning mr-4">
                                <i class="fa fa-2x fa-envelope text-white"></i>
                            </div>
                            <div class="mt-n1">
                                <h4>Email Us</h4>
                                <a href="https://mail.google.com//mail/?view=cm&fs=1&tf=1&to=klsdpprojects@gmail.com" target="_blank"><p class="m-0">klsdpprojects@gmail.com</p></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="section-title position-relative mb-4">
                        <h6 class="d-inline-block position-relative text-secondary text-uppercase pb-2">Need Help?</h6>
                        <h1 class="display-4">Send Us A Message</h1>
                    </div>
                    <div class="contact-form">
                        <form action="outerscontact" method="post">
                            <div class="row">
                                <div class="col-6 form-group">
                                    <input name="name" id="name"  type="text" class="form-control border-top-0 border-right-0 border-left-0 p-0" placeholder="Enter your Name" required="required">
                                </div>
                                <div class="col-6 form-group">
                                    <input name="email" id="email" type="email" class="form-control border-top-0 border-right-0 border-left-0 p-0" placeholder="Enter Your Email" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <input name="subject" id="subject" type="text" class="form-control border-top-0 border-right-0 border-left-0 p-0" placeholder="Subject" required="required">
                                <input name="number" id="number" type="text" class="form-control border-top-0 border-right-0 border-left-0 p-0" placeholder="Enter your phone Number" required="required">
                            </div>
                            <div class="form-group">
                                <textarea name="text" id="text" class="form-control border-top-0 border-right-0 border-left-0 p-0" rows="5" placeholder="Message" required="required"></textarea>
                            </div>
                            <div>
                                <button name="submit" value="Submit" class="btn btn-primary py-3 px-5" type="submit">Send Message</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->


    <!-- Footer Start -->
    <div class="footer-content">
        <h3>AcademeX</h3>
        <p>We are committed to 
            providing high-quality education and empowering individuals to reach their full potential.</p>
        <ul class="wrapper">
            <li class="icon whatsapp">
                <span class="tooltip">Whatsapp</span>
            <span><a href="https://wa.me/+916304345373" target="_blank"><i class="fab fa-whatsapp"></i></a></span>    
            </li>
            <li class="icon instagram">
                <span class="tooltip">Instagram</span>
            <span><a href="https://www.instagram.com/vachaspathi6/?hl=en" target="_blank"><i class="fab fa-instagram"></i></a></span>    
            </li>
            <li class="icon github">
                <span class="tooltip">Github</span>
            <span><a href="https://github.com/vachaspathi6" target="_blank"><i class="fab fa-github"></i></a></span>    
            </li>
            <li class="icon youtube">
                <span class="tooltip">Youtube</span>
            <span><a href="https://www.youtube.com/channel/UChes10wOXrRQotQDv-zul5A" target="_blank"><i class="fab fa-youtube"></i></a></span>    
            </li>
            
        </ul>
    </div>
        <div class="footer-bottom">
            <p>Copyright &copy; <a href="#">AcademeX</a></p>
        </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary rounded-0 btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="./landing/lib/waypoints/waypoints.min.js"></script>
    <script src="./landing/lib/counterup/counterup.min.js"></script>

    <!-- Template Javascript -->
    <script src="./landing/js/main.js"></script>
</body>
</html>