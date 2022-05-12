<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/customStyle/MultiCheckboxStudent.css">
<script src="../../js/jquery.min.js"></script> 
    <script>
        $(document).ready(function () {
            $("#test").CreateMultiCheckBox({
            	width: '230px', defaultText : 'Select Below', height:'250px' 
            });
        });
    </script>
    <script src="../../js/custom_js/MultiCheckboxStudent.js"></script>
</head>
<body>
	 <select id="test">
        <option value="1">American Black Bear</option>
        <option value="2">Asiatic Black Bear</option>
        <option value="3">Brown Bear</option>
        <option value="4">Giant Panda</option>
        <option value="5">Sloth Bear</option>
        <option value="6">Sun Bear</option>
        <option value="7">Polar Bear</option>
        <option value="8">Spectacled Bear</option>
    </select>
</body>
</html>