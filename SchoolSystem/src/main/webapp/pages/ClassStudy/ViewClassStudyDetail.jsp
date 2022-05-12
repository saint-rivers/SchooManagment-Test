<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.ClassStudyDetailBean" %>
<%@ page import="db.services.ClassStudyService" %>
<%
	session = request.getSession(false);
	String role_code = "",role_name="",user_name="",photo_view = "";
	if(session != null){	
		if(session.getAttribute("user_name")!= null){
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
	<link rel="icon" href="images/favicon.ico" type="image/ico" />
    <title>LMS</title>
    <!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../../css/font-awesome.min.css" rel="stylesheet">
    <link href="../../webcss/all.min.css" rel="stylesheet"> <!--load all styles -->
    <!-- Custom Theme Style -->
    <link href="../../css/custom.min.css" rel="stylesheet">
    
     <!-- jQuery -->   
   
    <link href="../../css/dataTable/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/scroller.bootstrap.min.css" rel="stylesheet">
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
	        	<div class="col-md-12 col-sm-12 ">
	                <div class="x_panel">
	                  <div class="x_title">
	                    <h2>List Class Study Detail Information</h2>
	                    <ul class="nav navbar-right panel_toolbox">
	                      <li><a class="close-link"><i class="fa fa-close"></i></a></li>
	                    </ul>
	                    <div class="clearfix"></div>
	                  </div>
	                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="admin-pro-accordion-wrap shadow-inner responsive-mg-b-30 bg bg-secondary text-white">
                            <div class="alert-title">
                                <h2>Animate bounce Accordion</h2>
                                <p>These are the Custom bootstrap Animate bounce Accordion style 1</p>
                            </div>
                            <div class="panel-group edu-custon-design" id="accordion">
                                <div class="panel panel-default bg-primary p-1">
                                    <div class="panel-heading accordion-head">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true" class="text-white">
									 Collapsible Group 1</a>
                                        </h4>
                                    </div>
                                    <div id="collapse1" class="panel-collapse panel-ic collapse in" aria-expanded="true" style="">
                                        <div class="panel-body admin-panel-content animated bounce">
                                            <p>It was popularised in the 1960s with the release of Letraset sheets of the containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions.</p>
                                            <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor incididunt ut labore et dolore magna aliqua of Lorem Ipsum.</p>
                                            <p> Ut enim adminim veniam, quis nostrud exercitation ullamco laboris nisis ut aliquip ex ea commodo consequat consectetur adipisicing elit.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default bg-primary p-1 mt-2">
                                    <div class="panel-heading accordion-head">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse2" class="collapsed text-white" aria-expanded="false">
									 Collapsible Group 1</a>
                                        </h4>
                                    </div>
                                    <div id="collapse2" class="panel-collapse panel-ic collapse" aria-expanded="false" style="height: 0px;">
                                        <div class="panel-body admin-panel-content animated bounce">
                                            <p>It was popularised in the 1960s with the release of Letraset sheets of the containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions.</p>
                                            <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor incididunt ut labore et dolore magna aliqua of Lorem Ipsum.</p>
                                            <p> Ut enim adminim veniam, quis nostrud exercitation ullamco laboris nisis ut aliquip ex ea commodo consequat consectetur adipisicing elit.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default bg-primary p-1 mt-2">
                                    <div class="panel-heading accordion-head">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse3" class="collapsed text-white" aria-expanded="false">
									 Collapsible Group 1</a>
                                        </h4>
                                    </div>
                                    <div id="collapse3" class="panel-collapse panel-ic collapse" aria-expanded="false">
                                        <div class="panel-body admin-panel-content animated bounce">
                                            <p>It was popularised in the 1960s with the release of Letraset sheets of the containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions.</p>
                                            <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor incididunt ut labore et dolore magna aliqua of Lorem Ipsum.</p>
                                            <p> Ut enim adminim veniam, quis nostrud exercitation ullamco laboris nisis ut aliquip ex ea commodo consequat consectetur adipisicing elit.</p>
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
	<script>
	$(document).ready(function(){
	  $('[data-toggle="tooltip"]').tooltip();   
	});
	</script>
    <!-- Bootstrap -->
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <!-- Datatables -->
    
    <script src="../../js/dataTable/jquery.dataTables.min.js"></script>
 
    <script src="../../js/dataTable/dataTables.scroller.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../../js/custom.min.js"></script>
    
	
</body>
</html>