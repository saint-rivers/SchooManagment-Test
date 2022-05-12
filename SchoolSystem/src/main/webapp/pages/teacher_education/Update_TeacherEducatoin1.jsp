<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.ProvinceBean" %>
<%@ page import="bean.CommuneBean" %>
<%@ page import="bean.CountryBean" %>
<%@ page import="bean.DistrictBean" %>
<%@ page import="bean.VillageBean" %>
<%@ page import="bean.TeacherBean" %>
<%@ page import="db.services.ProvinceService" %>
<%@ page import="db.services.TeacherService" %>
<%@ page import="db.services.TeacherService" %>
<%@ page import="db.services.EducationService" %>
<%@ page import="db.services.TeacherService" %>
<%@ page import="bean.EducationBean" %>
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

	
    	<Style>
    	   
			.form-control{
				color :Blue;
				font-size: 17px;
	            font-weight: bold;
	            border-radius: 5px;
			}
			input[type="text"],,select{
			    border-color: blue;
				border-radius: 5px;
				background : pink;
				color :red;
				font-size: 14px;
	            font-weight: bold;	            
			}    	
    	</Style>
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
          <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2 id="title_student">Teacher Education Background</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                      
                      <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                    </ul>
                    <div class="clearfix"></div>
                    
                     <%
						if( session.getAttribute("code") != null ) 
						{
							String msg = session.getAttribute("code").toString();
							if( msg.equalsIgnoreCase("error") )
							 {
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
						
						
					%>
                    
                  </div>
                   <center>
                  <div class="x_content">
                  <br>
                  
                  
                  
                   <form class="form-horizontal  form-label-left" action="${pageContext.request.contextPath}/UpdateEducationTeacher " Method="POST">
                    
                    	<% 
                    	    
                    	String education_id = request.getParameter("id");
             			EducationBean eb =EducationService.getDataTeacherEducation(education_id);
             	
             			
                    	%>           
	                    <div class="col-md-6 col-sm-12" id="bordy_top" >
	                      <div class="form-group row" >
	                     
	                        <label class="control-label col-md-5 col-sm-4 col-xs-4">Education Id</label>
							<div class="col-md-7 col-sm-4 col-xs-4">
							        <small class="text-danger" id="education_id_error"></small>
									<input type="text"  class="form-control" name="education_id"  value="<%= education_id %>" disabled>
							        <input type="hidden" id="education_id"  name="education_id"  value="<%=education_id %>"  class="form-control" autocomplete="off" >
	                        </div>
	                      </div>
	                      
	                      
	                    <div class="form-group row" >
	                     
	                        <label class="control-label col-md-5 col-sm-4 col-xs-4">Teacher Id</label>
							<div class="col-md-7 col-sm-4 col-xs-4">
							        <small class="text-danger" id="education_id_error"></small>
									<input type="text"  class="form-control" name="teacher_id" value="<%=eb.getTeacherbean().getT_id() %>" disabled>
							        <input type="hidden" id="teacher_id"  name="teacher_id" value="<%=eb.getTeacherbean().getT_id()  %>" class="form-control">
	                        </div>
	                      </div>  
	                       <div class="form-group row">
		                        <label class="ontrol-label col-md-5 col-sm-4 col-xs-4">PramarySchool Name :</label>
		                        <div class="col-md-7 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="primary_error"></small>
		                          <input type="text" class="form-control" id="primary_school_name" name="primary_school_name"  value="<%=eb.getPrimary_name() %>">
		                        </div>
		                  </div>
	                      
	                        <div class="form-group row">
		                        <label class="ontrol-label col-md-5 col-sm-4 col-xs-4">Start PramarySchool Date :</label>
		                        <div class="col-md-7 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="start_primaryschool_date_error"></small>
		                           <select class="form-control" id="start_primaryschool_date" name="start_primaryschool_date" >
		                           		<%
	                            		    ArrayList<EducationBean> startDate_primarySchool= EducationService.DisplayEducation();
										     for( EducationBean edBean : startDate_primarySchool)
											if(edBean.getStart_date_primary().equals(eb.getStart_date_primary())){
												out.print("<option value=" + edBean.getStart_date_primary() + " selected >" + edBean.getStart_date_primary() + "</option>");
											} 
		                      		     %>
		                           </select>
		                        </div>
		                   </div>
		                    <div class="form-group row">
		                        <label class="ontrol-label col-md-5 col-sm-4 col-xs-4">End PramarySchool Date :</label>
		                        <div class="col-md-7 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="end_primaryschool_date_error"></small>
		                          <select class="form-control" id="end_primaryschool_date" name="end_primaryschool_date" >
		                          		<%
	                            		    ArrayList<EducationBean> endDate_primarySchool= EducationService.DisplayEducation();
										     for( EducationBean edBean : endDate_primarySchool)
											if(edBean.getEnd_date_primary().equals(eb.getEnd_date_primary())){
												out.print("<option value=" + edBean.getEnd_date_primary() + " selected >" + edBean.getEnd_date_primary() + "</option>");
											}   
		                      		     %>
		                          </select>
		                        </div>
		                    </div>
                            <div class="form-group row">
		                        <label class="ontrol-label col-md-5 col-sm-4 col-xs-4">HeightSchool Name  :</label>
		                        <div class="col-md-7 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="heightschool_name_error"></small>
		                          <input type="text" class="form-control" id="heightschool_name" name="heightschool_name"  value="<%=eb.getHeigth_name() %>" >
		                        </div>
		                      </div>
		                       <div class="form-group row">
		                        <label class="ontrol-label col-md-5 col-sm-4 col-xs-4">Start HeightSchool Date :</label>
		                        <div class="col-md-7 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="start_heightschool_date_error"></small>
		                           <select class="form-control" id="start_heightschool_date" name="start_heightschool_date" >
		                                   <%
	                            		    ArrayList<EducationBean> startDate_heightSchool= EducationService.DisplayEducation();
										     for( EducationBean edBean : startDate_heightSchool)
											if(edBean.getStart_date_heigth().equals(eb.getStart_date_heigth())){
												out.print("<option value=" + edBean.getStart_date_heigth() + " selected >" + edBean.getStart_date_heigth() + "</option>");
											}   
		                      		     %>
		                           </select>
		                        </div>
		                      </div>
		                      
		                       <div class="form-group row">
		                        <label class="ontrol-label col-md-5 col-sm-4 col-xs-4">End HeightSchool Date :</label>
		                        <div class="col-md-7 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="end_heightschool_date_error"></small>
		                         <select class="form-control" id="end_heightschool_date" name="end_heightschool_date" >
		                         	<%
	                            		ArrayList<EducationBean> endDate_heightSchool= EducationService.DisplayEducation();
										  for( EducationBean edBean : endDate_heightSchool)
											if(edBean.getEnd_date_heigth().equals(eb.getEnd_date_heigth())){
												out.print("<option value=" + edBean.getEnd_date_heigth() +  " selected >" + edBean.getEnd_date_heigth() + "</option>");
											}  
		                      		     %>
		                         </select>
		                        </div>
		                      </div>
		                       </div>
		                      <div class="col-md-6 col-sm-12" id="bordy_top" >
		                        <div class="form-group row">
		                        <label class="ontrol-label col-md-5 col-sm-4 col-xs-4">UniverSity Name  :</label>
		                        <div class="col-md-7 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="universety_name_error"></small>
		                          <input type="text" class="form-control" id="universety_name" name="university_name"  value="<%=eb.getUniverSety_name() %>" >
		                        </div>
		                      </div>
		                       <div class="form-group row">
		                        <label class="ontrol-label col-md-5 col-sm-4 col-xs-4">Start UniverSity Date :</label>
		                        <div class="col-md-7 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="start_universety_error"></small>
		                         	<select class="form-control" id="start_university_date" name="start_university_date" >
		                         		<%
	                            		ArrayList<EducationBean> startDate_university = EducationService.DisplayEducation();
										  for( EducationBean edBean : startDate_university)
											if(edBean.getStart_date_univerSety().equals(eb.getStart_date_univerSety())){
												out.print("<option value=" + edBean.getStart_date_univerSety() + " selected >" + edBean.getStart_date_univerSety() + "</option>");
											}  
		                      		     %>
		                         	</select>
		                        </div>
		                      </div>
		                      
		                       <div class="form-group row">
		                        <label class="ontrol-label col-md-5 col-sm-4 col-xs-4">End UniverSity Date :</label>
		                        <div class="col-md-7 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="end_university_error"></small>
		                          <select class="form-control" id="end_university_date" name="end_university_date" >
		                          		
		                          		<%
	                            		ArrayList<EducationBean> endDate_university = EducationService.DisplayEducation();
										  for( EducationBean edBean : endDate_university)
											if(edBean.getEnd_date_univerSety().equals(eb.getEnd_date_univerSety())){
												out.print("<option value=" + edBean.getEnd_date_univerSety() + " selected >" + edBean.getEnd_date_univerSety() + "</option>");
											}   
		                      		     %>
		                          </select>
		                        </div>
		                      </div>
		                      
		                       <div class="form-group row">
		                        <label class="ontrol-label col-md-5 col-sm-4 col-xs-4">Skill  :</label>
		                        <div class="col-md-7 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="skill_error"></small>
		                          <input type="text" class="form-control" id="skill" name="skill" value="<%=eb.getSkill() %>" >
		                        </div>
		                      </div>
		                       <div class="form-group row">
		                        <label class="ontrol-label col-md-5 col-sm-4 col-xs-4">Level :</label>
		                        <div class="col-md-7 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="level_error"></small>
		                          <input type="text" class="form-control" id="level" name="level" value="<%=eb.getLevel() %>" >
		                        </div>
		                      </div>
		                      
		                        <div class="form-group row" id="bordy_gender">
	                        ​​​​​​​​​​​​​​		 <label class="control-label col-md-5 col-sm-4 col-xs-4">Teacher Type:</label>
	                          	<div class="col-md-7 col-sm-9 col-xs-9">
	                            	 <small class="text-danger" id="gender_error"></small>
	                              	<select class="form-control" name="teacher_type" id="teacher_type">
	                              	
                                	 	      <%
                                	 	      
                                	 	     ArrayList<EducationBean> Teachertype= EducationService.DisplayEducation();
    										  for( EducationBean edBean : Teachertype)
    											if(edBean.getTeacher_type().equals(eb.getTeacher_type())){
    												out.print("<option value=" + edBean.getTeacher_type() + " selected >" + edBean.getTeacher_type() + "</option>");
    												out.print("<option value='គ្រូកិច្ចសន្យា' >" + "គ្រូកិច្ចសន្យា" + "</option>");
    												out.print("<option value='គ្រូក្របខ័ណ្ឌ' >" +" គ្រូក្របខ័ណ្ឌ"+ "</option>");
    												
    											}   
                                	 	      %>  
                                	 	      		                 
                            		</select>
	                         </div>
	                      </div>
		                      
		                      
		                       
                             
                               <div class="form-group row" >
		                        <div class="col-md-8 col-sm-9 col-xs-9 offset-md-3">
		                          <button type="submit"  class="btn btn-primary btn_cancel" >Cancel </button>
		                          <a type="submit"  class="btn btn-success btn_back" href="../../view/teacher_education/ListEducationTeacher" >Back</a>
		                          <button type="submit" class="btn btn-danger" id="btn_save" >Update</button>
		                        </div>
		                      </div>
		                    </div>
                                
	                     
	                      
		                 
                    </form>
                  </div>
                     </center>
                </div>
              </div>
        </div>
        </div>
		<jsp:include page="/view/detail/FooterPage"></jsp:include>
      </div>


    <script src="../../js/custom_js/ValidationTeacherEducation.js"></script>
	<script src="../../js/custom_js/YearConfiger.js"></script>
	<script src="../../js/custom_js/Input_Show_Image.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <script src="../../js/custom.min.js"></script>

</body>
</html>