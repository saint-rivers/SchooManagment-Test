<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.services.TeacherService" %>
<%@ page import="bean.TeacherBean" %>
    
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LMS</title>
    <!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../../css/font-awesome.min.css" rel="stylesheet">
    <link href="../../webcss/all.min.css" rel="stylesheet"> <!--load all styles -->
    <link href="../../css/swal2/sweetalert2.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../../css/custom.min.css" rel="stylesheet">
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
                    <h2>List Teacher Information</h2>
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
							                        <tr role="row" class="table-success text-center">
							                        	<th class="sorting" style="width: 68px;">Teacher ID</th>
							                        	<th class="sorting" style="width: 68px;">Full Name</th>
							                        	<th class="sorting" style="width: 153px;">Gender</th>
							                        	<th class="sorting" style="width: 153px;">Nationality</th>
							                        	<th class="sorting" style="width: 153px;">Nationality_Id</th>
							                        	<th class="sorting" style="width: 26px;">Date of birth</th>
							                        	<th class="sorting" style="width: 153px;">Place of birth</th>
							                        	<th class="sorting" style="width: 33px;">Phone Number</th>								                        	
							                        	<th class="sorting" style="width: 33px;">Status :</th>	
							                            <th class="sorting" style="width: 33px;">Country :</th>						                        						                        	               	
							                        	<th class="sorting" style="width: 144px;">CurrentAddress</th>
							                        	<th class="sorting" style="width: 33px;"> Image:</th>
							                        	<th class="sorting" style="width: 33px;"> Option</th>
							                        </tr>
							                      </thead>
							                      <tbody>
							                      	<%
							                      		ArrayList<TeacherBean> list = TeacherService.P_listInformation_Teacher();
							                      		for(TeacherBean tb : list){
							                      			out.print("<tr>");
								                      			out.print("<td>" + tb.getT_id() + "</td>");
								                      			String fullname = tb.getT_fname() + " " + tb.getT_lname();
								                      			out.print("<td>" + fullname + "</td>");
								                      			out.print("<td>" + tb.getT_gender() + "</td>");
								                      			out.print("<td>" + tb.getNationality() + "</td>");
								                      			out.print("<td>" + tb.getNationality_id() + "</td>");
								                      			out.print("<td>" + tb.getT_dob() + "</td>");
								                      			String pob = tb.getaddress_teacher().getVillage()+"/"+tb.getaddress_teacher().getCommune()+"/"+tb.getaddress_teacher().getDistrict()+"/"+tb.getaddress_teacher().getProvince();
								                      			out.print("<td>" + pob + "</td>");
								                      			out.print("<td>" + tb.getT_phone() + "</td>");								                      			
								                      			out.print("<td>" +tb.getStustus() + "</td>");
								                      			out.print("<td>" +tb.getCountry()  + "</td>");
								                      			String current_address = tb.getCurrent_address().getVillage()+"/"+tb.getCurrent_address().getCommune()+"/"+tb.getCurrent_address().getDistrict()+"/"+tb.getCurrent_address().getProvince();
								                      			out.print("<td>" + current_address + "</td>");								                      			
							                      				out.print("<td class=''><img src='../../images/teachers/" + tb.getT_photo() + "' widht='50px' height='50px'></td>");
							                      				out.print("<td>");
							                      					out.print("<a href='../../view/update/UpdateATeacher?id=" + tb.getT_id() + "' class='btn btn-primary btn-sm'><i class='fa fa-edit'></i></a>");
					                      							out.print("<button type='button' id='btnDelete' value='" + tb.getT_id() + "' class='btn btn-danger btn-sm'><i class='fa fa-trash'></i></button>");
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
	<script src="../../js/custom_js/bootbox.min.js"></script> 
	<script src='../../css/swal2/sweetalert2.min.js'></script>
    <script src="../../js/custom_js/ButtonDeleteTeacher.js"></script>
</body>
</html>