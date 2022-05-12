<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.ClassStudyBean"%>
<%@ page import="db.services.ClassStudyService" %>
<%@ page import="bean.RoomBean"%>
<%@ page import="db.services.RoomService" %> 
<%@ page import="bean.SubjectCategoryBean"%>
<%@ page import="db.services.SubjectCategoryService" %> 
<%@ page import="bean.SubjectBean"%>
<%@ page import="db.services.SubjectService" %> 
<%@ page import="bean.TeacherBean"%>
<%@ page import="db.services.TeacherService" %> 
  
<%
	session = request.getSession(false);
	String role_code = "",role_name="",user_name="";
	String photo_view = "";
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
    <link href="../../css/mdtimepicker.css" rel="stylesheet" type="text/css">
     <!-- jQuery -->   
        <!-- Bootstrap -->
    <link href="../../css/dataTable/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/scroller.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/customStyle/timetable.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script> 
    <script src="../../js/popper.min.js"></script>
   
	<script src="../../js/mdtimepicker.js"></script>
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
	        <%
  				String id = request.getParameter("id");
  				ClassStudyBean csb = ClassStudyService.getAClassStudy(id);
  			%>
	        <div class="right_col" role="main">
		  	<div class="row">
		  		<form action="" method="post"> 
			  		<div class="col-md-12 col-sm-12 col-xs-6">
						<div class="x_panel">
		                	<div class="x_title">
		                  		<h1 class="text-center">កាលវិភាគប្រចាំសបា្ដហ៍<%=csb.getRoomb().getRoom() %></h1>
		                  		<ul class="nav navbar-right panel_toolbox">
		                    		<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>	                    
		                    		<li><a class="close-link"><i class="fa fa-close"></i></a></li>
		                  		</ul>
		                  		<div class="clearfix"></div>
		                	</div>
		                
							<div class="col-md-12 col-sm-12 col-xs-8">
	         					<div class="x_content">
	                    		<br>
			                      <div class="form-group row">
			                      	<input type="hidden" name="room_id" value="<%=csb.getRoomb().getRoom_id() %>">
			                        <h4 class="control-label col-md-6 col-sm-6 col-xs-6"><i class="fa fa-sun-o"></i> វេនសិក្សា:  <%=csb.getTime_study() %></h4>
			                        <input type="hidden" name="time_study" value="<%=csb.getTime_study() %>">
			                        
			                        <h4 class="control-label col-md-6 col-sm-6 col-xs-6 text-right"><i class="fa fa-calendar"></i> ចូលរៀនថ្ងៃទី:  <%=csb.getStart_date() %></h4>
			                        <input type="hidden" name="start_date" value="<%=csb.getStart_date() %>">
			                      </div>
			                	</div>
					    	</div>
							
		                	<div class="x_content">
							    <div class="container">
					                <div class="table-responsive">
					                    <table class="table table-bordered text-center">
					                        <thead>
					                            <tr class="bg-light-gray">
					                                <th class="text-uppercase">ម៉ោង</th>
					                                <th class="text-uppercase">ច័ន្ទ</th>
					                                <th class="text-uppercase">អង្គារ</th>
					                                <th class="text-uppercase">ពុធ</th>
					                                <th class="text-uppercase">ព្រហស្បតិ៍</th>
					                                <th class="text-uppercase">សុក្រ</th>
					                                <th class="text-uppercase">សៅរ៍</th>
					                                <th class="text-uppercase">អាទិត្យ</th>
					                            </tr>
					                        </thead>
					                        <tbody>
					                            <tr>
					                                <td class="align-middle">
												      <input style="width:70px;" type="text" class="timepicker" placeholder="ចូល"/>
												      <input style="width:70px;" type="text" class="timepicker" placeholder="ចេញ"/>
														<script>
														  $(document).ready(function(){
														    $('.timepicker').mdtimepicker(); //Initializes the time picker
														  });
														</script>
														<script type="text/javascript">
															  var _gaq = _gaq || [];
															  _gaq.push(['_setAccount', 'UA-36251023-1']);
															  _gaq.push(['_setDomainName', 'jqueryscript.net']);
															  _gaq.push(['_trackPageview']);
															
															  (function() {
															    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
															    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
															    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
															  })();
														
														</script>
					                                </td>
					                                <td>
				                                    	<select class="form-control form-control-sm" name="subject_monday">
															<option selected disabled>មុខវិជ្ជា</option>
															<%
																ArrayList<SubjectBean> list1 = SubjectService.p_listAllSubject();
																for(SubjectBean sb : list1){
																	out.print("<option value='" + sb.getSubject_id() + "'>" + sb.getSubject_name() + "</option>");
																}
															%>
														</select>
					                                    <select class="form-control form-control-sm" name="teacher_monday">
															<option selected disabled>គ្រូ</option>
															<%
																ArrayList<TeacherBean> listA = TeacherService.P_listInformation_Teacher();
																for(TeacherBean tb : listA){
																	out.print("<option value='" + tb.getT_id() + "'>" + tb.getT_fname()+" " + tb.getT_lname() + "</option>");
																}
															%>
														</select>
					                                </td>
					                                <td>
					                                    <select class="form-control form-control-sm" name="subject_tuesday">
															<option selected disabled>មុខវិជ្ជា</option>
															<%
																ArrayList<SubjectBean> list2 = SubjectService.p_listAllSubject();
																for(SubjectBean sb : list2){
																	out.print("<option value='" + sb.getSubject_id() + "'>" + sb.getSubject_name() + "</option>");
																}
															%>
														</select>
					                                    <select class="form-control form-control-sm" name="teacher_tuesday">
															<option selected disabled>គ្រូ</option>
															<%
																ArrayList<TeacherBean> listB = TeacherService.P_listInformation_Teacher();
																for(TeacherBean tb : listB){
																	out.print("<option value='" + tb.getT_id() + "'>" + tb.getT_fname()+" " + tb.getT_lname() + "</option>");
																}
															%>
														</select>
					                                </td>
					
					                                <td>
					                                    <select class="form-control form-control-sm" name="subject_wenesday">
															<option selected disabled>មុខវិជ្ជា</option>
															<%
																ArrayList<SubjectBean> list3 = SubjectService.p_listAllSubject();
																for(SubjectBean sb : list3){
																	out.print("<option value='" + sb.getSubject_id() + "'>" + sb.getSubject_name() + "</option>");
																}
															%>
														</select>
					                                    <select class="form-control form-control-sm" name="teacher_wenesday">
															<option selected disabled>គ្រូ</option>
															<%
																ArrayList<TeacherBean> listC = TeacherService.P_listInformation_Teacher();
																for(TeacherBean tb : listC){
																	out.print("<option value='" + tb.getT_id() + "'>" + tb.getT_fname()+" " + tb.getT_lname() + "</option>");
																}
															%>
														</select>
					                                </td>
					                                <td>
					                                    <select class="form-control form-control-sm" name="subject_thursday">
															<option selected disabled>មុខវិជ្ជា</option>
															<%
																ArrayList<SubjectBean> list4 = SubjectService.p_listAllSubject();
																for(SubjectBean sb : list4){
																	out.print("<option value='" + sb.getSubject_id() + "'>" + sb.getSubject_name() + "</option>");
																}
															%>
														</select>
					                                    <select class="form-control form-control-sm" name="teacher_thursday">
															<option selected disabled>គ្រូ</option>
															<%
																ArrayList<TeacherBean> listD = TeacherService.P_listInformation_Teacher();
																for(TeacherBean tb : listD){
																	out.print("<option value='" + tb.getT_id() + "'>" + tb.getT_fname()+" " + tb.getT_lname() + "</option>");
																}
															%>
														</select>
					                                </td>
					                                <td>
					                                    <select class="form-control form-control-sm" name="subject_friday">
															<option selected disabled>មុខវិជ្ជា</option>
															<%
																ArrayList<SubjectBean> list5 = SubjectService.p_listAllSubject();
																for(SubjectBean sb : list5){
																	out.print("<option value='" + sb.getSubject_id() + "'>" + sb.getSubject_name() + "</option>");
																}
															%>
														</select>
					                                    <select class="form-control form-control-sm" name="teacher_friday">
															<option selected disabled>គ្រូ</option>
															<%
																ArrayList<TeacherBean> listE = TeacherService.P_listInformation_Teacher();
																for(TeacherBean tb : listE){
																	out.print("<option value='" + tb.getT_id() + "'>" + tb.getT_fname()+" " + tb.getT_lname() + "</option>");
																}
															%>
														</select>
					                                </td>
					                                <td>
					                                    <select class="form-control form-control-sm" name="subject_saturday">
															<option selected disabled>មុខវិជ្ជា</option>
															<%
																ArrayList<SubjectBean> list6 = SubjectService.p_listAllSubject();
																for(SubjectBean sb : list6){
																	out.print("<option value='" + sb.getSubject_id() + "'>" + sb.getSubject_name() + "</option>");
																}
															%>
														</select>
					                                    <select class="form-control form-control-sm" name="teacher_saturday">
															<option selected disabled>គ្រូ</option>
															<%
																ArrayList<TeacherBean> listF = TeacherService.P_listInformation_Teacher();
																for(TeacherBean tb : listF){
																	out.print("<option value='" + tb.getT_id() + "'>" + tb.getT_fname()+" " + tb.getT_lname() + "</option>");
																}
															%>
														</select>
					                                </td>
					                                <td>
					                                    <select class="form-control form-control-sm" name="subject_sunday">
															<option selected disabled>មុខវិជ្ជា</option>
															<%
																ArrayList<SubjectBean> list7 = SubjectService.p_listAllSubject();
																for(SubjectBean sb : list7){
																	out.print("<option value='" + sb.getSubject_id() + "'>" + sb.getSubject_name() + "</option>");
																}
															%>
														</select>
					                                    <select class="form-control form-control-sm" name="teacher_sunday">
															<option selected disabled>គ្រូ</option>
															<%
																ArrayList<TeacherBean> listG = TeacherService.P_listInformation_Teacher();
																for(TeacherBean tb : listG){
																	out.print("<option value='" + tb.getT_id() + "'>" + tb.getT_fname()+" " + tb.getT_lname() + "</option>");
																}
															%>
														</select>
					                                </td>
					                            </tr>
					                            <tr>
					                                <td class="align-middle">09:00am</td>
					                                <td>
					                                    <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16 xs-font-size13">ភាសាខ្មែរ</span>
					                                    <div class="margin-10px-top font-size14">9:00-10:00</div>
					                                    <div class="font-size13 text-light-gray"> សុ ចិ</div>
					                                </td>
					                                <td>
					                                    <span class="bg-green padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">គណិតវិទ្យា</span>
					                                    <div class="margin-10px-top font-size14">9:00-10:00</div>
					                                    <div class="font-size13 text-light-gray">បុ លិ</div>
					                                </td>
					
					                                <td>
					                                    <span class="bg-yellow padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">វិទ្យាសាស្រ្ត</span>
					                                    <div class="margin-10px-top font-size14">9:00-10:00</div>
					                                    <div class="font-size13 text-light-gray">ចេះ  ពីរៀន</div>
					                                </td>
					                                <td>
					                                    <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">សិក្សាសង្គម</span>
					                                    <div class="margin-10px-top font-size14">9:00-10:00</div>
					                                    <div class="font-size13 text-light-gray"> មាន ពីរក</div>
					                                </td>
					                                <td>
					                                    <span class="bg-purple padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Art</span>
					                                    <div class="margin-10px-top font-size14">9:00-10:00</div>
					                                    <div class="font-size13 text-light-gray">Kate Alley</div>
					                                </td>
					                                <td>
					                                    <span class="bg-pink padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">English</span>
					                                    <div class="margin-10px-top font-size14">9:00-10:00</div>
					                                    <div class="font-size13 text-light-gray">James Smith</div>
					                                </td>
					                            </tr>
					
					                            <tr>
					                                <td class="align-middle">10:00am</td>
					                                <td>
					                                    <span class="bg-yellow padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Music</span>
					                                    <div class="margin-10px-top font-size14">10:00-11:00</div>
					                                    <div class="font-size13 text-light-gray">Ivana Wong</div>
					                                </td>
					                                <td class="bg-light-gray">
					
					                                </td>
					                                <td>
					                                    <span class="bg-purple padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Art</span>
					                                    <div class="margin-10px-top font-size14">10:00-11:00</div>
					                                    <div class="font-size13 text-light-gray">Kate Alley</div>
					                                </td>
					                                <td>
					                                    <span class="bg-green padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Yoga</span>
					                                    <div class="margin-10px-top font-size14">10:00-11:00</div>
					                                    <div class="font-size13 text-light-gray">Marta Healy</div>
					                                </td>
					                                <td>
					                                    <span class="bg-pink padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">English</span>
					                                    <div class="margin-10px-top font-size14">10:00-11:00</div>
					                                    <div class="font-size13 text-light-gray">James Smith</div>
					                                </td>
					                                <td class="bg-light-gray">
					
					                                </td>
					                            </tr>
					
					                            <tr>
					                                <td class="align-middle">11:00am</td>
					                                <td>
					                                    <span class="bg-lightred padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Break</span>
					                                    <div class="margin-10px-top font-size14">11:00-12:00</div>
					                                </td>
					                                <td>
					                                    <span class="bg-lightred padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Break</span>
					                                    <div class="margin-10px-top font-size14">11:00-12:00</div>
					                                </td>
					                                <td>
					                                    <span class="bg-lightred padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Break</span>
					                                    <div class="margin-10px-top font-size14">11:00-12:00</div>
					                                </td>
					                                <td>
					                                    <span class="bg-lightred padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Break</span>
					                                    <div class="margin-10px-top font-size14">11:00-12:00</div>
					                                </td>
					                                <td>
					                                    <span class="bg-lightred padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Break</span>
					                                    <div class="margin-10px-top font-size14">11:00-12:00</div>
					                                </td>
					                                <td>
					                                    <span class="bg-lightred padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Break</span>
					                                    <div class="margin-10px-top font-size14">11:00-12:00</div>
					                                </td>
					                            </tr>
					
					                            <tr>
					                                <td class="align-middle">12:00pm</td>
					                                <td class="bg-light-gray">
					
					                                </td>
					                                <td>
					                                    <span class="bg-purple padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Art</span>
					                                    <div class="margin-10px-top font-size14">12:00-1:00</div>
					                                    <div class="font-size13 text-light-gray">Kate Alley</div>
					                                </td>
					                                <td>
					                                    <span class="bg-sky padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Dance</span>
					                                    <div class="margin-10px-top font-size14">12:00-1:00</div>
					                                    <div class="font-size13 text-light-gray">Ivana Wong</div>
					                                </td>
					                                <td>
					                                    <span class="bg-yellow padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Music</span>
					                                    <div class="margin-10px-top font-size14">12:00-1:00</div>
					                                    <div class="font-size13 text-light-gray">Ivana Wong</div>
					                                </td>
					                                <td class="bg-light-gray">
					
					                                </td>
					                                <td>
					                                    <span class="bg-green padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Yoga</span>
					                                    <div class="margin-10px-top font-size14">12:00-1:00</div>
					                                    <div class="font-size13 text-light-gray">Marta Healy</div>
					                                </td>
					                            </tr>
					
					                            <tr>
					                                <td class="align-middle">01:00pm</td>
					                                <td>
					                                    <span class="bg-pink padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">English</span>
					                                    <div class="margin-10px-top font-size14">1:00-2:00</div>
					                                    <div class="font-size13 text-light-gray">James Smith</div>
					                                </td>
					                                <td>
					                                    <span class="bg-yellow padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Music</span>
					                                    <div class="margin-10px-top font-size14">1:00-2:00</div>
					                                    <div class="font-size13 text-light-gray">Ivana Wong</div>
					                                </td>
					                                <td class="bg-light-gray">
					
					                                </td>
					                                <td>
					                                    <span class="bg-pink padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">English</span>
					                                    <div class="margin-10px-top font-size14">1:00-2:00</div>
					                                    <div class="font-size13 text-light-gray">James Smith</div>
					                                </td>
					                                <td>
					                                    <span class="bg-green padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Yoga</span>
					                                    <div class="margin-10px-top font-size14">1:00-2:00</div>
					                                    <div class="font-size13 text-light-gray">Marta Healy</div>
					                                </td>
					                                <td>
					                                    <span class="bg-yellow padding-5px-tb padding-15px-lr border-radius-5 margin-10px-bottom text-white font-size16  xs-font-size13">Music</span>
					                                    <div class="margin-10px-top font-size14">1:00-2:00</div>
					                                    <div class="font-size13 text-light-gray">Ivana Wong</div>
					                                </td>
					                            </tr>
					                        </tbody>
					                    </table>
					                </div>
					                <div class="form-group row">
			                        <div class="col-md-9 offset-md-3">
			                          <a href="../../view/detail/ListSubject" class="btn btn-primary">Back</a>
			                          <button type="submit" class="btn btn-success">Submit</button>
			                        </div>
			                      </div>
					            </div>
							    
		                	</div>
		              	</div>
					  </div>
				  </form>
				</div>
		  
			</div>
		</div>
      <!-- /page content -->
      <!-- footer content -->
		<jsp:include page="/view/detail/FooterPage"></jsp:include>
        <!-- /footer content -->
    </div>
    <!-- Bootstrap -->
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../../js/custom.min.js"></script>
</body>
</html>