
var  isHeightSchoolName = false,isStartHeightSchool = false, isEndHeightSchool = false ;
var isPrimaryName = false,isStartPrimary = false, isEndprimary =false ;
var  isUniverSityName = false ,isStartUniverSity = false ,isEndUniverSity =false ,isSkill = false , isTypeTeacher = false ,islevel = false ;


$(document).ready(function () {
      $('.registration-form fieldset:first-child').fadeIn('slow');
      var next_step =true;
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
     function Prim_Mary_Name(primary_name) {
           if (primary_name == "") {
                 throw ("PrimarySchool Can Not Empty........!");
           }
           else if (!isNaN(primary_name )){
                 throw ("PrimarySchool Can Not Input Number.......!");
           }
           else{
                 throw ("") ;
           }
           
     }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function Prim_Mary_Start(primary_Start) {
            if (primary_Start == "") {
                  throw ("Please Select Start Year Inprimary School........!");
            }
           
            else {
                  throw ("");
            }

      }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function Prim_Mary_End(primary_End) {
            if (primary_End == "") {
                  throw ("Please Select End Year Inprimary School........!");
            }

            else {
                  throw ("");
            }

      }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function High_School_Name(height_name) {
            if (height_name == "") {
                  throw ("Hight School Can Not Empty........!");
            }
            else if (!isNaN(height_name)) {
                  throw ("Hight School Can Not Input Number.......!");
            }
            else {
                  throw ("");
            }
      }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function High_School_Start(h_start) {
            if (h_start == "") {
                  throw ("Please Select Start Year In Hight School........!");
            }
            else {
                  throw ("");
            }
      }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function High_School_end(h_end) {
            if (h_end == "") {
                  throw ("Please Select End Year In Hight School........!");
            }
            else {
                  throw ("");
            }
      }
 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function UniverSity_Name(un_name) {
            if (un_name == "") {
                  throw ("UniverSity School Can Not Empty........!");
            }
            else if (!isNaN(un_name)) {
                  throw ("UniverSity School Can Not Input Number.......!");
            }
            else {
                  throw ("");
            }
      }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function UniverSity_start(un_start) {
            if (un_start == "") {
                  throw (" Please Select Start Year In UniverSity School.......!");
            }
            else {
                  throw ("");
            }
      }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function UniverSity_end(un_end) {
            if (un_end == "") {
                  throw (" Please Select End Year In UniverSity School.......!");
            }
            else {
                  throw ("");
            }
      }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function Teacher_Type(T_type) {
            if (T_type == "") {
                  throw (" Please Select Teacher Type.......!");
            }
            else {
                  throw ("");
            }
      }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function Level(T_level) {
            if (T_level == "") {
                  throw (" Level Can Not Empty .......!");
            }
            else if(!isNaN(T_level)){
                  throw (" Level Can Not Input Number .......!");
            }
            else {
                  throw ("");
            }
      }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function Skill(T_skill) {
            if (T_skill == "") {
                  throw (" Skill Can Not Empty .......!");
            }
            else if (!isNaN(T_skill)) {
                  throw (" Skill Can Not Input Number .......!");
            }
            else {
                  throw ("");
            }
      }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      
    
function Add_Class_Color_Error1() {
      $("#primary_school_name").addClass("input-error");
      $("#start_primaryschool_date").addClass("input-error");
      $("#end_primaryschool_date").addClass("input-error");
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function Remove_Class_Color_Error1() {
            $("#primary_school_name").removeClass("input-error");
            $("#start_primaryschool_date").removeClass("input-error");
            $("#end_primaryschool_date").removeClass("input-error");
      }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function Focus_Error1() {
            $("#primary_school_name").focus();
            $("#start_primaryschool_date").focus();
            $("#end_primaryschool_date").focus();
      }
  
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      

function Add_Class_Error2() {
      $("#heightschool_name").addClass("input-error");
      $("#start_heightschool_date").addClass("input-error");
      $("#end_heightschool_date").addClass("input-error");
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Remove_Class_Error2() {
      $("#heightschool_name").removeClass("input-error");
      $("#start_heightschool_date").removeClass("input-error");
      $("#end_heightschool_date").removeClass("input-error");
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Focus_Error2() {
      $("#heightschool_name").focus();
      $("#start_heightschool_date").focus();
      $("#end_heightschool_date").focus();
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Add_Class_Color_Error3() {
      $("#skill").addClass("input-error");
      $("#level").addClass("input-error");
      $("#teacher_type").addClass("input-error");
      $("#end_university_date").addClass("input-error");
      $("#start_university_date").addClass("input-error");
      $("#universety_name").addClass("input-error");
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function Remove_Class_Color_Error3() {
            $("#skill").removeClass("input-error");
            $("#level").removeClass("input-error");
            $("#teacher_type").removeClass("input-error");
            $("#end_university_date").removeClass("input-error");
            $("#start_university_date").removeClass("input-error");
            $("#universety_name").removeClass("input-error");
      }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function Focus_Error3() {
            $("#skill").focus();
            $("#level").focus();
            $("#teacher_type").focus();
            $("#end_university_date").focus();
            $("#start_university_date").focus();
            $("#universety_name").focus();
      }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      

$("#primary_school_name").keyup(function()
     {
           if( $("#primary_school_name").val() == "" )
           {
                 $("#primary_school_name").css("border-color","red");
                 $("#primary_school_name").css("background-color","pink");
                 $("#primary_school_name").focus();
                  $("#next-1").prop("disabled",true);
           }
           else if (!isNaN($("#primary_school_name").val()))
           {
                 $("#primary_school_name").css("border-color", "red");
                 $("#primary_school_name").css("background-color", "pink");
                 $("#primary_school_name").focus();
                 $("#next-1").prop("disabled", true);
           }
           else
           {
                 $("#primary_school_name").css("border-color", "green");
                 $("#primary_school_name").css("background-color", "white");
                 $("#primary_school_name").css("color", "green");
                 $("#primary_school_name").css("font-size", "16");
                 $("#primary_school_name").css("font-weight", "bold");
                 $("#nex-1").prop("disabled", false);
           }
           try {
                 Prim_Mary_Name($("#primary_school_name").val())
                 $("#primary_error").html("");
                 return isPrimaryName =true ;
           } catch (prim) {
                 $("#primary_error").html(prim);
                 return isPrimaryName = false;
                 
           }
           
     });  

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
$("#start_primaryschool_date").change(function()
{
     
     if($("#start_primaryschool_date").val() == "")
     {
          $("#start_primaryschool_date").css("border-color","red") ;
           $("#start_primaryschool_date").css("background-color", "pink"); 
           $("#end_primaryschool_date").focus();
           $("#primary_school_name").focus(); 
           $("#start_primaryschool_date").focus();
          $("#start_primaryschool_date").focus();
          $("#next-1").prop("disabled",true);
     }
     else
     {
          $("#start_primaryschool_date").css("border-color","green") ;
          $("#start_primaryschool_date").css("background-color","white");
           $("#start_primaryschool_date").css("color", "green");
           $("#start_primaryschool_date").css("font-size", "16");
           $("#start_primaryschool_date").css("font-weight", "bold");
          $("#next-1").prop("disabled",false);   
     }
      try {
            Prim_Mary_Start($("#start_primaryschool_date").val());
            $("#start_primaryschool_date_error").html("");
            return isStartPrimary = true;
      } catch (Sta) {
            $("#start_primaryschool_date_error").html(Sta);
            return isStartPrimary = false;

      }
 });

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#end_primaryschool_date").change(function()
{
     if($("#end_primaryschool_date").val() == "")
     {
          $("#end_primaryschool_date").css("border-color","red") ;
          $("#end_primaryschool_date").css("background-color","pink");
          $("#end_primaryschool_date").focus();
          $("#next-1").prop("disabled",true);
     }
     else
     {
          $("#end_primaryschool_date").css("border-color","green") ;  
          $("#end_primaryschool_date").css("background-color","white");
           $("#end_primaryschool_date").css("color", "green");
           $("#end_primaryschool_date").css("font-size", "16");
           $("#end_primaryschool_date").css("font-weight", "bold");
           $("#next-1").prop("disabled", false);   
     }
      try {
            Prim_Mary_End($("#end_primaryschool_date").val());
            $("#end_primaryschool_date_error").html("");
            return isEndprimary = true;
      } catch (P_end) {
            $("#end_primaryschool_date_error").html(P_end);
            return isEndprimary = false;

      }
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////                                    END NEXT 1                                      ///////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




  
$("#heightschool_name").keyup(function(){
                       
    if( $("#heightschool_name").val() == "" )
    {
          $("#heightschool_name").css("border-color","red");
          $("#heightschool_name").css("background-color","pink");
          $("#heightschool_name").focus();
          $("#next-2").prop("disabled",true);
    }
   else if(!isNaN($("#heightschool_name").val()))
    {
          $("#heightschool_name").css("border-color","red");
          $("#heightschool_name").css("background-color","pink");
          $("#heightschool_name").focus();
          $("#next-2").prop("disabled",true);
    }
    else
    {
            $("#heightschool_name").css("border-color", "green");
            $("#heightschool_name").css("background-color", "white");
            $("#eheightschool_name").css("color", "green");
            $("#heightschool_name").css("font-size", "16");
            $("#heightschool_name").css("font-weight", "bold");
            $("#next-2").prop("disabled", false);
    }
      try {
            High_School_Name($("#heightschool_name").val());
            $("#heightschool_name_error").html("");
            return isHeightSchoolName = true;
      } catch (h_name) {
            $("#heightschool_name_error").html(h_name);
            return isHeightSchoolName = false;

      }
});


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#start_heightschool_date").change(function()
{
     if( $("#start_heightschool_date").val() == "" )
  	{
           $("#start_heightschool_date").css("border-color","red");
           $("#start_heightschool_date").css("backgroud-color","pink");
           $("#start_heightschool_date").focus();
           $("#next-2").prop("disabled",true);
  	}
  	else

  	{
           $("#start_heightschool_date").css("border-color","green");
           $("#start_heightschool_date").css("backgroud-color","white");
           $("#start_heightschool_date").css("color", "green");
           $("#start_heightschool_date").css("font-size", "16");
           $("#start_heightschool_date").css("font-weight", "bold");
           $("#next-2").prop("disabled",false);
     }
      try {
            High_School_Start($("#start_heightschool_date").val());
            $("#start_heightschool_date_error").html("");
            return isStartHeightSchool = true;
      } catch (h_start) {
            $("#start_heightschool_date_error").html(h_start);
            return isStartHeightSchool = false;
      }

  });
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
$("#end_heightschool_date").change(function()
{
     if( $("#end_heightschool_date").val() == "")
     {
           $("#end_heightschool_date").css("border-color","red");
           $("#end_heightschool_date").css("background-color","pink");
           $("#end_heightschool_date").focus();
           $("#next-2").prop("disabled",true);
     }
     else
     {
           $("#end_heightschool_date").css("border-color","green");
           $("#end_heightschool_date").css("background-color","white");
           $("#end_heightschool_date").css("color", "green");
           $("#end_heightschool_date").css("font-size", "16");
           $("#end_heightschool_date").css("font-weight", "bold");
           $("#next-2").prop("disabled",false);
     } 
      try {
            High_School_end($("#end_heightschool_date").val());
            $("#end_heightschool_date_error").html("");
            return isEndHeightSchool = true;
      } catch (h_end) {
            $("#end_heightschool_date_error").html(h_end);
            return isEndHeightSchool = false;

      }            
   });

// //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
/////////////////////////////////////////                           END NEXT 2                          //////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   $("#start_university_date").change(function()
   {
     if( $("#start_university_date").val() == "")
     {
           $("#start_university_date").css("border-color","red");
           $("#start_university_date").css("background-color","pink");
           $("#next-3").prop("disabled",true);
     }
     else
     {
           $("#start_university_date").css("border-color","green");
           $("#start_university_date").css("background-color","white");
           $("#start_university_date").css("color", "green");
           $("#start_university_date").css("font-size", "16");
           $("#start_university_date").css("font-weight", "bold");
           $("#next-3").prop("disabled",false);
     }  
         try {
              UniverSity_start($("#start_university_date").val());
               $("#start_universety_error").html("");
               return isStartUniverSity = true;
         } catch (u_start) {
               $("#start_universety_error").html(u_start);
               return isStartUniverSity = false;

         }            
});
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#end_university_date").change(function()
{
     if( $("#end_university_date").val() ==  "" )
     {
           $("#end_university_date").css("border-color","red");
           $("#end_university_date").css("background-color","pink");
           $("#next-3").prop("disabled",true);
           $("#end_university_date").focus();
     }
     else
     {
           $("#end_university_date").css("border-color","green");
           $("#end_university_date").css("background-color","white");
           $("#end_university_date").css("color", "green");
           $("#end_university_date").css("font-size", "16");
           $("#end_university_date").css("font-weight", "bold");
           $("#next-3").prop("disabled",false);
     }
      try {
            UniverSity_end($("#end_university_date").val());
            $("#end_universety_error").html("");
            return isEndUniverSity= true;
      } catch (u_end) {
            $("#end_universety_error").html(u_end);
            return isEndUniverSity = false;

      }            
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#teacher_type").change(function()
{
     if($("#teacher_type").val() == "" )
     {
           $("#teacher_type").css("border-color","red");                                                 
           $("#teacher_type").css("background-color","pink");
           $("#next-3").prop("disabled",true);
           $("#teacher_type").focus();
     }
     else
     {
           $("#teacher_type").css("border-color","green");
           $("#teacher_type").css("background-color","white");
           $("#teacher_typ").css("color", "green");
           $("#teacher_typ").css("font-size", "16");
           $("#teacher_typ").css("font-weight", "bold");
           $("#next-3").prop("disabled",false);
     }

      try {
           Teacher_Type($("#teacher_type").val());
            $("#teacher_type_error").html("");
            return isTypeTeacher = true;
      } catch (t_type) {
            $("#teacher_type_error").html(t_type);
            return isTypeTeacher = false;
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
    }
   else if(!isNaN($("#universety_name").val()))
    {
          $("#universety_name").css("border-color","red");
          $("#universety_name").css("background-color","pink");
          $("#next-3").prop("disabled",true);
    }
      else
    {
          $("#universety_name").css("border-color","green");
          $("#universety_name").css("background-color","white");
          $("#universety_name").css("color", "green");
          $("#universety_name").css("font-size", "16");
          $("#universety_name").css("font-weight", "bold");
          $("#next-3").prop("disabled",false);
    }
      try {
            UniverSity_Name($("#universety_name").val());
            $("#universety_name_error").html("");
            return isUniverSityName = true;
      } catch (u_name) {
            $("#universety_name_error").html(u_name);
            return isUniverSityName = false;

      }            
});





// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


  
$("#level").keyup(function(){
                       
    if( $("#level").val() == ""  )
    {
          $("#level").css("border-color","red");
          $("#level").css("background-color","pink");
          $("#level").focus();
          $("#next-3").prop("disabled",true);
    }
   else if(!isNaN($("#level").val()))
    {
          $("#level").css("border-color","red");
          $("#level").css("background-color","pink");
          $("#next-3").prop("disabled",true);
    }
      else 
    {
          $("#level").css("border-color","green");
          $("#level").css("background-color","white");
          $("#level").css("color", "green");
          $("#level").css("font-size", "16");
          $("#level").css("font-weight", "bold");
          $("#next-3").prop("disabled",false);
          $("#level_error").html("") ;
    }
      try {
          Level($("#level").val());
            $("#level_error").html("");
            return islevel= true;
      } catch (level) {
            $("#level_error").html(level);
            return islevel = false;

      }            
});

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


 
$("#skill").keyup(function(){
                       
      if( $("#skill").val() == ""  )
      {
            $("#skill").css("border-color","red");
            $("#skill").css("background-color","pink");
            $("#next-3").prop("disabled",true);
      }
      else  if(!isNaN($("#skill").val()) )
      {
            $("#skill").css("border-color","red");
            $("#skill").css("background-color","pink");
            $("#next-3").prop("disabled",true);
      }
      else 
      {
            $("#skill").css("border-color","green");
            $("#skill").css("background-color","white");
            $("#skill").css("color", "green");
            $("#skill").css("font-size", "16");
            $("#skill").css("font-weight", "bold");
            $("#next-3").prop("disabled",false);
            $("#skill_error").html("") ;
            return isSkill = true;
      }
      try {
            Skill($("#skill").val());
            $("#skill_error").html("");
            return isSkill = true;
      } catch (level) {
            $("#skill_error").html(level);
            return isSkill = false;
      }            
  });
  
  



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////                                      END  NEXT 3                   ///////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



     $("#next-1").click(function(){
           if ($("#primary_school_name").val() == "" || $("#start_primaryschool_date").val() == "" || $("#end_primaryschool_date").val() == ""  )
           {
                     Add_Class_Color_Error1();
                     Focus_Error1();    
                    $("#next-1").prop("disabled",true); 
                    $("#step_one").show();
                    next_step = false;  
           }
           else
           {    
                    Remove_Class_Color_Error1();     
                    $("#next-1").prop("disabled",false);
                    $("#step_two").show();
                    $("#step_one").hide();
                    next_step = true;
           }
    });

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    $("#next-2").click(function(){

          if ($("#heightschool_name").val() == "" || $("#start_heightschool_date").val() == "" || $("#end_heightschool_date").val() == "" )
                 { 
                       Add_Class_Error2();
                       Focus_Error2();
                        $("#next-2").prop("disabled",true);
                        $("#step_two").show();
                        next_step = false;    
                 }
           else
                 {
                        Remove_Class_Error2();
                        $("#next-2").prop("disabled",false);
                        $("#step_two").hide();
                        $("#step_tree").show();
                        next_step = true;
                 }
});

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#next-3").click(function(){
      if ($("#universety_name").val() == "" || $("#start_university_date").val() == "" || $("#end_university_date").val() == "" || $("#skill").val() == "" || $("#level").val() == "" || $("#teacher_type").val() == ""  )
            { 
                   Add_Class_Color_Error3();
                   Focus_Error3();
                   $("#next-3").prop("disabled",true);
                   $("#step_tree").show();
                   alert("You Are Add Education Teacher Error Please Try Again.............!!!!");
                   next_step = false;    
            }
      else
            {
            
                  Remove_Class_Color_Error3();
                   $("#next-3").prop("disabled",false);
                   alert("You Are Add Education Teacher Success Fully.............!");
                   $("#step_tree").hide();
                   $("#step_four").show();
                   next_step = true;
            }
});                                                                                                     

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   $("#previous-2").click(function()
   {
      $("#step_one").show();
      $("#step_two").hide();
   });

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   $("#previous-3").click(function()
   {
      $("#step_two").show();
      $("#step_tree").hide();
   });

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

   $("#previous-4").click(function()
   {
      $("#step_tree").show();
      $("#step_four").hide();
   });

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 });





 
   	

 
                

   
   












