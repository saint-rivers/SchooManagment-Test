<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.ProvinceBean" %>
<%@ page import="bean.DistrictBean" %>
<%@ page import="bean.CommuneBean" %>
<%@ page import="bean.VillageBean" %>
<%@ page import="bean.StudentBean" %>
<%@ page import="db.services.ProvinceService" %>
<%@ page import="db.services.StudentService" %>
<%@ page import="db.services.DistrictService" %>  
<%@ page import="db.services.CommuneService" %>
<%@ page import="db.services.VillageService" %> 
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
	<link rel="icon" href="images/favicon.ico" type="image/ico" />
    <title>LMS</title>
    <!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../../css/font-awesome.min.css" rel="stylesheet">
    <link href="../../webcss/all.min.css" rel="stylesheet"> <!--load all styles -->
    <!-- Custom Theme Style -->
    <link href="../../css/custom.min.css" rel="stylesheet">
    <!-- Alert message pop up -->
    <link href="../../css/toastr.min.css" rel="stylesheet">
	<link href="../../css/sweetalert2.min.css" rel="stylesheet">
     <!-- jQuery -->
    <script src="../../js/jquery.min.js"></script>   
    <script src="../../js/popper.min.js"></script>
     <!-- log screen --> 
    <script src="../../js/custom_js/lock_screen.js"></script>
    <!-- Select Address -->
    <script>
	    $(document).ready(function(){
			$("#province").change(function(){
				//alert("Was change value");
				var params = {proid : $(this).val()};//proid got value from $(this).val()
				//alert($(this).val());
					//coding to pass proid to servlet
					//params is object
					$.post("${pageContext.request.contextPath}/ProvinceServlet" , $.param(params) , function(responseJson){
						var $select = $("#district");
						$select.find("option").remove();
						$.each(responseJson, function(index, key){
							console.log( key );
							$("<option>").val( key.district_id ).text(key.district).appendTo($select);
						});
					});
			});
		});
		
		$(document).ready(function(){
			$("#district").change(function(){
				var params = {distid : $(this).val()};//proid got value from $(this).val()
					$.post("${pageContext.request.contextPath}/SelectCommuneServlet" , $.param(params) , function(responseJson){
						var $select = $("#commune");
						$select.find("option").remove();
						$.each(responseJson, function(index, key){
							console.log( key );
							$("<option>").val( key.commune_id ).text(key.commune).appendTo($select);
						});
					});
			});
		});
	
		$(document).ready(function(){
			$("#commune").change(function(){
				var params = {comid : $(this).val()};//proid got value from $(this).val()
					$.post("${pageContext.request.contextPath}/SelectVillageServlet" , $.param(params) , function(responseJson){
						var $select = $("#village");
						$select.find("option").remove();
						$.each(responseJson, function(index, key){
							console.log( key );
							$("<option>").val( key.village_id ).text(key.village).appendTo($select);
						});
					});
			});
		});
	
		$(document).ready(function(){
			$("#province_id").change(function(){
				var params = {proid : $(this).val()};//proid got value from $(this).val()
					$.post("${pageContext.request.contextPath}/ProvinceServlet" , $.param(params) , function(responseJson){
						var $select = $("#district_id");
						$select.find("option").remove();
						$.each(responseJson, function(index, key){
							console.log( key );
							$("<option>").val( key.district_id ).text(key.district).appendTo($select);
						});
					});
			});
		});
	
		$(document).ready(function(){
			$("#district_id").on('change', function(){
				var params = {distid : $(this).val()};//proid got value from $(this).val()
					$.post("${pageContext.request.contextPath}/SelectCommuneServlet" , $.param(params) , function(responseJson){
						var $select = $("#commune_id");
						$select.find("option").remove();
						$.each(responseJson, function(index, key){
							console.log( key );
							$("<option>").val( key.commune_id ).text(key.commune).appendTo($select);
						});
					});
			});
		});
	
	
		$(document).ready(function(){
			$("#commune_id").on('change', function(){
				var params = {comid : $(this).val()};//proid got value from $(this).val()
					$.post("${pageContext.request.contextPath}/SelectVillageServlet" , $.param(params) , function(responseJson){
						var $select = $("#village_id");
						$select.find("option").remove();
						$.each(responseJson, function(index, key){
							console.log( key );
							$("<option>").val( key.village_id ).text(key.village).appendTo($select);
						});
					});
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
          <!-- top tiles -->
          <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2 id="title_student" class="p-1">កែប្រែព័ត៌មានរបស់សិស្ស</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                    </ul>
                    <div class="clearfix"></div>
                    <%
                    	String id = request.getParameter("id");
                    	StudentBean sb = StudentService.getAStudentUpdate(id);
                    %>
                  </div>
                  <div class="x_content">
                  <br>
                    <form class="form-horizontal form-label-left" action="${pageContext.request.contextPath}/UpdateAStudentServlet" method="POST" enctype="multipart/form-data">
	                    <div class="col-md-6 col-sm-12">
	                      <div class="form-group row">
	                        <label class="control-label col-md-3 col-sm-3 col-xs-3">អត្តលេខ :</label>
	                        <div class="col-md-9 col-sm-10 col-xs-10">
	                          <input type="text" value="<%=sb.getStudent_id() %>" class="form-control" disabled>
	                          <input type="hidden" name="student_id" value="<%=sb.getStudent_id() %>" class="form-control">
	                        </div>
	                      </div>
	                      <div class="form-group row">
	                        <label class="control-label col-md-3 col-sm-3 col-xs-3">នាមត្រកូល :</label>
	                        <div class="col-md-9 col-sm-9 col-xs-9">
	                          <input type="text" name="first_name" value="<%=sb.getFirst_name() %>" class="form-control">
	                        </div>
	                      </div>
	                      <div class="form-group row">
	                        <label class="control-label col-md-3 col-sm-3 col-xs-3">នាមខ្លួន :</label>
	                        <div class="col-md-9 col-sm-9 col-xs-9">
	                          <input type="text" name="last_name" value="<%=sb.getLast_name() %>" class="form-control">
	                        </div>
	                      </div>
	                      <div class="form-group row">
	                        <label class="control-label col-md-3 col-sm-3 col-xs-3">ភេទ :</label>
	                        <div class="col-md-3 col-sm-3 col-xs-3">
	                          <select class="form-control" name="gender">
	                          	<%
	                          		ArrayList<StudentBean> listGender = StudentService.getStudentGender();
	                          		for(StudentBean sbG : listGender){
	                          			if(sb.getGender().equalsIgnoreCase(sbG.getGender())){
	                          				out.print("<option value='" + sbG.getGender() + "' selected>" + sbG.getGender() + "</option>");
	                          			}else{
	                          				out.print("<option value='" + sbG.getGender() + "'>" + sbG.getGender() + "</option>");
	                          			}
	                          		}
	                          	%>
	                          </select>
	                        </div>
	                        <label class="control-label col-md-2 col-sm-2 col-xs-2">ជនជាតិ :</label>
		                      <div class="col-md-4 col-sm-4 col-xs-4">
		                         <input type="text" name="nationality" value="<%=sb.getNationality() %>" class="form-control">
		                      </div>
	                      </div>
	                      <div class="form-group row">
	                        <label class="control-label col-md-3 col-sm-3 col-xs-3">ថ្ងៃខែឆ្នាំកំណើត :</label>
	                        <div class="col-md-9 col-sm-9 col-xs-9">
	                          <input type="text" name="dob" value="<%=sb.getDob() %>" class="form-control">
	                        </div>
	                      </div>
	                      
	                      <div class="form-group row">
	                        <h4 class="control-label col-md-12 col-sm-12 col-xs-12 text-center bg-secondary text-white">ទីកន្លែងកំណើត :</h4>
	                        <label class="control-label col-md-3 col-sm-3 col-xs-3">ខេត្ត/រាជធានី:</label>
	                        <div class="col-md-9 col-sm-9 col-xs-9">
	                        	<select class="form-control" id="province" name="pob_province" >
                                	<%
                                		ArrayList<ProvinceBean> listP = ProvinceService.p_listAllProvince();
                                		for(ProvinceBean pb : listP){                                			
                                			if(sb.getAb().getProvince_id() == pb.getPro_id()){
                                				out.print("<option value='" + pb.getPro_id() + "' selected>" + pb.getProvince() + "</option>");
                                			}else{
                                				out.print("<option value='" + pb.getPro_id() + "'>" + pb.getProvince() + "</option>");
                                			}
                                		}
                                	%>
                            	</select>
	                        </div>
	                      </div>
	                      <div class="form-group row">
	                        <label class="control-label col-md-3 col-sm-3 col-xs-3">ស្រុក /ក្រុង/ខណ្ឌ:</label>
	                        <div class="col-md-9 col-sm-9 col-xs-9">
	                        	<select class="form-control" id="district" name="pob_district">
                                	<%
                                		ArrayList<DistrictBean> listD = DistrictService.p_listAllDistrictByProvinceID(sb.getAb().getProvince_id());
                                		for(DistrictBean db : listD){
                                			if(sb.getAb().getDistrict_id() == db.getDistrict_id()){
                                				out.print("<option value='" + db.getDistrict_id() + "' selected>" + db.getDistrict() + "</option>");
                                			}else{
                                				out.print("<option value='" + db.getDistrict_id() + "'>" + db.getDistrict() + "</option>");
                                			}
                                		}
                                	%>
                            	</select>
	                        </div>
	                      </div>
	                      <div class="form-group row">
	                        <label class="control-label col-md-3 col-sm-3 col-xs-3">ឃុំ /សង្កាត់:</label>
	                        <div class="col-md-9 col-sm-9 col-xs-9">
	                        	<select class="form-control" id="commune" name="pob_commune">
                                	<%
                                		ArrayList<CommuneBean> listC = CommuneService.p_listAllCommuneByDistrictID(sb.getAb().getDistrict_id());
                                		for(CommuneBean cb : listC){
                                			if(sb.getAb().getCommune_id() == cb.getCommune_id()){
                                				out.print("<option value='" + cb.getCommune_id() + "' selected>" + cb.getCommune() + "</option>");
                                			}else{
                                				out.print("<option value='" + cb.getCommune_id() + "'>" + cb.getCommune() + "</option>");
                                			}
                                		}
                                	%>
                            	</select>
	                        </div>
	                      </div>
	                      <div class="form-group row">
	                        <label class="control-label col-md-3 col-sm-3 col-xs-3">ភូមិ :</label>
	                        <div class="col-md-9 col-sm-9 col-xs-9">
	                        	<select class="form-control" id="village" name="pob_village_id">
                                	<%
                                		ArrayList<VillageBean> listV = VillageService.p_listAllVillageByCommuneID(sb.getAb().getCommune_id());
                                		for(VillageBean vb : listV){
                                			if(sb.getAb().getVillage_id() == vb.getVillage_id()){
                                				out.print("<option value='" + vb.getVillage_id() + "' selected>" + vb.getVillage() + "</option>");
                                			}else{
                                				out.print("<option value='" + vb.getVillage_id() + "'>" + vb.getVillage()  + "</option>");
                                			}
                                		}
                                	%>
                            	</select>
	                        </div>
	                      </div>
	                    </div>
                      	
	                      <div class="col-md-6 col-sm-12">
	                      	<div class="form-group row">
	                        	<h4 class="control-label col-md-12 col-sm-12 col-xs-12 bg-secondary text-white text-center">ទីលំនៅបច្ចុប្បន្ន :</h4>
	                        	<label class="control-label col-md-3 col-sm-3 col-xs-3">ខេត្ត/រាជធានី :</label>
	                        	<div class="col-md-9 col-sm-9 col-xs-9">
	                        		<select class="form-control" id="province_id" name="current_province" >
	                                	<%
                                			ArrayList<ProvinceBean> list1 = ProvinceService.p_listAllProvince();
                                			for(ProvinceBean pb : list1){
                                				if(sb.getAbCurrent().getProvince_id() == pb.getPro_id()){
                                					out.print("<option value='" + pb.getPro_id() + "' selected>" + pb.getProvince() + "</option>");
                                				}else{
                                					out.print("<option value='" + pb.getPro_id() + "'>" + pb.getProvince() + "</option>");
                                				}
                                			}
                                		%>
                            		</select>
	                        	</div> 
	                      </div>
	                      <div class="form-group row">
	                      	<label class="control-label col-md-3 col-sm-3 col-xs-3">ស្រុក /ក្រុង/ខណ្ឌ:</label>
	                        <div class="col-md-9 col-sm-9 col-xs-9">
	                        	<select class="form-control" id="district_id" name="current_district">
                                	<%
                                		ArrayList<DistrictBean> list2 = DistrictService.p_listAllDistrictByProvinceID(sb.getAbCurrent().getProvince_id());
                                		for(DistrictBean db : list2){
                                			if(sb.getAbCurrent().getDistrict_id() == db.getDistrict_id()){
                                				out.print("<option value='" + db.getDistrict_id() + "' selected>" + db.getDistrict() + "</option>");
                                			}else{
                                				out.print("<option value='" + db.getDistrict_id() + "'>" + db.getDistrict() + "</option>");
                                			}
                                		}
                                	%>
                            	</select>
	                        </div>
	                      </div>
	                      <div class="form-group row">
	                        <label class="control-label col-md-3 col-sm-3 col-xs-3">ឃុំ /សង្កាត់ :</label>
	                        <div class="col-md-9 col-sm-9 col-xs-9">
	                        	<select class="form-control" id="commune_id" name="current_commune">
                                	<%
                               			ArrayList<CommuneBean> list3 = CommuneService.p_listAllCommuneByDistrictID(sb.getAbCurrent().getDistrict_id());
                               			for(CommuneBean cb : list3){
                               				if(sb.getAbCurrent().getCommune_id() == cb.getCommune_id()){
                               					out.print("<option value='" + cb.getCommune_id() + "' selected>" + cb.getCommune() + "</option>");
                               				}else{
                               					out.print("<option value='" + cb.getCommune_id() + "'>" + cb.getCommune() + "</option>");
                               				}
                               			}
                               		%>
                            	</select>
	                        </div>
	                      </div>
							<div class="form-group row">
								<label class="control-label col-md-3 col-sm-3 col-xs-3">ភូមិ :</label>
		                        <div class="col-md-9 col-sm-9 col-xs-9">
		                        	<select class="form-control" id="village_id" name="current_village_id">
	                                	<%
	                               			ArrayList<VillageBean> list4 = VillageService.p_listAllVillageByCommuneID(sb.getAbCurrent().getCommune_id());
	                               			for(VillageBean vb : list4){
	                               				if(sb.getAbCurrent().getVillage_id() == vb.getVillage_id()){
	                               					out.print("<option value='" + vb.getVillage_id() + "' selected>" + vb.getVillage() + "</option>");
	                               				}else{
	                               					out.print("<option value='" + vb.getVillage_id() + "'>" + vb.getVillage() + "</option>");
	                               				}
	                               			}
	                               		%>
	                            	</select>
		                        </div>
							</div>
			                  <div class="form-group row">
		                        <label class="control-label col-md-3 col-sm-3 col-xs-3">លេខទូរស័ព្ទ :</label>
		                        <div class="col-md-9 col-sm-9 col-xs-9">
		                          <input type="text" name="phone_number" value="<%=sb.getPhone() %>" class="form-control">
		                        </div>
			                  </div>
		                      <div class="form-group row">		                      	
		                        <div class="col-md-9 col-sm-9 col-xs-9">
		                          <input type="hidden" name="guardian_id" value="<%=sb.getGuardian_id() %>">
		                        </div>
		                      </div>
		                      <div class="form-group row">
		                        <label class="control-label col-md-3 col-sm-3 col-xs-3 ">រូបថត</label>
		                        <div class="col-md-6 col-sm-6 col-xs-6">
		                          <div class="form-group">
                                      	<img alt="user_photo" src="../../images/students/<%=sb.getPhoto_name() %>" name="photo" id="show_photo" width="130px" height="147px" style="border:1px solid gray; border-radius:2px !important;">
                                      	<input type="hidden" name="old_photo" value="" />
                                  </div>
                             		<div class="custom-file mb-3">
								    	<input type="file" class="custom-file-input" id="customFile" name="file" onchange="readDisplayUrl(this);">
								   	 	<label class="custom-file-label" for="customFile">Choose your photo *</label>
		                       		</div>
		                      	</div>
		                      </div>
		                      
			                  <div class="form-group row">
			                  	<label class="control-label col-md-6 col-sm-6 col-xs-6"></label>
	                        	<div class="col-md-6 col-sm-6 col-xs-6 offset-md-3">
	                        		<a href="../../view/detail/NameList" class="btn btn-primary">Back</a>
	                          		<button type="submit" class="btn btn-success">Submit</button>
	                        	</div>
	                      	</div>
	                      </div>
                    </form>
                  </div>
                </div>
              </div>
          <!-- /top tiles -->
        </div>
        <!-- /page content -->
        <!-- footer content -->
		<jsp:include page="/view/detail/FooterPage"></jsp:include>
        <!-- /footer content -->
      </div>
    </div>
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <!-- Alert message pop up -->
    <script src="../../js/toastr.min.js"></script>
   	<script src="../../js/sweetalert2.min.js"></script>
   	<script src="../../js/custom_js/PopupMessage.js"></script>
    <script src="../../js/custom.min.js"></script>
    <%
		if( session.getAttribute("code") != null ){
			String msg = session.getAttribute("code").toString();
			if( msg.equalsIgnoreCase("Error") )	{				
			%>	
				<script type="text/javascript">
					toastr.error('Your update failed! try again!')
				</script>
			<% 	
			}
			else{				
			%>	
				<script type="text/javascript">
					$(document).ready(function() {
					     toastr.success('Your update was successfully!')
					 });
				</script>
			<% 	
			}
		}
	    session.removeAttribute("code");
	%>
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
</body>
</html>