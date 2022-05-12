
var  isdistrict = false,isprovince = false, iscountry = false ,iscommune = false ,isvillage = false;
var isfname = false,isdob = false,isgender =false ,islname = false ;
var  iscurrent_commune = false ,iscurrent_province = false ,iscerrent_district =false ,iscurrent_village = false ;
var iscustomFile =false ,ispassport = false,isnationality = false ,isphone_number = false ,isnationality_id = false,falseisstatus =false ;


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

      $("#first_name").keyup(function()
      {
            if( $("#first_name").val() == "" || $("#first_name").val() == null )
            {
                  $("#first_name").css("border-color","red");
                  $("#first_name").css("background-color","pink");
                  $("#first_name").focus();
                   $("#next-1").prop("disabled",true);
                  $("#fname_error").html("Plaese Input First Name ..... !!!") ;
                  $("#fname_error").css("font-size","16");
                  $("#fname_error").css("font-weight","bold");
                  return isfname= false;
            }
           
            else if($("#first_name").val() !="" )
            {
                  $("#first_name").css("border-color","green");
                  $("#first_name").css("background-color","");
                  $("#next-1").prop("disabled",false);
                  $("#fname_error").html("");
                  return isfname =true;
            }
            else
            {
                  $("#first_name").css("border-color","red");
                  $("#first_name").css("background-color","pink");
                  $("#first_name").focus();
                  $("#next-1").prop("disabled",true);
                  $("#fname_error").html("First Name Is Valid Plaese Try again ..... !!!") ;
                  $("#fname_error").css("font-size","16");
                  $("#fname_error").css("font-weight","bold");
                  return isfname =false;
            }
            
      });  

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       
      $("#last_name").keyup(function(){
                        
            if( $("#last_name").val() == "" || $("#last_name").val() == null )
            {
                  $("#last_name").css("border-color","red");
                  $("#last_name").css("background-color","pink");
                  $("#last_name").focus();
                  $("#next-1").prop("disabled",true);
                  $("#lname_error").html("Plaese Input Last Name ..... !!!") ;
                  $("#lname_error").css("font-size","16");
                  $("#lname_error").css("font-weight","bold");
                  return islname= false;
            }
            
            if($("#last_name").val()!="" )
            {
                  $("#last_name").css("border-color","green");
                  $("#last_name").css("background-color","");
                  $("#last_name").focus();
                  $("#next-1").prop("disabled",false);
                  $("#lname_error").html("") ;
                  return islname= true;
            }
            else
            {
                  $("#last_name").css("border-color","red");
                  $("#last_name").css("background-color","pink");
                  $("#last_name").focus();
                  $("#next-1").prop("disabled",true);
                   $("#lname_error").html("Last Name Is Valid Plaese Try again ..... !!!") ;
                   $("#lname_error").css("font-size","16");
                   $("#lname_error").css("font-weight","bold");
                  return islname= false;
            }
      });

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#dob").change(function()
{
      if($("#dob").val() == "0")
      {
           $("#dob").css("border-color","red") ;
           $("#gender").css("background-color","pink");
           $("#gender").focus();
           $("#next-1").prop("disabled",true);
           $("#dob_error").html("Please Select Date Of Birth.....!");
           $("#dob_error").css("font-size","16");
            $("#dob_error").css("font-weight","bold");
           return isdob= false;
      }
      else
      {
           $("#dob").css("border-color","green") ;  
           $("#gender").css("background-color","");
           $("#gender").focus();
           $("#next-1").prop("disabled",false);
           $("#dob_error").html("");  
           return isdob= true;
      }
});
 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////                                        End function step 2                        ///////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#village").change(function()
{
      if( $("#village").val().length == "0")
   	{
            $("#village").css("border-color","red");
            $("#village").css("backgroud-color","pink");
            $("#village").focus();
            $("#next-2").prop("disabled",true);
            $("#village_error").html("Plaese Select village ..... !!!") ;
            $("#village_error").css("font-size","16");
            $("#village_error").addClass("input-error");
            $("#village_error").css("font-weight","bold");
            return isvillage = false;
   	}
   	else

   	{
            $("#village").css("border-color","green");
            $("#village").css("backgroud-color","");
            $("#next-2").prop("disabled",false);
            $("#village_error").removeClass("input-error");
            $("#village_error").html("") ;
            return isvillage =true;
      }
   });
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
$("#commune").change(function()
{
      if( $("#commune").val() == "0")
      {
           
            $("#commune").css("border-color","red");
            $("#commune").css("background-color","pink");
            $("#commune").focus();
            $("#next-2").prop("disabled",true);
            $("#commune_error").html("Plaese Select Commune ..... !!!") ;
            $("#commune_error").css("font-size","16");
            $("#commune_error").css("font-weight","bold");
            return iscommune = false;
      }
      else
      {
            $("#commune").css("border-color","green");
            $("#commune").css("background-color","");
            $("#next-2").prop("disabled",false);
            $("#commune_error").html("") ;
            return iscommune =true;
      }             
    });

 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#district").change(function()
    {
      if( $("#district").val() == "0")
      {
            $("#district").css("border-color","red");
            $("#district").css("background-color","pink");
            $("#nex-2").prop("disabled",true);
            $("#district").focus();
            $("#district_error").html("Plaese Select District ..... !!!") ;
            $("#district_error").css("font-size","16");
            $("#district_error").css("font-weight","bold");
            return isdistrict = false;
      }
      else
      {
            $("#district").css("border-color","green");
            $("#district").css("background-color","");
            $("#nex-2").prop("disabled",false);
            $("#district_error").html("");
            return isdistrict =true;
      }  
});

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#province").change(function()
{
      if( $("#province").val() == "0"  )
      {
            $("#province").css("border-color","red");
            $("#province").css("background-color","pink");
            $("#nex-2").prop("disabled",true);
            $("#province").focus();
            $("#province_error").html("Plaese Select Province ..... !!!") ;
            $("#province_error").css("font-size","16");
            $("#province_error").css("font-weight","bold");
            return isprovince = false;
      }
      else
      {
            $("#province").css("border-color","green");
            $("#province").css("background-color","");
            $("#nex-2").prop("disabled",false);
            $("#province_error").html("") ;
            return isprovince =true;
      }
});

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#country").change(function()
{
      if($("#country").val() == ""  )
      {
            $("#country").css("border-color","red");                                                 
            $("#country").css("background-color","pink");
            $("#next-2").prop("disabled",true);
            $("#country").focus();
            $("#country_error").html("Plaese Select Country ..... !!!") ;
            $("#country_error").css("font-size","16");
            $("#country_error").css("font-weight","bold");
            return iscountry = false; 
      }
      else
      {
            $("#country").css("border-color","green");
            $("#country").css("background-color","");
            $("#next-2").prop("disabled",false);
            $("#country_error").html("");
            return iscountry =true;
      }
});

 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 /////////////////////////////////                           End funcetion step 3               ////////////////////////
 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



 $("#current_province").change(function(){
     
      if( $("#current_province").val() == "0"  )
      {
            $("#current_province").css("border-color","red");
            $("#current_province").css("background-color","pink");
            $("#nex-3").prop("disabled",true);
            $("#current_province").focus();
            $("#current_province_error").html("Plaese Select Province ..... !!!") ;
            $("#current_province_errorr").css("font-size","16");
            $("#current_province_error").css("font-weight","bold");
            return iscurrent_province = false;
      }
      else
      {
            $("#current_province").css("border-color","green");
            $("#current_province").css("background-color","");
            $("#nex-3").prop("disabled",false);
            $("#current_province_error").html("") ;
            return iscurrent_province =true;
      }

});

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	

$("#current_district").change(function(){

      if( $("#current_district").val() == "0")
      {
            $("#current_district").css("border-color","red");
            $("#current_district").css("background-color","pink");
            $("#nex-3").prop("disabled",true);
            $("#current_district").focus();
            $("#current_district_error").html("Plaese Select District ..... !!!") ;
            $("#current_district_error").css("font-size","16");
            $("#current_district_error").css("font-weight","bold");
            return iscerrent_district = false;
      }
      else
      {
            $("#current_district").css("border-color","green");
            $("#current_district").css("background-color","");
            $("#nex-3").prop("disabled",false);
            $("#current_district_error").html("");
            return iscerrent_district =true;
      }  
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#current_commune").change(function(){
      if( $("#current_commune").val() == "0")
      {
           
            $("#current_commune").css("border-color","red");
            $("#current_commune").css("background-color","pink");
            $("#current_commune").focus();
            $("#next-3").prop("disabled",true);
            $("#current_commune_error").html("Plaese Select Commune ..... !!!") ;
            $("#current_commune_error").css("font-size","16");
            $("#current_commune_error").css("font-weight","bold");
            return iscurrent_commune = false;
      }
      else
      {
            $("#current_commune").css("border-color","green");
            $("#current_commune").css("background-color","");
            $("#next-3").prop("disabled",false);
            $("#current_commune_error").html("") ;
            return iscurrent_commune =true;
      }             
});
      
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#current_village").change(function(){
      if( $("#current_village").val() == "0")
      {
         $("#current_villagee").css("border-color","red");
         $("#current_village").css("backgroud-color","pink");
         $("#current_village").focus();
         $("#next-3").prop("disabled",true);
         $("#current_village_error").html("Plaese Select village ..... !!!") ;
         $("#current_village_error").css("font-size","16");
         $("#current_village_error").css("font-weight","bold");
         return iscurrent_village = false;
      }
      else

      {
         $("#current_village").css("border-color","green");
         $("#current_village").css("backgroud-color","");
         $("#next-3").prop("disabled",false);
         $("#current_village_error").html("") ;
         return iscurrent_village =true;
   }
});

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////                              End function step 4                    ////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


$("#nationality_id").keyup(function()
{
      if( $("#nationality_id").val().length == 0 || $("#nationality_id").val() == null )
       {
            $("#nationality_id").css("border-color", "red");
            $("#nationality_id").css("background-color","pink");
            $("#nationality_id").focus();
            $("#nationality_id_error").html("Plaese Input Nationality Id  ..... !!!")  ;
            $("#nationality_id_error").css("font-size","16");
            $("#nationality_id_error").css("font-weight","bold");
            $("#next-4").prop("disabled",true);
		return isnationality_id = false;
      }
      if($("#nationality_id").val().length < 9)
      {
            $("#nationality_id").css("border-color", "red");
            $("#nationality_id").css("background-color","pink");
            $("#nationality_id").focus();
            $("#nationality_id_error").html("Plaese Input Nationality Id Number Then 8  charictor   ..... !!!")  ;
            $("#nationality_id_error").css("font-size","16");
            $("#nationality_id_error").css("font-weight","bold");
            $("#next-4").prop("disabled",true);
		return isnationality_id = false;
      }
     if( $("#nationality_id").val().match(/^\d{9,20}$/) )
      {
           $("#nationality_id").css("border-color", "green");
           $("#nationality_id").css("background-color","");
           $("#nationality_id_error").html("")  ;
           $("#nationality_id_error").css("font-size","16");
           $("#nationality_id_error").css("font-weight","bold");
           $("#next-4").prop("disabled",false);
           return isnationality_id = true;
     }
	else{
            $("#nationality_id").css("border-color", "red");
            $("#nationality_id").css("background-color","pink");
            $("#nationality_id_error").html("Nationality Is Valid .......!!")  ;
            $("#next-4").prop("disabled",false);
		return isnationality_id =true;
      }
});


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#customFile").change(function()
{
      if( $("#customFile").val() == "0" )
      {
            $("#customFile").css("border-color", "red");
            $("#customFile").css("background-color","pink");
            $("#customFile").focus();
            $("#customFile_error").html("Plaese Select Image..... !!!")  ;
            $("#customFile_error").css("font-size","16");
            $("#customFile_error").css("font-weight","bold");
            $("#next-4").prop("disabled",true);
		return iscustomFile = false;
	}
      else
      {
            $("#customFile").css("border-color", "red");
            $("#customFile").css("background-color","");
            $("#customFile_error").html("")  ;
            $("#next-4").prop("disabled",false);
		return iscustomFile =true;
	}
});

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#nationality").change(function()
{
      if( $("#nationality").val() == "0"  )
      {
            $("#nationality").css("border-color", "red");
            $("#nationality").css("background-color","pink");
            $("#nationality").focus();
            $("#nationality_error").html("Plaese Select Nationality  ..... !!!")  ;
            $("#nationality_error").css("font-size","16");
            $("#nationality_error").css("font-weight","bold");
            $("#next-4").prop("disabled",true);
		return isnationality = false;
	}
	else{
            $("#nationality").css("border-color", "green");
            $("#nationality").css("background-color","");
            $("#nationality_error").html("")  ;
            $("#next-4").prop("disabled",false);
		return isnationality =true;
      }
});    
      
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	  
$("#status").change(function()
{
      if( $("#status").val() == "0"  )
      {
            $("#status").css("border-color", "red");
            $("#status").css("background-color","pink");
            $("#status").focus();
            $("#status_error").html("Plaese Select Status  ..... !!!")  ;
            $("#status_error").css("font-size","16");
            $("#status_error").css("font-weight","bold");
            $("#next-4").prop("disabled",true);
		return isstatus = false;
	}
	else{
            $("#status").css("border-color", "green");
            $("#status").css("background-color","");
            $("#status_error").html("")  ;
            $("#next-4").prop("disabled",false);
		return isstatus =true;
	}
});


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#phone_number").keyup(function(){
                       
            
      if($("#phone_number").val().length == 0 )
      {
            $("#phone_number").css("border-color","red");
            $("#phone_number").css("background-color","pink");
            $("#phone_number").focus();
            $("#phone_number_error").html("Plaese Input Phone Number  ..... !!!") ;
            $("#phone_number_error").css("font-size","16");
            $("#phone_number_error").css("font-weight","bold");
            $("#next-4").prop("disabled",true);
            return isphone_number = false;
      }
      
      if($("#phone_number").val().length > 9 )
      {
            $("#phone_number").css("border-color","red");
            $("#phone_number").css("background-color","pink");
            $("#phone_number").focus();
            $("#phone_number_error").html("Plaese Input Phone Number 9 Charictor  ..... !!!") ;
            $("#phone_number_error").css("font-size","16");
            $("#phone_number_error").css("font-weight","bold");
            $("#next-4").prop("disabled",true);
            return isphone_number = false;
      }
      
      if( $("#phone_number").val().match(/^\d{9,10}$/)  ){
            $("#phone_number").css("border-color","green");
            $("#phone_number").css("background-color","");
            $("#next-4").prop("disabled",false);
            $("#phone_number_error").html("") ;
            return isphone_number = true;
      }
     
      
       
      else{
            $("#phone_number").css("border-color","red");
            $("#phone_number").css("background-color","pink");
            $("#phone_number").focus();
            $("#phone_number_error").html("Phone Number Is Valid  ..... !!!") ;
            $("#phone_number_error").css("font-size","16");
            $("#phone_number_error").css("font-weight","bold");
            $("#next-4").prop("disabled",true);
            return isphone_number = false;
      }

});

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////                              End function step 4                    ///////////////////////////////////



      $("#next-1").click(function(){
            if( isfname == false || isdob == false || islname == false )
            {
                 
                  $("#first_name").focus().addClass("input-error");     
                  $("#last_name").focus().addClass("input-error");     
                  $("#dob").focus().addClass("input-error");
                  $("#next-1").prop("disabled",true); 
                  $("#step_one").show();
                  next_step=false;  
                  
            }
            else
            {
                  $("#first_name").removeClass("input-error");     
                  $("#last_name").removeClass("input-error");
                  $("#gender").removeClass("input-error");      
                  $("#dob").removeClass("input-error");
                  $("#next-1").prop("disabled",false);
                  $("#step_two").show();
                  $("#step_one").hide();
                  next_step=true;
                  

            }
     });

     
     $("#next-2").click(function(){

            if(  isdistrict == false || isprovince == false || iscountry == false || iscommune == false || isvillage == false)
                  { 
                        $("#village") .focus().addClass("input-error");      
                        $("#province").focus().addClass("input-error");
                        $("#commune").focus().addClass("input-error");     
                        $("#district").focus().addClass("input-error");
                        $("#country").focus().addClass("input-error");
                        $("#next-2").prop("disabled",true);
                        $("#step_two").show();
                        next_step=false;    
                  }
            else
                  {
                  
                        $("#village") .removeClass("input-error");      
                        $("#province").removeClass("input-error");
                        $("#commune").removeClass("input-error");     
                        $("#district").removeClass("input-error");
                        $("#country").removeClass("input-error");     
                        $("#next-2").prop("disabled",false);
                        $("#step_two").hide();
                        $("#step_tree").show();
                       
                        next_step=true;
                  }
});


                                                                                                            


$("#next-3").click(function(){
      if( iscurrent_commune == false || iscurrent_province == false || iscerrent_district ==false || iscurrent_village == false )
            {
                  $("#current_province").addClass("input-error");      
                  $("#current_district").addClass("input-error");
                  $("#current_commune").addClass("input-error");     
                  $("#current_village").addClass("input-error"); 
                  $("#next-3").prop("disabled",true);
                  $("#step_tree").show();
                  next_step=false;    
            }
      else
            {   
                  
                  $("#current_province").removeClass("input-error");      
                  $("#current_district").removeClass("input-error");
                  $("#current_commune").removeClass("input-error");     
                  $("#current_village").removeClass("input-error");    
                  $("#next-3").prop("disabled",false);
                  $("#step_tree").hide();
                  $("#step_four").show();
                  next_step=true;
            }
});


$("#next-4").click(function()
{
      if( iscustomFile == false || ispassport == false || isnationality == false || isphone_number == false || isnationality_id == false || isstatus ==false )
            {
                  $("#phone_number").focus().addClass("input-error");     
                  $("#passport_no").focus().addClass("input-error");
                  $("#customFile").focus().addClass("input-error");     
                  $("#nationality").focus().addClass("input-error");
                  $("#nationality_id").focus().addClass("input-error");
                  $("#status").focus().addClass("input-error");
                  alert("You Are  Add Teacher Error Please Chacking Again...........!!!!");
                  $("#next-4").prop("disabled",true); 
                  $("#step_four").show();
					$(this).val();
                  next_step=false;
            }
      else
            {     
                  $("#phone_number").removeClass("input-error");  
                  $("#passport_no").removeClass("input-error");
                  $("#customFile").removeClass("input-error");     
                  $("#nationality").removeClass("input-error");
                  $("#nationality_id").removeClass("input-error");
                  $("#status").removeClass("input-error");   
                  $("#next-4").prop("disabled",false);
                  $("#step_four").hide();
                  alert("You Are Add Teacher SuccessFully ............!");
                  next_step=true;
            }
});


             
 
 });





 
   	

 
                

   
   












