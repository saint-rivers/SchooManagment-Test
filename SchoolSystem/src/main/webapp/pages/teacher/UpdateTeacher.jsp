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
<%@ page import="db.services.DistrictService" %> 
<%@ page import="db.services.VillageService" %> 
<%@ page import="db.services.CommuneService" %>
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

    <title>LMS</title>

    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/font-awesome.min.css" rel="stylesheet">
    <link href="../../webcss/all.min.css" rel="stylesheet"> 
    <!-- Alert message poup -->
    <link href="../../css/toastr.min.css" rel="stylesheet">
	<link href="../../css/sweetalert2.min.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script>   
    <script src="../../js/popper.min.js"></script>
    
    <link href="../../css/custom.min.css" rel="stylesheet">
     <link href="../../css/customStyle/MaltyFormData.css" rel="stylesheet">
    <script>
           
    $(document).ready(function(){
		$("#province").on('change', function()
		{
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

	      $('.registration-form fieldset:first-child').fadeIn('slow');
	});

	$(document).ready(function(){
		$("#district").on('change', function()
		{
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
		$("#current_province").on('change', function()
		{
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
					$.each(responseJson, function(idx, key)	{
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
                    <h2 id="title_student">		Update Teacher Information</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                     
                      <li><a class="close-link"><i class="fa fa-close"></i></a> </li>
                    </ul>
                    <div class="clearfix"></div>
						
                  </div>
                  <form role="form" class="registration-form" action="${pageContext.request.contextPath}/EditExistTeacher" Method="POST"  enctype="multipart/form-data" >
                    <%
                  		String teacher_id = request.getParameter("id");
             			TeacherBean sb = TeacherService.getATeacher(teacher_id);             			
                  	 %>
             <fieldset id ="step_one">
             
                   <div class="form-top">
                       <div class="form-top-left">
                          <h3><span><i class="fa fa-calendar-check-o" aria-hidden="true"></i></span>		Teacher Information</h3>
                               
                        </div>
                    </div>
                    
              <div class="form-bottom">
              <div class="row">
                                
                                
                  <div class="col-md-9 col-sm-12" id="bordy_top" >
	                      <div class="form-group row" >
	                         <label class="control-label col-md-4 col-sm-3 col-xs-3">Teacher ID :</label>
	                            <div class="col-md-8 col-sm-9 col-xs-9">
	                             <input type="text" value="<%=sb.getT_id() %>" class="form-control" disabled id="teacher_id" >
	                               <input type="hidden" id="teacher_id"  name="teacher_id" value="<%=sb.getT_id() %>" class="form-control" autocomplete="off">
	                           </div>
	                      </div>
	                      
	                      <div class="form-group row" id="bordy_first_name">
	                         <label class="control-label col-md-4 col-sm-3 col-xs-3">First Name :</label>
	                           <div class="col-md-8 col-sm-9 col-xs-9">
	                           <small class="text-danger" id="fname_error"></small>
	                           <input type="text" class="form-control" value="<%=sb.getT_fname() %>"  id = "first_name"  name = "first_name" autocomplete="off">
	                         </div>
	                      </div>
	                      
	                     <div class="form-group row" id="bordy_last_name" >
	                        <label class="control-label col-md-4 col-sm-3 col-xs-3">Last Name :</label>
	                            <div class="col-md-8 col-sm-9 col-xs-9">
	                            <small class="text-danger bold italic" id="lname_error"></small>
	                             <input type="text" class="form-control" id= "last_name" value="<%=sb.getT_lname() %>" name="last_name" autocomplete="off">
	                        </div>
	                     </div>
	                      <div class="form-group row" id="bordy_gender">
	                          <label class="control-label col-md-4 col-sm-3 col-xs-3">Gender :</label>
	                              <div class="col-md-8 col-sm-9 col-xs-9 input-error" >
	                                  <small class="text-danger bold italic" id="gender_error"></small>
	                                     <select class="form-control" name="gender" id="gender">
                                	       
		                                <%
											ArrayList<TeacherBean> list = TeacherService.getATeacherGender();
											for( TeacherBean scBean : list)
												if(scBean.getT_gender().equals(sb.getT_gender())){
													out.print("<option value='" + scBean.getT_gender() + "' selected >" + scBean.getT_gender() + "</option>");
												}else{
													out.print("<option value='" + scBean.getT_gender() + "'>"+ scBean.getT_gender() + "</option>");
												}
										%>
                            	     </select>
	                           </div>
	                       </div>
	                      
		                 <div class="form-group row "  id="bordy_dob">
		                    <label class="control-label col-md-4 col-sm-3 col-xs-3 ">Date of birth :</label>
		                    <div class="col-md-8 col-sm-9 col-xs-9 input-error" >
		                    	<small class="text-danger bold italic" id="dob_error"></small>
		                        <input type="text" class="form-control" name="dob" id="dob" value="<%=sb.getT_dob() %>">
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
                                <h3><span><i class="fa fa-calendar-check-o" aria-hidden="true"></i></span>		Update Teacher Place Of Birth</h3>
                             </div>
                        </div>
                   <div class="form-bottom">
     
                      <div class="form-group row"  id="bordy_dob">
	                     <label class="control-label col-md-4 col-sm-3 col-xs-3">Country :</label>
	                        <div class="col-md-8 col-sm-9 col-xs-9">
	                           <small class="text-danger" id="country_error"></small>
	                               <select class="form-control" id="country" name="country" >
	                             	<option  id ="first-index" class="hidden"  selected disabled value ="0">ជ្រើសរើស ប្រទេស</option>
	                             	    <%
											ArrayList<TeacherBean> lss = TeacherService.getAcountry();
											for( TeacherBean stt : lss)
												if(stt.getCountry().equals(sb.getCountry())){
													out.print("<option value='" + stt.getCountry() + "' selected >'" + stt.getCountry() + "</option>");
												}else{
													out.print("<option value='" + stt.getCountry() + "'>"+ stt.getCountry() + "</option>");
												}
										%>
                            	 </select>
                               <p>   </p>
	                      </div>
	                  </div>
	                       
	                    <div class="form-group row"  id="bordy_dob">
	                         <label class="control-label col-md-4 col-sm-3 col-xs-3">Province :</label>
	                             <div class="col-md-8 col-sm-9 col-xs-9">
	                                <small class="text-danger" id="province_error"></small>
	                                   <select class="form-control" id="province" name="province" >
	                             	     <option id ="province-index" class="hidden"  selected disabled value ="0" >ជ្រើសរើស ខេត្ត</option>
	                                	        <% 
                                	             		ArrayList<ProvinceBean> pbean = ProvinceService.p_listAllProvince();
                                	             		
		                      		                   for(ProvinceBean pb :  pbean){
			                      		            	   if(pb.getPro_id() == sb.getaddress_teacher().getProvince_id()){
					                      			         out.print("<option value='"+ pb.getPro_id()+"' selected >" + pb.getProvince() + "</option>");
					                      		           }else{
					                      		        	 out.print("<option value='"+ pb.getPro_id()+"'>" + pb.getProvince() + "</option>");
					                      		           }
			                      		            	}
		                      		             %>
                            	   </select>
	                          </div>
	                      </div>
                               
                               
                        <div class="form-group row"  id="bordy_dob">
	                        <label class="control-label col-md-4 col-sm-3 col-xs-3">District :</label>
	                            <div class="col-md-8 col-sm-9 col-xs-9">
	                               <small class="text-danger" id="district_error"></small>
	                                  <select class="form-control" id="district" name="district"  >
	                             	
	                             	    <% 
	                             	       
		                             		int province_id = sb.getaddress_teacher().getProvince_id();
		                           			int district_id = sb.getaddress_teacher().getDistrict_id();
		                             	   ArrayList<DistrictBean> dbean = DistrictService.p_listAllDistrictByProvinceID(province_id);
                 		                    for(DistrictBean ad : dbean ) 
                 		                    {
                     		            	   if( ad.getDistrict_id() == district_id){
                     		            		    out.print("<option id ='district-index' class='hidden'  selected disabled value ='0' >ជ្រើសរើស ស្រុក</option>"); 
		                      			      		out.print("<option value='"+ ad.getDistrict_id() +"' selected >" + ad.getDistrict()+ "</option>");
		                      		           }else{
		                      		        	 		out.print("<option value='"+ ad.getDistrict_id() +"'>" + ad.getDistrict()+ "</option>");
		                      		           }
                     		            	}
					                     %>
                            	</select>
	                          </div>
	                     </div>
	                     
	                       
                       <div class="form-group row"  id="bordy_dob">
	                       <label class="control-label col-md-4 col-sm-3 col-xs-3">Commune:</label>
	                          <div class="col-md-8 col-sm-9 col-xs-9">
	                              <small class="text-danger" id="commune_error"></small>
	                                 <select class="form-control" id="commune" name="commune" >
	                              <option  id ="commune-index" class="hidden"  selected disabled value ="0" >ជ្រើសរើស ឃុំ</option>
	                                        <%
				                             	   ArrayList<CommuneBean> cbean = CommuneService.p_listAllCommuneByDistrictID(sb.getaddress_teacher().getDistrict_id());
	                      		                    for( CommuneBean cd : cbean  )
				                      		         {
		                      		            	   if( cd.getCommune_id() == sb.getaddress_teacher().getCommune_id()){
				                      			      out.print("<option value='"+ cd.getCommune_id() +"' selected >" + cd.getCommune()+ "</option>");
				                      		        } else{
				                      		        	 out.print("<option value='"+ cd.getCommune_id()+"'>" + cd.getCommune()+ "</option>");
				                      		           }
		                      		            	}
					                             
					                      		%>
                               </select>
	                        </div>
	                     </div>
	                     
                         <div class="form-group row"  id="bordy_dob">
	                        <label class="control-label col-md-4 col-sm-3 col-xs-3">Village :</label>
	                           <div class="col-md-8 col-sm-9 col-xs-9">
	                             <small class="text-danger" id="village_error"></small>
	                                <select class="form-control" id="village" name="village_id" >
	                             <option  id ="village-index" class="hidden"  selected disabled value ="0" >ជ្រើសរើស ភូមិ</option>
                                         <%
		                             	   		ArrayList<VillageBean> vbean = VillageService.p_listAllVillageByCommuneID(sb.getaddress_teacher().getCommune_id());
                     		                    for( VillageBean vd : vbean  ){
                      		            	   		if( vd.getVillage_id() == sb.getaddress_teacher().getVillage_id()){
		                      			      			out.print("<option value='"+ vd.getVillage_id() +"' selected >" + vd.getVillage()+ "</option>");
		                      		        		} else{
		                      		        	 		out.print("<option value='"+ vd.getVillage_id() +"'>" + vd.getVillage()+ "</option>");
		                      		           		}
                      		            		}			                             
			                      		%>
                            	</select>
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
                                <h3><span><i class="fa fa-calendar-check-o" aria-hidden="true"></i></span>	Update Teacher Current Address</h3>
                             </div>
                        </div>
                   <div class="form-bottom">
     
                     
	                    <div class="form-group row"  id="bordy_dob">
	                         <label class="control-label col-md-4 col-sm-3 col-xs-3">Province :</label>
	                             <div class="col-md-8 col-sm-9 col-xs-9">
	                                <small class="text-danger" id="current_province_error"></small>
	                                   <select class="form-control" id="current_province" name="current_province" >
	                             	     <option id ="current-province-index" class='hidden'  selected disabled value="0" >Choose Current Province</option>
	                                	       <% 
                                	             		ArrayList<ProvinceBean> provinceBean = ProvinceService.p_listAllProvince();
                                	             		
		                      		                   for(ProvinceBean PB : provinceBean)
					                      		         {
			                      		            	   if(PB.getPro_id() == sb.getCurrent_address().getProvince_id()){
					                      			      out.print("<option value='"+ PB.getPro_id()+"' selected>" + PB.getProvince()+ "</option>");
					                      		        } else{
					                      		        	 out.print("<option value='"+ PB.getPro_id()+"'>" + PB.getProvince()+ "</option>");
					                      		           }
			                      		            	}
		                      		             %>
                            	   </select>
	                          </div>
	                      </div>
                               
                               
                        <div class="form-group row"  id="bordy_dob">
	                        <label class="control-label col-md-4 col-sm-3 col-xs-3">District :</label>
	                            <div class="col-md-8 col-sm-9 col-xs-9">
	                               <small class="text-danger" id="current_district_error"></small>
	                                  <select class="form-control" id="current_district" name="current_district" >
	                             	<option  id ="current-district-index" class="hidden"  selected disabled value= "0">Choose Current District</option>
	                             	       <% 
	                             	       
		                             		int  curr_province_id = sb.getCurrent_address().getProvince_id();
		                           			int curr_district_id = sb.getCurrent_address().getDistrict_id();
		                             	   ArrayList<DistrictBean> districtBean = DistrictService.p_listAllDistrictByProvinceID(curr_province_id);
                 		                    for(DistrictBean AD : districtBean ) 
                 		                    {
                     		            	   if( AD.getDistrict_id() == curr_district_id){
                     		            		    out.print("<option id ='district-index' class='hidden'  selected disabled value ='0' >ជ្រើសរើស ស្រុក</option>"); 
		                      			      		out.print("<option value='"+ AD.getDistrict_id() +"' selected >" + AD.getDistrict()+ "</option>");
		                      		           }else{
		                      		        	 		out.print("<option value='"+ AD.getDistrict_id() +"'>" + AD.getDistrict()+ "</option>");
		                      		           }
                     		            	}
					                     %>    
                            	</select>
	                          </div>
	                     </div>
	                     
	                       
                       <div class="form-group row"  id="bordy_dob">
	                       <label class="control-label col-md-4 col-sm-3 col-xs-3">Commune:</label>
	                          <div class="col-md-8 col-sm-9 col-xs-9">
	                              <small class="text-danger" id="current_commune_error"></small>
	                                 <select class="form-control" id="current_commune" name="current_commune" >
	                              <option class="hidden"  selected disabled value="0" >Choose Current Commune</option>
	                               <%
	                             	   ArrayList<CommuneBean>  commune = CommuneService.p_listAllCommuneByDistrictID(sb.getCurrent_address().getDistrict_id());
	                   		                    for( CommuneBean CB : commune ){
	                    		            	   if( CB.getCommune_id() == sb.getCurrent_address().getCommune_id()){
	                      			      out.print("<option value='"+ CB.getCommune_id() +"' selected >" + CB.getCommune()+ "</option>");
	                      		        } else{
	                      		        	 out.print("<option value='"+ CB.getCommune_id()+"'>" + CB.getCommune()+ "</option>");
	                      		           }
	                    		            	}
		                             
		                      		%>
                               </select>
	                        </div>
	                     </div>
	                     
                         <div class="form-group row"  id="bordy_dob">
	                        <label class="control-label col-md-4 col-sm-3 col-xs-3">Village :</label>
	                           <div class="col-md-8 col-sm-9 col-xs-9">
	                             <small class="text-danger" id="current_village_error"></small>
	                                <select class="form-control" id="current_village" name="current_village" >
	                             <option id="current-village-index" class="hidden"  selected disabled value="0" >Choose Current Village</option>
	                              <%
				                             	   ArrayList<VillageBean> villageBean = VillageService.p_listAllVillageByCommuneID(sb.getCurrent_address().getCommune_id());
	                      		                    for( VillageBean VB : villageBean  )
				                      		         {
		                      		            	   if( VB.getVillage_id() == sb.getCurrent_address().getVillage_id()){
				                      			      out.print("<option value='"+ VB.getVillage_id() +"' selected >" + VB.getVillage()+ "</option>");
				                      		        } else{
				                      		        	 out.print("<option value='"+ VB.getVillage_id() +"'>" + VB.getVillage()+ "</option>");
				                      		           }
		                      		            	}
					                             
					                      		%>
                            	</select>
	                        </div>
	                     </div>
								<center>
								
									<button type="button" class="btn btn-previous btn-danger" id='previous-2'>Previous</button>
                                    <button type="button" class="btn btn-next btn-primary"  id="next-3" >Next</button>
								</center>
                            
                        </div> 
        </fieldset>
                    
                    
        <fieldset id="step_four" >
        
                    <div class="form-top">
                             <div class="form-top-left">
                                <h3><span><i class="fa fa-calendar-check-o" aria-hidden="true"></i></span>		Update Teacher RelationShip</h3>
                             </div>
                        </div>
                   <div class="form-bottom">
	                
		               <div class="form-group row">
		                     <label class="control-label col-md-4 col-sm-3 col-xs-3">Phone Number :</label>
		                         <div class="col-md-8 col-sm-9 col-xs-9">
		                           <small class="text-danger" id="phone_number_error"></small>
		                          <input type="text" class="form-control" id="phone_number" name="phone_number" value="<%=sb.getT_phone() %>" >
		                     </div>
		                </div>
		                      
		                <div class="form-group row"  id="bordy_dob">
	                         <label class="control-label col-md-4 col-sm-3 col-xs-3">Nationality :</label>
	                             <div class="col-md-8 col-sm-9 col-xs-9">
	                                 <small class="text-danger" id="nationality_error"></small>
	                                     <select class="form-control" id="nationality" name="nationality" >
	                             	        <option id ="nationality-index" class="hidden"  selected disabled value="0" >សូមជ្រើសរើស សញ្ជាតិ</option>
			                             	    <%
			                            		  ArrayList<TeacherBean> national = TeacherService.P_listInformation_Teacher();
												  for( TeacherBean scBean : national)
													if(scBean.getNationality().equals(sb.getNationality())){
														out.print("<option value='" + scBean.getNationality() + "' selected >" + scBean.getNationality() + "</option>");
													}else{
														out.print("<option value='" + scBean.getNationality() + "'>"+ scBean.getNationality() + "</option>");
													}    
				                      		     %>
                            	   </select>
	                           </div>
	                     </div>
	                  
                            
		                 <div class="form-group row" id="bordy_passport_no">
		                    <label class="control-label col-md-4 col-sm-3 col-xs-3"> Nationality_Id:</label>
		                        <div class="col-md-8 col-sm-9 col-xs-9">
		                          <small class="text-danger" id="nationality_id_error"></small>
		                        <input type="text" class="form-control"  id="nationality_id" name="nationality_id" autocomplete="off" value="<%= sb.getNationality_id() %>">
		                     </div>
		                 </div>
		                      
		                  <div class="form-group row" id="bordy_stutus">
		                      <label class="control-label col-md-4 col-sm-3 col-xs-3"> Status:</label>
		                         <div class="col-md-8 col-sm-9 col-xs-9">
		                             <small class="text-danger" id="status_error"></small>
		                          	    <select class="form-control" id="status" name="status" >
		                             	  <option id ="status-index" class="hidden"  selected disabled value="0" >សូមជ្រើស រើស </option>
		                             	  <%
											ArrayList<TeacherBean> ls = TeacherService.getAStaTus();
											for( TeacherBean st : ls)
												if(st.getStustus().equals(sb.getStustus())){
													out.print("<option value='" + st.getStustus() + "' selected >" + st.getStustus() + "</option>");
												}else{
													out.print("<option value='" + st.getStustus() + "'>"+ st.getStustus() + "</option>");
												}
										%>
                            	  </select>
		                       </div>
		                    </div>    
                               
                          <div class="form-group row">
		                      <label class="control-label col-md-4 col-sm-3 col-xs-3">Photo</label>
		                         <div class="col-md-8 col-sm-9 col-xs-9">
		                            <div class="form-group">
		                                 <small class="text-danger" id="customFile_error"></small>
                                      	<img alt="register_photo"  src="../../images/teachers/<%=sb.getT_photo() %>" name="photo" id="show_photo" width="130px" height="147px" style="border:1px solid gray; border-radius:2px !important;">
                                          	<input type="hidden" name="old_photo" value="<%=sb.getT_photo() %>" />
                                        </div>
                                	   <div class="custom-file mb-3">
                                	   
								       <input type="file" class="custom-file-input"  id="customFile" name="file" onchange="readDisplayUrl(this);" value="<%=sb.getT_photo() %>>">
								   	 	 <label class="custom-file-label" for="customFile" >Choose your photo *</label>
		                          </div>
		                       </div>
		                   </div>
		                   
                               <center>
                               		<button type="button" class="btn btn-previous btn-danger" id="previous-3">Previous</button>
                                    <button type="submit" class="btn btn-next btn-primary" id="next-4" >Next</button>
                               </center>
                        </div>
                </fieldset>
   
                <fieldset id ="step_five">
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
                     <center>
                     	<a type= "button" class="btn btn-next btn-primary" href="../../view/teacher_education/AddEducationTeacher" > Contenue</a>
                     </center>
               </div>
        </fieldset>
                    
                    
                </form>
            </div>
        </div>
    </div>      
           </div>
      
		<jsp:include page="/view/detail/FooterPage"></jsp:include>   
      </div>
	<script src="../../js/custom_js/teacher/UpdateTeacherMultiStepformAndUpdated.js"></script>
	<script src="../../js/custom_js/Input_Show_Image.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <!-- Alert message poup -->
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
		// the following code show the name of the file appear on select
		$(".custom-file-input").on("change", function() {
		  var fileName = $(this).val().split("\\").pop();
		  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
		});
	</script>
</body>
</html>