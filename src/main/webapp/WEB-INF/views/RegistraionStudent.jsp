<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
 
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
 <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>  

           
   <title>Student Registration Page</title>

    
   
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Eqnuiry Management System">
    <meta name="author" content="Eqnuiry Management System">
    <meta name="keywords" content="Eqnuiry Management System">

  
     <link href="css/main.css" rel="stylesheet" mediAbout websitea="all">
     <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    

   
   </head>
   
   
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

.btn--green {
  background: #57b846;
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

.card-1 .card-heading {
  background: url("../images/bg-head-02.jpg") center center/cover no-repeat;
  padding-top: 210px;
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

    </style>   
    <!-- Vendor CSS-->
   
   
      
<body>
 <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo" >
        <div class="wrapper wrapper--w680">


            <div class="card card-1">
                
                <div class="card-body">
                  <h4 style="text-align: center;">Student Registration</h4>
                    <form method="POST" action="">
                           

                       
           <div class="input-group">
                       

                       
                            <input class="input--style-4" type="text" placeholder="Enter the Enquiry ID *" name="enqid" id="enqid">
                           
                           </div>
           <div class="input-group">
      
                              
               
                       
                        
                       
                            <input class="input--style-4" type="text" placeholder="NAME OF CANDIDATE *" name="name1" id="name1">
                     
                      </div>
           <div class="input-group">
      
                     
                                                    
                            <input  class="input--style-4" type="text" placeholder="FATHER / HUSBAND NAME *" name="fname" id="fname">
                     
                     </div>
                     <div class="input-group">
                     
 
                          
                            <input class="input--style-4" type="email" placeholder="EMAIL *"   name="email" id="email">
                     
                         </div>
                     <div class="input-group">
                     
 
                         
                       
                        
                          
                            <input required="required" class="input--style-4" type="number"  placeholder="MOBILE NO. *" name="mob" id="mob">
                       
                        </div>
                        <div class="input-group">
                        
                            <input required="required" class="input--style-4" type="date" placeholder="DATE OF BIRTH *" name="dob" id="dob">
                       
                               </div>
                               <div class="input-group">
                            <input required="required"  type="number" class="input--style-4" placeholder="AADHAR CARD NO. (OPTIONAL)" name="adhar" id="adhar" >
                    
                               </div>
                               <div class="input-group">
                       
                            
                                        <select name="gender" id="gender" class="input--style-4">
                                            <option>GENDER *</option>
                                            <option>Male</option>
                                            <option>Female</option>
                                            
                                        </select>
                       
                                   </div>
                                   <div class="input-group">
                                        <select name="category" id="cat" class="input--style-4" >
                                            <option disabled="disabled" selected="selected" >CATEGORY *</option>
                                            <option>SC</option>
                                            <option>ST</option>
                                            <option>OBC</option>
                                            <option>GEN</option>
                                            
                                        </select>
                                     </div>
                                     <div class="input-group">
                        
                       
                        
                                <select name="category" id="qualification" class="input--style-4">
                                    <option disabled="disabled" selected="selected" value="12">FATHER EDUCATION  *</option>
                                    <option>10</option>
                                    <option>12</option>
                                    <option>UG</option>
                                       <option>PG</option>
                                    
                                    
                                </select>
                               </div>
                               <div class = "input-group">
                       
                            <input required="required" class="input--style-4" type="text" placeholder="ADDRESS *" name="address" id="address">
                            </div>
                            <div class="input-group">
                       
                            <input required="required" class="input--style-4" type="number" placeholder="PIN CODE *" name="pin" id="pin" >
                        
                        </div>
                            <div class="input-group">
                            <input required="required" class="input--style-4" type="text" placeholder="FATHER OCCUPTION *" name="job" id="job" >
                        
                        </div>
                        <div class="input-group">
                            <input required="required" class="input--style-4" type="time" placeholder="BATCH TIME *" name="btime" id="btime">
                         
                         </div>
                           <div class="input-group">
                                <select name="admissionclass" id="admissionclass">
                                    <option disabled="disabled" selected="selected" value="5">WHICH CLASS ADMISSION *</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>6</option>
                                    <option>7</option>
                                    <option>8</option>
                                    <option>9</option>
                                    <option>10</option>
                                    <option>11</option>
                                    <option>12</option>
                                </select>
                           
                           </div>
                        </form>
                       
                           
                            <input class="input--style-4" type="file" placeholder="PHOTO *" name="fileInput"  id="fileInput">
                        
                        <div align="center">
                            <button class="btn btn--radius btn--green" type="submit" id="btn" name="btn">Submit</button>
                       
                         
                         
                            <button class="btn btn--radius btn--green" type="button" id="show1" name="btn">Show Detail</button>
                        </div>
                            </div>
                        </div>
                   </div>
                   </div>
     
    <script>
    
    $('#show1').click(function(){
    var t1 = $('#enqid').val();
   
    $.ajax({
    	type:"POST",
    	url:"showregistrationdetail",
    	data:{'enqid':t1},
    	success:function(response)
    	{
    		
    		
    	
    		$("#name1").val(response.firstName);

    		$("#fname").val(response.fathername);
    		$("#email").val(response.email);
    		$("#mob").val(response.mobile);
    		$("#address").val(response.address);
    		
    		
    	},
    	error:function(response)
    	{
    		swal("ajax erro");
    	}
    	
    });
    	
    });
    
    </script>
    
     <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>
      <script src="js/global.js"></script>
    
    
<script>

$('#btn').click(function(){
	
	var name1 = $("#name1").val();
	var fname1 = $("#fname").val();
	var email1 = $("#email").val();
	var mob1   = $("#mob").val();
	var dob1   = $("#dob").val();
	var adhar1   = $("#adhar").val();
	var gender1   = $("#gender").val();
	var cat1   = $("#cat").val();
	var qualification1   = $("#qualification").val();
	var address1   = $("#address").val();
	var pin1   = $("#pin").val();
	var job1   = $("#job").val();
	var btime1   = $("#btime").val();
	var classadmission1   = $("#admissionclass").val();
	
	var fileInput = $('#fileInput')[0];
     var file = fileInput.files[0];
     if(file)
    	 {
        var formData = new FormData();
         formData.append('file2', file);
         formData.append('name',name1);
         formData.append('fname',fname1);
         formData.append('email',email1);
         formData.append('mob',mob1);
         formData.append('dob',dob1);
         formData.append('adhar',adhar1);
         formData.append('gender',gender1);
         formData.append('cat',cat1);
         formData.append('qualification',qualification1);
         formData.append('address',address1);
         formData.append('pin',pin1);
         formData.append('job',job1);
         formData.append('btime',btime1);
         formData.append('admissionclass',classadmission1);
         
	
	$.ajax({
	
		type:"POST",
		url:"RegistrationFormInserte",
		data:formData,
		 processData: false, 
         contentType: false,
		
		success:function(response)
		{
			
			//swal("Your Registration Successfully Done");
			//swal("Your User Name is:- "email1);
			//swal("Your Password is:- "response);
			
			swal({
				 title: 'User Credentials',
				  html: 
				        'Username: <strong>' + email1 + '</strong><br>' +
				        'Password: <strong>' + response + '</strong>',
				  icon: 'info'
				});
			
			
		},
		error:function(response)
		{
			swal("ajax error");
		}
	});
    	 }
	
});


</script>
  
    <script src="vendor/jquery/jquery.min.js"></script> 
    <!-- Vendor JS-->
     <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>
   

</body>

</html>
