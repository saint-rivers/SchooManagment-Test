<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="../../css/toastr.min.css" rel="stylesheet">
	<link href="../../css/sweetalert2.min.css" rel="stylesheet">
     <!-- jQuery -->
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

		<%
	
			String userId = request.getParameter("id");
			UserBean ub = UserService.p_getAUser(userId);
			RoleBean rb = ub.getRb();
			
		%>
        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
         <div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Update User Account</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                      
                      <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>   
                  <div class="x_content">
                  <br>                   
                    <form action="${pageContext.request.contextPath}/UserUpdateServlet" class="form-horizontal form-label-left" method="Post" enctype="multipart/form-data">
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">User ID</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" value="<%=ub.getUser_id() %>" class="form-control" disabled>
                          <input type="hidden" name="user_id" value="<%=ub.getUser_id() %>" />
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">User Name</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" name="user_name" value="<%=ub.getUser_name() %>" class="form-control">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">Password</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" name="password" value="<%=ub.getPassword() %>" class="form-control">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">Hin</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" name="hin" value="<%=ub.getHin() %>" class="form-control">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">Question</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" name="question" value="<%=ub.getQuestion() %>" class="form-control">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">Answer</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" name="answer" value="<%=ub.getAnswer() %>" class="form-control">
                        </div>
                      </div>
                      
                      <div class="form-group row">
						<label class="control-label col-md-3 col-sm-3 ">Role</label>
						<div class="col-md-9 col-sm-9 ">
							<select class="form-control" name="role_id">
								<%
									ArrayList<RoleBean> list = UserService.p_getRole();
									for( RoleBean role : list)
										if(rb.getRole_id().equals(role.getRole_id())){
											out.print("<option value='" + role.getRole_id() + "' selected>" + role.getRole_name() + "</option>");
										} else{
											out.print("<option value='" + role.getRole_id() + "'>" + role.getRole_name() + "</option>");
										}
								%>
							</select>
						</div>
					</div>
                    <div class="form-group row">
		              	<label class="control-label col-md-3 col-sm-3 col-xs-3 ">Photo</label>
		              	<div class="col-md-3 col-sm-3 col-xs-3">
		                	<div class="form-group">	                       		
                                <img alt="user_photo" src="../../images/users/<%=ub.getPhoto_name()%>" name="photo" id="show_photo" width="130px" height="147px" style="border:1px solid gray; border-radius:2px">
                                <input type="hidden" name="old_photo" value="<%=ub.getPhoto_name() %>" />
                             </div>
                         	<div class="custom-file mb-3">
				    			<input type="file" class="custom-file-input" id="customFile" name="file" onchange="readDisplayUrl(this);">
				   	 			<label class="custom-file-label" for="customFile">Choose your photo *</label>
                     		</div>
		                </div>
		              </div>
                      <div class="ln_solid"></div>
                      <div class="form-group row">
                        <div class="col-md-9 offset-md-3">
                          <a href="../../view/detail/ListUsers" class="btn btn-primary">Back</a>
                          <button type="submit" class="btn btn-success">Submit</button>
                        </div>
                      </div>
                    </form>
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
	<%
		if( session.getAttribute("code") != null ){
			String msg = session.getAttribute("code").toString();
			if( msg.equalsIgnoreCase("Error") )	{				
			%>	
				<script type="text/javascript">
					toastr.error('Your update failed! try again!')
				</script>
			<% 	
			}
			else{				
			%>	
				<script type="text/javascript">
					$(document).ready(function() {
					     toastr.success('Your update was successfully!')
					 });
				</script>
			<% 	
			}
		}
	    session.removeAttribute("code");
	%>
    <!-- Bootstrap -->
    <script src="../../js/bootstrap.bundle.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../../js/custom.min.js"></script>
    <script src="../../js/toastr.min.js"></script>
   	<script src="../../js/sweetalert2.min.js"></script>
   	<script src="../../js/custom_js/PopupMessage.js"></script>
    <script>
		function readDisplayUrl(input){
			if(input.files && input.files[0]){
			     var reader = new FileReader();
			     reader.onload = function(e){
			     	$('#show_photo').attr('src', e.target.result)
			     };
			     reader.readAsDataURL( input.files[0] );
			 }
		}
	</script>
	<script>
	// the following code show the name of the file appear on select
		$(".custom-file-input").on("change", function() {
			var fileName = $(this).val().split("\\").pop();
			$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
		});
	</script>
</body>
</html>