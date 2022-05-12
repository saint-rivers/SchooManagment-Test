<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
                    <h2>Add New Province</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">Settings 1</a>
                            <a class="dropdown-item" href="#">Settings 2</a>
                        </div>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
             
                  <div class="x_content">
                    <br>
                   
                    <form action="${pageContext.request.contextPath}" class="form-horizontal form-label-left" method="Post">

                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">Village</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" name="village" class="form-control" Placeholder="Enter Village">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">Commune/Sangkat</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" name="commune" class="form-control" Placeholder="Enter Commune or Sangkat">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">District/Khan</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" name="district" class="form-control" Placeholder="Enter District or Khan">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">Province/City</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" name="province" class="form-control" Placeholder="Enter Province or City">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">Country</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                          <input type="text" name="country" class="form-control" Placeholder="Enter Country">
                        </div>
                      </div>
                      <div class="ln_solid"></div>

                      <div class="form-group row">
                        <div class="col-md-9 offset-md-3">
                          <a href="../../view/detail/Address" class="btn btn-primary">Cancel</a>
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
    <script src="../../js/custom.min.js"></script>


</body>
</html>