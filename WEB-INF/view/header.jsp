<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"  %>
<%@ page language="java" import="java.util.*" %> 
<%@ page import = "java.util.ResourceBundle" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.core.Authentication" %>

<% Authentication auth = SecurityContextHolder.getContext().getAuthentication(); %>
<% Registration registration = (Registration)auth.getPrincipal(); %>
<% 
ResourceBundle resource = ResourceBundle.getBundle("commonsutils");
String timoIconPath =resource.getString("timoIconPath");
String timoptimoScriptPath =resource.getString("timoScriptPath");

String fileName="user.png";
if(registration.getPhoto() != null) 
	{
		fileName = registration.getPhoto();
	}
String email=registration.getEmail();
String picPath = "images/profile/"+fileName;
String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>

<!DOCTYPE html>
<html manifest="ie11WebSite.appcache">
<head>
<meta name="description" content="Integrate DrySign with your existing business software through API and empower your team to sign documents digitally! Request for an API key here. Unlock the power of DrySign with scalable plans suitable for businesses of all sizes!  Want to try DrySign? Register for our 15-day free trial!"/>
<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="<%=appUrl %>/images/fav-icon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge;" />-->
<title>${title} | DrySign</title>

<link rel="apple-touch-icon" sizes="57x57" href="<%=appUrl %>/images/fav-icon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="<%=appUrl %>/images/fav-icon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="<%=appUrl %>/images/fav-icon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="<%=appUrl %>/images/fav-icon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="<%=appUrl %>/images/fav-icon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="<%=appUrl %>/images/fav-icon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="<%=appUrl %>/images/fav-icon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="<%=appUrl %>/images/fav-icon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="<%=appUrl %>/images/fav-icon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="<%=appUrl %>/images/fav-icon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="<%=appUrl %>/images/fav-icon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="<%=appUrl %>/images/fav-icon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="<%=appUrl %>/images/fav-icon/favicon-16x16.png">
<link rel="manifest" href="<%=appUrl %>/images/fav-icon/manifest.json">

<%-- <link rel="stylesheet" href="<%=appUrl %>/css/responsive.bootstrap.css"> --%>

<link rel="stylesheet" href="<%=appUrl %>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=appUrl %>/css/fontAwesome4-4-0.css">
<%-- <link href="<%=appUrl %>/css/robotoFont.css" rel="stylesheet"> --%>
<%-- <link rel="stylesheet" type="text/css" href="<%=appUrl %>/css/loading.css"/> --%>
<link rel="stylesheet" type="text/css" href="<%=appUrl %>/css/loading.min.css"/>
<%-- <link rel="stylesheet" type="text/css" href="<%=appUrl %>/css/loading-btn.css"/>
<link href="<%=appUrl %>/css/fileinput.css" media="all" rel="stylesheet" type="text/css" /> --%>
<!-- custom style -->
<link rel="stylesheet" type="text/css" href="<%=appUrl %>/css/all_in_one.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=appUrl %>/css/responsive.bootstrap_.css">
<%-- <link rel="stylesheet" href="<%=appUrl %>/css/fonts_icon.css"> --%>
 <link rel="stylesheet" href="<%=appUrl %>/css/jquery-confirm.css">
<link rel="stylesheet" href="<%=appUrl %>/css/inner_page.css"/>
 <link rel="stylesheet" href="<%=appUrl %>/css/style.css"/> 
<%-- <link rel="stylesheet" href="<%=appUrl %>/css/style.min.css"/> --%>
 <%-- <link rel="stylesheet" href="<%=appUrl %>/css/exela_theme.min.css"/> --%>
<%-- <link rel="stylesheet" href="<%=appUrl %>/css/exela_theme.css"/>  --%>
<link rel="stylesheet" type="text/css" href="<%=appUrl %>/css/jquery.dataTables.min.css">
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<%-- <script type="text/javascript" src="<%=appUrl %>/js/jquery.dataTables.min.js"></script> --%> 
<script src="<%=appUrl %>/js/jquery-3.1.1.min.js"></script>
<!--  Timo integration -->
	
 <script src="<%=timoptimoScriptPath%>"></script> 
</head>
<style>
@media (max-width: 400px){
.modal .modal-content {
    padding: 10px 10px !important;
}
}
html,body
{
    overflow-x: hidden; 
}
.fa-question-circle{
color:#fff !important;
font-size:18px !important;
}
.main-sidebar{
background:rgba(29,122,180,1);
 opacity:1 !important;
 display:inline-block;
 z-index:1000 !important;
}
.infoView .fa-info-circle{
			font-size:22px;
			    margin-top: 11px;
		}
		/* Removes the default 20px margin and creates some padding space for the indicators and controls */
		.carousel {
			margin-bottom: 0;
			padding: 0 40px 30px 40px;
		}
		/* Reposition the controls slightly */
		.carousel-control {
			left: -12px;
		}
		.carousel-control.right {
			right: -12px;
		}
		#stepsModal .modal-header .close {
		    margin-top: 0px !important;
    font-size: 50px;
    margin-right: 0px !important;
		}
		/* Changes the position of the indicators */
		.carousel-indicators {
			right: 50%;
			top: auto;
			bottom: 0px;
			margin-right: -19px;
		}
		/* Changes the colour of the indicators */
		.carousel-indicators li {
			background: #c0c0c0;
		}
		.carousel-indicators .active {
			background: #333333;
		}
		
		#stepsModal .modal-header{
			padding: 0;
		}
		#stepsModal .modal-body{
			padding:0px 25px;
		}
		#stepsModal .modal-body .tab-content{
			padding:10px 0px;
		}
		#stepsModal .modal-title{
			float: left;
			font-size: 17px;
		}
		#stepsModal .close{
			font-size:30px;
		}
		#stepsModal .nav-tabs{
			border-bottom: 2px solid #ddd;
		}
		
		#stepsModal .nav-tabs>li.active>a, #stepsModal .nav-tabs>li.active>a:focus, #stepsModal .nav-tabs>li.active>a:hover{
			border-bottom: 2px solid #1d7ab4;
			border-top:none;
			border-left:none;
			border-right:none;
			color: #1d7ab4;
		}
		#stepsModal .nav-tabs>li>a{
			color: #000;
			padding:5px;			
		}
		
		#stepsModal .carousel-control{
			width:5%;
			<!-- left:0px; -->
		}
		
		#stepsModal .carousel-control.right{
			    right: 14px;
		}
		
		.carousel-control.right, .carousel-control.left{
			background-image:none;
		
		}
		
		.upload-btn-wrapper {
			position: relative;
			overflow: hidden;
			display: block;
			padding: 10px 0px;
		}
		
		.upload-btn-wrapper .btn {
			margin: 0px 0px;
			border-radius: 3px;
		}		
		
		.btn-secondary {
			background-color: #C75000;
			color: #fff !important;
			border: 2px solid #C75000 !important;
			
			border-radius: 5px;
			padding: 10px 15px !important;
			
		}

		.upload-btn-wrapper input[type=file] {
			font-size: 30px;
			position: absolute;
			left: 0;
			top: 10px;
			opacity: 0;
			cursor: pointer;
		}
		.welcomeNote{
			text-align: center;
            font-size: 23px
		}
		.welcome-section{
			        display: grid;
    background: #fff;
    padding: 10px;
    box-shadow: 0px 0px 3px 0px #d4d4d4;
    overflow: hidden;
		}
		.welcome-section img{
			display: block;
			margin-left: auto;
			margin-right: auto;		
		}
		#slefCarousel .carousel-control .fa-chevron-circle-left, 
		#slefCarousel .carousel-control .fa-chevron-circle-right, 
		#slefCarousel_e .carousel-control .fa-chevron-circle-left, 
		#slefCarousel_e .carousel-control .fa-chevron-circle-right, 
		#groupCarousel .carousel-control .fa-chevron-circle-left, 
		#groupCarousel .carousel-control .fa-chevron-circle-right,
		#groupCarousel_e .carousel-control .fa-chevron-circle-left, 
		#groupCarousel_e .carousel-control .fa-chevron-circle-right,
		#templateCarousel .carousel-control .fa-chevron-circle-left,
		#templateCarousel .carousel-control .fa-chevron-circle-right
		{
			position: absolute;
			top: 50%;
			z-index: 5;
			display: inline-block;
			font-size: 30px;
			color: #666;
		}
		
		#stepsModal .thumbnail{
			border:none;
		}
		.carousel {
    
    height: auto;}
    
    
    
    .tooltip1 {
  position: relative;
  display: inline-block;
  
}

.tooltip1 .tooltiptext {
      visibility: hidden;
    position: absolute;
    width: 120px;
    background-color: #555;
    color: #fff;
    text-align: center;
    padding: 5px 0;
    border-radius: 6px;
    z-index: 1;
    opacity: 0;
    transition: opacity 0.3s;
        line-height: 100% !important;
}

.tooltip1 .tooltiptext::after {
 content: "";
    position: absolute;
    bottom: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: transparent transparent #000 transparent;
}
.tooltip-bottom {
   top: 100%;
    left:45%;
  margin-left: -59px;
}
@media (max-width:991px){
.tooltip-bottom {
   top: 100%;
    left: 57%;
margin-left: -45px;
}
}
@media (max-width:678px){
.tooltip-bottom {
   top: 100%;
    left: 55%;
      margin-left: -59px;
}
}

.tooltip1:hover .tooltiptext {
  visibility: visible;
  opacity: 1;
}
    
	</style> 

<body class="hold-transition skin-blue sidebar-mini">
<input type="hidden" id="contextPath" value="<%=appUrl %>/"/>
<input type="hidden" id="fullName" value="<c:out value="${fulnme}"></c:out>" />
<input type="hidden" id="firstName" value="<c:out value="${fristName}"></c:out>" />



<div class="wrapper"> 
  <!-- Main Header -->
  <header class="main-header"> 
    
    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation"> 
    
      <!-- Sidebar toggle button--> 
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"> <span class="sr-only"><spring:message code="label.toggle_nav"/></span> </a> 
      <!-- Logo --> 
    <a href="<%=appUrl %>/app/dashboard" class="logo"> 
    <!-- mini logo for sidebar mini 50x50 pixels --> 
  <%--   <span class="logo-mini"><img style="height: 47px;" cllogass="img-responsive" src="<%=appUrl %>/images/drysignlogo_mob.png"  alt="logo"></span>  --%>
    <!-- logo for regular state and mobile devices --> 
    <span class="logo-lg hidden-xs"><img class="img-responsive" src="<%=appUrl %>/images/drysignlogo.png" height="auto"  alt="logo"> </span>
      <span class="logo-lg visible-xs"><img  class="img-responsive" src="<%=appUrl %>/images/1.0/logo1.png" height="auto"  alt="logo"> </span> </a> 
     <!-- <a href="#" class="sidebar-toggle"  role="button"> <span class="sr-only">Toggle navigation</span> </a>  -->
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
         <!-- <li class="m-view"><i class="icon1-phone callnumber"></i><span class="Tel-No">+1-770-776-2509</span></li>
           <li class="m-view"><button class="btn btn-buy" onclick="location.href = '../pricing';">BUY NOW</button></li>
 -->          <li class="m-view">
            <!-- <button type="submit" value="Upgrade" class="btn btn btn_2">Upgrade</button> -->
          </li>
          <li class="timo">
          <!-- Timo integration -->
				<div id="timointegratation">
					<input type="image" src="<%=timoIconPath%>" alt="Need Help?" class="open-button">
						<div class="form-popup" id="masterDiv"></div>
						<input id="productName" value="DrySign" type="hidden"/>
						<input id="userName" value="<c:out value="${fulnme}"></c:out>"  type="hidden"/>
						<input id="userEmail" value= <c:out value="<%=email%>" ></c:out> type="hidden"/>
					<div id="overlay"></div>
				</div>
				<!-- Timo integration -->
          </li>
          
     <li class="m-view infoView tooltip1">
							<i class="fa fa-info-circle" aria-hidden="true" data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#stepsModal" id="viewinfo" ></i>
							<span class="tooltiptext tooltip-bottom"><spring:message code="label.info"/></span>
						</li>
          <li class="m-view user" id="hideInDevice"> 
            <!-- Inner Menu: contains the notifications -->
            <ul class="menu">
              <li> 
                <!-- Sidebar user panel (optional)-->
                <div class="user-panel">
                  <div class="pull-left image">
                  <img id="imgHeader" src="<c:out value="${mypic}"/>" class="img-circle" alt="" height="100px" width="200px">
                  <%--  <img src="<%=appUrl %>/images/user.png" class="img-circle" alt="User Image" height="100px" width="200px"> --%>
                   </div>
                  <div class="pull-left info">
                    <p id="profileName"><c:out value="${fulnme}"></c:out> </p>
                    <!-- Status --> 
                  </div>
                </div>
              </li>
              <!-- end notification -->
            </ul>
          </li>
          <li class="dropdown header_Dropdown"> 
            <!-- Menu toggle button --> 
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"> <i class="fa fa-ellipsis-v" aria-hidden="true"></i></a>
            <ul class="dropdown-menu" id="drpdwn">
              <li><a href="<%=appUrl %>/app/profile"><spring:message code="label.head_profile"/></a></li>
<%--               <li><a href="<%=appUrl %>/app/changePasword">Password</a></li>
              <li><a href="<%=appUrl %>/app/settings">Settings</a></li> --%>
               <li><a href="#" class="" data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#myLougoutModal"><spring:message code="label.logout"/></a></li> 
          <!-- <li>  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myLougoutModal">Open Modal</button></li>-->
              <li class="bottom"></li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar"> 
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar"> 
      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" id="headernavigation">
        <li id="dashboardSidebar"><a href="<%=appUrl %>/app/dashboard"><i class="icon-dashboard"></i><span><spring:message code="label.dash"/></span></a></li>
        <li id="templateSidebar"><a href="<%=appUrl %>/app/templateview"><i class="icon"><img src="<%=appUrl %>/images/templates.svg"/></i><span class="alignSidebar"><spring:message code="label.template"/></span></a></li>
        <li id="myStorageSidebar"><a href="<%=appUrl %>/app/myfiles"><i class="icon"><img src="<%=appUrl %>/images/files.png"/></i><span><spring:message code="label.storage"/></span></a></li>
        <li id="helpSidebar"><a href="<%=appUrl %>/app/helpVideo"><i class="fa fa-question-circle" aria-hidden="true"></i><span class="alignSidebar"><spring:message code="label.help"/></span></a></li>
      </ul>
      <!-- /.sidebar-menu --> 
    </section>
    <!-- /.sidebar --> 
  </aside>
 	<!-- Information pop-up code -->
<div class="modal fade" id="stepsModal" tabindex="-1" role="dialog" aria-labelledby="stepsModal" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" id="centeralignModel" role="document">
			<div class="modal-content">
				<div class="modal-header" style="padding-left: 0xp">
					<span class="modal-title"><spring:message code="label.itworks"/></span>
			<!-- 	<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="stepmodalclose"> -->
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="stepmodalclose" onclick="reset()" >
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
					<ul class="nav nav-tabs">
						<li class="active" id="selfsign"><a data-toggle="tab" href="#menu0"><spring:message code="label.selfsign"/></a></li>
						<li id="groupsign"><a data-toggle="tab" href="#menu1"><spring:message code="label.grp_sgn"/></a></li>						
						<li id="selfsign_emudhra"><a data-toggle="tab" href="#menu3"><spring:message code="label.selfsign"/></a></li>	
						<li id="groupsign_emudhra"><a data-toggle="tab" href="#menu4"><spring:message code="label.grp_sgn"/></a></li>
						<li id="template"><a data-toggle="tab" href="#menu2"><spring:message code="label.template"/></a></li>						
					</ul>
					
					<div class="tab-content">
						<div id="menu0" class="tab-pane fade in active">
							
							<div id="slefCarousel" class="carousel slide" data-ride="carousel">
                 
								<ol class="carousel-indicators">
									<li data-target="#slefCarousel" data-slide-to="0" class="active"></li>
									<li data-target="#slefCarousel" data-slide-to="1"></li>
									<li data-target="#slefCarousel" data-slide-to="2"></li>
									<li data-target="#slefCarousel" data-slide-to="4"></li>
									<li data-target="#slefCarousel" data-slide-to="3"></li>
									<li data-target="#slefCarousel" data-slide-to="5"></li>
									<li data-target="#slefCarousel" data-slide-to="6"></li>
									
								</ol>
                 
								<!-- Carousel items -->
								<div class="carousel-inner">
									
									<div class="item active">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/self-sign/self-sign-step-1.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
                 
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/self-sign/self-sign-step-2.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
							 
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/self-sign/self-sign-step-3.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/self-sign/self-sign-step-4.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/self-sign/self-sign-step-5.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/self-sign/self-sign-step-6.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/self-sign/self-sign-step-7.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
                 
								</div><!--/carousel-inner-->
								
								<a class="left carousel-control" href="#slefCarousel" data-slide="prev">
									
									<span class="fa fa-chevron-circle-left"></span>
									<span class="sr-only"><spring:message code="label.previous"/></span>
								</a>
								<a class="right carousel-control" href="#slefCarousel" data-slide="next">
									<span class="fa fa-chevron-circle-right"></span>									
									<span class="sr-only"><spring:message code="label.next"/></span>
								</a>													 
							
							</div><!--/slefCarousel-->
							
						</div>
						
						<div id="menu1" class="tab-pane fade">

							<div id="groupCarousel" class="carousel slide" data-ride="carousel">
                 
								<ol class="carousel-indicators">
									<li data-target="#groupCarousel" data-slide-to="0" class="active"></li>
									<li data-target="#groupCarousel" data-slide-to="1"></li>
									<li data-target="#groupCarousel" data-slide-to="2"></li>
									<li data-target="#groupCarousel" data-slide-to="3"></li>
									<li data-target="#groupCarousel" data-slide-to="4"></li>
									<li data-target="#groupCarousel" data-slide-to="5"></li>
									<li data-target="#groupCarousel" data-slide-to="6"></li>
									<li data-target="#groupCarousel" data-slide-to="7"></li>
									<li data-target="#groupCarousel" data-slide-to="8"></li>
									
								</ol>
                 
								<!-- Carousel items -->
								<div class="carousel-inner">
									
									<div class="item active">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/group-sign/group-sign-step-1.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
                 
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/group-sign/group-sign-step-2.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
							 
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/group-sign/group-sign-step-3.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/group-sign/group-sign-step-4.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/group-sign/group-sign-step-5.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/group-sign/group-sign-step-6.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/group-sign/group-sign-step-7.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/group-sign/group-sign-step-8.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/group-sign/group-sign-step-9.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
                 
								</div><!--/carousel-inner-->
								 
								<a class="left carousel-control" href="#groupCarousel" data-slide="prev">
									<span class="fa fa-chevron-circle-left"></span>
									<span class="sr-only"><spring:message code="label.previous"/></span>
								</a>
								<a class="right carousel-control" href="#groupCarousel" data-slide="next">
									<span class="fa fa-chevron-circle-right"></span>
									<span class="sr-only"><spring:message code="label.next"/></span>
								</a>
  
							</div><!--/groupCarousel-->
						</div>  

						
						
						<div id="menu3" class="tab-pane fade in active">
							
							<!-- Emudhra -->
							
							<div id="slefCarousel_e" class="carousel slide" data-ride="carousel">
                 
								<ol class="carousel-indicators">
									<li data-target="#slefCarousel_e" data-slide-to="0" class="active"></li>
									<li data-target="#slefCarousel_e" data-slide-to="1"></li>
									<li data-target="#slefCarousel_e" data-slide-to="2"></li>
									<li data-target="#slefCarousel_e" data-slide-to="3"></li>
									<li data-target="#slefCarousel_e" data-slide-to="4"></li>
									<li data-target="#slefCarousel_e" data-slide-to="5"></li>
									<li data-target="#slefCarousel_e" data-slide-to="6"></li>
									<li data-target="#slefCarousel_e" data-slide-to="7"></li>
									<li data-target="#slefCarousel_e" data-slide-to="8"></li>
									<li data-target="#slefCarousel_e" data-slide-to="9"></li>
								</ol>
                 
								
								<div class="carousel-inner">
									
									<div class="item active">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/self-sign/emudhra_sign_1.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
                 
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/self-sign/emudhra_sign_2.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
							 
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/self-sign/emudhra_sign_3.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/self-sign/emudhra_sign_4.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/self-sign/emudhra_sign_5.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>\images\slider-image\e-mudhra\self-sign\emudhra_sign_6.png" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>\images\slider-image\e-mudhra\self-sign\emudhra_sign_7.png" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/self-sign/emudhra_sign_8.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/self-sign/emudhra_sign_9.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
                 
								</div>
								
								<a class="left carousel-control" href="#slefCarousel_e" data-slide="prev">
									
									<span class="fa fa-chevron-circle-left"></span>
									<span class="sr-only"><spring:message code="label.previous"/></span>
								</a>
								<a class="right carousel-control" href="#slefCarousel_e" data-slide="next">
									<span class="fa fa-chevron-circle-right"></span>									
									<span class="sr-only"><spring:message code="label.next"/></span>
								</a>													 
							
							</div>
							
						</div>
						
						
						<div id="menu4" class="tab-pane fade">

							<div id="groupCarousel_e" class="carousel slide" data-ride="carousel">
                 
								<ol class="carousel-indicators">
									<li data-target="#groupCarousel_e" data-slide-to="0" class="active"></li>
									<li data-target="#groupCarousel_e" data-slide-to="1"></li>
									<li data-target="#groupCarousel_e" data-slide-to="2"></li>
									<li data-target="#groupCarousel_e" data-slide-to="3"></li>
									<li data-target="#groupCarousel_e" data-slide-to="4"></li>
									<li data-target="#groupCarousel_e" data-slide-to="5"></li>
									<li data-target="#groupCarousel_e" data-slide-to="6"></li>
									<li data-target="#groupCarousel_e" data-slide-to="7"></li>
									<li data-target="#groupCarousel_e" data-slide-to="8"></li>
									<li data-target="#groupCarousel_e" data-slide-to="9"></li>
									<li data-target="#groupCarousel_e" data-slide-to="10"></li>
									<li data-target="#groupCarousel_e" data-slide-to="11"></li>
									<li data-target="#groupCarousel_e" data-slide-to="12"></li>
									<li data-target="#groupCarousel_e" data-slide-to="13"></li>
									<li data-target="#groupCarousel_e" data-slide-to="14"></li>
									
								</ol>
								<div class="carousel-inner">
									
									<div class="item active">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/group-sign/Em_group-sign-step-1.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
                 
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/group-sign/Em_group-sign-step-2.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
							 
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/group-sign/Em_group-sign-step-3.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/group-sign/Em_group-sign-step-4.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/group-sign/Em_group-sign-step-5.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/group-sign/Em_group-sign-step-6.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/group-sign/Em_group-sign-step-7.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/group-sign/Em_group-sign-step-8.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/group-sign/Em_group-sign-step-9.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/group-sign/Em_group-sign-step-10.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/group-sign/Em_group-sign-step-11.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/group-sign/Em_group-sign-step-12.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/group-sign/Em_group-sign-step-13.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/e-mudhra/group-sign/Em_group-sign-step-14.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
                 
								</div><!--/carousel-inner-->
								
								
								 
								<a class="left carousel-control" href="#groupCarousel_e" data-slide="prev">
									<span class="fa fa-chevron-circle-left"></span>
									<span class="sr-only"><spring:message code="label.previous"/></span>
								</a>
								<a class="right carousel-control" href="#groupCarousel_e" data-slide="next">
									<span class="fa fa-chevron-circle-right"></span>
									<span class="sr-only"><spring:message code="label.next"/></span>
								</a>
  
							</div><!--/groupCarousel-->
					</div> 
					
					
						<div id="menu2" class="tab-pane fade">

							<div id="templateCarousel" class="carousel slide" data-ride="carousel">
                 
								<ol class="carousel-indicators">
									<li data-target="#templateCarousel" data-slide-to="0" class="active"></li>
									<li data-target="#templateCarousel" data-slide-to="1"></li>
									<li data-target="#templateCarousel" data-slide-to="2"></li>
									<li data-target="#templateCarousel" data-slide-to="3"></li>
									<li data-target="#templateCarousel" data-slide-to="4"></li>
									<li data-target="#templateCarousel" data-slide-to="5"></li>
									<li data-target="#templateCarousel" data-slide-to="6"></li>
									<!-- <li data-target="#templateCarousel" data-slide-to="7"></li> -->
									
									
								</ol>
                 
								<!-- Carousel items -->
								<div class="carousel-inner">
									
									<div class="item active">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/template/template-step-1.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
                 
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/template/template-step-2.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
							 
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/template/template-step-3.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/template/template-step-4.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/template/template-step-5.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/template/template-step-6.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									<div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/template/template-step-7.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item-->
									<%-- <div class="item">
										<div class="row-fluid">
											<div class="span3"><a href="#x" class="thumbnail"><img src="<%=appUrl %>/images/slider-image/template/template-step-8.jpg" alt="Image" style="max-width:100%;" /></a></div>
											
										</div><!--/row-fluid-->
									</div><!--/item--> --%>
									
                 
								</div><!--/carousel-inner-->
								 
								<a class="left carousel-control" href="#templateCarousel" data-slide="prev">
									<span class="fa fa-chevron-circle-left"></span>
									<span class="sr-only"><spring:message code="label.previous"/></span>
								</a>
								<a class="right carousel-control" href="#templateCarousel" data-slide="next">
									<span class="fa fa-chevron-circle-right"></span>
									<span class="sr-only"><spring:message code="label.next"/></span>
								</a>
  
							</div><!--/templateCarousel-->
						</div>
					
					</div> 
					</div>
				</div>
				<!-- <div class="modal-footer"> -->
					<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
					<!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
				<!-- </div> -->
			</div>	
		</div>
	</div>
</div>

	
  <script>
 
  $('a').on('click touchend', function(e) {
	    var el = $(this);
	    var link = el.attr('href');
	    window.location = link;
	});

  var mypic="<c:out value="${mypic}"></c:out>";
  
  $(document).ready(function() {
	  if(mypic==''){
			$("#imgHeader").attr('src','<%=appUrl %>/images/user.png');
		}
	  
  /*$('#slefCarousel').carousel({
		interval: 500
	})
	$('#groupCarousel').carousel({
		interval: 500
	})*/
	
		$("#menu0").load(" #menu0 > *");
		 $("#menu1").load(" #menu1 > *");
		 $("#menu2").load(" #menu2 > *");
		 $("#menu3").load(" #menu3 > *");
		 $("#menu4").load(" #menu4 > *");
		$("#selfsign").click(function() {
			 $("#menu0").load(" #menu0 > *");	 
		});
		$("#groupsign").click(function() {	
			 $("#menu1").load(" #menu1 > *");
		});
		$("#template").click(function() {
			 $("#menu2").load(" #menu2 > *");
		});
		$("#selfsign_emudhra").click(function() {
			 $("#menu3").load(" #menu3 > *");
		});
		$("#groupsign_emudhra").click(function() {
			 $("#menu4").load(" #menu4 > *");
		});
	 $('.reset').on('hidden.bs.modal', function () {

		 $('#stepsModal').load(" #stepsModal > *");
		 $("#templateCarousel").tabs('select',1);
		 $("#menu0").load(" #menu0 > *");
		 $("#menu1").load(" #menu1 > *");
		 $("#menu2").load(" #menu2 > *");
		 $("#menu3").load(" #menu3 > *");
		 $("#menu4").load(" #menu4 > *");
	    });
		
	
  });

  if('${countryCode}' == 'IN')
  {
	  $('#menu0').removeClass('active');
	  $('#menu0').hide(); 
$("#selfsign").hide();
 $("#groupsign").hide();
  $("#selfsign_emudhra").show();
  $("#groupsign_emudhra").show();
  $("#template").show();
  }
else{
	$('#menu3').removeClass('active');
	  $('#menu3').hide(); 
	 $("#selfsign").show();
	 $("#groupsign").show();
	  $("#template").show();
	  $("#selfsign_emudhra").hide();
	  $("#groupsign_emudhra").hide();
}


</script>