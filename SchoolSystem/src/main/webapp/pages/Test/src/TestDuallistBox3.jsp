<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.services.ClassStudyService" %>
<%@ page import="bean.ClassStudyBean" %>
<%@ page import="db.services.StudentService" %>
<%@ page import="bean.StudentBean" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bootstrap Dual Listbox</title>
  <link rel="stylesheet" href="../../css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/prettify/r298/prettify.min.css">
  <link rel="stylesheet" type="text/css" href="../src/bootstrap-duallistbox.css">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="../../js/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="../../js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
  <script src="../src/jquery.bootstrap-duallistbox.js"></script>
</head>
<body class="container">
		
			<form id="demoform" action="#" method="post">
			  <select multiple="multiple" size="10" name="duallistbox_student" title="duallistbox_demo1[]">
			    <option value="option1">Option 1</option>
			    <option value="option2">Option 2</option>
			    <option value="option3" selected="selected">Option 3</option>
			    <option value="option4">Option 4</option>
			    <option value="option5">Option 5</option>
			    <option value="option6" selected="selected">Option 6</option>
			    <option value="option7">Option 7</option>
			    <option value="option8">Option 8</option>
			    <option value="option9">Option 9</option>
			    <option value="option0">Option 10</option>
			  </select>
			  <br>
			  <button type="submit" class="btn btn-default btn-block">Submit data</button>
			</form>
			<script>
			  var demo1 = $('select[name="duallistbox_student"]').bootstrapDualListbox();
			  $("#demoform").submit(function() {
			    alert($('[name="duallistbox_student"]').val());
			    return false;
			  });
			</script>
			<div class="row">
			  <div class="col-md-7">
			    <select multiple="multiple" size="10" name="duallistbox_demo2" class="demo2" title="duallistbox_demo2">
			      <option value="option1">Option 1</option>
			      <option value="option2">Option 2</option>
			      <option value="option3" selected="selected">Option 3</option>
			      <option value="option4">Option 4</option>
			      <option value="option5">Option 5</option>
			      <option value="option6" selected="selected">Option 6</option>
			      <option value="option7">Option 7</option>
			      <option value="option8">Option 8</option>
			      <option value="option9">Option 9</option>
			      <option value="option0">Option 10</option>
			      <option value="option0">Option 11</option>
			      <option value="option0">Option 12</option>
			      <option value="option0">Option 13</option>
			      <option value="option0">Option 14</option>
			      <option value="option0">Option 15</option>
			      <option value="option0">Option 16</option>
			      <option value="option0">Option 17</option>
			      <option value="option0">Option 18</option>
			      <option value="option0">Option 19</option>
			      <option value="option0">Option 20</option>
			    </select>
			    <script>
			      var demo2 = $('.demo2').bootstrapDualListbox({
			        nonSelectedListLabel: 'Non-selected',
			        selectedListLabel: 'Selected',
			        preserveSelectionOnMove: 'moved',
			        moveOnSelect: false,
			        nonSelectedFilter: 'ion ([7-9]|[1][0-2])'
			      });
			    </script>
			  </div>
			</div>
</body>
</html>