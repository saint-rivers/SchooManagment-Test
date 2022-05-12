<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.services.SubSubjectService" %>
<%@ page import="bean.Sub_SubjectBean" %>

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
    <!-- style delete for confirm delete -->
     <!-- jQuery -->   
    <link href="../../css/dataTable/dataTables.bootstrap.min.css" rel="stylesheet">
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
                    <h2 class="p-1">បញ្ជីមុខវិជ្ជាសិក្សា</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a> </li>
                      
                      <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <button onclick="window.print()">Print this page</button>
                  <div class="x_content">
                      <div class="row">
                          <div class="col-sm-12">
                   			<div class="card-box table-responsive">
								<a style="margin-left:15px;" href="../../view/detail/AddNewSubject" class="btn btn-info btn-sm"><i class="fa fa-plus"> New Subject</i></a>
				                <div id="datatable-responsive_wrapper" class="dataTables_wrapper container dt-bootstrap no-footer">
					              
				                   <div class="row">
				                    	<div class="col-sm-12">
				                    		<table id="datatable-responsive" class="table table table-hover table-bordered border-warning dt-responsive nowrap dataTable no-footer dtr-inline" cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
							                      <thead>
							                        <tr role="row" class="table-warning text-center" >
							                        	<th class="sorting" style="width: 68px;">លេខកូដមុខវិជ្ជា</th>
							                        	<th class="sorting" style="width: 68px;">ឈ្មោះមុខវិជ្ជា</th>							                        	
							                        	<th class="sorting" style="width: 153px;">ការកំណត់</th>
							                        </tr>
							                      </thead>
							                      <tbody>
							                      	<%
							                      		ArrayList<Sub_SubjectBean> ListSB = SubSubjectService.listSubSubject();
							                      		for(Sub_SubjectBean sb : ListSB){
							                      			out.print("<tr class='text-center'>");
							                      				out.print("<td> 00" + sb.getSubject_id() + "</td>");
							                      				out.print("<td>" + sb.getSubject_name() + "</td>");							                      				
							                      				out.print("<td class='text-center'>");
							                      				 out.print("<a href='../../view/edit/udateSubject?id=" + sb.getSubject_id() + "' class='btn btn-warning btn-sm' data-toggle='tooltip' data-placement='top' title='edit'><i class='fa fa-edit'></i></a>");
							                      				 out.print("<button type='submit' class='btn btn-danger btn-sm delete' value='" + sb.getSubject_id() + "' data-toggle='tooltip' data-placement='top' title='delete'><i class='fa fa-trash'></i></button>");
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
        <!-- footer content -->
		<jsp:include page="/view/detail/FooterPage"></jsp:include>
        <!-- /footer content -->
      </div>
    </div>
	<script>
		$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();   
		});
	</script>
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
    <!--  confirm delete -->
   	<script src='../../js/custom_js/bootbox.min.js'></script>
    
	<script>
   		$(document).ready(function(){
    	  	// Delete 
	    	  $('.delete').click(function(){
	    	    var el = this;
	    	    // Delete id
	    	    var deleteid = $(this).val();
	    	 	//alert(deleteid);
	    	    // Confirm box
	    	    bootbox.confirm("Do you really want to delete record?", function(result) {	    	 
	    	       if(result){
	    	         // AJAX Request
	    	         $.ajax({
	    	           url: '../../DeleteSubjectServlet.do',
	    	           type: 'POST',
	    	           data: { id:deleteid },
	    	           success: function(response){	
	    	             // Removing row from HTML Table
	    	             if(response == "Success"){
				    			$(el).closest('tr').css('background','tomato');
				    	            $(el).closest('tr').fadeOut(800,function(){
				    			  	$(this).remove();
				    			});
			    		     }else{
			    				bootbox.alert('Record not deleted.');
			    		     }
	    	           }
	    	         });
	    	       }
	    	 
	    	    });
	    	 
	    	  });
    	});
    </script>
</body>
</html>