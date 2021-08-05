<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.authentication.AnonymousAuthenticationToken,org.springframework.security.core.Authentication" %>

<% Authentication auth = SecurityContextHolder.getContext().getAuthentication(); %>
<% //Registration registration = (Registration)auth.getPrincipal(); %>
<% 

String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>



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

<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="<%=appUrl %>/images/fav-icon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">



<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><spring:message code="label.plndetls"/> | DrySign</title>

<!-- Bootstrap -->


	  <!-- <link rel="stylesheet" type="text/css" href="<%=appUrl %>/css/plan_style.css" />  -->
	  <link rel="stylesheet" type="text/css" href="<%=appUrl %>/css/bootstrap.css" />
	 
<%-- 	  <link href="<%=appUrl %>/css/materialize.css" rel="stylesheet"/> --%>
	   <link rel="stylesheet" type="text/css" href="<%=appUrl %>/css/style.css" />
	  	  <link rel="stylesheet" type="text/css" href="<%=appUrl %>/css/inner_page.css" />
	  	       <link href="<%=appUrl %>/css/buttonLoader.css" rel="stylesheet" type="text/css">
	  	       	
	  	       	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> -->
	  	       <link rel="stylesheet" href="<%=appUrl %>/css/fontAwesome4-4-0.css">
	  	       	<%-- <link rel="stylesheet" href="<%=appUrl %>/css/exela_theme.css"/> --%>
	  	        <script src="<%=appUrl %>/js/jquery-3.1.1.min.js"></script>
	  
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style>
    ul.flexiselDemo3 li {
    float: none;
    display: inline-block;
    list-style: none;
}
.tab-content {
    min-height: 450px;
}
    </style>
   <script>
 
   </script> 
</head>
<body>
<nav class="navbar navbar-default index inner-header">
  <div class="container-fluid"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <!-- <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#defaultNavbar1"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>-->

       <a href="<%=appUrl %>" class="hidden-xs navbar-brand">
      <img src="<%=appUrl %>/images/drysignlogo.png"/></a>
      <span class="logo-lg visible-xs devicelogo"><img  class="img-responsive" src="<%=appUrl %>/images/1.0/logo1.png" height="auto"  alt="logo"> </span></div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse pull-right" id="defaultNavbar1">
      <ul class="nav navbar-nav" id="headernavigation">			
       
        
        
        <%--   <li><a href="<%=appUrl %>/#section1">BENEFITS</a></li>
          
        <li ><a href="<%=appUrl %>/plans?category_name=General%20Plans&category=1">PRICING</a></li> --%>
         <!-- <li><a href="api">API</a></li> -->
            <%-- <%if((auth instanceof AnonymousAuthenticationToken)){ %>
              <li><a href="login">SIGN IN</a></li>
             <%}else{ %>
                 <li><a href="<%=appUrl %>/logout">LOGOUT</a></li>
             <%} %>   
        --%>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>





