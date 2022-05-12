<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.services.StudentService" %>
<%@ page import="bean.StudentBean" %>   
<%@ page import="db.services.UserService" %>
<%@ page import="bean.UserBean" %>
<%@ page import="db.services.GuardianService" %>
<%@ page import="bean.GuardianBean" %>  
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
    <link href="../../webcss/fontawesome.min.css" rel="stylesheet"> 
    <!-- Custom Theme Style -->
    <link href="../../css/custom.min.css" rel="stylesheet">
   
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
	        <div class="col-md-12 col-sm-12 bg-info ">
	        	<div class="x_panel">
	            	<div class="x_title">
	                	<h2><i class="fas fa-user-graduate fa-xl"></i>  Student Profile</h2>
	                    <ul class="nav navbar-right panel_toolbox">
	                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>	                     
	                      <li><a class="close-link"><i class="fa fa-close"></i></a></li>
	                    </ul>
	                    <div class="clearfix"></div>
	                    <%
	                    	StudentBean sb = StudentService.getAStudentByUserID(user_id);
	                    	GuardianBean gb = GuardianService.p_getAGuardianByGuardianID(sb.getGuardian_id());
	                    	UserBean ub = UserService.p_getAUserByUserID(user_id);
	                    %>	                    
	                 </div>
	                 <div class="col-md-4">
	                     <div class="card border-success">
	                         <div class="card-header ">
	                             <i class="fa fa-user"></i>
	                             <strong class="card-title pl-2">Profile Card</strong>	                             
	                         </div>
	                         <div class="card-body">
	                             <div class="mx-auto d-block">
	                                 <img class="rounded-circle mx-auto d-block" src="../../images/users/<%=ub.getPhoto_name() %>" width="100px" height="100px" class="rounded-circle" alt="Card image cap">
	                                 <h5 class="text-sm-center mt-2 mb-1"><%=ub.getUser_name() %></h5>
	                                 <div class="location text-sm-center">
	                                     <i class="fa fa-map-marker"></i> <%=sb.getAbCurrent().getDistrict()+", "+sb.getAbCurrent().getProvince() %>
	                                 </div>
	                             </div>
	                             <hr>
	                             <div class="card-text text-sm-center text-white">
	                                 <a href="#"><i class="fa fa-facebook pr-1"></i></a>
	                                 <a href="#"><i class="fa fa-twitter pr-1"></i></a>
	                                 <a href="#"><i class="fa fa-linkedin pr-1"></i></a>
	                                 <a href="#"><i class="fa fa-pinterest pr-1"></i></a>
	                             </div>
	                         </div>
	                     </div>
	                 </div>
                    <div class="col-md-8 col-sm-8">
	                    <div class="x_content">
		                	<ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
		                    	<li class="nav-item">
		                        	<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"><i class="fas fa-user-graduate fa-lg"></i> Personal Info</a>
		                      	</li>
		                      	<li class="nav-item">
		                        	<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" ><i class="fa fa-pencil-square-o"></i> Edit Profile</a>
		                      	</li>
		                    </ul>
		                    <div class="tab-content" id="myTabContent">
			                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
			                      	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="review-content-section">
                                                <div class="row">
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                                        <div class="address-hr biography">                                                        	
                                                            <h6><i class="fas fa-child fa-lg text-warning p-1"></i><b> ឈ្មោះ ៖</b><br> <%=sb.getFirst_name() +" "+sb.getLast_name() %> </h6>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                                        <div class="address-hr biography">
                                                            <h6><i class="fa fa-phone-square fa-lg text-warning p-1"></i><b> លេខទូរស័ព្ទ ៖</b><br> <%=sb.getPhone() %></h6>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                                        <div class="address-hr biography">
                                                        	<%
                                                        		String gender = sb.getGender();	
                                                        		if(gender.equalsIgnoreCase("ស្រី")){
                                                        			out.print("<h6><i class='fa fa-female fa-lg text-warning p-1'></i> <b>ភេទ ៖</b><br> "+ sb.getGender() +"</h6>");
                                                        		}else{
                                                        			out.print("<h6><i class='fa fa-male fa-lg text-warning p-1'></i> <b>ភេទ ៖</b><br> " +sb.getGender() +"</h6>");
                                                        		}
                                                        	%>                                                            
                                                        </div>
                                                    </div>                                                    
                                                </div>
                                                
                                                <div class="row">
                                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                                        <div class="address-hr biography">                                                        	
                                                             <h6><i class="fa fa-flag fa-lg text-warning p-1"></i><b> សញ្ជាតិ ៖</b><br> <%=sb.getNationality() %></h6>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                                        <div class="address-hr biography">
                                                            <h6><i class="fa fa-calendar fa-lg text-warning p-1"></i><b> ថ្ងៃខែឆ្នាំកំណើត ៖</b><br> <%=sb.getDob() %></h6>
                                                        </div>
                                                    </div>                                                                                                         
                                                </div>
                                                
                                                <div class="row">                                                    
                                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                                        <div class="address-hr biography">
                                                            <h6><i class="fa fa-map-marker fa-lg text-warning p-1"></i><b> ទីកន្លែងកំណើត ៖</b><br> <%=sb.getAb().getVillage()+", "+sb.getAb().getCommune()+", "+sb.getAb().getDistrict()+", "+sb.getAb().getProvince() %></h6>
                                                        </div>
                                                    </div> 
                                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                                        <div class="address-hr biography">
                                                            <h6><i class="fa fa-map-marker fa-lg text-warning p-1"></i><b> ទីលំនៅបច្ចុប្បន្ន ៖</b><br> <%=sb.getAbCurrent().getVillage()+", "+sb.getAbCurrent().getCommune()+", "+sb.getAbCurrent().getDistrict()+", "+sb.getAbCurrent().getProvince() %></h6>
                                                        </div>
                                                    </div>                                                   
                                                </div>
                                                
                                                <div class="row">                                                    
                                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                                        <div class="address-hr biography">
                                                            <h6><i class="fa fa-male fa-lg text-warning p-1"></i><b> ឪពុកឈ្មោះ ៖</b><br> <%=gb.getFather_name() %></h6>
                                                        </div>
                                                    </div> 
                                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                                        <div class="address-hr biography">
                                                            <h6><i class="fa fa-briefcase fa-lg text-warning p-1"></i><b> មុខរបរ ៖</b><br> <%=gb.getFather_job() %></h6>
                                                        </div>
                                                    </div>                                                   
                                                </div>
                                                <div class="row">                                                    
                                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                                        <div class="address-hr biography">
                                                            <h6><i class="fa fa-female fa-lg text-warning p-1"></i><b> ម្ដាយឈ្មោះ ៖</b><br> <%=gb.getMother_name() %></h6>
                                                        </div>
                                                    </div> 
                                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                                        <div class="address-hr biography">
                                                            <h6><i class="fa fa-briefcase fa-lg text-warning p-1"></i><b> មុខរបរ ៖</b><br> <%=gb.getMother_job() %></h6>
                                                        </div>
                                                    </div>                                                   
                                                </div>
                                                <div class="row">                                                    
                                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
                                                        <div class="address-hr biography">
                                                            <h6><i class="fa fa-tty fa-lg text-warning p-1"></i><b> លេខទូរស័ព្ទ ៖</b><br> <%=gb.getGuardian_phone() %></h6>
                                                        </div>
                                                    </div> 
                                                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-6">
                                                        <div class="address-hr biography">
                                                            <h6><i class="fa fa-map-marker fa-lg text-warning p-1"></i><b> ទីលំនៅបច្ចុប្បន្ន ៖</b><br> <%=gb.getAb().getVillage()+", "+gb.getAb().getCommune()+", "+gb.getAb().getDistrict()+", "+gb.getAb().getProvince() %></h6>
                                                        </div>
                                                    </div>                                                   
                                                </div>
                                               
                                                <div class="row mg-b-15">
                                                    <div class="col-lg-12">
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <div class="skill-title">
                                                                    <h2 style="font-family:Khmer OS Muol Light;">មុខវិជ្ជាសិក្សា</h2>
                                                                    <hr>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="progress-skill">
                                                            <h2>ភាសាខ្មែរ</h2>
                                                            <div class="progress progress-mini">
                                                                <div style="width: 90%;" class="progress-bar progress-yellow"></div>
                                                            </div>
                                                        </div>
                                                        <div class="progress-skill">
                                                            <h2>គណិតវិទ្យា</h2>
                                                            <div class="progress progress-mini">
                                                                <div style="width: 80%;" class="progress-bar progress-green"></div>
                                                            </div>
                                                        </div>
                                                        <div class="progress-skill">
                                                            <h2>វិទ្យាសាស្ត្រ</h2>
                                                            <div class="progress progress-mini">
                                                                <div style="width: 70%;" class="progress-bar progress-blue"></div>
                                                            </div>
                                                        </div>
                                                        <div class="progress-skill">
                                                            <h2>សិក្សាសង្គម</h2>
                                                            <div class="progress progress-mini">
                                                                <div style="width: 60%;" class="progress-bar progress-red"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>                                              
                                               
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="row">
                                                            <div class="col-lg-12">
                                                                <div class="skill-title">
                                                                    <h2>Subjects</h2>
                                                                    <hr>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="ex-pro">
                                                            <ul>
                                                                <li><i class="fa fa-angle-right"></i> Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                                                                <li><i class="fa fa-angle-right"></i> Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                                                                <li><i class="fa fa-angle-right"></i> Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                                                                <li><i class="fa fa-angle-right"></i> Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                                                                <li><i class="fa fa-angle-right"></i> Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>					        		
			                    </div>
			                      
			                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
			                        <div class="card card-primary card-outline">
						              <div class="card-body box-profile">
						                <div class="text-center">
						                  <img class="profile-user-img img-fluid img-circle" src="../../images/users/<%=ub.getPhoto_name() %>" width="110px" height="110px" class="rounded-circle" alt="User profile picture">
						                </div>						
						                <h3 class="profile-username text-center"><%=ub.getUser_name() %></h3>
						                
						                <ul class="list-group list-group-unbordered mb-3">
						                  <li class="list-group-item">
						                    <input type="text" name="user_name" class="form-control" value="<%=ub.getUser_name() %>">
						                  </li>
						                  <li class="list-group-item">
						                    <input type="text" name="new_password" class="form-control" placeholder="New Password">
						                  </li>
						                  <li class="list-group-item">
						                    <input type="text" name="re_password" class="form-control" placeholder="Confirm Password">
						                  </li>
						                  <li class="list-group-item">
						                    <input type="file" name="new_photo" class="form-control">
						                  </li>
						                </ul>
						
						                <a type="submit" class="btn btn-primary btn-block text-light"><b>Update</b></a>
						              </div>
						              <!-- /.card-body -->
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