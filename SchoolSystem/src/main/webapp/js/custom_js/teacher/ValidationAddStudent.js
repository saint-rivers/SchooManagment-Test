
var isdistrict = false, isprovince = false, iscommune = false, isvillage = false;
var isfname = false, isdob = false, islname = false;
var iscommune_id = false, isprovince_id = false, isdistrict_id = false, isvillage_id = false;
var iscustomFile = false, isnationality = false, isphone = false;


$(document).ready(function () {

    /////////////////////////////////////////Function Display Message First Name /////////////////////////////////////////////////////

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

    /////////////////////////////////Function Display Message Date Of Birth ///////////////////////////////////////////////////////////

    function Date_of_Birth(d_dob) {
        if (d_dob == '') {
            throw ('Date Of Birth Can Not Empty');
        }
        else if (d_dob != "") {
            throw ('');
        }
        else {
            throw ('Date Of Birth Is Valid');

        }
    }

    ////////////////////////////////Function Display Message Nationality //////////////////////////////////////////////////////////////

    function Nationality(n_nationality) {

        if (n_nationality != "") {
            throw ('');
        }
        if (n_nationality == '') {
            throw ('Please Select Nationality');
        }

    }

    /////////////////////////////////Function Display Message village////////////////////////////////////////////////////////////////// 

    function Cerren_Villeg(v_village) {
        if (v_village == '') {
            throw ('Please Select village');
        }
        else {
            throw ('');
        }
    }

    ////////////////////////////////Function Display Message district ////////////////////////////////////////////////////////////////

    function Cerren_district(d_district) {
        if (d_district == '') {
            throw ('Please Select district');
        }
        else {
            throw ('');
        }
    }

    ////////////////////////////Function Display Message commune//////////////////////////////////////////////////////////////////////

    function Cerren_commune(c_commune) {

        if (c_commune == '') {
            throw ('Please Select commune');
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

    ///////////////////Function Display Message Image Name ///////////////////////////////////////////////////////////////////////////

    function Photo_Image(i_image) {
        if (i_image == '') {
            throw ('Please Select Image Name');
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

    ///////////////////////////////////////////Function Remove Class Css Color//////////////////////////////////////////////////////////

    function Remove_Color_Class() {
        $("#first_name").removeClass("input-error");
        $("#last_name").removeClass("input-error");
        $("#nationality").removeClass("input-error");
        $("#dob").removeClass("input-error");
        $("#commune_id").removeClass("input-error");
        $("#commune").removeClass("input-error");
        $("#village_id").removeClass("input-error");
        $("#village").removeClass("input-error");
        $("#district_id").removeClass("input-error");
        $("#district").removeClass("input-error");
        $("#province_id").removeClass("input-error");
        $("#province").removeClass("input-error");
        $("#phone").removeClass("input-error");
        $("#customFile").removeClass("input-error");
    }

    //////////////////////////////////////////////Function Add Class Css Color///////////////////////////////////////////////////////////

    function Check_Color_Error() {
        $("#first_name").addClass("input-error");
        $("#last_name").addClass("input-error");
        $("#nationality").addClass("input-error");
        $("#dob").addClass("input-error");
        $("#commune_id").addClass("input-error");
        $("#commune").addClass("input-error");
        $("#village_id").addClass("input-error");
        $("#village").addClass("input-error");
        $("#district_id").addClass("input-error");
        $("#district").addClass("input-error");
        $("#province_id").addClass("input-error");
        $("#province").addClass("input-error");
        $("#phone").addClass("input-error");
        $("#customFile").addClass("input-error");
    }

    /////////////////////////////////////////////////Function Chacking Cosor Focus/////////////////////////////////////////////////////////////

    function Check_Focus() {
        $("#first_name").focus();
        $("#last_name").focus();
        $("#nationality").focus();
        $("#dob").focus();
        $("#commune_id").focus();
        $("#commune").focus();
        $("#village_id").focus();
        $("#village").focus();
        $("#district_id").focus();
        $("#district").focus();
        $("#province_id").focus();
        $("#province").focus();
        $("#phone").focus();
        $("#customFile").focus();
    }

    /////////////////////////////////////////////////////// Function Cheking True Or False Befor Submit//////////////////////////////////////////////////////   

    function submit_Cheking_Error() {
        if ($("#first_name").val() == "" || $("#last_name").val() == "" || $("#nationality").val() == "" || $("#dob").val() == "" || $("#village").val() == "" || $("#commune").val() == "" || $("#district").val() == "" || $("#province").val() == "" || $("#village_id").val() == "" || $("#commune_id").val() == ""
            || $("#district_id").val() == "" || $("#province_id").val() == "" || $("#phone").val() == "" || $("#customFile").val() == "") {
            Check_Color_Error();
            Check_Focus();
            $("#Student_submit").prop("disabled", true);
        }else{
            Remove_Color_Class()
            $("#Student_submit").prop("disabled", false);
        }
    }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#Student_submit").click(function () {
        submit_Cheking_Error();
    });

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#update_student").click(function () {
        submit_Cheking_Error();
    });

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#first_name").keyup(function () {
        if ($("#first_name").val() == "") {
            $("#first_name").css("border-color", "red");
            $("#first_name").css("background-color", "pink");

        }
        else if (!isNaN($("#first_name").val())) {
            $("#first_name").css("border-color", "red");
            $("#first_name").css("background-color", "pink");

        }
        else {
            $("#first_name").css("border-color", "green");
            $("#first_name").css("background-color", "white");
            $("#first_name").css("color", "green");
            $("#first_name").css("font-size", "16");
            $("#first_name").css("font-weight", "bold");
            $("#Student_submit").prop("disabled", false);
        }
        try {
            First_Name($("#first_name").val());
            isfname = true;
            $("#first_name_error").html("");


        }
        catch (Fn) {
            isfname = false;
            $("#first_name_error").html(Fn);

        }
    });

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#last_name").keyup(function () {
        /// Last Name val And Hide Message
        if ($("#last_name").val() == "") {
            $("#last_name").css("border-color", "red");
            $("#last_name").css("background-color", "pink");

        }
        else if (!isNaN($("#last_name").val())) {
            $("#last_name").css("border-color", "red");
            $("#last_name").css("background-color", "pink");

        }
        else {
            $("#last_name").css("border-color", "green");
            $("#last_name").css("background-color", "white");
            $("#last_name").css("color", "green");
            $("#last_name").css("font-size", "16");
            $("#last_name").css("font-weight", "bold");
            $("#Student_submit").prop("disabled", false);
        }
        try {
            Last_Name($("#last_name").val());
            islname = true;
            $("#last_name_error").html("");

        }
        catch (err) {
            islname = false;
            $("#last_name_error").html(err);

        }
    });

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#dob").change(function () {
        /// Date Of Birth val And Hide Message
        if ($("#dob").val() == "") {
            $("#dob").css("border-color", "red");
            $("#dob").css("background-color", "pink");

        }
        else if ($("#dob").val() != "") {
            $("#dob").css("border-color", "green");
            $("#dob").css("background-color", "white");
            $("#dob").css("color", "green");
            $("#dob").css("font-size", "16");
            $("#dob").css("font-weight", "bold");
            $("#Student_submit").prop("disabled", false);
        }
        else {
            $("#dob").css("border-color", "red");
            $("#dob").css("background-color", "pink");
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

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#village").change(function () {
        /// Cerren village val And Hide Message
        if ($("#village").val() == "") {
            $("#village").css("border-color", "red");
            $("#village").css("background-color", "pink");

        }

        else {
            $("#village").css("border-color", "green");
            $("#village").css("background-color", "white");
            $("#village").css("color", "green");
            $("#village").css("font-size", "16");
            $("#village").css("font-weight", "bold");
            $("#Student_submit").prop("disabled", false);
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

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#commune").change(function () {
        /// Cerren commune val And Hide Message
        if ($("#commune").val() == "") {
            $("#commune").css("border-color", "red");
            $("#commune").css("background-color", "pink");

        }
        else {
            $("#commune").css("border-color", "green");
            $("#commune").css("background-color", "white");
            $("#commune").css("color", "green");
            $("#commune").css("font-size", "16");
            $("#commune").css("font-weight", "bold");
            $("#Student_submit").prop("disabled", false);
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

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#district").change(function () {
        /// Ceerren district val And Hide Message
        if ($("#district").val() == "") {
            $("#district").css("border-color", "red");
            $("#district").css("background-color", "pink");

        }
        else {
            $("#district").css("border-color", "green");
            $("#district").css("background-color", "white");
            $("#district").css("color", "green");
            $("#district").css("font-size", "16");
            $("#district").css("font-weight", "bold");
            $("#Student_submit").prop("disabled", false);
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

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#province").change(function () {
        /// Cerren Province val And Hide Message
        if ($("#province").val() == "") {
            $("#province").css("border-color", "red");
            $("#province").css("background-color", "pink");

        }
        else {
            $("#province").css("border-color", "green");
            $("#province").css("background-color", "white");
            $("#province").css("color", "green");
            $("#province").css("font-size", "16");
            $("#province").css("font-weight", "bold");
            $("#Student_submit").prop("disabled", false);
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

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#province_id").change(function () {
        /// Place Of Birth Province val And Hide Message
        if ($("#province_id").val() == "") {
            $("#province_id").css("border-color", "red");
            $("#province_id").css("background-color", "pink");

        }
        else {
            $("#province_id").css("border-color", "green");
            $("#province_id").css("background-color", "white");
            $("#province_id").css("color", "green");
            $("#province_id").css("font-size", "16");
            $("#province_id").css("font-weight", "bold");
            $("#Student_submit").prop("disabled", false);
        }
        try {
            Cerren_Province($("#province_id").val());
            isprovince_id = true;
            $("#province_id_error").html("");
        }
        catch (pro_id) {
            isprovince_id = false;
            $("#province_id_error").html(pro_id);
        }
    });

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#district_id").change(function () {
        /// Place Of Birth district val And Hide Message
        if ($("#district_id").val() == "") {
            $("#district_id").css("border-color", "red");
            $("#district_id").css("background-color", "pink");

        }
        else {
            $("#district_id").css("border-color", "green");
            $("#district_id").css("background-color", "white");
            $("#district_id").css("color", "green");
            $("#district_id").css("font-size", "16");
            $("#district_id").css("font-weight", "bold");
            $("#Student_submit").prop("disabled", false);
        }
        try {
            Cerren_district($("#district_id").val());
            isdistrict_id = true;
            $("#district_id_error").html("");
        }
        catch (dis_id) {
            isdistrict_id = false;
            $("#district_id_error").html(dis_id);
        }
    });

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#commune_id").change(function () {
        /// Place Of Birth commune val And Hide Message
        if ($("#commune_id").val() == "") {
            $("#commune_id").css("border-color", "red");
            $("#commune_id").css("background-color", "pink");

        }
        else {
            $("#commune_id").css("border-color", "green");
            $("#commune_id").css("background-color", "white");
            $("#commune_id").css("color", "green");
            $("#commune_id").css("font-size", "16");
            $("#commune_id").css("font-weight", "bold");
            $("#Student_submit").prop("disabled", false);
        }
        try {
            Cerren_commune($("#commune_id").val());
            iscommune_id = true;
            $("#commune_id_error").html("");
        }
        catch (com_id) {
            iscommune_id = false;
            $("#commune_id_error").html(com_id);
        }
    });

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#village_id").change(function () {
        /// Place of Birth village val And Hide Message
        if ($("#village_id").val() == "") {
            $("#village_id").css("border-color", "red");
            $("#village_id").css("background-color", "pink");
            $("#village_id_error").html("Please Select Cerrent Adrress");
        }
        else {
            $("#village_id").css("border-color", "green");
            $("#village_id").css("background-color", "white");
            $("#village_id").css("color", "green");
            $("#village_id").css("font-size", "16");
            $("#village_id").css("font-weight", "bold");
            $("#Student_submit").prop("disabled", false);
            $("#village_id_error").html("");
        }
        try {
            Cerren_Villeg($("#village_id").val());
            isvillage_id = true;
            $("#village_id_error").html("");
        }
        catch (vil_id) {
            isvillage_id = false;
            $("#village_id_error").html(vil_id);
        }
    });

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#customFile").change(function () {
        /// Image val And Hide Message
        if ($("#customFile").val() == "") {
            $("#customFile").css("border-color", "red");
            $("#customFile").css("background-color", "pink");

        }
        else {
            $("#customFile").css("border-color", "green");
            $("#customFile").css("background-color", "white");
            $("#customFile").css("color", "green");
            $("#customFile").css("font-size", "16");
            $("#customFile").css("font-weight", "bold");
            $("#Student_submit").prop("disabled", false);
        }
        try {
            Photo_Image($("#customFile").val());
            iscustomFile = true;
            $("#customFile_error").html("");
        }
        catch (cus) {
            iscustomFile = false;
            $("#customFile_error").html(cus);
        }

    });

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#nationality").change(function () {
        /// Nationality val And Hide Message  
        for (var i = 1; i <= $("#nationality").val().length; i++) {
            if ($("#nationality").val() != "") {
                $("#nationality").css("border-color", "green");
                $("#nationality").css("background-color", "white");
                $("#nationality").css("color", "green");
                $("#nationality").css("font-size", "16");
                $("#nationality").css("font-weight", "bold");
                $("#nationality_error").html("");
                $("#Student_submit").prop("disabled", false);
            }
        }
        if ($("#nationality").val() == "") {
            $("#nationality").css("border-color", "red");
            $("#nationality").css("background-color", "pink");
            $("#Student_submit").prop("disabled", true);
        }

        try {
            Nationality($("#nationality").val());
            isnationality = true;
            $("#nationality_error").html("");
        }
        catch (nat) {
            isnationality = false;
            $("#nationality_error").html(nat);
        }
    });

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    $("#phone").keyup(function () {
        /// Phone Number val And Hide Message
        if ($("#phone").val() == "") {
            $("#phone").css("border-color", "red");
            $("#phone").css("background-color", "pink");
        }
        else if ($("#phone").val().length < 10) {
            $("#phone").css("border-color", "red");
            $("#phone").css("background-color", "pink");
        }
        else if (isNaN($("#phone").val())) {
            $("#phone").css("border-color", "red");
            $("#phone").css("background-color", "pink");
        }
        else {

            $("#phone").css("border-color", "green");
            $("#phone").css("background-color", "white");
            $("#phone").css("color", "green");
            $("#phone").css("font-size", "16");
            $("#phone").css("font-weight", "bold");
            $("#Student_submit").prop("disabled", false);
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////