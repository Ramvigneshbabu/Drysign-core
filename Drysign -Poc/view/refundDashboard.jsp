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
<html lang="en">

<head>
  <meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="<%=appUrl %>/images/fav-icon/ms-icon-144x144.png">


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

<meta name="theme-color" content="#ffffff">

<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title><spring:message code="label.refund"/> | DrySign</title>

	
	<link rel="stylesheet" href="<%=appUrl %>/css/newCSS/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="<%=appUrl %>/css/font-awesome.min.css">
	<link rel="stylesheet" href="<%=appUrl%>/css/fonts_icon.css">
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> -->
	<link rel="stylesheet" href="<%=appUrl %>/css/fontAwesome4-4-0.css">
<link rel="stylesheet" href="<%=appUrl%>/css/style.css" />
<link rel="stylesheet" href="<%=appUrl%>/css/inner_page.css" />
<link href="<%=appUrl%>/css/buttonLoader.css" rel="stylesheet">

	<link rel="stylesheet" href="<%=appUrl %>/css/cookie.css" />
	
	<link href="<%=appUrl %>/css/buttonLoader.css" rel="stylesheet" type="text/css">
	<script src="<%=appUrl %>/js/js_landing/jquery-1.11.3.min.js"></script>
	 <script src="<%=appUrl %>/js/jquery.buttonLoader.js"></script>
	 <%--  <link rel="stylesheet" href="<%=appUrl %>/css/exela_theme.css"/> --%>
<style>

.footer {
position: fixed;}
.Message {
    position: absolute;
    top: 29%;
    right: 0;
    left: 0;
    max-width: 90%;
    background: #fff;
    z-index: 9999;
    margin: 0 auto;
    padding: 10px;
    display: inline-table;
    display: none;
    overflow: hidden;
    color: #1d1a1a;
    width: 540px;
    webkit-box-shadow: 0 5px 15px rgba(0,0,0,.5);
    box-shadow: 0 5px 15px rgba(0,0,0,.5);
    /* max-width: 90%; */
}

@media only screen and (max-width: 768px){
#gotodash{
margin:0 auto;
text-align:center;
}
.navbar-header {
    background-color: transparent;
}
}

.refund-dashboard .form-control{
	border: 1px solid #d4d4d4;
	border-top:0;
	border-left:0;
	border-right:0;
	    box-shadow: none;
}
.refund-dashboard  label{
    color: #40505b;
    font-weight: normal;
    font-size: 12px;
 }
 
.refund-card{
       background: #e3f5fd;
    padding: 0 25px 15px;
    border: 1px dashed #cbe8f5;
    border-radius: 8px;
    text-align: center;
    width: 280px;
    max-width: 90%;
    margin: 25px auto 0 auto !important;
} 
.refund-card hr {
       margin: 10px 0;
    /* color: #00b0ff; */
    height: 1px;
    background: #74c4e8;
    border: 0;
}
section.refund-dashboard {
    padding: 150px 0;
}

    .inner-header.navbar-default .navbar-collapse{
    border-color: #e7e7e7;
    margin-top: 25px;
    padding-right: 0px;
    display: none !important;
}
.navbar-brand {
    float: left;
    height: 70px;
    padding: 10px 15px !important;
    /* font-size: 18px; */
    line-height: 20px;
}

  </style> 

<body>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-102458969-1"></script>

<nav class="navbar navbar-default inner-header">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header" style="width: 100%">
				 <a href="<%=appUrl %>" class="hidden-xs navbar-brand">
      <img src="<%=appUrl %>/images/drysignlogo.png"/></a>
      <span class="logo-lg visible-xs devicelogo"><img  class="img-responsive" src="<%=appUrl %>/images/1.0/logo1.png" height="auto"  alt="logo"> </span>				
			</div>
		</div>
		
	
	</nav>    


<section class="refund-dashboard" id = "refundDashboard" style="display: none;">


	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="alert alert-danger fade in" style="display:none;text-align:center;margin:0px 0 20px 0;" id="checkouterror">
				  	<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>
					<div id="checkouterrormessage"></div>
					<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>
				</div> 
				<div class="alert alert-success" style="display:none;text-align:center;margin:0px 0 20px 0;" id="checkoutsuccess">
				  	<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i>
				  	<div id="checkoutsuccessmessage"></div>
				  	<a  class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>
				</div>
				<div class=""><b><spring:message code="label.details2"/></b></div>
				<form>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
							    <label for=""><spring:message code="label.tmp-name"/></label>
							    <input type="email" class="form-control" id="username" value = "<c:out value="${username}"></c:out>" readonly >
							   
							 </div>
						  <div class="form-group">
						    <label for=""><spring:message code="label.grp_email"/></label>
						    <input type="email" class="form-control" id="email" value = "<c:out value="${email}"></c:out>" readonly>
						   
						  </div>
						  
						</div>
					<div class="col-md-6">
						  <div class="form-group">
						    <label for=""><spring:message code="label.sub_plan"/></label>
						    <input type="email" class="form-control" id="planName" value = "<c:out value="${planName}"></c:out>" readonly>
						
						  </div>
					  <div class="form-group">
					    <label for=""><spring:message code="label.sub_id"/></label>
					    <input type="email" class="form-control" id="subsId" value = "<c:out value="${subsId}"></c:out>" readonly>
					  
					  </div>
					  
					</div>
					
					</div>
				
				</form>
				
		</div>
		<div class="col-md-4">
			<div class="card refund-card">
			  <div class="" style="font-size: 18px;">
			 	 <spring:message code="label.sumry"/>
			  </div>
			  <hr/>
			  <div class="card-body-t">
			  	<table>
				  	<tr>
					  	<td style="width: 145px;text-align: right;"><spring:message code="label.paid"/>: </td>
					  	<td style="width: 145px;text-align: left;     padding-left: 15px;">US $ <c:out value="${paidAmount}"></c:out></td>
				  	</tr>
				  	<tr>
					  	<td style="width: 145px;text-align: right;"><spring:message code="label.fee"/>: </td>
					  	<td style="width: 145px;text-align: left;     padding-left: 15px;">US $ <c:out value="${TXNFees}"></c:out></td>
				  	</tr>
			  	</table>
			  </div>
			  <div>
			 <hr/>
			  	<table>
				  	<tr>
					  	<td style="width: 154px;text-align: right;"><b><spring:message code="label.refundamnt"/>:</b> </td>
					  	<td style="width: 145px;text-align: left;     padding-left: 15px;"><b>US $ <c:out value="${refAmount}"></c:out></b></td>
				  	</tr>
			  	</table>
			
			 
			</div>
			</div>
		</div>
		</div>
		<div class="row" style="margin-top: 25px;">
			<div id="prcdrefnd" class="col-md-12">
				<span><spring:message code="label.prcd_refnd"/></span>
				 <button type="button" class="btn btn-light" onclick="refundCancel();"><spring:message code="label.cancel"/></button>
				 <button type="button" id = "confirm" class="btn btn-info" onclick="refundConfirm();"><spring:message code="label.out_confm"/></button>
			</div>
			<div id = "gotodash" class="col-md-12" style="display:none;">
			<!--	<a style="margin-top: 50px; color: white;" type="submit" value="Ok" href="<%=appUrl %>/logout" class="btn btn-info"><spring:message code="label.todash"/></a>  -->
			<a style="margin-top: 50px; color: white;" href="#" onClick="logoutyes();" class="btn btn-info"><spring:message code="label.todash"/></a>
			</div>
		</div>
	</div>
</section>

	<section class="refund-dashboard" id = "refundCriteria" style="display: none;">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class=""><b><spring:message code="label.details2"/></b></div>
					<p id="internalMsg" style="color: red;"/>
					<p id="annualMsg" style="color: red;"/>
					<p id="usedDocMsg" style="color: red;"/>
					<p id="dayleftMsg" style="color: red;"/>
					<p id="refundStatus" style="color: red;"/>
					<form>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
							    <label for=""><spring:message code="label.tmp-name"/></label>
							    <input type="email" class="form-control" id="username" value = "<c:out value="${username}"></c:out>" readonly >
							   
							 </div>
						  <div class="form-group">
						    <label for=""><spring:message code="label.grp_email"/></label>
						    <input type="email" class="form-control" id="email" value = "<c:out value="${email}"></c:out>" readonly>
						   
						  </div>
						  
						</div>
					<div class="col-md-6">
						  <div class="form-group">
						    <label for=""><spring:message code="label.sub_plan"/></label>
						    <input type="email" class="form-control" id="planName" value = "<c:out value="${planName}"></c:out>" readonly>
						
						  </div>
					  <div class="form-group">
					    <label for=""><spring:message code="label.sub_id"/></label>
					    <input type="email" class="form-control" id="subsId" value = "<c:out value="${subsId}"></c:out>" readonly>
					  
					  </div>
					  
					</div>
					
					</div>
				
				</form>
				</div>
			</div>
		<!--	<a style="margin-top: 50px; color: white;" type="submit" value="Ok" href="<%=appUrl %>/logout" class="btn btn-info"><spring:message code="label.todash"/></a>  -->
		<a style="margin-top: 50px; color: white;" href="#" onClick="logoutyes();" class="btn btn-info"><spring:message code="label.todash"/></a>
		</div>
	</section>
 <div class="overlay-bg"></div>
 
 <div class="Message" id="cancleRefund">	
   <div class="modal-header">
	  	<!-- <a class="close" href="#"><span class="icon-close"></span></a> -->
	  	
	  	<div class="modal-body">
		 	<p><spring:message code="label.cncl_refund"/></p>
		 	
		 </div>	
	  </div>
		 
	  	
 </div>
 <div class="Message" id="confirmRefund" style="width: 400px;">	
   <div class="modal-header">
	 
	  	<h4 class="modal-title"><spring:message code="label.refund"/></h4>
	</div>
	  	
	  	<div class="modal-body">
		 	<p><spring:message code="label.cnfm_refund"/></p>
		 	
		 </div>	
	 	 
	  <div class="text-right">	  
		<button type="button" class="btn btn-light" onclick="refundConfirmCancel();"><spring:message code="label.cancel"/></button>
		<button type="button" class="btn btn-info" onclick="confirmmrefund();"><spring:message code="label.out_confm"/></button>
		
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
 <script>
 	$(document).ready(function(){
 		var daysLeft = ${daysLeft};
 		var usdDoc = ${usdDoc};
 		var usdTem = ${usdTem};
 		var planTypeAnnual = ${planTypeAnnual};
 		var isInternal = ${isInternal};
 		var refundValid = ${isRefund};
 		var refundStatus = "<c:out value="${refundStatus}"></c:out>";
 		
 		if(refundValid == false){
 			
 			if("${subsend}"!=0){
	 			if(isInternal == true){
	 				document.getElementById("internalMsg").innerHTML="<spring:message code="label.noteligible"/>";
	 				$("#annualMsg").hide();
	 				$("#usedDocMsg").hide();
	 				$("#dayleftMsg").hide();
	 				//$("#refundStatus").hide();
	 			}
	 			if(planTypeAnnual != 365){
	 				document.getElementById("annualMsg").innerHTML="<spring:message code="label.anuualsubs"/>";
	 			}
	 			if(usdDoc != 0 || usdTem != 0){
	 				document.getElementById("usedDocMsg").innerHTML="<spring:message code="label.unused_sub"/>";
	 			} 
	 			if(daysLeft > 30){
	 				document.getElementById("dayleftMsg").innerHTML="<spring:message code="label.not30days"/>";
	 			}
	 			if(refundStatus != "FAILED" && refundStatus !=''){
	 				//$("#annualMsg").hide();
	 				$("#usedDocMsg").hide();
	 				$("#dayleftMsg").hide();
	 				//$("#refundStatus").hide();
	 				if(refundStatus == "SUCCESS"){
	 					document.getElementById("refundStatus").innerHTML="<spring:message code="label.rfnd_succ"/>";
	 				}else{
	 					document.getElementById("refundStatus").innerHTML="<spring:message code="label.refnd_initiate"/>";
	 				}
	 			}
 			}else{
 				document.getElementById("refundStatus").innerHTML="<spring:message code="label.csncled_active_subs"/>";
 			}
	 			$("#refundCriteria").css('display','block');
 		}else{
 			$("#refundDashboard").css('display','block');
 		}
 	});
 	
 	function logoutyes(){
 		var locale = localStorage.getItem("langCode");
 		var region = localStorage.getItem("region");
 		localStorage.clear();
 		window.location = "<%=appUrl %>/logout?locale="+locale+"&region="+region;
 	}
 	
 	function refundCancel(){
 		var locale = localStorage.getItem("langCode");
 		var region = localStorage.getItem("region");
 		document.body.scrollTop = 0;
		 document.documentElement.scrollTop = 0;
		$('.overlay-bg').show();
		$('#cancleRefund').show();
		$('.overlaywhite_bg').show();
		 setInterval(function(){
			 window.location = "<%=appUrl %>/logout?locale="+locale+"&region="+region;
			  }, 3000);
 	}
 	
 	window.onload = function () {  
        document.onkeydown = function (e) {  
            return (e.which || e.keyCode) != 116;  
        };  
    }  
 	
 	function refundConfirm(){
 		document.body.scrollTop = 0;
		 document.documentElement.scrollTop = 0;
 		$('.overlay-bg').show();
		$('#confirmRefund').show();
		$('.overlaywhite_bg').show();
 	}
 	
 	function refundConfirmCancel(){
 		$('#confirmRefund').hide();
 		$('.overlaywhite_bg').hide();
 		$('.overlay-bg').hide();
 		refundCancel();
 	}
 	
 	function confirmmrefund(){
 		$('#confirmRefund').hide();
 		$('.overlaywhite_bg').hide();
 		$('.overlay-bg').hide();
 		
 		var token = $("meta[name='_csrf']").attr("content");
 		var header = $("meta[name='_csrf_header']").attr("content");
 		var contextPath=$("#contextPath").val();
 		var subscriptionId = "${subsId}";
 		var subId = subscriptionId.substring(7);
 		var refundAmount = "<c:out value="${refAmount}"></c:out>";
 		var txnId = "<c:out value="${txnId}"></c:out>";
 		data = {
 				"subscriptionId":subId,
 				"price":refundAmount,
 				"transactionId":txnId
 				};
 		$.ajax({
 			type : "POST",
 		    url: "refund",
 		    data:JSON.stringify(data), 
 		    contentType: "application/json",
 		    beforeSend : function(xhr) {
 		    	$('#confirm').buttonLoader('start');
 				 xhr.setRequestHeader(header, token);
 				
 			},
 			complete : function() {
 				$("#confirm").buttonLoader('stop');
 			},
 			
 			success : function(response) {
 				//alert(response); 
 				if(response == "SUCCESS"){
 					$("html, body").animate({ scrollTop: 0 }, 1000);
 					$("#checkoutsuccess").show();
 					$("#checkoutsuccessmessage").html("<spring:message code="label.rfnd_succ"/>");
 					$("#prcdrefnd").hide();
 					$("#gotodash").show();
 				}else if(response == "SUBMITTED"){
 					$("html, body").animate({ scrollTop: 0 }, 1000);
 					$("#checkoutsuccess").show();
 					$("#checkoutsuccessmessage").html("<spring:message code="label.refnd_initiate"/>");
 					$("#prcdrefnd").hide();
 					$("#gotodash").show();
 				}else{
 					$("html, body").animate({ scrollTop: 0 }, 1000);
 					$("#checkouterror").show();
 					$("#checkouterrormessage").html(<c:out value="response"></c:out>);
 					$("#prcdrefnd").hide();
 					$("#gotodash").show();
 				}
 				  
 			}
 		});
 		
 	}
 	
 </script>
