<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String port = request.getServerPort() + "";
if (!port.equals(null) || !port.equals("")) {
	port = ":" + port;
}
	String appUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	String hostUrl = request.getScheme() + "://" + request.getServerName() + port;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title><spring:message code="label.tc"/>| DrySign</title>

<link rel="apple-touch-icon" sizes="57x57"
	href="<%=appUrl%>/images/fav-icon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="<%=appUrl%>/images/fav-icon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="<%=appUrl%>/images/fav-icon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="<%=appUrl%>/images/fav-icon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="<%=appUrl%>/images/fav-icon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="<%=appUrl%>/images/fav-icon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="<%=appUrl%>/images/fav-icon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="<%=appUrl%>/images/fav-icon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="<%=appUrl%>/images/fav-icon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="<%=appUrl%>/images/fav-icon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="<%=appUrl%>/images/fav-icon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="<%=appUrl%>/images/fav-icon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=appUrl%>/images/fav-icon/favicon-16x16.png">
<link rel="manifest" href="<%=appUrl%>/images/fav-icon/manifest.json">
<link href="<%=appUrl%>/css/cookie.css" rel="stylesheet" />
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="<%=appUrl%>/images/fav-icon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<!-- <link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet"> -->
<link rel="stylesheet" href="<%=appUrl%>/css/bootstrap.min.css">
<script src="<%=appUrl%>/js/jquery.min.js"></script>
<script src="<%=appUrl%>/js/bootstrap.min.js"></script>
<script src="<%=appUrl%>/js/nagging-menu.js"></script>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> -->
	<link rel="stylesheet" href="<%=appUrl %>/css/fontAwesome4-4-0.css">
<%-- <link rel="stylesheet" href="<%=appUrl%>/css/login.css"> --%>
<link href="<%=appUrl%>/css/buttonLoader.css" rel="stylesheet"
	type="text/css">
		<%-- <link rel="stylesheet" href="<%=appUrl %>/css/exela_theme.css"/> --%>
<!-- Bootstrap -->
<style>
input[type="checkbox"] {
    top: 0;
    width: 17px!important;
    height: 17px!important;
    border: 2px solid #00bc9c!important;    
    z-index: 0;
    margin: 4px 0 0;
    margin-top: 1px \9;
    line-height: normal;
}


  [type="checkbox"].filled-in:checked + label:after {
    top: 0;
    width: 17px!important;
    height: 17px!important;
    border: 2px solid #00bc9c!important;
    background-color: #00bc9c!important;
    z-index: 0;
}


</style>

<!-- <link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet"> -->
<link href="<%=appUrl%>/css/bootstrap.css" rel="stylesheet">

<link rel="stylesheet" href="<%=appUrl%>/css/fonts_icon.css">
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> -->
<link rel="stylesheet" href="<%=appUrl%>/css/style.css" /> 	
<%-- <link rel="stylesheet" href="<%=appUrl%>/css/style1.css" /> --%> 
<link rel="stylesheet" href="<%=appUrl%>/css/inner_page.css" />
<link href="<%=appUrl%>/css/buttonLoader.css" rel="stylesheet"
	type="text/css">
<link href="<%=appUrl%>/css/jquery.signature.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.5.2/jquery-confirm.min.css">
<link href="<%=appUrl%>/css/cookie.css" rel="stylesheet">
<style>
body{
background-color: #f8f4f3;
    font-size: 14px;
}
.rest-info p {
  
        /*font-size: 13px!important;*/
    line-height: 23px;
        text-align: justify;
}

.label-heading{
	font-weight: bold;
    font-size: 17px;
    padding: 10px 0px 0px 0px;
}
@media (max-width: 991px) {
.rest-info p {
text-align:left;
}

}
</style>

</head>
<body>	
	<nav class="navbar navbar-default inner-header">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header" style="width: 100%">
				<!-- <a class="navbar-brand" href="<%=appUrl %>/app/dashboard"> -->
				 <a href="<%=hostUrl %>" class="hidden-xs navbar-brand">
      <img src="<%=appUrl %>/images/drysignlogo.png"/></a>
      <span class="logo-lg visible-xs devicelogo"><img  class="img-responsive" src="<%=appUrl %>/images/1.0/logo1.png" height="auto"  alt="logo"> </span>				
			</div>
		</div>
		
	
	</nav>
<div class="row">
	  <div class="container  rest-info" style=" max-width: 980px;margin: 65px auto;
    background-color: #ffffff;
    padding-top: 10px; padding: 10px 30px;margin-bottom: 85px;">
	  	  <br><br>
	  	 
					<h4 class="text-center label-heading"><spring:message code="label.terms.heading"/></h4>
					<p style="text-align: center;"><spring:message code="label.terms.lastupdate"/></p>
					
					<p><spring:message code="label.terms.para1"/>&reg; <spring:message code="label.terms.para2"/></p>
					
					<p><spring:message code="label.terms.para3"/></p>
					
					<p><spring:message code="label.terms.para4"/></p>
					
					<p><spring:message code="label.terms.para5"/></p>
					
					<p><spring:message code="label.terms.para6"/></p>
					
					<p><spring:message code="label.terms.para7"/></p>
					
					<p><spring:message code="label.terms.para8"/> <a href="mailto:drysign.support@exelatech.com" target="_top" ><spring:message code="label.drysign.support"/></a> <spring:message code="label.terms.para9"/></p>
					
					<p class="boldtxt"><spring:message code="label.terms.para10"/></p>
					
					<p><spring:message code="label.terms.para11"/></p>
					
					
					
					<p><b><spring:message code="label.terms.para12"/></b> <spring:message code="label.terms.para13"/></p>
				
					<p><b><spring:message code="label.terms.para14"/></b> <spring:message code="label.terms.para15"/></p>

					<p class="boldtxt"><spring:message code="label.terms.para16"/></p>
					
					<p><spring:message code="label.terms.para17"/></p>
					
					<p><spring:message code="label.terms.para18"/></p>
					
					<p><spring:message code="label.terms.para19"/></p>
					<p><spring:message code="label.terms.para20"/></p>

					<p><spring:message code="label.terms.para21"/></p>
					<p class="boldtxt"><spring:message code="label.terms.para22"/></p>
					<p><spring:message code="label.terms.para23"/></p>
					
				    <p><spring:message code="label.terms.para24"/></p>
						<p><spring:message code="label.terms.para25"/></p>
					<br>
					<p class="boldtxt"><spring:message code="label.terms.para26"/></p>
					
					<p><spring:message code="label.terms.para27"/></p>
					<p><spring:message code="label.terms.para28"/></p>
					<p><spring:message code="label.terms.para29"/></p>
					
					<p class="boldtxt"><spring:message code="label.terms.para30"/></p>
					
					<p><spring:message code="label.terms.para31"/></p>
									
						<p class="boldtxt"><spring:message code="label.terms.para32"/></p>
						<p><spring:message code="label.terms.para33"/></p>
						
						<p class="boldtxt"><spring:message code="label.terms.para34"/></p>
						<p><spring:message code="label.terms.para35"/></p>
						<p><spring:message code="label.terms.para36"/></p>
						<p><spring:message code="label.terms.para37"/></p>
						<p><spring:message code="label.terms.para38"/></p>
						<p><spring:message code="label.terms.para39"/></p>
						<p><spring:message code="label.terms.para40"/></p>
						
						<p class="boldtxt"><spring:message code="label.terms.para41"/></p>
						<p><spring:message code="label.terms.para42"/></p>
						<p><spring:message code="label.terms.para43"/></p>
						<p><spring:message code="label.terms.para44"/></p>
						<p><spring:message code="label.terms.para45"/></p>
						<p><spring:message code="label.terms.para46"/></p>
						
						<p class="boldtxt"><spring:message code="label.terms.para47"/></p>
						<p><spring:message code="label.terms.para48"/></p>
						<p><spring:message code="label.terms.para49"/></p>
						
						<p class="boldtxt"><spring:message code="label.terms.para50"/></p>
						<p><spring:message code="label.terms.para51"/></p>
						<p><spring:message code="label.terms.para52"/> <b><spring:message code="label.terms.para83"/></b> <spring:message code="label.terms.para84"/> <b><spring:message code="label.terms.para85"/></b> <spring:message code="label.terms.para86"/></p>
						<p><spring:message code="label.terms.para53"/></p>
						<p><spring:message code="label.terms.para54"/></p>
						<p><spring:message code="label.terms.para55"/></p>
						<p><spring:message code="label.terms.para56"/> <a href="mailto:drysign.support@exelatech.com" target="_blank"> <spring:message code="label.drysign.support"/></a></p>
						
						<p class="boldtxt"><spring:message code="label.terms.para57"/></p>
						<p><spring:message code="label.terms.para58"/> <b><spring:message code="label.terms.para87"/></b> <spring:message code="label.terms.para88"/></p>
						<p><spring:message code="label.terms.para59"/> <b><spring:message code="label.terms.para89"/></b> <spring:message code="label.terms.para90"/> <b><spring:message code="label.terms.para91"/></b> <spring:message code="label.terms.para92"/> <b><spring:message code="label.terms.para93"/></b> <spring:message code="label.terms.para94"/></p>
						<p><spring:message code="label.terms.para60"/></p>
						
						
						<p class="boldtxt"><spring:message code="label.terms.para61"/></p>
						<p><spring:message code="label.terms.para62"/></p>
						<p><spring:message code="label.terms.para63"/><a href="<%=appUrl%>/login?refund=refund&locale=en" target="_blank"><spring:message code="label.terms.para97"/></a><spring:message code="label.terms.para98"/></p>
						<p><spring:message code="label.terms.para64"/></p>
						
						<p class="boldtxt"><spring:message code="label.terms.para65"/></p>
						<p><spring:message code="label.terms.para66"/></p>
						
				<p class="boldtxt"><spring:message code="label.terms.para67"/></p>
				<p><spring:message code="label.terms.para68"/></p>
				
				<p class="boldtxt"><spring:message code="label.terms.para69"/></p>
				<p><spring:message code="label.terms.para70"/></p>
				
				<p class="boldtxt"><spring:message code="label.terms.para71"/></p>
				<p><spring:message code="label.terms.para72"/></p>
				<p><spring:message code="label.terms.para73"/></p>
				<p><spring:message code="label.terms.para74"/></p>
				<p><spring:message code="label.terms.para75"/></p>
				<p><spring:message code="label.terms.para76"/></p>
				<p><spring:message code="label.terms.para77"/><a href="<%=appUrl%>/consentproceed" target="_blank"> <spring:message code="label.terms.para78"/></a> <spring:message code="label.terms.para99"/> <spring:message code="label.terms.para79"/><spring:message code="label.terms.para80"/><a href="<%=appUrl%>/privacypolicy" target="_blank"> <spring:message code="label.terms.para95"/></a><spring:message code="label.terms.para96"/></p>
				<p><spring:message code="label.terms.para81"/></p>
			</div>   
  </div>
	<!--/.Footer -->
	<div class="footer">
		<div class="text-center">
			<!-- <span class="icon-language"></span> ENGLISH | --> &copy;
			<script>document.write(new Date().getFullYear())</script>
			<spring:message code="label.company"/>
		</div>
	</div>
	
</body>
</html>