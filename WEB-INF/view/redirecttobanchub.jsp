<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import = "java.util.ResourceBundle" %>
<%
String appUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
ResourceBundle resource = ResourceBundle.getBundle("commonsutils");
String encryption =resource.getString("payment.gateway.encryption");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- <meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/> --%>
<title>DrySign</title>
<link rel="icon" type="image/png" sizes="32x32" href="<%=appUrl %>/images/fav-icon/favicon-32x32.png">
<link rel="stylesheet" href="<%=appUrl%>/css/bootstrap.min.css">
<link rel="stylesheet"  href="<%=appUrl%>/css/style.css"/>
<link rel="stylesheet"  href="<%=appUrl%>/css/inner_page.css"/>
<script src="<%=appUrl%>/js/jquery.min.js"></script>
<script src="<%=appUrl%>/js/bootstrap.min.js"></script>
<script src="<%=encryption %>"></script>
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
   	<%-- <img src="<%=appUrl %>/images/1.0/logo_inner.png"/> --%>
    
    <a class="navbar-brand removecursor hidden-xs" href="<%=appUrl %>"><img
					src="<%=appUrl%>/images/drysignlogo.png" /></a>
					<span class="logo-lg visible-xs devicelogo"><img  class="img-responsive" src="<%=appUrl %>/images/1.0/logo1.png" height="auto"  alt="logo"> </span>
   </div>
  </div>
  <!-- /.container-fluid --> 
</nav>
<div id="loader2" class="loader2">
	<div class="loaderdiv">
		 <p><img src="<%=appUrl %>/images/drysign_logo_mono.svg"></p>
		<p><img src="<%=appUrl %>/images/drysign-logo-line_only.gif" ></p> 		
		<p><spring:message code="label.wait"/></p>
	</div>
</div>
<!--/.Footer -->
<div class="footer">
	<div class="text-center">
		&copy; <script>document.write(new Date().getFullYear())</script> <spring:message code="label.company"/>
	</div>
</div>

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


$(document).ready(function(){
	var input = aesencrypt("${urlBancpay}", "${encryptionkey}");
	//console.log(input);
	var form = $('<form action="' + "${url}" + '" method="post" target="_self"> '  +                
	        '<input type="hidden" name="ClientId" value="${clientId}" />' +
		  '<input type="hidden" name="Param" value=' + input + ' />' +
	      '</form>');
		$('body').append(form);
		form.submit();

});

</script>
</body>
</html>
