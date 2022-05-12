
var  isHeightSchoolName = false,isStartHeightSchool = false, isEndHeightSchool = false ;
var isPrimaryName = false,isStartPrimary = false, isEndprimary =false ;
var  isUniverSityName = false ,isStartUniverSity = false ,isEndUniverSity =false ,isSkill = false , isTypeTeacher = false ,islevel = false ;


$(document).ready(function (e) {
 
      $('.registration-form fieldset:first-child').fadeIn('slow');
      var next_step =true;
     

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      // previous step
      
      
      $('.registration-form .btn-previous').on('click', function () 
      {
          $(this).parents('fieldset').fadeOut(400, function ()
           {
              $(this).prev().fadeIn();
              $("#next-1").prop("disabled",false);   
              $("#next-2").prop("disabled",false);
              $("#next-3").prop("disabled",false);      
              $("#next-4").prop("disabled",false); 
          });
      });


    
    

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

     $("#primary_school_name").keyup(function()
     {
           if( $("#primary_school_name").val() == "" || $("#primary_school_name").val() == null )
           {
                 $("#primary_school_name").css("border-color","red");
                 $("#primary_school_name").css("background-color","pink");
                 $("#primary_school_name").focus();
                  $("#next-1").prop("disabled",true);
                 $("#primary_error").html("Plaese Input PrimarySchool Name ..... !!!") ;
                 $("#primary_error").css("font-size","16");
                 $("#primary_error").css("font-weight","bold");
                 return isPrimaryName = false;
           }
           else if( $("#primary_school_name").val().length <= 2)
           {
                 $("#primary_school_name").css("border-color","red");
                 $("#primary_school_name").css("background-color","pink");
                 $("#primary_school_name").focus();
                 $("#next-1").prop("disabled",true);
                 $("#primary_error").html("Plaese Input PrimarySchool Name Then 2 Charictor ..... !!!") ;
                 $("#primary_error").css("font-size","16");
                 $("#primary_error").css("font-weight","bold");
                 return isPrimaryName = false;
           }
           else if($("#primary_school_name").val() != "" )
           {
                 $("#primary_school_name").css("border-color","green");
                 $("#primary_school_name").css("background-color","");
                 $("#next-1").prop("disabled",false);
                 $("#primary_error").html("");
                 return isPrimaryName =true;
           }
           else
           {
                 $("#primary_school_name").css("border-color","red");
                 $("#primary_school_name").css("background-color","pink");
                 $("#primary_school_name").focus();
                 $("#next-1").prop("disabled",true);
                 $("#primary_error").html("PrimarySchool Name Is Valid Plaese Try again ..... !!!") ;
                 $("#primary_error").css("font-size","16");
                 $("#primary_error").css("font-weight","bold");
                 return isPrimaryName =false;
           }
           
     });  

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
$("#start_primaryschool_date").change(function()
{
     
     if($("#start_primaryschool_date").val() == "0")
     {
          $("#start_primaryschool_date").css("border-color","red") ;
          $("#start_primaryschool_date").css("background-color","pink");
          $("#start_primaryschool_date").focus();
          $("#next-1").prop("disabled",true);
          $("#start_primaryschool_date_error").html("Please Select StartYear In PrimarySchool....!");
          return isStartPrimary= false
     }
     else
     {
          $("#start_primaryschool_date").css("border-color","green") ;
          $("#start_primaryschool_date").css("background-color","");
          $("#next-1").prop("disabled",false);
          $("#start_primaryschool_date_error").html("");   
          return isStartPrimary= true;
     }
    
 });

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#end_primaryschool_date").change(function()
{
     if($("#end_primaryschool_date").val() == "0")
     {
          $("#end_primaryschool_date").css("border-color","red") ;
          $("#end_primaryschool_date").css("background-color","pink");
          $("#end_primaryschool_date").focus();
          $("#next-1").prop("disabled",true);
          $("#end_primaryschool_date_error").html("Please Select EndYear In PrimarySchool.....!");
          $("#end_primaryschool_date_error").css("font-size","16");
           $("#end_primaryschool_date_error").css("font-weight","bold");
          return isEndprimary = false;
     }
     else
     {
          $("#end_primaryschool_date").css("border-color","green") ;  
          $("#end_primaryschool_date").css("background-color","");
          $("#next-1").prop("disabled",false);
          $("#end_primaryschool_date_error").html("");  
          return isEndprimary = true;
     }
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////                                    END NEXT 1                                      ///////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




  
$("#heightschool_name").keyup(function(){
                       
    if( $("#heightschool_name").val() == "" || $("#heightschool_name").val() == null )
    {
          $("#heightschool_name").css("border-color","red");
          $("#heightschool_name").css("background-color","pink");
          $("#heightschool_name").focus();
          $("#next-2").prop("disabled",true);
          $("#heightschool_name_error").html("Plaese Input Height School Name ..... !!!") ;
          $("#heightschool_name_error").css("font-size","16");
          $("#heightschool_name_error").css("font-weight","bold");
          return isHeightSchoolName = false;
    }
    if($("#heightschool_name").val().length <= 2)
    {
          $("#heightschool_name").css("border-color","red");
          $("#heightschool_name").css("background-color","pink");
          $("#heightschool_name").focus();
          $("#next-2").prop("disabled",true);
          $("#heightschool_name_error").html("Plaese Input Height School  Name Then 2 Charictor ..... !!!") ;
          $("#heightschool_name_error").css("font-size","16");
          $("#heightschool_name_error").css("font-weight","bold");
          return isHeightSchoolName = false;
    }
    if($("#heightschool_name").val() !="")
    {
          $("#heightschool_name").css("border-color","green");
          $("#heightschool_name").css("background-color","");
          $("#heightschool_name").focus();
          $("#next-2").prop("disabled",false);
          $("#heightschool_name_error").html("") ;
          return isHeightSchoolName = true;
    }
    else
    {
          $("#heightschool_name").css("border-color","red");
          $("#heightschool_name").css("background-color","pink");
          $("#heightschool_name").focus();
          $("#next-2").prop("disabled",true);
           $("#heightschool_name_error").html("Height School Name Is Valid Plaese Try again ..... !!!") ;
           $("#heightschool_name_error").css("font-size","16");
           $("#heightschool_name_error").css("font-weight","bold");
          return isHeightSchoolName = false;
    }
});


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#start_heightschool_date").change(function()
{
     if( $("#start_heightschool_date").val() == "0")
  	{
           $("#start_heightschool_date").css("border-color","red");
           $("#start_heightschool_date").css("backgroud-color","pink");
           $("#start_heightschool_date").focus();
           $("#next-2").prop("disabled",true);
           $("#start_heightschool_date_error").html("Plaese Select StartYear HeightSchool ..... !!!") ;
           $("#start_heightschool_date_error").css("font-size","16");
           $("#start_heightschool_date_error").addClass("input-error");
           $("#start_heightschool_date_error").css("font-weight","bold");
           return isStartHeightSchool = false;
  	}
  	else

  	{
           $("#start_heightschool_date").css("border-color","green");
           $("#start_heightschool_date").css("backgroud-color","");
           $("#next-2").prop("disabled",false);
           $("#start_heightschool_date_error").removeClass("input-error");
           $("#start_heightschool_date_error").html("") ;
           return isStartHeightSchool =true;
     }
  });
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
$("#end_heightschool_date").change(function()
{
     if( $("#end_heightschool_date").val() == "0")
     {
          
           $("#end_heightschool_date").css("border-color","red");
           $("#end_heightschool_date").css("background-color","pink");
           $("#end_heightschool_date").focus();
           $("#next-2").prop("disabled",true);
           $("#end_heightschool_date_error").html("Plaese Select EndYear  HeightSchool ..... !!!") ;
           $("#end_heightschool_date_error").css("font-size","16");
           $("#end_heightschool_date_error").css("font-weight","bold");
           return isEndHeightSchool = false;
     }
     else
     {
           $("#end_heightschool_date").css("border-color","green");
           $("#end_heightschool_date").css("background-color","");
           $("#next-2").prop("disabled",false);
           $("#end_heightschool_date_error").html("") ;
           return isEndHeightSchool =true;
     }             
   });

// //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
/////////////////////////////////////////                           END NEXT 2                          //////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   $("#start_university_date").change(function()
   {
     if( $("#start_university_date").val() == "0")
     {
           $("#start_university_date").css("border-color","red");
           $("#start_university_date").css("background-color","pink");
           $("#next-3").prop("disabled",true);
           $("#start_university_date").focus();
           $("#start_universety_error").html("Plaese Select StartYear UniverSity ..... !!!") ;
           $("#start_universety_error").css("font-size","16");
           $("#start_universety_error").css("font-weight","bold");
           return isStartUniverSity = false;
     }
     else
     {
           $("#start_university_date").css("border-color","green");
           $("#start_university_date").css("background-color","");
           $("#next-3").prop("disabled",false);
           $("#start_universety_error").html("");
           return isStartUniverSity =true;
     }  
});
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#end_university_date").change(function()
{
     if( $("#end_university_date").val() == "0"  )
     {
           $("#end_university_date").css("border-color","red");
           $("#end_university_date").css("background-color","pink");
           $("#next-3").prop("disabled",true);
           $("#end_university_date").focus();
           $("#end_university_error").html("Plaese Select EndYear UniverSity ..... !!!") ;
           $("#end_university_error").css("font-size","16");
           $("#end_university_error").css("font-weight","bold");
           return isEndUniverSity = false;
     }
     else
     {
           $("#end_university_date").css("border-color","green");
           $("#end_university_date").css("background-color","");
           $("#next-3").prop("disabled",false);
           $("#end_university_error").html("") ;
           return isEndUniverSity =true;
     }
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#teacher_type").change(function()
{
     if($("#teacher_type").val() == "0"  )
     {
           $("#teacher_type").css("border-color","red");                                                 
           $("#teacher_type").css("background-color","pink");
           $("#next-3").prop("disabled",true);
           $("#teacher_type").focus();
           $("#teacher_type_error").html("Plaese Select Country ..... !!!") ;
           $("#teacher_type_error").css("font-size","16");
           $("#teacher_type_error").css("font-weight","bold");
           return isTypeTeacher = false; 
     }
     else
     {
           $("#teacher_type").css("border-color","green");
           $("#teacher_type").css("background-color","");
           $("#next-3").prop("disabled",false);
           $("#teacher_type_error").html("");
           return isTypeTeacher =true;
     }
});

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////// ////////////////////////
// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


  
$("#universety_name").keyup(function(){
                       
    if( $("#universety_name").val() == "" )
    {
          $("#universety_name").css("border-color","red");
          $("#universety_name").css("background-color","pink");
          $("#next-3").prop("disabled",true);
          $("#universety_name_error").html("Plaese Input UniverSity Name ..... !!!") ;
          $("#universety_name_error").css("font-size","16");
          $("#universety_name_error").css("font-weight","bold");
          return isUniverSityName = false;
    }
    if($("#universety_name").val().length <= 2)
    {
          $("#universety_name").css("border-color","red");
          $("#universety_name").css("background-color","pink");
          $("#next-3").prop("disabled",true);
          $("#universety_name_error").html("Plaese Input UniverSity  Name Then 2 Charictor ..... !!!") ;
          $("#universety_name_error").css("font-size","16");
          $("#universety_name_error").css("font-weight","bold");
          return isUniverSityName = false;
    }
    if($("#universety_name").val() != "" )
    {
          $("#universety_name").css("border-color","green");
          $("#universety_name").css("background-color","");
          $("#next-3").prop("disabled",false);
          $("#universety_name_error").html("") ;
          return isUniverSityName = true;
    }
    else
    {
          $("#universety_name").css("border-color","red");
          $("#universety_name").css("background-color","pink");
          $("#universety_name").focus();
          $("#next-3").prop("disabled",true);
           $("#universety_name_error").html("UniverSity Name Is Valid Plaese Try again ..... !!!") ;
           $("#universety_name_error").css("font-size","16");
           $("#universety_name_error").css("font-weight","bold");
          return isUniverSityName = false;
    }
});





// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


  
$("#level").keyup(function(){
                       
    if( $("#level").val() == "" || $("#level").val() == null )
    {
          $("#level").css("border-color","red");
          $("#level").css("background-color","pink");
          $("#level").focus();
          $("#next-3").prop("disabled",true);
          $("#level_error").html("Plaese Input Level ..... !!!") ;
          $("#level_error").css("font-size","16");
          $("#level_error").css("font-weight","bold");
          return isLevel = false;
    }
    if($("#level").val().length <= 2)
    {
          $("#level").css("border-color","red");
          $("#level").css("background-color","pink");
          $("#next-3").prop("disabled",true);
          $("#level_error").html("Plaese Input Level Then 2 Charictor ..... !!!") ;
          $("#level_error").css("font-size","16");
          $("#level_error").css("font-weight","bold");
          return isLevel = false;
    }
    if($("#level").val() != "" )
    {
          $("#level").css("border-color","green");
          $("#level").css("background-color","");
          $("#next-3").prop("disabled",false);
          $("#level_error").html("") ;
          return isLevel = true;
    }
    else
    {
          $("#level").css("border-color","red");
          $("#level").css("background-color","pink");
          $("#next-3").prop("disabled",true);
           $("#level_error").html(" Level Is Valid Plaese Try again ..... !!!") ;
           $("#level_error").css("font-size","16");
           $("#level_error").css("font-weight","bold");
          return isLevel = false;
    }
});









////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


 
$("#skill").keyup(function(){
                       
      if( $("#skill").val() == "" || $("#skill").val() == null )
      {
            $("#skill").css("border-color","red");
            $("#skill").css("background-color","pink");
            $("#next-3").prop("disabled",true);
            $("#skill_error").html("Plaese Input Skill ..... !!!") ;
            $("#skill_error").css("font-size","16");
            $("#skill_error").css("font-weight","bold");
            return isSkill = false;
      }
      else  if($("#skill").val().length <= 2)
      {
            
            $("#skill").css("border-color","red");
            $("#skill").css("background-color","pink");
            $("#next-3").prop("disabled",true);
            $("#skill_error").html("Plaese Input Skill Then 2 Charictor ..... !!!") ;
            $("#skill_error").css("font-size","16");
            $("#skill_error").css("font-weight","bold");
            return isSkill = false;
      }
    else if($("#skill").val() != "" )
      {
            $("#skill").css("border-color","green");
            $("#skill").css("background-color","");
            $("#next-3").prop("disabled",false);
            $("#skill_error").html("") ;
            return isSkill = true;
      }
      else
      {
            
            $("#skill").css("border-color","red");
            $("#skill").css("background-color","pink");
            $("#next-3").prop("disabled",true);
            $("#skill_error").html("Skill Is Valid ..... !!!") ;
            $("#skill_error").css("font-size","16");
            $("#skill_error").css("font-weight","bold");
            return isSkill = false;
      }
  });
  
  



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////                                      END  NEXT 3                   ///////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



     $("#next-1").click(function(){
           if( isPrimaryName == false || isEndprimary == false || isStartPrimary == false  )
           {
                    $("#primary_school_name").focus().addClass("input-error");     
                    $("#start_primaryschool_date").focus().addClass("input-error");      
                    $("#end_primaryschool_date").focus().addClass("input-error");      
                    $("#next-1").prop("disabled",true); 
                    $("#step_one").show();
                    next_step=false;  
           }
           else
           {    
                    $("#primary_school_name").removeClass("input-error");      
                    $("#start_primaryschool_date_error").removeClass("input-error");
                    $("#end_primaryschool_date").removeClass("input-error");      
                    $("#next-1").prop("disabled",false);
                    $("#step_two").show();
                    $("#step_one").hide();
                    next_step=true;
           }
    });

    
    $("#next-2").click(function(){

           if(  isHeightSchoolName == false || isStartHeightSchool == false || isEndHeightSchool == false )
                 { 
                        $("#heightschool_name").focus().addClass("input-error");      
                        $("#start_heightschool_date").focus().addClass("input-error");     
                        $("#end_heightschool_date").focus().addClass("input-error");
                        $("#next-2").prop("disabled",true);
                        $("#step_two").show();
                        next_step=false;    
                 }
           else
                 {
                 
                        $("#heightschool_name").removeClass("input-error");      
                        $("#start_heightschool_date").removeClass("input-error");     
                        $("#end_heightschool_date").removeClass("input-error"); 
                        $("#next-2").prop("disabled",false);
                        $("#step_two").hide();
                        $("#step_tree").show();
                        next_step=true;
                 }
});


$("#next-3").click(function(){

      if(  isUniverSityName == false || isStartUniverSity == false || isEndUniverSity == false || isSkill == false || isLevel == false || isTypeTeacher == false  )
            { 
                   $("#skill").focus().addClass("input-error");      
                   $("#level").focus().addClass("input-error");     
                   $("#teacher_type").focus().addClass("input-error");
                   $("#end_university_date").focus().addClass("input-error");     
                   $("#start_university_date").focus().addClass("input-error");
                   $("#universety_name").focus().addClass("input-error");

                   $("#next-3").prop("disabled",true);

                   $("#step_tree").show();
                   alert("You Are Add Education Teacher Error Please Try Again.............!!!!");

                   next_step=false;    
            }
      else
            {
            
                   $("#skill").removeClass("input-error");      
                   $("#level").removeClass("input-error");     
                   $("#teacher_type").removeClass("input-error"); 
                   $("#end_university_date").removeClass("input-error");
                  $("#start_university_date").removeClass("input-error")
                  $("#universety_name").removeClass("input-error");
                   $("#next-3").prop("disabled",false);
                   alert("You Are Add Education Teacher Success Fully.............!");
                   $("#step_tree").hide();
                   $("#step_four").show();
                   next_step=true;
            }
});                                                                                                     

   $("#previous-2").click(function()
   {
      $("#step_one").show();
      $("#step_two").hide();
   });

   $("#previous-3").click(function()
   {
      $("#step_two").show();
      $("#step_tree").hide();
   });
   $("#previous-4").click(function()
   {
      $("#step_tree").show();
      $("#step_four").hide();
   });




 });





 
   	

 
                

   
   












