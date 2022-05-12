<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.ClassStudyBean"%>
<%@ page import="db.services.ClassStudyService" %>
<%@ page import="bean.RoomBean"%>
<%@ page import="db.services.RoomService" %> 
<%@ page import="bean.SubjectCategoryBean"%>
<%@ page import="db.services.SubjectCategoryService" %> 
<%@ page import="bean.SubjectBean"%>
<%@ page import="db.services.SubjectService" %> 
<%@ page import="bean.TeacherBean"%>
<%@ page import="db.services.TeacherService" %>
<%@ page import="bean.TimeBean"%>
<%@ page import="bean.ScheduleBean" %>
<%@ page import="db.services.ScheduleService" %>
<%@ page import="bean.DayBean"%>
<%@ page import="db.services.DayService" %>
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
    <link href="../../css/dataTable/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/scroller.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/customStyle/timetable.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script> 
    <script src="../../js/popper.min.js"></script>
    <script src="../../js/custom_js/lock_screen.js"></script>
    <script type="text/javascript">
	    $(document).ready(function(){
			$("#subject").on('change', function(){
				var sid = $(this).val();
				var params = {subject_id : sid};
					
					$.post("${pageContext.request.contextPath}/GetTeacherBySubjectID" , $.param(params) , function(responseJson){
						var $select = $("#teacher");
						$select.find("option").remove();
						$.each(responseJson, function(idx, key){
							console.log( key );
							$("<option>").val( key.t_id ).text(key.t_fname +" "+ key.t_lname).appendTo($select);
						});
					});
			});
		});
    </script>
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
     			<div class="col-md-6">
	              <div class="x_panel">
	                <div class="x_title">
	                  <h2> ថ្នាក់រៀន</h2>
	                  <h2 style="float:right;">2021-2022</h2>
	                  <div class="clearfix"></div>
	                 </div>
	                  <%
							if( session.getAttribute("code") != null ) {
								String msg = session.getAttribute("code").toString();
								if( msg.equalsIgnoreCase("error") )
								{
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
								}
								else{
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
	                <div class="x_content">
	                  <div class="buttons">
	                  	<div class="form-group row">
		                  	<%
		                  		ArrayList<ClassStudyBean> list = ClassStudyService.p_listAllClassStudies();
		                  		for(ClassStudyBean csb : list){
		                  			out.print("<div>");
		                  				String class_study = csb.getClass_id() + ":" + csb.getRoomb().getRoom() +":" + csb.getRoomb().getRoom();
			                  			out.print("<button type='button' class='btn btn-outline-info btn-lg btnClass' value='"+ class_study +"' >" + csb.getRoomb().getRoom() + "</button>");   	
			                  		out.print("</div>");
		                  		}
		                  	%>
	                  	</div>
	                  </div>
	                </div>
	              </div>
	            </div>
     			
     			<div class="col-md-6">
	              <div class="x_panel">
	                <div class="x_title">
	                  <h2>បង្កើតកាលវិភាគ</h2>
	                  <h2 style="float:right;">2021-2022</h2>
	                  <div class="clearfix"></div>
	                </div>
	                <%
						if( session.getAttribute("message") != null ){
							String msg = session.getAttribute("message").toString();
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
							}
							else{
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
                  		session.removeAttribute("message");
					%>
	                <div class="x_content">
	                  <form action="${pageContext.request.contextPath}/AddNewSchedule" method="POST">
	                  	<div class="form-group row">
                       		<label class="control-label col-md-3 col-sm-4 col-xs-4">ថ្នាក់រៀន :</label>
	                        <div class="col-md-9 col-sm-8 col-xs-8">
	                          <select class="form-control" name="class_id">
	                          	<option disabled="disabled" selected>ជ្រើសរើសថ្នាក់រៀន</option>
	                          	<%
	                          		ArrayList<ClassStudyBean> ListClass = ClassStudyService.p_listAllClassStudies();
	                          		for(ClassStudyBean classS : ListClass){
	                          			out.print("<option value='"+ classS.getClass_id() +"'>"+ classS.getRoomb().getRoom() +"</option>");
	                          		}
	                          	%>
	                          </select>
	                        </div>
                     	</div>
                     	<div class="form-group row">
                       		<label class="control-label col-md-3 col-sm-4 col-xs-4">ម៉ោងរៀន :</label>
	                        <div class="col-md-6 col-sm-8 col-xs-8">
	                        	<select class="form-control" name="time_id">
	                          		<option disabled="disabled" selected>ម៉ោង</option>
	                          		<%
	                          			ArrayList<TimeBean> listS = ScheduleService.getTimeList();
	                          			for(TimeBean tb : listS){
	                          				String time = tb.getStart_time() +" ដល់ "+ tb.getEnd_time();
	                          				out.print("<option value="+ tb.getTime_id() +">"+ time +"</option>");
	                          			}
	                          		%>
	                          	</select>
	                        </div>
	                        <div class="col-md-3 col-sm-8 col-xs-8 pt-2">
	                        	<a href="../../view/Timetable/AddTime" style="text-decoration:underline;cursor:pointer;">New time</a>
	                        </div>
                     	</div>
							
	                  	<div class="form-group row">
                       		<label class="control-label col-md-3 col-sm-4 col-xs-4">ថ្ងៃរៀន :</label>
	                        <div class="col-md-9 col-sm-8 col-xs-8">
	                          <select class="form-control" name="day_id">
	                          	<option selected disabled="disabled">ជ្រើសរើសថ្ងៃ</option>
	                          	<%
	                          		ArrayList<DayBean> listDay = DayService.getListDays();
	                          		for(DayBean Dayb : listDay){
	                          			out.print("<option value='"+ Dayb.getDay_id() +"'>"+ Dayb.getDay_name() +"</option>");
	                          		}
	                          	%>
	                          </select>
	                        </div>
                     	</div>
                     	<div class="form-group row">
                       		<label class="control-label col-md-3 col-sm-4 col-xs-4">មុខវិជ្ជា :</label>
	                        <div class="col-md-9 col-sm-8 col-xs-8">
	                          <select class="form-control" id="subject" name="subject_id">
	                          	<option selected disabled="disabled">ជ្រើសរើសមុខវិជ្ជា</option>
	                          	<%
	                          		ArrayList<SubjectBean> listSubject = SubjectService.p_listAllSubject();
	                          		for(SubjectBean SB : listSubject){
	                          			out.print("<option value='"+ SB.getSubject_id() +"'>"+ SB.getSubject_name() +"</option>");
	                          		}
	                          	%>
	                          </select>
	                        </div>
                     	</div>
                     	<div class="form-group row">
                       		<label class="control-label col-md-3 col-sm-4 col-xs-4">បង្រៀនដោយ :</label>
	                        <div class="col-md-9 col-sm-8 col-xs-8">
	                          <select class="form-control" id="teacher" name="teacher_id">
	                          	<option selected disabled="disabled">ជ្រើសរើសគ្រូ</option>
	                          	
	                          </select>
	                        </div>
                     	</div>
                     	<div class="ln_solid text-success"></div>
	                      <div class="form-group row">
	                        <div class="col-md-9 offset-md-3">
	                          <button class="btn btn-primary" type="reset">Reset</button>
	                          <button type="submit" class="btn btn-info">Add</button>
	                        </div>
	                      </div>
	                  </form>
	                </div>
	              </div>
	            </div>
     			<div class="col-md-12 col-sm-12 ">
	                <div class="x_panel">
	                  <div class="x_title text-center">
	                    <h4 id="Schedule_name" style="font-family:Khmer OS Muol Light;" class="p-1">កាលវិភាគប្រចាំថ្នាក់ទី ...</h4>
	                    <div class="clearfix"></div>
	                  </div>
	                  <script type="text/javascript">
		                  var today = new Date();
		                  var dd = String(today.getDate()).padStart(2, '0');
		                  var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
		                  var yyyy = today.getFullYear();
	
		                  today = dd + '/' + mm + '/' + yyyy;
		                  document.write("<h4>"+today+"</h4>");
	                  </script>
	                  <div class="x_content">
	                      <div class="row">
	                          <div class="col-sm-12">
	                   			<div class="card-box table-responsive">
					                <div id="datatable-responsive_wrapper" class="dataTables_wrapper container dt-bootstrap no-footer">
					                   <div class="row">
					                    	<div class="col-sm-12">
					                    		<table id="data_schedule" class="table table-hover table-bordered table-sm dt-responsive nowrap dataTable no-footer dtr-inline" cellspacing="0" width="100%" style="width: 100%;">
								                      <thead>
								                        <tr class="bg-info text-white text-center">
							                                <th class="text-uppercase">ម៉ោង</th>
							                                <th class="text-uppercase">ថ្ងៃ</th>
							                                <th class="text-uppercase">មុខវិជ្ជា</th>
							                                <th class="text-uppercase">បង្រៀនដោយ</th>
							                                <th class="text-uppercase">ការកំណត់</th>
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
	            	</div>
	         	</div>
	       	</div>
     		</div>
     		
     		<div class="container">
			  <div class="modal fade" id="myModal" role="dialog">
			    <div class="modal-dialog">
			      <div class="modal-content bg-info">
			        <div class="modal-header">
			        	<h4 class="modal-title text-white">កែប្រែកាលវិភាគ</h4>
			          	<button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        <div class="modal-body">
			        	<form action="${pageContext.request.contextPath}/AddClassSchedule" method="POST">
				        	<div class="col-md-12 col-sm-12 ">
					        	<div class="form-group row">
					        		<input type="hidden" value="" name="class"></input>
			                        <h5 class="control-label col-md-3 col-sm-3 col-xs-3 text-white">ម៉ោង :</h5>
			                        <div class="col-md-9 col-sm-9 col-xs-9">
			                          <select class="form-control" name="class_id">
				                          	<%
						                  		ArrayList<TimeBean> listTime = ScheduleService.getTimeList();
						                  		for(TimeBean tb : listTime){
							                  		out.print("<option value='"+ tb.getTime_id() +"'>" + tb.getStart_time()+" ដល់ " + tb.getEnd_time() + "</option>");   	
						                  		}
				                          	%>
			                          </select>
			                        </div>
			                     </div>
			                     <div class="form-group row">
									<h5 class="control-label col-md-3 col-sm-3 col-xs-3 text-white">ថ្ងៃ :</h5>
									<div class="col-md-9 col-sm-9 ">
										<select class="form-control" name="day_id">
											 <%
											    ArrayList<DayBean> listD = DayService.getListDays();
												for(DayBean db : listD){
													out.print("<option value='"+ db.getDay_id() +"'>"+ db.getDay_name() +"</option>");
												}
										    %>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<h5 class="control-label col-md-3 col-sm-3 col-xs-3 text-white">មុខវិជ្ជា :</h5>
									<div class="col-md-9 col-sm-9 ">
										<select class="form-control" name="subject">
											 <%
											    ArrayList<SubjectBean> listSub = SubjectService.p_listAllSubject();
												for(SubjectBean sb : listSub){
													out.print("<option value='"+ sb.getSubject_id() +"'>"+ sb.getSubject_name() +"</option>");
												}
										    %>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<h5 class="control-label col-md-3 col-sm-3 col-xs-3 text-white">គ្រូ :</h5>
									<div class="col-md-9 col-sm-9 ">
										<select class="form-control" id="teacher" name="teacher">
											 
										</select>
									</div>
								</div>
				        	</div>
					        <div class="modal-footer justify-content-between">
					          <button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
					          <button type="submit" class="btn btn-outline-light">Update</button>
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
    <script type="text/javascript">
    	$(document).ready(function(){
    		$(".btnClass").click(function(){
    			var id = $(this).val();
    			var data = id.split(":");
    			$("#Schedule_name").text("កាលវិភាគប្រចាំ" + data[2]);
    			var params = {classid : data[0]};
    			$.post("${pageContext.request.contextPath}/GetSchedule", $.param(params), function(responseJson){
    				var $row = $("tr");
    				$row.find("td").remove();
    				$.each(responseJson, function(index, key){
    					console.log(key);
   						var record = "<tr>";
    						var time = key.TimeB.start_time +" - "+ key.TimeB.end_time;
    						record += "<td class='bg-info text-white text-center align-middle'>"+ time +"</td>";
    						record += "<td class='text-center align-middle'>"+ key.DayB.day_name +"</td>";
    						if(key.SubjectB.subject_name == "ភាសាខ្មែរ"){
    							record += "<td class='text-info text-center align-middle'>"+ key.SubjectB.subject_name +"</td>";
    						}
    						if(key.SubjectB.subject_name == "គណិតវិទ្យា"){
    							record += "<td class='text-success text-center align-middle'>"+ key.SubjectB.subject_name +"</td>";
    						}
    						if(key.SubjectB.subject_name == "សិក្សាសង្គម"){
    							record += "<td class='text-secondary text-center align-middle'>"+ key.SubjectB.subject_name +"</td>";
    						}
    						if(key.SubjectB.subject_name == "វិទ្យាសាស្ត្រ"){
    							record += "<td class='text-warning text-center align-middle'>"+ key.SubjectB.subject_name +"</td>";
    						}
    						var teacher_name = key.TeacherB.t_fname +" "+ key.TeacherB.t_lname;
    						if(key.TeacherB.t_gender == "ប្រុស"){
    							record += "<td class='text-center align-middle'>លោកគ្រូ <i class='text-info' style='font-family:Khmer OS Muol Light'>"+ teacher_name +"</i></td>";
    						}else{
    							record += "<td class='text-center align-middle'>អ្នកគ្រូ <i class='text-success' style='font-family:Khmer OS Muol Light'>"+ teacher_name +"</i></td>";
    						}	    						
    						record += "<td class='text-center align-middle'>";
    							record += "<button type='button' class='btn btn-danger btn-sm'>delete</button>";
    							record += "<button type='button' value='"+ key.class_id +"' class='btn btn-primary btn-sm' data-toggle='modal' data-target='#myModal' style='cursor:pointer'>edit</button>";
    						record += "</td>";
    					record +="</tr>";
    					$("#data_schedule tbody").append(record);
    				});
    			});
    		});
    	});
    </script>
</body>
</html>