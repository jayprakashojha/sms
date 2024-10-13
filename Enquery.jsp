<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
   <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" >

 <script src="${pageContext.request.contextPath}/resources/js/sweetalert2.all.min.js"></script>
<!--  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
 <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>  
 -->
<style>



/* ==========================================================================
   #FONT
   ========================================================================== */
.font-robo {
  font-family: "Roboto", "Arial", "Helvetica Neue", sans-serif;
}

/* ==========================================================================
   #GRID
   ========================================================================== */
.row {
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-wrap: wrap;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
}

.row-space {
  -webkit-box-pack: justify;
  -webkit-justify-content: space-between;
  -moz-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
}

.col-2 {
  width: -webkit-calc((100% - 60px) / 2);
  width: -moz-calc((100% - 60px) / 2);
  width: calc((100% - 60px) / 2);
}

@media (max-width: 767px) {
  .col-2 {
    width: 100%;
  }
}

/* ==========================================================================
   #BOX-SIZING
   ========================================================================== */
/**
 * More sensible default box-sizing:
 * css-tricks.com/inheriting-box-sizing-probably-slightly-better-best-practice
 */
html {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

* {
  padding: 0;
  margin: 0;
}

*, *:before, *:after {
  -webkit-box-sizing: inherit;
  -moz-box-sizing: inherit;
  box-sizing: inherit;
}

/* ==========================================================================
   #RESET
   ========================================================================== */
/**
 * A very simple reset that sits on top of Normalize.css.
 */
body,
h1, h2, h3, h4, h5, h6,
blockquote, p, pre,
dl, dd, ol, ul,
figure,
hr,
fieldset, legend {
  margin: 0;
  padding: 0;
}

/**
 * Remove trailing margins from nested lists.
 */
li > ol,
li > ul {
  margin-bottom: 0;
}

/**
 * Remove default table spacing.
 */
table {
  border-collapse: collapse;
  border-spacing: 0;
}

/**
 * 1. Reset Chrome and Firefox behaviour which sets a `min-width: min-content;`
 *    on fieldsets.
 */
fieldset {
  min-width: 0;
  /* [1] */
  border: 0;
}

button {
  outline: none;
  background: none;
  border: none;
}

/* ==========================================================================
   #PAGE WRAPPER
   ========================================================================== */
.page-wrapper {
  min-height: 100vh;
}

body {
  font-family: "Roboto", "Arial", "Helvetica Neue", sans-serif;
  font-weight: 400;
  font-size: 14px;
}

h1, h2, h3, h4, h5, h6 {
  font-weight: 400;
}

h1 {
  font-size: 36px;
}

h2 {
  font-size: 30px;
}

h3 {
  font-size: 24px;
}

h4 {
  font-size: 18px;
}

h5 {
  font-size: 15px;
}

h6 {
  font-size: 13px;
}

/* ==========================================================================
   #BACKGROUND
   ========================================================================== */
.bg-blue {
  background:url("../bg1.png");
  background-repeat:round; 
}

/* ==========================================================================
   #SPACING
   ========================================================================== */
.p-t-100 {
  padding-top: 0px;
}

.p-t-20 {
  padding-top: 20px;
}

.p-b-100 {
  padding-bottom: 0px;
}

/* ==========================================================================
   #WRAPPER
   ========================================================================== */
.wrapper {
  margin: 0 auto;
}

.wrapper--w680 {
  max-width: 680px;
}

/* ==========================================================================
   #BUTTON
   ========================================================================== */
.btn {
  line-height: 40px;
  display: inline-block;
  padding: 0 25px;
  cursor: pointer;
  font-family: "Roboto", "Arial", "Helvetica Neue", sans-serif;
  color: #fff;
  -webkit-transition: all 0.4s ease;
  -o-transition: all 0.4s ease;
  -moz-transition: all 0.4s ease;
  transition: all 0.4s ease;
  font-size: 14px;
  font-weight: 700;
}

.btn--radius {
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
}

.btn--green 
{
  background: #57b846;
}
.btn--black
{
  background: bluesky;
}

.btn--green:hover {
  background: #4dae3c;
}

/* ==========================================================================
   #DATE PICKER
   ========================================================================== */
td.active {
  background-color: #2c6ed5;
}

input[type="date" i] {
  padding: 14px;
}

.table-condensed td, .table-condensed th {
  font-size: 14px;
  font-family: "Roboto", "Arial", "Helvetica Neue", sans-serif;
  font-weight: 400;
}

.daterangepicker td {
  width: 40px;
  height: 30px;
}

.daterangepicker {
  border: none;
  -webkit-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  display: none;
  border: 1px solid #e0e0e0;
  margin-top: 5px;
}

.daterangepicker::after, .daterangepicker::before {
  display: none;
}

.daterangepicker thead tr th {
  padding: 10px 0;
}

.daterangepicker .table-condensed th select {
  border: 1px solid #ccc;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  font-size: 14px;
  padding: 5px;
  outline: none;
}

/* ==========================================================================
   #FORM
   ========================================================================== */
input {
  outline: none;
  margin: 0;
  border: none;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
  box-shadow: none;
  width: 100%;
  font-size: 14px;
  font-family: inherit;
}

.input-group {
  position: relative;
  margin-bottom: 30px;
  border-bottom: 2px solid #ccc;
}

.input-icon {
  position: absolute;
  font-size: 18px;
  color: #ccc;
  right: 8px;
  top: 50%;
  -webkit-transform: translateY(-50%);
  -moz-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  -o-transform: translateY(-50%);
  transform: translateY(-50%);
  cursor: pointer;
}

.input--style-1 {
  padding: 9px 0;
  color: #666;
}

.input--style-1::-webkit-input-placeholder {
  /* WebKit, Blink, Edge */
  color: #555;
}

.input--style-1:-moz-placeholder {
  /* Mozilla Firefox 4 to 18 */
  color: #555;
  opacity: 1;
}

.input--style-1::-moz-placeholder {
  /* Mozilla Firefox 19+ */
  color: #555;
  opacity: 1;
}

.input--style-1:-ms-input-placeholder {
  /* Internet Explorer 10-11 */
  color: #555;
}

.input--style-1:-ms-input-placeholder {
  /* Microsoft Edge */
  color: #555;
}

/* ==========================================================================
   #SELECT2
   ========================================================================== */
.select--no-search .select2-search {
  display: none !important;
}

.rs-select2 .select2-container {
  width: 100% !important;
  outline: none;
}

.rs-select2 .select2-container .select2-selection--single {
  outline: none;
  border: none;
  height: 34px;
}

.rs-select2 .select2-container .select2-selection--single .select2-selection__rendered {
  line-height: 34px;
  padding-left: 0;
  color: #555;
}

.rs-select2 .select2-container .select2-selection--single .select2-selection__arrow {
  height: 32px;
  right: 4px;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-pack: center;
  -webkit-justify-content: center;
  -moz-box-pack: center;
  -ms-flex-pack: center;
  justify-content: center;
  -webkit-box-align: center;
  -webkit-align-items: center;
  -moz-box-align: center;
  -ms-flex-align: center;
  align-items: center;
}

.rs-select2 .select2-container .select2-selection--single .select2-selection__arrow b {
  display: none;
}

.rs-select2 .select2-container .select2-selection--single .select2-selection__arrow:after {
  font-family: "Material-Design-Iconic-Font";
  content: '\f2f9';
  font-size: 18px;
  color: #ccc;
  -webkit-transition: all 0.4s ease;
  -o-transition: all 0.4s ease;
  -moz-transition: all 0.4s ease;
  transition: all 0.4s ease;
}

.rs-select2 .select2-container.select2-container--open .select2-selection--single .select2-selection__arrow::after {
  -webkit-transform: rotate(-180deg);
  -moz-transform: rotate(-180deg);
  -ms-transform: rotate(-180deg);
  -o-transform: rotate(-180deg);
  transform: rotate(-180deg);
}

.select2-container--open .select2-dropdown--below {
  border: none;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  -webkit-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  border: 1px solid #e0e0e0;
  margin-top: 5px;
  overflow: hidden;
}

/* ==========================================================================
   #TITLE
   ========================================================================== */
.title {
  margin-bottom: 37px;
}

/* ==========================================================================
   #CARD
   ========================================================================== */
.card {
  overflow: hidden;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  background: #fff;
}

.card-1 {
  -webkit-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
  box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
}



.card-1 .card-body {
  padding: 0 90px;
  padding-top: 15px;
  padding-bottom: 15px;
}

@media (max-width: 767px) {
  .card-1 .card-body {
    padding: 0 40px;
    padding-top: 40px;
    padding-bottom: 40px;
  }
}
 .right-aligned {
            text-align: right; /* Align text inside the div to the right */
            margin-right: 0;   /* Optional: remove right margin */
        }
        .container {
            width: 100%;       /* Full width container */
        }

  body {
            background-color: lightblue; /* Change to your desired color */
        }

</style>


 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" >

 <script src="${pageContext.request.contextPath}/resources/js/sweetalert2.all.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
 <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>  
 
 
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Eqnuiry Management System">
    <meta name="author" content="Eqnuiry Management System">
    <meta name="keywords" content="Eqnuiry Management System">

    
    <title>Enquiry Management System</title>

    <!-- Icons font CSS-->
     <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" mediAbout websitea="all">
</head>
<body>
 
    <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo" >
     <div class="p-t-0" align="left">
                        <button class="btn btn--radius btn--black"  type="button" onclick="goBack()">Back</button>
                        </div>
     
        <div class="wrapper wrapper--w680">
        
       
               <div class="card card-1">
               


                <div class="card-body">
                   <center><h4 class="title" style="text-decoration: underline;">Enquiry Registration Form</h4></center> 
                    
                           
                        <div class="right-aligned">
                            <a href="Fees_Detail">Fees Detail</a>
                        </div>
                         <div class="right-aligned" ;>
                            <a href="TeacherDetail">Teacher Detail</a>
                        </div>
                        <div class="input-group">
                            <input required="required" class="input-style-4" type="text" placeholder="NAME *" name="name" id="name" >
                        </div>
                           <div class="input-group">
                            <input required="required" class="input-style-2" type="text" placeholder="FATHER NAME *" name="fathname"  id="fathname" >
                        </div>
                           <div class="input-group">
                            <input required="required" class="input-style-2" type="email" placeholder="PROPER EMAIL ID *" name="email" id="email" >
                        </div>
                          
                          <div class="input-group">
                            <input required=required class="input-style-2" type="text"  placeholder="MOBILE NO. *" name="mob" id="mobile" maxlength="10" >
                        </div>
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search" class="input-style-2">
                                        <select name="gender" id= "gender">
                                            <option disabled="disabled" selected="selected">GENDER *</option>
                                            <option>Male</option>
                                            <option>Female</option>
                                            
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                           
                        <div class="input-group">
                            <input required="required" class="input-style-2" type="text" placeholder="ADDRESS *" name="address"  id="address">
                        </div>
                        <div class="input-group" required="required">
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="jobtype" id = "jobtype">
                                    <option disabled="disabled" selected="selected">ANY JOB TYPE </option>
                                    <option>Private Job</option>
                                    <option>Government Job</option>
                                      <option>No Any Job</option>
                                    
                                    
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                         <div class="input-group">
                            <input class="input-style-2" type="text" maxlength="12"  placeholder="ENTER STUDENT ADHAR NUMBER" name="cd"  id ="cd">
                        </div>
                       <!--  <div class="input-group">
                            <input required="required" class="input-style-2" type="text" placeholder="ENTER YOUR ENQUIRY PURPOSE" name="enquiry"  id="enqury" >
                        </div> -->
                        
                         <div class="input-group" required="required">
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="jobtype" id = "enqury">
                                    <option disabled="disabled" selected="selected">Select Enquiry Purpose </option>
                                    <option>Admission</option>
                                    <option>School Information</option>
                                      <option>Any</option>
                                    
                                    
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        
                        <div class="p-t-20" align="center">
                            <button class="btn btn--radius btn--green"  type="button" name="sub" id="sub">Submit</button>
                        </div>
                        
                            
                        
                        
                   
                </div>
            </div>
        </div>
    </div>
  
    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>



function restrictToNumbers(inputId) {
    document.getElementById(inputId).addEventListener('input', function () {
        this.value = this.value.replace(/[^0-9]/g, '');
    });
}
    restrictToNumbers('mobile');
   restrictToNumbers('cd');

 
</script>


<script>
function goBack() {
    window.history.back();
    
   
}
</script>

<script>


$('#sub').click(function(){
	
	var formData  =  $("#name").val();
	var fathname  = $("#fathname").val();
	var email1    = $("#email").val();
	var mobile1   = $("#mobile").val().trim();

	 const isValid =  /^\d+$/.test(mobile1) && mobile1.length === 10;
    
	var gender1   = $("#gender").val();
	var address1  = $("#address").val();
	var jobtype1  = $("#jobtype").val();
	var cd1       = $("#cd").val().trim();
	 const isValidAdhar =  /^\d+$/.test(cd1) && cd1.length === 12;
	
	var enqury1   = $("#enqury").val();
	
	 if(formData=='')
		 {
		swal("Please Enter Name");
		return 0;
		 }
	 if(fathname=='')
	 {
	swal("Please Enter Father Name");
	return 0;
	 }
	 
	 if(email1=='')
	 {
	swal("Please Enter Email Id");
	return 0;
	 }
	 if(mobile1=='')
	 {
	swal("Please Enter Mobile Number");
	return 0;
	 }
	 if(isValid==false)
	 {
		 swal('Please enter a valid 10-digit mobile number.');
		return 0;
	 }
	 
	 
	 
	 if(gender1==null)
		 
	{
		 swal("Please Select Gender");
		 return 0;
	}
	
	 
	 
	 if(address1=='')
	 {
	swal("Please Enter Address");
	return 0;
	 }
	 
	 if(jobtype1==null)
		 
		{
			 swal("Please Select Job Type");
			 return 0;
		}
		

	 
	 if(cd1=='')
	 {
	swal("Please Enter Adhar Number of Student");
	return 0;
	 }
	 if(isValidAdhar==false)
		 {
		 swal("Please Enter 12 Digit Adhar Number of Student");
		 return 0;
		 }
	 
	 if(enqury1==null)
		 
		{
			 swal("Please Select Enquiry Purpose");
			 return 0;
		}
	 
	     
        
        $.ajax({
            type: "POST",
           url: "/sendtocontroller?name2="+formData+"&fathname="+fathname+"&email="+email1+"&mobile="+mobile1+"&gender="+gender1+"&address="+address1+"&jobtype="+jobtype1+"+&cd="+cd1+"&enqury="+enqury1, 
        //	url: "/sendtocontroller",
            //data: {'email':email1,'mobile':mobile1},
           // data: JSON.stringify(formData),
            contentType: "application/json",
            success: function(response) {
            	
            	if(response==true)
            		{
            	swal("Your Enquiry Done! Our Representative will call you soon");
            	$("#name").val('');
                $("#fathname").val('')
            	$("#email").val('');
            	 
            	$("#mobile").val('');

            	//$("#gender").val('');

            	$("#address").val('');
            	//$("#jobtype").val('');
            	$("#cd").val('');
            	// $("#enqury").val('');

            		}
            	else
            		{
            		swal("Adhar Number Already Exist");
            		}
            	
                
            },
            error: function(error) 
            {
               
                swal("Ajax Error Generated");
            }
        });

});

</script>


</html>
<!-- end document-->
