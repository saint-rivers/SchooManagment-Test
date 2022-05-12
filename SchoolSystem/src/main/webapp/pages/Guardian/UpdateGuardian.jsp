<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.GuardianBean"%>
<%@ page import="db.services.GuardianService" %>
<%@ page import="bean.ProvinceBean" %>
<%@ page import="bean.DistrictBean" %>
<%@ page import="bean.CommuneBean" %>
<%@ page import="bean.VillageBean" %>
<%@ page import="bean.AddressBean" %>
<%@ page import="db.services.ProvinceService" %>
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
    <link href="../../css/toastr.min.css" rel="stylesheet">
	<link href="../../css/sweetalert2.min.css" rel="stylesheet">
     <!-- jQuery -->
    <script src="../../js/jquery.min.js"></script>   
    <script src="../../js/popper.min.js"></script> 
    <script src="../../js/custom_js/lock_screen.js"></script>
    <script type="text/javascript">
	    $(document).ready(function(){
			$("#province").change(function(){
				var params = {proid : $(this).val()};//proid got value from $(this).val()
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
         <div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Update Guardian Information</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                      
                      <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                    </ul>
                    <div class="clearfix"></div>                  
                  </div>  
                  <div class="x_content">
                  <br>
                   <% 
                   		String gID = request.getParameter("id");
                   		GuardianBean gb = GuardianService.p_getAGuardian(gID);
                   		//SubjectCategoryBean scb = sb.getScb();
                   %>
                    <form action="${pageContext.request.contextPath}/UpdateGuardianServlet" class="form-horizontal form-label-left" method="Post">
                      <div class="form-group row">
                        <label class="control-label col-md-2 col-sm-2 col-xs-2">Guardian ID</label>
                        <div class="col-md-10 col-sm-10 col-xs-10">
                          <input type="text" class="form-control" value="<%=gb.getGuardian_id() %>" disabled>
                          <input type="hidden" name="guardian_id" value="<%=gb.getGuardian_id() %>">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-2 col-sm-2 col-xs-2">Father Name</label>
                        <div class="col-md-4 col-sm-4 col-xs-4">
                          <input type="text" class="form-control" name="father_name" value="<%=gb.getFather_name() %>">
                        </div>
                        <label class="control-label col-md-2 col-sm-2 col-xs-2">Father Job</label>
                        <div class="col-md-4 col-sm-4 col-xs-4">
                          <input type="text" class="form-control" name="father_job" value="<%=gb.getFather_job() %>">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-2 col-sm-2 col-xs-2">Mother Name</label>
                        <div class="col-md-4 col-sm-4 col-xs-4">
                          <input type="text" class="form-control" name="mother_name" value="<%=gb.getMother_name() %>">
                        </div>
                        <label class="control-label col-md-2 col-sm-2 col-xs-2">Mother Job</label>
                        <div class="col-md-4 col-sm-4 col-xs-4">
                          <input type="text" class="form-control" name="mother_job" value="<%=gb.getMother_job() %>">
                        </div>
                      </div>
                      <div class="form-group row">
                        
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-2 col-sm-2 col-xs-2">Phone Number</label>
                        <div class="col-md-10 col-sm-10 col-xs-10">
                          <input type="text" class="form-control" name="phone_number" value="<%=gb.getGuardian_phone() %>">
                        </div>
                      </div>
                      <div class="form-group row">
						<label class="control-label col-md-2 col-sm-2 col-xs-2">Current Address</label>
						<div class="col-md-4 col-sm-4 col-xs-4">
							<select class="form-control" id="province" name="current_province" >
                            	<%
                            		int currentPro_id = gb.getAb().getProvince_id();
		                      		ArrayList<ProvinceBean> ListP = ProvinceService.p_listAllProvince();
		                      		for(ProvinceBean pb : ListP){
		                      			if(currentPro_id == pb.getPro_id()){
		                      				out.print("<option value='"+ pb.getPro_id()+"' selected>" + pb.getProvince() + "</option>");
		                      			}else{
		                      				out.print("<option value='"+ pb.getPro_id()+"'>" + pb.getProvince() + "</option>");
		                      			}
		                      		}
	                      		%>
                    		</select>
						</div>
						<label class="control-label col-md-2 col-sm-2 col-xs-2"></label>
						<div class="col-md-4 col-sm-4 col-xs-4">
							<select class="form-control" id="district" name="current_district">
								<% 
									int province_id = gb.getAb().getProvince_id();
									int currentDis_id = gb.getAb().getDistrict_id();
		                      		ArrayList<DistrictBean> ListD = DistrictService.p_listAllDistrictByProvinceID(province_id);
		                      		for(DistrictBean pb : ListD){
		                      			if(currentDis_id == pb.getDistrict_id()){
		                      				out.print("<option value='"+ pb.getDistrict_id()+"' selected>" + pb.getDistrict() + "</option>");
		                      			}else{
		                      				out.print("<option value='"+ pb.getDistrict_id()+"'>" + pb.getDistrict() + "</option>");
		                      			}
		                      		}
	                      		%>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="control-label col-md-2 col-sm-2 col-xs-2"></label>
						<div class="col-md-4 col-sm-4 col-xs-4">
							<select class="form-control" id="commune" name="current_commune">
								<% 
									int district_id = gb.getAb().getDistrict_id();
									int currentCom_id = gb.getAb().getCommune_id();
		                      		ArrayList<CommuneBean> ListC = CommuneService.p_listAllCommuneByDistrictID(district_id);
		                      		for(CommuneBean cb : ListC){
		                      			if(currentCom_id == cb.getCommune_id()){
		                      				out.print("<option value='"+ cb.getCommune_id()+"' selected>" + cb.getCommune() + "</option>");
		                      			}else{
		                      				out.print("<option value='"+ cb.getCommune_id()+"'>" + cb.getCommune() + "</option>");
		                      			}
		                      		}
	                      		%>
							</select>
						</div>
						<label class="control-label col-md-2 col-sm-2 col-xs-2"></label>
						<div class="col-md-4 col-sm-4 col-xs-4">
							<select class="form-control" id="village" name="current_village_id">
								<%
                               		int cur_village_id = gb.getAb().getVillage_id();
                               		ArrayList<VillageBean> listvil = VillageService.p_listAllVillageByCommuneID(gb.getAb().getCommune_id());
                               		for(VillageBean vb : listvil){
                               			if(cur_village_id == vb.getVillage_id()){
                               				out.print("<option value='" + vb.getVillage_id() + "' selected>" + vb.getVillage() + "</option>");
                               			}else{
                               				out.print("<option value='" + vb.getVillage_id() + "'>" + vb.getVillage() + "</option>");
                               			}
                               		}
                               	%>
							</select>
							
						</div>
					</div>
                      <div class="ln_solid"></div>

                      <div class="form-group row">
                        <div class="col-md-9 offset-md-2">
                          <a href="../../view/list/ListGuardian" class="btn btn-primary">Back</a>
                          <button type="submit" class="btn btn-success">Submit</button>
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
    <!-- Bootstrap -->
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <!-- Custom Theme Scripts -->
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
</body>
</html>