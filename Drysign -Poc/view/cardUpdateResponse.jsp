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
	<div class="row">
		<div class="message-info module">
			<div class="heading">
				<h2> <c:out value="${error_description }"></c:out></h2>
			</div>
			
			<div class="row">
				<div class="col-md-12" style="padding: 20px 30px">
					<div class="row">
						<div class="col-md-6 col-xs-6 text-left"><spring:message code="label.succ_date"/></div>
						<div class="col-md-6 col-xs-6 text-right"><c:out value="${todayDate}"></c:out><!-- 12.24.2016  01:10 (UTC -08:00) --></div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-6 col-xs-6 text-left"><spring:message code="label.pay_detail"/></div>
						<div class="col-md-6 col-xs-6  text-right"><span id="username"><c:out value="${firstName}"></c:out>  <c:out value="${lastName}"></c:out></span></div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-6 col-xs-6 text-left"><spring:message code="label.comp_sts"/></div>
						
						<div class="col-md-6 col-xs-6  text-right"><spring:message code="label.succ"/></div>
					</div>
					
				</div>
			</div>
			
		</div>
	</div>
	<br>
	<div class="row text-center margTB20">
		<div class="col-md-12">
			<button onclick="dashboard();" type="submit" value="" class="btn btn-primary font-24"><spring:message code="label.go_to_dash"/></button>
		</div>
	</div>


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
			<br>
			<div class="row paddTB15">
				<div class="col-md-6 col-xs-6"><spring:message code="label.comp_sts"/></div>
				<div class="col-md-6 col-xs-6  text-right"><spring:message code="label.failed"/></div>
			</div>
			</div>
							
			</div>
		</div>
	</div>
	<div class="row text-center margTB20">
			<div class="col-md-12">
					<button onclick="profile();" type="submit" value="" class="btn btn-primary font-24"><spring:message code="label.go_to_profile"/></button>
			</div>
	</div>
  </div>

<jsp:include page="plan_footer.jsp" />

<script>

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
 

function dashboard(){
	window.location = $("#contextPath").val()+"app/dashboard";
}

function profile(){
	window.location = $("#contextPath").val()+"app/profile";
}

</script>
