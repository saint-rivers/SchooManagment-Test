$(document).ready(function()
{
   var Score = true ;
    $(document).on("click",".submit_score",function()
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
         if(Score == true)
           {
	          $("#score").css("border-color","green") ;
               $("#score").css("background-color","white");
               $("#score_error").css("color","green") ;
               $("#score_error").html("") ;
               $(".submit_score").prop("disabled",false);
               return Score == true ;
                
               alert("Add Score SuccessFull...........");
             }
         else
           {
	           $("#score").css("border-color","red") ;
               $("#score").css("background-color","pink");
               $("#score").focus();
               $("#score_error").css("color","red") ;
               $(".submit_score").prop("disabled",true);
               return Score == false;
             alert("Add Score Error...........");
           }
 });

 $("#score").keyup(function()
 {
    if( $("#score").val() !=0 )
          {
             $("#score").css("border-color","green") ;
               $("#score").css("background-color","white");
               $("#score_error").css("color","green") ;
               $("#score_error").html("") ;
               $(".submit_score").prop("disabled",false);
               return Score == true ;
            }
      else
            {
               $("#score").css("border-color","red") ;
               $("#score").css("background-color","pink");
               $("#score").focus();
               $("#score_error").css("color","red") ;
               $("#score_error").html("Score Can Null.......") ;
               $(".submit_score").prop("disabled",true);
               return Score == false;
            }
 });
});

