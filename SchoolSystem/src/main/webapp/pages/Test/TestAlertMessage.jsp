<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ page import="java.util.ArrayList"%>
<%@ page import="bean.ClassStudyBean"%>
<%@ page import="db.services.ClassStudyService" %>
<%@ page import="bean.RoomBean"%>
<%@ page import="db.services.RoomService" %> 
<%@ page import="bean.SubjectCategoryBean"%>
<%@ page import="db.services.SubjectCategoryService" %> 
<%@ page import="bean.SubjectBean"%>
<%@ page import="db.services.SubjectService" %> 
<%@ page import="bean.TeacherBean"%>
<%@ page import="db.services.TeacherService" %>

<%@ page import="bean.DayBean"%>
<%@ page import="db.services.DayService" %>
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
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/favicon.ico" type="image/ico" />
    <title>LMS</title>
    <!-- Bootstrap -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/bootstrap-4.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../../css/font-awesome.min.css" rel="stylesheet">
    <link href="../../webcss/all.min.css" rel="stylesheet"> <!--load all styles -->
    <!-- Custom Theme Style -->
    <link href="../../css/custom.min.css" rel="stylesheet">
    <link href="../../css/mdtimepicker.css" rel="stylesheet" type="text/css">
    <link href="../../css/toastr.min.css" rel="stylesheet">
    <link href="../../css/sweetalert2.min.css" rel="stylesheet">
     <!-- jQuery -->   
        <!-- Bootstrap -->
    <link href="../../css/dataTable/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/scroller.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/customStyle/timetable.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script> 
    <script src="../../js/popper.min.js"></script>
	<script src="../../js/mdtimepicker.js"></script>
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
     			
     			
     		
     			<div class="col-md-6">
     				<div class="card card-success card-outline">
		              <div class="card-header">
		                <h3 class="card-title">
		                  <i class="fas fa-edit"></i>
		                  SweetAlert2 Examples
		                </h3>
		              </div>
		              <div class="card-body">
		                <button type="button" class="btn btn-success swalDefaultSuccess">
		                  Launch Success Toast
		                </button>
		                <button type="button" class="btn btn-info swalDefaultInfo">
		                  Launch Info Toast
		                </button>
		                <button type="button" class="btn btn-danger swalDefaultError">
		                  Launch Error Toast
		                </button>
		                <button type="button" class="btn btn-warning swalDefaultWarning">
		                  Launch Warning Toast
		                </button>
		                <button type="button" class="btn btn-default swalDefaultQuestion">
		                  Launch Question Toast
		                </button>
		                <div class="text-muted mt-3">
		                  For more examples look at <a href="https://sweetalert2.github.io/">https://sweetalert2.github.io/</a>
		                </div>
		              </div>
		              <!-- /.card -->
		            </div>
     			</div>
     			<div class="col-md-6">
     				<div class="card card-warning card-outline">
		              <div class="card-header">
		                <h3 class="card-title">
		                  <i class="fas fa-edit"></i>
		                  Toastr Examples
		                </h3>
		              </div>
		              <div class="card-body">
		                <button type="button" class="btn btn-success toastrDefaultSuccess">
		                  Launch Success Toast
		                </button>
		                <button type="button" class="btn btn-info toastrDefaultInfo">
		                  Launch Info Toast
		                </button>
		                <button type="button" class="btn btn-danger toastrDefaultError">
		                  Launch Error Toast
		                </button>
		                <button type="button" class="btn btn-warning toastrDefaultWarning">
		                  Launch Warning Toast
		                </button>
		                <div class="text-muted mt-3">
		                  For more examples look at <a href="https://codeseven.github.io/toastr/">https://codeseven.github.io/toastr/</a>
		                </div>
		              </div>
		              <!-- /.card -->
		            </div>
     			</div>
     		</div>
     
        <!-- /page content -->
        <!-- footer content -->
		<jsp:include page="/view/detail/FooterPage"></jsp:include>
        <!-- /footer content -->
    	</div>
    </div>
    <!-- Bootstrap -->
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <!-- Datatables -->
    <script src="../../js/dataTable/jquery.dataTables.min.js"></script>
    <script src="../../js/dataTable/dataTables.bootstrap.min.js"></script>
    <script src="../../js/dataTable/dataTables.responsive.min.js"></script>
    <script src="../../js/dataTable/responsive.bootstrap.js"></script>
    <script src="../../js/dataTable/dataTables.scroller.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../../js/custom.min.js"></script>
    <script src="../../js/toastr.min.js"></script>
    <script src="../../js/sweetalert2.min.js"></script>
    <script>
  $(function() {
    var Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000
    });

    $('.swalDefaultSuccess').click(function() {
      Toast.fire({
        icon: 'success',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.swalDefaultInfo').click(function() {
      Toast.fire({
        icon: 'info',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.swalDefaultError').click(function() {
      Toast.fire({
        icon: 'error',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.swalDefaultWarning').click(function() {
      Toast.fire({
        icon: 'warning',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.swalDefaultQuestion').click(function() {
      Toast.fire({
        icon: 'question',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });

    $('.toastrDefaultSuccess').click(function() {
      toastr.success('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
    });
    $('.toastrDefaultInfo').click(function() {
      toastr.info('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
    });
    $('.toastrDefaultError').click(function() {
      toastr.error('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
    });
    $('.toastrDefaultWarning').click(function() {
      toastr.warning('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
    });

    $('.toastsDefaultDefault').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultTopLeft').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        position: 'topLeft',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultBottomRight').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        position: 'bottomRight',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultBottomLeft').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        position: 'bottomLeft',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultAutohide').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        autohide: true,
        delay: 750,
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultNotFixed').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        fixed: false,
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultFull').click(function() {
      $(document).Toasts('create', {
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        icon: 'fas fa-envelope fa-lg',
      })
    });
    $('.toastsDefaultFullImage').click(function() {
      $(document).Toasts('create', {
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        image: '../../dist/img/user3-128x128.jpg',
        imageAlt: 'User Picture',
      })
    });
    $('.toastsDefaultSuccess').click(function() {
      $(document).Toasts('create', {
        class: 'bg-success',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultInfo').click(function() {
      $(document).Toasts('create', {
        class: 'bg-info',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultWarning').click(function() {
      $(document).Toasts('create', {
        class: 'bg-warning',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultDanger').click(function() {
      $(document).Toasts('create', {
        class: 'bg-danger',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultMaroon').click(function() {
      $(document).Toasts('create', {
        class: 'bg-maroon',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
  });
</script>
</body>
</html>