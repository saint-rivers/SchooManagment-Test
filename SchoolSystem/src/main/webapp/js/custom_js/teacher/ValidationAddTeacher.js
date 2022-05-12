
var  isdistrict = false,isprovince = false, iscountry = false ,iscommune = false ,isvillage = false;
var isfname = false,isdob = false,isgender =false ,islname = false ;
var  iscurrent_commune = false ,iscurrent_province = false ,iscerrent_district =false ,iscurrent_village = false ;
var iscustomFile =false,isnationality = false ,isphone_number = false ,isnationality_id = false,isstatus =false ;

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



////////////////////////////////////// Function Display Message Last Name//////////////////////////////////////////////////////////

    function Last_Name(l_name) {
        if (l_name == '') {
            throw ('Last Name Can Not Empty');
        }
        else if (!isNaN(l_name)) {
            throw ('Last  Name Can Not Input Number');
        }
        else {
            throw ('');
        }
    }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

     function First_Name(f_name) {
        if (f_name == '') {
            throw ('First Name Can Not Empty');
        }
        else if (!isNaN(f_name)) {
            throw ('First Name Can Not Input Number');
        }
        else {
            throw ('');
           
        }
    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function Card_Id(c_card) {
            if (c_card == '') {
                  throw ('Card Id Can Not Empty');
            }
            else if (isNaN(c_card)) {
                  throw ('Card Id Can Not Input Text');

            }
            else if(c_card < 10){
                  throw ('Card Id Can  Input Number Then 9');
            }
            else {
                  throw ('');
            }
      }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function Phone_Number(p_phone) {
            if (p_phone == '') {
                  throw ('Phone Number Can Not Empty');
            }
            else if (isNaN(p_phone)) {
                  throw ('Phone Number Can NOt Input Text');
            }
            else if (p_phone < 10) {
                  throw ('Phone Number Input 9 Digit ');
            }
            else {
                  throw ('');
            }
      }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function Cerren_Villeg(v_village) {
            if (v_village == '') {
                  throw ('Please Select Village');
            }
            else {
                  throw ('');
            }
      }

      ////////////////////////////////Function Display Message district ////////////////////////////////////////////////////////////////

      function Cerren_district(d_district) {
            if (d_district == '') {
                  throw ('Please Select District');
            }
            else {
                  throw ('');
            }
      }

      ////////////////////////////Function Display Message commune//////////////////////////////////////////////////////////////////////

      function Cerren_commune(c_commune) {
            if (c_commune == '') {
                  throw ('Please Select Commune');
            }
            else {
                  throw ('');
            }
      }

      ////////////////////Function Display Message Province //////////////////////////////////////////////////////////////////////////////

      function Cerren_Province(p_province) {
            if (p_province == '') {
                  throw ('Please Select Province');
            }
            else {
                  throw ('');
            }
      }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function Photo_Image(i_image) {
            if (i_image == '') {
                  throw ('Please Select Image Name');
            }
            else {
                  throw ('');
            }
      }


      /////////////////////////////////Function Display Message Date Of Birth ///////////////////////////////////////////////////////////

      function Date_of_Birth(d_dob) {
            if (d_dob == '') {
                  throw ('Date Of Birth Can Not Empty');
            }
            else {
                  throw ('');
            }
      }

////////////////////////////////Function Display Message Nationality //////////////////////////////////////////////////////////////

      function Nationality(n_nationality) {

            if (n_nationality == "") {
                  throw ('Please Select Nationality');
            }
            else {
                  throw ('');
            }

      }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function Status(s_stat) {
            if (s_stat == '') {
                  throw ('Please Select Statust');
            }
            else {
                  throw ('');
            }
      }
      
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      function Country(c_coun) {
            if (c_coun == '') {
                  throw ('Please Select Country');
            }
            else {
                  throw ('');
            }
      }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
function Checking_color_Error1() {
      $("#first_name").focus();
      $("#first_name").addClass("input-error");
      $("#last_name").focus();
      $("#last_name").addClass("input-error");
      $("#dob").focus();
      $("#dob").addClass("input-error");
      $("#step_one").show();
      $("#next-1").prop("disabled", true);
      next_step = false;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Remove_class_Error1() {
      $("#first_name").removeClass("input-error");
      $("#last_name").removeClass("input-error");
      $("#dob").removeClass("input-error");
      $("#step_two").show();
      $("#step_one").hide();
      $("#next-1").prop("disabled", false);
      next_step = true;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Checking_color_Error2() {
      $("#village").focus();
      $("#village").addClass("input-error");
      $("#province").focus();
      $("#province").addClass("input-error");
      $("#district").focus();
      $("#district").addClass("input-error");
      $("#country").focus();
      $("#country").addClass("input-error");
      $("#commune").focus();
      $("#commune").addClass("input-error");
      $("#step_two").show();
      $("#next-2").prop("disabled", true);
      next_step = false;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Remove_class_Error2() {
      $("#village").removeClass("input-error");
      $("#province").removeClass("input-error");
      $("#commune").removeClass("input-error");
      $("#district").removeClass("input-error");
      $("#country").removeClass("input-error");
      $("#step_two").hide();
      $("#step_tree").show();
      $("#next-2").prop("disabled", false);
      next_step = true;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Checking_color_Error3() {
      $("#current_province").addClass("input-error");
      $("#current_district").addClass("input-error");
      $("#current_commune").addClass("input-error");
      $("#current_village").addClass("input-error");
      $("#next-3").prop("disabled", true);
      $("#step_tree").show();
      next_step = false;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Remove_class_Error3() {
      $("#current_province").removeClass("input-error");
      $("#current_district").removeClass("input-error");
      $("#current_commune").removeClass("input-error");
      $("#current_village").removeClass("input-error");
      $("#next-3").prop("disabled", false);
      $("#step_tree").hide();
      $("#step_four").show();
      next_step = true;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Checking_color_Error4() {
      $("#phone_number").focus();
      $("#phone_number").addClass("input-error");
      $("#customFile").focus();
      $("#customFile").addClass("input-error");
     nationality.focus();
     nationality.addClass("input-error");
      $("#nationality_id").focus();
      $("#nationality_id").addClass("input-error");
      $("#status").focus();
      $("#status").addClass("input-error");
      alert("You Are  Add Teacher Error Please Chacking Again...........!!!!");
      $("#next-4").prop("disabled", true);
      $("#step_four").show();
      next_step = false;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Remove_class_Error4() {
      $("#phone_number").removeClass("input-error");
      $("#customFile").removeClass("input-error");
     nationality.removeClass("input-error");
      $("#nationality_id").removeClass("input-error");
      $("#status").removeClass("input-error");
      $("#next-4").prop("disabled", false);
      $("#step_four").hide();
      alert("You Are Add Teacher SuccessFully ............!");
      next_step = true;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      $("#first_name").keyup(function()
      {
            if( $("#first_name").val().length == 0 )
            {
                  $("#first_name").css("border-color","red");
                  $("#first_name").css("background-color","pink");
                  $("#first_name").focus();
                   $("#next-1").prop("disabled",true);
            }
           
            else if (!isNaN($("#first_name").val()))
            {
                  $("#first_name").css("border-color", "red");
                  $("#first_name").css("background-color", "pink");
                  $("#first_name").focus();
                  $("#next-1").prop("disabled", true);
            }
            else 
            {
                  $("#first_name").css("color", "green");
                  $("#first_name").css("border-color", "green");
                  $("#first_name").css("font-size", "16");
                  $("#first_name").css("font-weight", "bold");
                  $("#first_name").css("background-color", "white");
                  $("#next-1").prop("disabled", false);
            }
            try {
                  First_Name($("#first_name").val());
                  isfname = true;
                  $("#first_name_error").html("");
            }
            catch (f_name) {
                  isfname = false;
                  $("#first_name_error").html(f_name);
            }
      });  

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
       
      $("#last_name").keyup(function(){
            if( $("#last_name").val() == "" )
            {
                  $("#last_name").css("border-color","red");
                  $("#last_name").css("background-color","pink");
                  $("#last_name").focus();
                  $("#next-1").prop("disabled",true);
            }
         
            else if (!isNaN($("#last_name").val()) )
            {
                  $("#last_name").css("border-color", "red");
                  $("#last_name").css("background-color", "pink");
                  $("#last_name").focus();
                  $("#next-1").prop("disabled", true);
            }
            else 
            {
                  $("#last_name").css("border-color", "green");
                  $("#last_name").css("background-color", "white");
                  $("#last_name").css("color", "green");
                  $("#last_name").css("font-size", "16");
                  $("#last_name").css("font-weight", "bold");
                  $("#next-1").prop("disabled", false);
            }
            try {
                  Last_Name($("#last_name").val());
                  islname = true;
                  $("#last_name_error").html("");

            }
            catch (l_name) {
                  islname = false;
                  $("#last_name_error").html(l_name);

            }
      });

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#dob").change(function()
{
      if($("#dob").val() == "" )
      {
           $("#dob").css("border-color","red") ;
           $("#dob").css("background-color","pink");
           $("#dob").focus();
           $("#next-1").prop("disabled",true);
      }
      else
      {
           $("#dob").css("border-color","green") ;  
           $("#dob").css("background-color","white");
           $("#dob").css("font-size", "16");
           $("#dob").css("font-weight", "bold");
           $("#dob").css("color", "green");
           $("#next-1").prop("disabled",false);
      }
      try {
            Date_of_Birth($("#dob").val());
            isdob = true;
            $("#dob_error").html("");
      }
      catch (dob) {
            isdob = false;
            $("#dob_error").html(dob);
      }
});
 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////                                        End function step 2                        ///////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#village").change(function()
{
      if( $("#village").val() == "" )
   	{
            $("#village").css("border-color","red");
            $("#village").css("backgroud-color","pink");
            $("#village").focus();
            $("#next-2").prop("disabled",true);
   	}
   	else

   	{
            $("#village").css("border-color","green");
            $("#village").css("backgroud-color","white");
            $("#village").css("color", "green");
            $("#village").css("font-size", "16");
            $("#village").css("font-weight", "bold");
            $("#next-2").prop("disabled",false);
      }
      try {
            Cerren_Villeg($("#village").val());
            isvillage = true;
            $("#village_error").html("");
      }
      catch (v_vill) {
            isvillage = false;
            $("#village_error").html(v_vill);
      }
   });
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
$("#commune").change(function()
{
      if( $("#commune").val() == "" )
      {
           
            $("#commune").css("border-color","red");
            $("#commune").css("background-color","pink");
            $("#commune").focus();
            $("#next-2").prop("disabled",true);
      }
      else
      {
            $("#commune").css("border-color","green");
            $("#commune").css("background-color","white");
            $("#commune").css("color", "green");
            $("#commune").css("font-size", "16");
            $("#commune").css("font-weight", "bold");
            $("#next-2").prop("disabled",false);
      }      
      try {
            Cerren_commune($("#commune").val());
            iscommune = true;
            $("#commune_error").html("");
      }
      catch (c_com) {
            iscommune = false;
            $("#commune_error").html(c_com);
      }       
    });

 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#district").change(function()
    {
      if( $("#district").val() == "")
      {
            $("#district").css("border-color","red");
            $("#district").css("background-color","pink");
            $("#nex-2").prop("disabled",true);
            $("#district").focus();
      }
      else
      {
            $("#district").css("border-color","green");
            $("#district").css("background-color","white");
            $("#district").css("color", "green");
            $("#district").css("font-size", "16");
            $("#district").css("font-weight", "bold");
            $("#nex-2").prop("disabled",false);
      }  
          try {
                Cerren_district($("#district").val());
                isdistrict = true;
                $("#district_error").html("");
          }
          catch (d_dis) {
                isdistrict = false;
                $("#district_error").html(d_dis);
          }
});

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#province").change(function()
{
      if( $("#province").val() == ""  )
      {
            $("#province").css("border-color","red");
            $("#province").css("background-color","pink");
            $("#nex-2").prop("disabled",true);
            $("#province").focus();
      }
      else
      {
            $("#province").css("border-color","green");
            $("#province").css("background-color","white");
            $("#province").css("color", "green");
            $("#province").css("font-size", "16");
            $("#province").css("font-weight", "bold");
            $("#nex-2").prop("disabled",false);
      }
      try {
            Cerren_Province($("#province").val());
            isprovince = true;
            $("#province_error").html("");
      }
      catch (p_pro) {
            isprovince = false;
            $("#province_error").html(p_pro);
      }
});

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#country").change(function()
{
      if($("#country").val() == "" )
      {
            $("#country").css("border-color","red");                                                 
            $("#country").css("background-color","pink");
            $("#next-2").prop("disabled",true);
            $("#country").focus();
      }
      else
      {
            $("#country").css("border-color","green");
            $("#country").css("background-color","white");
            $("#country").css("color", "green");
            $("#country").css("font-size", "16");
            $("#country").css("font-weight", "bold");
            $("#next-2").prop("disabled",false);
      }
      try {
            Country($("#country").val());
            iscountry = true;
            $("#country_error").html("");
      }
      catch (c_contry) {
            iscountry = false;
            $("#country_error").html(c_country);
      }
});

 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 /////////////////////////////////                           End funcetion step 3               ////////////////////////
 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



 $("#current_province").change(function(){
      if( $("#current_province").val() == ""  )
      {
            $("#current_province").css("border-color","red");
            $("#current_province").css("background-color","pink");
            $("#nex-3").prop("disabled",true);
            $("#current_province").focus();
      }
      else
      {
            $("#current_province").css("border-color","green");
            $("#current_province").css("background-color","white");
            $("#current_province").css("color", "green");
            $("#current_province").css("font-size", "16");
            $("#current_province").css("font-weight", "bold");
            $("#nex-3").prop("disabled",false);
      }
       try {
             Cerren_Province($("#current_province").val());
             iscurrent_province = true;
             $("#current_province_error").html("");
       }
       catch (c_p_pro) {
             iscurrent_province = false;
             $("#current_province_error").html(c_p_pro);
       }
});

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
$("#current_district").change(function(){
      if( $("#current_district").val() == "" )
      {
            $("#current_district").css("border-color","red");
            $("#current_district").css("background-color","pink");
            $("#current_district").focus();
            $("#nex-3").prop("disabled", true);
      }
      else
      {
            $("#current_district").css("border-color","green");
            $("#current_district").css("background-color","white");
            $("#current_district").css("color", "green");
            $("#current_district").css("font-size", "16");
            $("#current_district").css("font-weight", "bold");
            $("#nex-3").prop("disabled", false);
      }  
      try {
            Cerren_district($("#current_district").val());
            iscerrent_district = true;
            $("#current_district_error").html("");
      }
      catch (c_d_dis) {
            iscerrent_district = false;
            $("#current_district_error").html(c_d_dis);
      }
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#current_commune").change(function(){
      if( $("#current_commune").val() == "" )
      {
            $("#current_commune").css("border-color","red");
            $("#current_commune").css("background-color","pink");
            $("#current_commune").focus();
            $("#next-3").prop("disabled", true);
      }
      else
      {
            $("#current_commune").css("border-color","green");
            $("#current_commune").css("background-color","white");
            $("#current_commune").css("color", "green");
            $("#current_commune").css("font-size", "16");
            $("#current_commune").css("font-weight", "bold");
            $("#next-3").prop("disabled", false);
      }          
      try {
            Cerren_commune($("#current_commune").val());
            iscurrent_commune = true;
            $("#current_commune_error").html("");
      }
      catch (c_c_com) {
            iscurrent_commune = false;
            $("#current_commune_error").html(c_c_com);
      }   
});
      
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#current_village").change(function(){
      if( $("#current_village").val() == "" )
      {
         $("#current_villagee").css("border-color","red");
         $("#current_village").css("backgroud-color","pink");
         $("#current_village").focus();
         $("#next-3").prop("disabled", true);
      }
      else

      {
         $("#current_village").css("border-color","green");
         $("#current_village").css("backgroud-color","white");
            $("#current_village").css("color", "green");
            $("#current_village").css("font-size", "16");
            $("#current_village").css("font-weight", "bold");
         $("#next-3").prop("disabled", false);
   }
      try {
            Cerren_Villeg($("#current_village").val());
            iscurrent_village = true;
            $("#current_village_error").html("");
      }
      catch (c_v_vill) {
            iscurrent_village = false;
            $("#current_village_error").html(c_v_vill);
      }
});

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////                              End function step 4                    ////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


$("#nationality_id").keyup(function()
{
      if( $("#nationality_id").val() == ""  )
       {
            $("#nationality_id").css("border-color", "red");
            $("#nationality_id").css("background-color","pink");
            $("#nationality_id").focus();
            $("#next-4").prop("disabled",true);
      }
      if ($("#nationality_id").val()  < 10  )
      {
            $("#nationality_id").css("border-color", "red");
            $("#nationality_id").css("background-color","pink");
            $("#nationality_id").focus();
            $("#next-4").prop("disabled",true);
      }
      if (isNaN($("#nationality_id").val())){
            $("#nationality_id").css("border-color", "red");
            $("#nationality_id").css("background-color", "pink");
            $("#nationality_id").focus();
            $("#next-4").prop("disabled", true);
      }
	 else{
		$("#nationality_id").css("border-color", "green");
            $("#nationality_id").css("background-color", "white");
            $("#nationality_id").css("color", "green");
            $("#nationality_id").css("font-size", "16");
            $("#nationality_id").css("font-weight", "bold");
            $("#next-4").prop("disabled", false);
	}
            
      try {
            Card_Id($("#nationality_id").val());
            isnationality_id = true;
            $("#nationality_id_error").html("");

      }
      catch (c_card) {
            isnationality_id = false;
            $("#nationality_id_error").html(c_card);

      }
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
     
$("#customFile").change(function()
{
      if( $("#customFile").val().length == 0 )
      {
            $("#customFile").css("border-color", "red");
            $("#customFile").css("background-color","pink");
            $("#customFile").focus();
            $("#next-4").prop("disabled",true);
	}
      else
      {
            $("#customFile").css("border-color", "red");
            $("#customFile").css("background-color","white");
            $("#customFile").css("color", "green");
            $("#customFile").css("font-size", "16");
            $("#customFile").css("font-weight", "bold");
            $("#next-4").prop("disabled",false);
      }
      try {
            Photo_Image($("#customFile").val());
            iscustomFile = true;
            $("#customFile_error").html("");
      }
      catch (c_cus) {
            iscustomFile = false;
            $("#customFile_error").html(c_cus);
      }
});

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$("#nationality").change(function()
{
      var nationality = $("#nationality option:selected").val();
      if(nationality.val() == ""  )
      {
           nationality.css("border-color", "red");
           nationality.css("background-color","pink");
           nationality.focus();
            $("#next-4").prop("disabled",true);
	}
	else{
           nationality.css("border-color", "green");
           nationality.css("background-color","white");
           nationality.css("color", "green");
           nationality.css("font-size", "16");
           nationality.css("font-weight", "bold");
            $("#next-4").prop("disabled",false);
          
      }
      try {
            Nationality($("#nationality").val());
            return isnationality = true;
            $("#nationality_error").html("");
      }
      catch (n_nat) {
            return isnationality = false;
            $("#nationality_error").html(n_nat);
      }
           
});    
      
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	  
$("#status").change(function()
{
      if( $("#status").val() == ""  )
      {
            $("#status").css("border-color", "red");
            $("#status").css("background-color","pink");
            $("#status").focus();
            $("#next-4").prop("disabled",true);
	}
	else{
            $("#status").css("border-color", "green");
            $("#status").css("background-color","white");
            $("#status").css("color", "green");
            $("#status").css("font-size", "16");
            $("#status").css("font-weight", "bold");
            $("#next-4").prop("disabled",false);
            $("#status_error").html("");
      }
      try {
            Status($("#status").val());
            isstatus = true;
            $("#status_error").html("");
      }
      catch (stat) {
            isstatus = false;
            $("#status_error").html(stat);
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
            $("#next-4").prop("disabled",true);
      }
      
      if($("#phone_number").val().length < 10 )
      {
            $("#phone_number").css("border-color","red");
            $("#phone_number").css("background-color","pink");
            $("#phone_number").focus();
            $("#next-4").prop("disabled",true);
      }
      else if (isNaN($("#phone_number").val())){
            $("#phone_number").css("border-color", "red");
            $("#phone_number").css("background-color", "pink");
            $("#next-4").prop("disabled", true);
      }
     else{
            $("#phone_number").css("border-color", "green");
            $("#phone_number").css("background-color", "white");
            $("#phone_number").css("color", "green");
            $("#phone_number").css("font-weight", "bold");
            $("#phone_number").css("font-size", "16");
            $("#next-4").prop("disabled", false);
      }
      try {
            Phone_Number($("#phone_number").val());
            isnationality_id = true;
            $("#phone_number_error").html("");

      }
      catch (err) {
            isnationality_id = false;
            $("#phone_number_error").html(err);

      }

});

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////                              End function step 4                    ///////////////////////////////////

      $("#next-1").click(function(){
            if ($("#first_name").val() == "" || $("#last_name").val() == "" || $("#dob").val() == "" )
            {
                  Checking_color_Error1();
            }
            else
            {
                  Remove_class_Error1();
            }
     });

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

     $("#next-2").click(function(){

           if ($("#village").val() == "" || $("#province").val() == "" || $("#commune").val() == "" || $("#district").val() == "" || $("#country").val() == "" )
                  { 
                      Checking_color_Error2();
                  }
            else
                  {
                      Remove_class_Error2();
                  }
      });

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      $("#next-3").click(function(){
            if ($("#current_province").val() == "" || $("#current_commune").val() == "" || $("#current_district").val() == "" || $("#current_village").val() == "" )
                  {
                     Checking_color_Error3();
                  }
            else
                  {   
                     Remove_class_Error3();
                  }
      });

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

      $("#next-4").click(function()
      {
            if ($("#phone_number").val() == "" || $("#customFile").val() == "" ||nationality.val() == "" || $("#nationality_id").val() == "" || $("#status").val() == "" )
                  {
                  Checking_color_Error4();
                    nationality();
                  }
            else
                  {    
                        Remove_class_Error4(); 
                  }
      });

 });





 
   	

 
                

   
   












