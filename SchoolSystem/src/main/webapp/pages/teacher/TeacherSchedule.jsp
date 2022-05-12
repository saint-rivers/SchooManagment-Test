<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.RoomBean"%>
<%@ page import="db.services.RoomService" %>
<%@ page import="bean.ClassStudyBean"%>
<%@ page import="db.services.ClassStudyService" %>
<%@ page import="bean.TeacherBean"%>
<%@ page import="db.services.TeacherService" %>
<%@ page import="bean.ScheduleBean"%>
<%@ page import="db.services.ScheduleService" %>
<%@ page import="bean.DayBean"%>
<%@ page import="db.services.DayService" %>
<%@ page import="bean.TimeBean"%>

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
    <script src="../../js/jquery.min.js"></script>   
    <script src="../../js/custom_js/lock_screen.js"></script>
    <style>
	.bg-light-gray {
	    background-color: #f7f7f7;
	}
	.table-bordered thead td, .table-bordered thead th {
	    border-bottom-width: 2px;
	}
	.table thead th {
	    vertical-align: bottom;
	    border-bottom: 2px solid #dee2e6;
	}
	.table-bordered td, .table-bordered th {
	    border: 1px solid #dee2e6;
	    
	}
	
	.bg-sky.box-shadow {
	    box-shadow: 0px 5px 0px 0px #00a2a7
	}
	
	.bg-orange.box-shadow {
	    box-shadow: 0px 5px 0px 0px #af4305
	}
	
	.bg-green.box-shadow {
	    box-shadow: 0px 5px 0px 0px #4ca520
	}
	
	.bg-yellow.box-shadow {
	    box-shadow: 0px 5px 0px 0px #dcbf02
	}
	
	.bg-pink.box-shadow {
	    box-shadow: 0px 5px 0px 0px #e82d8b
	}
	
	.bg-purple.box-shadow {
	    box-shadow: 0px 5px 0px 0px #8343e8
	}
	
	.bg-lightred.box-shadow {
	    box-shadow: 0px 5px 0px 0px #d84213
	}
	
	.bg-sky {
	    background-color: #02c2c7
	}
	
	.bg-orange {
	    background-color: #e95601
	}
	
	.bg-green {
	    background-color: #5bbd2a
	}
	
	.bg-yellow {
	    background-color: #f0d001
	}
	
	.bg-pink {
	    background-color: #ff48a4
	}
	
	.bg-purple {
	    background-color: #9d60ff
	}
	
	.bg-lightred {
	    background-color: #ff5722
	}
	
	.padding-15px-lr {
	    padding-left: 15px;
	    padding-right: 15px;
	}
	.padding-5px-tb {
	    padding-top: 5px;
	    padding-bottom: 5px;
	}
	.margin-10px-bottom {
	    margin-bottom: 10px;
	}
	.border-radius-5 {
	    border-radius: 5px;
	}
	
	.margin-10px-top {
	    margin-top: 10px;
	}
	.font-size14 {
	    font-size: 14px;
	}
	
	.text-light-gray {
	    color: #d6d5d5;
	}
	.font-size13 {
	    font-size: 13px;
	}
	
	.table-bordered td, .table-bordered th {
	    border: 1px solid #dee2e6;
	}
	.table td, .table th {
	    padding: .75rem;
	    vertical-align: top;
	    border-top: 1px solid #dee2e6;
	}
	
</style>
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
         			<%         
         				String data = request.getParameter("id"); 
	         			
	         			String[] splitdata = data.split(":");
	         			String class_id = splitdata[0];
	         			String teacher_id = splitdata[1];
         				ClassStudyBean csb = ClassStudyService.getAClassStudy(class_id);
                    	ScheduleBean scb = ScheduleService.getClassScheduleByClassID(class_id); 
                    	
                    %>
	                <div class="x_panel">
	                  <div class="x_title text-center">	                  	
	                    <h4 id="Schedule_name" style="font-family:Khmer OS Muol Light;" class="p-1">កាលវិភាគប្រចាំ<%=csb.getRoomb().getRoom() %></h4>
	                    <div class="clearfix"></div>	                    
	                  </div>
	                  <script type="text/javascript">
		                  var today = new Date();
		                  var dd = String(today.getDate()).padStart(2, '0');
		                  var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
		                  var yyyy = today.getFullYear();
	
		                  today = dd + '/' + mm + '/' + yyyy;
		                  document.write("<h5> <i class='fa fa-calendar-o'></i>" +"  " +today+"</h5>");
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
							                                <th>ថ្ងៃ</th>
							                                <th class="text-uppercase">ម៉ោង</th>
							                                <th>មុខវិជ្ជា</th>							                                
							                            </tr>
								                      </thead>
								                      <tbody>	
								                      	<%
								                      		ArrayList<ScheduleBean> bean = ScheduleService.ScheduleByClassID(class_id);								                      	
								                      		for(ScheduleBean sb : bean){								                      			
							                      				if(sb.getTeacher_id().equals(teacher_id)){
								                      				out.print("<tr class='text-center'>");
						                      							out.print("<td>"+ sb.getDayB().getDay_name() +"</td>");
						                      							out.print("<td>"+ sb.getTimeB().getStart_time()+" - "+ sb.getTimeB().getEnd_time() +"</td>");
						                      							out.print("<td>"+ sb.getSubjectB().getSubject_name() +"</td>");
						                      						out.print("</tr>");	
							                      				}
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
    <!-- Custom Theme Scripts -->
    <script src="../../js/custom.min.js"></script>
</body>
</html>