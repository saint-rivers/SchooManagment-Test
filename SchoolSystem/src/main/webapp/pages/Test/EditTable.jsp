<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Vendor CSS -->
		<link rel="stylesheet" href="../../css/bootstrap.css">
		<link rel="stylesheet" href="../../css/font-awesome.css">
		<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css">
		<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css">

		<!-- Specific Page Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/select2/select2.css">
		<link rel="stylesheet" href="../../css/tabaTable/datatables.css">

		<!-- Theme CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme.css">

		<!-- Skin CSS -->
		<link rel="stylesheet" href="assets/stylesheets/skins/default.css">

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

		<!-- Head Libs -->
		<script src="assets/vendor/modernizr/modernizr.js"></script>

</head>
<body>
	<section class="panel">		
		<div class="panel-body" style="display: block;">
			<div class="row">
				<div class="col-sm-6">
					<div class="mb-md">
						<button id="addToTable" class="btn btn-primary p-1" disabled="disabled">Add <i class="fa fa-plus"></i></button>
					</div>
				</div>
			</div>
			<div id="datatable-editable_wrapper" class="dataTables_wrapper no-footer">
				
				<div class="table-responsive">
					<table class="table table-bordered table-striped mb-none dataTable no-footer" id="datatable-editable" role="grid" aria-describedby="datatable-editable_info">
						<thead>
							<tr role="row">
								<th class="sorting_asc" tabindex="0" aria-controls="datatable-editable" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending" aria-sort="ascending" style="width: 191.017px;">ល.រ.</th>
								<th class="sorting" tabindex="0" aria-controls="datatable-editable" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 254.017px;">ឈ្មោះ</th>
								<th class="sorting" tabindex="0" aria-controls="datatable-editable" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 228.017px;">ភេទ</th>
								<th class="sorting" tabindex="0" aria-controls="datatable-editable" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 228.017px;">ពិន្ទុ</th>
								<th class="sorting_disabled" rowspan="1" colspan="1" aria-label="Actions" style="width: 90.0168px;">Actions</th>
							</tr>
						</thead>
						<tbody>
							<tr role="row" class="adding odd">
								<td class="sorting_1"><input type="text" class="form-control input-block" value=""></td>
								<td><input type="text" class="form-control input-block" value=""></td>
								<td><input type="text" class="form-control input-block" value=""></td>
								
								<td class="actions">
									<a href="#" class="on-editing save-row"><i class="fa fa-save"></i></a> 
									<a href="#" class="on-editing cancel-row"><i class="fa fa-times"></i></a> 
									<a href="#" class="on-default edit-row hidden"><i class="fa fa-pencil"></i></a> 
									<a href="#" class="on-default remove-row hidden"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
							<tr role="row" class="even">
								<td class="sorting_1">12</td>
								<td>12</td>
								<td>12</td>
								<td class="actions">
									<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a> 
									<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a> 
									<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a> 
									<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
							<tr class="gradeA odd" role="row">
								<td class="sorting_1"><input type="text" class="form-control input-block" value="Gecko"></td>
								<td><input type="text" class="form-control input-block" value="Firefox 1.0"></td>
								<td><input type="text" class="form-control input-block" value="Win 98+ / OSX.2+"></td>
								<td class="actions"><a href="#" class="on-editing save-row"><i class="fa fa-save"></i></a>
									<a href="#" class="on-editing cancel-row"><i class="fa fa-times"></i></a>
									<a href="#" class="on-default edit-row hidden"><i class="fa fa-pencil"></i></a>
									<a href="#" class="on-default remove-row hidden"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
							<tr class="gradeA even" role="row">
								<td class="sorting_1">Gecko</td>
								<td>Firefox 1.5</td>
								<td>Win 98+ / OSX.2+</td>
								<td class="actions">
									<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
									<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
									<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
									<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
							<tr class="gradeA odd" role="row">
								<td class="sorting_1">Gecko</td>
								<td>Firefox 2.0</td>
								<td>Win 98+ / OSX.2+</td>
								<td class="actions">
									<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
									<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
									<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
									<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
							<tr class="gradeA even" role="row">
								<td class="sorting_1">Gecko</td>
								<td>Firefox 3.0</td>
								<td>Win 2k+ / OSX.3+</td>
								<td class="actions">
									<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
									<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
									<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
									<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
							<tr class="gradeA odd" role="row">
								<td class="sorting_1">Gecko</td>
								<td>Camino 1.0</td>
								<td>OSX.2+</td>
								<td class="actions">
									<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
									<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
									<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
									<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
							<tr class="gradeA even" role="row">
								<td class="sorting_1">Gecko</td>
								<td>Camino 1.5</td>
								<td>OSX.3+</td>
								<td class="actions">
									<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
									<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
									<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
									<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
							<tr class="gradeA odd" role="row">
								<td class="sorting_1">Gecko</td>
								<td>Netscape 7.2</td>
								<td>Win 95+ / Mac OS 8.6-9.2</td>
								<td class="actions">
									<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
									<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
									<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
									<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
							<tr class="gradeA even" role="row">
								<td class="sorting_1">Gecko</td>
								<td>Netscape Browser 8</td>
								<td>Win 98SE+</td>
								<td class="actions">
									<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
									<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
									<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
									<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>				
			</div>
		</div>
	</section>
<!-- Vendor -->
		<script src="../../js/jquery.min.js"></script>
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="../../js/bootstrap.min.js"></script>
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
		<!-- Specific Page Vendor -->
		<script src="assets/vendor/select2/select2.js"></script>
		<script src="../../js/dataTable/jquery.dataTables.js"></script>
		<script src="../../js/dataTable/datatables.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>


		<!-- Examples -->
		<script src="../../js/dataTable/examples.datatables.editable.js"></script>
</body>
</html>