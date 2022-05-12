<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session = request.getSession(false);
	String role_code = "",role_name="",user_id="",user_name="",photo_view = "";
	if(session != null){
		if(session.getAttribute("user_name")!= null){
			user_id = session.getAttribute("user_id").toString();
			user_name = session.getAttribute("user_name").toString();
			photo_view = session.getAttribute("photo_name").toString();	
			role_code = session.getAttribute("role_code").toString();
			role_name = session.getAttribute("role_name").toString();
		}else{
			response.sendRedirect("../../AccessSystem");
		}
	}else{
		//redirect to login page
		response.sendRedirect("../../AccessSystem");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LMS</title>
    <!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../../css/font-awesome.min.css" rel="stylesheet">
    <link href="../../webcss/all.min.css" rel="stylesheet"> <!--load all styles -->
    <link href="../../webcss/fontawesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../../css/custom.min.css" rel="stylesheet">
     <!-- jQuery -->
    <script src="../../js/jquery.min.js"></script>   
    <script src="../../js/custom_js/lock_screen.js"></script>
  </head>
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="#" class="site_title"><i class="fas fa-school fa-2x"></i> <span>School<b>MS</b></span></a>
            </div>
            <!-- sidebar menu -->
			<jsp:include page="/view/detail/LeftMenu">
				<jsp:param value="<%=user_name %>" name="user_name"/>
				<jsp:param value="<%=photo_view %>" name="photo_view"/>
				<jsp:param value="<%=role_name %>" name="role_name"/>
				<jsp:param value="<%=role_code %>" name="role_code"/>
			</jsp:include>
            <!-- /sidebar menu -->
          </div>
        </div>
        <!-- top navigation -->
       	<jsp:include page="/view/detail/Banner">
       		<jsp:param value="<%=user_name %>" name="user_name"/>
       		<jsp:param value="<%=photo_view %>" name="photo_view"/>
       		<jsp:param value="<%=role_name %>" name="role_name"/>
       	</jsp:include>
        <!-- page content -->
        <div class="right_col" role="main">  
       		<div class="col-md-12 col-sm-12">       			
	     		<div class="x_panel">
	                <div class="x_title bg-success">
	                  <h2 class="p-2 text-white" style="font-family:Khmer OS Muol Light;">
	                  	<i class="fa fa-graduation-cap fa-lg text-warning"></i> 
	                  		ផ្ទាំងមុខងាររបស់សិស្ស
	                  </h2>                  
	                  <div class="clearfix"></div>
	                </div>
                	<div class="x_content">
                		<div class="border border-warning" style="width:70%; margin:auto;">
		                	<div class="row p-2">
			                	<div class="col-md-4 col-sm-12 pt-3">
			                		<div class="card card-primary card-outline-info">
						              <div class="card-body box-profile">
						                <div class="text-center">
						                  	<a href="../../view/profile/StudentProfile"><i class="fa fa-user fa-3x text-info"></i></a>
						                </div>
						                <h4 class="profile-username text-center text-info p-1">ព័ត៌មានផ្ទាល់ខ្លួន</h4>
						              </div>
				            		</div>
			                	</div>
			                	<div class="col-md-4 col-sm-12 pt-3">
			                		<div class="card card-primary card-outline-warning">
						              <div class="card-body box-profile">
						                <div class="text-center">
						                  	<a href="#"><i class="fas fa-user-graduate fa-3x text-info"></i></a>
						                </div>
						                <h4 class="profile-username text-center text-info p-1">អវត្តមានរបស់ខ្ញុំ</h4>
						              </div>
				            		</div>
			                	</div>
			                	<div class="col-md-4 col-sm-12 pt-3">
			                		<div class="card card-primary card-outline-warning">
						              <div class="card-body box-profile">
						                <div class="text-center">
						                  	<a href="../../view/schedule/StudentSchedule"><i class="fas fa-clock fa-3x text-info"></i></a>
						                </div>
						                <h4 class="profile-username text-center text-info p-1">កាលវិភាគរៀន</h4>
						              </div>
				            		</div>
			                	</div>
			                	<div class="col-md-4 col-sm-12 pt-3">
			                		<div class="card card-primary card-outline-warning">
						              <div class="card-body box-profile">
						                <div class="text-center">
						                  	<a href="#"><i class="fas fa-chalkboard-teacher fa-3x text-info"></i></a>
						                </div>
						                <h4 class="profile-username text-center text-info p-1">ថ្នាក់រៀនរបស់ខ្ញុំ</h4>
						              </div>
				            		</div>
			                	</div>
		                		<div class="col-md-4 col-sm-12 pt-3">
			                		<div class="card card-primary card-outline-warning">
						              <div class="card-body box-profile">
						                <div class="text-center">
						                  	<a href="#"><i class="fas fa-book fa-3x text-info"></i></a>
						                </div>
						                <h4 class="profile-username text-center p-1 text-info">លទ្ធផលប្រឡង</h4>
						              </div>
				            		</div>
		                		</div>
		                	</div> 
	                	</div>         	
	                </div>	               	                
	             </div>       			         		
        	</div>  
        </div>
        <!-- /page content -->
        <!-- footer content -->
		<jsp:include page="/view/detail/FooterPage"></jsp:include>
        <!-- /footer content -->
      </div>
    </div>
    <!-- Bootstrap -->
    <script src="../../js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="../../js/custom.min.js"></script>
</body>
</html>