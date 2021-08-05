<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.core.Authentication" %>
<% Authentication auth = SecurityContextHolder.getContext().getAuthentication(); %>
<% Registration registration = (Registration)auth.getPrincipal(); %>
<% 
String port = request.getServerPort()+"";
 if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>
<jsp:include page="header.jsp"></jsp:include>
<script src="<%=appUrl %>/js/jsapi.js"></script>
<style>

 .spacingcss{
 padding-right:14px;}
 .highcharts-background{
 fill:transparent !important;
 z-index:1000 !important;
 }
 .highcharts-container {
  z-index:1000 !important;
 
 }
 #message{
 width:100% !important;
 }
text.highcharts-title {
  
    font-size: 12px !important;
}
 p#requiredSignature {
   margin: 0;
    padding: 0;
    /* text-align: center; */
    position: absolute;
    text-align: right;
    float: right;
    /* margin: 5px 0; */
    width: 92%;
}
img#showSignature {  
    height: 128px; 
    padding: 5px;   
}
	canvas {
			position: relative;
			margin: 1px;
			margin-left: 0px;
			 border: 3px solid #2C3D4F;
			border-radius: 3px;
	}
	
	.selected {
    box-shadow: 9px 11px 28px -12px #080808;
}

.highcharts-yaxis-labels{
display: none;
}
.point{
cursor: pointer;
}

input:not([type]):focus:not([readonly]), 
input[type=text]:focus:not([readonly]), 
input[type=password]:focus:not([readonly]), 
input[type=email]:focus:not([readonly]), 
input[type=url]:focus:not([readonly]), 
input[type=time]:focus:not([readonly]), 
input[type=date]:focus:not([readonly]), 
input[type=datetime]:focus:not([readonly]), i
input[type=datetime-local]:focus:not([readonly]), 
input[type=tel]:focus:not([readonly]), 
input[type=number]:focus:not([readonly]), 
input[type=search]:focus:not([readonly]), 
textarea.materialize-textarea:focus:not([readonly]){
 border-bottom: 2px solid #2da2cc!important;
 border-top:none!important;
	     border-left:none!important;
	     border-right:none!important;
	    color: #40505B;
	    box-shadow: none;
	}
	
	.form-control:focus {
	    border-bottom: 2px solid #2da2cc!important;
	    outline: 0;
	    -webkit-box-shadow: none !important;
	    box-shadow: none !important;
}	

</style>
<div id="loader2" class="loader2" style="display:none">
	<div class="loaderdiv">
		 <p><img src="<%=appUrl %>/images/drysign_logo_mono.svg"></p>
		<p><img src="<%=appUrl %>/images/drysign-logo-line_only.gif" ></p> 		
		<p><spring:message code="label.wait"/></p>
	</div>
</div>


  <!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper bg_wrap newdashboard">
	  <div class="container-fluid">
                <!-- breadcrumb -->
                <ol class="breadcrumb">
                <li class="Groupsignhead"><spring:message code="label.help"/> |</li>
                    <li><a href="<%=appUrl %>/app/dashboard"><spring:message code="label.cat_home"/></a></li>
                      <li class="active"><spring:message code="label.help"/></li>
                </ol>
            </div>
	<!-- Main content -->
	 <div class="container-fluid">
	<div class="Content-wh-module col-md-12">
		<div class="responsiveTabs help_headerborder">
		
	<div class="head3_0 help_header"><spring:message code="label.training"/></div>
	<div class="training_list col-md-12">
	<ul>
		<li><a href="<%=appUrl %>/app/helpVideo"><spring:message code="label.training_vid"/></a></li>
	</ul>
	</div>
	</div></div>
	</div>
 </div>
<jsp:include page="footer.jsp"></jsp:include>

<canvas id='blank' style='display:none'></canvas>
 <div class="overlay-bg"></div>
    <script src="<%=appUrl %>/js/highcharts.js"></script>
    <script src="<%=appUrl %>/js/highcharts-more.js"></script>
    <script src="<%=appUrl %>/js/solid-gauge.js"></script>
    
<script src="<%=appUrl %>/js/custom-file-input.js"></script> 
<script src="<%=appUrl %>/js/jquery.validate.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.12/d3.min.js"></script> 
<script>

$(document).ready(function(){
	
	
	var title='${title}';
	if(title=='Help'){
		
		$("#helpSidebar").addClass('active');
	}
  	 	
});
</script>
