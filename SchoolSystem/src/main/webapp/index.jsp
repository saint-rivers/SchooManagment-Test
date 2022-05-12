<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Login</title>
		<link rel="stylesheet" href="./css/bootstrap.min.css">
		<link rel="stylesheet" href="./css/font-awesome.min.css">
		<link rel="stylesheet" href="css/customStyle/loginStyle.css"/>
		<link rel="stylesheet" href="./css/jquery-bg-slideshow.css">
		<script src="./js/jquery.min.js"></script>
		<script src="./js/jquery-bg-slideshow.js"></script>
		<script src="./js/popper.min.js"></script>
		<script src="./js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$(".bg").bgSlideShow({
					current : 0,
					randomize : false,
					//images : [ "https://source.unsplash.com/1KSBnTvMahY/1920x1680", "https://source.unsplash.com/xQYukXBXUds/1920x1680", "https://source.unsplash.com/xOjYOOXwDOc/1920x1680" ],
					images : [ "images/backgrounds/wallpaper4.jpg", "images/backgrounds/wallpaper3.jpg", "images/backgrounds/wallpaper6.jpg" ],
					initialBackground : 'images/backgrounds/wallpaper5.jpg',
					transitionDelay:2000
				});
			}); 
		</script>
		<style type="text/css">
			body { 
			  text-align: center;
			  height: 100%;
			  background-color: white;
			  color: white;
			  font-size: 30pt;
			  align-items: center;
			  justify-content: center;
			  display: flex;
			  margin: 0;
			}
			.jquery-bg-slideshow-wrap-bg-element {
			  width: 100%;
			  height: 100%;
			}
			.bg {
			  height: 100%;
			  width: 100%;
			  background-color: white;
			  color: white;
			  font-size: 30pt;
			  align-items: center;
			  justify-content: center;
			  display: flex;
			  text-align: center;
			  text-shadow: 1px 1px 10px black;
			  margin: 0;
			  background-size: cover;
			  background-position: 50% 50%;
			}
			.field-icon {
			  float: right;
			  margin-right: 8px;
			  margin-top: -27.5px;
			  position: relative;
			  z-index: 2;
			  cursor: pointer;
			}	
		</style>
	</head>
<body>
	<div class="bg">
		<div id="contain" class="login-form">
	    	<form action="${pageContext.request.contextPath}/UserAccess" method="post" style="background: rgba(0,0,0,0.5);margin:auto; border:1px solid yellow;">
				<div class="avatar" style="border:1px solid yellow;">
					<img src="images/Avatar/Account_Avatar.png" alt="Avatar">
				</div>
	        	<h2 class="text-center" style="color: yellow;">Member Login</h2>   
	        	<div class="form-group has-feedback">
	        		<input type="text" class="form-control" name="username" placeholder="Username" required autocomplete="off">
	        	</div>
				<div class="form-group has-feedback">
	            	<div>
	            		<input id="password-field" type="password" class="form-control" name="password" placeholder="Password" required>
	            		<span toggle="#password-field" class="fa fa-eye-slash fa-lg field-icon toggle-password"></span>
	            	</div>
	        	</div>
	        	<div class="form-group">
	            	<button type="submit" class="btn btn-primary btn-lg btn-block">Login</button>
	        	</div>
				<div class="clearfix">
	            	<label class="pull-left checkbox-inline" style="color:white;"><input type="checkbox"> Remember me</label>
	            	<a href="#" class="pull-right" style="color:white;">Forgot Password?</a>
	        	</div>
	        	<%
		        	if(request.getAttribute("msg") != null ){
			          out.print("<div class='row'>");
			          	out.print("<div class='alert alert-danger alert-dismissible'>");
			          	out.print("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>");
			          	out.print("<h4><i class='icon fa fa-ban'></i> Caution!</h4>");
			          	out.print("Incorrect Username Or Password !! Try again.");
			          	out.print("</div>");
			          out.print("</div>");
		        	}
		      	%> 
	    	</form>
	    	<p class="text-center small">Don't have an account?<a href="./view/account/RegisterForm">Sign up here!</a></p>
		</div>
	</div>
	<script>
       	$(".toggle-password").click(function() {
      		  $(this).toggleClass("fa-eye fa-eye-slash");
      		  var input = $($(this).attr("toggle"));
      		  if (input.attr("type") == "password") {
      		    input.attr("type", "text");
      		  } else {
      		    input.attr("type", "password");
      		  }
       	});
	</script>
</body>
</html>
