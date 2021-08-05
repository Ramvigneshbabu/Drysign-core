<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% String appUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>${title} | DrySign</title>
<!-- Bootstrap -->
<!-- <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> -->
<link href="<%=appUrl %>/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet"  href="<%=appUrl %>/css/style.css"/>
<link rel="stylesheet"  href="<%=appUrl %>/css/inner_page.css"/>
<%-- <link rel="stylesheet" href="<%=appUrl %>/css/exela_theme.css"/> --%>
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
      <a class="navbar-brand removecursor hidden-xs" href="#"><img
					src="<%=appUrl%>/images/drysignlogo.png" /></a>
					<span class="logo-lg visible-xs devicelogo"><img  class="img-responsive" src="<%=appUrl %>/images/1.0/logo1.png" height="auto"  alt="logo"> </span> 
    
   </div>
  </div>
  <!-- /.container-fluid --> 
</nav>
<div class="container-fluid" style="margin-top: 100px;">
	<div class="Content-wh-module text-center" style="margin-top: 20px;">
		<img src="<%=appUrl %>/images/info_icon.png"/>		   	
	    <h4 class="message-text text-color-burmoda"><spring:message code="label.already_delete_acc"/></h4>
   </div>   

</div>
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

</script>
</body>
</html>
