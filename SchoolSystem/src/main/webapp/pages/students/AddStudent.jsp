<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.ProvinceBean" %>
<%@ page import="db.services.ProvinceService" %>
<%@ page import="bean.StudentBean" %>
<%@ page import="db.services.StudentService" %>
<%@ page import="bean.UserBean" %>
<%@ page import="db.services.UserService" %>
<%@ page import="bean.GuardianBean" %>
<%@ page import="db.services.GuardianService" %>

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
    <link href="../../css/toastr.min.css" rel="stylesheet">
	<link href="../../css/sweetalert2.min.css" rel="stylesheet">  
    <script src="../../js/popper.min.js"></script>
     <!-- jQuery -->
    <script src="../../js/jquery.min.js"></script>  
    <!-- Select Address -->
    <script>
	    $(document).ready(function(){
			$("#province").on('change', function(){
				//alert("Was change value");
				var params = {proid : $(this).val()};//proid got value from $(this).val()
				//alert($(this).val());
					//coding to pass proid to servlet
					//params is object
				$.post("${pageContext.request.contextPath}/ProvinceServlet" , 
					$.param(params) , function(responseJson){
						var $select = $("#district");
						$select.find("option").remove();
						$.each(responseJson, function(idx, key){
							console.log( key );
							$("<option>").val( key.district_id ).text(key.district).appendTo($select);
						});
					});
			});
		});
		
		$(document).ready(function(){
			$("#district").on('change', function(){				
				var params = {distid : $(this).val()};			
				$.post("${pageContext.request.contextPath}/SelectCommuneServlet" , $.param(params) , function(responseJson){
					var $select = $("#commune");
					$select.find("option").remove();
					$.each(responseJson, function(idx, key){
						console.log( key );
						$("<option>").val( key.commune_id ).text(key.commune).appendTo($select);
					});
				});
			});
		});
	
		$(document).ready(function(){
			$("#commune").on('change', function(){				
				var params = {comid : $(this).val()};				
				$.post("${pageContext.request.contextPath}/SelectVillageServlet" , $.param(params) , function(responseJson){
					var $select = $("#village");
					$select.find("option").remove();
					$.each(responseJson, function(idx, key){
						console.log( key );
						$("<option>").val( key.village_id ).text(key.village).appendTo($select);
					});
				});
			});
		});
	
		$(document).ready(function(){
			$("#province_id").on('change', function(){				
				var params = {proid : $(this).val()};				
				$.post("${pageContext.request.contextPath}/ProvinceServlet" , $.param(params) , function(responseJson){
					var $select = $("#district_id");
					$select.find("option").remove();
					$.each(responseJson, function(idx, key){
						console.log( key );
						$("<option>").val( key.district_id ).text(key.district).appendTo($select);
					});
				});
			});
		});
	
		$(document).ready(function(){
			$("#district_id").on('change', function(){				
				var params = {distid : $(this).val()};				
				$.post("${pageContext.request.contextPath}/SelectCommuneServlet" , $.param(params) , function(responseJson){
					var $select = $("#commune_id");
					$select.find("option").remove();
					$.each(responseJson, function(idx, key){
						console.log( key );
						$("<option>").val( key.commune_id ).text(key.commune).appendTo($select);
					});
				});
			});
		});
		
		$(document).ready(function(){
			$("#commune_id").on('change', function(){				
				var params = {comid : $(this).val()};				
				$.post("${pageContext.request.contextPath}/SelectVillageServlet" , $.param(params) , function(responseJson){
					var $select = $("#village_id");
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
	<div class="container">

    	<div class="main_container">	    	
        	<!-- page content -->
	        <div class="col-md-12 col-sm-12  ">
            	<div class="x_panel">
                	<div class="x_title text-center">
                    	<h2 style="font-family:Khmer OS Muol Light;" class="p-1">សូមបំពេញព័ត៌មានខាងក្រោមឲ្យបានត្រឹមត្រូវ!</h2>	                    	
                    	<div class="clearfix"></div>		                    
                  	</div>
                  	<div class="x_content">
                  	<br>
                    	<form class="form-horizontal form-label-left" action="${pageContext.request.contextPath}/AddANewStudent" method="POST" enctype="multipart/form-data">
	                    	<div class="col-md-6 col-sm-12">
	                      		<div class="form-group row">
	                        		<label class="control-label col-md-3 col-sm-3 col-xs-3">អត្តលេខ :</label>
			                        <div class="col-md-9 col-sm-9 col-xs-9">
			                        	<%
			                        		String student_id = StudentService.getNewId();
			                        		String guardian_id  = GuardianService.getNewId();
			                        		String user_id = session.getAttribute("user_id").toString();
			                        	%>
			                          <input type="text" value="<%=student_id %>" class="form-control" disabled>
			                          <input type="hidden" name="student_id" value="<%=student_id %>">	
			                          <input type="hidden" name="guardain_id" value="<%=guardian_id %>">
			                          <input type="hidden" name="user_id" value="<%=user_id%>">				                          
			                        </div>
	                      		</div>
	                      		<div class="form-group row">
	                        		<label class="control-label col-md-3 col-sm-3 col-xs-3">នាមត្រកូល :</label>
			                        <div class="col-md-9 col-sm-9 col-xs-9">
			                          <input type="text" name="first_name" class="form-control">
			                        </div>
	                      		</div>
		                      	<div class="form-group row">
		                        	<label class="control-label col-md-3 col-sm-3 col-xs-3">នាមខ្លួន :</label>
		                        	<div class="col-md-9 col-sm-9 col-xs-9">
		                          		<input type="text" name="last_name" class="form-control">
		                        	</div>
		                      	</div>
		                      	<div class="form-group row">
				                 	<label class="control-label col-md-3 col-sm-3 col-xs-3">ភេទ :</label>
			                       	<div class="col-md-3 col-sm-3 col-xs-3">
			                           	<label class="radio inline"> 
			                               	<input type="radio" style="height:20px; width:20px; cursor:pointer; vertical-align: middle;" name="gender" value="ប្រុស" checked>
			                                <span>ប្រុស</span> 
			                            </label>
			                           	<label class="radio inline"> 
			                                 <input type="radio" style="height:20px; width:20px; cursor:pointer; vertical-align: middle;" name="gender" value="ស្រី">
			                                 <span>ស្រី</span> 
			                        	</label>
			                     	</div>
			                     	<label class="control-label col-md-2 col-sm-2 col-xs-2">ជនជាតិ :</label>
				                    <div class="col-md-4 col-sm-4 col-xs-4">
				                    	<input type="text" name="nationality" class="form-control">
				                    </div>
			                     </div>
		                      	
		                      	<div class="form-group row">
			                        <label class="control-label col-md-3 col-sm-3 col-xs-3">ថ្ងៃខែឆ្នាំកំណើត :</label>
			                        <div class="col-md-9 col-sm-9 col-xs-9">
			                          <input type="date" name="dob" class="form-control">
			                        </div>
		                      	</div>
		                      	<div class="form-group row">
			                    	<h4 class="control-label col-md-12 col-sm-12 col-xs-12 bg-secondary text-white text-center p-1">ទីកន្លែងកំណើត :</h4>
			                        <label class="control-label col-md-3 col-sm-3 col-xs-3">ខេត្ត/រាជធានី :</label>
			                        <div class="col-md-9 col-sm-9 col-xs-9">
		                            	<select class="form-control" id="province">
		                            		<option class="hidden"  selected disabled>ជ្រើសរើស ខេត្ត/រាជធានី</option>
			                                <%
					                      		ArrayList<ProvinceBean> ListPro = ProvinceService.p_listAllProvince();
					                      		for(ProvinceBean pb : ListPro){
					                      			out.print("<option value='"+ pb.getPro_id()+"'>" + pb.getProvince() + "</option>");
					                      		}
			                      			%>
				                        </select>
			                        </div>
		                      	</div>
		                      	<div class="form-group row">
	                      			<label class="col-md-3 col-sm-3 col-xs-3">ស្រុក/ក្រុង/ខណ្ឌ :</label>
	                      			<div class="col-md-9 col-sm-9 col-xs-9">
	                      				<select class="form-control" id="district" name="pob_district">
	                                		<option class="hidden"  selected disabled>ជ្រើសរើស ស្រុក/ក្រុង/ខណ្ឌ </option>
	                            		</select>
	                      			</div>
	                      		</div>
	                      		<div class="form-group row">
	                      			<label class="col-md-3 col-sm-3 col-xs-3">ឃុំ/សង្កាត់ :</label>
	                      			<div class="col-md-9 col-sm-9 col-xs-9">
	                      				<select class="form-control" id="commune" name="pob_commune">
	                                		<option class="hidden"  selected disabled>ជ្រើសរើស  ឃុំ/សង្កាត់</option>
	                            		</select>
	                      			</div>
	                      		</div>
	                      		<div class="form-group row">
	                      			<label class="col-md-3 col-sm-3 col-xs-3">ភូមិ :</label>
	                      			<div class="col-md-9 col-sm-9 col-xs-9">
	                      				<select class="form-control" id="village" name="pob_village">
	                                		<option class="hidden"  selected disabled>ជ្រើសរើស ភូមិ</option>
	                            		</select>
	                      			</div>
	                      		</div>
	                    	</div>
	                      	<div class="col-md-6 col-sm-12">
	                        	<div class="form-group row">
	                        		<h4 class="control-label col-md-12 col-sm-12 col-xs-12 bg-secondary text-white text-center p-1">ទីលំនៅបច្ចុប្បន្ន :</h4>
	                        		<label class="control-label col-md-3 col-sm-3 col-xs-3">ខេត្ត/រាជធានី :</label>
	                        		<div class="col-md-9 col-sm-9 col-xs-9">
		                            	<select class="form-control" id="province_id" name="current_province">
		                            		<option class="hidden"  selected disabled>ជ្រើសរើស ខេត្ត/រាជធានី</option>
			                                <%
					                      		ArrayList<ProvinceBean> ListP = ProvinceService.p_listAllProvince();
					                      		for(ProvinceBean pb : ListP){
					                      			out.print("<option value='"+ pb.getPro_id()+"'>" + pb.getProvince() + "</option>");
					                      		}
			                      			%>
				                        </select>
	                        		</div>
	                      		</div>
		                      	<div class="form-group row">
	                      			<label class="col-md-3 col-sm-3 col-xs-3">ស្រុក/ក្រុង/ខណ្ឌ :</label>
	                      			<div class="col-md-9 col-sm-9 col-xs-9">
	                      				<select class="form-control" id="district_id" name="current_district">
	                                		<option class="hidden"  selected disabled>ជ្រើសរើស ស្រុក/ក្រុង/ខណ្ឌ </option>
	                            		</select>
	                      			</div>
	                      		</div>
	                      		<div class="form-group row">
	                      			<label class="col-md-3 col-sm-3 col-xs-3">ឃុំ/សង្កាត់ :</label>
	                      			<div class="col-md-9 col-sm-9 col-xs-9">
	                      				<select class="form-control" id="commune_id" name="current_commune">
	                                		<option class="hidden"  selected disabled>ជ្រើសរើស  ឃុំ/សង្កាត់</option>
	                            		</select>
	                      			</div>
	                      		</div>
	                      		<div class="form-group row">
	                      			<label class="col-md-3 col-sm-3 col-xs-3">ភូមិ :</label>
	                      			<div class="col-md-9 col-sm-9 col-xs-9">
	                      				<select class="form-control" id="village_id" name="current_village">
	                                		<option class="hidden"  selected disabled>ជ្រើសរើស ភូមិ</option>
	                            		</select>
	                      			</div>
	                      		</div>					                      
			                  	<div class="form-group row">
		                        	<label class="control-label col-md-3 col-sm-3 col-xs-3">លេខទូរស័ព្ទ :</label>
		                        	<div class="col-md-9 col-sm-9 col-xs-9">
		                          		<input type="text" id="phone" name="phone_number" class="form-control">
		                        	</div>
			                        <script>
										$("#phone").on("keyup blur", function() {
											var phone=$('#phone').val();
											var ph_filter = /^[0-9-+]+$/;															
											if(phone==""){
												$('#phone').css('color','red');
												$('#phone').focus();																
												return false;
											}
											if(!ph_filter.test(phone)){
												$('#phone').css('color','red');
												$('#phone').focus();																
												return false;
											}
											if(phone.length < 9 || phone.length > 10){
												$('#phone').css('color','red');
												$('#phone').focus();
												return false;
											}else{
												$('#phone').css('color','green');
												return true;
											}
										});													 
									</script>
			                  	</div>		                      	
		                      	<div class="form-group row">
		                        	<label class="control-label col-md-3 col-sm-3 col-xs-3">រូបថត</label>
		                        	<div class="col-md-6 col-sm-9 col-xs-9">
		                          		<div class="form-group">
                                      		<img alt="register_photo" src="../../images/Avatar/icon.jpg" name="photo" id="show_photo" width="130px" height="147px" style="border:1px solid gray; border-radius:2px !important;">
                                  		</div>
                                		<div class="custom-file mb-3">
								    		<input type="file" class="custom-file-input" id="customFile" name="file" onchange="readDisplayUrl(this);">
								   	 		<label class="custom-file-label" for="customFile">ជ្រើសរើសរូបថត *</label>
		                       			</div>
		                      		</div>
		                      	</div>
		                      	<br>
		                      	<div class="form-group row">
		                        	<div class="col-md-9 col-sm-9 col-xs-9 offset-md-3">
		                        		<a href="../../view/detail/ListStudents" class="btn btn-primary">Back</a>
		                          		<button type="submit" class="btn btn-success">Submit</button>
		                        	</div>
		                      	</div>
	                      	</div>
                    	</form>
                  	</div>
                </div>
        	</div>
        	<!-- /page content -->        
        <!-- /footer content -->
    	</div>
    </div>
	<script>
	     function readDisplayUrl(input){
	     	if(input.files && input.files[0]){
	     		var reader = new FileReader();
	     		reader.onload = function(e){
	     			$('#show_photo').attr('src', e.target.result)
	     		};
	     		reader.readAsDataURL( input.files[0] );
	     	}
	     }
	</script>	
	<script>
		// the following code show the name of the file appear on select
		$(".custom-file-input").on("change", function() {
		  var fileName = $(this).val().split("\\").pop();
		  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
		});
	</script>
	
	<script src="../../js/jquery.min.js"></script>
	<script src="../../js/chosen.jquery.min.js"></script>  
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
	<%
		if( session.getAttribute("code") != null ){
			String msg = session.getAttribute("code").toString();
			if( msg.equalsIgnoreCase("F")){				
			%>	
				<script type="text/javascript">
					toastr.error('Insert Failed!')
				</script>
			<% 	
			}
			else{				
			%>	
				<script type="text/javascript">
					$(document).ready(function() {
					     toastr.success('Insert Successfully!')
					 });
				</script>
			<% 	
			}
		}
	    session.removeAttribute("code");
	%>
</body>
</html>