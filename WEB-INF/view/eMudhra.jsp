<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.emudhra.esign.EsignControllerM" %>
    <%@ page import = "java.util.ResourceBundle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
ResourceBundle resource = ResourceBundle.getBundle("commonsutils");
String eMudhra =resource.getString("eMudhra.index");
%>

<html>
<head>
<title>Submit Form On Page Load Using JavaScript</title>
<script language="javascript">

function onLoadSubmit() {
document.login.submit();
}
</script>
</head>
<body onload="onLoadSubmit()">

<form name="login" id="login" action="<%=eMudhra%>" method="post">
<input type="text" name="txnref" value="${gatewayParam}"/>
</form>

</body>

</html>
