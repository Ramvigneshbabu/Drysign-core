<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import = "java.util.ResourceBundle" %>
<%@ page import="com.drysign.model.Registration, org.springframework.security.core.context.SecurityContextHolder, org.springframework.security.core.Authentication" %>
<%
	String port = request.getServerPort() + "";
ResourceBundle resource = ResourceBundle.getBundle("commonsutils");
String timoIconPath =resource.getString("timoIconPath");
String timoptimoScriptPath =resource.getString("timoScriptPath");
String drySignPath =resource.getString("DrySignPath");

if(!port.equals(null) || !port.equals("")){
		port = ":" + port;
	}
	String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
	String hostUrl = request.getScheme() + "://" + request.getServerName() + port;
	String locale = request.getParameter("locale");
	if(locale == null){
		locale = "en";
	}
%>
<%-- <% 
   String port = request.getServerPort()+"";
   if(!port.equals(null) || !port.equals(""))
   {
   	port = ":" + port;
   }
   String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
   %> --%>
   
   
<!DOCTYPE html>
<html>
   <head>
      <title><spring:message code="label.loginDrysign"/></title>
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
      <link href="<%=appUrl %>/css/cookie.css" rel="stylesheet" />
      <meta name="msapplication-TileColor" content="#ffffff">
      <meta name="msapplication-TileImage" content="<%=appUrl %>/images/fav-icon/ms-icon-144x144.png">
      <meta name="theme-color" content="#ffffff">
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="_csrf" content="${_csrf.token}"/>
      <meta name="_csrf_header" content="${_csrf.headerName}"/>
      <!-- <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> -->
      <link rel="stylesheet" href="<%=appUrl %>/css/bootstrap.min.css">
      <script src="<%=appUrl %>/js/jquery.min.js"></script>
      <script src="<%=appUrl %>/js/bootstrap.min.js"></script>
      <script src="<%=appUrl %>/js/nagging-menu.js"></script>
      <link rel="stylesheet" href="<%=appUrl%>/css/login.css">
      <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> -->
      <link rel="stylesheet" href="<%=appUrl %>/css/fontAwesome4-4-0.css">
      <%-- <link rel="stylesheet" href="<%=appUrl %>/css/login.css"> --%>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.css">
      <link href="<%=appUrl %>/css/buttonLoader.css" rel="stylesheet" type="text/css">
      <%-- <link rel="stylesheet" href="<%=appUrl %>/css/exela_theme.css"/> --%>
      <link rel="stylesheet" href="<%=appUrl %>/css/style.css"/>
      <style>
      .hidden_destiny {
         display:none;
         }
         .otpbutton{
         width:100%;
         }
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
         border-radius: 4px;
         }
         .field-icon {
         float: right;
         margin-left: -25px;
         margin-top: -25px;
         position: relative;
         z-index: 2;
         }
         .mfa-ui-header {
         margin: 5px;
         margin-left: 0;
         margin-bottom: 20px;
         text-align: center;
         font-size: 18px;
         font-family: roboto;
         color: #2c3d4f;
         }	
         .mfa-prompt {
         font-size: 14px;
         margin-top: 10px;
         }	
         
.mngaccount_btn:hover{ 
	background-color:#c1c1c1 !important;
	color: #767676 !important;
}  
         
         
      </style>
   </head>
   <body class="bg">
   <div id="loader2" class="loader2" style="display: none">
		<div class="loaderdiv">
			<p>
				<img src="<%=appUrl%>/images/drysign_logo_mono.svg">
			</p>
			<p>
				<img src="<%=appUrl%>/images/drysign-logo-line_only.gif">
			</p>
			<p>
				<spring:message code="label.wait" />
			</p>
		</div>
	</div>
      <input type="hidden" id="contextPath" value="<%=appUrl %>/"/>
      <section>
         <!-- Login -->
         <!-- Timo integratation -->
				<div id="timointegratation">
					<input type="image" src="<%=timoIconPath%>" alt="Need Help?" class="open-button">
						<div class="form-popup" id="masterDiv"></div>
					<input id="productName" value="DrySign" type="hidden"/>
						<input id="userName" value="" type="hidden"/>
						<input id="userEmail" value="" type="hidden"/>
						<div id="overlay"></div>
				</div>
				<!-- Timo integratation -->
         <div class="login">
            <div class="wrapper-lg">
      <a href="<%=appUrl %>/login?locale=<%=locale%>" class="back_align backbutton_signin pull-left"><span
					class="glyphicon glyphicon-arrow-left"></span></a>
               <div class="text-center">
					
					<a href="<%=hostUrl %>"><img src="<%=appUrl%>/images/logo.png"
						 class="iMg" />
					</a>
				</div>
               <!-- OTP Body -->
      
               
               <div class="message text-center" id="password-success"
						style="display: none">
						<br><br>
						<p>
							<img src="<%=appUrl%>/images/message-bg.png" />
						</p>
						<h4><spring:message code="label.email_link_secureCode"/></h4>
						<p><spring:message code="label.spam_folder"/></p>
						<a class="btn backbutton btn-blue" href="<%=appUrl %>/login?locale=<%=locale%>" ><spring:message code="label.conti-drysign"/></a>
				</div>
					
			   <h1 id="twoStepId"><spring:message code="label.twoStepVerification"/></h1>
               <h3 id="h3LoginTextId"><spring:message code="label.LoginWithSecureCode"/></h3>

               <form id="otplogin-form" method="get" class="digit-group" data-group-name="digits" data-autosubmit="false" autocomplete="off">
						<div id = "securitydiv"class="form-group" style="padding: 15px 0px;">
							<label><spring:message code="label.enterSecureCode"/></label>
					          <!-- <input id="partitioned" type="text" maxlength="6" /> -->
					          <div class="divOtpInputs">
					          <!-- name="digit-1"name="digit-2"name="digit-3"name="digit-4"name="digit-5" name="digit-6"-->
								<input type="password" id="digit-1" class="digit-VVV" name="digit-1" data-next="digit-2" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-2" class="digit-VVV" name="digit-2" data-next="digit-3" maxlength="1" data-previous="digit-1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-3" class="digit-VVV" name="digit-3" data-next="digit-4" maxlength="1" data-previous="digit-2" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-4" class="digit-VVV" name="digit-4" data-next="digit-5" maxlength="1" data-previous="digit-3" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-5" class="digit-VVV" name="digit-5" data-next="digit-6" maxlength="1" data-previous="digit-4" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-6" class="digit-VVV" name="digit-6" data-previous="digit-5" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
							</div>
							<!-- <div class="form-group" style="padding:0 3px;">
								<label id="securityCodeSignInErr" class="error_otp" style="display:none;">Secure Code option selected. Enter 6 digit code</label>
						</div> -->
							
						</div>
						<div class="row">
	                     <div class="col-md-12 text-right">
	                        <button type="button" id="securityverify"
	                           class="btn btn-primary otpbutton" onClick="verifyLoginNew('securecode')" ><spring:message code="label.verify"/></button>
	                     </div>
                  		</div>
                  		
						<div class="resetSecureCodeDiv" style="padding-top: 10px;">
								<a href="#" class="anchor-decoration secureCodeTagDiv" onclick="resetSecureCodeLink();" id="resetSecureCodeId"><spring:message code="label.forgotSecureCode"/></a>
						</div> 
						
                  		<br/>
                  		
                  		<div class="col-md-12 text-center">
						<h3 class="otptext"><spring:message code="label.OR1"/></h3>
						</div>
                  		<h3><spring:message code="label.loginOTP"/></h3>
                  		
                  		<br/>
                  		
                  		
                  		<div class="row">
	                     <div class="col-md-12 text-center">
	                       <a href="#" class="otpsignin anchor-decoration"> <button type="button"
	                           class="btn btn-primary otpbutton text-center" onclick="sendOTP('initial');" id="verifyLoginOtp"><spring:message code="label.sendOTP"/></button></a>
	                          
	                     </div>
                  		</div>
						</form>	
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
         <!-- OTP Sign up -->
<div class="signin-securecode">
<div class="wrapper-lg ">
				<a  href="<%=appUrl %>/login?locale=<%=locale%>" class="back_align backbutton_signinOTP pull-left"><span
					class="glyphicon glyphicon-arrow-left"></span></a>
				<div class="text-center" id="forgot-icon" style="padding-top: 50px">
					<!-- <a href="<%=drySignPath%>/<%=locale%>"> -->
					
					<a href="<%=appUrl %>">
					<img src="<%=appUrl%>/images/logo.png" alt="Logo" class="iMg"
						title="Logo" /></a>
				</div>
				<div class="text-center" id="login-icon" style="display: none">
					
					
					<a href="<%=appUrl %>">
					<img src="<%=appUrl%>/images/logo.png" alt="Logo" class="iMg"
						title="Logo" /></a> 
				</div>
				<div class="login-info">	
					<div class="message" id="setup_Secure_Code">

						<h1><spring:message code="label.loginOTP"/></h1>
						<h3><spring:message code="label.sendOTPtoEmail"/></h3>
						<form id="otpsecure_code" method="get" class="digit-group" data-group-name="digits" data-autosubmit="false" autocomplete="off">
						<div class="form-group" style="padding: 15px 0px;">
							
					          <!-- <input id="partitioned" type="text" maxlength="6" /> -->
					          <div class="col-sm-12 text-center">
								<input type="password" id="odigit-1" class="secrete" name="odigit-1" data-next="odigit-2" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric" />
								<input type="password" id="odigit-2" class="secrete" name="odigit-2" data-next="odigit-3" data-previous="odigit-1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="odigit-3" class="secrete" name="odigit-3" data-next="odigit-4" data-previous="odigit-2" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="odigit-4" class="secrete" name="odigit-4" data-previous="odigit-3" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric" />
								
							</div>
							
						</div>
						<div class="text-center" style="color:#337ab7;font-weight: 500;"><span id="timer"></span></div>
			<br/>
						<div class="row">
	                     <div class="col-md-12 text-right">
	                        <button type="button"  id="verifySendOtpId"
	                           class="btn btn-primary otpbutton" onClick="verifyLoginNew('otp')"><spring:message code="label.verify"/></button>
	                     </div>
                  		</div>
                  		<hr/>	
						<div class="resendotp">
										<a href="#" class="anchor-decoration" onclick="sendOTP('resend');" id="verifyLoginOtp"><spring:message code="label.resendOTP"/></a>
						 <input type="hidden" id="exelaAuthOtp" value="">				
						</div>
						</form>			
					</div> 	
				</div>
				<div class="wrapper-footer">
					<div class="wrapper-footer_content">
					<%-- 	<p>
							Need an account? <a href="#" class="signup">Sign Up</a>
						</p>--%>
						<p>
							&copy; 							<script>
								document.write(new Date().getFullYear())
							</script>
							<spring:message code="label.company"/>
						</p>
					</div>
				</div>
			</div>
</div>
<%--          <div class="cookies_part fixedClr" style="padding-left: 10px;display:none">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
               <p class="cookie_txt">
                  <spring:message code="label.cookie_para" />
                  <a href="#" data-toggle="modal"
                     data-target="#PModal" class="coolies-labal">
                     <spring:message code="label.policy" />
                  </a>
                  .
               </p>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
               <div class="btnset">
                  <a id="accecpt_cookies" class="btn cookie-btn"
                     style="text-transform: uppercase">
                     <spring:message code="label.policy_agree" />
                  </a>
                  <a
                     data-toggle="modal" data-target="#PModal" class="btn cookie-btn"
                     style="text-transform: uppercase">
                     <spring:message code="label.policy_moreinfo" />
                  </a>
               </div>
            </div>
         </div>
         <div class="cookies_part_confirmed fixedClr" style="display:none">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
               <p class="cookie_txt">
                  <spring:message code="label.cookie_acceptencess" />
               </p>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
               <div class="btnset">
                  <a id="hidewindow" class="btn cookie-btn"
                     style="text-transform: uppercase">
                     <spring:message code="label.cookie_hide" />
                  </a>
                  <a id="more_info"
                     data-toggle="modal" data-target="#PModal" class="btn cookie-btn"
                     style="text-transform: uppercase">
                     <spring:message code="label.cookie_more" />
                  </a>
               </div>
            </div>
         </div> --%>
      </section>
      <div class="modal fade" id="PModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel">
         <div class="modal-dialog ">
            <!-- Modal content-->
            <div class="modal-content" style="padding: 0px">
               <div class="modal-header model-header-background">
                  <button type="button" class="cookie-close closeiconcss" title="close" data-dismiss="modal"><spring:message code="label.x"/></button>
                  <div class="logo_pop">
                     <img src="<%=appUrl %>/images/logo_inner.png" width="100">
                  </div>
               </div>
               <div class="cookies-modal-body print_body model-body-custom" style="max-height: auto">
                  <p class="boldtxt">
                     <spring:message code="label.1"/> 
                     <spring:message code="label.introduction" />
                  </p>
                  <ul>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.1.1"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.introduction_1_1" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.1.2"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.introduction_1_2" />
                        </p>
                     </li>
                  </ul>
                  <p class="boldtxt">
                     <spring:message code="label.2"/> 
                     <spring:message code="label.scope" />
                  </p>
                  <ul>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.2.1"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.scope_2_1" />
                        </p>
                     </li>
                  </ul>
                  <ul>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.2.2"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.scope_2_2" />
                           (<a href="<%=drySignPath%>/<%=locale%>"><%=drySignPath%></a>) 
                           <spring:message code="label.scope_2_2_continue" />
                        </p>
                     </li>
                  </ul>
                  <p class="boldtxt">
                     <spring:message code="label.3"/> 
                     <spring:message code="label.cpi" />
                  </p>
                  <ul>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.3.1"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.cpi_3_1" />
                        </p>
                        <ul>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.a"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.cpi_3_1_a" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.b"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.cpi_3_1_b" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.c"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.cpi_3_1_c" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.d"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.cpi_3_1_d" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.e"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.cpi_3_1_e" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.f"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.cpi_3_1_f" />
                              </p>
                           </li>
                        </ul>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.3.2"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.cpi_3_2" />
                        </p>
                     </li>
                  </ul>
                  <p class="boldtxt">
                     <spring:message code="label.4"/>	
                     <spring:message code="label.upi" />
                  </p>
                  <ul>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.4.1"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.upi_4_1" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.4.2"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.upi_4_2" />
                        </p>
                        <ul>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.a"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.upi_4_2_a" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.b"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.upi_4_2_b" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.c"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.upi_4_2_c" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.d"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.upi_4_2_d" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.e"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.upi_4_2_e" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.f"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.upi_4_2_f" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.g"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.upi_4_2_g" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.h"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.upi_4_2_h" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.i"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.upi_4_2_i" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.j"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.upi_4_2_j" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.k"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.upi_4_2_k" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.l"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.upi_4_2_l" />
                              </p>
                           </li>
                        </ul>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.4.3"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.upi_4_3" />
                        </p>
                     </li>
                  </ul>
                  <p class="boldtxt">
                     <spring:message code="label.5"/>   
                     <spring:message code="label.lbp" />
                  </p>
                  <ul>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.5.1"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.lbp_5_1" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.5.2"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.lbp_5_2" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.5.3"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.lbp_5_3" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.5.4"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.lbp_5_4" />
                        </p>
                     </li>
                  </ul>
                  <p class="boldtxt">
                     <spring:message code="label.6"/>   
                     <spring:message code="label.olbi" />
                  </p>
                  <ul>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.6.1"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.olbi_6_1" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.6.2"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.olbi_6_2" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.6.3"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.olbi_6_3" />
                        </p>
                     </li>
                  </ul>
                  <p class="boldtxt">
                     <spring:message code="label.7"/> 
                     <spring:message code="label.dpi" />
                  </p>
                  <ul>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.7.1"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.dpi_7_1" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.7.2"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.dpi_7_2" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.7.3"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.dpi_7_3" />
                        </p>
                        <ul>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.a"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.dpi_7_3_a" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.b"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.dpi_7_3_b" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.c"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.dpi_7_3_c" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.d"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.dpi_7_3_d" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.e"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.dpi_7_3_e" />
                              </p>
                           </li>
                        </ul>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.7.4"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.dpi_7_4" />
                        </p>
                     </li>
                  </ul>
                  <p class="boldtxt">
                     <spring:message code="label.8"/> 
                     <spring:message code="label.idt" />
                  </p>
                  <ul>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.8.1"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.idt_8_1" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.8.2"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.idt_8_2" />
                        </p>
                     </li>
                  </ul>
                  <p class="boldtxt">
                     <spring:message code="label.9"/> 
                     <spring:message code="label.rpi" />
                  </p>
                  <ul>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.9.1"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.rpi_9_1" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.9.2"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.rpi_9_2" />
                           <b>
                              <spring:message code="label.rpi_9_2_c" />
                           </b>
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.9.3"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.rpi_9_3" />
                        </p>
                        <ul>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.a"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.rpi_9_3_a" />
                                 <b>
                                    <spring:message code="label.rpi_9_2_c" />
                                 </b>
                              </p>
                           </li>
                        </ul>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.9.4"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.rpi_9_4" />
                        </p>
                        <ul>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.a"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.rpi_9_4_a" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.b"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.rpi_9_4_b" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.c"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.rpi_9_4_c" />
                              </p>
                           </li>
                        </ul>
                     </li>
                  </ul>
                  <p class="boldtxt">
                     <spring:message code="label.10"/> 
                     <spring:message code="label.spi" />
                  </p>
                  <ul>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.10.1"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.spi_10_1" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.10.2"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.spi_10_2" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.10.3"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.spi_10_3" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.10.4"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.spi_10_4" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.10.5"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.spi_10_5" />
                        </p>
                     </li>
                  </ul>
                  <p class="boldtxt">
                     <spring:message code="label.11"/> 
                     <spring:message code="label.amendment" />
                  </p>
                  <ul>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.11.1"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.amendment_11_1" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.11.2"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.amendment_11_2" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.11.3"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.amendment_11_3" />
                        </p>
                     </li>
                  </ul>
                  <p class="boldtxt">
                     <spring:message code="label.12"/> 
                     <spring:message code="label.uright" />
                  </p>
                  <ul>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.12.1"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.uright_12_1" />
                           <spring:message code="label.1_844_9352832"/> 
                           <spring:message code="label.uright_12_1_c" />
                           (<a href="mailto:drysign.support@exelatech.com"><spring:message code="label.drysign.support" /></a>)
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.12.2"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.uright_12_2" />
                        </p>
                        <ul>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.a"/></p>
                              <p class="sub-cat-txt">
                                 <b>
                                    <spring:message code="label.uright_12_2_a" />
                                 </b>
                                 <spring:message code="label.uright_12_2_a_c" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.b"/></p>
                              <p class="sub-cat-txt">
                                 <b>
                                    <spring:message code="label.uright_12_2_b" />
                                 </b>
                                 <spring:message code="label.uright_12_2_b_c" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id subcatid_css"><spring:message code="label.c"/></p>
                              <p class="sub-cat-txt">
                                 <b>
                                    <spring:message code="label.uright_12_2_c" />
                                 </b>
                                 <spring:message code="label.uright_12_2_c_c" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.d"/></p>
                              <p class="sub-cat-txt">
                                 <b>
                                    <spring:message code="label.uright_12_2_d" />
                                 </b>
                                 <spring:message code="label.uright_12_2_d_c" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.e"/></p>
                              <p class="sub-cat-txt">
                                 <b>
                                    <spring:message code="label.uright_12_2_e" />
                                 </b>
                                 <spring:message code="label.uright_12_2_e_c" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.f"/></p>
                              <p class="sub-cat-txt">
                                 <b>
                                    <spring:message code="label.uright_12_2_f" />
                                 </b>
                                 <spring:message code="label.uright_12_2_f_c" />
                                 <a href="https://ico.org.uk/concerns/"><spring:message code="label.https.ico_ukconcerns"/></a>
                              </p>
                           </li>
                        </ul>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.12.3"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.uright_12_3" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.12.4"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.uright_12_4" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.12.5"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.uright_12_5" />
                        </p>
                     </li>
                  </ul>
                  <p class="boldtxt">
                     <spring:message code="label.13"/> 
                     <spring:message code="label.ui" />
                  </p>
                  <ul>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.13.1"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.ui_13_1" />
                           <spring:message code="label.1_844_9352832"/> 
                           <spring:message code="label.uright_12_1_c" />
                           (<a href="mailto:drysign.support@exelatech.com"><spring:message code="label.drysign.support" /></a>)
                        </p>
                     </li>
                  </ul>
                  <p class="boldtxt">
                     <spring:message code="label.14"/> 
                     <spring:message code="label.cookie" />
                  </p>
                  <ul>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.14.1"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.cookie_14_1" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.14.2"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.cookie_14_2" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.14.3"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.cookie_14_3" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.14.4"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.cookie_14_4" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.14.5"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.cookie_14_5" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.14.6"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.cookie_14_6" />
                        </p>
                        <table border="1" align="center" id="cookiestbl">
                           <tr>
                              <th>
                                 <spring:message code="label.cookie_name" />
                              </th>
                              <th>
                                 <spring:message code="label.cookie_type" />
                              </th>
                              <th>
                                 <spring:message code="label.cookie_des" />
                              </th>
                           </tr>
                           <tr>
                              <td>
                                 <spring:message code="label.cookie_name_val" />
                              </td>
                              <td>
                                 <spring:message code="label.cookie_type_val" />
                              </td>
                              <td>
                                 <spring:message code="label.cookie_des_val" />
                              </td>
                           </tr>
                        </table>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.14.7"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.cookie_14_7" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.14.8"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.cookie_14_8" />
                        </p>
                        <ul>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.a"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.cookie_14_8_a" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.b"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.cookie_14_8_b" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.c"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.cookie_14_8_c" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.d"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.cookie_14_8_d" />
                              </p>
                           </li>
                        </ul>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.14.9"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.cookie_14_9" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.14.10"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.cookie_14_10" />
                        </p>
                     </li>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.14.11"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.cookie_14_11" />
                        </p>
                        <ul>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.a"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.cookie_14_11_a" />
                                 <a href="http://windows.microsoft.com/en-gb/internet-explorer/delete-manage-cookies#ie=ie-11">http://windows.microsoft.com/en-gb/internet-explorer/delete-manage-cookies#ie=ie-11</a>).
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.b"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.cookie_14_11_b" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.c"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.cookie_14_11_c" />
                              </p>
                           </li>
                           <li>
                              <p class="sub-cat-id"><spring:message code="label.d"/></p>
                              <p class="sub-cat-txt">
                                 <spring:message code="label.cookie_14_11_d" />
                              </p>
                           </li>
                        </ul>
                     </li>
                  </ul>
                  <p class="boldtxt">
                     <spring:message code="label.15"/> 
                     <spring:message code="label.details" />
                  </p>
                  <ul>
                     <li>
                        <p class="sub-cat-id"><spring:message code="label.15.1"/></p>
                        <p class="sub-cat-txt">
                           <spring:message code="label.details_15_1" />
                        </p>
                     </li>
                  </ul>
               </div>
               <div class="modal-footer">
                  <!--          <a title="Download  Privacy Notice" href="#" class="btn btn-default print_term_link no-print" download="">Download</a> -->
               </div>
            </div>
         </div>
      </div>
      <!-- script --> 
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
      <script src="<%=appUrl %>/js/bootstrap.min.js"></script>
      <!-- Validation -->
      <script src="<%=appUrl %>/js/jquery.validate.js"></script>
      <script src="<%=appUrl %>/js/jquery-confirm.min.js"></script>
      <!-- Loader -->
      <script src="<%=appUrl %>/js/jquery.buttonLoader.js"></script>
      <input type="hidden" id= "securitycode" value="<c:out value="${securitycode}"></c:out>">
      <input type="hidden" id = "mobile" value="<c:out value="${mobile}"></c:out>">
      <input type="hidden" id = "email" value="<c:out value="${email}"></c:out>">
      <!--  Timo integratation -->
	
	<script src="<%=timoptimoScriptPath%>"></script> 
      <script>
	var interval;
	var counter = 0;
	function startTimer(){
				var counter=0;
				var timeleft = 300;
				$("#timer").html(showTimer(timeleft-counter));
				clearInterval(interval);
				interval = setInterval(timer,1000);
			function timer(){
				counter++;
				$("#timer").html(showTimer(timeleft-counter));
				if(counter==timeleft){
				clearInterval(interval);
				$.confirm({
	    	        title: '',
	    	        content: '<spring:message code="label.otpExpire"/>',
	    	       		 buttons: {
	    	        	
	    	            somethingElse: {
	    	                text: 'OK',
	    	                btnClass: 'btn-primary',
	    	            }
	    	        }
	    	    });
			    }
			}
			function showTimer(s){
				var min= Math.floor(s/60);
				var sec = s%60;
				return padFormat(min)+' : '+padFormat(sec);
			}
			function padFormat(d) {
				return (d < 10) ? '0' + d.toString() : d.toString();
			}
	}//timer end
         
         $('a.otpsignin,#back').click(function(){
        	 $("#verifyLoginOtp").attr('disabled',true);
        	 $("#odigit-1").focus();
     				//reset form and validation
     				
     				//vvv	registerForm.resetForm();
     			
     					$(".signin-securecode").show();
     					
     					var $slider = $('.signin-securecode');
     					var $slider1 = $('.login');
     					$slider.animate({
     						right : parseInt($slider.css('right'), 10) == -415 ? 0 : 415
     					});
     					/* $slider1.animate({
     						right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
     					}); */
     		});
        /*  $('a.backbutton_signinOTP').click(function(){
      		
        	  $(".signin-securecode").hide(); 
        	  $(".login").show(); 
        	 otplogin-form.resetform();
     			var $slider = $('.signin-securecode');
					var $slider1 = $('.login');
					 $slider.animate({
						right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
					}); 
			   $slider1.animate({
						right : parseInt($slider.css('right'), 10) == -415 ? 0 : 415
					});  
      		}) */
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
         		} else if((e.keyCode>31 && e.keyCode < 48 && e.keyCode > 57) || (e.keyCode >= 96 && e.keyCode <= 105) || e.keyCode === 39) { //digits only and right arrow
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
         function setCookie(cname, cvalue, exdays) {
             var d = new Date();
             d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
             var expires = "expires=" + d.toGMTString();
             document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
         }
         
         function getCookie(cname) {
             var name = cname + "=";
             var decodedCookie = decodeURIComponent(document.cookie);
             var ca = decodedCookie.split(';');
             for (var i = 0; i < ca.length; i++) {
                 var c = ca[i];
                 while (c.charAt(0) == ' ') {
                     c = c.substring(1);
                }
                 if (c.indexOf(name) == 0) {
                     return c.substring(name.length, c.length);
                 }
             }
             return "";
         }
     /*     var alreadystored = false;
         $(window).on("load", function () {  checkCookie() });
         function checkCookie() {
             var user = getCookie("drysigncookies");
             if (user != "") {
                 alreadystored = true;
                 $(".cookies_part").css("display", "none");
             }
             if (!user) {
                 $(".cookies_part").css("display", "block");
             }
         } */
         
         $(document).ready(function () {
        	 $("#verifyLoginOtp").removeAttr('disabled');
        	 $('input').keyup(function(){
      	        if($(this).val().length==$(this).attr("maxlength")){
      	            $(this).next().focus();
      	        }

      	    });
        	 
        	// alert("securitycode: "+$("#securitycode").val()+"--email: "+$("#email").val())
        	 if($("#securitycode").val()==""){
        		 $("#securitydiv *").prop('disabled',true);
        		 $("#securityverify").attr("disabled",true);
        		
        		 $("#resetSecureCodeDiv").attr("disabled",true);
        		 $("#resetSecureCodeId").removeAttr("href",true);
        		 $('#resetSecureCodeId').css({"pointer-events":"none"});
        		 
        		 $("#securityverify").addClass('mngaccount_btn');
        		// $(".anchor-decoration").css({"color":"#767676 !important"});		//change 'forgot secure code?' text color to grey
        		 $('.anchor-decoration').css({"color":"#767676 !important"});
        	 }
        	 else{
        		 $("#securityverify").removeClass('mngaccount_btn');
        		// $(".anchor-decoration").css({"color":"#1277d9 !important"});	
        		 $('.anchor-decoration').css({"color":"#1277d9 !important"});
        	 }
        	
        	 //vvv18Dec if email is not set -disable
        	 if($("#email").val()==""){
        		 $("#verifyLoginOtp").attr("disabled",true);
        		 
        		 $("#verifyLoginOtp").addClass('mngaccount_btn');
        	 }else{
        		 $("#verifyLoginOtp").removeClass('mngaccount_btn');
        	 }
        	 
        	 
 			$("input[Type=password]").on("contextmenu cut copy paste drop",function(e){
 				e.preventDefault();
 				//alert('not');
 				return false;
 			});
        	 //cookies code 	
         /*     $("#accecpt_cookies").click(function () {
                 setCookie("drysigncookies", "stored", 30);
                 $(".cookies_part").css("display", "none");
                 $(".cookies_part_confirmed").css("display", "block");
             });
         
             $("#no_give_me_more").click(function () {
                 $("#cookiesModal").modal("show");
             });
         
             $("#more_info").click(function () {
                 $("#cookiesModal").modal("show");
             });
             $("#privacypolicywindow").click(function () {
                 $("#cookiesModal").modal("show");
             });
         
             $("#hidewindow").click(function () {
                 $(".cookies_part_confirmed").css("display", "none");
             }); */
         });

              
              
   // added by Guru
   function emptySecureCode ()
   {
	   $("#digit-1").val("");
	   $("#digit-2").val("");
	   $("#digit-3").val("");
	   $("#digit-4").val("");
	   $("#digit-5").val("");
	   $("#digit-6").val("");
		   
   }
   
   function emptyOTP()
   {
	   $("#odigit-1").val("");
	   $("#odigit-2").val("");
	   $("#odigit-3").val("");
	   $("#odigit-4").val("");
		   
	  
   }
   $('.digit-VVV').keyup(function(event){
	    var keycode = (event.keyCode ? event.keyCode : event.which);
	    if(keycode == 13){
			//alert("security code");
			verifyLoginNew("securecode");
	    }
	}); 
   $('.secrete').keyup(function(event){
	    var keycode = (event.keyCode ? event.keyCode : event.which);
	    if(keycode == 13){
			//alert("otp");
			verifyLoginNew("otp");
	    }
	}); 
   function verifyLoginNew(key){
	
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath=$("#contextPath").val();
			var scValue="";
			var otpValue="";
			var data;
				if(key.localeCompare("securecode")==0){
					
						
						scValue=$("#digit-1").val();
						scValue=scValue+$("#digit-2").val();
						scValue =scValue+$("#digit-3").val();
						scValue=scValue+$("#digit-4").val();
						scValue =scValue+$("#digit-5").val();
						scValue=scValue+$("#digit-6").val();
							
						//alert ("scValue.lenght "+scValue.length);
							
						if(scValue.length < 6){
							
							$.confirm({
			    	    	        title: '',
			    	    	        content: '<spring:message code="label.enterCorrectSecureCode"/>',
			    	    	       		 buttons: {
			    	    	        	
			    	    	            somethingElse: {
			    	    	                text: 'OK',
			    	    	                btnClass: 'btn-primary',
			    	    	            }
			    	    	        }
			    	    	    });
							 return;
						}else{
							counter++;
							 data = {
									 "key":"SecureCode",
									 "value":scValue,
									 //"mobile":$("#mobile").val(),
									 //"email":$("#email").val(),
									 "securitycode":"securitycode"
							}
						}
				}
				if (key.localeCompare("otp")==0) {
			
						otpValue =$("#odigit-1").val();
					///	alert($("#odigit-1").val());
						//alert($("#odigit-2").val());
						
						otpValue =otpValue+$("#odigit-2").val();
						otpValue =otpValue+$("#odigit-3").val();
						otpValue =otpValue+$("#odigit-4").val();
						//alert("Enter otp is "+ otpValue)	;
						
						
							if(otpValue.length < 4){
								//alert ("Invalid OTP");
								
								
								$.confirm({
			    	    	        title: '',
			    	    	        content: '<spring:message code="label.enterCorrectOTP"/>',
			    	    	       		 buttons: {
			    	    	        	
			    	    	            somethingElse: {
			    	    	                text: 'OK',
			    	    	                btnClass: 'btn-primary',
			    	    	            }
			    	    	        }
			    	    	    });
							 

								return;
								
								
							}else
								{
										 data = {
												 "key":key,
												 "value":otpValue,
												 //"mobile":$("#mobile").val()
												 "email":"email",
												 "securitycode":""
											}
								}
						
					}   // end of else if (key.localeCompare("otp")==0
		
		console.log(data);
		$.ajax({
					type : "POST",
					url : contextPath+"app/token/validate",
					dataType: 'json',
				    contentType: "application/json; charset=utf-8",
				    data: JSON.stringify(data),
				    beforeSend: function (xhr) {
			   			xhr.setRequestHeader(header, token);
			   		//$('#securityverify').buttonLoader('start');
			   		
			   		//$("#loader2").show();
			   		$("#securityverify").attr('disabled',true);
			   		
			   		if (key.localeCompare("otp")==0) {
			   			$('#verifySendOtpId').buttonLoader('start');
			   			//$("#loader2").show();
				   		$("#verifySendOtpId").attr('disabled',true);
			   		}
				    },
				    
				    complete: function () {
				   	//$('#securityverify').buttonLoader('stop');
				    	//$("#loader2").show();
				    },
				    
			        success : function(response) {
			        	//$("#loader2").hide();
			        	//alert(response);
			          if(response.map.isValid){
			        	  window.location.href= "<%=appUrl %>/app/dashboard";
			          }else{
			        	  
			        	  if(counter != 2){
			        		  if(key.localeCompare("securecode")==0){
				          			emptySecureCode();	
				          	}
				          	if(key.localeCompare("otp")==0){
				          		emptyOTP();	
			          		}
				          	
			          	if(response.map.status == 403){
			          		$.confirm({
			   	    	        title: '',
			   	    	        content: response.map.message,
			   	    	       		 buttons: {
			   	    	            somethingElse: {
			   	    	                text: 'OK',
			   	    	                btnClass: 'btn-primary',
				   	    	             action: function(){
				   	    	            	window.location.href= "<%=appUrl %>/logout";
				   	    	            	}
			   	    	            }
			   	    	        }
		   	    	   		 });
			          		$("#securityverify").attr('disabled',false);
			          		$('#securityverify').buttonLoader('stop');
			          	}else{
			          		$.confirm({
			   	    	        title: '',
			   	    	        content: response.map.message,
			   	    	       		 buttons: {
			   	    	        	
			   	    	            somethingElse: {
			   	    	                text: 'OK',
			   	    	                btnClass: 'btn-primary',
			   	    	            }
			   	    	        }
		   	    	   		 });
			          		$("#securityverify").attr('disabled',false);
			          		$('#securityverify').buttonLoader('stop');
			          		
			          		if (key.localeCompare("otp")==0) {
					   	  		$("#verifySendOtpId").attr('disabled',false);
				          		$('#verifySendOtpId').buttonLoader('stop');
				          		
					   		}
			          		
			          	}
			        		  
			        	  }else{
			        		  $.confirm({
				   	    	        title: '',
				   	    	        content: '<spring:message code="label.accountBlocked"/>',
				   	    	       		 buttons: {
				   	    	        	
				   	    	            somethingElse: {
				   	    	                text: 'OK',
				   	    	                btnClass: 'btn-primary',
				   	    	             action: function(){
				   	    	            	emptySecureCode();
				   	    	            	$('#securityverify').buttonLoader('stop');
							        		  $("#securitydiv *").prop('disabled',true);
							         		 $("#securityverify").attr("disabled",true);
							         		//$("#verifyLoginOtp").attr("disabled",true); 
					   	    	            	}
				   	    	            }
				   	    	        }
			   	    	   		 });
			        	  }
					          	
	         		 }

				},
			 	error : function(e) {  
					 $.confirm({
	    	    	        title: '',
	    	    	        //content: 'Error: ' + e,
	    	    	        content:'<spring:message code="label.somethingWentWrong"/>',
	    	    	       		 buttons: {
	    	    	        	
	    	    	            somethingElse: {
	    	    	                text: 'OK',
	    	    	                btnClass: 'btn-primary',
	    	    	            }
	    	    	        }
	    	    	    });
			   // alert('Error: ' + e);   
					 $("#securityverify").attr('disabled',false);
		          		$('#securityverify').buttonLoader('stop');
				}  
		 	});
		
	 }  
   
   
   
    function sendOTP(source){
	   var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
		startTimer();
		
	
		var data = {
					 "key":"email",
					 "value":"true"
					}
		
		
		if(source.localeCompare("resend")==0){
			
			$("#odigit-1").val("");
			$("#odigit-2").val("");
			$("#odigit-3").val("");
			$("#odigit-4").val("");
			
		}
			
		
	console.log(data);
		$.ajax({
			type : "POST",
			url : contextPath+"app/token/sendOTP",
			dataType: 'json',
		    contentType: "application/json; charset=utf-8",
		    data: JSON.stringify(data),
		    beforeSend: function (xhr) {
		    	
	   			xhr.setRequestHeader(header, token);
	   			$('#verifyLoginOtp').buttonLoader('start');
	   			$("#verifyLoginOtp").attr('disabled',true);
		    },
		    complete: function () {
		    	$("#verifyLoginOtp").attr('disabled',false);
		    	$('#verifyLoginOtp').buttonLoader('stop');
		    	
		    },
	        success : function(response) {
	        	
	        	
	          if(response.map.isValid){
		        	  $(".signin-securecode").show();
		        	  $(".login").hide();
	   				   				
	
	          }else{
	
	        	  
	          	$.confirm({
   	    	        title: '',
   	    	        content: response.map.message,
   	    	       		 buttons: {
   	    	        	
   	    	            somethingElse: {
   	    	                text: 'OK',
   	    	                btnClass: 'btn-primary',
   	    	            }
   	    	        }
	    	   		 });
	        	  //alert("Wrong data")	;
	          }

			},
			 error : function(e) {  
				 $.confirm({
    	    	        title: '',
    	    	        content: '<spring:message code="label.somethingWentWrong"/>',
    	    	       		 buttons: {
    	    	        	
    	    	            somethingElse: {
    	    	                text: 'OK',
    	    	                btnClass: 'btn-primary',
    	    	            }
    	    	        }
    	    	    });
			   // alert('Error: ' + e);   
			}  
		 });
		
	 }   
   
   
   
   
   //End by guru
   
   
 function resetSecureCodeLink(){
	   
	 var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath = $("#contextPath").val();
		var forgotemail = $('#forgortEmailPassword');
		
			$.ajax({
				type : "POST",
				url : contextPath+"/forgotSecureCodeLink",
				/* data : {
					"email" : $("#email").val() //pass user email address
				}, */
				beforeSend : function(xhr) {
				//	$('#resetSecureCodeId').buttonLoader('start');
					xhr.setRequestHeader(header, token);
				//	$("#loader2").show();
				},
				complete : function() {
				//	$("#resetSecureCodeId").buttonLoader('stop');
					//$("#loader2").hide();
				},
				success : function(response) {
					if (response == 1) {
						
						//$("#forgotpwdModelalert").hide();
						$("#otplogin-form").hide();
						$("#password-success").show();
						
						$("#twoStepId").hide();
						$("#h3LoginTextId").hide();
						
					} else {
						//alert('Error');
						$("#otplogin-form").show();
						$("#password-success").hide();
						$("#twoStepId").show();
						$("#h3LoginTextId").show();
						
					}
				},
				error : function(xhr, textStatus, errorThrown) {
					alert('<spring:message code="label.loading_error"/>');
					return false;
				}
			});
		
   }
  
 $( document ).ready( function(){
	    history.pushState(null,  document.title, location.href);        
	});
 
 var container = document.getElementsByClassName("divOtpInputs")[0];
 container.onkeyup = function(e) {
     var target = e.srcElement;
     var maxLength = parseInt(target.attributes["maxlength"].value, 10);
     var myLength = target.value.length;
     if (myLength >= maxLength) {
         var next = target;
         while (next = next.nextElementSibling) {
             if (next == null)
                 break;
             if (next.tagName.toLowerCase() == "input") {
                 next.focus();
                 break;
             }
         }
     }
 }


  </script>
   </body>
</html>

