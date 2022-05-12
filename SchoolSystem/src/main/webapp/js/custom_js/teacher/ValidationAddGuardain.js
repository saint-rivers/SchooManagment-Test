
var isdistrict = false, isprovince = false, iscommune = false, isvillage = false;
var isf_name = false, isf_job = false, ism_name = false, ism_job = false, isphone = false;
$(document).ready(function () {

     ///////////////////////////////////////////////// function Father Name  Validation ////////////////////////////////////////////

    function Father_Name(f_name) {
        if (f_name == '') {
            throw ('Father Name Can Not Empty');
        }
        else if (!isNaN(f_name)) {
            throw ('Father Name Can Not Input Number');
        }
        else {
            throw ('');
        }
    }

    ///////////////////////////////////////////////// function Mother Name  Validation ////////////////////////////////////////////
    
    function Mother_Name(m_name) {
        if (m_name == '') {
            throw ('Mother Name Can Not Empty');
        }
        else if (!isNaN(m_name)) {
            throw ('Mother Name Can Not Input Number');
        }
        else {
            throw ('');
        }
    }

//////////////////////////////////////////////// Function Father Job Validation ////////////////////////////////////////////////////

    function Father_Job(f_job) {
        if (f_job == '') {
            throw ('Father Job Can Not Empty');
        }
        else if (!isNaN(f_job)) {
            throw ('Father Job Can Not Input Number');
        }
        else {
            throw ('');
        }
    }

///////////////////////////////////////////////// Function Mother Job  Validation ///////////////////////////////////////////////// 

    function Mother_Job(m_job) {
        if (m_job == '') {
            throw ('Mother Job Can Not Empty');
        }
        else if (!isNaN(m_job)) {
            throw ('Mother Job Can Not Input Number');
        }
        else {
            throw ('');
        }
    }

///////////////////////////////////////////////// Function Village  Validation ////////////////////////////////////////////////////

    /////////////////////////////////Function Display Message village////////////////////////////////////////////////////////////////// 

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

    ///////Function Display Message PhoneNumber////////////////////////////////////////////////////////////////////////////////////////

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

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function Guardian_submit_Checking_Error() {
    if ($("#father_name").val() == "" || $("#father_job").val() == "" || $("#mother_job").val() == "" || $("#village").val() == "" || $("#mother_name").val() == "" || $("#commune").val() == "" || $("#district").val() == "" || $("#province").val() == "" || $("#phone").val() == "") {
        Add_Focus_Class();
        Add_Color_Error();
        $(".submit_guadian").prop("disabled", true);
    }else{
        Remove_class();
        $(".submit_guadian").prop("disabled", false);
    }
}

///////////////////////////////////////////////// Function Compere True Or Fail Validation Submit //////////////////////////////////////////////////////
     
    $(".submit_guadian").on("click", function () {
        Guardian_submit_Checking_Error();
    });

/////////////////////////////////////////////////////////////////////////// Button Update Guardian Cheking True Or False ////////////////////////////////        
   
    $("#update_guardian").on("click",function () {
    Guardian_submit_Checking_Error();
});
    
/////////////////////////////////////////////////////////////////////////// Function Cheking Color Error ////////////////////////////////        
    
    function Add_Color_Error() {
        $("#mother_job").addClass("input-error");
        $("#father_job").addClass("input-error");
        $("#mother_name").addClass("input-error");
        $("#father_name").addClass("input-error");
        $("#village").addClass("input-error");
        $("#province").addClass("input-error");
        $("#commune").addClass("input-error");
        $("#district").addClass("input-error");
        $("#phone").addClass("input-error");
    }

///////////////////////////////////////////////////////////////////////////  Function Cheking Color Error  ////////////////////////////////
   
    function Remove_class() {
        $("#father_job").removeClass("input-error");
        $("#mother_job").removeClass("input-error");
        $("#mother_name").removeClass("input-error");
        $("#father_name").removeClass("input-error");
        $("#village").removeClass("input-error");
        $("#province").removeClass("input-error");
        $("#commune").removeClass("input-error");
        $("#district").removeClass("input-error");
        $("#phone").removeClass("input-error");
        
       
    }

////////////////////////////////////////////////////  Function Cheking Focus Corsor IntextBox //////////////////////////////////
    
    function Add_Focus_Class() {
        $("#mother_job").focus();
        $("#father_job").focus();
        $("#mother_name").focus();
        $("#father_name").focus();
        $("#village").focus();
        $("#province").focus();
        $("#commune").focus();
        $("#district").focus();
        $("#phone").focus();
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////

    $("#father_name").keyup(function () {
        if ($("#father_name").val() == "") {
            $("#father_name").css("border-color", "red");
            $("#father_name").css("background-color", "pink");
             $(".submit_guadian").prop("disabled", true);
        }
        if (!isNaN($("#father_name").val())){
            $("#father_name").css("border-color", "red");
            $("#father_name").css("background-color", "pink");
             $(".submit_guadian").prop("disabled", true);
        }
       
        else {
            $("#father_name").css("border-color", "green");
            $("#father_name").css("background-color", "white");
            $("#father_name").css("color", "green");
            $("#father_name").css("font-size", "16");
            $("#father_name").css("font-weight", "bold");
             $(".submit_guadian").prop("disabled", false);
        }
        try {
            Father_Name($("#father_name").val());
            isf_name = true;
            $("#father_name_error").html("");
        }
        catch (f_name) {
            isf_name = false;
            $("#father_name_error").html(f_name);
        }

    });

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#father_job").keyup(function () {
        if ($("#father_job").val() == "") {
            $("#father_job").css("border-color", "red");
            $("#father_job").css("background-color", "pink");
             $(".submit_guadian").prop("disabled", true);
        }
        if (!isNaN($("#father_job").val())) {
            $("#father_job").css("border-color", "red");
            $("#father_job").css("background-color", "pink");
             $(".submit_guadian").prop("disabled", true);
        }
       
        else {
            $("#father_job").css("border-color", "green");
            $("#father_job").css("background-color", "white");
            $("#father_job").css("color", "green");
            $("#father_job").css("font-size", "16");
            $("#father_job").css("font-weight", "bold");
             $(".submit_guadian").prop("disabled", false);
        }
        try {
            Father_Job($("#father_job").val());
            isf_job = true;
            $("#father_job_error").html("");
        }
        catch (f_job) {
              isf_job = false;
            $("#father_job_error").html(f_job);
        }
    });

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#mother_job").keyup(function () {

        if ($("#mother_job").val() == "") {
            $("#mother_job").css("border-color", "red");
            $("#mother_job").css("background-color", "pink");
             $(".submit_guadian").prop("disabled", true);
        }
        if ( !isNaN($("#mother_job").val())) {
            $("#mother_job").css("border-color", "red");
            $("#mother_job").css("background-color", "pink");
             $(".submit_guadian").prop("disabled", true);
        }
        
        else {
            $("#mother_job").css("border-color", "green");
            $("#mother_job").css("background-color", "white");
            $("#mother_job").css("color", "green");
            $("#mother_job").css("font-size", "16");
            $("#mother_job").css("font-weight", "bold");
             $(".submit_guadian").prop("disabled", false);
        }
        try {
            Mother_Job($("#mother_job").val());
            ism_job = true;
            $("#mother_job_error").html("");
        }
        catch (m_job) {
            ism_job = false;
            $("#mother_job_error").html(m_job);
        }
    });

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#mother_name").keyup(function () {
        if ($("#mother_name").val() == "") {
            $("#mother_name").css("border-color", "red");
            $("#mother_name").css("background-color", "pink");
             $(".submit_guadian").prop("disabled", true);
        }
        if (!isNaN($("#mother_name").val())){
            $("#mother_name").css("border-color", "red");
            $("#mother_name").css("background-color", "pink");
             $(".submit_guadian").prop("disabled", true);
        }
       
        else {
            $("#mother_name").css("border-color", "green");
            $("#mother_name").css("background-color", "white");
            $("#mother_name").css("color", "green");
            $("#mother_name").css("font-size", "16");
            $("#mother_name").css("font-weight", "bold");
             $(".submit_guadian").prop("disabled", false);
        }
        try {
         Mother_Name($("#mother_name").val());
           ism_name =true;
            $("#mother_name_error").html("");
        }
        catch (mo_name) {
            ism_name = false;
            $("#mother_name_error").html(mo_name);
        }
    });

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#village").change(function () {
        if ($("#village").val() == "") {
            $("#village").css("border-color", "red");
            $("#village").css("background-color", "pink");
            $(".submit_guadian").prop("disabled", true);
        }
        else {
            $("#village").css("border-color", "green");
            $("#village").css("background-color", "white");
            $("#village").css("color", "green");
            $("#village").css("font-size", "16");
            $("#village").css("font-weight", "bold");
             $(".submit_guadian").prop("disabled", false);
        }
        try {
            Cerren_Villeg($("#village").val());
            isvillage = true;
            $("#village_error").html("");
        }
        catch (vil) {
            isvillage = false;
            $("#village_error").html(vil);
        }
    });
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#commune").change(function () {
        if ($("#commune").val() == "") {
            $("#commune").css("border-color", "red");
            $("#commune").css("background-color", "pink");
             $(".submit_guadian").prop("disabled", true);
        }
        else {
            $("#commune").css("border-color", "green");
            $("#commune").css("background-color", "white");
            $("#commune").css("color", "green");
            $("#commune").css("font-size", "16");
            $("#commune").css("font-weight", "bold");
             $(".submit_guadian").prop("disabled", false);
        }
        try {
            Cerren_commune($("#commune").val());
            iscommune = true;
            $("#commune_error").html("");
        }
        catch (com) {
            iscommune = false;
            $("#commune_error").html(com);
        }
    });

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#district").change(function () {
        if ($("#district").val() == "") {
            $("#district").css("border-color", "red");
            $("#district").css("background-color", "pink");
             $(".submit_guadian").prop("disabled", true);
        }
        else {
            $("#district").css("border-color", "green");
            $("#district").css("background-color", "white");
            $("#district").css("color", "green");
            $("#district").css("font-size", "16");
            $("#district").css("font-weight", "bold");
             $(".submit_guadian").prop("disabled", false);
        }
        try {
            Cerren_district($("#district").val());
            isdistrict = true;
            $("#district_error").html("");
        }
        catch (dis) {
            isdistrict = false;
            $("#district_error").html(dis);
        }
    });

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#province").change(function () {
        if ($("#province").val() == "") {
            $("#province").css("border-color", "red");
            $("#province").css("background-color", "pink");
             $(".submit_guadian").prop("disabled", true);
        }
        else {
            $("#provinc").css("border-color", "green");
            $("#province").css("background-color", "white");
            $("#province").css("color", "green");
            $("#province").css("font-size", "16");
            $("#province").css("font-weight", "bold");
             $(".submit_guadian").prop("disabled", false);
        }
        try {
            Cerren_Province($("#province").val());
            isprovince = true;
            $("#province_error").html("");
        }
        catch (pro) {
            isprovince = false;
            $("#province_error").html(pro);
        }
    });

   

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#phone").keyup(function () {
        if ($("#phone").val() == "") {
            $("#phone").css("border-color", "red");
            $("#phone").css("background-color", "pink");
             $(".submit_guadian").prop("disabled", true);
        }

        if ($("#phone").val().length < 10) {
            $("#phone").css("border-color", "red");
            $("#phone").css("background-color", "pink");
            $(".submit_guadian").prop("disabled", true);
        }

        if (isNaN($("#phone").val())){
            $("#phone").css("border-color", "red");
            $("#phone").css("background-color", "pink");
             $(".submit_guadian").prop("disabled", true);
        }
        else {
            $("#phone").css("border-color", "green");
            $("#phone").css("background-color", "white");
            $("#phone").css("color", "green");
            $("#phone").css("font-size", "16");
            $("#phone").css("font-weight", "bold");
            $(".submit_guadian").prop("disabled", false);
        }
        try {
            Phone_Number($("#phone").val());
            isphone = true;
            $("#phone_error").html("");
        }
        catch (pho) {
            isphone = false;
            $("#phone_error").html(pho);
        }
    });
});
