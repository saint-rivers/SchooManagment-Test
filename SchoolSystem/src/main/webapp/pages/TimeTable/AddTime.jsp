<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.TimeBean" %>
<%@ page import="db.services.ScheduleService" %>
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
    <!-- TimePicker -->
    <link href="../../css/mdtimepicker.css" rel="stylesheet" type="text/css">
     <!-- jQuery -->
    <script src="../../js/jquery.min.js"></script>   
    <!-- TimePicker -->
    <script src="../../js/mdtimepicker.js"></script>
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
                    <h2>បញ្ចូលម៉ោងរៀនថ្នី</h2>
                    <div class="clearfix"></div>
                  </div>  
                  <div class="col-md-4 col-sm-4 ">
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
	                  <br>	                   
	                    <form action="${pageContext.request.contextPath}/AddTimeServlet" method="POST">							
	                      <div class="form-group row">
	                        <label class="control-label col-md-4 col-sm-3 col-xs-3">ម៉ោងចូល :</label>
	                        <div class="col-md-8 col-sm-8 col-xs-9">
	                          <input type="text" name="start_time" class="timepicker form-control">
	                        </div>
	                      </div>
	                      <div class="form-group row">
	                        <label class="control-label col-md-4 col-sm-3 col-xs-3">ម៉ោងចេញ :</label>
	                        <div class="col-md-8 col-sm-9 col-xs-9">
	                          <input type="text" name="end_time" class="timepicker form-control">
	                        </div>
	                      </div>
	                      <script>
							  $(document).ready(function(){
							    $('.timepicker').mdtimepicker(); //Initializes the time picker
							  });
							</script>
							<script type="text/javascript">
								  var _gaq = _gaq || [];
								  _gaq.push(['_setAccount', 'UA-36251023-1']);
								  _gaq.push(['_setDomainName', 'jqueryscript.net']);
								  _gaq.push(['_trackPageview']);
								
								  (function() {
								    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
								    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
								    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
								  })();
							</script>
	                      <div class="ln_solid"></div>
	                      <div class="form-group row">
	                        <div class="col-md-9 offset-md-3">
	                          <a href="../../view/detail/ClassSchedule" class="btn btn-primary">Back</a>
	                          <button type="submit" class="btn btn-info">Add</button>
	                        </div>
	                      </div>
	                    </form>
	                  </div>
                  </div>
                  
                  <div class="row">
                          <div class="col-sm-12">
                   			<div class="card-box table-responsive">
				                <div id="datatable-responsive_wrapper" class="dataTables_wrapper container dt-bootstrap no-footer">
				                   <div class="row">
				                    	<div class="col-sm-12">
				                    		<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline" cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
							                      <thead>
							                        <tr role="row" class="table-secondary text-info text-center">
							                        	<th class="sorting" style="width: 68px;">#</th>
							                        	<th class="sorting" style="width: 68px;">ម៉ោងចូល</th>
							                        	<th class="sorting" style="width: 68px;">ម៉ោងចែញ</th>
							                        	<th class="sorting" style="width: 153px;">ការកំណត់</th>
							                        </tr>
							                      </thead>
							                      <tbody>
							                      	<%
							                      		ArrayList<TimeBean> ListT = ScheduleService.getTimeList();
							                      		for(TimeBean tb : ListT){
							                      			out.print("<tr role='row' class='odd'>");
							                      				out.print("<td>" + tb.getTime_id() + "</td>");
							                      				out.print("<td>" + tb.getStart_time() + "</td>");
							                      				out.print("<td>" + tb.getEnd_time() + "</td>");
							                      				out.print("<td class='text-center'>");
							                      				 out.print("<a href='../../view/detail/UpdateClassroom?id=" + tb.getTime_id() + "' class='btn btn-secondary btn-sm' data-toggle='tooltip' data-placement='top' title='edit'><i class='fa fa-edit'></i></a>");
							                      				 out.print("<button type='button' id='btnDelete' value='" + tb.getTime_id() + "' class='btn btn-secondary btn-sm' data-toggle='tooltip' data-placement='top' title='delete'><i class='fa fa-trash'></i></button>");
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