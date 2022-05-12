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
<%@ page import="bean.UserBean" %>
<%@ page import="db.services.UserService" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">	
    <title>LMS</title>

    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/font-awesome.min.css" rel="stylesheet">
    <link href="../../webcss/all.min.css" rel="stylesheet"> 
    <link href="../../css/custom.min.css" rel="stylesheet">
    <link href="../../css/toastr.min.css" rel="stylesheet">
	<link href="../../css/sweetalert2.min.css" rel="stylesheet">  
    <script src="../../js/popper.min.js"></script>
    <link href="../../css/customStyle/MaltyFormData.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script>   
	<style type="text/css">
		label{
			font-family: Khmer OS Battambang;
		}
	</style>
    <script>
           
    $(document).ready(function(){
		$("#province").on('change', function(){
			var params = {proid : $(this).val()};
				$.post("${pageContext.request.contextPath}/ProvinceServlet" , $.param(params) , function(responseJson)
						{
							var $select = $("#district");
							$select.find("option").remove();
							$.each(responseJson, function(idx, key)
							{
								console.log( key );
								$("<option>").val( key.district_id ).text(key.district).appendTo($select);
					        });
				        });
		});
	});		

	$(document).ready(function(){
		$("#district").on('change', function()		{
			var params = {distid : $(this).val()};
				$.post("${pageContext.request.contextPath}/SelectCommuneServlet" , $.param(params) , function(responseJson)
				{
					var $select = $("#commune");
					$select.find("option").remove();
					$.each(responseJson, function(idx, key)
					{
						console.log( key );
						$("<option>").val( key.commune_id ).text(key.commune).appendTo($select);
					});
				});
		});
	});			

	$(document).ready(function(){
		$("#commune").on('change', function()
		{
			
			var params = {comid : $(this).val()};				
				$.post("${pageContext.request.contextPath}/SelectVillageServlet" , $.param(params) , function(responseJson)
				{
					var $select = $("#village");
					$select.find("option").remove();
					$.each(responseJson, function(idx, key)
					{
						console.log( key );
						$("<option>").val( key.village_id ).text(key.village).appendTo($select);
					});
				});
		});
	});
		
	
	$(document).ready(function(){
		$("#current_province").on('change', function(){
			var params = {proid : $(this).val()};
				$.post("${pageContext.request.contextPath}/ProvinceServlet" , $.param(params) , function(responseJson)
						{
							var $select = $("#current_district");
							$select.find("option").remove();
							$.each(responseJson, function(idx, key)
							{
								console.log( key );
								$("<option>").val( key.district_id ).text(key.district).appendTo($select);
					        });
				        });
		});
	});		

	$(document).ready(function(){
		$("#current_district").on('change', function(){
			var params = {distid : $(this).val()};
				$.post("${pageContext.request.contextPath}/SelectCommuneServlet" , $.param(params) , function(responseJson)
				{
					var $select = $("#current_commune");
					$select.find("option").remove();
					$.each(responseJson, function(idx, key)
					{
						console.log( key );
						$("<option>").val( key.commune_id ).text(key.commune).appendTo($select);
					});
				});
		});
	});		

	$(document).ready(function(){
		$("#current_commune").on('change', function(){			
			var params = {comid : $(this).val()};				
				$.post("${pageContext.request.contextPath}/SelectVillageServlet" , $.param(params) , function(responseJson)
				{
					var $select = $("#current_village");
					$select.find("option").remove();
					$.each(responseJson, function(idx, key){
						console.log( key );
						$("<option>").val( key.village_id ).text(key.village).appendTo($select);
					});
				});
		});
	});
	</script>
  			
  </head>
<body>
    <div class="container body">
      <div class="main_container">      
        <!-- page content -->
        <div>
          <!-- top tiles -->
          <div class="col-md-12 col-sm-12">
          	<div class="x_panel">
	            <div class="x_title">
	              <h2 id="title_student"></h2>
	              <ul class="nav navbar-right panel_toolbox">
	                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                      
	                <li><a class="close-link"><i class="fa fa-close"></i></a></li>
	              </ul>
	              <div class="clearfix"></div>						
	            </div>
   				<form class="registration-form" action="${pageContext.request.contextPath}/AddANewTeacherServlet" Method="POST"  enctype="multipart/form-data" >                    
             <fieldset id ="step_one">             
	             <div class="form-top">
	                 <div class="form-top-left">
	                    <h3><span><i class="fa fa-info-circle"></i> </span> សូមលោកគ្រូ/អ្នកគ្រូបំពេញនូវព័ត៌មានខាងក្រោមឲ្យបានត្រឹមត្រូវ!</h3>
	                 </div>
	              </div>                    
              <div class="form-bottom">
              <div class="row">
	             <%
	           		String teacher_id = TeacherService.getteacherId();	
	           		//String user_id = session.getAttribute("user_id").toString();	             
	           	 %>                                
                  <div class="col-md-9 col-sm-12" id="bordy_top" >
	                  <div class="form-group row" >
	                     <label class="control-label col-md-4 col-sm-3 col-xs-3">អត្តលេខ :</label>
	                        <div class="col-md-8 col-sm-9 col-xs-9">
	                         <input type="text" name="teacher_id" id="teacher_id" value="<%=teacher_id %>" class="form-control" disabled>
	                          <input type="hidden" name="teacher_id" id="teacher_id" value="<%=teacher_id %>">
	                          <input type="hidden" name="user_id" value="">
	                       </div>
	                  </div>
	                      
                      <div class="form-group row" id="bordy_first_name">
                         <label class="control-label col-md-4 col-sm-3 col-xs-3">គោត្តនាម :</label>
                           <div class="col-md-8 col-sm-9 col-xs-9">
                            <small class="text-danger bold italic" id="fname_error"></small>
                           <input type="text" class="form-control" id="first_name" name = "first_name" placeholder= "Teacher_First_Name" autocomplete="off" >
                         </div>
                      </div>
                      
                     <div class="form-group row" id="bordy_last_name" >
                        <label class="control-label col-md-4 col-sm-3 col-xs-3">នាមខ្លួន :</label>
                            <div class="col-md-8 col-sm-9 col-xs-9">
                            <small class="text-danger bold italic" id="lname_error"></small>
                            <input type="text" class="form-control" id="last_name" name="last_name" placeholder ="Teacher_Last_Name" autocomplete="off" >
                        </div>
                     </div>
	                 <div class="form-group row">
	                 	<label class="control-label col-md-4 col-sm-3 col-xs-3">ភេទ :</label>
                       	<div class="col-md-8 col-sm-9 col-xs-9">
                           	<label class="radio inline"> 
                               	<input type="radio" style="height:20px; width:20px; cursor:pointer; vertical-align: middle;" name="gender" value="ប្រុស" checked>
                                <span>ប្រុស</span> 
                            </label>
                           	<label class="radio inline"> 
                                 <input type="radio" style="height:20px; width:20px; cursor:pointer; vertical-align: middle;" name="gender" value="ស្រី">
                                 <span>ស្រី</span> 
                        	</label>
                     	</div>
                     </div>
	                      
	                 <div class="form-group row "  id="bordy_dob">
	                    <label class="control-label col-md-4 col-sm-3 col-xs-3 ">ថ្ងៃខែឆ្នាំកំណើត :</label>
	                        <div class="col-md-8 col-sm-9 col-xs-9 input-error" >
	                            <small class="text-danger bold italic" id="dob_error"></small>
	                                <input type="date"  value ="" class="form-control" id="dob" name="dob" placeholder ="dd/mm/yyyy" autocomplete="off" >
	                           </div>
	                        </div>
                       </div>
                   </div>
           			<center>
           		       <button type="button" class="btn btn-next btn-primary" id="next-1">បន្ទាប់</button>
           		    </center>   
               </div>
               </fieldset>
                    
               <fieldset id ="step_two" >
                   <div class="form-top">
                        <div class="form-top-left">
                           <h3><span><i class="fa fa-map-marker"></i></span>ទីកន្លែងកំណើត</h3>
                        </div>
                   </div>
                   <div class="form-bottom">     
                      <div class="form-group row"  id="bordy_dob">
	                     <label class="control-label col-md-4 col-sm-3 col-xs-3">ប្រទេស :</label>
	                        <div class="col-md-8 col-sm-9 col-xs-9">
	                           <small class="text-danger" id="country_error"></small>
	                               <select class="form-control" id="country" name="country" >
	                             	<option  id ="first-index" class="hidden"  selected disabled value ="0">ជ្រើសរើស ប្រទេស</option>
	                             	<option class="hidden"  value="កម្ពុជា" >កម្ពុជា</option>
	                             	<option class="hidden"  value="ថៃ" >ថៃ</option>
	                             	<option class="hidden"  value="ឡាវ" >ឡាវ</option>
	                                <option class="hidden"  value="វៀតណាម" >វៀតណាម</option>
                            	 </select>
                               <p>   </p>
	                      </div>
	                  </div>
	                       
	                    <div class="form-group row"  id="bordy_dob">
	                         <label class="control-label col-md-4 col-sm-3 col-xs-3">ខេត្ត/ក្រុង :</label>
	                             <div class="col-md-8 col-sm-9 col-xs-9">
	                                <small class="text-danger" id="province_error"></small>
	                                   <select class="form-control" id="province" name="province" >
	                             	     <option id ="province-index" class="hidden"  selected disabled value ="0" >ជ្រើសរើស ខេត្ត</option>
	                                	<%
	                            		   ArrayList<ProvinceBean >ListPro= ProvinceService.p_listAllProvince();
				                      		for(ProvinceBean pb : ListPro)
					                      	{
					                      		 out.print("<option value='"+ pb.getPro_id()+"'>" + pb.getProvince() + "</option>");
					                      	}
			                      		%>
                            	   </select>
	                          </div>
	                      </div>                               
                             
                        <div class="form-group row"  id="bordy_dob">
	                        <label class="control-label col-md-4 col-sm-3 col-xs-3">ស្រុក/ខណ្ឌ :</label>
	                            <div class="col-md-8 col-sm-9 col-xs-9">
	                               <small class="text-danger" id="district_error"></small>
	                                  <select class="form-control" id="district" name="district"  >
	                             	<option id ="district-index" class="hidden"  selected disabled value ="0" >ជ្រើសរើស ស្រុក</option>
                            	</select>
	                          </div>
	                     </div>	                     
	                       
                       <div class="form-group row"  id="bordy_dob">
	                       <label class="control-label col-md-4 col-sm-3 col-xs-3">ឃុំ/សង្កាត់:</label>
	                          <div class="col-md-8 col-sm-9 col-xs-9">
	                              <small class="text-danger" id="commune_error"></small>
	                                 <select class="form-control" id="commune" name="commune" >
	                              <option  id ="commune-index" class="hidden"  selected disabled value ="0" >ជ្រើសរើស ឃុំ</option>
                               </select>
	                        </div>
	                     </div>
	                     
                         <div class="form-group row"  id="bordy_dob">
	                        <label class="control-label col-md-4 col-sm-3 col-xs-3">ភូមិ :</label>
	                           <div class="col-md-8 col-sm-9 col-xs-9">
	                             <small class="text-danger" id="village_error"></small>
	                                <select class="form-control" id="village" name="village_id" >
	                             <option  id ="village-index" class="hidden"  selected disabled value ="0" >ជ្រើសរើស ភូមិ</option>
                            	</select>
	                        </div>
	                     </div>
							<center>
	                            <button type="button" class="btn btn-previous btn-danger" id="previous-1">ត្រឡប់</button>
	                            <button type="button" class="btn btn-next btn-primary" id="next-2">បន្ទាប់</button>
                            </center>
                        </div>
          </fieldset>
          <fieldset id ="step_tree">
                  <div class="form-top">
                  		<div class="form-top-left">
                           <h3><span><i class="fa fa-map-marker"></i></span>	ទីលំនៅបច្ចុប្បន្ន</h3>
                        </div>
                   </div>
                   <div class="form-bottom">   
	                    <div class="form-group row"  id="bordy_dob">
	                         <label class="control-label col-md-4 col-sm-3 col-xs-3">ខេត្ត/ក្រុង :</label>
	                             <div class="col-md-8 col-sm-9 col-xs-9">
	                                <small class="text-danger" id="current_province_error"></small>
	                                   <select class="form-control" id="current_province" name="current_province" >
	                             	     <option id ="current-province-index" class="hidden"  selected disabled value="0" >ជ្រើសរើស</option>
	                                	<%
	                            		   ArrayList<ProvinceBean >ListPr= ProvinceService.p_listAllProvince();
				                      		for(ProvinceBean pb : ListPr){
					                      		 out.print("<option value='"+ pb.getPro_id()+"'>" + pb.getProvince() + "</option>");
					                      	}
			                      		%>
                            	   </select>
	                          </div>
	                      </div>                               
                               
                        <div class="form-group row"  id="bordy_dob">
	                        <label class="control-label col-md-4 col-sm-3 col-xs-3">ស្រុក/ខណ្ឌ :</label>
	                            <div class="col-md-8 col-sm-9 col-xs-9">
	                               <small class="text-danger" id="current_district_error"></small>
	                                  <select class="form-control" id="current_district" name="current_district" >
	                             	<option  id ="current-district-index" class="hidden"  selected disabled value= "0">ជ្រើសរើស</option>
                            	</select>
	                          </div>
	                     </div>	                     
	                       
                       <div class="form-group row"  id="bordy_dob">
	                       <label class="control-label col-md-4 col-sm-3 col-xs-3">ឃុំ/សង្កាត់ :</label>
	                          <div class="col-md-8 col-sm-9 col-xs-9">
	                              <small class="text-danger" id="current_commune_error"></small>
	                                 <select class="form-control" id="current_commune" name="current_commune" >
	                              <option class="hidden"  selected disabled value="0" >ជ្រើសរើស</option>
                               </select>
	                        </div>
	                     </div>
	                     
                         <div class="form-group row"  id="bordy_dob">
	                        <label class="control-label col-md-4 col-sm-3 col-xs-3">ភូមិ :</label>
	                           <div class="col-md-8 col-sm-9 col-xs-9">
	                             <small class="text-danger" id="current_village_error"></small>
	                                <select class="form-control" id="current_village" name="current_village" >
	                             <option id="current-village-index" class="hidden"  selected disabled value="0" >ជ្រើសរើស</option>
                            	</select>
	                        </div>
	                     </div>
						<center>								
							<button type="button" class="btn btn-previous btn-danger" id='previous-2'>ត្រឡប់</button>
                            <button type="button" class="btn btn-next btn-primary"  id="next-3" >បន្ទាប់</button>
						</center>                            
                 </div> 
        </fieldset>                    
                    
        <fieldset id="step_four" >        
                    <div class="form-top">
                        <div class="form-top-left">
                           <h3><span><i class="fa fa-calendar-check-o"></i></span>ព័ត៌មានផ្ទាល់ខ្លួន</h3>
                        </div>
                    </div>
                   <div class="form-bottom">	                
		               <div class="form-group row">
		                     <label class="control-label col-md-4 col-sm-3 col-xs-3">លេខទូរស័ព្ទ :</label>
		                         <div class="col-md-8 col-sm-9 col-xs-9">
		                           <small class="text-danger" id="phone_number_error"></small>
		                          <input type="text" class="form-control" id="phone_number" name="phone_number" placeholder ="Teacher_Phone_Number" autocomplete="off">
		                     </div>
		                </div>
		                      
		                <div class="form-group row"  id="bordy_dob">
	                         <label class="control-label col-md-4 col-sm-3 col-xs-3">ជនជាតិ :</label>
	                         <div class="col-md-8 col-sm-9 col-xs-9">
	                         	<small class="text-danger" id="nationality_error"></small>
                                     <select class="form-control" id="nationality" name="nationality" >
                             	        <option id ="nationality-index" class="hidden"  selected disabled value="0" >សូមជ្រើសរើស ជនជាតិ</option>
                             	      	<option class="hidden"  value="ខ្មែរ">​ខ្មែរ</option>
                             	   		<option class="hidden"  value="ថៃ">​ថៃ​​ </option>
                             	   		<option class="hidden"  value="ថៃ">​ បារាំង</option>
                             	   		<option class="hidden"  value="ថៃ">​ ចិន</option>
                           	   		</select>
	                           </div>
	                     </div>	                  
                            
		                 <div class="form-group row" id="bordy_passport_no">
		                    <label class="control-label col-md-4 col-sm-3 col-xs-3"> លេខអត្តសញ្ញាណប័ណ្ណ:</label>
		                        <div class="col-md-8 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="nationality_id_error"></small>
		                        <input type="text" class="form-control" id="nationality_id" name="nationality_id" placeholder ="Natoinality Id" autocomplete="off">
		                     </div>
		                 </div>
		                 
		                  <div class="form-group row" id="bordy_stutus">
		                      	<label class="control-label col-md-4 col-sm-3 col-xs-3"> ស្ថានភាពគ្រួសារ:</label>
		                      	<div class="col-md-8 col-sm-9 col-xs-9">
		                        	<small class="text-danger" id="status_error"></small>
		                          	<select class="form-control" id="status" name="status" >
		                             	<option id ="status-index" class="hidden"  selected disabled value="0" >សូមជ្រើសរើស </option>
		                             	<option class="hidden"  value="នៅលីវ">នៅលីវ</option>
		                             	<option class="hidden"  value="រៀបការរួច">រៀបការរួច</option>		                             
                            	  	</select>
		                       </div>
		                    </div>    
                               
                          <div class="form-group row">
		                      <label class="control-label col-md-4 col-sm-3 col-xs-3">រូបថត</label>
		                         <div class="col-md-8 col-sm-9 col-xs-9">
		                            <div class="form-group">
		                                <small class="text-danger" id="customFile_error"></small>
                                      	<img alt="register_photo" src="../../images/Avatar/register_avatar.jpg" name="photo" id="show_photo" width="130px" height="147px" style="border:1px solid gray; border-radius:2px !important;">
                                    </div>
                                	<div class="custom-file mb-3">                                	   
								      	<input type="file" class="custom-file-input" id="customFile" name="file" onchange="readDisplayUrl(this);" value="0" >
								   	 	<label class="custom-file-label" id="customFile-index" for="customFile" >ជ្រើរើស</label>
		                          	</div>
		                       </div>
		                   </div>
		                   
                               <center>
                               		<button type="button" class="btn btn-previous btn-danger" id="previous-3">ត្រឡប់</button>
                                    <button type="submit" class="btn btn-next btn-primary" id="next-4" >បន្ទាប់</button>
                               </center>
                        </div>
                	</fieldset>                       
                </form>
            </div>
        </div>
    </div>      
           </div>
      
      </div>
    <script src="../../js/custom_js/teacher/ValidationAddTeacher.js"></script>
	<script src="../../js/custom_js/Input_Show_Image.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <script src="../../js/custom.min.js"></script>
    <script src="../../js/toastr.min.js"></script>
   	<script src="../../js/sweetalert2.min.js"></script>
   	<script src="../../js/custom_js/PopupMessage.js"></script>
   	<%
		if( session.getAttribute("code") != null ){
			String msg = session.getAttribute("code").toString();
			if( msg.equalsIgnoreCase("Error")){				
			%>	
				<script type="text/javascript">
					toastr.error('Your registration failed! try again!')
				</script>
			<% 	
			}
			else{				
			%>	
				<script type="text/javascript">
					$(document).ready(function() {
					     toastr.success('Your registration was successfully!')
					 });
				</script>
			<% 	
			}
		}
	    session.removeAttribute("code");
	%>
</body>
</html>