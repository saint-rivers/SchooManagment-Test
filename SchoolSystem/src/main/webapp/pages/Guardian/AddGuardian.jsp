<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.GuardianBean"%>
<%@ page import="db.services.GuardianService" %>
<%@ page import="bean.ProvinceBean"%>
<%@ page import="db.services.ProvinceService" %>
   
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
					$.each(responseJson, function(index, key){
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
					$.each(responseJson, function(index, key){
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
					$.each(responseJson, function(index, key){
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
        <div class="right_col" role="main">
          <!-- top tiles -->
         <div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2 class="p-2">បញ្ចូលអាណាព្យាបាលសិស្ស</h2>                   
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
						String gid = GuardianService.getNewId();
					%>
                    <form action="${pageContext.request.contextPath}/AddAGuardian" class="form-horizontal form-label-left" method="Post">

                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">អត្តលេខ :</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" value="<%=gid %>" class="form-control" disabled>
                          <input type="hidden" name="guardian_id" value="<%=gid%>">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">ឈ្មោះឪពុក :</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" name="father_name" class="form-control">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">មុខរបរ :</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" name="father_job" class="form-control">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">ឈ្មោះម្ដាយ :</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" name="mother_name" class="form-control">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">មុខរបរ :</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" name="mother_job" class="form-control">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">លេខទូរស័ព្ទ :</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" name="phone_number" class="form-control">
                        </div>
                      </div>
                      
                      <div class="form-group row">
	                        <h3 class="control-label col-md-12 col-sm-12 col-xs-12 text-white bg-secondary p-2 text-center">ទីលំនៅបច្ចុប្បន្ន :</h3>
	                        <label class="control-label col-md-3 col-sm-3 col-xs-3">ខេត្ត/ក្រុង :</label>
	                        <div class="col-md-9 col-sm-9 col-xs-9">
	                        	<select class="form-control" id="province" name="pob_province" >
	                             	<option class="hidden"  selected disabled>ខេត្ត/ក្រុង</option>
                                	<%
                                		ArrayList<ProvinceBean> listP = ProvinceService.p_listAllProvince();
                                		for(ProvinceBean pb : listP){
                                			out.print("<option value='" + pb.getPro_id() + "'> " + pb.getProvince() + " </option>");
                                		}
                                	%>
                            	</select>
	                        </div>
	                  </div>
                     	<div class="form-group row">
                     		<label class="control-label col-md-3 col-sm-3 col-xs-3">ស្រុក/ខណ្ឌ :</label>
                     		<div class="col-md-9 col-sm-9 col-xs-9">	                          	
	                          	<select class="form-control" id="district" name="pob_district">
	                              	<option class="hidden"  selected disabled>ស្រុក/ខណ្ឌ</option>
	                          	</select>
	                        </div>
                     	</div>
                     	<div class="form-group row">
                     		<label class="control-label col-md-3 col-sm-3 col-xs-3">ឃុំ/សង្កាត់ :</label>
                     		<div class="col-md-9 col-sm-9 col-xs-9">
                     			<select class="form-control" id="commune" name="pob_commune">
                                	<option class="hidden"  selected disabled>ឃុំ/សង្កាត់</option>
                            	</select>
                     		</div>                     	                     	
                     	</div>
                     	<div class="form-group row">
                     		<label class="control-label col-md-3 col-sm-3 col-xs-3">ភូមិ :</label>
                     		<div class="col-md-9 col-sm-9 col-xs-9">
	                     		<select class="form-control" id="village" name="village_id">
	                                <option class="hidden"  selected disabled>ភូមិ</option>
	                            </select>
                     		</div>
                     	</div>
                      <div class="ln_solid"></div>

                      <div class="form-group row">
                        <div class="col-md-9 offset-md-3">
                          <a href="../../view/list/ListGuardian" class="btn btn-primary">ត្រឡប់</a>
                          <button type="submit" class="btn btn-success">រក្សាទុក</button>
                        </div>
                      </div>

                    </form>
                  </div>
                </div>
              </div>
          <!-- /top tiles -->
        </div>
        <!-- /page content -->

      </div>
    </div>

    <!-- Bootstrap -->
    <script src="../../js/bootstrap.bundle.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../../js/custom.min.js"></script>
</body>
</html>