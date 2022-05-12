
        $(document).ready(function () {
          $(document).on("click","#add_subjects",function(){
            
	        var subject =false;
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
            if(subject == true)
            {
               $("#subject_name").css("border-color","green") ;
               $("#subject_name").css("background-color","white");
               $("#subject_name_error").css("color","green") ;
               $("#subject_name_error").html("") ;
               $("#add_subject").prop("disabled",false);
               return subject == true ;
            }
            else
            {
               $("#subject_name").css("border-color","red") ;
               $("#subject_name").css("background-color","pink");
               $("#subject_name").focus();
               $("#subject_name_error").css("color","red") ;
               $("#subject_name_error").html("Please Input Category Name") ;
               $("#add_subject").prop("disabled",true);
               return subject == false;
            }
 });
 
 $("#subject_name").keyup(function()
 {
    if($("#subject_name").val() != "" || $("#subject_name").val() != null)
          {
             $("#subject_name").css("border-color","green") ;
             $("#subject_name").focus();
             $("#subject_name").css("background-color","white");
             $("#subject_name_error").css("color","green") ;
             $("#subject_name_error").html("") ;
             $("#add_subject").prop("disabled",false);
             return subject = true ;
          }
          else
          {
             $("#subject_name").css("border-color","red") ;
             $("#subject_name").css("background-color","pink");
             $("#subject_name").focus();
             $("#subject_name_error").css("color","red") ;
             $("#subject_name_error").html("Please Input Category Name") ;
             $("#add_subject").prop("disabled",true);
             return subject = false ;
          }
  });
});