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

if(!port.equals(null) || !port.equals("")){
		port = ":" + port;
	}
	String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
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
      <title><spring:message code="label.rest_secureCode"/> | DrySign</title>
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
 <%--      <script src="<%=appUrl %>/js/jquery.min.js"></script> --%>
 <script src="<%=appUrl %>/js/js_landing/jquery-1.11.3.min.js"></script>  
      <script src="<%=appUrl %>/js/bootstrap.min.js"></script>
 <%--      <script src="<%=appUrl %>/js/nagging-menu.js"></script> --%>
      <link rel="stylesheet" href="<%=appUrl%>/css/login.css">
      <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> -->
      <link rel="stylesheet" href="<%=appUrl %>/css/fontAwesome4-4-0.css">
      <%-- <link rel="stylesheet" href="<%=appUrl %>/css/login.css"> --%>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.5.2/jquery-confirm.min.css">
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
         margin-top: 8px !important;
        /*  position: relative; */
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
      </style>
   </head>
   <body class="bg">
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
               <div class="text-center"><a href="<%=appUrl %>/index?locale=<%=locale%>"><img src="<%=appUrl %>/images/logo.png" alt="Logo" class="iMg" title="Logo"/></a></div>
               <!-- OTP Body -->
      
               <!-- <h1>Two Step Verification</h1>
               <h3>Login via Secure Code</h3> -->
             
            	<h3 id="h3TextId"><spring:message code="label.forgotSecureCode"/></h3>
           			
					<div class="message text-center" id="passwordreset-success" style="display:none;padding-top: 50px;">
					   <p><img src="<%=appUrl %>/images/message-bg.png"/></p>
					   <h4><spring:message code="label.secureCodeReset"/></h4>
					      <a href="login?locale=<%=locale%>" class="btn btn-blue "><spring:message code="label.conti-drysign"/></a>                   
				   </div>
				   <div class="message text-center" id="passwordreset-error" style="display:none">
					   <p><img src="<%=appUrl %>/images/fail.png"/></p>
					   <h4 class="error"><spring:message code="label.invalid"/></h4>
					  	<!-- <p>Congratulations! Your new password has been successfully created.</p> -->
					      <a href="login?locale=<%=locale%>" class="btn btn-blue "><spring:message code="label.conti-drysign"/></a>                   
				   </div>
				   
				 	<div class="alert alert-danger fade in" style="display:none;text-align:center;margin: 0px;" id="passwordModelalert">
				    		<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>
						<div id="passwordmessage"></div>
						<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a><span></span>
					</div> 
					
					 <form id="forgotSecureCode_form">
						<!-- <div class="login-info"> -->
						<div class="login-info1">
							<!-- <h3>Forgot Your Secure Code</h3> -->
							<p class="font-16"><spring:message code="label.setSecureCode"/></p>
						</div>
						
						<div class="form-group has-feedback" style="padding: 15px 0px;">
							<label><spring:message code="label.userid"/></label><span class="redstar1">*</span> <input type="text" name="Securecode_username" id="Securecode_username" autocomplete="off"
								placeholder="<spring:message code="label.email"/>" class="form-control" style="padding-left:0px;" maxlength="70">
						</div>
						<div class="form-group has-feedback" style="padding: 15px 0px;">
							<!--     <div class="input-group"> -->
							<label><spring:message code="label.login-Password"/></label><span class="redstar1">*</span>
							<input id="password-field3" type="password" name="password3" autocomplete="off" maxlength="15" 
								placeholder="<spring:message code="label.password"/>" class="form-control" style="padding-left:0px;"> <span
								toggle="#password-field3"
								class="fa fa-fw fa-eye field-icon toggle-password" id="toggle_password_eye_secureCode"></span>
						</div>
						
					<%-- <form id="Forgot_otpsecure_code" data-group-name="digits" data-autosubmit="false" autocomplete="off"> --%>
						<div class="form-group digit-group" data-group-name="digits" data-autosubmit="false" autocomplete="off" style="padding: 15px 0px;">
							<label><spring:message code="label.secureCode"/></label><span class="redstar1">*</span>
					          <!-- <input id="partitioned" type="text" maxlength="6" /> -->
					          <div>
					          <!-- name="digit-1"name="digit-2"name="digit-3"name="digit-4"name="digit-5" name="digit-6"-->
								<input type="password" id="digit-1_Forgot" class="digit-VVV secrete" name="digit-1" data-next="digit-2" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-2_Forgot" class="digit-VVV secrete" name="digit-2" data-next="digit-3" maxlength="1" data-previous="digit-1_Forgot" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-3_Forgot" class="digit-VVV secrete" name="digit-3" data-next="digit-4" maxlength="1" data-previous="digit-2_Forgot" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								
								<input type="password" id="digit-4_Forgot" class="digit-VVV secrete" name="digit-4" data-next="digit-5" maxlength="1" data-previous="digit-3_Forgot" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-5_Forgot" class="digit-VVV secrete" name="digit-5" data-next="digit-6" maxlength="1" data-previous="digit-4_Forgot" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-6_Forgot" class="digit-VVV secrete" name="digit-6" data-previous="digit-5_Forgot" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
							</div>
							<input type="hidden" class="secureCodeVVV" id="secureCodeVVV"/>
						</div>
						<div class="form-group" style="padding:0 3px;">
								<label id="securityCodeSignUpErr" style="display:none;color:#e10543"><spring:message code="label.enter6Digit"/></label>
							</div>	
					
						<div class="form-group digit-group" style="padding: 15px 0px;">
							<label><spring:message code="label.confirmSecureCode"/></label><span class="redstar1">*</span>
					          <!-- <input id="partitioned" type="text" maxlength="6" /> -->
					          <div>
					          <!-- name="digit-1"name="digit-2"name="digit-3"name="digit-4"name="digit-5" name="digit-6"-->
								<input type="password" id="digit-1_Forgot" class="digit-confirmVVV secrete" name="digit-1" data-next="digit-2" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-2_Forgot" class="digit-confirmVVV secrete" name="digit-2" data-next="digit-3" maxlength="1" data-previous="digit-1_Forgot" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-3_Forgot" class="digit-confirmVVV secrete" name="digit-3" data-next="digit-4" maxlength="1" data-previous="digit-2_Forgot" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								
								<input type="password" id="digit-4_Forgot" class="digit-confirmVVV secrete" name="digit-4" data-next="digit-5" maxlength="1" data-previous="digit-3_Forgot" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-5_Forgot" class="digit-confirmVVV secrete" name="digit-5" data-next="digit-6" maxlength="1" data-previous="digit-4_Forgot" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-6_Forgot" class="digit-confirmVVV secrete" name="digit-6" data-previous="digit-5_Forgot" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
							</div>
							<input type="hidden" class="confirmSecureCodeVVV" id="confirmSecureCodeVVV"/>
						</div>
						<div class="form-group" style="padding:0 3px;">
								<label id="confirmSecurityCodeSignUpErr" style="display:none;color:#e10543"><spring:message code="label.securecode.error" /></label>
							</div>		
					<%-- 	</form>	 --%>
						<div class="row">
							<div class="col-md-12 text-right">
								<button type="button" id="frgt_SecureCode_btn"
									class="btn btn-primary forgotButtonClass" onclick="forgotSecureCode_Submit();" style="width:100%;"><spring:message code="label.submit"/></button>
							</div>
						</div>
						<!-- /.col -->
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
                           (<a href="https://drysign.exelatech.com/"><spring:message code="label.drysign.support"/></a>) 
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
                           (<a href="mailto:drysign.support@exelatech.com"><spring:message code="label.drysign.support"/></a>)
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
                           (<a href="mailto:drysign.support@exelatech.com"><spring:message code="label.drysign.support"/></a>)
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
   <!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  -->
      <script src="<%=appUrl %>/js/bootstrap.min.js"></script>
      <!-- Validation -->
      <script src="<%=appUrl %>/js/jquery.validate.js"></script>
      <script src="<%=appUrl %>/js/jquery-confirm.min.js"></script>
      <!-- Loader -->
      <script src="<%=appUrl %>/js/jquery.buttonLoader.js"></script>
   <%--30nov2020    <input type="hidden" id= "securitycode" value="<c:out value="${securitycode}"></c:out>">
      <input type="hidden" id = "mobile" value="<c:out value="${mobile}"></c:out>">
      <input type="hidden" id = "email" value="<c:out value="${email}"></c:out>"> --%>
      <!--  Timo integratation -->
	
	<script src="<%=timoptimoScriptPath%>"></script> 
      <script>
    
	var interval;
/* 	function startTimer(){
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
	    	        content: 'The One Time Password has expired, please resend a new One Time Password.',
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
	} *///timer end
         
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
        		
        	 localStorage.clear();
         	if(window.location.href.indexOf("region=in") != -1 || window.location.href.indexOf("region=IN") != -1 || sessionStorage.getItem("region") == "in"){
         		sessionStorage.setItem("region", "in");
         		localStorage.setItem("region", "in");
         	}
        	 
        	//$("#verifyLoginOtp").removeAttr('disabled');
        	 $('input').keyup(function(){
      	        if($(this).val().length==$(this).attr("maxlength")){
      	            $(this).next().focus();
      	        }

      	    });
        	/*  if($("#securitycode").val()==""){
        		 $("#securitydiv *").prop('disabled',true);
        		 $("#securityverify").attr("disabled",true);
        	 } */
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
             
             
           //vvv26Nov2020
 		 	$.validator.addMethod("pwcheck", function(value, element) {
 		        return this.optional(element) || /^[a-zA-Z0-9\`\-=\]\[\;\',\.\\\/~!@#\$%\^&\*()_\+{}\|:"<>\?]+$/i.test(value)  
 		        				&& /[a-z]/.test(value) // has a lowercase letter
 		    			       && /[A-Z]/.test(value) // has a uppercase letter
 		    			       && /\d/.test(value) // has a digit;
 		    			       && /[\`\-=\]\[\;\',\.\\\/~!@#\$%\^&\*()_\+{}\|:"<>\?]/.test(value);
 		    	}, "<spring:message code="label.passwordShouldBeAlphanumeric"/>");
             
 		    $.validator.addMethod("emailcheck", function(value, element) {
 		        var re = /^(([^<>(){}[\]\\.,;:\s@\"]+(\.[^<>(){}[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
 		        return this.optional(element) || re.test(value);
 		    }, "<spring:message code="label.validEmail_msgrequired"/>");
 			
 			
       	 
 	      	//vvv26Nov2020 BELOW CODE WILL DISPLAY INVALID LINK FOR SECURE CODE RESET IF USER CLICKS IT AFTER RESETTING HER SECURE CODE
 	  		   	var message='${message}';
 	 		
 	  			if(message != 1 || message != '1'){
 	  				$("#forgotSecureCode_form").hide();
 	 				$("#passwordreset-error").show();
 	 				$("#h3TextId").hide();
 	 				
 	  			}else{
 	  				$("#forgotSecureCode_form").show();
 	 				$("#passwordreset-error").hide();
 	 				$("#h3TextId").show();
 	  			}
 	  		//--------------------------------------------------------------------------------//	


         });	//DOC.READY END

              
              
   // added by Guru
/*    function emptySecureCode ()
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
		   
	  
   } */
   /* $('.digit-VVV').keyup(function(event){
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
	});  */

   /*  var forgotSecureCode=$('#forgotSecureCode_form').validate({
		rules:{
			Securecode_username:{
				required : true,
				email : true,
				emailcheck:true
			},
			// password3:{
			//	required : true,
			//	checkempty : true
			//}   
			password3 : {
				required : true,
				minlength : 8,
				maxlength:15,
				pwcheck: true		//vvv exelaAUth password rule
			}
		},messages: {
			Securecode_username:"Enter email address",
			password3:"Enter a password."
		},
	}); */
  //forgot secure Code 23/11/2020
/* 	$('a.forgotSecureCode').click(function() {
		
		$('a.forgotSecureCode').css("pointer-events","none");
		$(".login-forgotSecureCode").show();
		$(".login").hide();
		$("#forgotSecureCode_form").show();
		$("#forgot-icon").show();
		
		
	// 	$("#successForgotPwdInactiveUserAlert").hide(); //vvv29may2020
	//	$("#successloginInactiveUserAlert").hide(); //vvv29may2020
	//	$("#loginInactiveUserAlert").hide(); //vvv29may2020
	//	$(".forgotButtonClass").removeAttr('disabled'); //vvv29may2020
	//	$(".forgotButtonClass").removeClass('disabled'); //vvv29may2020
		
		var $slider = $('.login-forgotSecureCode');
		
		$slider.animate({
			right : parseInt($slider.css('right'), 10) == -415 ? 0 : 415
		});
		
	}); */
/* 	$('a.backbutton_securecode').click(function() {
		$('a.forgotSecureCode').css("pointer-events","auto");
		$(".login-forgotSecureCode").hide();
		$(".login").show();
		$('#forgotSecureCode_form')[0].reset();
		var $slider = $('.login-forgotSecureCode');
		
		$slider.animate({
			right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
		});
	
		
	}); */
	
   //====================below code required for forgot secure code validations ============================
	function forgotSecureCode_Submit(){
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
	//	alert("token: "+token+"----header:"+header+"--------contextPath:"+contextPath);
	
		var currentUsername = '${currentUsername}';
		//alert("currentUsername:"+currentUsername+" secureemail"+$("#Securecode_username").val())
		
		var valid = $("#forgotSecureCode_form").valid();
		var validSecureCode = validateSecurityCode($("#secureCodeVVV").val(),$("#confirmSecureCodeVVV").val());	
		
		if (valid==true && validSecureCode == true){
			
			if(currentUsername == $("#Securecode_username").val().trim()){
			var data = {
					"email" : $("#Securecode_username").val().trim(),
					"password" : $("#password-field3").val(),
				    "mfaSecureCode" : $("#secureCodeVVV").val()
				}
			
			//alert("data "+JSON.stringify(data));
			
			
			$.ajax({
				type : "POST",
				url : "updateForgotSecureCode",
				dataType : 'json',
				contentType : 'application/json; charset=utf-8',
				data : JSON.stringify(data),	
				crossDomain : true,
				cache: false,
				beforeSend : function(xhr) {
				//	$('#frgt_SecureCode_btn').buttonLoader('start');		//to be changed to submit btn on securecode screen
				    xhr.setRequestHeader(header, token);
					$("#frgt_SecureCode_btn").attr('disabled',true);
				},
				complete : function() {
				//	$("#frgt_SecureCode_btn").buttonLoader('stop');		//to be changed to submit btn on securecode screen
					$("#frgt_SecureCode_btn").removeAttr('disabled');	//vvv26Nov2020	new
				},
				success : function(response) {
					//vvv== go back to sign up page to display errors ============================================
				//	if (response.msg == 1 || response.msg == "1") {
					if (response == 1 || response == "1") {	
						//alert('Success');
						$("#passwordreset-success").show();
						$("#passwordModelalert").hide();
						$("#passwordmessage").val('');
						$("#forgotSecureCode_form").hide(); //hide reset form
						$("#h3TextId").hide(); //hide forgot securecode h3 text
					}else {
						//$("#regsiterModelalert").show();
						//$("#registerdmessage").html(<c:out value="response.msg"></c:out>);
						$("#forgotSecureCode_form").show(); //show reset form
						
						$("#passwordreset-success").hide();
						$("#passwordModelalert").show();
						//$("#passwordmessage").html(<c:out value='response.msg'></c:out>);
						$("#passwordmessage").html(<c:out value='response'></c:out>);
						$("#h3TextId").show(); //show forgot securecode h3 text
					}
				},
				error : function(xhr, textStatus, errorThrown) {
					//alert('<spring:message code="label.loading_error"/>');
					$.confirm({
       	    	        title: '',
       	    	        content: '<spring:message code="label.loading_error"/> ',
       	    	       		 buttons: {
       	         	    	    somethingElse: {
       	    	                text: 'OK',
       	    	                btnClass: 'btn-primary'
       	    	            }
       	    	        }
					});
					
					return false;
				}
			});
			
			//end
		}else{
			
			$("#passwordreset-success").hide();
			$("#passwordModelalert").show();
			$("#passwordmessage").html('<spring:message code="label.enterRegistredEmailAdd"/>');
		}
			
		}
		
		
		
		
		
		
	}
	
	
    //vvv set securecode in a hidden field  
     	$(document).on("keyup", ".digit-VVV", function() {
    		    var code="";
    		    $(".digit-VVV").each(function(){		     
    		        code+=$(this).val();
    		    });		   		    
    		    $("#secureCodeVVV").val(code);
    		   if(code.length == 6){
    		    	$("#securityCodeSignUpErr").css("display", "none");
    		    }
    		    
    	});
        
    	 $(document).on("keyup", ".digit-confirmVVV", function() {
    		    var codeStr="";
    		    $(".digit-confirmVVV").each(function(){		     
    		    	codeStr+=$(this).val();
    		    });		   		    
    		    $("#confirmSecureCodeVVV").val(codeStr);
    		    if(codeStr.length == 6){
    		    	$("#confirmSecurityCodeSignUpErr").css("display", "none");
    		    } 
    		   	    
    	}); 
       /////////////////////////////////////////////////////// 
       
       var forgotSecureCode = $("#forgotSecureCode_form")
				.validate(
						{
							//specify the validation rules
							rules : {
								Securecode_username : {
									required : true,
									email : true,
									emailcheck:true
								//email is required AND must be in the form of a valid email address
								},
								password3 : {
									required : true,
									minlength : 8,
									maxlength:15
									///pwcheck: true
								}
							},
							submitHandler : function(form) {
								
								//$("#aa").buttonLoader('start');
								//form.submit();	
							},
							invalidHandler:function(form){
								if(!$("#checkbox3").is(":checked")){
									$("#checkBoxerr").show();
								}
							},messages: {
								Securecode_username:{required:"Enter email address."},
								password3: {
				                	required:"Enter a password.",
				               	//	minlength: "Password should be 8-15 characters long and contain at least 1 - lowercase, uppercase alphabet, number and special character."
				                }
				            }
							
						});
       
       
	//vvv validate for sign up
	function validateSecurityCode(securityCode, confirmSecurityCode){

		var isNum_securityCode = /^\d+$/.test(securityCode);
	//	var isnum_confirmSecurityCode = /^\d+$/.test(confirmSecurityCode);
	 //alert("securityCode:"+securityCode+"=>  ---confirmSecurityCode "+confirmSecurityCode);

		if(securityCode =="" && confirmSecurityCode==""){
			
			///alert("EMPTYsecureCodeVVV: "+$("#secureCodeVVV").val()+" ==confirm "+$("#confirmSecureCodeVVV").val()+" ==both are empty securityCode--"+securityCode+" ===confirmSecurityCode "+confirmSecurityCode);
			$("#securityCodeSignUpErr").css("display", "block");
			$("#confirmSecurityCodeSignUpErr").css("display", "none");
			return false;
		}
		else if(!isNum_securityCode){
			$("#frgt_SecureCode_btn").removeAttr('disabled');
			$("#securityCodeSignUpErr").css("display", "block");
			$("#confirmSecurityCodeSignUpErr").css("display", "none");
			return false;
		}
		else if(securityCode =="undefined" || securityCode.length < 6){	
			$("#frgt_SecureCode_btn").removeAttr('disabled');
		//	alert("===1");
			$("#securityCodeSignUpErr").css("display", "block");
			$("#confirmSecurityCodeSignUpErr").css("display", "none");
			return false;
		}
		else if(confirmSecurityCode =="undefined" || confirmSecurityCode.length < 6 || securityCode != confirmSecurityCode){	
		//	alert("===2");
			$("#frgt_SecureCode_btn").removeAttr('disabled');
			$("#securityCodeSignUpErr").css("display", "none");
		
			$("#confirmSecurityCodeSignUpErr").css("display", "block");
			
			return false;
		} 
		else{					 //if(securityCode.length==6 )
			//alert("===3");
					//	$("#securityCodeSignUpErr").hide();
				$("#securityCodeSignUpErr").css("display", "none");
				$("#confirmSecurityCodeSignUpErr").css("display", "none");	
				return true;
			
		} 
	
	
	}
	
	$(".toggle-password").click(function() {

		$(this).toggleClass("fa-eye fa-eye-slash");
		var input = $($(this).attr("toggle"));
		if (input.attr("type") == "password") {
			input.attr("type", "text");
		} else {
			input.attr("type", "password");
		}
	});
   //End by guru
  </script>
   </body>
</html>

