<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.UserBean"%>
<%@ page import="db.services.UserService" %>
<%@ page import="bean.RoleBean" %>   
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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LMS</title>
    <!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../../css/font-awesome.min.css" rel="stylesheet">
    <link href="../../webcss/all.min.css" rel="stylesheet"> <!--load all styles -->
    <!-- Custom Theme Style -->
    <link href="../../css/custom.min.css" rel="stylesheet">
     <!-- jQuery -->
    <script src="../../js/jquery.min.js"></script>   
    <script src="../../js/custom_js/lock_screen.js"></script>
	<style>
		#student_card {
   			/* 
		    border: 10px solid transparent;
			padding: 10px;
			border-image: url(../../images/border/border.png) 30 round;
		    */
		    border: 10px solid transparent;
		    padding: 15px;
		    border-image: url(../../images/border/border.png) 30 stretch;
		    
			padding:3px;
		  	height: 408px;
		  	margin: 20px auto 0;
		  	width: 320px;
		  	margin-top:5%;
		}
		.card_body{
			widht:100%;
		}
	</style>
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
          <!-- top tiles -->
        	<div id="student_card">
        		<div class="card-header p-1">
        			<h5 class="text-primary text-center">សាលាបឋមសិក្សា អក្សរតេ</h5>
        		</div>
        		
        		<div class="card_body">
        			<h5 class="text-primary text-center">បណ្ណសម្គាល់ខ្លួនសិស្ស</h5>
        			<table class="table table-borderless table-sm">
				    	<thead>
					      <tr>
					        <th class="text-black">អត្តលេខ</th>
					        <th class="text-primary">0001</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					        <th class="text-black">ឈ្មោះ</th>
					        <th class="text-primary">Roeurn Chamroeun</th>
					        <td rowspan="3" class="text-right"><img src="../../images/Avatar/img_avatar2.png" width="95px" height="110px" class="rounded" alt="Cinque Terre"></td>
					      </tr>
					      <tr>
					        <th class="text-black">ភេទ</th>
					        <th class="text-primary">ប្រុស</th>
					      </tr>
					      <tr>
					        <th class="text-black">ថ្ងៃខែឆ្នាំកំណើត</th>
					        <th class="text-primary">08-11-1998</th>
					      </tr>
					      <tr>
					        <th class="text-black">រៀនថ្នាក់ទី</th>
					        <th class="text-primary">៥ក</th>
					      </tr>
					      <tr>
					        <th class="text-black">ឪពុកឈ្មោះ</th>
					        <th class="text-primary">អាក្រក់ ល្អ</th>
					      </tr>
					      <tr>
					        <th class="text-black">ម្ដាយឈ្មោះ</th>
					        <th class="text-primary">ស ខ្មៅ</th>
					      </tr>
					      <tr>
					        <th class="text-black">ទីកន្លែងកំណើត</th>
					        <th colspan="2" class="text-primary">យឺនមាន ឬស្សាក្រាំង មោងឬស្សី បាត់ដំបង</th>
					      </tr>
					      <tr>
					        <th class="text-black">ឆ្នាំសិក្សា</th>
					        <th class="text-primary">២០២១-២០២២</th>
					      </tr>
					    </tbody>
				  </table>
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