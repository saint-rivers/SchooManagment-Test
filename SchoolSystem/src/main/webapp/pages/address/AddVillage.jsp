<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.ArrayList" %>
 <%@ page import="bean.ProvinceBean"%>
<%@ page import="db.services.ProvinceService" %>  
<%@ page import="bean.CommuneBean"%>
<%@ page import="db.services.CommuneService" %>  
<%@ page import="bean.DistrictBean"%>
<%@ page import="db.services.DistrictService" %>   
<%@ page import="bean.VillageBean"%>
<%@ page import="db.services.VillageService" %> 
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
    <!-- Meta, title, CSS, favicons, etc. -->
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
     <!-- jQuery -->
    <script src="../../js/jquery.min.js"></script>   
    <script src="../../js/custom_js/lock_screen.js"></script>
    <!-- Select Address -->
    <script>
	    $(document).ready(function(){
			$("#province").on('change', function(){
				//alert("Was change value");
				var params = {proid : $(this).val()};//proid got value from $(this).val()
				//alert($(this).val());
					//coding to pass proid to servlet
					//params is object
					$.post("${pageContext.request.contextPath}/ProvinceServlet" , $.param(params) , function(responseJson){
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
				//alert("Was change value");
				var params = {distid : $(this).val()};//proid got value from $(this).val()
				//alert($(this).val());
					//coding to pass proid to servlet
					//params is object
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
				//alert("Was change value");
				var params = {comid : $(this).val()};//proid got value from $(this).val()
				//alert($(this).val());
					//coding to pass proid to servlet
					//params is object
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
				//alert("Was change value");
				var params = {proid : $(this).val()};//proid got value from $(this).val()
				//alert($(this).val());
					//coding to pass proid to servlet
					//params is object
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
				//alert("Was change value");
				var params = {distid : $(this).val()};//proid got value from $(this).val()
				//alert($(this).val());
					//coding to pass proid to servlet
					//params is object
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
                    <h2>Add New Commune</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>  
                  <%
						if( session.getAttribute("code") != null ) 
						{
							String msg = session.getAttribute("code").toString();
							if( msg.equalsIgnoreCase("error") )
							{
								out.print("<div class='alert alert-danger' id='danger-alert'>");
								out.print("<h3>ERROR</h3>");
								out.print("Insert data failed.");
								out.print("</div>");
							%>	
								<script type="text/javascript">
									$("#danger-alert").fadeTo( 2000 , 500 ).slideUp(500, function(){
										$("#danger-alert").slideUp(500);
									});
								</script>
							<% 	
							}
							else{
								out.print("<div class='alert alert-success' id='success-alert'>");
								out.print("<h4>Success</h4>");
								out.print("Insert data was successful.");
								out.print("</div>");
							%>	
								<script type="text/javascript">
									$("#success-alert").fadeTo( 2000 , 500 ).slideUp(500, function(){
										$("#success-alert").slideUp(500);
									});
								</script>
							<% 	
							}
						}
                  		session.removeAttribute("code");
					%>
                  
                  <div class="x_content">
                    <br>
                   <%
						//String subID = SubjectService.getNewId();
					%>
                    <form action="${pageContext.request.contextPath}/AddNewVillage" class="form-horizontal form-label-left" method="Post">
						
                      
                      <div class="form-group row">
						<label class="control-label col-md-3 col-sm-3 ">Province/City</label>
						<div class="col-md-9 col-sm-9 ">
							<select class="form-control" id="province_id" name="province_id">
								<option selected disabled>Choose Province/City</option>
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
						<label class="control-label col-md-3 col-sm-3 ">District/Khan</label>
						<div class="col-md-9 col-sm-9 ">
							<select class="form-control" id="district_id" name="district_id">
								<option selected disabled>Choose District/Khan</option>
							</select>
						</div>
					</div>
                      <div class="form-group row">
						<label class="control-label col-md-3 col-sm-3 ">Commune/Sangkat</label>
						<div class="col-md-9 col-sm-9 ">
							<select class="form-control" id="commune_id" name="commune_id">
								<option selected disabled>Choose Commune/Sangkat</option>
							</select>
						</div>
					</div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">Village Name</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" name="village" class="form-control">
                        </div>
                      </div>
                      
                      
                      <div class="ln_solid"></div>

                      <div class="form-group row">
                        <div class="col-md-9 offset-md-3">
                          <a href="../../view/detail/ListSubject" class="btn btn-primary">Back</a>
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
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <script src="../../js/custom.min.js"></script>
</body>
</html>