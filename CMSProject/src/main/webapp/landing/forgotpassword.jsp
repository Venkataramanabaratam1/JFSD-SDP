<!DOCTYPE html>
<html lang="en">
<head>
    <title>Forgot Password - AcademeX</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" sizes="16x16" href="img/favicon.png">
    <link rel="stylesheet" href="css/bootstrap5.css">
    <link rel="stylesheet" href="css/forget.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
</head>
<body>
        <div class="success-message" id="successMessage"><i class="fa-solid fa-circle-check"></i>  Please check your email</div>
        <div class="alert-message" id="alertMessage"><i class="fa-solid fa-circle-xmark"></i>  Please enter a valid email address.</div>
    <div class="container pt-5">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-6 text-center">
                <img src="img/main.png" alt="Main IMG" class="img-fluid">
            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-6 pt-5">
                <h2 class="main-text pt-5 mt-5">Forgot <br> Your Password</h2>
                <input type="email" id="email" placeholder="Enter Your E-mail" class="form-control main-input mt-5">
                <div class="row">
                    <div class="col-3">
                        <button class="btn btn-sz-primary mt-5" onclick="validateForm()">Reset</button>
                    </div>
                    <div class="col-6 pt-5">
                       <button class="btn btn-sz-primary mt-"><a href="../login" style="color:white;">Back To Login</a></button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
<script src="js/jquery.js"></script>
<script src="js/bootstrap5.js"></script>
<script>
    function validateForm() {
        var emailInput = document.getElementById("email");
        var email = emailInput.value;
        var emailPattern = /^[a-z0-9.]+@[a-zA-Z0-9.-]*(gmail\.com|.*\.in)$/;
        var successMessage = document.getElementById("successMessage");
        var alertMessage = document.getElementById("alertMessage");

        if (email.trim() === "" || !emailPattern.test(email)) {
            alertMessage.style.display = "block"; // Display the alert message
            successMessage.style.display = "none"; // Hide the success message
            setTimeout(function () {
                alertMessage.style.display = "none"; // Hide the alert message after 10 seconds
            }, 5000);
        } else {
            alertMessage.style.display = "none"; // Hide the alert message
            successMessage.style.display = "block"; // Display the success message
            setTimeout(function () {
                successMessage.style.display = "none"; // Hide the success message after 10 seconds
            }, 5000);
        }
    }
</script>
</html>
