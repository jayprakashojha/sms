

<!DOCTYPE html>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 

<html lang="en">
<head>
 <jsp:include page="Header.jsp" /> 


</head>
 

<meta charset="utf-8">
<meta name="author" content="SemiColonWeb" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style>
 .assign_btn {
	margin-bottom: 10px;
}

.top {
    display: flex;
    flex-wrap: wrap;
}
table tr:last-child {
  font-weight: bold;
  background: #cce4fd;
}

.table_hover{
	text-align: center;
}
tbody.table_hover tr td a:hover {
    color: #29c3be;
}
tbody.table_hover tr td a{
	font-weight: bold !important;
    text-decoration: none;
    color: blue;
}
th {
    font-size: 17px !important;
    font-weight: bold !important;
}
td{
    font-size: 16px;
    text-align: center;
    color: black;
    
}
td a{
    color: blue;
    text-decoration: none;
    font-weight: bold;
}
td a:hover{
    text-decoration: underline;
    color: black;
}
    padding-top: 8px;
    color: #0d6efe;
}
div#custListTable_paginate {
    width: 37%;
    float: right;
    text-align: center;
    overflow: hidden;
    padding-top: 0px;
} */

 .txt1{
      border: none; /* Removes the border */
      background-color: "white" /* Optional: change the background color if needed */
      padding: 8px; /* Optional: add some padding */
      font-size: 16px; /* Optional: adjust the font size */
    }

</style>
<body class="app sidebar-mini">
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 content">
	
		<div class="data_bg">
			<h2>Admin   <label id="txt3"></label></h2>
			<div class="col-md-2">
				
								 <label id="txt2">This is a message</label>
								
						</div>
				
			<hr />

			
				<div class="row">
				
				<div class="row">
					
					<div class="col-md-11">
							<div class="mb-3">
								
							 <label for="teachersubject">Select Teacher Name:</label>
    <select id="teachersubject">
        <option value="">--Select Teacher Name--</option>
    </select>	
									</div>
									<div class="mb-3">
									
                            
                               Select Class Name: &nbsp;&nbsp;&nbsp;<select name="cername" id="cername">
                                    <option disabled="disabled" selected="selected">PLEASE SELECT CLASS *</option>
                                    <option>NURSERY</option>
                                    <option>UKG</option>
                                    <option>LKG</option>
                                    <option>Class 1</option>
                                    <option>Class 2</option>
                                    <option>Class 3</option>
                                    <option>Class 4</option>
                                    <option>Class 5</option>
                                    <option>Class 6</option>
                                    <option>Class 7</option>
                                    <option>Class 8</option>
                                    <option>Class 9</option>
                                    <option>Class 10</option>
                                    <option>Class 11</option>
                                    <option>Class 12</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                       
							<div class="input-group">
							 <label for="Please Subject Name: " >Please Subject Name:  </label>
                                <select name="subjectname" id="subjectname">
                                    <option>Please Select Subject Name *</option>
                                    <option>Hindi</option>
                                    <option>English</option>
                                    <option>Maths</option>
                                    <option>Computer</option>
                                    <option>Science</option>
                                     <option>Social Science</option>
                                    <option>Environment</option>
                                   
                                </select>
                           
                           </div>
                        
                       
                       
						</div>
							</div>
					<div class="col-md-2">
						<div class="mt-2">
						<label for="but" class="form-label"></label>
							<button type="button" id="submitbtn" class="btn btn-outline-primary btn-secondary text-white" style="width: 100%">Submit</button>
						</div>
					</div>


						 						<div>
				
							</div>
					</div>
					
			
				
	</main>
	
	<script type="text/javascript">

$('#submitbtn').click(function(){
	
	
	var teacherid = $("#teachersubject option:selected").val();
   // var username = $("#teachersubject option:selected").val();  
    var classname = $("#cername option:selected").val();
    alert(classname);
var sname = $('#subjectname').val();
	
	
	$.ajax({
		
		type:"POST",
		url:"subjectnameallocate",
		data:{'teacherid1':teacherid,'sname1':sname,'classname1':classname},
		success:function(data)
		{
			alert("Recored Successfully");
		},
		error:function(data)
		{
			alert("ajax error");
		}
	});
	
	
});

</script>

<script type="text/javascript">

$(document).ready(function(){
	 
	   
	   $.ajax({
		  
		   type:"GET",
		   url:"getTeacherName",
	   
	   success:function(data)
	   {
		   var $select = $('#teachersubject');
           $select.empty();
           $select.append('<option value="">--Select Teacher Name--</option>'); 
           $.each(data, function(index, name) {
               $select.append('<option value="' + name + '">' + name + '</option>');
           });
		  
		  },
	   error:function(data)
	   {
		   alert("error ajax")
	   }
		   
	   });
	 
	
	
});

</script>
	

	<script type="text/javascript">
  

    
    </script>

	<script
		src="https://cdn.datatables.net/buttons/2.0.1/js/dataTables.buttons.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.bootstrap5.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.html5.min.js"></script>

	

<script type="text/javascript">

function getQueryParam(name) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(name);
}



$(document).ready(function(){
	// $("#txt1").val("msg Good ");
	//$("#txt2").text(msg);
	 
	 var emailId = getQueryParam('email');
	 var logintype = getQueryParam('logintype');
	  // alert(decodeURIComponent(emailId));
	var  decodedLogintype = decodeURIComponent(logintype);
	  
	  alert(decodedLogintype);
	   $("#txt2").text(emailId);
	   
	   $.ajax({
		  
		   type:"POST",
		   url:"getDetailbyemialid?email="+emailId+"&logintype="+decodedLogintype,
	   
	   success:function(data)
	   {
		   $("#txt3").text(data);
		   
		   
	   },
	   error:function(data)
	   {
		   alert("error ajax")
	   }
		   
	   });
	 
	
	
});

</script>
	

	<script type="text/javascript">
  

    
    </script>

	<script
		src="https://cdn.datatables.net/buttons/2.0.1/js/dataTables.buttons.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.bootstrap5.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.html5.min.js"></script>

</body>
</html>