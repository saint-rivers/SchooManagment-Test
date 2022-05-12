<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
	session = request.getSession(false);
	String role_code = "",role_name="",user_id="",user_name="",photo_view = "";
	if(session != null){
		if(session.getAttribute("user_name")!= null){
			user_id = session.getAttribute("user_id").toString();
			user_name = session.getAttribute("user_name").toString();
			photo_view = session.getAttribute("photo_name").toString();	
		}else{
			response.sendRedirect("./AccessSystem");
		}
	}else{
		//redirect to login page
		response.sendRedirect("./AccessSystem");
	}
%> 
<!doctype html>
<html class="fixed">
	<head>
		<!-- Basic -->
		<meta charset="UTF-8">
		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="Porto Admin - Responsive HTML5 Template">
		<meta name="author" content="okler.net">
		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">
		<!-- Vendor CSS -->
		<link rel="stylesheet" href="./css/bootstrap.css" />
		<link rel="stylesheet" href="./css/font-awesome.css" />
		<!-- Theme CSS -->
		<link rel="stylesheet" href="./css/theme.css" />
		<!-- Skin CSS -->
		<link rel="stylesheet" href="./css/default.css" />
		<script src="./js/jquery.min.js"></script>
		<script src="./js/popper.min.js"></script>
		<script src="./js/bootstrap.min.js"></script>
		<style>
			body{
				background-image: url("./images/backgrounds/2.png");
				background-repeat: no-repeat;
  				background-size: 100% 100%;
			}
		</style>
	</head>
	<body>
		<!-- start: page -->
		<section class="body-sign body-locked">
			<div class="center-sign">
				<div class="panel panel-sign">
					<div class="panel-body">
						<form action="${pageContext.request.contextPath}/UnlockScreenAccess" method="POST">
							<div class="current-user text-center">
								<img src="images/users/<%=photo_view %>" alt="John Doe" class="img-circle user-image" />
								<h2 class="user-name text-dark m-none"><%=user_name %></h2>
								<p class="user-email m-none">You are in lock screen. Main app was shut down and you need to enter your password to go back to app.</p>
							</div>
							<div class="form-group mb-lg">
								<div class="input-group input-group-icon">
									<input type="hidden" name="username" value="<%= user_name %>" />
									<input id="pwd" name="password" type="password" class="form-control input-lg" placeholder="Password" required />
									<span class="input-group-addon">
										<span class="icon icon-lg">
											<i class="fa fa-lock"></i>
										</span>
									</span>
								</div>
							</div>
							 <%
							    if( request.getAttribute("msg") != null ){
							       out.print("<div class='row'>");
							       out.print("<div class='alert alert-danger alert-dismissible'>");
							       out.print("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>");
							       out.print("<h4><i class='icon fa fa-ban'></i> Caution!</h4>");
							       out.print("Incorrect Password !! Try again.");
							       out.print("</div>");
							       out.print("</div>");
							    }
							%>
							<div class="row">
								<div class="col-xs-6">
									<p class="mt-xs mb-none">
										<a href="./AccessSystem">Not <%=user_name %>?</a>
									</p>
								</div>
								<div class="col-xs-6 text-right">
									<button type="submit" class="btn btn-primary">Unlock</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<!-- end: page -->
	</body>
</html>