<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.services.StudentService" %>
<%@ page import="bean.StudentBean" %>
    
<%
	session = request.getSession(false);
	String role_code = "",role_name="",user_id="",user_name="",photo_view = "";
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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/favicon.ico" type="image/ico" />

    <title>LMS</title>

    <!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../../css/font-awesome.min.css" rel="stylesheet">
    <link href="../../webcss/all.min.css" rel="stylesheet"> <!--load all styles -->
    <link href="../../css/dataTable/buttons.bootstrap.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="../../css/custom.min.css" rel="stylesheet">
     <!-- jQuery -->   
     <!-- Bootstrap -->
    <link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
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
          <!-- top tiles -->
       
          <!-- /top tiles -->
        	<div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                  <div class="x_title">
                    <h1 class="text-center p-2">សម្រង់ពិន្ទុប្រចាំខែ..........</h1>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <div class="row">
                          <div class="col-sm-12">
                   			<div class="card-box table-responsive">
								<a style="margin-left:15px;" href="../../view/detail/AddAStudent" class="btn btn-success"><i class="fa fa-plus">ភាសាខ្មែរ</i></a>
								<a style="margin-left:15px;" href="#" class="btn btn-primary"><i class="fa fa-plus">គណិតវិទ្យា</i></a>
								<a style="margin-left:15px;" href="#" class="btn btn-warning"><i class="fa fa-plus">វិទ្យាសាស្ត្រ</i></a>
								<a style="margin-left:15px;" href="#" class="btn btn-secondary"><i class="fa fa-plus">សិក្សាសង្គម</i></a>
				                <div id="datatable-responsive_wrapper" class="dataTables_wrapper container dt-bootstrap no-footer">
					              
				                   <div class="row">
				                    	<div class="col-sm-12">
				                    		<table id="datatable-responsive" class="table table table-hover table-bordered dt-responsive nowrap dataTable no-footer dtr-inline" cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
							                      <thead>
							                        <tr role="row" class="table-success text-center">
							                        	<th class="sorting" style="width: 68px;">អត្តលេខ</th>
							                        	<th class="sorting" style="width: 68px;">ឈ្មោះ</th>
							                        	<th class="sorting" style="width: 153px;">ភេទ</th>
							                        	<th class="sorting" style="width: 144px;">ភាសាខ្មែរ</th>
							                        	<th class="sorting" style="width: 26px;">គណិតវិទ្យា</th>
							                        	<th class="sorting" style="width: 68px;">វិទ្យាសាស្ត្រ</th>							                        	
							                        	<th class="sorting" style="width: 62px;">សិក្សាសង្គម</th>
							                        	<th class="sorting" style="width: 144px;">ពិន្ទុសរុប</th>
							                        	<th class="sorting" style="width: 33px;">មធ្យមភាគ</th>	
							                        	<th class="sorting_asc" style="width: 50px;">ចំណាត់ថ្នាក់</th>							                        	               	
							                        	<th class="sorting" style="width: 144px;">និទ្ទេស</th>
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
    <script src="../../js/dataTable/buttons.bootstrap.min.js"></script>
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