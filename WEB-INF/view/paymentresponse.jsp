<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <jsp:include page="plan_header.jsp" />
<% 

String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>
<input type="hidden" id="contextPath" value="<%=appUrl %>/" />
<div class="container-fluid pricing_website" id = "Success" style="display:none">
 
	<div class="row ">
		<div class="message-info">
			<h3 style="text-align:center;">
			<spring:message code="label.pamt_resp"/> <spring:message code="label.US$"/> <span id="price"><c:out value="${price}"></c:out></span> <spring:message code="label.resp_success"/> <c:out value="${todayDate}"></c:out></h3>
			
		</div>
	</div>
	
	<div class="row">
		<div class="message-info module">
			<div class="heading">
				<h2><spring:message code="label.general_purchase"/></span> </h2>
			</div>
			
			<div class="row">
			<div class="col-md-12" style="padding: 20px 30px">
			<div class="row">
				<div class="col-md-6 col-xs-6 text-left"><spring:message code="label.succ_date"/></div>
				<div class="col-md-6 col-xs-6 text-right"><c:out value="${todayDate}"></c:out><!-- 12.24.2016  01:10 (UTC -08:00) --></div>
			</div>
			<div class="row">
				<div class="col-md-6 col-xs-6 text-left"><spring:message code="label.pay_detail"/></div>
				<div class="col-md-6 col-xs-6  text-right"><span id="username"><c:out value="${firstName}"></c:out>  <c:out value="${lastName}"></c:out></span></div>
			</div>
			<div class="row">
				<div class="col-md-6 col-xs-6 text-left"><spring:message code="label.txnid"/></div>
				
				<div class="col-md-6 col-xs-6  text-right"><c:out value="${transactionid}"></c:out></div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-md-6 col-xs-6 total text-left" style="color:#40505b"><spring:message code="label.tot"/></div>
				<div class="col-md-6 col-xs-6 text-right total-amt"  style="color:#40505b"><spring:message code="label.US$"/> <span id="price1"><c:out value="${price}"></c:out></span></div>
				
				</div>
			</div>
							
			</div>
			<img class="stampimg" src="images/1.0/stamp.png"/>
		</div>
	</div><br>
	
	

	<h4 style="text-align:center;"><spring:message code="label.cnfrmemail"/> <b><span id="email"><c:out value="${email}"></c:out></span></b>.</h4>
	<br>
	<div id="verifydisplay"style="display:none;">
	<p>
	<h4 style="text-align:center;"><spring:message code="label.verif_link"/><b> <spring:message code="label.verif_link_c"/></b> 
	</h4>
	</p>
	</div>
	
	
	<div class="row text-center margTB20">
				<div class="col-md-12">
					<button onclick="logoutyes();"  id="gotobtn" type="submit" value="GO to dashboard" class="btn btn-primary font-24"><spring:message code="label.logintoDrySign"/></button>
				</div>
	</div>
			

 <br>

</div>

<div class="container-fluid pricing_website" id = "failed" style="display:none">
	<div class="row">
		<div class="message-info module">
			<div class="heading">
				<h2> <c:out value="${error_description }"></c:out></h2>
			</div>
			
			<div class="row">
			<div class="col-md-12" style="padding: 20px 30px">
				<div class="row">
					<div class="col-md-6 col-xs-6"><spring:message code="label.succ_date"/></div>
					<div class="col-md-6 col-xs-6 text-right"><c:out value="${todayDate}"></c:out><!-- 12.24.2016  01:10 (UTC -08:00) --></div>
				</div>
			
			<div class="row paddTB15">
				<div class="col-md-6 col-xs-6"><spring:message code="label.comp_sts"/></div>
				<div class="col-md-6 col-xs-6  text-right"><spring:message code="label.failed"/></div>
			</div>
			</div>
							
			</div>
		</div>
	</div>
	<div class="row text-center margTB20">
	<c:choose>
		<c:when test="${microsite == true }">
			<div class="col-md-12">
					<button onclick="microsite();" type="submit" value="" class="btn btn-primary font-24"><spring:message code="label.goToHome"/></button>
			</div>
		</c:when>
		<c:otherwise>
			<div class="col-md-12">
					<button onclick="dashboard();" type="submit" value="" class="btn btn-primary font-24"><spring:message code="label.gotoDashbord"/></button>
			</div>
		</c:otherwise>	
	</c:choose>	
	</div>
  </div>

<input type="hidden" id="status" value="<c:out value="${status}"></c:out>" />
<input type="hidden" id="error_description" value="<c:out value="${error_description}"></c:out>" />
<input type="hidden" id="transactionid" value="<c:out value="${transactionid}"></c:out>" />
<input type="hidden" id="referenceid" value="<c:out value="${referenceid}"></c:out>" />
<input type="hidden" id="payment_method" value="<c:out value="${payment_method}"></c:out>" />
<input type="hidden" id="card_token_id" value="<c:out value="${card_token_id}"></c:out>" />
<input type="hidden" id="card_last_four" value="<c:out value="${card_last_four}"></c:out>" />
<input type="hidden" id="card_type" value="<c:out value="${card_type}"></c:out>" />
<jsp:include page="plan_footer.jsp" />

<script>
var signupPayment="${signupPayment}";
if(signupPayment=="true"){
//	$("#gotobtn").html("Login Again");
	$("#gotobtn").html("Login to DrySign");
}

$(document).ready(function(){
	var status="${status}";
	
	if("SUCCESS"==status){
		$("#Success").show();
		//sendUserDetails();
	}
	else{
		//sendUserDetails();
		$("#failed").show();
	}
 });
 

function logoutyes(){
	window.location = $("#contextPath").val()+"login";
}

function dashboard(){
	window.location = $("#contextPath").val()+"app/dashboard";
}

function microsite(){
	window.location = $("#contextPath").val()+"index";
}
</script>
