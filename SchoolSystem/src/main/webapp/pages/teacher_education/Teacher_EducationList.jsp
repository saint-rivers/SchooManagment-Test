

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.services.EducationService" %>
<%@ page import="bean.EducationBean" %> 
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
    <link href="../../css/bootstrap.min.css" rel="stylesheet"><!-- Bootstrap -->
    <link href="../../css/font-awesome.min.css" rel="stylesheet"><!-- Font Awesome -->
    <link href="../../webcss/all.min.css" rel="stylesheet"> <!--load all styles -->
    <link href="../../css/custom.min.css" rel="stylesheet"> <!-- Custom Theme Style -->
    <link href="../../css/swal2/sweetalert2.min.css" rel="stylesheet">
    <link href="../../css/dataTable/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/sweetalert2.min.css" rel="stylesheet">
    <link href="../../css/dataTable/scroller.bootstrap.min.css" rel="stylesheet"> 
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
     <div class="right_col" role="main">
        	<div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>List Teacher Education Information</h2>
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
								<a style="margin-left:15px;" href="../../view/teacher_education/AddEducationTeacher" class="btn btn-info btn-sm"><i class="fa fa-plus"> Add Teacher Education</i></a>
								
				                <div id="datatable-responsive_wrapper" class="dataTables_wrapper container dt-bootstrap no-footer">
					              
				                   <div class="row">
				                    	<div class="col-sm-12">
				                    	        
				                    	         
				                    		 <form class="form-horizontal  form-label-left" action="${pageContext.request.contextPath}/DeleteTeacherEductionById " Method="POST">
				                    		<table id="datatable-responsive" class="table table table-hover table-bordered dt-responsive nowrap dataTable no-footer dtr-inline" cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
							                      <thead>
							                      
							                        <tr role="row" class="table-success text-center">
							                        	<th class="sorting" style="width: 68px;">Education ID</th>
							                        	<th class="sorting" style="width: 68px;">Teacher ID</th>
							                        	<th class="sorting" style="width: 68px;">PrimarySchool</th>
							                        	<th class="sorting" style="width: 153px;">HeigthSchool</th>
							                        	<th class="sorting" style="width: 33px;">UniverSitySchool </th>							                     
							                        	<th class="sorting" style="width: 26px;">Skill</th>
							                        	<th class="sorting" style="width: 153px;">Level</th>
							                        	<th class="sorting" style="width: 26px;">Teacher Type</th>
							                        	<th class="sorting" style="width: 33px;">Option </th>		
							                        </tr>
							                      </thead>
							                      <tbody>
							                      	<%
							                      		ArrayList<EducationBean> list = EducationService.DisplayEducation();
						                      		for(EducationBean ed : list){
						                      			out.print("<tr role='row' class='odd'>");
						                      				out.print("<td id='education_id' tabindex='0'>" + ed.getEducation_id() + "</td>");
						                      				out.print("<td class='' tabindex='0'>" + ed.getTeacherbean().getT_fname()+" " + ed.getTeacherbean().getT_lname()+"</td>");
						                      				out.print("<td>"+ ed.getPrimary_name() + "(" + ed.getStart_date_primary()+"-"+ed.getEnd_date_primary() + ")</td>");
						                      				out.print("<td>"+ ed.getHeigth_name() + "(" + ed.getStart_date_heigth()+"-"+ed.getEnd_date_heigth() + ")</td>");
						                      				out.print("<td>"+ ed.getUniverSety_name() + "(" + ed.getStart_date_univerSety()+"-"+ed.getEnd_date_univerSety() + ")</td>");
						                    				
						                      				out.print("<td class=''>" + ed.getSkill()+ "</td>");
						                      				out.print("<td class='sorting_1'>"+ ed.getLevel() +"</td>");
						                      				out.print("<td class=''>" + ed.getTeacher_type() + "</td>");
						                      				
						                      				out.print("<td class='text-center'>");
					                      					out.print("<a href='../../view/teacher_education/UpdateEducationTeacher?id=" + ed.getEducation_id()+  "' class='btn btn-primary btn-sm'><i class='fa fa-edit'></i>Edit</a>");
					                      					
					                      					out.print("<button type='button' id='btnDelete' class='btn btn-danger' value='"+ed.getEducation_id()+"' >Delete</button>");
					                      				
						                      			out.print("</td>");
						                      			out.print("</tr>");
						                      		}
						                      	%>
							                      
							                	</tbody>
				                    		</table>
				                    		</form>
				                    		
				                    		<script type="text/javascript">
				                    		      function delet(){
				                    		    	  alert("Do you want to delete this?");
				                    		      }
				                    					
				                    		
				                    		</script>
				                    		
				                    		
				                    		
				                    		
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

		<jsp:include page="/view/detail/FooterPage"></jsp:include>
      </div>
      </div>
    <script src="../../js/jquery.min.js"></script>   
    
    <script src="../../js/custom_js/DeleteButtonWithAlertBox.js"></script>
	<script src="../../js/custom_js/YearConfiger.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <script src="../../js/custom.min.js"></script>
    <script src="../../js/custom_js/lock_screen.js"></script>   
    <script src="../../js/dataTable/jquery.dataTables.min.js"></script>
    <script src="../../js/dataTable/dataTables.bootstrap.min.js"></script>
    <script src="../../js/dataTable/dataTables.responsive.min.js"></script>
    <script src="../../js/dataTable/responsive.bootstrap.js"></script>
    <script src="../../js/dataTable/buttons.bootstrap.min.js"></script>
    <script src="../../js/dataTable/dataTables.scroller.min.js"></script>
    <script src="../../css/swal2/sweetalert2.min.js"></script>
    <script src="../../js/custom_js/ButtonDeleteTeacherEducation.js"></script>
</body>
</html>