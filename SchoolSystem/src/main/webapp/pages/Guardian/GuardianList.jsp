<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.GuardianBean" %>
<%@ page import="db.services.GuardianService" %>    
<%
	session = request.getSession(false);
	String role_code = "",role_name="",user_id="",user_name="";
	String photo_view = "";
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
	<link rel="icon" href="images/favicon.ico" type="image/ico" />
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
                    <h2>បញ្ជីឈ្មោះអាណាព្យាបាលរបស់សិស្ស</h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <div class="row">
                          <div class="col-sm-12">
                   			<div class="card-box table-responsive">
								<a style="margin-left:15px;" href="../../view/add/AddAGuardian" class="btn btn-info btn-sm"><i class="fa fa-plus"> New Guardian</i></a>
				                <div id="datatable-responsive_wrapper" class="dataTables_wrapper container dt-bootstrap no-footer">
				                   <div class="row">
				                    	<div class="col-sm-12">
				                    		<table id="datatable-responsive" class="table table table-hover table-bordered dt-responsive nowrap dataTable no-footer dtr-inline" cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
							                      <thead>
							                        <tr role="row" class="table-success text-center">
							                        	<th class="sorting" style="width: 68px;">អត្តលេខ</th>
							                        	<th class="sorting" style="width: 68px;">ឈ្មោះឪពុក</th>
							                        	<th class="sorting" style="width: 68px;">មុខរបរ</th>
							                        	<th class="sorting" style="width: 68px;">ឈ្មោះម្ដាយ</th>
							                        	<th class="sorting" style="width: 68px;">មុខរបរ</th>
							                        	<th class="sorting" style="width: 33px;">លេខទូរស័ព្ទ</th>
							                        	<th class="sorting" style="width: 62px;">ទីលំនៅបច្ចុប្បន្ន</th>	    	
							                        	<th class="sorting" style="width: 144px;">ការកំណត់</th>
							                        </tr>
							                      </thead>
							                      <tbody>
							                      	<%
							                      		ArrayList<GuardianBean> List = GuardianService.P_listAllGuardians();
							                      		for(GuardianBean gb : List){
							                      			out.print("<tr role='row' class='odd'>");
							                      				out.print("<td class='' tabindex='0'>" + gb.getGuardian_id() + "</td>");
							                      				out.print("<td>" + gb.getFather_name() + "</td>");
							                      				out.print("<td>" + gb.getFather_job() + "</td>");
							                      				out.print("<td class=''>" + gb.getMother_name() + "</td>");
							                      				out.print("<td>" + gb.getMother_job() + "</td>");
							                      				out.print("<td class=''>" + gb.getGuardian_phone() + "</td>");
							                      				String current_address = gb.getAb().getVillage() +"/"+ gb.getAb().getCommune()+"/"+ gb.getAb().getDistrict()+"/"+ gb.getAb().getProvince();
							                      				out.print("<td class='sorting_1'>" + current_address + "</td>");
							                      				out.print("<td class='text-center'>");
						                      						out.print("<a href='../../view/update/UpdateAGuardian?id=" + gb.getGuardian_id() + "' class='btn btn-primary btn-sm' data-toggle='tooltip' data-placement='top' title='edit'><i class='fa fa-edit'></i></a>");
						                      						out.print("<button type='button' value='" + gb.getGuardian_id() + "' class='btn btn-danger btn-sm btnDelete' data-toggle='modal' data-target='#myModal' data-toggle='tooltip' data-placement='top' title='delete'><i class='fa fa-trash'></i></button>");
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
       	</div>  
     </div>
        <!-- /page content -->
	<div class="container">
  <!-- The Modal -->
	  <div class="modal fade" id="myModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title"><i class="fa fa-warning text-danger"></i> Message</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <!-- Modal body -->
	        <div class="modal-body">
	          <h5><i class="fa fa-info-circle text-danger"></i> Do you want to delete this student?</h5>
	          <h3 id="showStudentName"></h3>
	        </div>
	        <!-- Modal footer -->
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-info" data-dismiss="modal">No</button>
	          	<button type="submit" name="yes" id="btnyes" class="btn btn-danger" data-dismiss="modal" onclick="ConfirmDelete();">Yes</button>
	        </div>
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
    	$("#datatable-responsive").on("click", ".btnDelete", function(e){
    		var currentStudentName = $(this).val();
    		//alert("Student Name = " + currentStudentName);
    		$("#showStudentName").text(currentStudentName);
    	});
    </script>	
    <script>
	$(document).ready(function(){
	  $('[data-toggle="tooltip"]').tooltip();   
	});
	</script>
</body>
</html>