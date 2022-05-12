<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.services.EducationService" %>
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/favicon.ico" type="image/ico" />

    <title>LMS</title>

    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/font-awesome.min.css" rel="stylesheet">
    <link href="../../webcss/all.min.css" rel="stylesheet"> 
    <link href="../../css/custom.min.css" rel="stylesheet">
     <link href="../../css/customStyle/MaltyFormData.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script>   	
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
                    <h2 id="title_student">		Teacher Information</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                      
                      <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                    </ul>
                    <div class="clearfix"></div>						
                  </div>
                
                 <form class="form-horizontal  registration-form form-label-left" action="${pageContext.request.contextPath}/AddNewTeacherEducationServlet" Method="POST">
                      <% 
                    	    
                    	    String education_id = EducationService.getNewEducationIdAuto();
                    	    String teacher_id = EducationService.getTeacherIdMax();
                    	
                    	%>        
             <fieldset id ="step_one">
             
                   <div class="form-top">
                       <div class="form-top-left">
                          <h3><span><i class="fa fa-calendar-check-o" aria-hidden="true"></i></span>	Education PrimaryScool </h3>
                               
                        </div>
                    </div>
                    
              <div class="form-bottom">
              <div class="row">
                                
                  <div class="col-md-9 col-sm-12" id="bordy_top" >
	                 <div class="form-group row" >
	                      <label class="control-label col-md-4 col-sm-3 col-xs-3">Education Id</label>
						   <div class="col-md-8 col-sm-9 col-xs-9">
							  <small class="text-danger" id="education_id_error"></small>
							      <input type="text"  class="form-control" name="education_id"  value="<%= education_id %>" disabled>
							      <input type="hidden" id="education_id"  name="education_id"  value="<%=education_id %>"  class="form-control" autocomplete="off" >
	                        </div>
	                  </div>
	              
	                      
	                      <div class="form-group row" id="bordy_first_name">
	                           <label class="control-label col-md-4 col-sm-3 col-xs-3">Teacher Id</label>
							   <div class="col-md-8 col-sm-9 col-xs-9">
							        <small class="text-danger" id="education_id_error"></small>
							        <input type="text"  class="form-control" name="teacher_id"  value="<%=teacher_id %>" disabled>
							        <input type="hidden" id="teacher_id"  name="teacher_id"  value="<%=teacher_id %>"  class="form-control">
	                           </div>
	                      </div>
	                      
	                     <div class="form-group row" id="bordy_last_name" >
	                         <label class="ontrol-label col-md-4 col-sm-3 col-xs-3">PramarySchool Name :</label>
		                     <div class="col-md-8 col-sm-9 col-xs-9">
		                       <small class="text-danger" id="primary_error"></small>
		                       <input type="text" class="form-control" id="primary_school_name" name="primary_school_name" placeholder ="Input Primary School Name" autocomplete="off">
		                    </div>
	                     </div>
	                      <div class="form-group row">
		                        <label class="ontrol-label col-md-4 col-sm-3 col-xs-3">Start PramarySchool Date :</label>
		                        <div class="col-md-8 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="start_primaryschool_date_error"></small>
		                           <select class="form-control" id="start_primaryschool_date" name="start_primaryschool_date" >
		                           		<option value="0" selected disabled >Please Select Year</option>
		                           </select>
		                        </div>
		                   </div>
		                    <div class="form-group row">
		                        <label class="ontrol-label col-md-4 col-sm-3 col-xs-3">End PramarySchool Date :</label>
		                        <div class="col-md-8 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="end_primaryschool_date_error"></small>
		                          <select class="form-control" id="end_primaryschool_date" name="end_primaryschool_date" >
		                          		<option value="0" selected disabled >Please Select Year</option>
		                          </select>
		                        </div>
		                    </div>
		                    </div>
		                 
                            </div>
                            <center>
                   		       <button type="button" class="btn btn-next btn-primary" id="next-1">Next</button>
                   		     </center> 
                            </div>
               </fieldset>
                    
               <fieldset id ="step_two" >
                        <div class="form-top">
                             <div class="form-top-left">
                                <h3><span><i class="fa fa-calendar-check-o" aria-hidden="true"></i></span>	Education Height School</h3>
                             </div>
                        </div>
                   <div class="form-bottom">
                    <div class="row">
                   <div class="col-md-9 col-sm-12" id="bordy_top" >
     						<div class="form-group row">
		                        <label class="ontrol-label col-md-4 col-sm-3 col-xs-3">HeightSchool Name  :</label>
		                        <div class="col-md-8 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="heightschool_name_error"></small>
		                          <input type="text" class="form-control" id="heightschool_name" name="heightschool_name" placeholder ="Input Height School Name" autocomplete="off">
		                        </div>
		                      </div>
		                       <div class="form-group row">
		                        <label class="ontrol-label col-md-4 col-sm-3 col-xs-3">Start HeightSchool Date :</label>
		                        <div class="col-md-8 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="start_heightschool_date_error"></small>
		                           <select class="form-control" id="start_heightschool_date" name="start_heightschool_date" >
		                                    <option value= "0" selected disabled >Please Select Year</option>
		                           </select>
		                        </div>
		                      </div>
		                      
		                       <div class="form-group row">
		                        <label class="ontrol-label col-md-4 col-sm-3 col-xs-3">End HeightSchool Date :</label>
		                        <div class="col-md-8 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="end_heightschool_date_error"></small>
		                         <select class="form-control" id="end_heightschool_date" name="end_heightschool_date" >
		                         	<option value="0" selected disabled >Please Select Year</option>
		                         </select>
		                        </div>
		                      </div>
		                       </div>
		                       </div>
							<center>
	                            <button type="button" class="btn btn-previous btn-danger" id="previous-1">Previous</button>
	                            <button type="button" class="btn btn-next btn-primary" id="next-2">Next</button>
                            </center>
                           </div>
          </fieldset>
                    
                    
          <fieldset id ="step_tree">
                       <div class="form-top">
                             <div class="form-top-left">
                                <h3><span><i class="fa fa-calendar-check-o" aria-hidden="true"></i></span>	Education UniverSity</h3>
                             </div>
                        </div>
                   <div class="form-bottom">
     				 <div class="row">
                     
	                    <div class="col-md-9 col-sm-12" id="bordy_top" >
		                        <div class="form-group row">
		                        <label class="ontrol-label col-md-4 col-sm-3 col-xs-3">UniverSity Name  :</label>
		                        <div class="col-md-8 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="universety_name_error"></small>
		                          <input type="text" class="form-control" id="universety_name" name="university_name" placeholder ="UniverSety Name" autocomplete="off">
		                        </div>
		                      </div>
		                       <div class="form-group row">
		                        <label class="ontrol-label col-md-4 col-sm-3 col-xs-3">Start UniverSity Date :</label>
		                        <div class="col-md-8 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="start_universety_error"></small>
		                         	<select class="form-control" id="start_university_date" name="start_university_date" >
		                         		<option value="0" selected disabled>Please Select Year</option>
		                         	</select>
		                        </div>
		                      </div>
		                      
		                       <div class="form-group row">
		                        <label class="ontrol-label col-md-4 col-sm-3 col-xs-3">End UniverSity Date :</label>
		                        <div class="col-md-8 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="end_university_error"></small>
		                          <select class="form-control" id="end_university_date" name="end_university_date" >
		                          		<option value="0" selected disabled>Please Select Year</option>
		                          </select>
		                        </div>
		                      </div>
		                      
		                       <div class="form-group row">
		                        <label class="ontrol-label col-md-4 col-sm-3 col-xs-3">Skill  :</label>
		                        <div class="col-md-8 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="skill_error"></small>
		                          <input type="text" class="form-control" id="skill" name="skill" placeholder ="Skill" autocomplete="off">
		                        </div>
		                      </div>
		                       <div class="form-group row">
		                        <label class="ontrol-label col-md-4 col-sm-3 col-xs-3">Level :</label>
		                        <div class="col-md-8 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="level_error"></small>
		                          <input type="text" class="form-control" id="level" name="level" placeholder ="Level" autocomplete="off">
		                        </div>
		                      </div>
		                      
		                        <div class="form-group row" id="bordy_gender">
	                        ​​​​​​​​​​​​​​		 <label class="control-label col-md-4 col-sm-3 col-xs-3">ប្រភេទ គ្រូបង្រៀន :</label>
	                          	<div class="col-md-8 col-sm-9 col-xs-9">
	                            	 <small class="text-danger" id="teacher_type_error"></small>
	                              	<select class="form-control" name="teacher_type" id="teacher_type">
                                	 	<option class="hidden" selected disabled  value="0">ជ្រើសរើស ប្រភេទគ្រូបង្រៀន</option>
			                      		<option class="hidden" value="គ្រូកិច្ចសន្យា">គ្រូកិច្ចសន្យា</option>
			                      		<option class="hidden"  value="គ្រូក្របខ័ណ្ឌ">គ្រូក្របខ័ណ្ឌ</option>		                         
                            		</select>
	                         </div>
	                        </div>
	                        </div>
		                     </div> 
								<center>
								
									<button type="button" class="btn btn-previous btn-danger" id='previous-2'>Previous</button>
                                    <button type="submit" class="btn btn-next btn-primary"  id="next-3" >Submit</button>
								</center>
                            
                        </div> 
        </fieldset>

                <fieldset id ="step_four">
                   <div class="form-bottom">
                       <div class="row">
                           <div class="col-7">
                               <h2 class="fs-title">Finish:</h2>
                                   </div>
                                        </div> <br><br>
                                          <h2 class="purple-text text-center"><strong>SUCCESS !</strong></h2> <br>
                                         <div class="row justify-content-center">
                                     <div class="col-3" id="image-icon"> <img src="https://i.imgur.com/GwStPmg.png" class="fit-image" style="width:100px;height:100px;"> </div>
                                  </div> <br><br>
                               <div class="row justify-content-center">
                            <div class="col-7 text-center">
                      <h5 class="purple-text text-center">You Are Add New  Successfully Signed Up</h5>
                    </div>
                </div>
                     
               </div>
        </fieldset>
                    
                    
                </form>
            </div>
        </div>
    </div>      
           </div>
      
		<jsp:include page="/view/detail/FooterPage"></jsp:include>   
      </div>
    
	<script src="../../js/custom_js/teacher/validationEducation.js"></script>
	<script src="../../js/custom_js/teacher/YearConfiger.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <script src="../../js/custom.min.js"></script>

</body>
</html>