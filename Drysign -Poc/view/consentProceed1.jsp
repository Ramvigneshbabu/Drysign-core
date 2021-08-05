<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%
String port = request.getServerPort() + "";
if (!port.equals(null) || !port.equals("")) {
	port = ":" + port;
}
	String appUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	String hostUrl = request.getScheme() + "://" + request.getServerName() + port;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title><spring:message code="label.consent"/> | DrySign</title>

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
<%-- <link href="<%=appUrl%>/css/cookie.css" rel="stylesheet" /> --%>
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
.rest-info p {
text-align: justify;
}
.rest-info li {
text-align: justify;
}
@media (max-width: 767px) {
.rest-info p {
text-align:left;
}
.rest-info li {
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
	  	  
	  	  <h2  class="text-center" style="color: #333;font-size: 17px;"><b><spring:message code="label.consent.consentheading"/></b></h2>
					<p><spring:message code="label.consent.consentnote1"/></p>
					<br>
					<p><spring:message code="label.consent.consentnote2"/></p>
					<ul>
						<li><p class="sub-cat-id">1.</p>
							<p class="sub-cat-txt"><spring:message code="label.consent.consent1"/></p></li>
						<li><p class="sub-cat-id">2.</p>
							<p class="sub-cat-txt"><spring:message code="label.consent.consent2"/></p></li>
						<li><p class="sub-cat-id">3.</p>
							<p class="sub-cat-txt"><spring:message code="label.consent.consent3"/></p></li>
						<li><p class="sub-cat-id">4.</p>
							<p class="sub-cat-txt"><spring:message code="label.consent.consent4"/></p></li>
						<li><p class="sub-cat-id">5.</p>
							<p class="sub-cat-txt"><spring:message code="label.consent.consent5"/></p></li>
						<li><p class="sub-cat-id">6.</p>
							<p class="sub-cat-txt"><spring:message code="label.consent.consent6"/></p></li>
						<li><p class="sub-cat-id">7.</p>
							<p class="sub-cat-txt"><spring:message code="label.consent.consent7"/></p></li>

					</ul>

					<p class="boldtxt" ><spring:message code="label.consent.consentagreement"/></p>
					<ul>
						<li><p class="sub-cat-id">1.</p>
						<p class="sub-cat-txt"><spring:message code="label.consent.agreementcomment1"/></p></li>
						
						<li><p class="sub-cat-id">2.</p>
							<p class="sub-cat-txt"><spring:message code="label.consent.agreementcomment2"/></p></li>
							
						<li><p class="sub-cat-id">3.</p>
						<p class="sub-cat-txt"><spring:message code="label.consent.agreementcomment3"/></p></li>
							
						<li><p class="sub-cat-id">4.</p>
						<p class="sub-cat-txt"><spring:message code="label.consent.agreementcomment4"/></p></li>
							
						<li><p class="sub-cat-id">5.</p>
						    <p class="sub-cat-txt"><spring:message code="label.consent.agreementcomment5"/></p></li>
							
							<li><p class="sub-cat-id">6.</p>
							<p class="sub-cat-txt"><spring:message code="label.consent.agreementcomment6"/></p></li>
							
							<li><p class="sub-cat-id">7.</p>
							<p class="sub-cat-txt"><spring:message code="label.consent.agreementcomment7"/></p></li>
							
							<li><p class="sub-cat-id">8.</p>
							<p class="sub-cat-txt"><spring:message code="label.consent.agreementcomment8"/></p></li>
						
							<li><p class="sub-cat-id" style="margin-bottom:30px;">9.</p>
							<p class="sub-cat-txt"><spring:message code="label.consent.agreementcomment9"/></p></li>
						
							<li><p class="sub-cat-id" style="margin-bottom:42px;margin-left:-5px;">10.</p>
							<p class="sub-cat-txt"><spring:message code="label.consent.agreementcomment10"/></p></li>
							
							<li><p class="sub-cat-id" style="margin-left:-5px;">11.</p>
							<p class="sub-cat-txt"><spring:message code="label.consent.agreementcomment11"/></p></li>
					</ul>
					
					<br>
					<p class="boldtxt"><spring:message code="label.consent.consentnote3"/></p>
					<ul>
						<li><p class="sub-cat-id">1.</p>
						   <p class="sub-cat-txt"><spring:message code="label.consent.consentcomment1"/></p></li>
							
						<li><p class="sub-cat-id">2.</p>
							<p class="sub-cat-txt"><spring:message code="label.consent.consentcomment2"/></p></li>
						
						<li><p class="sub-cat-id">3.</p>
						   <p class="sub-cat-txt"><spring:message code="label.consent.consentcomment3"/><p></li>
						
						<li><p class="sub-cat-id">4.</p>
						    <p class="sub-cat-txt"><spring:message code="label.consent.consentcomment4"/></p></li>

					</ul>

					<br>
					<p class="boldtxt"><spring:message code="label.consent.consentfootercomment"/></p>
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


	<script src="<%=appUrl%>/js/jquery-ui.js"></script>
	<script src="<%=appUrl%>/js/jquery.signature.js"></script>
	<script src="<%=appUrl%>/js/jquery.ui.touch-punch.js"></script>


</body>
</html>