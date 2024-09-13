

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
			<h2>Welcome   <label id="txt3"></label></h2>
			<div class="col-md-2">
				
								 <label id="txt2">This is a message</label>
								
						</div>
						 <a href="/logout">Logout</a>
				
			<hr />

			
				<div class="row">
							</div>
					</div>
					<!-- <div class="col-md-2">
						<div class="mt-2">
						<label for="but" class="form-label"></label>
							<button type="button" id="but" class="btn btn-outline-primary btn-secondary text-white" style="width: 100%" onclick="getCompailentDetailsbyDistrict()">Search</button>
						</div>
					</div>
 -->
<!-- 					<div class="col-md-2">
						<div class="mt-2">
						<label for="but" class="form-label"></label>
							<button type="button" id="but1" class="btn btn-outline-primary btn-secondary text-white" style="width: 100%" onclick="viewComplaints(0,0)">View All Complains</button>
									
			<!-- <h6 id="totalCompH" style="text-align: center; color: blue;">Total Complains: </h6> -->
			
			<div class="data_table table-responsive">
			<div class="ajax-loader">
			  <img src="${pageContext.request.contextPath}Resources1/images/ajax-loader.gif" class="img-responsive" />
			</div>
				<!-- <table id="custListTable"
					class="table table-striped table-hover table-bordered table-sm table-responsive mt-3">
					<thead>

						<tr>
							<th class="no-sort">Sr. No.</th>
							<th>District Name</th>
							<th>Total Complaints</th>
							<th>Resolved Complaints</th>
							<th>Pending Complaints</th>
							<th>Total SLA-2 Days</th>
							<th>Penalty</th>
						</tr>
					</thead>
					
				</table>


 -->			

	</main>

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
  
	$(document).ready(function(){

		$.ajax({
			
			type:"POST",
			url:"DashboardLogin",
			success:function(data)
			{
				
				if(data=="")
					{
					
					window.location.href = "login";
					}
				
			},
			error:function(data)
			{
				
				alert("ajax error generated");
			}
		});
	});

    
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