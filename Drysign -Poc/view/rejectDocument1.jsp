<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String appUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title>${title}| DrySign</title>
<!-- Bootstrap -->
<!-- <link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet"> -->
<link href="<%=appUrl%>/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="<%=appUrl%>/css/style.css" />
<link rel="stylesheet" href="<%=appUrl%>/css/inner_page.css" />
<%-- <link rel="stylesheet" href="<%=appUrl %>/css/exela_theme.css"/> --%>
<style>
.footer {
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
				<%-- <a class="navbar-brand" href="#"><img
					src="<%=appUrl%>/images/1.0/logo_inner.png" /></a> --%>
					<a class="navbar-brand removecursor hidden-xs" href="<%=appUrl %>"><img
					src="<%=appUrl%>/images/drysignlogo.png" /></a>
					<span class="logo-lg visible-xs devicelogo"><img  class="img-responsive" src="<%=appUrl %>/images/1.0/logo1.png" height="auto"  alt="logo"> </span>

			</div>
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div class="container-fluid" style="margin-top: 100px;">
		<div class="Content-wh-module text-center" style="margin-top: 20px;">
			<img src="<%=appUrl%>/images/message-bg.png" />
			<h4 class="message-text text-color-burmoda"><spring:message code="label.documentRejectSucess" /></h4>
			<a href="#" onclick="redirectTalento();" style="margin-top: 50px;"
				href="#" class="btn btn-primary font-24"><spring:message code="label.ok" /></a>
		</div>
	</div>
	<input type="hidden" id="returnURL"
		value="<c:out value='<%=request.getParameter("returnURL")%>'></c:out>" />
		<input type="hidden" id="returnUrlReject" value="${returnUrl}"/>
	<!--/.Footer -->
	<div class="footer">
		<div class="text-center">
			&copy;
			<script>
				document.write(new Date().getFullYear())
			</script>
			<spring:message code="label.company" />
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.js"></script>
	<script>
		$(window).on("load resize", function() {
			var viewportWidth = $(window).width();
			if (viewportWidth < 768) {
				(function($) {
					$(document).ready(function() {
						//alert('hi');
						$(".m-view").prependTo(".dropdown-menu li.bottom");
						$(".m-view.user").prependTo(".dropdown-menu");
					});
				})(jQuery);
			}
		});

		function redirectTalento() {
			var returnURL = $("#returnUrlReject").val();
			//var r=returnURL.replace("&", "%26");
			var decodedUrl = decodeURIComponent(returnURL);

			//alert(r);
			window.location = decodedUrl;
		}

		$(document).ready(function() {
			setTimeout(function() {
				var returnURL = $("#returnUrlReject").val();
				//var r=returnURL.replace("&", "%26");
				var decodedUrl = decodeURIComponent(returnURL);

				//alert(r);
				window.location = decodedUrl;
			}, 3000);
		});
	</script>
</body>
</html>
