<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title> 
<link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../../css/font-awesome.min.css" rel="stylesheet">
    <link href="../../webcss/all.min.css" rel="stylesheet"> <!--load all styles -->
    <!-- Custom Theme Style -->
    <link href="../../css/custom.min.css" rel="stylesheet">
    <link href="../../css/dataTable/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../../css/dataTable/scroller.bootstrap.min.css" rel="stylesheet">
    
<link rel="stylesheet" href="../../css/customStyle/multiselect.css">
<script type="text/javascript" src="../../js/custom_js/multiselect.min.js"></script>
<script src="../../js/jquery.min.js"></script> 
</head>
<body>						
	 <div class="container">
	 	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
		  Open modal
		</button>
		  <!-- The Modal -->
		  <div class="modal fade" id="myModal">
		    <div class="modal-dialog modal-md">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title" id="student_class"></h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
		        	<form id="formmulticheck">
			          	<div class="form-group row">
							<div class="col-md-6 col-sm-6  form-group">
								<input type="hidden" id="class_id" class="form-control" value="">
								<select id='testSelect1' multiple>
									<option value='1'>Item 1</option>
									<option value='2' selected>Item 2</option>
									<option value='3' selected>Item 3</option>
									<option value='4'>Item 4</option>
									<option value='5'>Item 5</option>
								</select>
								
								<script>
									document.multiselect('#testSelect1')
										.setCheckBoxClick("checkboxAll", function(target, args) {
											console.log("Checkbox 'Select All' was clicked and got value ", args.checked);
										})
										.setCheckBoxClick("1", function(target, args) {
											console.log("Checkbox for item with value '1' was clicked and got value ", args.checked);
										});
									
									function enable() {
										document.multiselect('#testSelect1').setIsEnabled(true);
									}
								
									function disable() {
										document.multiselect('#testSelect1').setIsEnabled(false);
									}
									
								</script>
								
							</div>
						</div>
					</form>
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        </div>
		        
		      </div>
		    </div>
		  </div>
		  
		</div>
		 <!-- Bootstrap -->
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <!-- Datatables -->
    <script src="../../js/dataTable/jquery.dataTables.min.js"></script>
    <script src="../../js/dataTable/dataTables.bootstrap.min.js"></script>
    <script src="../../js/dataTable/dataTables.responsive.min.js"></script>
    <script src="../../js/dataTable/responsive.bootstrap.js"></script>
    <script src="../../js/dataTable/buttons.bootstrap.min.js"></script>
    <script src="../../js/dataTable/dataTables.scroller.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../../js/custom.min.js"></script>
    
   
</body>
</html>