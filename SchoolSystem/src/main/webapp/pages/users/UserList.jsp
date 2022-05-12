<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.services.UserService" %>
<%@ page import="bean.UserBean" %>
<%@ page import="db.services.UserService" %>   
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
    <!-- Custom Theme Style -->
    <link href="../../css/custom.min.css" rel="stylesheet">
    <link href="../../css/swal2/sweetalert2.min.css" rel="stylesheet">
     <!-- jQuery -->   
    <!-- style delete for confirm delete -->
    <link href='../../css/customStyle/confirmdelete.css' rel='stylesheet' type='text/css'>
    <link href="../../css/dataTable/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/scroller.bootstrap.min.css" rel="stylesheet">

    <script src="../../js/jquery.min.js"></script> 
    <script src="../../js/popper.min.js"></script>
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
                    <h2>បញ្ជីគណនីអ្នកប្រើប្រាស់</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                      
                      <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <div class="row">
                          <div class="col-sm-12">
                   			<div class="card-box table-responsive">
				                <div id="datatable-responsive_wrapper" class="dataTables_wrapper container dt-bootstrap no-footer">					     
				                   <div class="row">
				                    	<div class="col-sm-12">
				                    		<table id="datatable-responsive" class="table table table-hover table-bordered dt-responsive nowrap dataTable no-footer dtr-inline" cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
							                      <thead>
							                        <tr class="table-info text-center">
							                        	
							                        	<th class="sorting" style="width: 68px;">User ID</th>
							                        	<th class="sorting" style="width: 62px;">Photo</th> 
							                        	<th class="sorting" style="width: 68px;">User Name</th>
							                        	<th class="sorting" style="width: 68px;">Question</th>
							                        	<th class="sorting" style="width: 26px;">Answer</th>
							                        	<th class="sorting" style="width: 26px;">Role</th>
														<th class="sorting" style="width: 62px;">Action</th> 	
							                        </tr>
							                      </thead>
							                      <tbody>
							                      	<%
							                      		ArrayList<UserBean> ListUB = UserService.P_listAllUserAccounts();
							                      		for(UserBean ub : ListUB){
							                      			out.print("<tr>");
							                      				out.print("<td>" + ub.getUser_id() + "</td>");
							                      				out.print("<td class='text-center'><img src='../../images/users/" + ub.getPhoto_name()+ "' widht='40px' height='40px' class='rounded-circle'></td>");
							                      				out.print("<td>" + ub.getUser_name() + "</td>");
							                      				out.print("<td>" + ub.getQuestion() + "</td>");
							                      				out.print("<td>" + ub.getAnswer() + "</td>");
							                      				out.print("<td>" + ub.getRb().getRole_name() + "</td>");
							                      				out.print("<td class='text-center'>");
					                      							out.print("<a href='../../view/detail/EditAUser?id=" + ub.getUser_id() + "' class='btn btn-primary btn-sm' data-toggle='tooltip' data-placement='top' title='edit'><i class='fa fa-edit'></i></a>");
					                      							out.print("<button type='button'​ id='btnDelete' value='" + ub.getUser_id() + "' class='btn btn-danger btn-sm' data-toggle='tooltip' data-placement='top' title='delete'><i class='fa fa-trash'></i></button>");
					                      						out.print("</td>");
							                      			out.print("</tr>");
							                      		}
							                      	%>							                      	
							                	</tbody>
				                    		</table>
				                  		</div>
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
    <!-- Datatables -->
    <script src="../../js/dataTable/jquery.dataTables.min.js"></script>
    <script src="../../js/dataTable/dataTables.bootstrap.min.js"></script>
    <script src="../../js/dataTable/dataTables.responsive.min.js"></script>
    <script src="../../js/dataTable/responsive.bootstrap.js"></script>
    <script src="../../js/dataTable/dataTables.scroller.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../../js/custom.min.js"></script>	
	<script src='../../css/swal2/sweetalert2.min.js'></script>
    <script src="../../js/custom_js/ButtonDeleteUser.js"></script>
    <script>
		$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();   
		});
	</script>
</body>
</html>