<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.core.Authentication" %>
<%@ page import="com.drysign.model.Features, com.drysign.model.SB_Plan"%>
<%@ page language="java" import="java.io.*,java.util.*" %> 
<%@ page import = "java.util.ResourceBundle" %>
<% Authentication auth = SecurityContextHolder.getContext().getAuthentication(); %>
<% Registration registration = (Registration)auth.getPrincipal(); %>
 <% 
 ResourceBundle resource = ResourceBundle.getBundle("commonsutils");
 String upgradePricing =resource.getString("msupgrade.pricing");
String port = request.getServerPort()+"";
 if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>
  <jsp:include page="header.jsp"></jsp:include>
<%-- <link href="<%=appUrl %>/css/materialize.css" rel="stylesheet"/> --%>
<%--<link rel="stylesheet" href="<%=appUrl %>/css/inner_page.css"/>--%>
<!-- <script src="https://www.google.com/jsapi?key=AIzaSyC4z1UzNEEZXpOGf547C0XifZ0HagRx64w"></script> -->
<script src="https://apis.google.com/js/client.js?onload=initPicker"></script>
  <script src="<%=appUrl %>/js/jsapi.js"></script>
  <%-- <script src="<%=appUrl %>/js/initPicker.js"></script> --%>
  <script src="<%=appUrl %>/js/signaturepad.js"></script>
  
 <style>
 img#imgflage {
    position: absolute;
    top: 16px !important;
    left: 21px;
    /* width: 24px; */
    margin-right: 5px;
    }
 #draw .margB20{
 box-shadow:none !important;
 }

#freeVersionBlock{
display:none;
}
 #upload .margB20{
 box-shadow:none !important;
 }
.margB20 {
    box-shadow:2px 2px #e1e2e3;
    }
 #feedbackform label{
 float:left;}
 .error{
 float:left;}
 .model_content_center{
 text-align:center;}
 .modal_header_left{
 text-align:left;}
 #container{
 padding-top:10px !important;}
  #container2{
 padding-top:10px !important;}
   #container3{
padding-top:10px !important;}
 .dots{
 margin-bottom:5px;
}
 .greendot{
background:#d089d7;
/* padding:0.1px 8px; */
width:10px;
height:10px;
display:inline-block;
border-radius:50px;
margin-right:5px; }

 .bluedot{
background:#82d5f5 ;
/* padding:0.1px 8px; */
width:10px;
height:10px;
display:inline-block;
border-radius:50px;
margin-right:5px; }
.pinkdot{
background:#D71996;
/* padding:0.1px 8px; */
width:10px;
height:10px;
display:inline-block;
border-radius:50px;
margin-right:5px;
}
.graydot{
background:#6e7881;
/* padding:0.1px 8px; */
width:10px;
height:10px;
display:inline-block;
border-radius:50px;
margin-right:5px;
}
.highcharts-legend{
display:none !important;}
 .spacingcss{
 padding-right:14px;}
 .highcharts-background{
 fill:transparent !important;
 z-index:1000 !important;
 }
/*  .highcharts-container {
  z-index:1000 !important;
 
 } */
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
    float: right;
    /* margin: 5px 0; */
    /*width: 92%;*/
}
img#showSignature {  
	 padding: 5px;
     display:none;
     filter: blur(0px);

 	   /* height:128px; */
      /*  padding: 5px; */
   /*  margin: 3px; */
   /*  width: 97%; */
    /* width:70%;  */

}
#show_signature{
	height: 104px;
	/*display:flex;*/
	} 
	canvas {
			position: relative;
			margin: 1px;
			margin-left: 0px;
			 border: 3px solid #2C3D4F;
			border-radius: 3px;
	}
	<%--  .loader2 {
    position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 99999;
	background: rgba(16, 16, 16, 0.69);
	background: url('<%=appUrl %>/images/ajax-loader_1.gif') 50% 50% no-repeat rgba(43, 40, 40, 0.37);
 } --%>
	
	.selected {
    box-shadow: 9px 11px 28px -12px #080808;
}

.highcharts-yaxis-labels{
display: none;
}
.point{
cursor: pointer;
    top: 4px;
    position: relative;
    padding: 6px;
}

	
	.form-control:focus {
	    /*border-bottom: 2px solid #2da2cc!important;*/
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
	<!-- Main content -->
	<div class="container-fluid">
		<div class="row" id="dashboard2">
		<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 nopadding box_Card">
		<div class="col-lg-12 col-md-4 col-sm-4 col-xs-12">
                        <div class="Content-wh-module margB20" >
                            <div class="head3_0">
                               <%-- <b>  <spring:message code="label.welcm"/> <c:out value="${fulnme}"></c:out></b> --%>
                             <b><spring:message code="label.signdoc"/></b>
                            </div>
							<div class="row">
								<div class="col-md-6 col-sm-6 col-xs-6 text-center">
									<div class="dash-icon">
								<a href="<%=appUrl %>/app/document/selfsign"><img  class="selfsign" src="<%=appUrl %>/images/self_sign.svg"/></a>					
									</div>
									<a href="<%=appUrl %>/app/document/selfsign"rel="tooltip" title="<spring:message code="label.add_your_sign"/>" data-original-title="<spring:message code="label.self_title"/>" ><b><spring:message code="label.selfsign"/></b></a>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-6 text-center">
									<div class="dash-icon">
										<a href="<%=appUrl %>/app/document/groupsign"><img class="groupsign" src="<%=appUrl %>/images/group_sign.svg"/></a>
									</div>
									<a href="<%=appUrl %>/app/document/groupsign"  rel="tooltip" title="<spring:message code="label.request_sign_spe_group"/>" data-original-title="<spring:message code="label.grp_title"/>"><b><spring:message code="label.grp_sgn"/></b></a>
								</div>
							</div>
							<%-- <p style="text-align:center; margin: 0"><spring:message code="label.upload-doc"/></p> --%>
                  </div>
            </div>
                  <div class="col-lg-12 col-md-4 col-sm-4 col-xs-12">
			
				<div class="Content-wh-module margB20">
				<div class="row">
				<div class="col-md-4 col-sm-3 col-xs-3">
					<div class="head3_0">
						<b><spring:message code="label.slf_sign"/></b>
					</div>
					</div>
					<div class="col-md-8 text-right">
						<%-- <button  id="openSignature" class="btn-link"><spring:message code="label.crtsign"/></button> --%>
						<button  id="openSignature" class="btn-link"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
						<span id="subscription_status_msg" style="color:red"></span>
						<!-- <a href="#" class="pull-right font-16 btn btn-green">USE NOW</a> -->
					</div>
					</div>
					<c:set var="mysignature" value="${signature}"/>
					<c:set var="signatureType" value="${signatureType}"/>
					<c:choose> 
					  <c:when test="${mysignature == null}">
					    <figure id="show_signature">
					    <img class="img-responsive" id="showSignature" src="<%=appUrl %>/images/signature_new.png">
						<!-- <img class="img-responsive" id="showSignature"  src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIgAAACICAYAAAA8uqNSAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAABrhJREFUeNrsnUtO40oUhp2IKZJ7iIR0fVfQ6SkTzAoaVkBYQScrCFlByAoIK0hYAcmEKYnEhFG7J0hMuEZs4NZpjhu342dwVTiu/0hWQxpXJVVf/vOosu04sNJ2fn7u2faZ25j20nD01D83AASWBsel+mekjqVtn30H058LhstgdPmlBQCBxeEgl9KJvTy3bRxaQKE0HKF6/QtiEMCRBoeV6gFA1uEgKO5S4LAy/kAMsg4HKYeb8SdWKghikHJwWBl/wMWUg8Na9bAekJJwWBt/WA1IBTisVpAW4Cg0a+MPKxUkVudwS55irXpYB8gGcFgdf1gFSE6FtMhmAARwZNlEnRsAkObb5QZw0N6PvmO5NT6L4c0+3Q3gOFLnhgCk2XDQZp9ehVMIiLE6LgBHw12MmuBuBTgoED3heseFOnz18zHwaKiCqMn1neINxgTFtTooCPXUcUhg8M9kQ9XOue2A7DQQDgpGpxnuYxb7mUAgF4TlfVsUhNPZu5gKRBbw4ZeNRWwurzdZQW5S4HD4Na9CO1CPpgWpnM52amruGmg0CBC+6q1bY5MzoNGQGKRkxlLF5qrNI6DRAAXhi6mnNTcL99IEQDhjmTrVlu7hXixSkFGNQWlkS9tXbxsBCJfRuxqavgISwgHhSulIU/NwL5KzmA9s/CkFh2r/BEjIVpCRJjiQvUgHRGPcQRbCvQh2MVzvuNOQ0kZGe0/PgINcBZlqhAPZi2QF4U07A41dBKqLf4GCQAXhlHaguZsxMBAISKyUrtsmwECmgpByeLrhwO51gYDwEn7PQFcITqUFqTn7Sus2Wpj7BgTkKYgJ14LgVKKCaNgdhtS2YQoyMtQPYg9pgHBBrGOgK8paLjD1glwMr7X8NNQdLqkUqCCXBvuaYNoFAcJX0fum4MCeU0GAcM3DpHoMMeWyFISqpa6hvqAekgDhwHRgsEuohzAFMRqYQj0EAcIVU1OBKdU9+phqWQpiUj3GWNIXBAjfqsEzqB6omn7AWobhoIzlp8HMpa/6BCCCFMRkWhsADkGAcFr7w+Bnw3UuwhRkYFA96C5Bc0yvEEBYPbpQDwCSpx6mbIiimCBADKtHgLRWnoKYVI8+imL1mtY6iOGdYrgBjEAFMaUeIQJTYQpiWD1QMRWoIKbUYw44hAFiMHOBaxGqIKZK6qh5SItBDK7YImsRqiAmVmzhWgQDcmrgfZ+hICYQEL6Xqaf5PdMzbXFPU6EKojs4pZQWG5AlAsI71XVenU+PS0dQKlhBdMYeFG+cIO4QmuZqLqsTFEeqjyWmS66CdAEHANmGe+kDDuEuhu/voeOOyFTrmGCK5CvIKeCAgtQVnIacrubZGIWwz2M7Hzz/OOf/5gzDynm7qzFiCQtdTFbldMlq8QtwWOpi+FkudyX/nNRkiKvd7FKQKusuvjpuFCAjDLk9gBxvcE5PQXKJYW84IFz7cA2CBROmIJvUPihopTsN4ikLTQ5Sec/pfxXBoGezXGA1Vp5tUgcp6yIC5+2xGwDDMkC+lwBjiFK5hS6mwL0ADChIqnsBGAAk073QLa5xfQrS3EwFwQ5zAPIn/kjCMUN2AkDy3Ms1hg+AxM1PKgiGD4BE7oWW9j24FwBSNjhdYOgASF78AfdiiRVWUlOqp7SF8BuGDgqSFZzOMWwAJG6Hid+vMGwAJCtADbBDHYDE4w8vmd5iyABIXvyB9BaAZMYfIS6JBCBJ68C92G07OfGHGwHy+vrqvLy8YHEOgKzHH4+Pj87Dw0O4WCygIADkb/dyf3//GxC4FwCyZqvV6vDp6Sn6dYyhQpD6lyk4ogB1eXt7i+IYAHm3g4MDgsOFesDaBeltiPgDgKSZF6mHci/YOQZA1iyqoOJZcAAk08VMoB6wdkqA6nKAOsTwwNo56hFgeGDtjAAVu8ZgmYCcYlhgRUGqj6GBkaWtxVDsMVDBKpXYt1okU+/Bc95rMn5KGh43yriutv2em2atjCzmJgpWedDnNU98vJQfTfw/GTBUsVC91y+YVo2AxCChuyJ3Yy/P+Vu6SrwWBbZeSlNfYyDEoSicaOf9qRCLmLIF3AYd3xkkN3bOGRTEACAJiT/mie44mz3VMqk+ixSXFqXUy7zinHo/BG0vcS61f/0ZweAvWt6YuSXH9LBi17nt7u3tOfv7++Hu7u7vL+FyuQyfn5/piz9Lrty3avrQHf4GB0WT/IHB9tn1RWpBQPxKgazIqihZmcmp2l6eRU/JSKrpKudLVardTeek5QgxBnO6hQwrbdKy1LDwnLrjua26mE8MS52QhNgQlW3/CzAAosk+CcVV4OUAAAAASUVORK5CYII=" />	-->					
						</figure>
					  </c:when>
					  <c:when test="${signatureType == 'Type'}">
					    <figure id="show_signature" >
						<img class="img-responsive name" id="showSignature"  src="<c:out value="${signature}"></c:out>" />						
						</figure>
					  </c:when>
					  <c:otherwise>
					   <figure id="show_signature">
						<img class="img-responsive draw" id="showSignature"  src="<c:out value="${signature}"></c:out>" />						
						</figure>
					  </c:otherwise>
					</c:choose>
					
				</div>
				
				</div>
				<div class="col-lg-12 col-md-4 col-sm-4 col-xs-12">
				
				<div class="Content-wh-module margB20 safari_only">
				<div class="col-md-12  col-xs-12 nopadding">
					<div class="head3_0 head3_3Feedback">
						<b><spring:message code="label.share"/></b>
					</div>
					
					<div class="row">
					<div class="col-xs-12">
						<!-- <a href="#" class="blue-text-link font-14" data-toggle="modal" data-target="#feedbackModal" data-backdrop="static" data-keyboard="false"><spring:message code="label.signexpe"/></a> -->
						<span class="font-14" ><spring:message code="label.signexpe"/></span>
					</div>
					</div>
					<form id="emojiform">
					<div class="col-md-12 col-sm-12 col-xs-8 nopadding">
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 nopadding">
 						 <input type="radio" name="smiley_dashboard" value="poor" class="emoji_popup1-checkbox" id="emoji_popup1-checkbox1">
  							<label class="emoji_popup1" for="emoji_popup1-checkbox" data-toggle="modal" data-backdrop="static" data-keyboard="false"  data-target="#feedbackModal"></label>	
				</div>
				 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 nopadding">
 						 <input type="radio" name="smiley_dashboard"  value="unsatisfactory " class="emoji_popup2-checkbox" id="emoji_popup2-checkbox2">
  							<label class="emoji_popup2" for="emoji_popup2-checkbox" data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#feedbackModal"></label>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 nopadding">
 						 <input type="radio" name="smiley_dashboard"  value="satisfactory" class="emoji_popup3-checkbox" id="emoji_popup3-checkbox3">
  							<label class="emoji_popup3" for="emoji_popup3-checkbox" data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#feedbackModal"></label>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 nopadding">
 						 <input type="radio" name="smiley_dashboard"  value="good" class="emoji_popup4-checkbox" id="emoji_popup4-checkbox4">
  							<label class="emoji_popup4" for="emoji_popup4-checkbox" data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#feedbackModal"></label>
					</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 nopadding">
						<input type="radio" name="smiley_dashboard"  value="very good" class="emoji_popup5-checkbox" id="emoji_popup5-checkbox5">
  							<label class="emoji_popup5" for="emoji_popup5-checkbox" data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#feedbackModal"></label>
					</div>
					</div>
		</form>
					</div>
					<%-- <div class="col-md-4 col-xs-3 feedback_img">
					   <img class="img-responsive" src="<%=appUrl %>/images/feedback.png">
					</div> --%>
				</div>
				
			</div>
            </div>
            <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12 nopadding">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="Content-wh-module margB20" style="min-height:202px;">
								<%-- <div class="head3_0">
									<b><spring:message code="label.docoverview"/></b>
								</div> --%>
								<div class="row">
									<div class="col-md-6 col-xs-12 col-sm-6">
										<div class="head3_0">
											<b><spring:message code="label.sent"/></b>
										</div>
										<div id= "sentZero" class="col-md-6 col-sm-6 col-xs-6 zerodocument_main" style="display:none">
											 	<div class="zeroDocument"><span>0 <br/><spring:message code="label.document"/></span></div>
										</div>
										<div class="col-md-6 col-sm-6 col-xs-6 nopadding documentSent setContainer_Parent" style="display:none">
											<div id="sentContainer" style="min-width: 170px;height:140px; margin: 0 auto;overflow:hidden;display:none"></div>
										</div>
										<div class="col-md-6 col-sm-6 col-xs-6 describeGraph">	
											<span class="pinkdot"></span><a href="<%=appUrl %>/app/myfiles?tab=completed"><span class="dotstyleguide"><spring:message code="label.complted"/> (${completed}) </span></a><br/>
											<span class="bluedot"></span><a href="<%=appUrl %>/app/myfiles?tab=outforsign"><span class="dotstyleguide"><spring:message code="label.dash_outdoc"/> (${outForSignature})</span></a><br/>
											<span class="greendot"></span><a href="<%=appUrl %>/app/myfiles?tab=draft"><span class="dotstyleguide"><spring:message code="label.dash_draft"/> (${draft})  </span></a><br/>
											<span class="graydot"></span><a href="<%=appUrl %>/app/myfiles?tab=rejectlist"><span class="dotstyleguide"><spring:message code="label.rejected"/> (${SentReject})</span></a><br/>
										</div>
									</div>
									<div class="col-md-6 col-xs-12 col-sm-6 receiveZero">
										<div class="head3_0">
											<b><spring:message code="label.recved"/></b>
										</div>
										<div id= "receivedZero" class="col-md-6 col-sm-6 col-xs-6 zerodocument_main" style="display:none">
											 	<div class="zeroDocument"><span>0 <br/><spring:message code="label.document"/></span></div>
										</div>
										<div class="col-md-6 col-sm-6 col-xs-6 nopadding documentSent1" style="display:none">
											<div id="receivedContainer" style="min-width: 170px;  min-height:140px; margin: 0 auto;display:none"></div>
										</div>
										<div class="col-md-6 col-sm-6 col-xs-6 describeGraph">	
											<span class="greendot"></span><a href="<%=appUrl %>/app/myfiles?tab=signed"><span class="dotstyleguide"><spring:message code="label.sgned"/> (${signed}) </span></a><br/>
											<span class="bluedot"></span><a href="<%=appUrl %>/app/myfiles?tab=pending"><span class="dotstyleguide"><spring:message code="label.pnding"/> (${pending})</span></a><br/>
											<span class="graydot"></span><a href="<%=appUrl %>/app/myfiles?tab=rejectlist"><span class="dotstyleguide"><spring:message code="label.rejected"/> (${ReceivedReject})</span></a><br/>
										</div>
									</div>
								</div>
                        </div>
                    </div>
                        <div id="freeVersionBlock">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        	<div class="Content-wh-module margB20 newstyleguide_cls" style="min-height:227px;">
									<div class="head3_0 ">
										<b>Free Version</b>
									<!-- <a href="#"> Change Plan </a> -->
									</div>
									<div class="col-md-6 col-sm-6 col-xs-6 nopadding" >
									<div id="docContainer" style="min-width: 170px;  min-height:150px; margin: 0 auto"></div>
									</div>
									<div class="col-md-6 col-sm-6 describeGraph">
									
					  		 			<span class="greendot"></span><span class="dotstyleguide"><spring:message code="label.consumed"/> &nbsp;  </span><br/>
										<span class="bluedot"></span><span class="dotstyleguide"><spring:message code="label.remainig"/></span>
				  		
				  		 			</div>
								
								</div>
								</div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
								<div class="Content-wh-module margB20 newstyleguide_cls" style="min-height:101px;">
									<div class="head3_0 col-sm-12">
										<b><spring:message code="label.indPlan"/></b>
										</div>
										<div class="col-md-7 col-sm-7 col-xs-7">
										<h4><span class="documentEighty">${INDIVIDUAL}</span><spring:message code="label.docmts"/> </h4>
										</div>
										<div class="col-md-5 col-sm-5 col-xs-5">
										<%--<a id="indUpgrade" style="font-size: 16px;"  class="btn btn-blue">Upgrade</a> --%>
										 <a href="<%=appUrl %>/plans?category_name=General%20Plans&category=1" id="indUpgrade" style="font-size: 16px;"  class="btn btn-blue"><spring:message code="label.upgrade"/></a>
										</div>
									
									</div>
									
									<div class="Content-wh-module margB20 newstyleguide_cls" style="min-height:101px;">
									<div class="head3_0 col-sm-12">
										<b><spring:message code="label.profPlan"/></b>
										</div>
										<div class="col-md-7 col-sm-7 col-xs-7">
										<h4><span class="documentEighty">${PROFESSIONAL}</span><spring:message code="label.docmts"/> </h4>
										</div>
										<div class="col-md-5 col-sm-5 col-xs-5">
										<%--<a  id="profUpgrade" style="font-size: 16px;"  class="btn btn-blue">Upgrade</a>--%>
										 <a href="<%=appUrl %>/plans?category_name=General%20Plans&category=1" id="profUpgrade" style="font-size: 16px;"  class="btn btn-blue"><spring:message code="label.upgrade"/></a> 
										</div>
										
									</div>
								</div>	
		</div>
                         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 " id="subscriPlan" style="display:none">
		
		                        <div class="Content-wh-module margB20 newstyleguide_cls" style="min-height:227px;">
		                        <div class="row">
								<div class="head3_0 col-md-12" style="z-index: 1;position: relative;">
								
								<div class="col-md-12 col-xs-12">
					 				<span class="pull-right"> 
						 				<!-- when plan needs to upgrade/renew -->
											<c:if test="${(upgrade == 'true' || upgrade == 'TRUE') && activePurchase.subscription.planId != 48}">
												<c:choose>
								   				 <c:when test="${isInternalEmail=='true' && activePurchase.subscription.planId != 48}">
								     				<a href="#" style="font-size: 16px;"  onclick ="renew()" class="btn pull-left btn-blue newuser"><spring:message code="label.dash_renw"/></a>
								   				 </c:when>
								   				 <c:when test="${activePurchase.subscription.planId != 48 && clientID != 0}">
								     				
								   				 </c:when>
								   				 <c:when test="${activePurchase.planName != 'Free Trial India' && countryCode == 'IN'}">
								   				 <!-- firstName, lastName, email, phone and isRegister -->
								     				<a href="<%=upgradePricing %>?isRegistered=true&firstName=${fristName}&lastName=${lastName}&phone=${phone}&email=${email}&planName=${activePurchase.planName}" style="font-size: 16px;"  class="btn pull-left btn-blue newuser"><spring:message code="label.plans_buynow"/></a>
								   				 </c:when>
								   				 <c:otherwise> 
								       				<a href="<%=appUrl %>/plans?category_name=General%20Plans&category=1" style="font-size: 16px;"  class="btn pull-left btn-blue newuser"><spring:message code="label.plans_buynow"/></a>
								    			 </c:otherwise>
												</c:choose>
											</c:if>
										<!-- before upgrade/renew plan -->
											<c:if test="${upgrade == 'false' && upgrade == 'FALSE' && activePurchase.subscription.planId != 48}">
												<c:choose>
												    <c:when test="${isInternalEmail=='false' && activePurchase.planName != 'Free Trial India' && countryCode != 'IN'}"> <!-- changed condition for india launch -->
												     	<a href="#" style="font-size: 16px;"  class="btn pull-left btn-blue newuser" onclick="planTemp();"><spring:message code="label.vewplan"/></a>
												    </c:when>
												    <c:when test="${isInternalEmail=='false' && activePurchase.planName == 'Free Trial India' && countryCode == 'IN'  &&  clientID == null}">
								       					<a href="<%=upgradePricing %>?isRegistered=true&firstName=${fristName}&lastName=${lastName}&phone=${phone}&email=${email}&planName=${activePurchase.planName}" style="font-size: 16px;"  class="btn pull-left btn-blue newuser"><spring:message code="label.plans_buynow"/></a>
								    			    </c:when>
								    			    <c:when test="${isInternalEmail=='false' && activePurchase.planName == 'Free Trial India' && countryCode == 'IN'  &&  clientID == 0}">
								       					<a href="<%=upgradePricing %>?isRegistered=true&firstName=${fristName}&lastName=${lastName}&phone=${phone}&email=${email}&planName=${activePurchase.planName}" style="font-size: 16px;"  class="btn pull-left btn-blue newuser"><spring:message code="label.plans_buynow"/></a>
								    			    </c:when>
												 </c:choose> 
											</c:if>
										
									</span> 
									</div>
								</div>
								</div> 
							<div class="row" id="mapcss">
							<%-- <div class="col-md-12">
										<b><c:out value="${activePurchase.planName}"></c:out></b>
							</div> --%>
								 <div id = "docContainerDiv" class="col-md-6 col-sm-6 col-xs-12">
								 <div class="head3_0">
										<b id ="planIndian"><c:out value="${activePurchase.planName}"></c:out></b>
									<!-- <a href="#"> Change Plan </a> -->
									</div>
								 <div class="col-md-6 col-sm-6 col-xs-6 nopadding">
	
									<div id="docContainer2" style="min-width: 170px;  min-height:150px; margin: 0 auto"></div>
									</div>
									<div class="col-md-6 col-sm-6 col-xs-6 dotsMargin describeGraph">
									
					  		 			<span class="greendot"></span><span class="dotstyleguide"><spring:message code="label.consumed"/> &nbsp;  </span>
					  		 			<br/>
										<span class="bluedot"></span><span class="dotstyleguide"><spring:message code="label.remainig"/></span>
								
								</div>
								
								</div>
							
								<div id = "daysContainerDiv" class="col-md-6 col-sm-6 col-xs-12">
								<div class="head3_0">
					  		 			<br/>
				  		 			</div>	
								<div class="col-md-6 col-sm-6 col-xs-6 nopadding">
								
									<div id="daysContainer" style="min-width: 170px; height: 150px; margin: 0 auto"></div>
									</div>
									
										<div class="col-md-6 col-sm-6 col-xs-6 dotsMargin describeGraph">
										<!-- <b>Consumed:</b> -->
											<span class="greendot"></span><span class="dotstyleguide"><spring:message code="label.consumed"/> &nbsp;  </span>
											<br/>
											<span class="bluedot"></span><span class="dotstyleguide"><spring:message code="label.remainig"/></span>
										</div>
									</div>
							</div>
                        </div>

                    </div>
			
			</div>
		</div>
	</div>
 </div>
<jsp:include page="footer.jsp"></jsp:include>
<!-- Draw Signature -->
  <div class="signature-sign">
	 <div class="header">	 	
		 <a class="close" href="#"><span class="icon-close"></span></a>
	 </div>
	 <ul class="nav nav-tabs self-sign">
			<li id="sDraw"><a href="#draw" data-toggle="tab"><spring:message code="label.drw"/></a>
			</li>
			<li id="sType">
       		 <a  href="#type" data-toggle="tab"><spring:message code="label.type"/></a>
			</li>
			<li id="uType">
       		 <a  href="#upload" data-toggle="tab"><spring:message code="label.upld"/></a>
			</li>
			
	</ul>
	<div class="tab-content self_sing_tab ">
			<div class="tab-pane" id="draw">
<!-- 				<div class="row margTB20"> -->
					 
<!-- 				 </div> -->
				 <div class="row margB20">
					  <div class="col-xs-12 text-right">
						<!--   <a class="btn btn-light" onclick="zkSignature.clear()" href="#">Clear</a>
						   <a class="btn btn-blue" id="saveSignature" href="#">Save</a> -->
 <button class="btn btn-light"  id="clearSignaturepad"><spring:message code="label.clr"/></button>						   
	<button class="btn btn-blue" id="saveSignaturepad"><spring:message code="label.save"/></button>
   
   
					  </div>
				  </div>
				  
				  
					
						
	<div class="wrapper" style="background-color: #fcfcfc">
    <canvas id="signaturepad" class="signature-pad" width=310 height=200></canvas>
  </div>
						
		 <div id="requiredSignature" class="alert alert-danger alert-dismissible" style="display:none;tect-align:left;"><i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i> <spring:message code="label.drw_sign"/> <a data-hide="alert" aria-label="close" onClick="$('#requiredSignature').hide();">&times;</a></div>			
					
				</div>
				<div class="tab-pane" id="upload">
         		 <div class="row margTB20">
				 </div>
				 <div class="row margB20">
					  <div class="col-xs-12 text-right">
					    <a class="btn btn-light"  href="#" onclick="clearUploadSignature();"><spring:message code="label.clr"/></a>
						   <a class="btn btn-blue"  href="#" onclick="saveUploadSignature();"><spring:message code="label.save"/></a>
					  </div>
				  </div>
				  <div class="row margTB20" id="show_upload_signature">
				   <div class="col-xs-12 head3_0 text-center">
				   	
				   <spring:message code="label.upld_pic"/>
				  
				   </div>
				    	<br> 	<br>
					  <div class="col-xs-12 text-center">
					  	<div id="upload_signature">
							
							   <label class="btn-bs-file">
                					<i class="fa fa-upload point" aria-hidden="true"></i>
                				<input type='file' id="imgInp" class="demoInputBox" accept=".png, .jpg, .jpeg, .bmp" />
            					</label>
							   <c:forTokens items="${features1}" delims="," var="feature1">
							 <c:if test="${feature1 eq 1 }">
							    <button data-toggle="tooltip" class="red-tooltip" data-placement="top" title="Google Drive" type="submit" class="" id="googlePic"style="border: 0;background: transparent;right: -20px; padding:6px; margin: 0;height: 36px;top: 8px;">
								<img src="<%=appUrl %>/images/Drive.png" width="20" height="20" alt="submit" />
								</button>
								</c:if>
								<c:if test="${feature1 eq 2 }">
								<button data-toggle="tooltip" class="red-tooltip" data-placement="top" title="Dropbox" type="submit" class="" id="dropbox1"style="border: 0;background: transparent;right: -50px; padding:6px; margin: 0;height: 36px;top: 8px;">
								<img src="<%=appUrl %>/images/Dropbox.svg" width="20" height="20" alt="submit" />
								</button>
								</c:if>
								<c:if test="${feature1 eq 3 }">
								<button data-toggle="tooltip" class="red-tooltip" data-placement="top" title="OneDrive" type="" class="" id="onedrive1" onclick="launchOneDrivePicker()" style="border: 0;background: transparent;right: -90px; padding:6px; margin: 0;height: 36px;top: 8px;">
								<img src="<%=appUrl %>/images/Cloud.svg" width="25" height="25" alt="submit" />
								</button>
								</c:if>
							 </c:forTokens>
								
								<!-- Egnyte -->
							<!--	<button onclick="return openEgnyteWindow('document/egnyteSign')" data-toggle="tooltip" class="red-tooltip" data-placement="top" title="egnyte" type="submit" class="" id="egnyte1" style="border: 0;background: transparent;right: -128px; padding: 0; margin: 0;height: 36px;top: 8px;">
									<img src="<%=appUrl %>/images/egnyte.png" width="20" height="20" alt="submit" />
								</button>-->
							 
							
						</div>
						
					 </div>
					  <div class="col-xs-12 text-center">
					  <br><br>
				   		<p class="text-warning" ><spring:message code="label.file_sz"/></p>
				   		<p class="text-warning"><spring:message code="label.file_frmt"/></p>
				   	</div>
					</div>
					 <div class="row margTB20" id="show_upload_error_signature">
					  	
					  	<div class="alert alert-danger"  id="file_error" style="display:none"> </div>
					 </div>
					  <div class="col-xs-12 text-center">
					 <img id="blah" src="" class="img-thumbnail" width="750px" height="186px"  alt="" style="display:none"/>
					 </div>
				</div>
			  <div class="tab-pane" id="type">
				  <div class="row margTB20">
						<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="input-field">
						<label for="last_name" class="dashboard_typeName"><spring:message code="label.ur_name"/></label>
							<input id="typeName" type="text" value="<c:out value="${fulnme}"></c:out>" maxlength=36 class="validate form-control">
							
						</div>
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12 text-right">
							<!-- <a class="text-red" href="#">Reset</a> -->
						   <a class="btn btn-blue" href="#" onclick="saveTypeSignature();"><spring:message code="label.save"/></a>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12" >
						
						</div>
				  </div>
				   <div class="row">
			    	<div class="col-xs-12" >
				   		<div class="alert alert-danger" id="signature-type-error" style="display:none">
				      
						</div>
				  </div>
				  </div>
				  <div class="row">
					  <div class="col-xs-12 text-right">
						 <!--  <a class="text-red" href="#">Reset</a>
						   <a class="text-green" href="#">Save</a> -->
					  </div>
				  </div>
				  <div class="row margTB20" id="showType">
					  <!-- <div class="col-xs-12">
					  	<div class="pdf_view" id="showType">
					 
						</div>
					  </div> -->
				  </div>
				   
				</div>	
	</div>
	


	<input  type="text" id="filename" type="text" style="display: none;" >
	<input type="hidden" id="fileId">
</div>

<div class="Message" id="viewplantemp" style="width: 320px;">	
	<button type="button" onclick="tempClose();" class="close"><b>&times;</b></button>
   <div class="modal-header">
	  	<h4 class="modal-title"><c:out value="${activePurchase.planName }"></c:out> <spring:message code="label.plan"/></h4>
	</div>
	  	
	  	<div class="modal-body" style="background: #e3f5fd;">
	  		<c:choose>
	  			<c:when test="${activePurchase.durationtime == 365 }">
	  				<h6 style="text-align: center; color: #1f94e6"><c:out value="${activePurchase.planName }"></c:out><spring:message code="label.annual"/></h6>
	  			</c:when>
	  			<c:otherwise>
	  				<h6 style="text-align: center; color: #1f94e6"><c:out value="${activePurchase.planName }"></c:out><spring:message code="label.monthly"/></h6>
	  			</c:otherwise>
	  		</c:choose>
	  		<div class="mid-content">
		  		<p style="margin-bottom:0;text-align: center;">${activePurchase.getSubscription().creditedDocuments } <spring:message code="label.docmts"/></p>
		  		<p style="margin-bottom:0;text-align: center;">${activePurchase.getSubscription().creditedTemplate } <spring:message code="label.templates"/></p>
		  		 <c:forTokens items="${features1}" delims="," var="feature1">
							<c:if test="${feature1 eq 4 }">
							    <p style="margin-bottom:0;text-align: center;"><spring:message code="label.selfsign"/></p>
							</c:if>
							<c:if test="${feature1 eq 5 }">
								<p style="margin-bottom:0;text-align: center;"><spring:message code="label.grp_sgn"/></p>
							</c:if>
							<c:if test="${feature1 eq 13 }">
								<p style="margin-bottom:0;text-align: center;"><spring:message code="label.hier_sign"/></p>
							</c:if>
							<c:if test="${feature1 eq 11 }">
								<p style="margin-bottom:0;text-align: center;"><spring:message code="label.sign_type"/></p>
							</c:if>
							<c:if test="${feature1 eq 12 }">
								<p style="margin-bottom:0;text-align: center;"><spring:message code="label.doc_tracking"/></p>
							</c:if>
							<c:if test="${feature1 eq 1}">
								<p style="margin-bottom:0;text-align: center;"><spring:message code="label.upload_pdf_gd"/></p>
							</c:if>
							<c:if test="${feature1 eq 2 }">
								<p style="margin-bottom:0;text-align: center;"><spring:message code="label.upload_pdf_db"/></p>
							</c:if>
							<c:if test="${feature1 eq 3 }">
								<p style="margin-bottom:0;text-align: center;"><spring:message code="label.upload_pdf_od"/></p>
							</c:if>
				 </c:forTokens>
		 	</div>
		</div>	
	 	 <label><spring:message code="label.you_can_also_upgrade_plan"/> </label>
	  <div class="text-right">	  
		<!-- <button type="button" class="btn btn-light" onclick="tempClose();">Cancel</button> -->
		<button type="button" class="btn btn-blue" onclick="upgradePlan('<c:out value="${activePurchase.getSubscription().planId}"></c:out>');"><spring:message code="label.upgrade_plan"/></button>
	  </div> 	
 </div>
<canvas id='blank' style='display:none'></canvas>
 <div class="overlay-bg"></div>
 <input type="hidden" id="myType" value=""/>
<input type="hidden" id="drawBase64" value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAALQ0lEQVR4Xu3W0QkAIAxDQV3W/Teo4BQ+uE4QLv3InpmzHAECBAgQIECAAAECXwtsw/3rfoQjQIAAAQIECBAg8AQMd49AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDgAqC3dsd5CiH1AAAAAElFTkSuQmCC"/>
<input type="hidden" id="drawBaseIE64" value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAPbSURBVHhe7dZBEcAwDMCwbmDLn0H2GYj4TvqYgp+ZuQcAAFjt/QsAACxm3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAACw3jkfMvcE1ytbuLQAAAAASUVORK5CYII="/>
<input type="hidden" id="drawBaseMozilla64" value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAAD2UlEQVR4nO3WMREAIBDAMNTi38EjgRF6lyF7x66Z2QAAwN/W6wAAAODOuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAg4AAckOtgbGrrvgAAAABJRU5ErkJggg=="/>
<input type="hidden" id="drawBaseSafari64" value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAALQ0lEQVR4Ae3WQQ3AQAwDweuBLX8GqVQUWWmCwBrn4Wdm3uMIECBAgAABAgQIEFgtcFenE44AAQIECBAgQIAAgV/AcPcIBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEPjL3BNcQbtHHAAAAAElFTkSuQmCC"/>

    <script src="<%=appUrl %>/js/highcharts.js"></script>
    <script src="<%=appUrl %>/js/highcharts-more.js"></script>
    <script src="<%=appUrl %>/js/solid-gauge.js"></script>
    
<script src="<%=appUrl %>/js/custom-file-input.js"></script> 
<script src="<%=appUrl %>/js/jquery.validate.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.12/d3.min.js"></script> 
<!--  Timo integration -->
	
	<!-- <script src="http://sbvt-app-05:8080/timo/assets/Support/script.js"></script>  -->
<%-- <script src="<%=appUrl %>/js/D3.js"></script> --%>
<%-- <script src="<%=appUrl %>/js/materialize.js"></script> --%>
 
<script>
Highcharts.setOptions({
    colors: ['#D71996', '#82d5f5','#d089d7','#6e7881']
});
var completed = "${completed}";
var outfor = "${outForSignature}";
var draft = "${draft}";
var receivedrejected = "${ReceivedReject}";
var sentrejected = "${SentReject}";
var signed = "${signed}";
var pending = "${pending}";
	$(function() {
		var days = ${days};
		 var totalDays =Math.round(${daysLeftPercent});
		 var dayleft = ${daysLeftPercent-days};
        // Create the chart
         chart = new Highcharts.Chart({
            chart: {
                renderTo: 'daysContainer',
                type: 'pie',
                spacingBottom: 15,
                spacingTop: 10,
                spacingLeft: 10,
                spacingRight: 10,
                margin:0
            },
            title: {
                text: days+'<br><spring:message code="label.dys_lft"/>',//parseInt(debitdoc)+'/'+parseInt(creditdoc)
                align: 'center',
                verticalAlign: 'middle',
                y: -15,
                
            },
            yAxis: {
                title: {
                    text: '<spring:message code="label.tot_per_mark_share"/>'
                }
            },
            plotOptions: {
                pie: {
                    shadow: false
                },
                series: {
                    point: {
                        events: {
                            legendItemClick: function () {
                                return false; // <== returning false will cancel the default action
                            }
                        }
                    }
                }
                
            },
            tooltip: {
                formatter: function() {
                    return '<b>'+ this.point.name +'</b>: '+ this.y +'';
                }
            },
                
            series: [{
                name: '<spring:message code="label.browser"/>',
                data: [
                   {
	            		name:"<spring:message code="label.remainig"/>",
	            		y:parseInt(days),
	            		color:Highcharts.getOptions().colors[1]
	            	},
	            	{
	            		name:"<spring:message code="label.consumed"/>",
	            		y:parseInt(dayleft),
	            		color:Highcharts.getOptions().colors[2]
	            	}
                	],
                size: '120px',
                innerSize: '100px',
                showInLegend:true,
                dataLabels: {
                    enabled: false
                }
            }]
        });
    });
	
	/* $(function() {
		var totalLeftDoc = '${INDIVIDUAL}';
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'individualContainer',
                type: 'pie',
                spacingBottom: 15,
                spacingTop: 10,
                spacingLeft: 10,
                spacingRight: 10,
                margin:0
            },
            title: {
                text: totalLeftDoc+'<br><spring:message code="label.docmts"/>',//parseInt(debitdoc)+'/'+parseInt(creditdoc)
                align: 'center',
                verticalAlign: 'middle',
                y: -15
            },
            yAxis: {
                title: {
                    text: '<spring:message code="label.tot_per_mark_share"/>'
                }
            },
            plotOptions: {
                pie: {
                    shadow: false
                },
                series: {
                    point: {
                        events: {
                            legendItemClick: function () {
                                return false; // <== returning false will cancel the default action
                            }
                        }
                    }
                }
            },
            tooltip: {
                formatter: function() {
                    return '<b>'+ this.point.name +'</b>: '+ this.y +'';
                }
            },
            series: [{
                name: '<spring:message code="label.browser"/>',
                data: [{
            		name:"Usable",
            		y:parseInt(totalLeftDoc),
            		color:Highcharts.getOptions().colors[1]
            	}],
            	size: '120px',
                innerSize: '100px',
                showInLegend:true,
                dataLabels: {
                    enabled: false
                }
            }]
        });
    });
	 $(function() {
	        
	var totalLeftDoc = '${PROFESSIONAL}';
	        chart = new Highcharts.Chart({
	            chart: {
                renderTo: 'professionalContainer',
	                type: 'pie',
	                spacingBottom: 15,
	                spacingTop: 10,
	                spacingLeft: 10,
	                spacingRight: 10,
	                margin:0
	            },
	            title: {
	                text: totalLeftDoc+'<br><spring:message code="label.docmts"/>',//parseInt(debitdoc)+'/'+parseInt(creditdoc)
	                align: 'center',
	                verticalAlign: 'middle',
	                y: -15 
	            },
	            yAxis: {
	                title: {
	                    text: 'Total percent market share'
	                }
	            },
	            plotOptions: {
	                pie: {
	                    shadow: false
	                },
	                series: {
	                    point: {
	                        events: {
	                            legendItemClick: function () {
	                                return false; // <== returning false will cancel the default action
	                            }
	                        }
	                    }
	                }
	            },
	            tooltip: {
	                formatter: function() {
	                    return '<b>'+ this.point.name +'</b>: '+ this.y +'';
	                }
	            },
	            series: [{
	                name: 'Browsers',
	                data: [
	               		{
	            		name:"Usable",
	                		y:parseInt(totalLeftDoc),
	                		color:Highcharts.getOptions().colors[1]
	                	}
	            	],
	            	size: '120px',
	                innerSize: '100px',
	                color:'#d089d7',
	                showInLegend:true,
	                dataLabels: {
	                    enabled: false
	                }
	            }]
	        });
    }); */
	
$(function() {
    // Create the chart
   /*var totalDocument='${totalDocument}';*/
    var creditdoc = '${activePurchase.subscription.creditedDocuments }';
    var debitdoc = '${activePurchase.subscription.usedDocuments }';
    var totalLeftDoc = '${totalLeftDoc}';
    creditdoc = creditdoc=="" ? 0 : creditdoc;
    debitdoc = debitdoc=="" ? 0 : debitdoc;
		
        chart = new Highcharts.Chart({
            chart: {
            renderTo: 'docContainer',
                type: 'pie',
                spacingBottom: 15,
                spacingTop: 10,
                spacingLeft: 10,
                spacingRight: 10,
                margin:0
            },
            title: {
                text: totalLeftDoc+'<br><spring:message code="label.docmts"/>',//parseInt(debitdoc)+'/'+parseInt(creditdoc)
                align: 'center',
                verticalAlign: 'middle',
                y: -15 
            },
            yAxis: {
                title: {
                text: '<spring:message code="label.tot_per_mark_share"/>'
                }
            },
            plotOptions: {
                pie: {
                    shadow: false
                },
                series: {
                    point: {
                        events: {
                            legendItemClick: function () {
                                return false; // <== returning false will cancel the default action
                            }
                        }
                    }
                }
            },
            tooltip: {
                formatter: function() {
                    return '<b>'+ this.point.name +'</b>: '+ this.y +'';
                }
            },
            series: [{
                name: '<spring:message code="label.browser"/>',
                data: [
	                {
            		name:"<spring:message code="label.remainig"/>",
	            		y:parseInt(totalLeftDoc),
	            		color:Highcharts.getOptions().colors[1]
            	},
            	{
            		name:"<spring:message code="label.consumed"/>",
            		y:parseInt(debitdoc),
            		color:Highcharts.getOptions().colors[2]
	            	}
            	],
            	size: '120px',
                innerSize: '100px',
                color:'#d089d7',
                showInLegend:true,
                dataLabels: {
                    enabled: false
                }
            }]
        });
});
	
$(function() {
    // Create the chart
   /*var totalDocument='${totalDocument}';*/
    var creditdoc = '${activePurchase.subscription.creditedDocuments }';
    var debitdoc = '${activePurchase.subscription.usedDocuments }';
    var totalLeftDoc = '${totalLeftDoc}';
    creditdoc = creditdoc=="" ? 0 : creditdoc;
    //debitdoc = debitdoc=="" ? 1 : debitdoc;
    //Changes for defect 1291
    debitdoc = debitdoc== 0 && totalLeftDoc ==0 ? 1 : debitdoc;
    
    chart = new Highcharts.Chart({
        chart: {
                renderTo: 'docContainer2',
            type: 'pie',
            spacingBottom: 15,
            spacingTop: 10,
            spacingLeft: 10,
            spacingRight: 10,
            margin:0
        },
        title: {
            text: totalLeftDoc+'<br><spring:message code="label.docmts"/>',//parseInt(debitdoc)+'/'+parseInt(creditdoc)
            align: 'center',
            verticalAlign: 'middle',
            y: -15 
        },
        yAxis: {
            title: {
                text: '<spring:message code="label.tot_per_mark_share"/>'
            }
        },
        plotOptions: {
            pie: {
                shadow: false
            },
            series: {
                point: {
                    events: {
                        legendItemClick: function () {
                            return false; // <== returning false will cancel the default action
                        }
                    }
                }
            }
        },
        tooltip: {
            formatter: function() {
                return '<b>'+ this.point.name +'</b>: '+ this.y +'';
            }
        },
        series: [{
            name: '<spring:message code="label.browser"/>',
            data: [
           		{
            		name:"<spring:message code="label.remainig"/>",
            		y:parseInt(totalLeftDoc),
            		color:Highcharts.getOptions().colors[1]
            	},
            	{
            		name:"<spring:message code="label.consumed"/>",
            		y:parseInt(debitdoc),
            		color:Highcharts.getOptions().colors[2]
            	}
        	],
        	size: '120px',
            innerSize: '100px',
            color:'#d089d7',
            showInLegend:true,
            dataLabels: {
                enabled: false
            }
        }]
    });
});

$(function() {
	var senttotalLeftDoc = parseInt(completed) + parseInt(outfor)+parseInt(draft)+parseInt(sentrejected);
    if(senttotalLeftDoc != 0){
    	$("#sentContainer").show();
    	$(".setContainer_Parent").show();
    	chart = new Highcharts.Chart({
        chart: {
            renderTo: 'sentContainer',
            type: 'pie',
            spacingBottom: 15,
            spacingTop: 10,
            spacingLeft: 10,
            spacingRight: 10,
            margin:0
        },
        title: {
            text: senttotalLeftDoc+'<br><spring:message code="label.docmts"/>',
            align: 'center',
            verticalAlign: 'middle',
            y: -15 ,
           
        },
        yAxis: {
            title: {
                text: '<spring:message code="label.tot_per_mark_share"/>'
            }
        },
        plotOptions: {
            pie: {
                shadow: false
            },
            series: {
                point: {
                    events: {
                        legendItemClick: function () {
                            return false; // <== returning false will cancel the default action
                        }
                    }
                }
            }
        },
        tooltip: {
            formatter: function() {
                return '<b>'+ this.point.name +'</b>: '+ this.y +'';
            }
        },
        series: [{
            name: '<spring:message code="label.browser"/>',
            data: [
            	{
            		name:"<spring:message code="label.cmplt_doc"/>",
            		y:parseInt(completed),
            		color:Highcharts.getOptions().colors[0]
            	},
            	{
            		name:"<spring:message code="label.dash_outdoc"/>",
            		y:parseInt(outfor),
            		color:Highcharts.getOptions().colors[1]
            	},
            	{
            		name:"<spring:message code="label.dash_draft"/>",
            		y:parseInt(draft),
            		color:Highcharts.getOptions().colors[2]
            	},
            	{
            		name:"<spring:message code="label.rejected"/>",
            		y:parseInt(sentrejected),
            		color:Highcharts.getOptions().colors[3]
            	}
        	],
        	size: '120px',
            innerSize: '100px',
            color:'#d089d7',
            showInLegend:true,
            dataLabels: {
                enabled: false
            }
        }]
    });
    }else{
    	$("#sentZero").show();
    }
});

$(function() {
	var receivedtotalLeftDoc = parseInt(signed) + parseInt(pending) + parseInt(receivedrejected);
	if(receivedtotalLeftDoc !=0 ){
		$("#receivedContainer").show();
		$(".documentSent1").show();
		 chart = new Highcharts.Chart({
		        chart: {
		            renderTo: 'receivedContainer',
		            type: 'pie',
		            spacingBottom: 15,
		            spacingTop: 10,
		            spacingLeft: 10,
		            spacingRight: 10,
		            margin:0
		        },
		        title: {
		            text: receivedtotalLeftDoc+'<br><spring:message code="label.docmts"/>',
		            align: 'center',
		            verticalAlign: 'middle',
		            y: -15
		        },
		        yAxis: {
		            title: {
		                text: '<spring:message code="label.tot_per_mark_share"/>'
		            }
		        },
		        plotOptions: {
		            pie: {
		                shadow: false
		            },
		            series: {
		                point: {
		                    events: {
		                        legendItemClick: function () {
		                            return false; // <== returning false will cancel the default action
		                        }
		                    }
		                }
		            }
		        },
		        tooltip: {
		            formatter: function() {
		                return '<b>'+ this.point.name +'</b>: '+ this.y +'';
		            }
		        },
		        series: [{
		            name: 'Browsers',
		            data: [
				            {
			            		name:"<spring:message code="label.sgned"/>",
			            		y:parseInt(signed),
			            		color:Highcharts.getOptions().colors[2]
			            	},
			            	{
			            		name:"<spring:message code="label.pnding"/>",
			            		y:parseInt(pending),
			            		color:Highcharts.getOptions().colors[1]
			            	},
			            	{
			            		name:"<spring:message code="label.rejected"/>",
			            		y:parseInt(receivedrejected),
			            		color:Highcharts.getOptions().colors[3]
			            	}
		            	],
		            	size: '120px',
		                innerSize: '100px',
		            color:'#d089d7',
		            showInLegend:true,
		            dataLabels: {
		                enabled: false
		            }
		        }]
		    });
	}else{
		$("#receivedZero").show();
	}
   
});
</script>
<script>
$(document).on('touchstart click', '#openSignature', function(event){
    if(event.handled === false) return
    event.stopPropagation();
    event.preventDefault();
    event.handled = true;

    // Do your magic here

});
//Upload
function saveUploadSignature(){
	//debugger;
	var sign = $('img[id="blah"]').attr('src');
	var fileInput = document.getElementById('imgInp');
	if(sign == ''){
		$("#file_error").show();
    	$("#file_error").html('<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>'+'<spring:message code="label.upl_picsign" />'+'<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
        fileInput.value = '';
	}else{
	
	$(".signature-sign").hide();
	$('.overlay-bg').hide();
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var contextPath=$("#contextPath").val();
	var data = {
			 "dataURL" : sign,
			 "signType" :"Upload"
	}
	 $.ajax({
		type : "POST",
		url : contextPath+"app/saveSignature",
		dataType: 'json',
	    contentType: "application/json; charset=utf-8",
	    data: JSON.stringify(data),
	    beforeSend: function (xhr) {
	    	$("#loader2").show();
   			xhr.setRequestHeader(header, token);
	    },
	    complete: function () {
	    	$("#loader2").hide();
	    },
        success : function(response) {
         	if(response != 'failed'){
         		$("#show_upload_error_signature").show();
         		document.getElementById("showSignature").src = sign;
        	/*	$("#show_signature").css("margin-left","0px"); */
        	    $("#showSignature").show();
         		$("#show_signature").css("margin-left","143px");
        		$("#showSignature").css("height","120px");
        		$("#showSignature").css("padding","5px");
        		
         	}else{
            	alert('<spring:message code="label.fld"/>');
            }
		},
		 error : function(e) {  
		   // alert('Error: ' + e);   
		}  
	 }); 
	}
}

//Type

function saveTypeSignature(){
	    var sign = $("#myType").val();
		var typeSign=$("#typeName").val();
		var check=validationSignature1(sign,typeSign,"type");
		if(check ==true){
			
		/* 	val=$("#field_"+fieldValue).attr('src', sign);	
			$("#field_"+fieldValue).val(val); */
			
			$(".signature-sign").hide();
			$('.overlay-bg').hide();
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath=$("#contextPath").val();
			var data = {
					 "dataURL" : sign,
					 "signType" :"Type"
			}
			$.ajax({
				type : "POST",
				url : contextPath+"app/saveSignature",
				dataType: 'json',
			    contentType: "application/json; charset=utf-8",
			    data: JSON.stringify(data),
			    beforeSend: function (xhr) {
		   			xhr.setRequestHeader(header, token);
		   			$("#loader2").show();
			    },
			    complete: function () {
			    	$("#loader2").hide();
			    },
		        success : function(response) {
		         	if(response != 'failed'){
		        		//alert("success");
		         		
		    			document.getElementById("showSignature").src = sign;
		    			$("#showSignature").show();
		    			$("#show_signature").css("margin-left","143px");
		    			$("#showSignature").css("height","auto");
		    			$("#showSignature").css("padding","35px");
		            }else{
		            	alert('<spring:message code="label.fld"/>');
		            }
				},
				 error : function(e) {  
				   // alert('Error: ' + e);
					 $("#showSignature").css("height","105px");
				}  
			 });
		
		}
}

String.prototype.fulltrim = function() {
	  return this.replace(/(?:(?:^|\n)\s+|\s+(?:$|\n))/g, '').replace(/\s+/g, ' ');
	};

	
function getTypeData(key){
	$('.selected').removeClass('selected');
    $('.imgselect'+key).addClass('selected');
	var imgSrc=$('#img'+key).attr('src');
	$("#myType").val(imgSrc);
}

//add signature validation
function validationSignature1(sign,typeSign,type){
	/* if(sign == "" && typeSign==""){
		$("#signature-type-error").html("Please make sure you have type your signature and select a font first");
	} */
	if(typeSign == "Type Your Signature"){
		$("#signature-type-error").show();
		$("#signature-type-error").html('<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>'+'<spring:message code="label.sign_font"/>');
		return false;
	}
	if(typeSign == ""){
		$("#signature-type-error").show();
		$("#signature-type-error").html('<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>'+'<spring:message code="label.type_sgn"/>');
		return false;
	}
	if(sign == ""){
		$("#signature-type-error").show();
		$("#signature-type-error").html('<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>'+'<spring:message code="label.slct_fnt"/>'+'<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
		return false;
	}
	
	return true;
}


$("#typeName").keyup(function(){
	//debugger;
	 var element = document.getElementById('typeName');
	 element.value = element.value.replace(/[^a-zA-Z 0-9 ]+/, '');

		 $("#signature-type-error").hide();
			$("#signature-type-error").html('');
			var typeValue=$("#typeName").val().fulltrim();
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath=$("#contextPath").val();
			$.ajax({  
			     type : "GET",   
			     url : contextPath+"app/typeSignature?imgType="+typeValue,  
			     dataType: 'json',
			     beforeSend : function(xhr) {	                
			    		xhr.setRequestHeader(header, token);
			     },
			     success : function(response) {  
			    	 var imgData=response;
			    	 	$("#showType").empty();
		 		 			
			    	 		$.each( imgData, function( key, value ) {
			 		 		 
		 		 			$("#showType").append('<div class="col-md-6 col-sm-6 col-xs-12 thumb"><a  onclick="getTypeData('+key+')" class="imgselect'+key+' thumbnail" style="height: 57px;"> <img id="img'+key+'"  class="img-responsive" src='+value+' alt=""></a></div>');
			 		 	     
		 		 		//alert(key);
		 		 		// $("#selectType").append('<div class="col-lg-4 col-md-4 col-xs-6 thumb"><a  onclick="getTypeData('+key+')" class="imgselect'+key+' thumbnail" style="height: 57px;"> <img id="img'+key+'"  class="img-responsive" src='+value+' alt=""></a></div>');
			    		});
			     },  
			     error : function(e) {  
			     	 alert('<spring:message code="label.slf_error"/>: ' + e);   
			     }  
			    });  
		 
	 
	
	
});	
function getSigntype(){
	$("#signature-type-error").hide();
	$("#signature-type-error").html('');
	var typeValue=$("#typeName").val();
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var contextPath=$("#contextPath").val();
	$.ajax({  
	     type : "GET",   
	     url : contextPath+"app/typeSignature",   
	     data : "imgType="+typeValue.fulltrim(),  
	     dataType: 'json',
	     beforeSend : function(xhr) {	                
	    		xhr.setRequestHeader(header, token);
	    },
	     success : function(response) {  
	    	 
	    	 var imgData=response;
	    	 $("#showType").empty();
	 			
 	 		$.each( imgData, function( key, value ) {
		 		$("#showType").append('<div class="col-md-6 col-sm-6 col-xs-12 thumb"><a  onclick="getTypeData('+key+')" class="imgselect'+key+' thumbnail" style="height: 57px;"> <img id="img'+key+'"  class="img-responsive" src='+value+' alt=""></a></div>');
	 	     	//alert(key);
 				// $("#selectType").append('<div class="col-lg-4 col-md-4 col-xs-6 thumb"><a  onclick="getTypeData('+key+')" class="imgselect'+key+' thumbnail" style="height: 57px;"> <img id="img'+key+'"  class="img-responsive" src='+value+' alt=""></a></div>');
			});
	     },  
	     error : function(e) {  
	      alert('<spring:message code="label.slf_error"/>: ' + e);   
	     }  
	 });  
}

//Draw Signature
$('#openSignature').on('touchstart click', function(e){
	e.stopPropagation(); e.preventDefault();
	$('.overlay-bg').show();
	$('.signature-sign').show();
		var $slider = $('.signature-sign');
		$slider.animate({
		 right: parseInt($slider.css('right'),10) == -444 ? 0 : 0
		});
	
	$("#drawsignature_error").hide();
	$("#file_error").hide();
	$("#requiredSignature").hide();
	signaturePad.clear();
	//zkSignature.clear();
	getSigntype();
	$("#sType").removeClass('active');
	$("#type").removeClass('active');
	$("#uType").removeClass('active');
	$("#uType").removeClass('active');
	$("#upload").removeClass('active');
	$("#sDraw").addClass('active');
	$("#draw").addClass('active');
	$("#show_upload_signature").show();
	$("#blah").hide();
	 
	$("#myType").val('');
	$("#blah").attr('src', '');
	document.getElementById("imgInp").value = "";
	

});

$('.close').click(function(){
	//$('.save-signature-box').hide();
	$(".signature-sign").hide();
	$('.overlay-bg').hide();
	 //return false;
}); 

function saveSignaturetodb(){
	
	if (!signaturePad.isEmpty()){
	var canvas = document.getElementById("signaturepad");
			var dataURL = canvas.toDataURL("image/png",1);

	console.log(dataURL);
	var defaultBase64;
	if ($.browser.mozilla && $.browser.version >= "2.0" ){
		defaultBase64=$("#drawBaseMozilla64").val();
	}
	 if( $.browser.safari ){
		  defaultBase64=$("#drawBaseSafari64").val();
	} 
	if ($.browser.chrome){
	   defaultBase64=$("#drawBase64").val();
	}
	if ($.browser.msedge || $.browser.msie && $.browser.version <= 6 || $.browser.msie && $.browser.version > 6){
	   defaultBase64=$("#drawBaseIE64").val();
	}
	if(defaultBase64 == dataURL){
		
		$("#drawsignature_error").show();
	}else{
		$(".signature-sign").hide();
		$('.overlay-bg').hide();
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
		var data = {
				 "dataURL" : dataURL,
				 "signType" :"Draw"
		}
		$.ajax({
			type : "POST",
			url : contextPath+"app/saveSignature",
			dataType: 'json',
		    contentType: "application/json; charset=utf-8",
		    data: JSON.stringify(data),
		    beforeSend: function (xhr) {
	   			xhr.setRequestHeader(header, token);
	   			$("#loader2").show();
		    },
		    complete: function () {
		    	$("#loader2").hide();
		    },
	        success : function(response) {
	         	if(response != 'failed'){
	        	
	        		document.getElementById("showSignature").src = dataURL;
	        		$("#showSignature").show();
	        		$("#show_Signature").css("margin-left","143px");
	        		$("#showSignature").css("height","120px");
	        		$("#showSignature").css("padding","5px");
	        		
	        		/* $("#show_signature").css("margin-left","0px"); */
	        		
	        		//$('#openSignature').html('<spring:message code="label.upd-sign"/>');		
	            }else{
	            	alert('<spring:message code="label.failed"/>');
	            }
			},
			 error : function(e) {  
			    //alert('<spring:message code="label.slf_error"/>: ' + e);   
				 timeOut();
			 }  
		 });
	}
	
	 }
	else{
		$("#requiredSignature").show();
		
	}
}
</script> 

<script>
/* var signaturePad;
$( document ).ready(function() {
//zkSignature.capture();


 signaturePad= new SignaturePad(document.getElementById('signature-pad'), {
    backgroundColor: 'rgba(255, 255, 255, 0)',
    penColor: 'rgb(0, 0, 0)'
  });
  var saveButton = document.getElementById('save');
  var cancelButton = document.getElementById('clear');

  saveButton.addEventListener('click', function (event) {
    var data = signaturePad.toDataURL('image/png');
    saveSignaturetodb();

  // Send data to server instead...
    //window.open(data);
  });

  cancelButton.addEventListener('click', function (event) {
    signaturePad.clear();
  });



}); */
//End Draw Singature
</script>

<script>
//script of days chart

$(function () {
	 var totalDays =Math.round(${daysLeftPercent});
	 var days = ${days};
            var chartype = {
                type: 'solidgauge'
            }
            var chartitle = null
            var chartpane = {
                center: ['50%', '85%'],
                size: '131%',
                startAngle: -90,
                endAngle: 90,
                background: {
                   // backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
                    innerRadius: '60%',
                    outerRadius: '100%',
                    shape: 'arc'
                }
            }
            var chartooltip = {
                enabled: false
            }
            var chartyaxis = {
                stops: [
                    [0.1, '#A5D9C0'], // green
                    [0.5, '#A5D9C0'], // yellow
                    [0.9, '#A5D9C0'] // red
                ],
                lineWidth: 0,
                minorTickInterval: null,
                tickPixelInterval: 400,
                tickWidth: 0,
                tickAmount: 1,
                title: {
                    y: -70
                },
                labels: {
                    y: 16
                }
            }
            var chartplotoptions = {
                solidgauge: {
                    dataLabels: {
                        y: 5,
                        borderWidth: 0,
                        useHTML: true
                    }
                }
            }
            var gaugeOptions = {
                chart:chartype,
                title: chartitle,
                pane: chartpane,
                tooltip:chartooltip,
                yAxis: chartyaxis,
                plotOptions: chartplotoptions
            };
            // The speed gauge
            $('#container-speed').highcharts(Highcharts.merge(gaugeOptions, {
                yAxis: {
                    min: 0,
                    max: totalDays,
                  },
                credits: {
                    enabled: false
                },
                series: [{

                    data: [${days}],
                    dataLabels: {
                        format: '<div style="text-align:center; display:none" ><span style="font-size:25px;color:' +
                           ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
                             '<span style="font-size:12px;color:silver">Days</span></div>'
                    }
                }]
            }));
           
        });

function renew(){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var contextPath=$("#contextPath").val();
	$.ajax({
		type : "POST",
		url : contextPath+"/renew",
		//dataType: 'json',
	    //contentType: "application/json; charset=utf-8",
	    //data: JSON.stringify(data),
	    beforeSend: function (xhr) {
   			xhr.setRequestHeader(header, token);
   			$("#loader2").show();
	    },
	    complete: function () {
	    	$("#loader2").hide();
	    },
        success : function(response) {
        	if(response == "true"){
        		
        		$.confirm({
    	    	    title: '',
    	    	    content: '<spring:message code="label.sub_succ"/>',
    	    	    buttons: {
    	    	        somethingElse: {
    	    	            text: '<spring:message code="label.ok"/>',
    	    	            keys: ['enter', 'shift'],
    	    	            action: function(){
    	    	            	window.location = contextPath+'app/dashboard';
    	    	            	//alert(location.href);
    	    	            }
    	    	        }
    	    	    }
    	    	});
        		
        		
        	}else{
        		$.confirm({
    	    	    title: response,
    	    	    content: ' ',
    	    	    buttons: {
    	    	        somethingElse: {
    	    	            text: '<spring:message code="label.ok"/>',
    	    	            keys: ['enter', 'shift'],
    	    	            action: function(){
    	    	            	window.location = contextPath+'app/dashboard';
    	    	            }
    	    	        }
    	    	    }
    	    	});
        		
        	}
         	
		},
		 error : function(e) {  
		    alert('<spring:message code="label.slf_error"/>: ' + e);   
		}  
	 });	
}

var submitqueryform = $("#submitfeedback").validate({
	//specify the validation rules
	rules : {
		email : {
			required : true,
			email : true
		//email is required AND must be in the form of a valid email address
		},
		name : {
			required : true
		},
		message : {
			required : true
		}
		

	},
	//specify validation error messages
	messages : {
		email : {
			required : "<spring:message code="label.email_msgrequired"/>",
			email : "<spring:message code="label.email_msgrequired"/>"
		},
		name : {
			required : "<spring:message code="label.name_msg"/>",

		},
		message : {
			required : "<spring:message code="label.message_msg"/>",

		}
		
	}
});


var submitqueryform = $("#submitassociateduser").validate({
	//specify the validation rules
	rules : {
		email : {
			required : true,
			email : true
		//email is required AND must be in the form of a valid email address
		}
		

	},
	//specify validation error messages
	messages : {
		email : {
			required : "<spring:message code="label.email_msgrequired"/>",
			email : "<spring:message code="label.email_msgrequired"/>"
		}
		
		
	}
});


	
	
//upload siggnature code
function filevalidate() {
	//debugger;
	$("#file_error").hide();
	$(".demoInputBox").css("border-color","#F0F0F0");
	var file_size = $('#imgInp')[0].files[0].size;
	var fileInput = document.getElementById('imgInp');
	var filePath = fileInput.value;
    var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.bmp)$/i;
    if(!allowedExtensions.exec(filePath)){
    	
    	$("#file_error").show();
    	$("#file_error").html('<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>'+'<spring:message code="label.slf_uplod"/>'+'<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
        fileInput.value = '';
        return false;
    }   
    else if(file_size>10485760) {
		
		$("#file_error").show();
		$("#file_error").html("<spring:message code="label.fil_siz"/>" +'<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
		$(".demoInputBox").css("border-color","#FF0000");
		return false;
	} 
	return true;
}
function readURL(input) {
	//debugger;
	if (input.files && input.files[0]) {
	    var reader = new FileReader();

	    reader.onload = function(e) {
	    	
	    	var checkFile=filevalidate();
	    	 if(checkFile == true){ 
		    	var token = $("meta[name='_csrf']").attr("content");
		    	var header = $("meta[name='_csrf_header']").attr("content");
		    	var contextPath=$("#contextPath").val();
		    	var data = {
						 "dataURL" :  e.target.result,
						 "signType" :"Draw"
				}
		    	$.ajax({  
		    	     type : "POST",   
		    	     url : contextPath+"app/resizeSignature",   
		    	     dataType: 'json',
		 		     contentType: "application/json; charset=utf-8",
		 		     data: JSON.stringify(data),
		    	     beforeSend : function(xhr) {	                
		   	    	 xhr.setRequestHeader(header, token);
			   			$("#loader2").show();
				     },
				     complete: function () {
				    	$("#loader2").hide();
				     },
					 success : function(response) {  
						 $("#show_upload_signature").hide();
						 $("#blah").show();
		    	    	 $('#blah').attr('src', 'data:image/jpeg;base64,'+response);	 
		    		 },  
		    	     error : function(e) {  
		    	      alert('<spring:message code="label.slf_error"/>: ' + e);   
		    	     }  
		    	 });  
	    	 }
    
	    }

	    reader.readAsDataURL(input.files[0]);
	  }
 /*  if (input.files && input.files[0]) {
   
	 	 var reader = new FileReader();
    	 reader.onload = function(e) {
    		
   		  var checkFile=filevalidate();
   		   alert('Hii check');
   		  if(checkFile == true){ 
	    	var token = $("meta[name='_csrf']").attr("content");
	    	var header = $("meta[name='_csrf_header']").attr("content");
	    	var contextPath=$("#contextPath").val();
	    	var data = {
					 "dataURL" :  e.target.result,
					 "signType" :"Draw"
			}
	    	$.ajax({  
	    	     type : "POST",   
	    	     url : contextPath+"app/resizeSignature",   
	    	     dataType: 'json',
	 		     contentType: "application/json; charset=utf-8",
	 		     data: JSON.stringify(data),
	    	     beforeSend : function(xhr) {	                
	   	    	 xhr.setRequestHeader(header, token);
		   			$("#loader2").show();
			     },
			     complete: function () {
			    	$("#loader2").hide();
			     },
				 success : function(response) {  
	    	    	 $('#blah').attr('src', 'data:image/jpeg;base64,'+response);	 
	    		 },  
	    	     error : function(e) {  
	    	      alert('Error: ' + e);   
	    	     }  
	    	 });  	
    
      
  	  }

    	reader.readAsDataURL(input.files[0]);
	  }
  } */
}

$("#imgInp").change(function() {
	//debugger;
	readURL(this);
});

function clearUploadSignature(){
	$('#blah').attr('src', '');
    $("#imgInp").val("");
    $("#show_upload_signature").show();
    $("#blah").hide();
		
}

function deleteAssociatedUsers(p_id,sub_user_id)
{
	
	$.confirm({
	    title: '',
	    content: '' +
	    '<form action="" class="formName" id="deleteAssociatedUsers">' +
	    '<div class=""> Are you sure want to delete?</div>' +
	    '</form>',
	    buttons: {
	    	 
	    	formSubmit: {
	            text: 'DELETE',
	            btnClass: 'btn-green',
	            action: function () {
	        
	        		var valid = $("#deleteAssociatedUsers").valid();
	                  if(!valid){
	                    return false;
	                  }
	                  else{ 
	    			$.ajax({
	    				type : "GET",
	    				url : "deleteAssociatedUsers",
	    				data : {p_id:p_id,sub_user_id:sub_user_id},
	    				  beforeSend: function () { 
              				$("#loader2").show();
              			},
              			complete: function () {
              				$("#loader2").hide();
              			}, 
	    				success : function(response) {
	    					if (response == 1) {
	    						  $.alert('<spring:message code="label.asso_user_del_success"/>');
	    					} else {
	    						  $.alert('<spring:message code="label.err_while_delete"/>');
	    					}
	    				},
	    				error : function(xhr, textStatus, errorThrown) {
	    					alert('<spring:message code="label.something_went_wrong"/>');
	    					return false;
	    				}
	    			});
	            }
	        		
	            }
	        },
	        cancel: {
		        btnClass: 'btn-red'
            },
	     
	    },
	    onContentReady: function () {
	        // bind to events
	        var jc = this;
	        this.$content.find('form').on('submit', function (e) {
	            e.preventDefault();
	            jc.$$formSubmit.trigger('click'); // reference the button and click it
	        });
	    }
	});
	
	
}

</script>
<!-- Signature download from OneDrive and DropBox -->
<script type="text/javascript" src="<%=appUrl %>/js/OneDrive.js"></script>
<script type="text/javascript" src="<%=appUrl %>/js/dropins.js" id="dropboxjs" data-app-key="kktaxdj1402ec7u"></script>
 <script type="text/javascript">
 $("a[rel='tooltip']").tooltip({'placement': 'bottom', 'z-index': '3000'});
  function launchOneDrivePicker(){
             
                var odOptions ={
                       clientId: "0aa725db-3ba9-486d-8e42-a92554639a6d",
                       action: "download",
                       multiSelect: false,
                       linkType: "webViewLink",
                       advanced: {filter: ".png,.jpg,.jpeg,.bmp"},
                       success: function(response) { 
                             var downloadurl =  response.value[0]["@microsoft.graph.downloadUrl"];
                             var name = response.value[0]["name"];
                             console.log("done-->"+downloadurl);
                             console.log("done-->"+name);
                           
                          
                             saveonedriveFile(downloadurl,name)
                       
                       },
                       cancel: function() {  },
     				  error: function(e) { alert(e); }
                }
              
       
    OneDrive.open(odOptions);
  }
  
  function saveonedriveFile(downloadedUrl,fileName) {
              
              var token = $("meta[name='_csrf']").attr("content");
                     var header = $("meta[name='_csrf_header']").attr("content");
                     var contextPath=$("#contextPath").val();
                     
                     $.ajax({
                           url: contextPath+"app/saveonedriveFile",
                           type: "POST",
                           datatype:'json',
                           Accept : "application/json",
                         contentType: "application/json",
                           data: JSON.stringify({ "downloadedUrl":downloadedUrl , "fileName" :fileName }),
                           beforeSend: function (xhr) {
                                   xhr.setRequestHeader(header, token);
                            
                                   $("#loader2").show();
                         },
                         complete: function () {
                               
                                  $("#loader2").hide();
                               },
                               
                            success:function(response){
                               //alert('success');
                               $("#show_upload_signature").hide();
                               $("#blah").show();
                               $('#blah').attr('src', 'data:image/jpeg;base64,'+response);
                            
                         },
                         error: function(err){
                        	 $("#loader2").hide();
                        	 alert('<spring:message code="label.slf_error"/>: ' + err);  
                         }
                     })
              }
  
 

document.getElementById("dropbox1").onclick = function () {
       Dropbox.choose({
        success: function(files) {
            
          console.log(files);
          var str = files[0].name;
            //$(".file-upload-input").val(files[0].name);
           
            saveDropoxFile(files[0].link,files[0].name)
            
        },
        linkType: 'direct',
        multiselect: false,
        extensions: ['.png','.jpg','.jpeg','.bmp'],
    });
};
  //  document.getElementById('container').appendChild(button);
    
    function saveDropoxFile(downloadedUrl,fileName) {
       
       var token = $("meta[name='_csrf']").attr("content");
              var header = $("meta[name='_csrf_header']").attr("content");
              var contextPath=$("#contextPath").val();
              
              $.ajax({
                     url: contextPath+"app/saveonedriveFile",
                     type: "POST",
                     datatype:'json',
                     Accept : "application/json",
                  contentType: "application/json",
                     data: JSON.stringify({ "downloadedUrl":downloadedUrl , "fileName" :fileName }),
                     beforeSend: function (xhr) {
                            xhr.setRequestHeader(header, token);
                     
                            $("#loader2").show();
                  },
                  complete: function () {
                       
                            $("#loader2").hide();
                         },
                         
                      success:function(response){
                           $("#show_upload_signature").hide();
                           $("#blah").show();
                           $('#blah').attr('src', 'data:image/jpeg;base64,'+response);
                     
                  },
                  error: function(err){
                	  $("#loader2").hide();
                  }
              })
       }
</script>
<!-- Signature download from Google Drive -->
<script type="text/javascript" src="<%=appUrl %>/js/filepickerapi.js"></script>


<script>
var file = null;

var subscription_status="${subscription_status}";
 $( document ).ready(function() {
	 $('#contactInd').keydown(function (e) {
		 //alert(e.charCode +"  "+ e.keyCode);
	       var key = e.charCode || e.keyCode || 0;
	       $text = $(this); 
	       if (key !== 8 && key !== 9) {
	           if ($text.val().length === 3) {
	               $text.val($text.val() + '-');
	           }
	           if ($text.val().length === 7) {
	               $text.val($text.val() + '-');
	           }

	       }

	       return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
	   })
		 
		 if(subscription_status==="0"){
				$("#openSignature").attr('disabled',true);
		 }
		 
		var sign = "<c:out value="${mysignature}"></c:out>";
		var signType = "<c:out value="${signatureType}"></c:out>";
		/* if(sign!=''){
			$('#openSignature').html('<spring:message code="label.upd-sign"/>');
		}
		if(signType!=''){
			$('#openSignature').html('<spring:message code="label.upd-sign"/>');
		} */
		if(signType == 'Draw'){
			
			 $("#showSignature").css("height","120px");
			 $("#showSignature").css("padding","5px");
			 $("#showSignature").css("display","block");
		}
		 if(signType == 'Type'){
			
			 $("#showSignature").css("height","auto");
			 $("#showSignature").css("padding","35px");
			 $("#showSignature").css("display","block");
		} 
		 if(signType == 'Upload'){
				
			 $("#showSignature").css("height","120px");
			 $("#showSignature").css("padding","5px");
			 $("#showSignature").css("display","block");
		}
	setTimeout(function(){ 
    var picker = new FilePicker({
          apiKey: 'AIzaSyBOIfItfyHfT9DM2vYIPN_XwuD8B2HhLyc',
          clientId:'927346535684-gkrnjl6o6akimdjse81gp3lb1j79n957.apps.googleusercontent.com',
          buttonEl: document.getElementById('googlePic'),
          onSelect: function(file) {
                 
                 $("#filename").val(file.title);
          //     $(".file-upload-input").val(file.title);
                 $("#fileId").val(file.id);
                 console.log(file);
                 download();
          //     document.getElementById("save").click();
                 //alert('Selected File ' + file.title);
                 //alert('Selected file Id ' + file.id);
          }
    });   
	}, 2000);
	
	  
}); 
              
              function download() {
                     var fileId = $("#fileId").val();
                     var fileName = $("#filename").val();
                     var byteArray = [];
                     if (fileId) {
                           console.log("fileId: ::" + fileId);
                           var accessToken = gapi.auth.getToken().access_token;
                           callToajax(fileId,'',fileName,accessToken);
                           
                           }
                
                           else {
                           alert('<spring:message code="label.unble_down"/>');
                           }
                       
                     }
              function callToajax(fileId,contentType,fileName,accessToken) {
                     var token = $("meta[name='_csrf']").attr("content");
                     var header = $("meta[name='_csrf_header']").attr("content");
                     var contextPath=$("#contextPath").val();
                     console.log(contextPath);
              //     $("#jumpstep2").removeAttr('disabled');
                     $.ajax({
                           url: contextPath+"cloud/downloadapisignature",
                           type: "POST",
                           dataType: 'json',
                         contentType: "application/json; charset=utf-8",
                         data: JSON.stringify({ "fileId":fileId , "fileMimeType": contentType , "fileName" :fileName ,"accessToken":accessToken}),
                         beforeSend: function (xhr) {
                                   xhr.setRequestHeader(header, token);
                            //     $("#jumpstep2").buttonLoader('start');
                                   $("#loader2").show();
                            
                         },
                         complete: function () {
                         // $("#jumpstep2").buttonLoader('stop');
                          $("#loader2").hide();
                            console.log("aasdas");
                         },
                           
                         success:function(response){
                           // alert("sucess");
                            
                            $("#show_upload_signature").hide();
                            $("#blah").show();
                            $('#blah').attr('src', 'data:image/jpeg;base64,'+response);
                         },
                         error: function(err){
                        	 $("#loader2").hide();
                         }
                     })
              }


       </script>
<script>
/*Egnyte Pic download code */   

function openEgnyteWindow(url) {
	// alert('Egnyte for Img');
    var w=500;
    var h=500;
var left = (screen.width/2)-(w/2);
var top = (screen.height/2)-(h/2);
var title = "Egnyte";
return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
    
     }
     
 function HandlePopupResultPic(base64,fileName) {
	 var str = fileName;
	  var res = str.slice(-4);
	 if(res ==".bmp"|| res == ".jpg"|| res==".png"||res =="jpeg")
		 {
	  //alert('Egnyte for Img handleEgnyteFile');
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    var contextPath=$("#contextPath").val();
    
    $.ajax({
          url: contextPath+"app/egnyteForSignature",
          type: "POST",
          datatype:'json',
          Accept : "application/json",
        contentType: "application/json",
          data: JSON.stringify({ "downloadedUrl":base64 , "fileName" :fileName }),
          beforeSend: function (xhr) {
               xhr.setRequestHeader(header, token);
        
               $("#loader2").show();
        },
        complete: function () {
            
               $("#loader2").hide();
              },
              
           success:function(response){
           	 //console.log(response);
             $("#show_upload_signature").hide();
			  $("#blah").show();
 	    	  $('#blah').attr('src', 'data:image/jpeg;base64,'+response);
          
        },
        error: function(err){
          
        }
    })
		 }else{
			 $("#file_error").show();
		     	$("#file_error").html('<spring:message code="label.slf_uplod"/>'+'<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
		         fileInput.value = '';
			 
		 }
    
 }   
 /* end Egnyte javascript code */ 
</script>
<div id="feedbackModal" class="modal fade" role="dialog">
<form id = "feedbackform" name = "eform">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content model_content_center">
      <div class="modal-header modal_header_left">
       <!--  <button type="button" class="close" data-dismiss="modal">&times;</button>  -->
        <!--  <button type="button" class="close" data-dismiss="modal">×</button>-->
        <h4 class="modal-title"><spring:message code="label.gv_fdbck"/></h4>
      </div>
      <div class="modal-body">
      <div class="row esign_exp">
      <div class="col-md-12"><spring:message code="label.signexpe"/></div>
      </div>
		 <div class="col-md-12 nopadding">
				<div class="col-md-1 col-sm-1 col-xs-2 nopadding">
 						 <input type="radio" name="smiley" value="1" class="emoji_popup1-checkbox" id="emoji_popup1-checkbox">
  							<label class="emoji_popup1" for="emoji_popup1-checkbox" data-target="#feedbackModal"></label>	
				</div>
				 <div class="col-md-1 col-sm-1 col-xs-2 nopadding">
 						 <input type="radio" name="smiley"  value="2" class="emoji_popup2-checkbox" id="emoji_popup2-checkbox">
  							<label class="emoji_popup2" for="emoji_popup2-checkbox" data-target="#feedbackModal"></label>
				</div>
				<div class="col-md-1 col-sm-1 col-xs-2 nopadding">
 						 <input type="radio" name="smiley"  value="3" class="emoji_popup3-checkbox" id="emoji_popup3-checkbox">
  							<label class="emoji_popup3" for="emoji_popup3-checkbox" data-target="#feedbackModal"></label>
				</div>
				<div class="col-md-1 col-sm-1 col-xs-2 nopadding">
 						 <input type="radio" name="smiley"  value="4" class="emoji_popup4-checkbox" id="emoji_popup4-checkbox">
  							<label class="emoji_popup4" for="emoji_popup4-checkbox"data-target="#feedbackModal"></label>
					</div>
				<div class="col-md-1 col-sm-1 col-xs-2 nopadding">
 						 <input type="radio" name="smiley"  value="5"  class="emoji_popup5-checkbox" id="emoji_popup5-checkbox">
  							<label class="emoji_popup5" for="emoji_popup5-checkbox" data-target="#feedbackModal"></label>
					</div>
		</div>
      <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
	                <div class="form-horizontal">
					  
					      <input type ="hidden" id="name" value="<c:out value="${fulnme}"></c:out>" class="name form-control" maxlength="30" readonly required>
					  
					  <div class="form-group">
					  <div class="col-sm-12">
					    <label for="inputPassword3" class="control-label"><spring:message code="label.cart_msg1"/><span class="redstar">*</span></label>
					    </div>
					    <div class="col-sm-12">
					      <textarea id="message" name="message" class="form-control" placeholder="<spring:message code="label.slf_msg"/>"></textarea>
					    </div>
					  </div>			 
				  	</div>
				  </div>
				 </div>
				  <div class="row">
				  <div class="col-sm-12 col-md-12 text-right">
					      <button type="button"  id="canclefeedback" class="btn btn-light"  data-dismiss="modal"><spring:message code="label.cancel"/></button>
					      <button type="button" id="sendbtn1" onclick="givefeedback();" style="text-transform: capitalize;" class="btn btn-blue"><spring:message code="label.sendmail"/></button>
					     
						 </div>
                <!-- Buttons --> 
                
              </div>

      </div>

     
      <div class="alert alert-success fade in" style="display:none;text-align:center;margin: 0px;" id="feedbacksuccessalert" style="display:none">
				    	
						<div id="emailsuccess"><i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i><spring:message code="label.feedbk-sent-succ"/><a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().parent().hide();">&times;</a></div>
</div> 
 <div class="alert alert-danger fade in" style="display:none;text-align:center;margin: 0px;" id="feedbackfailalert" style="display:none">
				    	<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>
						<div id="emailfail"></div>
						<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>
</div> 
    </div>

  </div>
  </form>
</div>
 <div class="Message" id="plansModal" style="width:900px !important">	

    <div class="modal-header">
    	<h4 class="model-title"><spring:message code="label.mplan"/></h4>
	</div>
  	<div class="modal-body">
	  	<div class="row">
		  	 
			<c:forEach items="${monthlyPlans }" var="plan">
												
				<div>
					<div class="col-md-4 col-sm-12">
		  				<div class="borderplans">
		  					<h2><b><c:out value="${plan.name }"></c:out></b></h2>
			  				<div class="bluebackHeader">
			  					<h1>$  <c:out value="${plan.price }"></c:out><spring:message code="label.month"/></h1>
			  					<p><spring:message code="label.per_user"/></p>
			  				</div>
			  				
			  				<c:choose>
    							  <c:when test="${plan.id == 48 }">
    								  <div class="plnsBtn">
      									 <button type="button" class="btn" id="btnfreeVersion"><spring:message code="label.con_with_free_ver"/></button>
      									</div>
								  </c:when>

     							<c:otherwise>
      								<div class="plnsBtn">
			  		 						<button type="button" onclick = "freeUpgradePlan();" class="btn btn-primary"><spring:message code="label.upgrade"/></button>
			  		 				</div>
			  
      							</c:otherwise>
    						</c:choose>     						
			  				<c:choose>
			  					<c:when test="${plan.id == 48 }">
			  		 			<div class="statmnt">			  		 										  			 	
						  		 		<p><i class="fa fa-check planscheck" aria-hidden="true"></i> <c:out value="${plan.noOfDocuments}"></c:out> <spring:message code="label.documents"/></p>
						  		 		<p><i class="fa fa-check planscheck" aria-hidden="true"></i> <c:out value="${plan.template}"></c:out> <spring:message code="label.templates"/></p>
						  		 		 <div id="view1">
						  		 		 <c:forTokens items="${plan.features }" delims=","
																		var="splitPlan" end = "4">
																		<c:set var="splitPlan" scope="request"
																			value="${splitPlan}" />
																		
																		<p><i class="fa fa-check planscheck" aria-hidden="true"></i>
																		
																		<c:forEach items='${monthlyFeatures1}' var='monthlyFeatures1'>
																			<c:set var="fid" scope="request"
																				value="${monthlyFeatures1.id}" />
																			<% if(request.getAttribute("fid").toString().equals(request.getAttribute("splitPlan"))){ %>${monthlyFeatures1.name}<br />
																			<% } %>

																		</c:forEach>
																		</p>																		
																	</c:forTokens>
												</div>
												
						  		 		 <div id="viewMore1" display="none">
						  		 		 <c:forTokens items="${plan.features }" delims=","
																		var="splitPlan" begin = "0">
																		<c:set var="splitPlan" scope="request"
																			value="${splitPlan}" />
																		
																		<p><i class="fa fa-check planscheck" aria-hidden="true"></i>
																		
																		<c:forEach items='${monthlyFeatures1}' var='monthlyFeatures1'>
																			<c:set var="fid" scope="request"
																				value="${monthlyFeatures1.id}" />
																			<% if(request.getAttribute("fid").toString().equals(request.getAttribute("splitPlan"))){ %>${monthlyFeatures1.name}<br />
																			<% } %>

																		</c:forEach>
																		</p>																		
																	</c:forTokens>
												</div>
											
						  		 		<a onclick="onViewMore1()" id="viewBtn1"><spring:message code="label.view_more"/> <i class="fa fa-angle-down" aria-hidden="true"></i></a>
						  		 	
						  		</div></c:when>
						  		<c:when test="${plan.id == 49 }">
						  		<div class="statmnt">						  			 	
						  		 		<p><i class="fa fa-check planscheck" aria-hidden="true"></i> <c:out value="${plan.noOfDocuments}"></c:out> <spring:message code="label.documents"/></p>
						  		 		<p><i class="fa fa-check planscheck" aria-hidden="true"></i> <c:out value="${plan.template}"></c:out> <spring:message code="label.templates"/></p>
						  		 		 <div id="view2">
						  		 		 <c:forTokens items="${plan.features }" delims=","
																		var="splitPlan" end = "4">
																		<c:set var="splitPlan" scope="request"
																			value="${splitPlan}" />
																		
																		<p><i class="fa fa-check planscheck" aria-hidden="true"></i>
																		
																		<c:forEach items='${monthlyFeatures1}' var='monthlyFeatures1'>
																			<c:set var="fid" scope="request"
																				value="${monthlyFeatures1.id}" />
																			<% if(request.getAttribute("fid").toString().equals(request.getAttribute("splitPlan"))){ %>${monthlyFeatures1.name}<br />
																			<% } %>

																		</c:forEach>
																		</p>																		
																	</c:forTokens>
												</div>
												
						  		 		 <div id="viewMore2" display="none">
						  		 		 <c:forTokens items="${plan.features }" delims=","
																		var="splitPlan" begin = "0">
																		<c:set var="splitPlan" scope="request"
																			value="${splitPlan}" />
																		
																		<p><i class="fa fa-check planscheck" aria-hidden="true"></i>
																		
																		<c:forEach items='${monthlyFeatures1}' var='monthlyFeatures1'>
																			<c:set var="fid" scope="request"
																				value="${monthlyFeatures1.id}" />
																			<% if(request.getAttribute("fid").toString().equals(request.getAttribute("splitPlan"))){ %>${monthlyFeatures1.name}<br />
																			<% } %>

																		</c:forEach>
																		</p>																		
																	</c:forTokens>
												</div>
											
						  		 		<a onclick="onViewMore2()" id="viewBtn2"><spring:message code="label.view_more"/> <i class="fa fa-angle-down" aria-hidden="true"></i></a>
						  		</div>
						  		</c:when>
						  		<c:when test="${plan.id == 50 }">
						  		<div class="statmnt">						  			 	
						  		 		<p><i class="fa fa-check planscheck" aria-hidden="true"></i> <c:out value="${plan.noOfDocuments}"></c:out> <spring:message code="label.documents"/></p>
						  		 		<p><i class="fa fa-check planscheck" aria-hidden="true"></i> <c:out value="${plan.template}"></c:out> <spring:message code="label.templates"/></p>
						  		 		 <div id="view3">
						  		 		 <c:forTokens items="${plan.features }" delims=","
																		var="splitPlan" end = "4">
																		<c:set var="splitPlan" scope="request"
																			value="${splitPlan}" />
																		
																		<p><i class="fa fa-check planscheck" aria-hidden="true"></i>
																		
																		<c:forEach items='${monthlyFeatures1}' var='monthlyFeatures1'>
																			<c:set var="fid" scope="request"
																				value="${monthlyFeatures1.id}" />
																			<% if(request.getAttribute("fid").toString().equals(request.getAttribute("splitPlan"))){ %>${monthlyFeatures1.name}<br />
																			<% } %>

																		</c:forEach>
																		</p>																		
																	</c:forTokens>
												</div>
												
						  		 		 <div id="viewMore3" display="none">
						  		 		 <c:forTokens items="${plan.features }" delims=","
																		var="splitPlan" begin = "0">
																		<c:set var="splitPlan" scope="request"
																			value="${splitPlan}" />
																		
																		<p><i class="fa fa-check planscheck" aria-hidden="true"></i>
																		
																		<c:forEach items='${monthlyFeatures1}' var='monthlyFeatures1'>
																			<c:set var="fid" scope="request"
																				value="${monthlyFeatures1.id}" />
																			<% if(request.getAttribute("fid").toString().equals(request.getAttribute("splitPlan"))){ %>${monthlyFeatures1.name}<br />
																			<% } %>

																		</c:forEach>
																		</p>																		
																	</c:forTokens>
												</div>
											
						  		 		<a onclick="onViewMore3()" id="viewBtn3"><spring:message code="label.view_more"/> <i class="fa fa-angle-down" aria-hidden="true"></i></a>
						  		</div></c:when>
						  		</c:choose>
			  			</div>
		  		</div> 			 
			</div>
			
			</c:forEach> 
			
		</div>  

	</div>	
</div>

<div class="Message" id="contactRequired">	

    <div class="modal-header">
    	<P>Please enter your 10-Digit contact number</P>
	</div>
  	<div class="modal-body">
	  <div class="row">
	  		
	  			<div class="img_parent">
							<img id="imgflage" alt="Trulli" src="https://restcountries.eu/data/ind.svg">
				</div>
				<p id="codesInd" style="margin-left: 15%">India (+91)</p>
				
                <div class="col-md-12 col-sm-12 col-xs-12">
	                <div class="form-horizontal">
					      <input type ="text" id="contactInd"  placeholder = "Contact number" class="name form-control" maxlength="12" style="width: 68%; margin-left: 32%;margin-top: -10%;">
				  	</div>
				 </div>
		</div>
		<div class="row">
			<div class="col-sm-12 col-md-12 text-right">
					      
			<button type="button" id="contactRe" onclick="updateContact();" style="text-transform: capitalize;" class="btn btn-blue"><spring:message code="label.ok1"/></button>
					     
			</div>
                <!-- Buttons --> 
            <div class="alert alert-success fade in" style="display:none;text-align:center;margin: 0px;" id="contactSubmitalert" style="display:none">
						<div id=""><i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i><a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().parent().hide();">&times;</a></div>
			</div> 
			 <div class="alert alert-danger fade in" style="display:none;text-align:center;margin: 0px;" id="contactSubmitfailalert" style="display:none">
				<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>
					<div id="submitFail"></div>
				<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>
			</div>     
        </div>
	</div> 			 
</div>

  <script src="<%=appUrl %>/js/signaturePadLoad.js"></script>
  
<%--   <script type="text/javascript" src="<%=appUrl %>/js/emotion-ratings.js"></script> --%>
<!-- <script>
var emotionsArray = ['disappointed','frowning','meh', 'happy', 'smile'];
$("#myRating").emotionsRating({
  emotionSize: 30,
  bgEmotion: 'smile',
  emotions: emotionsArray,
  color: 'gold'
});

$("#myRating1").emotionsRating({
  emotionSize: 30,
  bgEmotion: 'smile',
  emotions: emotionsArray,
  color: 'gold'
});


</script> -->
<script>
function updateContact(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
   // var contextPath = $("#contextPath").val();
    var contact = $("#contactInd").val();
    
    var valid =false;
    if(contact.length == 12){
    	contact=contact.replace(/-/g, "");
    	valid = true;
    }
   if (valid == true) {
        $.ajax({
            type: "POST",
            url: 'submitContact',
            data: {
            	contact: "+91-"+contact
            },
            beforeSend: function(xhr) {
            	$("#loader2").show();
                xhr.setRequestHeader(header, token);
            },
            complete: function() {
            	$("#loader2").hide();
            },
            success: function(response) {
            	//alert('SUCCESS');
                if (response == 1) {
                    $("#contactRequired").hide();
                	$('.overlay-bg').hide();
                	$.alert({
                	    title: '',
                	    content: 'Contact number updated',
                	});
                	sessionStorage.setItem("mobileUpdated",true);
                }else if(response == 2){
                	 $("#contactSubmitfailalert").show();
                     $("#submitFail").html("Contact number already registered");
                }else {
                    $("#contactSubmitfailalert").show();
                    $("#submitFail").html(response);
                }
            },
            error: function(xhr, textStatus, errorThrown) {
                alert('<spring:message code="label.loading_error"/> ' + errorThrown);
                console.log(errorThrown);
                return false;
            }
        });
    }else{
    	$("#contactSubmitfailalert").show();
        $("#submitFail").html("Please enter valid number");
    }
}
function onViewMore1() {
	
	  var view = document.getElementById("view1");
	  var moreText = document.getElementById("viewMore1");
	  var btnText = document.getElementById("viewBtn1");

	  if (view.style.display === "none") {
		 view.style.display = "inline";
	    btnText.innerHTML = "View more" + '&nbsp;<i class="fa fa-angle-down" aria-hidden="true"></i>'; 
	    moreText.style.display = "none";
	  
	  } else {
		 view.style.display = "none";
	    btnText.innerHTML = "View less"+ '&nbsp;<i class="fa fa-angle-up" aria-hidden="true"></i>'; 
	    moreText.style.display = "inline";
	  
	  }
	}
	
function onViewMore2() {
	
	  var view = document.getElementById("view2");
	  var moreText = document.getElementById("viewMore2");
	  var btnText = document.getElementById("viewBtn2");

	  if (view.style.display === "none") {
		 view.style.display = "inline";
	    btnText.innerHTML = "View more" + '&nbsp;<i class="fa fa-angle-down" aria-hidden="true"></i>'; 
	    moreText.style.display = "none";
	  
	  } else {
		 view.style.display = "none";
	    btnText.innerHTML = "View less"+ '&nbsp;<i class="fa fa-angle-up" aria-hidden="true"></i>'; 
	    moreText.style.display = "inline";
	  
	  }
	}
	
function onViewMore3() {
	
	  var view = document.getElementById("view3");
	  var moreText = document.getElementById("viewMore3");
	  var btnText = document.getElementById("viewBtn3");

	  if (view.style.display === "none") {
		 view.style.display = "inline";
	    btnText.innerHTML = "View more" + '&nbsp;<i class="fa fa-angle-down" aria-hidden="true"></i>'; 
	    moreText.style.display = "none";
	  
	  } else {
		 view.style.display = "none";
	    btnText.innerHTML = "View less"+ '&nbsp;<i class="fa fa-angle-up" aria-hidden="true"></i>'; 
	    moreText.style.display = "inline";
	  
	  }
	}

if(('${activePurchase.planName }' == 'FREE TRIAL' || '${activePurchase.planName }' == 'FREE VERSION') && sessionStorage.getItem("freePopUp")){
	$("#plansModal").show();
	$('.overlay-bg').show();
	$('.overlaywhite_bg').show();
	$("#view1").show();
	$("#viewMore1").hide();
	$("#view2").show();
	$("#viewMore2").hide();
	$("#view3").show();
	$("#viewMore3").hide();
}

if(('${activePurchase.planName }' == 'FREE TRIAL' || '${activePurchase.planName }' == 'FREE VERSION')){
	$("#freeVersionBlock").css("display","block");
}else{
	$("#freeVersionBlock").hide(100);
	var renamePlan = "${activePurchase.planName }";
	var changedPlan = renamePlan.replace(" India","");
	$("#planIndian").html(changedPlan);
	$("#subscriPlan").css("display","block");
	if('${phone}' == "" && '${countryCode}' == 'IN' && sessionStorage.getItem("mobileUpdated") == null){
		//alert(sessionStorage.getItem("mobileUpdated"));
		$("#contactRequired").show();
		$('.overlay-bg').show();
	}
	
}

if('${rating}' != 0){
	$("#emoji_popup"+'${rating}'+"-checkbox"+'${rating}').attr("checked","checked");	
}else{
	$("#emoji_popup5-checkbox5").attr("checked","checked");
}
$("#upgradIndividualPlan").click(function(){
	$("#plansModal").show();
	$('.overlay-bg').show();
	$('.overlaywhite_bg').show();
})
$("#upgradProfessionalPlan").click(function(){
	$("#plansModal").show();
	$('.overlay-bg').show();
	$('.overlaywhite_bg').show();
})
$( "#btnfreeVersion" ).click(function() {
	sessionStorage.removeItem("freePopUp");
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var contextPath=$("#contextPath").val();
	$.ajax({  
	     type : "GET",   
	     url : contextPath+"app/continuetofree",   
	     //data : "imgType="+typeValue.fulltrim(),  
	     dataType: 'json',
	     beforeSend : function(xhr) {	                
	    		xhr.setRequestHeader(header, token);
	    },
	     success : function(response) {  
	    	//alert('success');
	    	if("noreload" != response){
	    		location.reload();
	    	}
	    		$("#plansModal").hide();
	    		$('.overlay-bg').hide();
	    		$('.overlaywhite_bg').hide();

	     },  
	     error : function(e) {  
	      alert('<spring:message code="label.slf_error"/>: ' + e);   
	     }  
	 });  
});

 function givefeedback(){
	    var token = $("meta[name='_csrf']").attr("content");
	    var header = $("meta[name='_csrf_header']").attr("content");
	    var contextPath = $("#contextPath").val();
	    var name = $("#name")
	    var userFeedback = $("input[name='smiley']:checked").val();
	    var message = $("#message");
	    
	    var valid = $("#feedbackform").valid();
	   
	   if (valid == true) {
	        $.ajax({
	            type: "POST",
	           url: 'submitfeedback',
	            data: {
	                name: name.val(),
	                message: message.val(),
	                userFeedback: userFeedback
	            },
	            beforeSend: function(xhr) {
	            	$("#loader2").show();
	                xhr.setRequestHeader(header, token);
	            },
	            complete: function() {
	            	$("#loader2").hide();
	            	document.getElementById("message").value ="";
	            },

	            success: function(response) {
	            	//alert('SUCCESS');
	                if (response == 1) {
	                	//$("#sendbtn1").buttonLoader('stop');
	                    $("#feedbacksuccessalert").show();
	                    $("#emoji_popup"+userFeedback+"-checkbox"+userFeedback).attr("checked","checked");
	                } else {

	                    $("#feedbackfailalert").show();
	                    $("#emailfail").html(response);
	                }
	            },
	            error: function(xhr, textStatus, errorThrown) {
	                alert('<spring:message code="label.loading_error"/> ' + errorThrown);
	                console.log(errorThrown);
	                return false;
	            }
	        });
	    }
	}
 
 var feedbackform=$("#feedbackform").validate({
	 	
		rules: {
			message:"required",
		},
		//specify validation error messages
		messages: {
			
			message: "<spring:message code="label.slf_msgval"/>",
			
		},
});
 $('[data-dismiss=modal]').on('click', function (e) {
	 $(".alert").hide();
	 $("#message-error").css("display","none");
    $('#message').val("");
    $("#feedbacksuccessalert").hide();
});
 
 $('body').click(function (event) 
		 {
		    if(!$(event.target).closest('#feedbackModal').length && !$(event.target).is('#feedbackModal')) {
		    	  $("#feedbacksuccessalert").hide();
		    }     
		 });
 function planTemp(){
	//alert(plan+" "+planId+" "+planDuration);
	 $('.overlay-bg').show();
	 $('.overlaywhite_bg').show();
	 $("#viewplantemp").show();
 }
 
 function tempClose(){
	 $('.overlay-bg').hide();
	 $('.overlaywhite_bg').hide();
	 $("#viewplantemp").hide();
 }
 
 function upgradePlan(planId){
	 //alert("upgrade"+planId);
	 var contextPath = $("#contextPath").val();
	 window.location = contextPath+"upgradeplan?planId="+planId+"&category_name=General%20Plans&category=1";
 }
	 function freeUpgradePlan(){
		   var contextPath=$("#contextPath").val();
		   window.location.href= contextPath+"plans?category_name=General%20Plans&category=1";
		     
		   }
</script>