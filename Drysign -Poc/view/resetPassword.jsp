<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import = "java.util.ResourceBundle" %>
<%@ page import="com.drysign.model.Registration, org.springframework.security.core.context.SecurityContextHolder, org.springframework.security.core.Authentication" %>
<% 
String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
ResourceBundle resource = ResourceBundle.getBundle("commonsutils");
String drySignPath =resource.getString("DrySignPath");
String locale = request.getParameter("locale");
String region = request.getParameter("region");
if(locale == null){
	locale = "en";
}
%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <title><spring:message code="label.rest_pass"/> | DrySign</title>
      <link rel="icon" type="image/png" sizes="32x32" href="<%=appUrl %>/images/fav-icon/favicon-32x32.png">
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="_csrf" content="${_csrf.token}"/>
	  <meta name="_csrf_header" content="${_csrf.headerName}"/>
      <!-- <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> -->
      <link rel="stylesheet" href="<%=appUrl %>/css/bootstrap.min.css">
   
      <script src="<%=appUrl %>/js/bootstrap.min.js"></script>
      <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> -->
      <link rel="stylesheet" href="<%=appUrl %>/css/fontAwesome4-4-0.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.5.2/jquery-confirm.min.css">
      <link rel="stylesheet" href="<%=appUrl %>/css/login.css">
      <link rel="stylesheet" href="<%=appUrl %>/css/style.css"/>
      <link href="<%=appUrl %>/css/buttonLoader.css" rel="stylesheet" type="text/css">
      <%-- <link rel="stylesheet" href="<%=appUrl %>/css/exela_theme.css"/> --%>
	  <style> 
input.secrete{
   /* -webkit-text-security:disc; */
   font-size:15px;
}

	  .digit-VVV{
	  background:#fff;} 
	    .hidden_destiny {
         display:none;
         }
         .hidden_destiny2 {
         display:none;
         }
         .hidden_destiny3 {
         display:none;
         }
         .otpbutton{
         width:100%;
         }
	  #t2{
	  border:none;
	  background:#fff;
	  width:100%;
	  color:#e10543;
	  }
	  #t2:focus{
	  border:none !important;}
	  #resetbtn{
	  width:100%;}
		.body, html {
			  height: 100%;
		  }
		  form .error {
	 		color: #ff0000;
	 	  }
	 	  .error1 {
			padding: 15px;
			margin-bottom: 20px;
			border: 1px solid transparent;
			border-radius: 4px;
			color: #a94442;
			background-color: #f2dede;
			border-color: #ebccd1;
		  }
		  .msg {
			padding: 15px;
			margin-bottom: 20px;
			border: 1px solid transparent;
			border-radius: 4px;
			color: #31708f;
			background-color: #d9edf7;
			border-color: #bce8f1;
		  }
		  .greenButton{
		  	font-weight: 400;
		  	color: #fff;border-radius: 0;
		  	font-size: 14px;
		  	font-family: roboto;
		  	text-transform: uppercase;
		  	padding: 3px 12px;
		  	background: #00bc9c;
		  	border-radius: 4px;"
		  }
		    .field-icon {
			float: right;
			/* margin-left: -25px; */
			margin-top: -25px;
			position: relative;
			z-index: 2;
		  }
		    a i.fa {
     color: #fff;
}
	 	  <style>
  </style>
	</head>
   <body class="bg">
   <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-102458969-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-102458969-1');
</script>
   <input type="hidden" id="contextPath" value="<%=appUrl %>/"/>
   <input type="hidden" id="locale" value="<%=locale %>"/>
   <input type="hidden" id="region" value="<%=region %>"/>
      <section>
		 <!-- Register -->
       	  <div class="login">
            <div class="wrapper-lg">
               <div class="text-center" id="passwordreset-icon" >
               <!-- <a href="<%=drySignPath%>/<%=locale%>"> -->
               
               <a href="<%=appUrl %>">
               <img src="<%=appUrl %>/images/logo.png" alt="Logo" class="iMg" title="Logo"/></a></div>
               <div class="login-info ">
                	<div class="message text-center" id="passwordreset-success" style="display:none">
					   <p><img src="<%=appUrl %>/images/message-bg.png"/></p>
					   <h4><spring:message code="label.passreset"/></h4>
					      <a class="btn loginBackbutton btn-blue "><spring:message code="label.conti-drysign"/></a>                   
				   </div>
				   <div class="message text-center" id="passwordreset-error" style="display:none">
					   <p><img src="<%=appUrl %>/images/fail.png"/></p>
					   <h4 class="error"><spring:message code="label.invalid"/></h4>
					  	<!-- <p>Congratulations! Your new password has been successfully created.</p> -->
					      <a class="btn loginBackbutton btn-blue "><spring:message code="label.conti-drysign"/></a>                   
				   </div>
				   <div class="message text-center" id="passwordreset-error2" style="display:none">
					   <p><img src="<%=appUrl %>/images/fail.png"/></p>
					   <h4 class="error"><spring:message code="label.loading_error"/></h4>
					  	<!-- <p>Congratulations! Your new password has been successfully created.</p> -->
					      <a class="btn loginBackbutton btn-blue "><spring:message code="label.conti-drysign"/></a>                   
				   </div>
				   
				   
				   <div class="message text-center" id="passwordreset-error3" style="display:none">
					   <p><img src="<%=appUrl %>/images/fail.png"/></p>
					   <h4 class="error"><spring:message code="label.something_went_wrong"/></h4>
					  	<!-- <p>Congratulations! Your new password has been successfully created.</p> -->
					      <a class="btn loginBackbutton btn-blue "><spring:message code="label.conti-drysign"/></a>                   
				   </div>				   
				   
				 	<div class="alert alert-danger fade in" style="display:none;text-align:center;margin: 0px;" id="passwordModelalert">
				    		<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>
						<div id="passwordmessage"></div>
						<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a><span></span>
					</div> 
					<br>
					<br>
					<div class="message text-center" id="error-message" style="display:none">
						<a class="btn loginBackbutton btn-blue "><spring:message code="label.conti-drysign"/></a>
						</div>
                  <form id="passwordreset-form">
				     <div class="form-group has-feedback paddTB15 ">
				     <!--  <textarea id="t2" class="error" readonly  >
                            </textarea> -->
                           <label><spring:message code="label.login-Password"/></label>
                           <span toggle="#password-field1" class="fa fa-fw fa-eye field-icon toggle-password1"></span>
                          <!--vvv  <input type="password" id="password-field1" name="password" placeholder="Enter Password" class="form-control" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$">
                            <span id="t2" class="error" style="display:none">Password should contain at least 1 - lowercase, uppercase alphabet, number, special character</span>
                            <label id="checkBoxerr" style="display:none;color:#e10543">This field is required.</label>
                    		 -->
                    		<input type="password" id="password-field1" name="password" placeholder="<spring:message code="label.password"/>" class="form-control" maxlength="15" />
                        
                     </div>
                     <div class="form-group has-feedback paddTB15">
                   
                           <label><spring:message code="label.con_pass"/></label>
                           <span toggle="#password-field2" class="fa fa-fw fa-eye field-icon toggle-password2"></span>
                           <!--vvv  <input type="password" id="password-field2"  onclick="test_str()" name="confirmpassword" placeholder="Enter Password" class="form-control" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$">
                            <span id="t3" class="error" style="display:none">Password should contain at least 1 - lowercase, uppercase alphabet, number, special character</span>
                           --> 	
                           	 <input type="password" id="password-field2" name="confirmpassword" placeholder="<spring:message code="label.con_pass"/>" class="form-control" maxlength="15" />
  
                           	<input type="hidden" id="email" name="email"   value="<c:out value="${email}"></c:out>"/>
                           	<input type="hidden" id="userid" name="userid"   value="<c:out value="${userid}"></c:out>"/>
                           	<input type="hidden" id="token" name="token"   value="<c:out value="${token}"></c:out>"/>
                           	<input type="hidden" id="hashValue" name="hashValue"   value="<c:out value="${hashValue}"></c:out>"/>
                           <!--vvv 	<label id="checkBoxerr2" style="display:none;color:#e10543">This field is required.</label> -->
                     </div>
                     
                     
                     <div id="SecureCodeDiv" class="form-group digit-group" data-group-name="digits" data-autosubmit="false" autocomplete="off" style="padding: 15px 0px;">
							<label><spring:message code="label.secu_code"/></label>
					          <!-- <input id="partitioned" type="text" maxlength="6" /> -->
					          <div>
					          <!-- name="digit-1"name="digit-2"name="digit-3"name="digit-4"name="digit-5" name="digit-6"-->
								<input type="password" id="digit-1_Forgot" class="digit-VVV secrete1" name="digit-VVV" data-next="digit-2_Forgot" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-2_Forgot" class="digit-VVV secrete1" name="digit-VVV" data-next="digit-3_Forgot" maxlength="1" data-previous="digit-1_Forgot" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-3_Forgot" class="digit-VVV secrete" name="digit-VVV" data-next="digit-4_Forgot" maxlength="1" data-previous="digit-2_Forgot" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								
								<input type="password" id="digit-4_Forgot" class="digit-VVV secrete1" name="digit-VVV" data-next="digit-5_Forgot" maxlength="1" data-previous="digit-3_Forgot" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-5_Forgot" class="digit-VVV secrete1" name="digit-VVV" data-next="digit-6_Forgot" maxlength="1" data-previous="digit-4_Forgot" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-6_Forgot" class="digit-VVV secrete1" name="digit-VVV" data-previous="digit-5_Forgot" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="hidden" class="secureCode" id="secureCodeVVV" name="secureCodeVVV"/>
							</div>
					<div class="form-group" style="padding:0 3px;">
						<label id="securityCodeSignUpErr1" style="display:none;color:#e10543"><spring:message code="label.enter6Digit"/></label>
					</div>	
						</div>                        
                           
                     <div class="row">
						 <%-- <div class="col-md-12 text-right"> <button type="button" id="resetbtn" onclick="resetPassword();"  class="btn has-spinner btn-primary"><spring:message code="label.rest_pass"/></button> </div>  --%>                       
                     	<!-- Above Original Button -->
							<div class="col-md-12 text-right">
								<a href="#" class="otpForgotPassword ">
									<button type="button" id="resetbtn"
										class="btn has-spinner btn-primary" onclick="verifyLogin();" >
										<spring:message code="label.rest_pass" />
									</button>
								</a>
							</div>
						</div>
                     
                   </form>
               </div>
                <div class="wrapper-footer">
			 	<div class="wrapper-footer_content">
				 <p> &copy;  <script>document.write(new Date().getFullYear())</script> <spring:message code="label.company"/> </p>
			 	</div>
			 </div>
            </div>
			
         </div>
      <!-- Verify-mfa-token -->   
     <div class="signup-securecode">
      <div class="wrapper-lg">
      <a class="backbutton pull-left"><span
					class="glyphicon glyphicon-arrow-left"></span></a>
               <div class="text-center">
               <!-- <a href="<%=drySignPath%>/<%=locale%>"> -->
               
               <a href="<%=appUrl %>">
               <img src="<%=appUrl %>/images/logo.png" alt="Logo" class="iMg" title="Logo"/></a></div>
               <!-- OTP Body -->
      
               <h1><spring:message code="label.twoStepVerification" /></h1>
               <h3><spring:message code="label.LoginWithSecureCode" /></h3>
               <form id="otplogin-form" method="get" class="digit-group" data-group-name="digits" data-autosubmit="false" autocomplete="off">
                  <div class="radio col-xs-12 col-md-12">
                     <label> <input type="radio" class="fate" name="fate" 
                        id="radio_SecureCode" value="SecureCode">
                     &nbsp;&nbsp;<spring:message code="label.enterSecureCode" /><span
                        class="checkmark"  id="secureCode_span"></span>
                     </label>
                  </div>
                  <div id="clicked_SecureCode" class="hidden_destiny" style="display:block;">
                     <div class="form-group" style="padding: 15px 0px;">
                      
                        <div>
                           <input type="password" id="digit-11" class="digit-VVV secrete" name="digit-11"  data-next="digit-22" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
                           <input type="password" id="digit-22" class="digit-VVV secrete" name="digit-22" data-next="digit-33" data-previous="digit-11" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric" />
                           <input type="password" id="digit-33" class="digit-VVV secrete" name="digit-33" data-next="digit-44" data-previous="digit-22" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
                           <input type="password" id="digit-44" class="digit-VVV secrete" name="digit-44" data-next="digit-55" data-previous="digit-33" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
                           <input type="password" id="digit-55" class="digit-VVV secrete" name="digit-55" data-next="digit-66" data-previous="digit-44" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
                           <input type="password" id="digit-66" class="digit-VVV secrete" name="digit-66" data-previous="digit-55" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
                        </div>
      						<input type="hidden" class="secureCodeVVV" id="secureCodeVVV" name="secureCodeVVV"/>
                     </div>
                  </div>
                  <div class="form-group" style="padding:0 3px;">
						<label id="securityCodeSignUpErr" style="display:none;color:#e10543"><spring:message code="label.enter6Digit" /></label>
					</div>	
                  
                  <h3><spring:message code="label.loginOTP" /></h3>
                  <div class="radio col-xs-12 col-md-12">
                     <label> <input type="radio" class="fate" name="fate" 
                        id="radio_Email" value="Email">
                     &nbsp;&nbsp; <spring:message code="label.otpOnEmail" /><span
                        class="checkmark"></span> 
                     </label>
                  </div>
                  <div id="clicked_Email" class="hidden_destiny">
                      <div class="message" id="OTP_verification" >
                        <h1><spring:message code="label.otpVerification" /></h1>
                        <h3><spring:message code="label.verificationCodeEmail" /></h3>
                        <div class="form-group" style="padding: 15px 0px;">
                           <div>
                              <input type="password" id="digit-01" class="digit-otpVVV secrete" name="digit-01" data-next="digit-02" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
                              <input type="password" id="digit-02" class="digit-otpVVV secrete" name="digit-02" data-next="digit-03" data-previous="digit-01" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
                              <input type="password" id="digit-03" class="digit-otpVVV secrete" name="digit-03" data-next="digit-04" data-previous="digit-02" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
                              <input type="password" id="digit-04" class="digit-otpVVV secrete" name="digit-04" data-previous="digit-03" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
                           </div>
                           <input type="hidden" class="otpCodeVVV" id="otpCodeVVV" name="otpCodeVVV" />
                        </div>
                         <div class="form-group" style="padding:0 3px;">
							<label id="otpSignUpErr" style="display:none;color:#e10543"><spring:message code="label.enter4Digit" /></label>
						</div>	
					
                        <div class="text-right resendotp">
                           <a href="#" class="anchor-decoration"><spring:message code="label.resendOTP" /></a>
                        </div>
                     </div>
                  </div>
                  <div class="radio col-xs-12 col-md-12">
                     <label> <input type="radio" class="fate" name="fate" 
                        id="radio_Mobile" value="Mobile">
                     &nbsp;&nbsp; <spring:message code="label.otpOnMobile" /><span
                        class="checkmark" id="mobile_span"></span>
                     </label>
                  </div>
                  <div id="clicked_Mobile" class="hidden_destiny">
                     <div class="message" id="OTP_verification" >
                        <h1><spring:message code="label.otpVerification" /></h1>
                        <h3><spring:message code="label.verificationCodeMobile" /></h3>
                        <div class="form-group" style="padding: 15px 0px;">
                           <div>
                              <input type="password" id="digit-1" class="digit-otpMobile secrete" name="digit-1" data-next="digit-2" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
                              <input type="password" id="digit-2" class="digit-otpMobile secrete" name="digit-2" data-next="digit-3" data-previous="digit-1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
                              <input type="password" id="digit-3" class="digit-otpMobile secrete" name="digit-3" data-next="digit-4" data-previous="digit-2" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
                              <input type="password" id="digit-4" class="digit-otpMobile secrete" name="digit-4" data-previous="digit-3" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
                           </div>
                           <input type="hidden" class="otpCodeMob" id="otpCodeMob" name="otpCodeMob"/>
                        </div>
                        <div class="form-group" style="padding:0 3px;">
							<label id="otpSignUpErr" style="display:none;color:#e10543"><spring:message code="label.enter4Digit" /></label>
						</div>	
					
                        <div class="text-right resendotp">
                           <a href="#" class="anchor-decoration"><spring:message code="label.resendOTP" /></a>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-12 text-right">
                        <button type="button"
                           class="btn btn-primary otpbutton" onclick="verifyLogin();"><spring:message code="label.submit" /></button>
                     </div>
                  </div>
               </form>
               <!-- Body End -->
               <div class="wrapper-footer">
                  <div class="wrapper-footer_content">
                     <p>
                        &copy; <script>
                           document.write(new Date().getFullYear())
                        </script>
                        <spring:message code="label.company"/>
                     </p>
                  </div>
               </div>
            </div>
</div>
 </section>
 <!-- script --> 
 <script src="<%=appUrl %>/js/js_landing/jquery-1.11.3.min.js"></script>   
    <script src="<%=appUrl %>/js/js_landing/bootstrap.js"></script>
 <script src="<%=appUrl %>/js/jquery-confirm.min.js"></script>
 <!-- Validation -->
 <script src="<%=appUrl %>/js/jquery.validate.js"></script>
 <!-- Loader -->
 <script src="<%=appUrl %>/js/jquery.buttonLoader.js"></script>
 <script>
var input = document.getElementById("password-field2");
input.addEventListener("keyup", function(event) {
	
  if (event.keyCode === 13) {
   event.preventDefault();
   document.getElementById("resetbtn").click();
  }
});
</script>
<script type="text/javascript">
$('a.loginBackbutton').click(function() {
	
	if(window.location.href.indexOf("region=in") != -1 || window.location.href.indexOf("region=IN") != -1 ){
		window.location = $("#contextPath").val()+"login?locale="+$("#locale").val()+"&region="+$("#region").val();
	}
	else{
		window.location = $("#contextPath").val()+"login?locale="+$("#locale").val();
	}
});
</script>
 <script>
 
 //vvv set securecode in a hidden field
 $(document).on("change", ".digit-VVV", function() {
	 
	    var code="";
	    $(".digit-VVV").each(function(){		     
	        code+=$(this).val();
	    });		   		    
	    $("#secureCodeVVV").val(code);
	    
});
//vvv set otp in a hidden field
 $(document).on("change", ".digit-otpVVV", function() {
	    var code="";
	    $(".digit-otpVVV").each(function(){		     
	        code+=$(this).val();
	        
	    });		   		    
	    $("#otpCodeVVV").val(code);
	    
});

 $(document).on("change", ".digit-otpMobile", function() {
	    var code="";
	    $(".digit-otpMobile").each(function(){		     
	        code+=$(this).val();
	        
	    });		   		    
	    $("#otpCodeMob").val(code);
	    
});

 
$(document).ready(function() {
	var flagMobile='${radio_mobile}';
	var flagEmail='${radio_email}';
	var flagSecure='${radio_securecode}';
	var isSecureCode = '${isSecureCode}';
	//alert("secureCode: " +isSecureCode);
	
	/* if(flagMobile ==true || flagMobile =="true"){
		document.getElementById("radio_Mobile").disabled=false;
		 document.getElementById("digit-1").disabled=false;
		 document.getElementById("digit-2").disabled=false;
		 document.getElementById("digit-3").disabled=false;
		 document.getElementById("digit-4").disabled=false;
	     
	     $('#radio_Mobile').attr('style', 'background-color: white !important');
	     $('#mobile_span').attr('style', 'background-color: white !important');
     	
	 }else{
		 document.getElementById("radio_Mobile").disabled=true;
		 
		 document.getElementById("digit-1").disabled=true;
		 document.getElementById("digit-2").disabled=true;
		 document.getElementById("digit-3").disabled=true;
		 document.getElementById("digit-4").disabled=true;
	     $('#radio_Mobile').attr('style', 'background-color: #ccc !important');
	     $('#mobile_span').attr('style', 'background-color: #ccc !important');
     	
	 }
	if(flagEmail ==true || flagEmail =="true"){
		document.getElementById("radio_Email").disabled=false;
		document.getElementById("digit-01").disabled=false;
		 document.getElementById("digit-02").disabled=false;
		 document.getElementById("digit-03").disabled=false;
		 document.getElementById("digit-04").disabled=false;
	 }else{
		 document.getElementById("radio_Email").disabled=true;
		 
		 document.getElementById("digit-01").disabled=true;
		 document.getElementById("digit-02").disabled=true;
		 document.getElementById("digit-03").disabled=true;
		 document.getElementById("digit-04").disabled=true;
	 } */
	if(isSecureCode ==true || isSecureCode =="true"){
		document.getElementById("SecureCodeDiv").disabled=false;
		$("#SecureCodeDiv").show();
		//document.getElementById("radio_SecureCode").checked=true;
		document.getElementById("digit-1_Forgot").disabled=false;
		 document.getElementById("digit-2_Forgot").disabled=false;
		 document.getElementById("digit-3_Forgot").disabled=false;
		 document.getElementById("digit-4_Forgot").disabled=false;
		 document.getElementById("digit-5_Forgot").disabled=false;
		 document.getElementById("digit-6_Forgot").disabled=false;
		// $("#radio_SecureCode").prop("checked", true);
	     $("#radio_SecureCode").attr('style', 'background-color: white !important');
	    $("#secureCode_span").attr('style', 'background-color: white !important');
  	   
	 	
	 }else{
		 document.getElementById("SecureCodeDiv").disabled=true;
		 $("#SecureCodeDiv").hide();
		 //document.getElementById("radio_SecureCode").checked=false;
		 document.getElementById("digit-1_Forgot").disabled=true;
		 document.getElementById("digit-2_Forgot").disabled=true;
		 document.getElementById("digit-3_Forgot").disabled=true;
		 document.getElementById("digit-4_Forgot").disabled=true;
		 document.getElementById("digit-5_Forgot").disabled=true;
		 document.getElementById("digit-6_Forgot").disabled=true;
		 $("#radio_SecureCode").attr('style', 'background-color: #ccc !important');
		 $("#secureCode_span").attr('style', 'background-color: #ccc !important');
		// $("#radio_SecureCode").prop("checked", false);
	 }
	var flag='${flag}';
	if(flag == 0){
		$("#passwordreset-form").hide();
		$("#passwordreset-error").show();
	}else if(flag == 2){
		$("#passwordreset-form").hide();
		$("#passwordreset-error2").show();
	}else if(flag == 3){
		$("#passwordreset-form").hide();
		$("#passwordreset-error3").show();
	}
	
	
	//vvv
/* 	 $.validator.addMethod("pwcheck", function(value, element) {
	        return this.optional(element) || /^[a-zA-Z0-9!@#$%^*_&\-]+$/i.test(value)  
	        				&& /[a-z]/.test(value) // has a lowercase letter
	    			       && /[A-Z]/.test(value) // has a lowercase letter
	    			       && /\d/.test(value) // has a digit;
	    			       && /[!@#$%^*_&\-]/.test(value); // has a lowercase letter
	    	}, "Password should contain at least 1 - lowercase, uppercase alphabet, number, special character from @#$%^*_&- ");
	 
	
}); */

$.validator.addMethod("pwcheck", function(value, element) {
     return this.optional(element) || /^[a-zA-Z0-9\`\-=\]\[\;\',\.\\\/~!@#\$%\^&\*()_\+{}\|:"<>\?]+$/i.test(value)  
    				&& /[a-z]/.test(value) // has a lowercase letter
			       && /[A-Z]/.test(value) // has a uppercase letter
			       && /\d/.test(value) // has a digit;
			       && /[\`\-=\]\[\;\',\.\\\/~!@#\$%\^&\*()_\+{}\|:"<>\?]/.test(value);
	}, "<spring:message code="label.passwordShouldBeAlphanumeric"/>");


});



/* var myInput = document.getElementById("passwordreset-form");
myInput.onkeyup = function() {
	  // Validate lowercase letters
	  var lowerCaseLetters = /[a-z]/g;
	  if(myInput.value.match(lowerCaseLetters)) {  
	    letter.classList.remove("invalid");
	    letter.classList.add("valid");
	  } else {
	    letter.classList.remove("valid");
	    letter.classList.add("invalid");
	  }
	  
	  // Validate capital letters
	  var upperCaseLetters = /[A-Z]/g;
	  if(myInput.value.match(upperCaseLetters)) {  
	    capital.classList.remove("invalid");
	    capital.classList.add("valid");
	  } else {
	    capital.classList.remove("valid");
	    capital.classList.add("invalid");
	  }

	  // Validate numbers
	  var numbers = /[0-9]/g;
	  if(myInput.value.match(numbers)) {  
	    number.classList.remove("invalid");
	    number.classList.add("valid");
	  } else {
	    number.classList.remove("valid");
	    number.classList.add("invalid");
	  }
	  
	  // Validate length
	  if(myInput.value.length >= 8) {
	    length.classList.remove("invalid");
	    length.classList.add("valid");
	  } else {
	    length.classList.remove("valid");
	    length.classList.add("invalid");
	  }
	} */
	
 var passwordForm=$("#passwordreset-form").validate({
		//specify the validation rules
		rules: {
			password: {
				required: true,
				minlength : 8,
				maxlength:15,
				pwcheck: true		//vvv exelaAUth password rule
				
			},
			confirmpassword : {
				required: true,
				//minlength : 8,
				equalTo : "#password-field1"
			}
		},
		//specify validation error messages
		messages: {
			/* password: {
				required: "<spring:message code="label.pass_required"/>",
				//minlength: "<spring:message code="label.password_minlength"/>",
				
			}, */
			confirmpassword:"<spring:message code="label.passwordNotMatch"/>",
			password: {
               		minlength: "<spring:message code="label.passwordShouldBeAlphanumeric"/>",
               		required: "<spring:message code="label.field_reqiured"/>"
            }
			 /* confirmpassword:{
				required: "<spring:message code="label.cnt_blank"/>",
				minlength: "<spring:message code="label.password_minlength"/>",
				equalTo:"<spring:message code="label.confirm_pass_equal"/>"
			} */ 
		}
}); 
	/*vvv8May
	function test_str(){
		 var res; 
	      var str = 
	          document.getElementById("password-field1").value; 
	      var str1=document.getElementById("password-field2").value;
	      if (str.match(/[a-z]/g) && str.match( 
          /[A-Z]/g) && str.match( 
          /[0-9]/g) && str.match( 
          /[^a-zA-Z\d]/g) && str.length >= 8) 
      res = ""; 
  else 
      res = "Password should contain at least 1 - lowercase, uppercase alphabet, number and special character";
  if (str1.match(/[a-z]/g) && str1.match( 
	              /[A-Z]/g) && str1.match( 
	              /[0-9]/g) && str1.match( 
	              /[^a-zA-Z\d]/g) && str1.length >= 8) 
	          res1 = ""; 
	      else 
	          res1 = "Password should contain at least 1 - lowercase, uppercase alphabet, number and special character";
	      
	      document.getElementById("t2").value = res; 
	      document.getElementById("t3").value = res1;
	} */
	
	//vvv validate for sign up
	function validateSecurityCode(securityCode, otpCode,otpCodeMob){
	//add radio button check 	
	
	
	if($("#radio_SecureCode").is(":checked")){
		if(securityCode =="undefined" || securityCode.length < 6){	
				$("#securityCodeSignUpErr").css("display", "block");
				$("#otpSignUpErr").css("display", "none");
				return false;
			}else{
					$("#securityCodeSignUpErr").css("display", "none");
					$("#otpSignUpErr").css("display", "none");
					return true;
			} 
	}
	else if($("#radio_Email").is(":checked") || $("#radio_Mobile").is(":checked")){
		if((otpCode =="undefined" && otpCodeMob =="undefined") || (otpCodeMob.length < 4 && otpCode.length < 4)){	
				$("#otpSignUpErr").css("display", "block");
				$("#securityCodeSignUpErr").css("display", "none");
				return false;
		}
		
		else{
				$("#securityCodeSignUpErr").css("display", "none");
				$("#otpSignUpErr").css("display", "none");
				return true;
		} 
	}
	}

    $("input[type=radio]").click(function(){
     	$("input[Type=text]").val("");
     });
         
	 function verifyLogin(){
		  var code="";
		  var token = $("meta[name='_csrf']").attr("content");
		  var header = $("meta[name='_csrf_header']").attr("content");
		  var contextPath=$("#contextPath").val();
		  var valid = $("#passwordreset-form").valid();
		  $(".digit-VVV").each(function(){		     
		        code+=$(this).val();
		    });		   		    
		    $("#secureCodeVVV").val(code);
		   // alert(code);
		 // var radioVar = $("#radio_SecureCode").is(":checked")
		  //var validSecureCode = validateSecurityCode($("#secureCodeVVV").val(),$("#otpCodeVVV").val(),$("#otpCodeMob").val());
		  if(valid == true /* && validSecureCode == true */){
				var data = {
						  "email" :$("#email").val(),
						  "userid" :$("#userid").val(),
						  "token" :$("#token").val(),
			    	      "password" :$("#password-field1").val(),
			    	      "confirmpassword" :$("#password-field2").val(),
			    	      "secureCodeVVV" :$("#secureCodeVVV").val(),
			    	     /*  "otpCodeVVV":$("#otpCodeVVV").val(),
			    	      "otpCodeMob":$("#otpCodeMob").val(),
			    	      "secureCodeVVV":$("#secureCodeVVV").val(),
			    	      "radio_SecureCode":$("#radio_SecureCode").is(":checked"),
			    	      "radio_Email":$("#radio_Email").is(":checked"),
			    	      "radio_Mobile":$("#radio_Mobile").is(":checked"),
			    	      */ "hashValue":$("#hashValue").val()
			    }
				 $.ajax({
					contentType : 'application/json; charset=utf-8',
					type : "POST",
					url : "updateResetPassword",
					dataType : 'json',
					crossDomain: true,
					data : JSON.stringify(data),
					beforeSend : function(xhr) {
						$('#resetbtn').buttonLoader('start');
						xhr.setRequestHeader(header, token);
					},
					complete : function() {
						$("#resetbtn").buttonLoader('stop');
					},
					success : function(response) {
						if(response.msg == 1 || response.msg == "1"){
							//alert('Success');
							$(".signup-securecode").hide();
							$("#passwordmessage").hide();
							$("#passwordModelalert").hide();
							$("#otplogin-form").hide();
							$("#passwordreset-form").hide();
							$("#passwordreset-success").show();
							$("#error-message").hide();
						}else{
							$("#otplogin-form").hide();
							$("#password-field1").val('');
							$("#password-field2").val('');
							$("#password-field1").show();
							$("#password-field2").show();
							$(".signup-securecode").hide();
							$("#passwordModelalert").show();
							$("#passwordreset-form").show();
							//$("#passwordmessage").html(response.msg);
							$("#passwordmessage").html(<c:out value='response.msg'></c:out>);
							//$("#error-message").show();
						}
					},
					error: function(xhr, textStatus, errorThrown)
					 {
						$.confirm({
	       	    	        title: '',
	       	    	        content: '<spring:message code="label.loading_error"/>',
	       	    	       		 buttons: {
	       	    	        	
	       	    	            somethingElse: {
	       	    	                text: 'OK',
	       	    	                btnClass: 'btn-primary',
	       	    	            }
	       	    	        }
	       	    	    });
					 	//alert('<spring:message code="label.loading_error"/>');
					 	return false;
					}
				});	 	
			}
	  }
  
<!--  </script>
 <script> -->
 $('a.otpForgotPassword, #back').click(function() {
	
	////alert("a.otpForgotPassword,#back"); vvv8May
		
	var valid = $("#passwordreset-form").valid();
	if(valid == true){ //validated successfully	
			
		//reset form and validation
		/* $("#passwordreset-form").hide();
		$("#otplogin-form").show();
			
		var $slider = $('.signup-securecode');
		//var $slider1 = $('.login-signup');
		$slider.animate({
			right : parseInt($slider.css('right'), 10) == -415 ? 0 : 415
		});
 */
			//reset form and validation
		//	$('#passwordreset-form')[0].reset();
		//	passwordreset-form.resetForm();
/*vvv8May 		if($("#password-field1").val()=='')
			{
			$("#checkBoxerr").show();
			}
		if($("#password-field1").val()!='' && $("#password-field2").val()==''){
				$("#checkBoxerr").hide();
				$("#checkBoxerr2").show();
			}
		if ($("#password-field2").val()=='' && $("#password-field1").val()=='' )
		{
			$("#checkBoxerr").show();
			$("#checkBoxerr2").show();
		}
		if($("#password-field1").val()!='' && $("#password-field2").val()!=''){
			document.getElementById("t2").value='';
			document.getElementById("t3").value='';
			$("#checkBoxerr").hide();
			$("#checkBoxerr2").hide();
			$("#passwordreset-form").hide();
			$("#otplogin-form").show();
			
			var $slider = $('.signup-securecode');
			//var $slider1 = $('.login-signup');
			$slider.animate({
				right : parseInt($slider.css('right'), 10) == -415 ? 0 : 415
			});
 } */
			 /* $slider1.animate({
				right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
			}); */ 
	}
		}); 
 $(".anchor-decoration").click(function (){
       	 // alert('send OTP');
     		var token = $("meta[name='_csrf']").attr("content");
     		var header = $("meta[name='_csrf_header']").attr("content");
     		var contextPath=$("#contextPath").val();
     		var email=$("#email").val();
     		$.ajax({
     			type : "GET",
     	        url : contextPath+"resendotp?email="+email,
     	       dataType : 'json',
     		    beforeSend: function (xhr) {
     	   			xhr.setRequestHeader(header, token);
     		    },
     		    complete: function () {
     		    },
     	        success : function(response) {
     	          if(response == "true" || response == true){
     	        	 $.confirm({
        	    	        title: '',
        	    	        content: 'One Time Password Sent.',
        	    	       		 buttons: {
        	    	        	
        	    	            somethingElse: {
        	    	                text: 'OK',
        	    	                btnClass: 'btn-primary',
        	    	            }
        	    	        }
        	    	    });
     	      			//alert("One Time Password Sent.");
     	          }else{
     	        	 $.confirm({
     	    	        title: '',
     	    	        content: 'One Time Password could not be sent, as no Active user found.',
     	    	       		 buttons: {
     	    	        	
     	    	            somethingElse: {
     	    	                text: 'OK',
     	    	                btnClass: 'btn-primary',
     	    	            }
     	    	        }
     	    	    });
     	          	//alert("One Time Password could not be sent, as no Active user found");
     	          }
     
     			},
     			 error : function(e) {  
     				$.confirm({
       	    	        title: '',
       	    	        content: 'Error: ' + e,
       	    	       		 buttons: {
       	    	        	
       	    	            somethingElse: {
       	    	                text: 'OK',
       	    	                btnClass: 'btn-primary',
       	    	            }
       	    	        }
       	    	    });
     			  //  alert('Error: ' + e);   
     			}  
     		 });
     	 });
 
 $('a.backbutton').click(function() {
			//reset form and validation
			$("#passwordreset-form").show();
			$("#otplogin-form").hide();
			
			var $slider = $('.signup-securecode');
			$slider.animate({
				right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
			});
		
			
		});
 $(".toggle-password1").click(function() {

		$(this).toggleClass("fa-eye fa-eye-slash");
		var input = $($(this).attr("toggle"));
		if (input.attr("type") == "password") {
		input.attr("type", "text");
		} else {
		input.attr("type", "password");
		}
});
		
$(".toggle-password2").click(function() {

		$(this).toggleClass("fa-eye fa-eye-slash");
		var input = $($(this).attr("toggle"));
		if (input.attr("type") == "password") {
		input.attr("type", "text");
		} else {
		input.attr("type", "password");
		}
});
$('.fate').click(function () {
    $('.hidden_destiny').each(function () {
        if ($(this).is(':visible')) {
           // $(this).stop().slideUp('slow');
           $(this).hide();
        }
    });
    var id = $(this).val();
    //$('#clicked_' + id).stop().slideDown('slow');
    $('#clicked_' + id).show();
});

function isNumber(evt) {
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	        return false;
	    }
	    return true;
	}
$('.digit-group').find('input').each(function() {
	$(this).attr('maxlength', 1);
	$(this).on('keyup', function(e) {
		var parent = $($(this).parent());
		
		if(e.keyCode === 8 || e.keyCode === 37) {
			var prev = parent.find('input#' + $(this).data('previous'));
			
			if(prev.length) {
				$(prev).select();
			}
		}else if((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 96 && e.keyCode <= 105) || e.keyCode === 39) { //digits only and right arrow
			var next = parent.find('input#' + $(this).data('next'));
			
			if(next.length) {
				$(next).select();
			} else {
				if(parent.data('autosubmit')) {
					parent.submit();
				}
			}
		}
	});
});
 </script>
</body>
</html>

