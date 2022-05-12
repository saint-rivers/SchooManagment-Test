<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.services.StudentService" %>
<%@ page import="bean.StudentBean" %>   
<%
	session = request.getSession(false);
	String role_code = "",role_name="",user_id="",user_name="",photo_view = "";
	if(session != null){
		if(session.getAttribute("user_name")!= null){
			user_id = session.getAttribute("user_id").toString();
			user_name = session.getAttribute("user_name").toString();
			photo_view =  session.getAttribute("photo_name").toString();
					
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
    <link href="../../css/dataTable/dataTables.bootstrap.min.css" rel="stylesheet">
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
	                	<h2 class="p-1">ប្រវត្តិរូបរបស់សិស្ស</h2>
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
									<a style="margin-left:15px;" href="../../view/detail/AddAStudent" class="btn btn-info btn-sm"><i class="fa fa-plus"> New Student</i></a>
					                <div id="datatable-responsive_wrapper" class="dataTables_wrapper container dt-bootstrap no-footer">
					                   <div class="row">
					                    	<div class="col-sm-12">
					                    		<table id="datatable-responsive" class="table table table-hover table-bordered border-info dt-responsive nowrap dataTable no-footer dtr-inline" cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
								                      <thead>
								                        <tr  role="row" class="table-success text-center">
								                        	
								                        	<th class="sorting" style="width: 30px;">Student ID</th>
								                        	<th class="sorting" style="width: 68px;">Full name</th>
								                        	<th class="sorting" style="width: 30px;">Gender</th>
								                        	<th class="sorting" style="width: 30px;">Nationality</th>
								                        	<th class="sorting" style="width: 26px;">Date of birth</th>								                        	
								                        	<th class="sorting" style="width: 68px;">Place of birth</th>							                        	
								                        	<th class="sorting" style="width: 62px;">Current Address</th>								                        	
								                        	<th class="sorting" style="width: 33px;">Phone number</th>	
								                        	<th class="sorting_asc" style="width: 50px;">Photo</th>	
								                        	<th class="sorting" style="width: 130px;">Action</th>	
								                        </tr>
								                      </thead>
								                      <tbody>
								                      	<%
								                      		ArrayList<StudentBean> ListSB = StudentService.P_listAllStudents();
								                      		for(StudentBean sb : ListSB){
								                      			out.print("<tr role='row' class='odd'>");
								                      				out.print("<td class='' tabindex='0'>" + sb.getStudent_id() + "</td>");
								                      				String fname = sb.getFirst_name() + " " + sb.getLast_name();
								                      				out.print("<td>" + fname + "</td>");
								                      				out.print("<td>" + sb.getGender() + "</td>");
								                      				out.print("<td class=''>" + sb.getNationality() + "</td>");
								                      				out.print("<td>" + sb.getDob() + "</td>");
								                      				String pob = sb.getAb().getVillage()+"/"+sb.getAb().getCommune()+"/"+sb.getAb().getDistrict()+"/"+sb.getAb().getProvince();
								                      				out.print("<td class=''>" + pob + "</td>");
								                      				String current_address = sb.getAbCurrent().getVillage() +"/"+ sb.getAbCurrent().getCommune()+"/"+ sb.getAbCurrent().getDistrict()+"/"+ sb.getAbCurrent().getProvince();
								                      				out.print("<td class='sorting_1'>" + current_address + "</td>");
								                      				
								                      				out.print("<td>" + sb.getPhone() + "</td>");								                      				
								                      				out.print("<td class=''><img src='../../images/students/" + sb.getPhoto_name() + "' widht='50px' height='50px'></td>");
								                      				out.print("<td class='text-center'>");
					                      								out.print("<a href='../../view/update/EditStudent?id=" + sb.getStudent_id() + "' class='btn btn-primary btn-sm' data-toggle='tooltip' data-placement='top' title='edit'><i class='fa fa-edit'></i></a>");
					                      								out.print("<button type='button' id='btnDelete' value='" + sb.getStudent_id() + "' class='btn btn-danger btn-sm' data-toggle='tooltip' data-placement='top' title='delete'><i class='fa fa-trash'></i></button>");
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
    <script src='../../js/custom_js/bootbox.min.js'></script>
    <!-- Datatables -->
    <script src="../../js/dataTable/jquery.dataTables.min.js"></script>
    <script src="../../js/dataTable/dataTables.bootstrap.min.js"></script>
    <script src="../../js/dataTable/dataTables.responsive.min.js"></script>
    <script src="../../js/dataTable/responsive.bootstrap.js"></script>
    <script src="../../js/dataTable/buttons.bootstrap.min.js"></script>
    <script src="../../js/dataTable/dataTables.scroller.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../../js/custom.min.js"></script>
    <!-- Sweetalert pass id to servlet -->
    <script src='../../css/swal2/sweetalert2.min.js'></script>
    <script src="../../js/custom_js/ButtonDeleteStudent.js"></script>
    <script>
		$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();   
		});
	</script>
</body>
</html>