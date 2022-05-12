<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.ClassStudyBean" %>
<%@ page import="bean.TeacherClassBean" %>
<%@ page import="db.services.TeacherClassService" %>
<%@ page import="bean.TeacherBean" %>
<%@ page import="db.services.ClassStudyService" %>
<%@ page import="db.services.StudentService" %>
<%@ page import="bean.StudentBean" %> 

<%@ page import="db.services.MonthService" %>
<%@ page import="bean.MonthBean" %>
<%@ page import="bean.SubjectBean" %>
<%@ page import="bean.TeacherBean" %>
<%@ page import="db.services.SubjectService" %>
<%@ page import="db.services.TeacherService" %>
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
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/font-awesome.min.css" rel="stylesheet">
    <link href="../../webcss/all.min.css" rel="stylesheet">
    <link href="../../webcss/fontawesome.min.css" rel="stylesheet">
    <link href="../../css/custom.min.css" rel="stylesheet">
    <link href="../../css/swal2/sweetalert2.min.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script>   
    <script src="../../js/custom_js/lock_screen.js"></script>
    <script src='../../css/swal2/sweetalert2.min.js'></script>
    <script type="text/javascript">
		$(document).ready(function(){  
			$(".btnclass").click(function(){
				var tmp_data = $(this).val();
				var data = tmp_data.split(":");
				var class_id = data[0];
				//alert(id);
				var class_name = data[1];
				var room_id = data[2];
				$("#StudentNameList").text("បញ្ជីរាយនាមសិស្ស" + data[3] );
				$("#getClass_id").val(data[0] );
				
			});
		});
	</script>
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
                  <br>                   
                    <div class="clearfix"></div>    
                    <!-- START GET CLASS STADY AND GET INFORMATION STUDENT AND TEACHER-->                  
                  </div>
	            	<%
	            		ArrayList<ClassStudyBean> list = ClassStudyService.getClassByUserID(user_id);
	            		for(ClassStudyBean csb : list){
	            			out.print("<div class='col-md-3 col-sm-3'>");
		            			out.print("<div class='x_content'>");				            			
		            				out.print("<div class='card text-white bg-secondary mb-3'>");
										out.print("<h3 class='text-warning text-center'>" + csb.getRoomb().getRoom() + "</h3>");
										String class_study = csb.getClass_id() + ":" + csb.getRoomb().getRoom() + ":" + csb.getRoomb().getRoom_id() + ":" + csb.getRoomb().getRoom();
										out.print("<button type='button' id='button1' value='" + class_study + "' class='btnclass btn-outline-warning btn-lg text-primary'> បញ្ជីរាយនាមសិស្ស</button>");
										out.print("<a href='../../view/schedule/TeacherSchedule?id="+ csb.getClass_id()+":"+ csb.getTeaacherB().getT_id() +"' class='btn-outline-warning btn-lg text-white'></i>កាលវិភាគបង្រៀន</a>");
										out.print("<a href='' class='btn-outline-warning btn-lg text-white'>សម្រង់វត្តមាន</a>");
									out.print("</div>");         					
		            			out.print("</div>");
		            		out.print("</div>");
	            		}		            		
	            	%>
         	</div>
         	<div class="row">
			            <div class="col-md-12 col-sm-12">
	                  		<div class="x_content">
								<div class="card mb-3">
								  <div class="card-header text-center">
								  	<h3 id="StudentNameList" style="font-family:Khmer OS Muol Light; font-size: 20px;">តារាងរាយនាមសិស្ស...</h3>
								  </div>
								  <div class="card-body">
								  	<table id="Student_table" class="table table-sm">
				                      <thead>
				                        <tr class="text-center" style="font-family:Khmer OS Siemreap;font-size: 14px;">
				                          <th>អត្តលេខ </th>
				                          <th>គោត្តនាម/នាម</th>
				                          <th>ភេទ</th>				                          
				                          <th>ពិន្ទុ</th>
				                        </tr>
				                      </thead>
				                      <tbody id ="showdata">
				                        
				                      </tbody>
				                    </table>
								  </div>
								</div>
			            	</div>
	                  	</div>
	               </div>
         	
       	</div> 
       	
       	 <!-- END GET CLASS STADY AND GET INFORMATION STUDENT AND TEACHER-->
       
       	    <!-- START PAGE MODLE ADD SCORE FOR STUDENT ALL STUDY AND GET DATA FROM CLASS TEACHING-->
       	     
       	<div class="container">
			​​​<form role="form" class="registration-form" action="${pageContext.request.contextPath}" Method="POST" >
			  <div class="modal fade" id="Score" role="dialog">
			    <div class="modal-dialog modal-lg">
			      <div class="modal-content bg-info text-white">
			        <div class="modal-header">
			        	<h4 class="modal-title " style="font-family:Khmer OS Muol Light; margin:auto;">ពិន្ទុ សិស្ស</h4>
			          	<button type="button" class="close" data-dismiss="modal">&times;</button>			          
			        </div>
			        <div class="modal-body">
			        	<div class="col-md-12 col-sm-12  ">
			               <div class="form-bottom">
			            			<div class="row">
			                  			<div class="col-md-9 col-sm-12" id="bordy_top" >			                  			
					                      <div class="form-group row"  style="font-family:Khmer OS Muol Light;">
					                         <label class="control-label col-md-4 col-sm-3 col-xs-3" style="font-family:Khmer OS Muol Light;font-size: 14px;">អត្តលេខ សិស្ស :</label>
					                            <div class="col-md-8 col-sm-9 col-xs-9">
					                             <input type="text" name="student_id" id="student_id"  class="form-control" disabled>
					                              <input type="hidden" name="student_id" id="student_id"  class="form-control">
					                           </div>
					                      </div>
					                      
					                      <div class="form-group row" id="bordy_first_name" style="font-family:Khmer OS Muol Light;font-size: 14px;">
					                         <label class="control-label col-md-4 col-sm-3 col-xs-3" > ឈ្មោះសិស្ស:</label>
					                           <div class="col-md-8 col-sm-9 col-xs-9">
					                            <small class="text-danger bold italic" id="fname_error"></small>
					                           <input type="text" class="form-control" id="first_name" name = "first_name" disabled >
					                           <input type="hidden" class="form-control" id="first_name" name = "first_name" >
					                         </div>
					                      </div>
				                      
					                      <div class="form-group row" id="bordy_gender" style="font-family:Khmer OS Muol Light;font-size: 14px;">
					                          <label class="control-label col-md-4 col-sm-3 col-xs-3">ភេទ :</label>
				                              <div class="col-md-8 col-sm-9 col-xs-9 input-error" >
				                                  <small class="text-danger bold italic" id="gender_error"></small>
				                                  <input type="text" class="form-control" id="gender" name = "gender"  disabled>
				                                  <input type="hidden" class="form-control" id="gender" name = "gender" >				                                    
				                           	</div>
					                       </div>
				                      
				                 			<div class="form-group row "  id="bordy_dob" style="font-family:Khmer OS Muol Light;font-size: 14px;">
				                    			<label class="control-label col-md-4 col-sm-3 col-xs-3 ">ថ្ងៃ/ខែ/ឆ្នាំ :</label>
				                        		<div class="col-md-8 col-sm-9 col-xs-9 input-error" >
						                            <small class="text-danger bold italic" id="date_error"></small>
						                            <input type="date" class="form-control" id="date" name="date" placeholder ="dd/mm/yyyy" autocomplete="off" >
						                        </div>
				                        	</div>  
					                        <div class="form-group row"  id="bordy_dob" style="font-family:Khmer OS Muol Light;font-size: 14px;">
						                        <label class="control-label col-md-4 col-sm-3 col-xs-3" >មុខវិទ្យា :</label>
						                            <div class="col-md-8 col-sm-9 col-xs-9">
						                               <small class="text-danger" id="subject_error"></small>
						                                  <select class="form-control" id="subject" name="subject"  >
						                             	<option id ="district-index" class="hidden"  selected disabled value ="0" >ជ្រើសរើស មុខវិទ្យា</option>
						                             	<%
						                             	  ArrayList <SubjectBean> sbs = SubjectService.p_listAllSubject();
						                             	    for( SubjectBean as : sbs){
						                             	    	out.print("<option value='"+ as.getSubject_id() +"'>" + as.getSubject_name() + "</option>");
						                             	    	
						                             	    }
						                             	%>
					                            	</select>
						                          </div>
						                     </div>
				                     
				                       
					                       <div class="form-group row"  id="bordy_dob" style="font-family:Khmer OS Muol Light;font-size: 14px;">
						                       <label class="control-label col-md-4 col-sm-3 col-xs-3" >​ជ្រើសរើស មុខវិទ្យារង</label>
						                       <div class="col-md-8 col-sm-9 col-xs-9">
						                       		<small class="text-danger" id="sub_subject_error"></small>
						                            <select class="form-control" id="sub_subject" name="sub_subject" >
						                              <option  class="hidden"  selected disabled value ="0" >ជ្រើសរើស មុខវិទ្យារង</option>
					                               	</select>
						                        </div>
						                     </div>
				                     
					                         <div class="form-group row"  id="bordy_dob" style="font-family:Khmer OS Muol Light;font-size: 14px;">
						                        <label class="control-label col-md-4 col-sm-3 col-xs-3" >ពិន្ទុ :</label>
						                           <div class="col-md-8 col-sm-9 col-xs-9">
						                             <small class="text-danger" id="discription_error"></small>
						                                <input type="text" class="form-control" id="score" name="score" placeholder =" សូម បញ្ចូល ពិន្ទុ ">
						                        </div>
						                     </div>
				                      
						                      <div class="form-group row"  id="bordy_dob" style="font-family:Khmer OS Muol Light;font-size: 14px;">
						                       <label class="control-label col-md-4 col-sm-3 col-xs-3" >​ជ្រើសរើស ខែ</label>
						                          <div class="col-md-8 col-sm-9 col-xs-9">
						                              <small class="text-danger" id="commune_error"></small>
						                                 <select class="form-control" id="month" name="month" placeholder="ជ្រើសរើស ខែ">
						                              <option  id ="commune-index" class="hidden"  selected disabled value ="0" >ជ្រើសរើស ខែ </option>
						                                <%
						                             	  ArrayList <MonthBean> mb = MonthService.p_getMonth();
						                             	    for( MonthBean as : mb){
						                             	    	out.print("<option value='"+ as.getId() +"'>" + as.getMonth_name() + "</option>");
						                             	    	
						                             	    }
						                             	%>
					                               </select>
						                        </div>
						                     </div>	 			                     
											
			                        	</div>
			                     	</div>
			                     </div>	
			        		</div>
			        	</div>
				        <div class="modal-footer t">
				        	<a type="button" href="../../view/panel/TeacherPanel" class="btn btn-previous btn-outline-warning text-dark" id="Home_page">ទំព័រឌើម</a>
				        	<button type="button" class="btn btn-previous btn-outline-dark text-warning" id="Clear_page">សំអាត</button>
				        	<button type="button" class="btn btn-next btn-outline-light text-red" id="Submit_page">រក្សាទុក</button>
				          	<button type="button" class="btn btn-outline-danger text-white" id ="Close_page" data-dismiss="modal">បិទទំព័រ</button>
				        </div>
			      </div>
			    </div>
			  </div>
		  </form>
		</div>
       	 
       	 <!-- END PAGE MODLE ADD SCORE FOR STUDENT ALL STUDY AND GET DATA FROM CLASS TEACHING-->
	
        </div>
		<jsp:include page="/view/detail/FooterPage"></jsp:include>
      </div>
    </div>
    
    <script src="../../js/custom_js/teacher/clearAttendance.js"></script>
    <script src="../../js/custom_js/teacher/clearScore.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <script src="../../js/custom.min.js"></script>
     <script>
      
           // START GET INFORMATION STUDENT FROM CLASS STUDY AND DISPLAY DATA
     
	    $(document).ready(function(){
			$(".btnclass").click(function(){
				var id = $(this).val();
				var data = id.split(":");
				var params = {classid : data[0]};						
					$.post("${pageContext.request.contextPath}/AutocompleteStudent.do" , $.param(params) , function(responseJson){
						var row = $("tr");
						row.find("td").remove();
						$.each(responseJson, function(idx, key){
							console.log( key );
								var tbl_record = "<tr class='text-center'>";
								tbl_record += "<td>" + key.student_id +  "</td>";
								var fullname = key.first_name + " " + key.last_name;
								tbl_record += "<td>" + fullname +  "</td>";
								tbl_record += "<td>" + key.gender +  "</td>";
								var student_info = key.student_id + ":" + key.first_name +":"+ key.last_name + ":" + key.gender;
								tbl_record += "<td class='text-center'><button type='button'  class='btn btnScore'  data-toggle='modal' data-target='#Score' value='"+ student_info +"'>ពិន្ទុ</button></td>";
							tbl_record += "<tr>";
							$("#Student_table #showdata").append(tbl_record);
						});
					});
				});
			});
	    	   
	          // END GET INFORMATION STUDENT FROM CLASS STUDY AND DISPLAY DATA
	         // START GET STUDENT FIRST NAME ,STUDENT LAST NAME,  GENDER, AND STUDENT ID FROME TABLE CLASS TEACHING FROM SCORE
	    
	    	$(document).on("click",".btnScore",function(){	    		
	    			var student = $(this).val();
	       	 		var MyValue = student.split(":");
	       	 		$("#student_id").val(MyValue[0]);
	       	 		$("#first_name").val(MyValue[1] + " " + MyValue[2]);
	       	 		$("#gender").val(MyValue[3]);
	    	
	    	});
	    
	    	// END GET STUDENT FIRST NAME ,STUDENT LAST NAME,  GENDER, AND STUDENT ID FROME TABLE CLASS TEACHING FROM SCORE
	    	// START GET STUDENT FIRST NAME ,STUDENT LAST NAME,  GENDER, AND STUDENT ID FROME TABLE CLASS TEACHING​ FROM ATTENANCE
	    
	    	$(document).on("click",".btnAttendance",function(){	    		
	    			var Mystudent = $(this).val();
	       	 		var Mystudent = Mystudent.split(":");
	       	 		$("#att_student_id").val(Mystudent[0]);
	       	 		$("#att_first_name").val(Mystudent[1] + " " + Mystudent[2]);
	       	 		$("#att_gender").val(Mystudent[3]);
	    	});
	    
	    	 // END GET STUDENT FIRST NAME ,STUDENT LAST NAME,  GENDER, AND STUDENT ID FROME TABLE CLASS TEACHING FROM ATTENDANCE
	    	// START SELECT SUBJECT TO SUB SUBJECT CATAGORY GET SUBSUBJEC CATAGORY NAME
	    	
       	 	$(document).ready(function(){
       	 		$("#subject").on("change",function(){
       	 			var params = {subject_id : $(this).val()}
       				$.post("${pageContext.request.contextPath}/SelectSubSubjectCatagory" , $.param(params) , function(responseJson){
       					var $select = $("#sub_subject");
       					$select.find("option").remove();
       					$.each(responseJson, function(idx, key){
       						console.log( key );
       						$("<option>").val( key.sub_subject_id ).text(key.sub_subject_name).appendTo($select);
       						 
       					});
       				});
       	 		}); 
       	 	});
	    	
       	// END SELECT SUBJECT TO SUB SUBJECT CATAGORY GET SUBSUBJEC CATAGORY NAME
       	 	
       	 </script>
</body>
</html>