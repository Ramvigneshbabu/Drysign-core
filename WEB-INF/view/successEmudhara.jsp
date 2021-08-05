<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import = "java.util.ResourceBundle" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String port = request.getServerPort() + "";
if (!port.equals(null) || !port.equals("")) {
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
String hostUrl = request.getScheme() + "://" + request.getServerName() + port;
ResourceBundle resource = ResourceBundle.getBundle("commonsutils");
String DrySignPathIN =resource.getString("DrySignPathIN");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Sign Document | DrySign</title>
<!-- Bootstrap -->
<!-- <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> -->
<link href="<%=appUrl %>/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet"  href="<%=appUrl %>/css/style.css"/>
<link rel="stylesheet"  href="<%=appUrl %>/css/inner_page.css"/>
<%-- <link rel="stylesheet" href="<%=appUrl %>/css/exela_theme.css"/> --%>
<style>
.footer{
	position: fixed;
    bottom: 0;
    width: 100%;
    height: 60px;
    z-index: 99999;
}
</style>
</head>
<body>
<nav class="navbar navbar-default inner-header">
  <div class="container-fluid"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" style="width: 100%">
      <!-- <a class="navbar-brand" href="<%=appUrl %>/app/mystorage"> -->
       <a href="<%=hostUrl %>" class="hidden-xs navbar-brand">
      <img src="<%=appUrl %>/images/drysignlogo.png"/></a>
      <span class="logo-lg visible-xs devicelogo"><img  class="img-responsive" src="<%=appUrl %>/images/1.0/logo1.png" height="auto"  alt="logo"> </span>
    
   </div>
  </div>
  <!-- /.container-fluid --> 
</nav>
<div class="container-fluid" style="margin-top: 100px;">
	<div class="Content-wh-module text-center" style="margin-top: 20px;">
		<img src="<%=appUrl %>/images/message-bg.png"/>		   	
	    <h4 class="message-text text-color-burmoda"><spring:message code="label.sucessfullyEmudharaSubmit"/></h4>
	       <div id="gotodash" style="display:none"><a href="<%=appUrl %>/login?locale=en"><spring:message code="label.redirecting"/></a></div>
	       <a href="#" onclick="redirectToMicrosite();" style="margin-top: 50px;" href="#" class="btn btn-primary font-24"><spring:message code="label.ok"/></a>
   </div>   

</div>
<%-- <input type="hidden" id="returnURL" value="${returnURL}"/> --%>
<!--/.Footer -->
<div class="footer">
	<div class="text-center">
		&copy; <script>document.write(new Date().getFullYear())</script> <spring:message code="label.company"/>
	</div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="<%=appUrl %>/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="<%=appUrl %>/js/bootstrap.js"></script>
<script>	
$(window).on("load resize", function() {
    var viewportWidth = $(window).width();
    if (viewportWidth < 768) {
	(function($) {
            $(document).ready(function() {
				//alert('hi');
              $( ".m-view" ).prependTo( ".dropdown-menu li.bottom" );
 				$( ".m-view.user" ).prependTo( ".dropdown-menu" );  
            });
         }) (jQuery);
    }
});	

function redirectToMicrosite(){
	var returnURL="<%=DrySignPathIN%>";
	//var r=returnURL.replace("&", "%26");
	var decodedUrl = decodeURIComponent(returnURL);
	
	//alert(r);
	window.location = decodedUrl;
}

$(document).ready(function(){
<%-- 	
	var appUrl="<%=appUrl %>/login";
if(location.href.indexOf("dashboard")!=-1){
	$("#gotodash").show();
	
	setTimeout(function(){
		location.href=appUrl;
	},3000);
}	 --%>
setTimeout(function(){ 
	var returnURL="<%=DrySignPathIN%>";
	//var r=returnURL.replace("&", "%26");
	var decodedUrl = decodeURIComponent(returnURL);
	
	//alert(r);
	window.location = decodedUrl;}, 3000);
})
</script>
</body>
</html>
