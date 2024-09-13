<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Teacher Home</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/Resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/Resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/Resources/css/dataTables.bootstrap5.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css">

<style type="text/css">
.dropdown-menu {
	position: relative ! important;
	transform: translate(0px, 0px) ! important;
}

.search {
	color: #000 ! important;;
	background: #fff ! important;;
}

.search:hover {
	color: #fff ! important;
	background: #808080 ! important;
}

.search.active {
	color: #fff ! important;
	background: #808080 ! important;
}
</style>
                   

</head>

<body>


	<header class="shadow">

		<div class="row">
			<div class="col-4">
				<a href="#"> <img
					src="${pageContext.request.contextPath}/Resources/images/logo08.jpg"
					alt="" class="logo01" />
				</a>
			</div>
			<div class="col-4">
				<div class="header_text">
									
				</div>
			</div>
			<div class="col-3">
				<a href="#"> 
				<img src="${pageContext.request.contextPath}/Resources/images/logo03.svg" alt="logo img" class="logo02" />
				</a>
			</div>
			<div class="col-1 dropdown ">
				<div class="responsive_icon">
					<div class="responsive_width">
						<button
							class="navbar-toggler position-absolute d-md-none collapsed"
							type="button" data-bs-toggle="collapse"
							data-bs-target="#sidebarMenu" aria-controls="sidebarMenu"
							aria-expanded="false" aria-label="Toggle navigation">
							<i class="fa fa-bars"></i>
						</button>
					</div>
					<div class="responsive_width">
						<a class=" dropbtn app-nav__item" href="#"
							data-bs-toggle="dropdown" aria-expanded="false"> <i
							class="fa fa-user fa-lg user_icon"></i></a>
						<ul
							class="dropdown-menu settings-menu dropdown-menu-right dropdown-content logout_icon"
							id="myDropdown">
							<li><a class="dropdown-item" href="/logout"><i
									class="fa fa-sign-out fa-lg"></i> Logout</a></li>
						</ul>
						
					</div>
                   
				</div>
			</div>
		</div>

	</header>
	
	 
	<div class="container-fluid">
	
		<div class="row">  
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse shadow scroll">
				<div class="position-sticky pt-2">
					<ul class="nav flex-column">
					
					      
					 
						
                                
							<!-- <li class="nav-item"><a class="nav-link search"
								aria-current="page" target="_blanck" href="SearchComplains">
									<i class="fa fa-search"></i>&nbsp 
									Search Detail
							</a> </li>
					
                     -->   
						<%-- <c:if
							test="${userTypeId == 13 || userTypeId == 14 || userTypeId == 10 || userTypeId == 9 || userTypeId == 15}">
							<li class="nav-item"><a class="nav-link" aria-current="page"
								href="StockDashboard"> <i class="fa fa-dashboard"></i>&nbsp
									Weighing Scale Dashboard
							</a></li>
						</c:if>
 --%>                      
						<%-- <c:if
							test="${userTypeId != 13  && userTypeId != 12 && userTypeId != 14 && userTypeId != 15}"> --%>
							
								<li class="nav-item"><a class="nav-link"
									aria-current="page" href="Dashboard"><i
										class="fa fa-dashboard"></i>&nbsp Dashboard </a></li>
								<c:if test="${userTypeId == 3}">
									<li class="nav-item"><a class="nav-link"
										href="ComplentUserCall"> <i class="fa fa-phone"></i>&nbsp
											New Calls
									</a></li>
								</c:if>
							
								
								
									<li class="nav-item"><a
										href="teacherafterlogin"> <i class="fa-solid fa-school"></i>
											Attendence
									</a></li>
									<li class="nav-item"><a
										href="teacherafterlogin"> <i class="fa-solid fa-school"></i>
											Fees
									</a></li>
									<li class="nav-item"><a
										href="teacherafterlogin"> <i class="fa-solid fa-school"></i>
											Certificates</a></li>
											
											<li class="nav-item"><a
										href="teacherafterlogin"> <i class="fa-solid fa-school"></i>
											Allocated Subjects</a></li>						
					</ul>   
					
					
				</div>
			</nav>
			<!-- main data-->


		</div>
	</div>
	<script src="${pageContext.request.contextPath}/Resources/js/jquery.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript">
        $(document).ready(function() {

        	$("#SERmarkDateStr").datepicker({
                dateFormat: 'yy-mm-dd'
            });
            
        });
    </script>


	<script>
        $(function () {
            var url = window.location;
            const allLinks = document.querySelectorAll('.nav-item .nav-link');
            const currentLink = [...allLinks].filter(e => {
                return e.href == url;
            });          
            if (currentLink.length > 0) { //this filter because some links are not from menu
                currentLink[0].classList.add("active");                            
                //currentLink[0].closest(".has-treeview").classList.add("active");
            }   
                var url2 = window.location;
                const allLinks2 = document.querySelectorAll('.nav-item.dropdown a');
                const currentLink2= [...allLinks2].filter(e => {
                    return e.href == url2;
                });            
                if (currentLink2.length > 0) { //this filter because some links are not from menu
                    currentLink2[0].closest(".dropdown").classList.add("nav-item-open");   
                    currentLink2[0].classList.add("active");                    
                    currentLink2[0].closest(".dropdown-menu").style.display = "block";
                } 
            }); 
    </script>

	<script>
     $(document).ready(function () {		
     $("li").click(function () {
        //Toggle the child but don't include them in the hide selector using .not()
        $('li > ul').not($(this).children("ul").toggle()).hide();

    }); 
});
     </script>



	<script
		src="${pageContext.request.contextPath}/Resources/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/Resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/Resources/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/Resources/js/dataTables.bootstrap5.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/Resources/js/fusioncharts.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/Resources/js/fusioncharts.theme.fusion.js"></script>
	<!-- <script>
        $(document).ready(function() {
            $('#custListTable').DataTable();
        });
    </script> -->



</body>

</html>

