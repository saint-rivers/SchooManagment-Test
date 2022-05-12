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
                <div class="x_title">
                  <h2 class="p-1" style="font-family:Khmer OS Muol Light;"><i class="fa fa-tasks fa-lg"></i> ផ្ទាំងមុខងាររបស់អ្នកគ្រប់គ្រង</h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                	<div class="row">
	                	<div class="col-md-3 mt-3">
	                		<div class="card card-primary card-outline-warning">
				              <div class="card-body box-profile">
				                <div class="text-center">
				                  	<a href="../../view/detail/ListUsers">  
				                   		<i class="fa fa-users fa-4x text-info"></i> 	                    	
				                	</a>
				                </div>
				                <h4 class="profile-username text-center p-1">គណនីអ្នកប្រើប្រាស់</h4>
				              </div>
		            		</div>
	                	</div>
	                	<div class="col-md-3 mt-3">
	                		<div class="card card-primary card-outline-warning">
				              <div class="card-body box-profile">
				                <div class="text-center">
				                  	<a href="../../view/detail/ListTeacher">       	
				                   		<i class="fas fa-chalkboard-teacher fa-4x text-info"></i> 	                    	
				                	</a>
				                </div>
				                <h4 class="profile-username text-center p-1">គ្រូបង្រៀន</h4>
				              </div>
		            		</div>
	                	</div>
		               	<div class="col-md-3 mt-3">
	                		<div class="card card-primary card-outline-warning">
				              <div class="card-body box-profile">
				                <div class="text-center">
				                  	<a href="../../view/list/ListGuardian">       	
				                   		<i class="fas fa-user-friends fa-4x text-info"></i> 	                    	
				                	</a>
				                </div>
				                <h4 class="profile-username text-center p-1">អាណាព្យាបាលសិស្ស</h4>
				              </div>
		            		</div>
	                	</div> 
	                	
	                	<div class="col-md-3 mt-3">
	                		<div class="card card-primary card-outline-warning">
				              <div class="card-body box-profile">
				                <div class="text-center">
				                  	<a href="../../view/detail/NameList">       	
				                   		<i class="fas fa-user-graduate fa-4x text-info"></i> 	                    	
				                	</a>
				                </div>
				                <h4 class="profile-username text-center p-1">សិស្ស</h4>
				              </div>
		            		</div>
	                	</div> 
	                	<div class="col-md-3 mt-3">
	                		<div class="card card-primary card-outline-warning">
				              <div class="card-body box-profile">
				                <div class="text-center">
				                  	<a href="../../view/classes/ClassManagement">       	
				                   		<i class="fas fa-mortar-board fa-4x text-info"></i> 	                    	
				                	</a>
				                </div>
				                <h4 class="profile-username text-center p-1">ថ្នាក់រៀន</h4>
				              </div>
		            		</div>
	                	</div> 
	                	
	                	<div class="col-md-3 mt-3">
	                		<div class="card card-primary card-outline-warning">
				              <div class="card-body box-profile">
				                <div class="text-center">
				                  	<a href="../../view/detail/ClassSchedule">       	
				                   		<i class="fas fa-clock-o fa-4x text-info"></i> 	                    	
				                	</a>
				                </div>
				                <h4 class="profile-username text-center p-1">កាលវិភាគ</h4>
				              </div>
		            		</div>
	                	</div> 
	                	<div class="col-md-3 mt-3">
	                		<div class="card card-primary card-outline-warning">
				              <div class="card-body box-profile">
				                <div class="text-center">
				                  	<a href="../../view/detail/ListSubject">       	
				                   		<i class="fa fa-book fa-4x text-info"></i> 	                    	
				                	</a>
				                </div>
				                <h4 class="profile-username text-center p-1">មុខវិជ្ជាសិក្សា</h4>
				              </div>
		            		</div>
	                	</div>
	                	<div class="col-md-3 mt-3">
	                		<div class="card card-primary card-outline-warning">
				              <div class="card-body box-profile">
				                <div class="text-center">
				                  	<a href="../../view/detail/classroom">       	
				                   		<i class="fas fa-bank fa-4x text-info"></i> 	                    	
				                	</a>
				                </div>
				                <h4 class="profile-username text-center p-1">បន្ទប់រៀន</h4>
				              </div>
		            		</div>
	                	</div>
                	</div>
                	
                </div>
              </div>
        	</div>
          <!-- /top tiles -->
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