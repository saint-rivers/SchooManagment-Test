$(document).ready(function()
{
      var subject_category = false ;
    $(document).on("click",".add_subject_category",function()
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
         if(subject_category == true)
         {
             $("#category_name").css("border-color","green") ;
             $("#category_name").focus();
             $("#category_name").css("background-color","white");
             $("#category_name_error").css("color","green") ;
             $("#category_name_error").html("") ;
             $(".add_subject_category").prop("disabled",false);
            return subject_category == true
         }     
         else
         {
            $("#category_name").css("border-color","red") ;
             $("#category_name").css("background-color","pink");
             $("#category_name").focus();
             $("#category_name_error").css("color","red") ;
             $("#category_name_error").html("Please Input Category Name") ;
             $(".add_subject_category").prop("disabled",true);
             return subject_category == false;
         }
 });
 $("#category_name").keyup(function()
 {
    if($("#category_name").val() != "" || $("#category_name").val() != null)
          {
             $("#category_name").css("border-color","green") ;
             $("#category_name").focus();
             $("#category_name").css("background-color","white");
             $("#category_name_error").css("color","green") ;
             $("#category_name_error").html("") ;
             $(".add_subject_category").prop("disabled",false);
             return subject_category =true;
          }
          else
          {
             $("#category_name").css("border-color","red") ;
             $("#category_name").css("background-color","pink");
             $("#category_name").focus();
             $("#category_name_error").css("color","red") ;
             $("#category_name_error").html("Please Input Category Name") ;
             $(".add_subject_category").prop("disabled",true);
             return subject_category = false;
          }
 });
});