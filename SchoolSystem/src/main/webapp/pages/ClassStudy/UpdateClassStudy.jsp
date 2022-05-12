<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.services.ClassStudyService" %>
<%@ page import="bean.ClassStudyBean" %>
<%@ page import="db.services.RoomService" %>
<%@ page import="bean.RoomBean" %>
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
			session.removeAttribute("user_name");
			response.sendRedirect("../../AccessSystem");
		}
	}else{
		//redirect to login page
		session.removeAttribute("user_name");
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
    <link href="../../css/dataTable/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/buttons.bootstrap.min.css" rel="stylesheet">
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
                    <h2>Update Class Study</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>  
                                    <%
						if( session.getAttribute("code") != null ) 
						{
							String msg = session.getAttribute("code").toString();
							if( msg.equalsIgnoreCase("error") )
							{
								out.print("<div class='alert alert-danger' id='danger-alert'>");
								out.print("<h3>ERROR</h3>");
								out.print("Update is failed.");
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
								out.print("Update data was successful.");
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
                    <%
						String id = request.getParameter("id");
						ClassStudyBean csb = ClassStudyService.getAClassStudy(id);
					%>
                    <form action="${pageContext.request.contextPath}/UpdateClassServlet" class="form-horizontal form-label-left" method="Post">
						<div class="col-md-12 col-sm-12 ">
			        		<div class="x_panel">
								<div class="x_content" style="display: block;">
									<br>
									<div class="col-md-6 col-sm-6 form-group has-feedback">
										<input type="text" value="<%=id %>" class="form-control has-feedback-left" disabled>
										<input type="hidden" name="class_id" value="<%=id%>">
										<span class="fa fa-key form-control-feedback left"></span>
									</div>
									
									<div class="form-group row">
										<label class="col-md-2 col-sm-2 col-xl-2" >បន្ទប់រៀន</label>
										<div class="col-md-10 col-sm-10 form-group has-feedback">
											<select class="form-control" name="room_id">
												<%
													ArrayList<RoomBean> list = RoomService.p_listAllRoom();
													for(RoomBean rb : list){
														if(csb.getRoomb().getRoom_id().equalsIgnoreCase(rb.getRoom_id())){
															out.print("<option value='" + rb.getRoom_id() + "' selected>" + rb.getRoom() + "</option>");
														}else{
															out.print("<option value='" + rb.getRoom_id() + "'>" + rb.getRoom() + "</option>");
														}
													}
												%>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-md-2 col-sm-2 col-xl-2" >ចូលរៀនថ្ងៃទី</label>
										<div class="col-md-4 col-sm-4 form-group has-feedback">
											<input type="text" name="start_date" value="<%=csb.getStart_date() %>" class="form-control">
										</div>
										<label class="col-md-2 col-sm-2 col-xl-2" >ដល់ថ្ងៃទី</label>
										<div class="col-md-4 col-sm-4 form-group has-feedback">
											<input type="text" name="end_date" value="<%=csb.getEnd_date() %>" class="form-control">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-form-label col-md-2 col-sm-2 ">ពេលសិក្សា</label>
										<div class="col-md-4 col-sm-4 ">
											<input type="text" name="time_study" value="<%=csb.getTime_study() %>" class="form-control" placeholder="ពេលសិក្សា">
										</div>
										<label class="col-form-label col-md-2 col-sm-2 ">Status</label>
										<div class="col-md-4 col-sm-4">
											<select class="form-control" name="status">
												<%
													ArrayList<ClassStudyBean> listStatus = ClassStudyService.getClassStudyStatus();
													for(ClassStudyBean cb : listStatus){
														if(csb.getStatus().equalsIgnoreCase(cb.getStatus())){
															out.print("<option value='" + cb.getStatus() + "' selected>" + cb.getStatus() + "</option>");
														}else{
															out.print("<option value='" + cb.getStatus() + "'>" + cb.getStatus() + "</option>");
														}
													}
												%>
											</select>
										</div>
									</div>
									<div class="form-group row">
				                        <div class="col-md-12 offset-md-3">
				                          <a href="../../view/list/ClassStudy" class="btn btn-primary">Back</a>
				                          <button type="submit" class="btn btn-success">Update</button>
				                        </div>
			                      </div>
								</div>
							</div>
		        		</div>
                    </form>
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
    <script src="../../js/dataTable/buttons.bootstrap.min.js"></script>
    <script src="../../js/dataTable/dataTables.scroller.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../../js/custom.min.js"></script>
</body>
</html>