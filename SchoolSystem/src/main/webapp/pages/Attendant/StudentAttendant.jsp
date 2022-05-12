<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.services.UserService" %>
<%@ page import="bean.UserBean" %>
<%@ page import="db.services.UserService" %> 
<%@ page import="bean.StudentBean" %>
<%@ page import="db.services.StudentService" %>
<%@ page import="db.services.StudentClassService" %>   
<%@ page import="bean.AttendantBean" %>
<%@ page import="db.services.AttendanceService" %>   
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
     <!-- jQuery -->   
    <link href="../../css/dataTable/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/responsive.bootstrap.min.css" rel="stylesheet">

	<link rel="stylesheet" href="../../css/customStyle/multiselect.css">
	<script type="text/javascript" src="../../js/custom_js/multiselect.min.js"></script>
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
	     	<div class="col-md-12 col-sm-12 ">
		        <div class="x_panel">
		          	<div class="x_title">
		            	<h2 class="p-1">សម្រង់វត្តមានសិស្ស</h2>                    
		            	<div class="clearfix"></div>
		          	</div>                  
	              		<div class="x_content">
	              			<div class="row">
	                			<div class="col-sm-12">
	                   				<div class="card-box table-responsive">
										<a style="margin-left:15px;" id="btnAddStudent" class="btn btn-info btn-sm text-white" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus-circle"> Add</i></a>
					            		<div id="datatable-responsive_wrapper" class="dataTables_wrapper container dt-bootstrap no-footer">					              
					            			<div class="row">
					                			<div class="col-sm-12">
					                    			<table id="datatable-responsive" class="table table table-hover table-bordered dt-responsive nowrap dataTable no-footer dtr-inline" cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
										            	<thead>
									                        <tr class="text-center" >
									                        	<th class="sorting" style="width: 68px;">ID</th>
									                        	<th class="sorting" style="width: 68px;">Student Name</th>							                        	
									                        	<th class="sorting" style="width: 153px;">Gender</th>
									                        	<th class="sorting" style="width: 153px;">Status</th>
									                        	<th class="sorting" style="width: 153px;">Attendance Date</th>							                        								                        	
									                        </tr>
									                    </thead>
								                		<tbody>
									                      	<%
								                      			String class_id = request.getParameter("class_id");
									                      		ArrayList<AttendantBean> att = AttendanceService.getAttendanceByClassID(class_id);
									                      		for(AttendantBean atb : att){
									                      			out.print("<tr role='row' class='text-center'>");
									                      				out.print("<td>" + atb.getStudentB().getStudent_id() + "</td>");
									                      				out.print("<td>" + atb.getStudentB().getFirst_name()+" "+atb.getStudentB().getLast_name() + "</td>");
									                      				out.print("<td>" + atb.getStudentB().getGender() + "</td>");
									                      				if(atb.getStatus() == 0 ){
									                      					out.print("<td><span class='badge badge-pill badge-success'>Present</span></td>");
									                      				}else{
									                      					out.print("<td><span class='badge badge-pill badge-danger'>Absent</span></td>");
									                      				}
									                      				out.print("<td>" + atb.getDate() + "</td>");									                      				
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
	     	
	     	<div class="container">
			  <!-- The Modal -->
			  <form id="formmulticheck" action="${pageContext.request.contextPath}/AddAttendance" method="POST">
				  <div class="modal fade" id="myModal">
				    <div class="modal-dialog modal-lg modal-dialog-scrollable">
				      <div class="modal-content">
				        <!-- Modal Header -->
				        <div class="modal-header">
				          <h4 class="modal-title" id="student_class">ស្រង់វត្តមានសិស្ស</h4>
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				        </div>				        
				        <!-- Modal body -->
				        <div class="modal-body">
				          	<div class="col-sm-12">
                   				<div class="card-box table-responsive">
				            		<div id="datatable-responsive_wrapper" class="dataTables_wrapper container dt-bootstrap no-footer">					              
				            			<div class="row">				            				
				                			<div class="col-sm-12">
				                				<div>Date : <input type="date" name="attendance_date"></div>
				                    			<table id="datatable-responsive" class="table table table-hover table-bordered dt-responsive nowrap dataTable no-footer dtr-inline" cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
									            	<thead>
								                        <tr class="text-center" >
								                        	<th style="width: 50px;">ID</th>
								                        	<th style="width: 68px;">Student Name</th>							                        	
								                        	<th style="width: 25px;">Gender</th>	
								                        	<th style="width: 65px;"> 
								                        		<input style="cursor: pointer;width:15px; height:15px;" type='checkbox' id="selectAllP" class='form-check-input'>P
								                        	</th>								                        	
								                        	<th style="width: 65px;"> 
								                        		<input style="cursor: pointer;width:15px; height:15px;" type='checkbox' id="selectAllA" class='form-check-input'>A
								                        	</th>				                        								                        	
								                        </tr>
								                    </thead>
							                		<tbody>
								                      	<%
								                      		ArrayList<StudentBean> sbean = StudentClassService.getStudentByClassID(class_id);
								                      		for(StudentBean sb : sbean){
								                      			out.print("<tr class='text-center'>");
								                      				out.print("<td>" + sb.getStudent_id() + "</td>");
								                      				out.print("<td>" + sb.getFirst_name()+" "+sb.getLast_name() + "</td>");
								                      				out.print("<td>" + sb.getGender() + "</td>");	
								                      				out.print("<td>");
								                      					out.print("<label class='form-check-label' style='font-size: 16px;'>");
																			out.print("<input style='cursor: pointer;width:15px; height:15px;' type='checkbox' class='form-check-input checkboxP' name='stuid_and_status' value='"+ sb.getStudent_id() +":"+ 0 +"'");	
																		out.print("</label>");
																	out.print("</td>");
								                      				out.print("<td>");
								                      					out.print("<label class='form-check-label' style='font-size: 12px;'>");
																			out.print("<input style='cursor: pointer;width:15px; height:15px;' type='checkbox' class='form-check-input checkboxA' name='stuid_and_status' value='"+ sb.getStudent_id() +":"+ 1 +"'>");	
																		out.print("</label>");
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
				        <!-- Modal footer -->
				        <div class="modal-footer">
				        	<button type="submit" class="btn btn-success">Add</button>
				          	<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
				        </div>				        
				      </div>
				    </div>
				  </div>
			  </form>
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
    <!-- Custom Theme Scripts -->
    <script src="../../js/custom.min.js"></script>	
    <script>
	    $(document).ready(function(){
	    	$("#selectAllP").click(function(){
	    	        if(this.checked){
	    	            $('.checkboxP').each(function(){
	    	                $(".checkboxP").prop('checked', true);
	    	            })
	    	        }else{
	    	            $('.checkboxP').each(function(){
	    	                $(".checkboxP").prop('checked', false);
	    	            })
	    	        }
	    	    });
	    	
	    	$("#selectAllA").click(function(){
    	        if(this.checked){
    	            $('.checkboxA').each(function(){
    	                $(".checkboxA").prop('checked', true);
    	            })
    	        }else{
    	            $('.checkboxA').each(function(){
    	                $(".checkboxA").prop('checked', false);
    	            })
    	        }
    	    });
	    	});
	</script>
    <script>
		$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();   
		});
	</script>
</body>
</html>