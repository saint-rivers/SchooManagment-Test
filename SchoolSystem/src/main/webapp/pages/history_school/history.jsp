<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="bean.SubjectCategoryBean" %> 
     <%@ page import="db.services.SubjectCategoryService" %> 
     <%@ page import="java.util.ArrayList" %>

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
   				<form class="registration-form" action="${pageContext.request.contextPath}/" Method="POST"  enctype="multipart/form-data" >                    
             <fieldset id ="step_one">             
	             <div class="form-top">
	                 <div class="form-top-left">
	                    <h3><span><i class="fa fa-info-circle"></i> </span>សូមបញ្ចូលឈ្មោះសាលា</h3>
	                 </div>
	              </div>                    
              <div class="form-bottom">
              <div class="row">
	             <%
	           		//String teacher_id = TeacherService.getteacherId();	
	           		//String user_id = session.getAttribute("user_id").toString();	 
	           		String id = request.getParameter("id");
	           		
	           	 %>                                
                  <div class="col-md-9 col-sm-12" id="bordy_top" >
	             
                      <div class="form-group row" id="bordy_first_name">
                         <label class="control-label col-md-4 col-sm-3 col-xs-3">ឈ្មោះសាលា </label>
                           <div class="col-md-8 col-sm-9 col-xs-9">
                            <small class="text-danger bold italic" id="schoolname_error"></small>
                           <input type="text" class="form-control" id="school_name" name = "school_name" placeholder= "School_First_Name" autocomplete="off" >
                         </div>
                      </div>
                      
                     <div class="form-group row" id="bordy_last_name" >
                        <label class="control-label col-md-4 col-sm-3 col-xs-3">សូមជ្រើសរើសប្រភេទសាលា :</label>
                            <div class="col-md-8 col-sm-9 col-xs-9">
                             	     	<select class="form-control" name="category_id">
                             	     	<option class="form-control" name="category_id"  selected disabled value="0" >ជ្រើសប្រភេទនៃសាលា</option>
                                     <%
                                      ArrayList<SubjectCategoryBean> ListSCB = SubjectCategoryService.p_listAllCategory() ;
                                      for(SubjectCategoryBean scb : ListSCB){
                                      	out.print("<option value='" + scb.getCategory_id() + "'>" + scb.getCategory_name() + "</option>");
                                      }
                                     %>
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
           		       <button type="button" class="btn btn-next btn-primary" id="next-1">បន្ទាប់</button>
           		    </center>   
               </div>
               </fieldset>
            
                 
                    
        <fieldset id="step_four" >        
                    <div class="form-top">
                        <div class="form-top-left">
                           <h3><span><i class="fa fa-calendar-check-o"></i></span>សូមបំពេញប្រវត្តិសាលា</h3>
                        </div>
                    </div>
                   <div class="form-bottom">	                
		               <div class="form-group row">
		                     <label class="control-label col-md-4 col-sm-3 col-xs-3"> :</label>
		                         <div class="col-md-8 col-sm-9 col-xs-9">
		                           <small class="text-danger" id="phone_number_error"></small>
		                          <input type="date" class="form-control" id="date_start" name="date_start" placeholder ="Date_start_school" autocomplete="off">
		                     </div>
		                </div>
		                      
		                <div class="form-group row"  id="bordy_dob">
	                         <label class="control-label col-md-4 col-sm-3 col-xs-3">ឈ្មោះអ្នកកសាង  :</label>
	                         <div class="col-md-8 col-sm-9 col-xs-9">
	                         	<small class="text-danger" id="school_name_buil_error"></small>
                                     <input type="text" class="form-control" id="school_name_buil" name="chool_name_bui" placeholder ="School_name_buil" autocomplete="off">
	                           </div>
	                     </div>	                  
                            
		                 <div class="form-group row" id="bordy_passport_no">
		                    <label class="control-label col-md-4 col-sm-3 col-xs-3"> រយះពេលនៃកាកសាង :</label>
		                        <div class="col-md-8 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="date_buil_error"></small>
		                        <input type="text" class="form-control" id="date_buil" name="date_buil" placeholder ="Date_buil" autocomplete="off">
		                     </div>
		                 </div>
		                 
							<div class="form-group row" id="bordy_passport_no">
		                    <label class="control-label col-md-4 col-sm-3 col-xs-3"> បញ្ចប់ការកាកសាង :</label>
		                        <div class="col-md-8 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="date_buil_error"></small>
		                        <input type="date" class="form-control" id="end_date_buil" name="end_date_buil" placeholder ="End_Date_buil" autocomplete="off">
		                     </div>
		                 </div>
                               <center>
                               		<button type="button" class="btn btn-previous btn-danger" id="previous-1">ត្រឡប់</button>
                                    <button type="submit" class="btn btn-next btn-primary" id="next-2" >បន្ទាប់</button>
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