<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title><spring:message code="label.policy"/>| DrySign</title>

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
<meta http-equiv="refresh" content="540" />
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
    font-size: 14px!important;
}
.label-heading{
	font-weight: bold;
    font-size: 17px;
    padding: 10px 0px 0px 0px;
}

.lnk{
	color: #1d7ab4;
    text-decoration: none;
}
.privacypolicy_info p {
text-align: justify;
}
.privacypolicy_info li {
text-align: justify;
}
@media (max-width: 767px) {
.privacypolicy_info p {
text-align:left;
}
.privacypolicy_info li {
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
	  <div class="container privacypolicy_info" style=" max-width: 980px;margin: 65px auto;
    background-color: #ffffff;
    padding-top: 10px; padding: 10px 30px;margin-bottom: 85px;">
	  	  		  	<p><br></p>
					<div class="text-center label-heading"><spring:message code="label.policy.heading"/></div>
					<br>
					<div class="text-center"><spring:message code="label.policy.dateupdated"/></div>
					<br>
	  				<div>
	  				<p><spring:message code="label.policy.para1"/>&reg; <spring:message code="label.policy.para2"/></p>
	  				<p><spring:message code="label.policy.para3"/></p>
					<p><spring:message code="label.policy.para4"/></p>
	  				<p><spring:message code="label.policy.para5"/> <a href="https://www.exelatech.com/eu-us-privacy-shield-framework-policy" target="_blank"><spring:message code="label.policy.para6"/></a> <spring:message code="label.policy.para7"/></p>
					<p><spring:message code="label.policy.para8"/><p>
					<p><spring:message code="label.policy.para9"/></p>
					<p><spring:message code="label.policy.para10"/></p>
					<p class="boldtxt"><spring:message code="label.policy.para11"/></p>
						<p class="boldtxt"><spring:message code="label.policy.para12"/></p>
						<p>
						<ul>
  							<li> <spring:message code="label.policy.para13"/></li>
							<li> <spring:message code="label.policy.para14"/></li>
							<ol>
  								<li> <b><spring:message code="label.policy.para15"/></b> <spring:message code="label.policy.para16"/></li>
  								<li> <b><spring:message code="label.policy.para17"/></b> <spring:message code="label.policy.para18"/></li>
  								<li> <b><spring:message code="label.policy.para19"/></b> <spring:message code="label.policy.para20"/></li>
  								<li><b><spring:message code="label.policy.para21"/></b> <spring:message code="label.policy.para22"/></li>
  							</ol>
						<li><spring:message code="label.policy.para23"/></li>
						<li><spring:message code="label.policy.para24"/></li>
						<ol>
  								<li><spring:message code="label.policy.para25"/></li>
  								<li><spring:message code="label.policy.para26"/></li>
  						</ol>
  						<li><spring:message code="label.policy.para27"/></li>
  						<li><spring:message code="label.policy.para28"/></li>
  						<li><spring:message code="label.policy.para29"/> <a href='https://www.privacyshield.gov/' target="_blank"><spring:message code="label.http.privacyshield"/></a></li>
  						<li><spring:message code="label.policy.para30"/></li>
  						<ol>
  								<li><spring:message code="label.policy.para31"/></li>
  								<li><spring:message code="label.policy.para32"/></li>
  								<li><spring:message code="label.policy.para33"/></li>
  								<li><spring:message code="label.policy.para34"/></li>
  								<li><spring:message code="label.policy.para35"/></li>
  						</ol>
  						<li><spring:message code="label.policy.para36"/></li>
  						<li><spring:message code="label.policy.para37"/></li>
  						<li><spring:message code="label.policy.para38"/></li>
  						<li><spring:message code="label.policy.para39"/></li>
  						<li><spring:message code="label.policy.para40"/></li>
  						<li><spring:message code="label.policy.para41"/></li>
  						<li><spring:message code="label.policy.para42"/> <a href="mailto:drysign.support@exelatech.com"><spring:message code="label.drysign.support"/></a> <spring:message code="label.policy.para43"/></li>
						</ul>
						</p>	
				</div>
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
	

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.browser.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.5.2/jquery-confirm.min.js"></script>

</body>
</html>