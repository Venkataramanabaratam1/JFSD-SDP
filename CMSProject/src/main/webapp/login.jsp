<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form - AcademeX</title>
    <link rel="icon" type="image/png" sizes="16x16" href="./student/assets/images/student/Acadamex.png">
    <link rel="stylesheet" href="./landing/css/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="success-message" id="successMessage"><i class="fa-solid fa-circle-check"></i>Login Successful</div>
    <div class="alert-message" id="alertMessage"><i class="fa-solid fa-circle-xmark"></i>  Please enter a valid password..</div>
    <div class="wrapper">
       <form method="post" action="checkadminlogin" onsubmit="return validateLogin();">
       
       <!-- <div class="message-box" id="alertMessage">
        <span class="blink">
            <h3 align="center" id="message"></h3>
        </span>
       </div> -->
       
            <h1>Login Here</h1>
            <div class="input-box">
                <input type="number" id="username" name="username" placeholder="Username" required>
            </div>
            <div class="input-box">
                <input type="password" id="password" name="password" placeholder="Password" required>
            </div>

            <div class="remember-forgot">
                <label>
                    <input type="checkbox">Remember me
                </label>
                <a href="landing/forgotpassword">Forgot password ?</a>
            </div>
            <button type="submit" class="btn" onsubmit="validateLogin()">Login</button>

            <div class="register-link">
                <label>
                    <input type="checkbox"> For Terms and Conditions
                </label>
                <span style="margin-right: 10px;"></span>
                <a href="#" target="_blank">Click here</a>
            </div>   
        </form>
    </div>
    <script>
        function validateLogin() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;

    var successMessage = document.getElementById("successMessage");
    var alertMessage = document.getElementById("alertMessage");

    successMessage.style.display = "none";
    alertMessage.style.display = "none";

    if (username.length === 5) {
        document.querySelector("form").action = "checkfacultylogin";
    } else if (username.length === 10) {
        document.querySelector("form").action = "checkstudentlogin";
    } else if (username.length === 4) {
        document.querySelector("form").action = "checkadminlogin";
    } else {
        alertMessage.style.display = "block";
        setTimeout(function () {
            alertMessage.style.display = "none";
        }, 5000);
        return;
    }
  
/*      var passwordRegex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$/;
    if (!password.match(passwordRegex)) {
        alertMessage.style.display = "block"; 
        setTimeout(function () {
            alertMessage.style.display = "none"; 
        }, 5000);
        return;
    } 
*/
    /* successMessage.style.display = "block"; 
    setTimeout(function () {
        successMessage.style.display = "none"; 
    }, 5000);  */  
    
}
        
     // JavaScript to display the message box when there's a message
    const message = "${message}"; // Replace with your actual message

    if (message) {
        const messageElement = document.getElementById("message");
        const messageBox = document.getElementById("alertMessage");
        messageBox.style.display = "block";
        
        setTimeout(function () {
            messageBox.style.display = "none";
        }, 5000); // Hide the box after 10 seconds (corrected from 5 seconds)
    }
        
    </script>
    <script src="./landing/js/login.js"></script>
</body>
</html>