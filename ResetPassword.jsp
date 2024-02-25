<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Reset Password</title>
    <%
    String firstname = (String) session.getAttribute("firstname");
    String lastname =  (String) session.getAttribute("lastname");
    String position = (String) session.getAttribute("position");
    int userid = (int) session.getAttribute("userid");
    %>
</head>
<body class="copybody">
<%@ include file="navbar.jsp" %>
<!--  logout model -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Logout</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to logout?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <form action="Logout.jsp" method="post">
                    <input type="submit" value="Yes"> 
                </form>
            </div>
        </div>
    </div>
</div>
<section class="pt-5" id="log" data-aos="zoom-in" data-aos-duration="2000">
    <div class="container px-5">
        <div class="color rounded-3 py-5 px-4 px-md-5 mt-5">
            <div class="text-center ">
                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i>
                </div>
                <h1 class="fw-bolder ">Reset Password</h1>
            </div>
            <div class="row gx-5 justify-content-center">
                <div class="col-lg-8 col-xl-6">
                	
	                   <!-- Password input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="newpassword" name="newpassword" type="password"
                                required>
                             
                            <label for="newpassword">New Password</label>
                        </div>
                        <!-- confirm password input-->
                        <div class="form-floating mb-3">
                            <input class="form-control" id="confirmpassword" name="confirmpassword" type="password"required>
                            <label for="confirmpassword">Confirm Password</label>
                        </div>
                        
                        <!-- Submit Button-->
                        <div class="d-grid">
                            <button class="btn btn-outline-info btn-lg" id="submitButton" onclick="resetPassword(`<%= userid %>`)">
                               Reset Password
                            </button>
                        </div>
                        
                        <span id="errormsg" style="color: red;"></span>
                 </div>
            </div>
        </div>
    </div>
</section>
<!--  logout model -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Logout</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to logout?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="removeItem()">Yes</button>
            </div>
        </div>
    </div>
</div>
<hr class="dropdown-divider">
<footer class="pt-4 mb-3 mt-3">

    <div class="container px-4 mt-auto">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto">
                <div class="big m-0">Fitwel Industries
                    SF 535/7, Kollupalayam, </div>
                <div class="big m-0">
                    Near Kaniyur Toll Gate,
                    Coimbatore-641659, Tamil Nadu, India</div>
            </div>

            <div class="col-auto">
                <div class="big m-0">Gmail : fitwelindustries@gmail.com</div>
                <div class="big m-0">Phone : +91 90000 00000</div>
            </div>

            <div class="col-auto">
                <div class="big m-0">“Copyright © Fitwel Industries."</div>
            </div>
        </div>
    </div>
</footer>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function resetPassword(userid){
	var newpassword = document.getElementById("newpassword");
	var confirmpassword = document.getElementById("confirmpassword");
	var newpasswordvalue = newpassword.value;
	var confirmpasswordvalue = confirmpassword.value;
	
	
	
	if(newpasswordvalue != confirmpasswordvalue){
		
		document.getElementById("errormsg").innerHTML="Password doesn't match";
	}
	else if(newpasswordvalue == ""  && confirmpasswordvalue==""){
		
		document.getElementById("errormsg").innerHTML="Please Enter Password";
	}
	else{
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  var res = this.responseText;
			  alert(res);
			  location.reload();
		}
		  
		const url = "ResetPassword";
		xhttp.open("POST", url, true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send("newpassword="+newpasswordvalue+"&confirmpassword="+confirmpasswordvalue+"&userid="+userid);
		  
	}
}
</script>
<%
 if(position.equals("Employee"))
{
%>
<script>
document.getElementById("addproduct").style.display = "none";
document.getElementById("employeedetail").style.display = "none";
</script>
<% 
}
%>
</body>
</html>