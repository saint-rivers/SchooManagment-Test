$(document).ready(function()
{
	var sub_subject_name=false ;
	
    $(document).on("click",".add_sub_subject",function()
    {
            var date = new Date($.now());
		    var month = date.getMonth() +1;
		    var year = date.getFullYear();
		    var today = date.getDay();
		    var house = date.getHours();
		    var minute = date.getMinutes() ;
		    var second = date.getSeconds();
            var current_date = today +"-" + month + "-" + year ;
            var current_time = house +":"+ minute+":"+ second ;
            $("#input_date").val(current_date);
            $("#time").val(current_time);
        
	    if(sub_subject_name == true )
         {
            $("#sub_subject_name").css("border-color","green") ;
            $("#sub_subject_name").focus();
			  $("#sub_subject_name").css("background-color","white");
            $("#sub_subject_name_error").css("color","green") ;
            $("#sub_subject_name_error").html("") ;
            $(".add_sub_subject").prop("disabled",false);
            return sub_subject_name = true;
         }
         else
         {
            $("#sub_subject_name").css("border-color","red") ;
            $("#sub_subject_name").css("background-color","pink");
            $("#sub_subject_name").focus();
            $("#sub_subject_name_error").css("color","red") ;
            $("#sub_subject_name_error").html("Please Input Sub Subject  Name") ;
            $(".add_sub_subject").prop("disabled",true);
            return sub_subject_name = false;
         }
  });
$("#sub_subject_name").keyup(function()
    {
         if($("#sub_subject_name").val() != "" || $("#sub_subject_name").val() != null)
         {
            $("#sub_subject_name").css("border-color","green") ;
            $("#sub_subject_name").focus();
			  $("#sub_subject_name").css("background-color","white");
            $("#sub_subject_name_error").css("color","green") ;
            $("#sub_subject_name_error").html("") ;
            $(".add_sub_subject").prop("disabled",false);
            return sub_subject_name = true;
         }
         else
         {
            $("#sub_subject_name").css("border-color","red") ;
            $("#sub_subject_name").css("background-color","pink");
            $("#sub_subject_name").focus();
            $("#sub_subject_name_error").css("color","red") ;
            $("#sub_subject_name_error").html("Please Input Sub Subject  Name") ;
            $(".add_sub_subject").prop("disabled",true);
            return sub_subject_name = false;
         }
     });   
});