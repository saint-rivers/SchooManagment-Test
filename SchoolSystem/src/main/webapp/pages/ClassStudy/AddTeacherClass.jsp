<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.services.ClassStudyService" %>
<%@ page import="bean.ClassStudyBean" %>
<%@ page import="db.services.TeacherService" %>
<%@ page import="bean.TeacherBean" %>  
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
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../../css/font-awesome.min.css" rel="stylesheet">
    <link href="../../webcss/all.min.css" rel="stylesheet"> <!--load all styles -->
    <!-- Custom Theme Style -->
    <link href="../../css/custom.min.css" rel="stylesheet">
    <link href="../../css/dataTable/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/scroller.bootstrap.min.css" rel="stylesheet">
    
	<link rel="stylesheet" href="../../css/customStyle/multiselect.css">
	<script type="text/javascript" src="../../js/custom_js/multiselect.min.js"></script>
	<script src="../../js/jquery.min.js"></script> 
   <script src="../../js/custom_js/lock_screen.js"></script>
    <script type="text/javascript">
		$(document).ready(function(){
			$(".btnclass").click(function(){
				var tmp_data = $(this).val();
				var data = tmp_data.split(":");
				var id = data[0];
				var name = data[1];
				$("#class_id").val(id);
				$("#class_name").text(name);
				$("#student_class").text(name);
			});
		});
	</script>
    <style type="text/css">
		#button1 {
		  	background-color: white;
		  	color: black; 
		  	padding: 10px;
		  	font-size:  20px;
		  	border: 2px solid #4CAF50;
		  	border-radius:15px;
		  	cursor: pointer;
		}
		#button1:hover { background-color: #4CAF50; color: white;border:2px solid yellow;}
    </style>
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
          	<!-- top tiles -->
        		<div class="col-md-3 col-sm-3">
        			<div class="x_panel">
						<div class="x_title">
							<h2 class="p-2" style="font-family:Khmer OS Muol Light;">ថ្នាក់រៀន</h2>
							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
								<li><a class="close-link"><i class="fa fa-close"></i></a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content" style="display: block;">
							<br>
							<form class="form-label-left input_mask">
								<div class="form-group row">
									<div class="col-md-12 col-sm-12">
										<%
											ArrayList<ClassStudyBean> list = ClassStudyService.p_listAllClassStudies();
											for(ClassStudyBean csb : list){
												String class_study = csb.getClass_id() + ":" + csb.getRoomb().getRoom();
												out.print("<button type='button' id='button1' value='" + class_study + "' class='btnclass col-md-12 col-sm-12'>" + csb.getRoomb().getRoom() + "</button>");
											}
										%>
									</div>
								</div>
								<div class="ln_solid"></div>
							</form>
						</div>
					</div>
        		</div>
        		
        		<div class="col-md-9 col-sm-9">
        			<div class="x_panel">
						<div class="x_title">
							<h2 id="class_name" class="p-2" style="font-family:Khmer OS Muol Light;">ថ្នាក់ទី...</h2>
							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
								<li><a class="close-link"><i class="fa fa-close"></i></a></li>
							</ul>
							<div class="clearfix"></div>
							<%
								if( session.getAttribute("code") != null ){
									String msg = session.getAttribute("code").toString();
									if( msg.equalsIgnoreCase("error") ){
										out.print("<div class='alert alert-danger' id='danger-alert'>");
										out.print("<h3>ERROR</h3>");
										out.print("Insert data failed.");
										out.print("</div>");
									%>	
										<script type="text/javascript">
											$("#danger-alert").fadeTo( 2000 , 500 ).slideUp(500, function(){
												$("#danger-alert").slideUp(500);
											});
										</script>
									<% 	
									}else{
										out.print("<div class='alert alert-success' id='success-alert'>");
										out.print("<h4>Success</h4>");
										out.print("Insert data was successful.");
										out.print("</div>");
									%>	
										<script type="text/javascript">
											$("#success-alert").fadeTo( 2000 , 500 ).slideUp(500, function(){
												$("#success-alert").slideUp(500);
											});
										</script>
									<% 	
									}
								}
		                  		session.removeAttribute("code");
							%>
						</div>
						<div class="x_content" style="display: block;">
							<br>
							<form class="form-label-left input_mask">
								<div class="row">
		                          <div class="col-sm-12">
		                   			<div class="card-box table-responsive">
										<a style="margin-left:15px;" class="btn btn-info btn-md text-white" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus-circle"> Teacher</i></a>
						                <div id="datatable-responsive_wrapper" class="dataTables_wrapper container dt-bootstrap no-footer">
							              
						                   <div class="row">
						                    	<div class="col-sm-12">
						                    		<table id="datatable-responsive" class="table table table-hover table-bordered dt-responsive nowrap dataTable no-footer dtr-inline" cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
									                      <thead>
									                        <tr class="table-success text-center">
									                        	<th class="sorting" style="width: 68px;">Teacher ID</th>
									                        	<th class="sorting" style="width: 68px;">Full name</th>
									                        	<th class="sorting" style="width: 153px;">Gender</th>
									                        	<th class="sorting" style="width: 33px;">Phone number</th>	
									                        	<th class="sorting" style="width: 33px;">Photo</th>	       	
									                        	<th class="sorting" style="width: 144px;">Action</th>
									                        </tr>
									                      </thead>
									                      <tbody>
									                      	
									                	</tbody>
						                    		</table>
						                  		</div>
						                 	</div>
						               </div>
		                  			</div>
		                		</div>
		              		</div>
							<div class="ln_solid"></div>
							</form>
						</div>
					</div>
        		</div>
       		</div>
        	<!-- footer content -->
			<jsp:include page="/view/detail/FooterPage"></jsp:include>
    	</div>
    </div>
    <div class="container">
		  <!-- The Modal -->
		  <form id="formmulticheck" action="${pageContext.request.contextPath}/AddTeacherClassServlet" method="POST">
			  <div class="modal fade" id="myModal">
			    <div class="modal-dialog modal-md">
			      <div class="modal-content">
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title" id="student_class"></h4>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        <!-- Modal body -->
			        <div class="modal-body">
			          	<div class="form-group row">
							<div class="col-md-12 col-sm-12  form-group">
								<label class="col-md-3 col-sm-3">Select Teachers</label>
								<input type="hidden" id="class_id" class="form-control" name="class_id">
								<select id="testSelect1" multiple name="teacher_id" class="form-control">
									<%
										ArrayList<TeacherBean> listteacher = TeacherService.P_listInformation_Teacher();
										for(TeacherBean tb : listteacher){
											String teacher = tb.getT_id() + " : " + tb.getT_fname() + " " + tb.getT_lname();
											out.print("<option value='" + tb.getT_id() + "'>" + teacher + "</option>");
										}
									%>
								</select>
								<script>
									document.multiselect('#testSelect1')
										.setCheckBoxClick("checkboxAll", function(target, args) {
											console.log("Checkbox 'Select All' was clicked and got value ", args.checked);
										})
										.setCheckBoxClick("1", function(target, args) {
											console.log("Checkbox for item with value '1' was clicked and got value ", args.checked);
										});
									
									function enable() {
										document.multiselect('#testSelect1').setIsEnabled(true);
									}
								
									function disable() {
										document.multiselect('#testSelect1').setIsEnabled(false);
									}
								</script>
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
    <!-- Bootstrap -->
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <!-- Datatables -->
    <script src="../../js/dataTable/jquery.dataTables.min.js"></script>
    <script src="../../js/dataTable/dataTables.bootstrap.min.js"></script>
    <script src="../../js/dataTable/dataTables.responsive.min.js"></script>
    <script src="../../js/dataTable/responsive.bootstrap.js"></script>
    <script src="../../js/dataTable/buttons.bootstrap.min.js"></script>
    <script src="../../js/dataTable/dataTables.scroller.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../../js/custom.min.js"></script>
    <script>
	    $(document).ready(function(){
			$(".btnclass").click(function(){
				var id = $(this).val();
				var data = id.split(":");
				//alert(data[0]);
				var params = {classid : data[0]};//classid got value from $(this).val()
						
					$.post("${pageContext.request.contextPath}/listTeacherByClassIDServlet" , $.param(params) , function(responseJson){
						var $row = $("tr");
						$row.find("td").remove();
						$.each(responseJson, function(idx, key){
							console.log( key );
								var tbl_record = "<tr>";
								tbl_record += "<td>" + key.t_id +  "</td>";
								var fullname = key.t_fname + " " + key.t_lname;
								tbl_record += "<td>" + fullname +  "</td>";
								tbl_record += "<td>" + key.t_gender +  "</td>";
								tbl_record += "<td>" + key.t_phone +  "</td>";								
								tbl_record += "<td class='text-center'><img src='../../images/teachers/"+key.t_photo+"' widht='45px' height='45px'></td>";
								tbl_record += "<td class='text-center'><button><i class='fa fa-trash text-warning'></i> delete</button></td>";
							tbl_record += "<tr>";
							
							$("#datatable-responsive tbody").append(tbl_record);
						});
					});
				});
			});
    </script>
</body>
</html>