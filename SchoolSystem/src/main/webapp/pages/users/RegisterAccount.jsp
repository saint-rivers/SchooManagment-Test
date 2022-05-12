<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.services.UserService" %>
<%@ page import="bean.UserBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>register</title>
<link href="../../css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/toastr.min.css" rel="stylesheet">
	<link href="../../css/sweetalert2.min.css" rel="stylesheet">
     <!-- jQuery -->
    <script src="../../js/jquery.min.js"></script>   
    <script src="../../js/popper.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/jquery.min.js"></script>
<script src="../../js/popper.min.js"></script>
<link rel="stylesheet" href="../../css/customStyle/registerStyle.css">
</head>
<body>
<div class="container register">
                <div class="row">
                    <div class="col-md-4 register-left">
                        <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                        <h3>សូមស្វាគមន៍</h3>
                        <p>ដើម្បីចូលទៅប្រើប្រាស់ប្រព័ន្ធ ប្រតិបត្តិការនេះបាន សូមអ្នកបំពេញនូវព័ត៌មានដូចជា!</p>
                        <a href="../../AccessSystem"><input type="submit" name="btnlogin" value="Login"/></a><br/>
                    </div>
                    <div class="col-md-8 register-right">
          				
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <form action="${pageContext.request.contextPath}/NewUserRegisterAccount" method="POST" enctype="multipart/form-data">
                                <h3 class="register-heading">Register as a teacher or a student</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">                                    	
                                   		<%String userID = UserService.getNewId();%>
                                        <input type="hidden" name="user_id" value="<%=userID %>" />
                                       
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="username" placeholder="Username *" value="" />
                                        </div>
                                        
                                        <div class="form-group">
                                            <input type="password" class="form-control" id="txtNewPassword" name="password" placeholder="Password *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" id="txtConfirmPassword" name="re_password" placeholder="Confirm Password *" value="" />
                                            <p class="registrationFormAlert" id="CheckPasswordMatch"></p>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="hin" placeholder="Hin *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <select class="form-control" name="question">
                                                <option class="hidden"  selected disabled>Select your Security Question</option>
                                                <option value="What is your favorite pets?">What is your favorite pets?</option>
                                                <option value="What is your favorite fruits?">What is your favorite fruits?</option>
                                                <option value="Which places do you like to go?">Which places do you like to go?</option>
                                                <option value="What do you like to do in free time?">What do you like to do in free time?</option>
                                                <option value="What is your job?">What is your job?</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="answer" placeholder="Enter Your Answer *" value="" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                        	<img alt="register_photo" src="../../images/Avatar/register_avatar.jpg" name="photo" id="show_photo" width="130px" height="147px" style="border:1px solid gray; border-radius:2px !important;">
                                        </div>
                                        <div class="custom-file mb-3">
										    <input type="file" class="custom-file-input" id="customFile" name="file" onchange="readDisplayUrl(this);">
										    <label class="custom-file-label" for="customFile">Choose your photo *</label>
										</div>
                                       	<div class="form-group">
                                            <div class="maxl">
                                                <label class="radio inline"> 
                                                    <input type="radio" name="role_code" value="role001" checked>
                                                    <span>Teacher</span> 
                                                </label>
                                                <label class="radio inline"> 
                                                    <input type="radio" name="role_code" value="role002">
                                                    <span>Student</span> 
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                           <input type="submit" name="btnregister" class="btnRegister"  value="Register"/>
                                        </div>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
    <script src="../../js/toastr.min.js"></script>
   	<script src="../../js/sweetalert2.min.js"></script>
   	<script src="../../js/custom_js/PopupMessage.js"></script>
		     <script>       
			    function checkPasswordMatch() {
			        var password = $("#txtNewPassword").val();
			        var confirmPassword = $("#txtConfirmPassword").val();
			        if (password != confirmPassword)
			            $("#CheckPasswordMatch").html("<p class='text-danger'>Passwords does not match!</p>");
			        else
			            $("#CheckPasswordMatch").html("<p class='text-success'>Passwords match.</p>");
			    }
			    $(document).ready(function () {
			       $("#txtConfirmPassword").keyup(checkPasswordMatch);
			    });
		    </script>
             <script>
			     function readDisplayUrl(input){
			     	if(input.files && input.files[0]){
			     		var reader = new FileReader();
			     		reader.onload = function(e){
			     			$('#show_photo').attr('src', e.target.result)
			     		};
			     		reader.readAsDataURL( input.files[0] );
			     	}
			     }
			</script>
            <script>
				// the following code show the name of the file appear on select
				$(".custom-file-input").on("change", function() {
				  var fileName = $(this).val().split("\\").pop();
				  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
				});
			</script>
			<%
		if( session.getAttribute("code") != null ){
			String msg = session.getAttribute("code").toString();
			if( msg.equalsIgnoreCase("Error")){				
			%>	
				<script type="text/javascript">
					toastr.error('Your registration failed! try again!')
				</script>
			<% 	
			}
			else{				
			%>	
				<script type="text/javascript">
					$(document).ready(function() {
					     toastr.success('Your registration was successfully!')
					 });
				</script>
			<% 	
			}
		}
	    session.removeAttribute("code");
	%>
</body>
</html>