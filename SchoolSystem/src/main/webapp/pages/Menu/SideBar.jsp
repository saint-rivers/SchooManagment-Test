<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.services.ProvinceService" %> 
<%@ page import="bean.ProvinceBean" %>
<%@ page import="db.services.DistrictService" %> 
<%@ page import="bean.DistrictBean" %>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="../../images/users/${param.photo_view}" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2> ${param.user_name} </h2>
              </div>
            </div>
            <!-- /menu profile quick info -->
            <br />
           <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                <%
	                String role_code = request.getParameter("role_code");
	                
	                if(role_code.equals("err")){
	               	 response.sendRedirect("../AccessSystem");
	                }	                
	                
	                // Menu for Admin
	                if(role_code.equals("role005")){
	                	out.print("<li><a href='../../view/template/PageTemplate'><i class='fas fa-home fa-lg'></i> ទំព័រដើម</a></li>");
	                }
	                if(role_code.equals("role005")){
	                	out.print("<li><a><i class='fas fa-users fa-lg'></i> គណនីអ្នកប្រើប្រាស់ <span class='fa fa-chevron-down'></span></a>");
	                	out.print("<ul class='nav child_menu'>");
	                	out.print("<li><a href='../../view/detail/ListUsers'> បញ្ជីគណនីអ្នកប្រើប្រាស់</a></li>");
	                	out.print("</ul>");
	                	out.print("</li>");
	                }
	                if(role_code.equals("role005")){
	                    out.print("<li><a><i class='fas fa-chalkboard-teacher fa-lg'> </i> គ្រូបង្រៀន <span class='fa fa-chevron-down'></span></a>");
	                    out.print("<ul class='nav child_menu'>");
	                    out.print("<li><a href='../../view/detail/ListTeacher'>បញ្ជីរាយនាមគ្រូបង្រៀន</a></li>");
	                    out.print("<li><a href='../../view/Teacher/AddTeacher'>បញ្ចូលគ្រូថ្មី</a></li>");
	                    out.print("<li><a href='../../view/teacher_education/ListEducationTeacher'>បញ្ជីប្រវត្តិសិក្សារបស់គ្រូបង្រៀន</a></li>");
	                    out.print("<li><a href='../../view/teacher/NewTeacherSubject'> មុខវិជ្ជាបង្រៀនរបស់គ្រូ</a></li>");	                    
	                    out.print("</ul>");
	                    out.print("</li>");
	                  }
	                if(role_code.equals("role005")){
	                	out.print("<li><a><i class='fas fa-user-friends fa-lg'></i> អាណាព្យាបាលសិស្ស <span class='fa fa-chevron-down'></span></a>");
	                	out.print("<ul class='nav child_menu'>");
	                	out.print("<li><a href='../../view/list/ListGuardian'>បញ្ជីអាណាព្យាបាលសិស្ស</a></li>");	                	
	                	out.print("</ul>");
	                	out.print("</li>");
	                }
	                if(role_code.equals("role005")){
	                	out.print("<li><a><i class='fas fa-user-graduate fa-lg'></i> សិស្ស<span class='fa fa-chevron-down'></span></a>");
	                	out.print("<ul class='nav child_menu'>");
	                	out.print("<li><a href='../../view/detail/NameList'>បញ្ជីរូបថតសិស្ស</a></li>");
	                	out.print("<li><a href='../../view/card/StudentCard'>ប័ណ្ណសម្គាល់ខ្លួនសិស្ស</a></li>");
	                	out.print("<li><a href='../../view/detail/ListStudents'>ប្រវត្តិរួបសិស្ស</a></li>");
	                	out.print("</ul>");
	                	out.print("</li>");
	                }
	                if(role_code.equals("role005")){
	                	out.print("<li><a><i class='fas fa-graduation-cap fa-lg'></i> ថ្នាក់រៀន <span class='fa fa-chevron-down'></span></a>");
	                	out.print("<ul class='nav child_menu'>");
	                	out.print("<li><a href='../../view/list/ClassStudy'> បញ្ជីថ្នាក់រៀន</a></li>");	  					
	  					out.print("<li class='sub_menu'><a href='../../view/add/TeacherClass'>បញ្ចូលគ្រូតាមថ្នាក់</a></li>");
	                	out.print("<li class='sub_menu'><a href='../../view/StudentClass/ClassStudent'>បញ្ចូលសិស្សតាមថ្នាក់</a></li>");
	                	out.print("<li class='sub_menu'><a href='../../view/add/SubjectClass'>Add Subject-Class</a></li>");
  						out.print("<li><a href='../../view/score/MonthlyScore'>Monthly Score</a></li>");  					
	  					out.print("<li><a href='../../view/detail/classroom'> បន្ទប់រៀន</a>");
	                	out.print("</ul>");
	                	out.print("</li>");
	                }	                
	                if(role_code.equals("role005")){
	                	out.print("<li><a href='#'><i class='fa fa-book fa-lg'></i> គ្រប់គ្រងមុខវិជ្ជា<span class='fa fa-chevron-down'></span></a>");
	        	  			out.print("<ul class='nav child_menu'>");
	        	  				out.print("<li><a href='../../view/detail/ListSubject'><i class='fa fa-book fa-lg'></i> បញ្ជីមុខវិជ្ជា</a></li>");	                	
		                		out.print("<li><a href='../../view/detail/ListSubjectCategory'><i class='fa fa-book fa-lg'></i> ប្រភេទមុខវិជ្ជា</a></li>");
		  					out.print("</ul>");
	  					out.print("</li>");	                		
	                }
	                if(role_code.equals("role005")){
	                	out.print("<li><a href='../../view/detail/ClassSchedule'><i class='fas fa-clock-o fa-lg'></i> កាលវិភាគ</a></li>");	                	
	                }
	                if(role_code.equals("role005")){
	                	out.print("<li><a><i class='fas fa-layer-group fa-lg'></i> Layouts <span class='fa fa-chevron-down'></span></a>");
		                	out.print("<ul class='nav child_menu'>");
		                	out.print("<li><a href='#'>Fixed Sidebar</a></li>");
		                	out.print("<li><a href='#'>Fixed Footer</a></li>");
		                	out.print("</ul>");
	                	out.print("</li>");
	                }
	                
	             	// Menu for Teacher
	                if(role_code.equals("role001")){
	                	out.print("<li><a href='../../view/panel/TeacherPanel'><i class='fas fa-home fa-lg'></i> ទំព័រដើម</a></li>");
	                }
	                if(role_code.equals("role001")){
	                	out.print("<li><a href='#'><i class='fa fa-user fa-lg'></i>ព័ត៌មានផ្ទាល់ខ្លួន<span class='fa fa-chevron-down'></span></a>");
		                	out.print("<ul class='nav child_menu'>");
		                	out.print("<li><a href='../../view/Teacher/AddTeacher'>បញ្ចូលព័ត៌មានផ្ទាល់ខ្លួន</a></li>");
		                	out.print("<li><a href='../../view/profile/TeacherProfile'>ព័ត៌មានផ្ទាល់ខ្លួន</a></li>");
		                	out.print("</ul>");
	                	out.print("</li>");
	                }
	                if(role_code.equals("role001")){
	                	out.print("<li><a href='#'><i class='fas fa-user-graduate fa-lg'></i> វត្តមានសិស្ស</a></li>");
	                }
	                if(role_code.equals("role001")){
	                	out.print("<li><a href='#'><i class='fa fa-clock fa-lg'></i> កាលវិភាគបង្រៀន</a></li>");
	                }
	                if(role_code.equals("role001")){
	                	out.print("<li><a href='../../view/teaching/ClassTeaching'><i class='fas fa-chalkboard-teacher fa-lg'></i> ថ្នាក់បង្រៀន</a></li>");
	                }
	                
	             	// Menu for Student
	                if(role_code.equals("role002")){
	                	out.print("<li><a href='../../view/panel/StudentPanel'><i class='fas fa-home fa-lg'></i> ទំព័រដើម</a></li>");
	                }
	                if(role_code.equals("role002")){
	                	out.print("<li><a href='#'><i class='fa fa-user fa-lg'></i>ព័ត៌មានផ្ទាល់ខ្លួន<span class='fa fa-chevron-down'></span></a>");
		                	out.print("<ul class='nav child_menu'>");
		                	out.print("<li><a href='../../view/detail/AddAStudent'>បញ្ចូលព័ត៌មានផ្ទាល់ខ្លួន</a></li>");
		                	out.print("<li><a href='../../view/profile/StudentProfile'>ព័ត៌មានផ្ទាល់ខ្លួន</a></li>");
		                	out.print("</ul>");
	                	out.print("</li>");
	                }
	                if(role_code.equals("role002")){
	                	out.print("<li><a href='#'><i class='fas fa-user-graduate fa-lg'></i>  អវត្តមាន</a></li>");
	                }
	                if(role_code.equals("role002")){
	                	out.print("<li><a href='../../view/schedule/StudentSchedule'><i class='fas fa-clock fa-lg'></i> កាលវិភាគរៀន</a></li>");
	                }
	                if(role_code.equals("role002")){
	                	out.print("<li><a href='#'><i class='fas fa-chalkboard-teacher fa-lg'></i> ថ្នាក់រៀនរបស់ខ្ញុំ</a></li>");
	                }
	                if(role_code.equals("role002")){
	                	out.print("<li><a href='#'><i class='fas fa-book fa-lg'></i> លទ្ធផលប្រឡង</a></li>");
	                }
                %>
                
                </ul>              
              </div>              
              <div class="menu_section">
                <h3>Live On</h3>
                <ul class="nav side-menu">
              <%
              if(role_code.equals("role005")){
            	  out.print("<li><a><i class='fas fa-address-book fa-lg'></i> Address <span class='fa fa-chevron-down'></span></a>");
            	  	out.print("<ul class='nav child_menu'>");
	            	  	out.print("<li><a href='../../view/detail/AddNewDistrict'>Add District<span class='fa fa-chevron-down'></span></a>");
	            	  	out.print("<li><a href='../../view/detail/AddNewCommune'>Add Commune<span class='fa fa-chevron-down'></span></a>");
	            	  	out.print("<li><a href='../../view/add/AddVillage'>Add Village<span class='fa fa-chevron-down'></span></a>");
		           	  	out.print("</ul>");
            	  out.print("</li>");
              }	
              if(role_code.equals("role005")){
            	  out.print("<li><a><i class='fas fa-circle fa-lg'></i> Additional Pages <span class='fa fa-chevron-down'></span></a>");
            	  	out.print("<ul class='nav child_menu'>");
            	  		out.print("<li><a href='#'> E-commerce</a></li>");
            	  		out.print("<li><a href='#'> Projects</a></li>");
            	  		out.print("<li><a href='#'> Project Detail</a></li>");
            	  		out.print("<li><a href='#'> Contacts</a></li>");
            	  		out.print("<li><a href='#'> Profile</a></li>");
            	  	out.print("</ul>");
            	  out.print("</li>");
              }
              %>                     
              </ul>
              </div>

            </div>