<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.SubjectBean"%>
<%@ page import="db.services.SubjectService" %>
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
    <!-- Custom Theme Style -->
    <link href="../../css/custom.min.css" rel="stylesheet">
    <link href="../../css/jquery-ui.css" rel="stylesheet">
     <!-- jQuery -->
    <script src="../../js/jquery.min.js"></script> 
    <script src="../../js/jquery-ui.js"></script>   
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
        <!-- top tiles -->
			<div class="col-md-12 col-sm-12 col-xs-12 mg-auto">
				<div class="x_panel">
					<div class="x_title">
						<h2 class="p-2">ចូរជ្រើសរើសមុខវិជ្ជាដែលគ្រូត្រូវបង្រៀន</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<br>
						<form id="demo-form2" action="${pageContext.request.contextPath}/AddNewSubjectTeacher" class="form-horizontal form-label-left" method="POST">
							<div class="item form-group">
								<label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Search Teacher <span class="required">*</span></label>
								<div class="col-md-6 col-sm-6 ">
									<input type="text" id="search_teacher" name="search_teacher" required="required" class="form-control">
									<input type="hidden" id="teacher_id" name="teacher_id">
								</div>
							</div>
							
							<div class="item form-group">
								<label class="col-form-label col-md-3 col-sm-3 label-align">Choose Subject</label>
								<div class="col-md-6 col-sm-6 ">
								    <%
										ArrayList<SubjectBean> list = SubjectService.p_listAllSubject();
										for(SubjectBean sb : list){
											out.print("<div class='form-check-inline'>");
												out.print("<label class='form-check-label' style='font-size: 16px;'>");
													out.print("<input style='cursor: pointer;width:18px; height:18px;' type='checkbox' class='form-check-input' name='subject_id' value='" + sb.getSubject_id() + "'>" + sb.getSubject_name() + "");	
												out.print("</label>");
											out.print("</div>");
										}
									%>
								</div>
							</div>
							<div class="item form-group">
								<div class="col-md-6 col-sm-6 offset-md-3">
									<button class="btn btn-primary" type="button">Cancel</button>
									<button class="btn btn-primary" type="reset">Reset</button>
									<button type="submit" class="btn btn-success">Submit</button>
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
        <!-- /footer content -->
      </div>
    </div>
    <!-- Bootstrap -->
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../../js/custom.min.js"></script>
    <script>
		$(document).ready(function(){
			$("#search_teacher").autocomplete({				
				select : function(event, ui){
					console.log(ui.item);
					//alert(ui.item.value);
					var str = ui.item.value;
					var data = str.split(":");
					//alert(data[0]);
					$("#teacher_id").val(data[0]);
				},
				source : function(request, response){
					$.ajax({
						url : "../../TeacherAutocompleteServlet.do", 
						type : "POST", 
						data : {term : request.term},
						dataType : "json", 
						success : function(data){
										response(data);
									}
					});
				}
			});
		});
	</script>
</body>
</html>