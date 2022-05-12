<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.ClassStudyBean" %>
<%@ page import="bean.TeacherClassBean" %>
<%@ page import="db.services.TeacherClassService" %>
<%@ page import="bean.TeacherBean" %>
<%@ page import="db.services.ClassStudyService" %>
<%@ page import="db.services.StudentService" %>
<%@ page import="bean.StudentBean" %> 

<%@ page import="db.services.MonthService" %>
<%@ page import="bean.MonthBean" %>
<%@ page import="bean.SubjectBean" %>
<%@ page import="bean.TeacherBean" %>
<%@ page import="db.services.SubjectService" %>
<%@ page import="db.services.TeacherService" %>
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
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
    <title>LMS</title>
    <!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../../css/font-awesome.min.css" rel="stylesheet">
    <link href="../../webcss/all.min.css" rel="stylesheet"> <!--load all styles -->
    <link href="../../webcss/fontawesome.min.css" rel="stylesheet">
    
  <!-- Custom fonts for this template-->
  <!-- Custom styles for this template-->
  <link href="../../source/css/sb-admin.css" rel="stylesheet">
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
              <a href="#" class="site_title"><i class="fas fa-school fa-2x"></i><span>School<b>MS</b></span></a>
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
	                <div class="x_title bg-info text-white">
	                  <h2 class="p-1" style="font-family:Khmer OS Muol Light;"><i class="fa fa-graduation-cap fa-lg"></i> ផ្ទាំងមុខងាររបស់គ្រូ</h2>
	                  <div class="clearfix"></div>
	                </div>
                <div class="x_content">
                	<div class="container-fluid" style="width:80%; margin:auto;">
	                	<div class="row">
                			<div class="col-md-12">
			                	<div class="col-md-4 col-sm-12 col-xs-12 pt-3">
			                		<div class="card card-primary card-outline-warning">
						              <div class="card-body box-profile">
						                <div class="text-center">
						                  	<a href="../../view/profile/TeacherProfile">  
						                   		<i class="fa fa-user fa-4x text-info"></i> 	                    	
						                	</a>
						                </div>
						                <h4 class="profile-username text-center p-1">ប្រូហ្វាល់</h4>
						              </div>
				            		</div>
			                	</div>
			                	<div class="col-md-4 col-sm-12 col-xs-12 pt-3">
			                		<div class="card card-primary card-outline-warning">
						              <div class="card-body box-profile">
						                <div class="text-center">
						                  	<a href="../../view/attendant/StudentAttendant">       	
						                   		<i class="fa fa-user-graduate fa-4x text-info"></i> 	                    	
						                	</a>
						                </div>
						                <h4 class="profile-username text-center p-1">វត្តមានសិស្ស</h4>
						              </div>
				            		</div>
			                	</div>			                	
				            	
				            	<div class="col-md-4 col-sm-12 col-xs-12 pt-3">
			                		<div class="card card-primary card-outline-warning">
						              <div class="card-body box-profile">
						                <div class="text-center">
						                  	<a href="../../view/teaching/ClassTeaching">       	
						                   		<i class="fas fa-chalkboard-teacher fa-fw fa-4x text-info"></i> 	                    	
						                	</a>
						                </div>
						                <h4 class="profile-username text-center p-1">ថ្នាក់បង្រៀន</h4>
						              </div>
				            		</div>
				            	</div>
		                	</div>
	                	</div> 
	                </div>
                </div>
              </div>
        	</div>
        	
        	<div class="container-fluid">
		      <!-- Breadcrumbs-->
		      <ol class="breadcrumb">
		        <li class="breadcrumb-item">
		          <a href="index.html">ទំព័រដើម</a>
		        </li>
		        <li class="breadcrumb-item active">ផ្ទាំងមុខងាររបស់គ្រូ</li>
		      </ol>
		     <div class="row">
		        <div class="col-12">
		          <!-- Icon Cards-->
		      
		      <!--first row cards-->
		      <!-- Icon Cards-->
		      
		      <div class="row">
		      	<%
		          	ArrayList<ClassStudyBean> list = ClassStudyService.getClassByUserID(user_id);
		          	for(ClassStudyBean csb : list){
		          		out.print("<div class='col-xl-3 col-sm-6 mb-3'>");
		          			out.print("<div class='card text-white bg-success o-hidden h-100'>");
		          				out.print("<div class='card-body'>");
									out.print("<div class='card-body-icon'>");
		          						out.print("<i class='fa fa-fw fa-book'></i>");
		          					out.print("</div>");
		          					out.print("<div class='mr-5'>"+ csb.getRoomb().getRoom() +"</div>");
		          				out.print("</div>");
		          				out.print("<a class='card-footer text-white clearfix small z-1' href='../../view/schedule/TeacherSchedule?id="+ csb.getClass_id()+":"+ csb.getTeaacherB().getT_id() +"'>");
		          					out.print("<span class='float-left'>កាលវិភាគ</span>");
		          					out.print("<span class='float-right'><i class='fa fa-angle-right'></i></span>");
		          				out.print("</a>");
		          				String class_study = csb.getClass_id() + ":" + csb.getRoomb().getRoom() + ":" + csb.getRoomb().getRoom_id() + ":" + csb.getRoomb().getRoom();
		          				out.print("<a class='card-footer text-white clearfix small z-1' href='../../view/attendant/StudentAttendant?class_id="+ csb.getClass_id() +"'>");
	          						out.print("<span class='float-left'>សម្រង់វត្តមាន</span>");
	          						out.print("<span class='float-right'><i class='fa fa-angle-right'></i></span>");
	          					out.print("</a>");
		          			out.print("</div>");
		          		out.print("</div>");		          		
		          	}
		          %>
		       
		        
		        <div class="col-xl-3 col-sm-6 mb-3">
		          <div class="card text-white bg-info o-hidden h-100">
		            <div class="card-body">
		              <div class="card-body-icon">
		                <i class="fa fa-fw fa-whatsapp"></i>
		              </div>
		              <div class="mr-5">2 Notices</div>
		            </div>
		            <a class="card-footer text-white clearfix small z-1" href="notices_view.php">
		              <span class="float-left">View Details</span>
		              <span class="float-right">
		                <i class="fa fa-angle-right"></i>
		              </span>
		            </a>
		          </div>
		        </div>
		      </div>
		      <!--second row cards-->        </div>
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
    <!-- Core plugin JavaScript-->
    <script src="../../source/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="../../source/js/sb-admin.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../../js/custom.min.js"></script>
</body>
</html>