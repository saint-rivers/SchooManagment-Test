<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.services.ClassStudyService" %>
<%@ page import="bean.ClassStudyBean" %>
<%@ page import="db.services.RoomService" %>
<%@ page import="bean.RoomBean" %>
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
    <!-- delete  -->
    <link href="../../css/swal2/sweetalert2.min.css" rel="stylesheet">
    <!-- message add  -->
    <link href="../../css/toastr.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../../css/custom.min.css" rel="stylesheet">
    <link href="../../css/dataTable/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/scroller.bootstrap.min.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script>  
    <!-- message add  --> 
    <script src="../../js/popper.min.js"></script>
    <script src="../../js/toastr.min.js"></script>  
    <script src="../../js/custom_js/PopupMessage.js"></script>
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
		                	<h2>List Class Studies</h2>
		                    <ul class="nav navbar-right panel_toolbox">
		                    	<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
		                      	<li class="dropdown">
		                        	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
			                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			                            <a href="#" class="dropdown-item" data-toggle="modal" data-target="#myModal">
			                            	<i class="fa fa-plus-circle text-primary"> បង្កើតថ្នាក់ថ្មី</i>
			                            </a>
			                            <a class="dropdown-item" href="../../view/StudentClass/ClassStudent">
			                            	<i class="fa fa-plus-circle text-primary"> បញ្ចូលសិស្សតាមថ្នាក់</i>
			                            </a>			                            
			                            <a class="dropdown-item" href="../../view/add/TeacherClass">
			                            	<i class="fa fa-plus-circle text-primary"> បញ្ចូលគ្រូតាមថ្នាក់</i>
			                            </a>
			                        </div>
		                      	</li>
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
						                    		<table id="datatable-responsive" class="table table table-hover table-bordered dt-responsive nowrap dataTable no-footer dtr-inline" cellspacing="0" width="100%" style="width: 100%;">
									                	<thead>
									                        <tr class="table-info text-center" >
									                        	<th class="sorting" style="width: 68px;">Class ID</th>
									                        	<th class="sorting" style="width: 68px;">Class Name</th>
									                        	<th class="sorting" style="width: 153px;">Start Date</th>
									                        	<th class="sorting" style="width: 153px;">End Date</th>
									                        	<th class="sorting" style="width: 153px;">Time Study</th>
									                        	<th class="sorting" style="width: 153px;">Status</th>
									                        	<th class="sorting" style="width: 153px;">Option</th>
									                        </tr>
									                      </thead>
									                      <tbody>
									                      	<%
									                      		ArrayList<ClassStudyBean> List = ClassStudyService.p_listAllClassStudies();
									                      		for(ClassStudyBean csb : List){
									                      			out.print("<tr role='row' class='odd'>");
									                      				out.print("<td>" + csb.getClass_id() + "</td>");
									                      				out.print("<td>" + csb.getRoomb().getRoom() + "</td>");
									                      				out.print("<td>" + csb.getStart_date() + "</td>");
									                      				out.print("<td>" + csb.getEnd_date() + "</td>");
									                      				out.print("<td>" + csb.getTime_study() + "</td>");
									                      				out.print("<td>" + csb.getStatus() + "</td>");
									                      				out.print("<td class='text-center'>");									                      				
								                      				 	out.print("<a href='../../view/update/class?id=" + csb.getClass_id() + "' class='btn btn-secondary btn-sm' data-toggle='tooltip' data-placement='top' title='edit'><i class='fa fa-edit'></i></a>");
								                      				 	out.print("<button type='submit' id='btnDelete' value='" + csb.getClass_id() + "' class='btn btn-secondary btn-sm' data-toggle='tooltip' data-placement='top' title='delete'><i class='fa fa-trash'></i></button>");
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
		         	<div class="container">
						<div class="modal fade" id="myModal" role="dialog">
					    	<div class="modal-dialog modal-lg">
					    		<form class="form-label-left input_mask" action="${pageContext.request.contextPath}/AddClassServlet" method="POST">
						      		<div class="modal-content">
						       			<div class="modal-header">
						        			<h3 class="modal-title">បង្កើតថ្នាក់រៀនថ្មី</h3>
						          			<button type="button" class="close" data-dismiss="modal">&times;</button>
						        		</div>
						        		<div class="modal-body">
						          			<div class="col-md-12 col-sm-12 ">
								        		<div class="x_panel">
													<div class="x_content" style="display: block;">
														<br>
														<%
															String newId = ClassStudyService.getNewId();
														%>
														<div class="col-md-6 col-sm-6 form-group has-feedback">
															<input type="text" value="<%=newId %>" class="form-control has-feedback-left" disabled>
															<input type="hidden" name="class_id" value="<%=newId %>">
															<span class="fa fa-key form-control-feedback left"></span>
														</div>
														
														
														<div class="form-group row">
															<div class="col-md-12 col-sm-12 form-group has-feedback">
																<select class="form-control" name="room_id">
																	<option class="hidden"  selected disabled>ជ្រើសរើសបន្ទប់រៀន</option>
																	<%
																		ArrayList<RoomBean> list = RoomService.p_listAllRoom();
																		for(RoomBean rb : list){
																			out.print("<option value='" + rb.getRoom_id() + "'>" + rb.getRoom() + "</option>");
																		}
																	%>
																</select>
															</div>
														</div>
														<div class="form-group row">
															<label class="col-md-2 col-sm-2 col-xl-2" >ចូលរៀនថ្ងៃទី</label>
															<div class="col-md-4 col-sm-4 form-group has-feedback">
																<input type="date" name="start_date" class="form-control">
															</div>
															<label class="col-md-2 col-sm-2 col-xl-2" >ដល់ថ្ងៃទី</label>
															<div class="col-md-4 col-sm-4 form-group has-feedback">
																<input type="date" name="end_date" class="form-control">
															</div>
														</div>
														
														<div class="form-group row">
															<label class="col-form-label col-md-3 col-sm-3 ">ពេលសិក្សា</label>
															<div class="col-md-9 col-sm-9 ">
																<input type="text" name="time_study" class="form-control" placeholder="ពេលសិក្សា">
															</div>
														</div>
														<div class="form-group row">
															<label class="col-form-label col-md-3 col-sm-3 ">Status</label>
															<div class="col-md-9 col-sm-9">
																<select class="form-control" name="status">
																	<option value="Active">Active</option>
																	<option value="Start Soon">Start Soon</option>
																	<option value="Disable">Disable</option>
																</select>
															</div>
														</div>
													</div>
												</div>
							        		</div>
						        		</div>
						        		<div class="modal-footer">
						        			<button type="submit" class="btn btn-success">Save</button>
						        			<button class="btn btn-primary" type="reset">Reset</button>
						          			<button type="button" class="btn btn-warning text-white" data-dismiss="modal">Close</button>
						        		</div>
						      		</div>
					      		</form>
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
		<%
		if( session.getAttribute("code") != null ){
			String msg = session.getAttribute("code").toString();
			if( msg.equalsIgnoreCase("Error"))	{				
			%>	
				<script type="text/javascript">
					toastr.error('Insert failed! try again!')
				</script>
			<% 	
			}
			else{				
			%>	
				<script type="text/javascript">
					$(document).ready(function() {
					     toastr.success('Insert successfully!')
					 });
				</script>
			<% 	
			}
		}
	    session.removeAttribute("code");
	%>
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
    <script src="../../js/custom_js/ButtonDeleteClass.js"></script>
</body>
</html>