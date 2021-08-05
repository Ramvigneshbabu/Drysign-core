<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="com.drysign.model.Registration, org.springframework.security.core.context.SecurityContextHolder, org.springframework.security.core.Authentication" %>
<% 
String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title><spring:message code="label.under_maintanace_dry"/> | DrySign</title>
</head>
<body>
    <img src="<%=appUrl %>/images/maintenance.jpg" style="max-width: 100%">
</body>
</html>
