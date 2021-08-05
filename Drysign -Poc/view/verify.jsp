<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page
	import="com.drysign.model.Registration, org.springframework.security.core.context.SecurityContextHolder, org.springframework.security.core.Authentication"%>
<%
	String port = request.getServerPort() + "";
	if (!port.equals(null) || !port.equals("")) {
		port = ":" + port;
	}
	String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
	
	String hostUrl = request.getScheme() + "://" + request.getServerName() + port;

%>
<!DOCTYPE html>
<html lang="en">
<head>
<title><spring:message code="label.verifyDrysign"/></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
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
<!-- <link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet"> -->
<link rel="stylesheet" href="<%=appUrl%>/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.2/jquery.min.js"></script>
<script src="<%=appUrl%>/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> -->
<link rel="stylesheet" href="<%=appUrl%>/css/fontAwesome4-4-0.css">
<link rel="stylesheet" href="<%=appUrl%>/css/login.css">
<link rel="stylesheet" href="<%=appUrl%>/css/style.css" />
<link href="<%=appUrl%>/css/buttonLoader.css" rel="stylesheet"
	type="text/css">
<%-- <link rel="stylesheet" href="<%=appUrl %>/css/exela_theme.css"/> --%>
</head>
<style>
.btn-blue {
	font-size: 13px !important;
	padding: 12px 16px;
	color: #FFF;
	border-radius: 5px !important;
	background: #D71996 !important
}

.btn-blue:hover {
	background: #961169 !important;
	border: none !important;
	text-decoration: none !important;
	color: #fff !important;
}
</style>
<body class="bg">
	<section>
		<div class="login">
			<div class="wrapper-lg">
				<div class="text-center">
					<a href="<%=hostUrl%>"><img src="<%=appUrl%>/images/logo.png" alt="Logo" class="iMg"
						title="Logo" /></a>
				</div>
				<div class="login-info">
					<div class="message text-center">
						<c:choose>
							<c:when test="${ message == '1'}">
								<p>
									<img src="<%=appUrl%>/images/message-bg.png" />
								</p>

								<h4>
									<spring:message code="label.accntverify" />
								</h4>

								<p>
									<spring:message code="label.acountsuccess" />
								</p>
								<br />
								<div>
									<a href="login" class="btn-blue" style="margin-top: 20px"><spring:message
											code="label.conti-drysign" /></a>
								</div>
							</c:when>

							<c:when test="${ message == '3'}">
								<p>
									<img src="<%=appUrl%>/images/fail.png" />
								</p>

								<h4>
									<spring:message code="label.failedVerify"/> <b><spring:message code="label.drysign.support"/></b>
								</h4>

								<br />
								<div>
									<a href="login" class="btn-blue" style="margin-top: 20px"><spring:message
											code="label.conti-drysign" /></a>
								</div>
							</c:when>

							<c:when test="${ message == 'Link Expire'}">
								<p>
									<img src="<%=appUrl%>/images/fail.png" />
								</p>
								<p style="color: red;">
									<spring:message code="label.yurlonk" />
								</p>
								<br />
								<a href="plancharge?category_name=General%20Plans&category=1"
									class="btn-link btn-blue"><spring:message
										code="label.tryagain" /></a>
							</c:when>

							<c:when test="${ message == 'Expire'}">
								<p>
									<img src="<%=appUrl%>/images/fail.png" />
								</p>
								<p style="color: red;">
									<spring:message code="label.yurlonk" />
								</p>
								<br />
								<a onclick = "resendLink('<c:out value="${user}"/>');" class="btn-link btn-blue"><spring:message code="label.resendLink"/></a>
							</c:when>

							<c:otherwise>
								<p>
									<img src="<%=appUrl%>/images/fail.png" />
								</p>

								<p style="color: red;">${message}</p>
								<br />
								<a href="login" class="btn-blue"><spring:message
										code="label.conti-drysign" /></a>
							</c:otherwise>
						</c:choose>

					</div>
					<!-- <!-- QRCode display
					<div id="QRCode"></div>
					<div id="Error"></div> -->
				</div>
				<div class="wrapper-footer">
				<div class="wrapper-footer_content">
					<hr />
					<p>
						&copy;
						<script>
							document.write(new Date().getFullYear())
						</script>
						<spring:message code="label.company" />
					</p>
				</div>
			</div>
			</div>
			
		</div>
	</section>
	<!-- script -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.2/jquery.min.js"></script>
	<script src="<%=appUrl %>/js/bootstrap.min.js"></script>
<input type="hidden" id="contextPath" value="<%=appUrl%>/" />
<input type="hidden" id="user" value="<c:out value="${user}"/>" />
<script>
function resendLink(value){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var contextPath = $("#contextPath").val();

	$.ajax({
	//	contentType : 'application/json; charset=utf-8',
		type : "POST",
		url : "resendEmailToInactiveUser",
		dataType : 'json',
		crossDomain : true,
		data : {
			"inactiveUsername":value,
			"typeOfInactiveUser":"InactiveUserWithoutPurchasePlan"
		},
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		complete : function() {
		},
		success : function(response) {
			if (response.msg == 1 || response.msg == "1") {
				$.confirm({
				    title: '',
				    content: '<spring:message code="label.verificationLinkSent"/>',
				    buttons: {
				        Ok: function () {
				        	window.location.href = "<%=appUrl %>/login?locale=en";
				        }
				    }
				});
			} else {
				$.alert({
				    title: '',
				    content: response.msg,
				});
				
			}
		},
		error : function(xhr, textStatus, errorThrown) {
			alert('<spring:message code="label.loading_error"/>');
			return false;
		}
	});
	
	
}


</script>

</body>
</html>

