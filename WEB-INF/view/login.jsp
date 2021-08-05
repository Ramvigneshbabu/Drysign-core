
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ page
	import="com.drysign.model.Registration, org.springframework.security.core.context.SecurityContextHolder, org.springframework.security.core.Authentication"%>
<%@ page language="java" import="java.util.*" %> 
<%@ page import = "java.util.ResourceBundle" %>
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
	String token1=request.getParameter("plan");
	String category=request.getParameter("category");
	String buyplan=request.getParameter("buyplan");
	String googleErrorMsg=request.getParameter("googleErrorMsg");
	String locale = request.getParameter("locale");
	if(locale == null){
		locale = "en";
	}
	//System.out.println("Locale:"+locale);
	String lang = "USA";
	if(locale != null && locale.equals("de")){
		lang = "Germany";
	}else if(locale != null && locale.equals("en")){
		lang = "USA";
	}else if(locale != null && locale.equals("fr")){
		lang = "France";
	}else if(locale != null && locale.equals("es")){
		lang = "Spain";
	}else if(locale != null && locale.equals("sv")){
		lang = "Sweden";
	}	
	//Locale locale1 = request.getLocale();
	//System.out.println("Locale1: "+locale1);
%>
<!DOCTYPE html> 
<html>
<head>
<meta name = "<spring:message code="label.homemetades"/>" content="<spring:message code="label.metadescont"/>"/>
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="<%=appUrl%>/images/fav-icon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<meta charset="utf-8">
<!-- <meta http-equiv="refresh" content="540" /> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="google-signin-scope" content="profile email">
<!-- <meta name="google-signin-client_id" content=GoogleDriveConstant.APP_CLIENT_ID> -->
<!-- PrintShop Client Id-->
<!-- <meta name="google-signin-client_id" content="147649997158-nj4ukfipfdmqobi7a1uhge11d020gjtf.apps.googleusercontent.com"> -->
<!-- DrySign Client Id-->
<!-- <meta name="google-signin-client_id" content="927346535684-gkrnjl6o6akimdjse81gp3lb1j79n957.apps.googleusercontent.com"> -->
<!-- Exela Tech Client Id-->
<meta name="google-signin-client_id" content="343368759683-v5kkkdiuclet80v4v2rcorp3jvshraor.apps.googleusercontent.com">

<title><spring:message code="label.login_title"/></title>

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
<link rel="manifest" href="<%=appUrl%>/images/fav-icon/manifest.json">

<!-- <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> -->
<link rel="stylesheet" href="<%=appUrl%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=appUrl%>/css/login.css">
<link rel="stylesheet" href="<%=appUrl%>/css/font-awesome.min.css">
<link href="<%=appUrl%>/css/buttonLoader.css" rel="stylesheet" type="text/css">
<%-- <link rel="stylesheet" href="<%=appUrl %>/css/exela_theme.min.css"/> --%>
<link rel="stylesheet" href="<%=appUrl %>/css/style.css"/>
<link href="<%=appUrl%>/css/cookie.min.css" rel="stylesheet" />

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="<%=appUrl %>/js/jquery.min.js"></script>
<script src="<%=appUrl %>/js/bootstrap.min.js"></script>
<script src="<%=appUrl %>/js/nagging-menu.js"></script>
<script src="<%=appUrl %>/js/config.js"></script>
<script src="<%=appUrl %>/js/AesUtil.js"></script>
<script src="<%=appUrl %>/js/crypto-js.min.js"></script>
<script src="<%=appUrl %>/js/pbkdf2.min.js"></script>

<!-- Added  for Google SignUp-->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>

<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-MRTTRCL');</script>
<!-- End Google Tag Manager -->

<!-- Google Tag Manager --> 
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-PBHFJ7W');</script> 
<!-- End Google Tag Manager -->


<style>
.checkbox label::after {
    display: inline-block;
    position: absolute;
    width: 16px;
    height: 16px;
    left: 0;
    top: 0 !important;
    margin-left: -21px;
    padding-left: 3px;
    padding-top:2px;
    /*font-size: 11px;*/
    color: #FFF;
}
/* .frgtbtncls{
width:100%;} */
/* input.secrete{
   /* -webkit-text-security:disc; 
   font-size:15px;
} */

/* .SecureCodeCancelButton{
margin-top:20px;
display:inline-block;} */
/* .login-info .has-feedback input{
font-size:14px !important;} */
/* html, body {
    height:100%;
} */
/* .checkbox label, .radio label{

padding-left:15px;} */

/*.backbutton {
color:#fff;}*/
/* .cookie-close{
cursor:pointer;
color:#fff;} */
/*.cookie-close:hover{
color:#333;
text-decoration:none !important;}*/
/* #password-success a{
width:100%;} */
/* #aa{
width:100%;
margin-bottom:10px;} */
/* #signupbtn{
width:100%;
} */
/* #frgtbtn{
width:100%;
} */
/* select#codes:focus{
box-shadow:none} */
/* ul li{
 list-style-type: none;
} */
/* .img_parent img{
max-height:20px;} */
/* .alreadyaccunt_css{
font-size:14px;} */
/* .flag_select_css{
/*border-bottom:2px solid #748791;
display:inline-block;
width:100%;
} */
/* select#codes {
       
    width: 100%;
   text-indent:38px;
    border:none;
    border-top: 0;
    border-left: 0;
    border-right: 0;
    height: 38px;
    display:inline-block;
    -webkit-appearance:none;    
} */
/* @media all and (-ms-high-contrast: none), (-ms-high-contrast: active) {
      select#codes1, select#codes {
        padding-left:45px;
}
} */
/* @supports (-ms-ime-align:auto) {
   select#codes1, select#codes {
        padding-left:45px;
}} */
/* img#imgflage {
    position: absolute;
    top: 5px;
    left: 21px;
  /* width: 24px;
    margin-right:5px;
    display:inline-block;
} */
/* .intl-tel-input .selected-flag {
  
    padding: 8px 6px 0 8px;
} */
/* .body {
	height: 100%;
} */


/* .error1 {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
} */

/* .msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
} */

/* .greenButton {
	font-weight: 400;
	color: #fff;
	border-radius: 0;
	font-size: 14px;
	font-family: roboto;
	text-transform: uppercase;
	padding: 3px 12px;
	background: #00bc9c;
	border-radius: 4px;
} */
/* .field-icon {
	float: right;
	position: absolute;
	z-index: 2;
	top: 22px;
	right: 8px;
} */
/* .anchor-decoration {
	color: #1277d9!important;
    cursor: pointer;
    text-decoration:underline;
} */
/* #login-form a{
color: #1277d9!important;} */
/* #login-form a:hover{
color: #0b4a87!important;
text-decoration:underline !important;
} */

/* .anchor-decoration:hover {
color: #0b4a87!important;
} */
/* .anchor-decoration{
text-decoration:none !important;} */
/* .not-allowed {
	cursor: not-allowed;
} */
/* .lnk{
	color: #1d7ab4;
    text-decoration: none;
} */
/* .modal.in .modal-dialog {
    -webkit-transform: translate(0,0);
    -ms-transform: translate(0,0);
    -o-transform: translate(0,0);
    transform: translate(0,0);
    width: 94% !important;
.fa {
  margin-left: -12px;
  margin-right: 8px;fa fa-refresh fa-spin
} */

</style>

</head>


<body class="bg">

<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MRTTRCL"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Google Tag Manager (noscript) --> 
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PBHFJ7W" 
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>   
<!-- End Google Tag Manager (noscript) -->

<script>
function gtag_report_conversion(url) {
  var callback = function () {
    if (typeof(url) != 'undefined') {
      window.location = url;
    }
  };
  gtag('event', 'conversion', {
      'send_to': 'AW-799547376/QNGfCISz7uEBEPC_oP0C',
      'event_callback': callback
  });
  return false;
}
</script>


<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-102458969-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-102458969-1');
</script>

<div id="loader2" class="loader2" style="display:none">
	<div class="loaderdiv">
		 <p><img src="<%=appUrl %>/images/drysign_logo_mono.svg"></p>
		<p><img src="<%=appUrl %>/images/drysign-logo-line_only.gif" ></p> 		
		<p><spring:message code="label.wait"/></p>
	</div>
</div>

	<input type="hidden" id="contextPath" value="<%=appUrl%>/" />
	<section>
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
		<!-- Login -->
		<div class="login">
		 <!-- <div style="text-align: right !important"><ul>
    	<li class="icon-language"><select id = "lang" onchange="jsFunction(this.value);">
 			 <option value="en" id="a">English</option>
 			 <option value="de" id="b">Germany</option>
			 <option value="fr" id="c">France</option>
			 <option value="sv" id="d">Sweden</option>
			 <option value="es" id="e">Spain</option> 
	  </select></li></ul>
    </div> -->
    
			<div class="wrapper-lg">
			<!-- Hiding Language Dropdown by adding style="display: none;" in div --> 
				<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 dropdown pull-right" id="country_loginDropdown"> 
            <!-- Menu toggle button --> 
            <a href="#" class="dropdown-toggle dropdown_countries" data-toggle="dropdown" aria-expanded="true"><%= lang%>  &nbsp;&nbsp;<i class="fa fa-angle-down" aria-hidden="true"></i> </a>
            
            <ul class="dropdown-menu" id="drpdwn_countries">
		        <div>
		        <span><b>NORTH AMERICA</b></span>
		              <li><i class="fa fa-angle-right" aria-hidden="true"></i>&nbsp;<a href="<%=appUrl %>/login?locale=en">USA</a></li> <!-- onclick="jsFunction('en','a','USA');" -->
            		<span><b>EUROPE</b></span>
		             
		               <li><i class="fa fa-angle-right" aria-hidden="true"></i>&nbsp;<a href="<%=appUrl %>/login?locale=fr" >France</a></li> <!-- onclick="jsFunction('fr','c','France');" -->
		               <li><i class="fa fa-angle-right" aria-hidden="true"></i>&nbsp;<a href="<%=appUrl %>/login?locale=de" >Germany</a></li> <!-- onclick="jsFunction('de','b','Germany');" -->
		               <li><i class="fa fa-angle-right" aria-hidden="true"></i>&nbsp;<a href="<%=appUrl %>/login?locale=es" >Spain</a></li> <!-- onclick="jsFunction('es','e','Spain');" -->
		               <li><i class="fa fa-angle-right" aria-hidden="true"></i>&nbsp;<a href="<%=appUrl %>/login?locale=sv" >Sweden</a></li> <!-- onclick="jsFunction('sv','d','Sweden');" -->
		              
		       	</div>
            </ul>
          </div>
          <div class="text-center">
					
					<a href="<%=hostUrl %>"><img src="<%=appUrl%>/images/logo.png"
						 class="iMg" />
					</a>
			</div>
				
				<div class="login-info ">
					<%
						String username = "";
					%>
					<c:if
						test="${not empty sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}">
						<div class="alert alert-danger fade in" style="display:inline-block !important;" id="loginmodalalret">
						<!-- <div class="" id="loginmodalalret"> -->
						<a class="cookie-close" data-hide="alert" aria-label="close"
									onclick="$(this).parent().hide();">&times;</a>
						
						<!-- <i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i> -->
							<c:set var="errormsg"
								value="${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}" />
								
							<!-- vvv26may2020 withpurchase-->
							<c:set var="errormsgTempUserVVV" value="Please click on the link sent to your mail id"/>
							<!-- vvv26may2020 withoutpurchase-->
							<c:set var="errormsgUserVVV" value="Your account is inactive. Please verify from email"/>
							<!-- vvv26may2020 -->
							<%
								String errormsgstr = (String) pageContext.getAttribute("errormsg");
								String[] errMsgArray = errormsgstr.split(",");		//split(",",2); to split on first instance of comma
								username = errMsgArray[0];
								out.print(errMsgArray[1]);
							
								String errormsgTempUserVVVstr =(String) pageContext.getAttribute("errormsgTempUserVVV");
								String errormsgUserVVVstr =(String) pageContext.getAttribute("errormsgUserVVV");
								
								if(errMsgArray != null && errMsgArray.length >1 && (errormsgUserVVVstr != null && errMsgArray[1].contains(errormsgTempUserVVVstr))){
							%>	 
									<!-- vvv 26May2020 start  -->
									 	<input type="hidden" name="hiddenInactiveUser" id="hiddenInactiveUser" value="<%=errMsgArray[0]%>">
										<p><a id="tempUser_VerifyLinkNow" href="#" style="color:#337ab7; float: none;margin-left: 0px;" onclick="resendEmailToInactiveUser('InactiveUserWithPurchasePlan');"><span style="font-weight:600; text-decoration: underline !important;"><spring:message code="label.resendEmailLinkNow"/></span></a></p>

							<%	 }
								else if(errMsgArray != null && errMsgArray.length >1 && (errormsgUserVVVstr != null && errMsgArray[1].contains(errormsgUserVVVstr))){
							%>	 
									<!-- vvv 26May2020 start  -->
									 	<input type="hidden" name="hiddenInactiveUser" id="hiddenInactiveUser" value="<%=errMsgArray[0]%>">
										<p><a id="tempUser_VerifyLinkNow" href="#" style="color:#337ab7; float: none;margin-left: 0px;" onclick="resendEmailToInactiveUser('InactiveUserWithoutPurchasePlan');"><span style="font-weight:600; text-decoration: underline !important;"><spring:message code="label.resendEmailLinkNow"/></span></a></p>

							<%	 }
									//vvv 26May2020 end   
							
							%>				
							<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
							<!-- 	<a class="cookie-close" data-hide="alert" aria-label="close"
								onclick="$(this).parent().hide();">&times;</a> -->
						</div>
					</c:if>
					<c:if test="${not empty msg}">
						<div class="msg">${msg}</div>
					</c:if>
					
				<!-- vvv26May2020 new alert -->	
					<div class="alert alert-danger fade in" id="loginInactiveUserAlert"
						style="display: none; text-align: center; margin: 0px;">
					<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>
						<div id="loginmessage"></div>
							<a class="close" data-hide="alert" aria-label="close"
							onclick="$(this).parent().hide();">&times;</a>
					</div>
					
				<div class="alert alert-success" id="successloginInactiveUserAlert"
						style="display: none; text-align: center; margin: 0px;">
					<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>
						<div id="loginSuccessInactiveUserMessage"></div>
							<a class="close" data-hide="alert" aria-label="close"
							onclick="$(this).parent().hide();">&times;</a>
					</div>
				<!-- vvv26May2020  -->	
					
					<form id="login-form" name='loginForm' action="${logoutUrl}"
						method='POST'>
						<div class="form-group has-feedback" style="padding: 15px 0px;">
							<label><spring:message code="label.userid"/></label> <input type="text" name="username" autocomplete="off"
								placeholder="<spring:message code="label.email"/>" value="<c:out value="${email}"></c:out>" class="form-control" maxlength="70">
						</div>
						<div class="form-group has-feedback" style="padding: 15px 0px;">
							<!--     <div class="input-group"> -->
							<label><spring:message code="label.login-Password"/></label>
							<input id="password-field" type="password" name="password" autocomplete="off"
								placeholder="<spring:message code="label.password"/>" class="form-control"> <span
								toggle="#password-field"
								class="fa fa-fw fa-eye field-icon toggle-password" id="toggle_password_eye"></span> <input
								type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="hidden" name="token"
								value="${token}" />
						</div>
						<div class="row">
							<div class="col-xs-12">
								<div class="checkbox checkbox-primary">
									<%--- <input type="checkbox" class="checkbox2" id="checkbox2" name="termsandcondition"
										> <label for="checkbox2"> By selecting this option you acknowledge that you have read and--%> <spring:message code="label.agreeto"/>
										<a href="<%=appUrl %>/termsandcondition" class="anchor-decoration" target="_blank"><spring:message code="label.tc"/>,</a> 
										<a href="<%=appUrl %>/privacypolicy" target="_blank"><spring:message code="label.policy"/></a> <spring:message code="label.and"/>
										<a href="<%=appUrl %>/consentproceed" target="_blank"><spring:message code="label.consent"/></a>
									</label>
								</div>
								<label style="float: none;" for="termsandcondition" class="error" generated="true"></label>
							</div>
						</div>
						<div class="row">
						
							 <div class="col-md-12 text-right">
								<button type="submit" class="btn btn-primary" id="aa"><spring:message code="label.signin"/></button>
							</div> 
							<!-- above is original button sarika -->
							<%-- <div class="col-md-12 text-right">
							<a href="#" class="otplogin anchor-decoration">	<button type="submit" class="btn btn-primary" id="aa"><spring:message code="label.signin"/></button>
							</a>
							</div>  --%> 
							<div class="col-md-12 text-left" id = "needSignup">
								<p>
									<spring:message code="label.needac"/> <a href="#" class="signup"><spring:message code="label.signup"/></a>
								</p>
							</div>
							
							<div class="col-md-12 ">
								<div class="user-pass">
									<div class="col-xs-6 col-sm-6 col-md-6 text-left">
										<a href="#" class="forgotpass anchor-decoration"><spring:message code="label.forgetpassword"/> </a>
									</div>
									<div class="col-xs-6 col-sm-6 col-md-6 text-right">
										<%-- <a href="<%=appUrl %>/termsandcondition" target="_blank">Terms and Conditions</a> --%> 
									</div>
									<h2 id="borderwithtext"><span><spring:message code="label.OR1"/></span></h2>
								
								    <div id="googleBtn" style="margin-bottom:30px;" align="center" class="g-signin2" data-width="240" data-height="50" data-longtitle="true" data-theme="dark"></div>
								</div>
							</div>
						</div>
					</form>
				</div>
				
				<script>
				
				var domainURLValue ="";
				var micrositRedirect =true;
				function onSuccess(googleUser) {
				/*	  const socialPlatformProvider = GoogleLoginProvider.PROVIDER_ID;
					  
				      console.log('GoogleLogin Provider::' + socialPlatformProvider); */
				      var profile = googleUser.getBasicProfile();
				      if(micrositRedirect)
				     	domainURLValue=window.location.hostname;
				      
				      //console.log('domainURL'+domainURLValue);
				      //console.log('ID: ' + profile.getId());
				      //console.log('Name: ' + profile.getName());
				      //console.log('Image URL: ' + profile.getImageUrl());
				      //console.log('Email: ' + profile.getEmail());
				      //console.log('id_token: ' + googleUser.getAuthResponse().id_token);
				      //signInGoogleAjax(googleUser);
				      
				        var redirectUrl = 'googleLogin';
				        var idToken=googleUser.getAuthResponse().id_token;
				      //using jquery to post data dynamically
				      var form = $('<form action="' + redirectUrl + '" method="get">' +
				                          '<input type="hidden" name="id_token" value="' +
				                          idToken + '" />' +
				                          
				                          '<input type="hidden" name="domainURLValue" value="' +
				                          domainURLValue + '" />' +

				                                                                '</form>');
				      $('body').append(form);
				      sessionStorage.setItem("freePopUp", true);
				      form.submit(); 
				      googleUser.disconnect();
				    }
				    function onFailure(error) {
				      console.log(error);
				      console.log('Failure to login: '+error);
				    }
				    function renderButton() {
				    	 gapi.load('auth2', function() {
				            auth2 = gapi.auth2.init({});
				            element = document.getElementById('googleBtn');
				            auth2.attachClickHandler(element, {}, onSuccess, onFailure);
				            clickGoogleAuthBtn();
				         }); 
				    	
				      /*  gapi.signin2.render('my-signin2', {
				        'scope': 'profile email',
				        'width': 240,
				        'height': 50,
				        'longtitle': true,
				        'theme': 'dark',
				        'onsuccess': onSuccess,
				        'onfailure': onFailure
				      });  */
				    }
				
	function onGoogleSignIn(googleUser) {
      var profile = googleUser.getBasicProfile();
      console.log('ID: ' + profile.getId());
      console.log('Name: ' + profile.getName());
      console.log('Image URL: ' + profile.getImageUrl());
      console.log('Email: ' + profile.getEmail());
      console.log('id_token: ' + googleUser.getAuthResponse().id_token);

     //do not post above info to the server because that is not safe.
     //just send the id_token

      var redirectUrl = 'googleLogin';
      //using jquery to post data dynamically
      var form = $('<form action="' + redirectUrl + '" method="post">' +
                          '<input type="hidden" name="id_token" value="' +
                           googleUser.getAuthResponse().id_token + '" />' +
                                                                '</form>');
      
      //var token = $("meta[name='_csrf']").attr("content");
  	 // var header = $("meta[name='_csrf_header']").attr("content");
  	//  var contextPath=$("#contextPath").val();
  	 /*  var data = {
  			// "dataURL" : sign,
  			 "id_token" :googleUser.getAuthResponse().id_token
  	  }
  	console.log('Before Ajax call :: Name: ' + profile.getName()); */
     /*  $.ajax({
  		type : "GET",
  		url : "googleLogin",
  		dataType: 'json',
  	    contentType: "application/json; charset=utf-8",
  	    data: JSON.stringify(data),
  	    beforeSend: function (xhr) {
  	    	console.log('Before Send :: Name: ' + profile.getName());
  	    	$("#loader2").show();
     		//	xhr.setRequestHeader(header, token);
  	    },
  	    complete: function () {
  	    	console.log('Complete :: Name: ' + profile.getName());
  	    	$("#loader2").hide();
  	    },
          success : function(response) {
        	  console.log('Success :: Name: ' + profile.getName());
           	/* if(response != 'failed'){
           		$("#show_upload_error_signature").show();
           		document.getElementById("showSignature").src = sign;
          		$("#show_signature").css("margin-left","0px");
           	}else{ */
              //	alert('<spring:message code="label.fld"/>');
            //  }
  		/* },
  		 error : function(e) {
  			console.log('Error :: Name: ' + profile.getName());
  		   // alert('Error: ' + e);   
  		}  
  	 });  */
      
     /*  $.ajax({
          url : 'googleLogin', // Your Servlet mapping or JSP(not suggested)
          data :JSON.stringify(data), 
          type : 'POST',
          dataType : 'json', // Returns HTML as plain text; included script tags are evaluated when inserted in the DOM.
          success : function(response) {
              //$('#outputDiv').html(response); // create an empty div in your page with some id
          },
          error : function(request, textStatus, errorThrown) {
              alert('Error: ' + e);
          }
      }); */
      
    $('body').append(form);
    form.submit();
    }
	
	/* socialSignIn() {
	    const socialPlatformProvider = GoogleLoginProvider.PROVIDER_ID;
	    this.socialAuthService.signIn(socialPlatformProvider).then(
	     // (userData) => {
	        console.log('Google sign in data : ' , userData);
	        this.loginWithGoogle(userData);
	    //  }
	    );
	  }	 */
	  
	function clickGoogleAuthBtn(){
       //alert( "Handler  called."+ window.location.href.indexOf("auth=gmail"));
       // $( "#googleBtn" ).trigger( "click" );
           if(window.location.href.indexOf("auth=gmail") != -1){
                   //alert( "Handler  called."+ window.location.href.indexOf("auth=gmail"));
                   $( "#googleBtn" ).trigger( "click" );
           }
           if(window.location.href.indexOf("region=in") != -1){
        	  // debugger
        	   //region ="in";
        	  micrositRedirect=false;
        	   domainURLValue =".in";
        	   $("#needSignup").hide();
          	   $("#country_loginDropdown").hide();
          	   sessionStorage.setItem("region", "in");
          	   localStorage.setItem("region", "in");
           }
    }
	
	</script>

				<div class="wrapper-footer">
					<div class="wrapper-footer_content">
					<%-- 	<p>
							Need an account? <a href="#" class="signup">Sign Up</a>
						</p>--%>
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

		<!-- Forgot Password -->
		<div class="login-forgotpass">
			<div class="wrapper-lg">
				<a class="backbutton pull-left"><span
					class="glyphicon glyphicon-arrow-left"></span></a>
				
				<div class="text-center" id="forgot-icon" style="padding-top: 50px">
					
					<a href="<%=hostUrl%>"><img src="<%=appUrl%>/images/logo.png" alt="Logo" class="iMg"
						 /></a>
				</div>
				<div class="text-center" id="login-icon" style="display: none">
				
					
					<a href="<%=hostUrl%>">
					<img src="<%=appUrl%>/images/logo.png" alt="Logo" class="iMg"
						 /></a> 
				</div>
				
				<div class="login-info">
					<div class="message text-center" id="password-success"
						style="display: none">
						<p>
							<img src="<%=appUrl%>/images/message-bg.png" />
						</p>
						<h4><spring:message code="label.email_link_pass"/></h4>
						<p><spring:message code="label.spam_folder"/></p>
						<a class="btn backbutton btn-blue "><spring:message code="label.conti-drysign"/></a>
					</div>
					<form id="forgotpassword-form">
						<div class="login-info">
							<h3><spring:message code="label.cant_sign"/></h3>
							<p class="font-16"><spring:message code="label.forgot_instructions"/></p>
						</div>
						<div class="alert alert-danger fade in"
							style="display: none; text-align: center; margin: 0px;"
							id="forgotpwdModelalert">
							<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>
							<div id="forgotpwdmessage"></div>
							<a class="close" data-hide="alert" aria-label="close"
								onclick="$(this).parent().hide();">&times;</a>
						</div>
						<!-- vvv26May2020  -->	
						<div class="alert alert-success" id="successForgotPwdInactiveUserAlert"
										style="display: none; text-align: center; margin: 0px;">
							<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>
							<div id="forgotPwdSuccessInactiveUserMessage"></div>
								<a class="close" data-hide="alert" aria-label="close"
										onclick="$(this).parent().hide();">&times;</a>
						</div>
					<!-- vvv26May2020  -->	

						<div class="form-group has-feedback" style="padding: 15px 0px;">
					           <input type="text"
								name="email" id="forgortEmailPassword" placeholder="<spring:message code="label.enter_email"/>"
								class="form-control" maxlength="70" value="">
						</div>
						<div class="row">
							<div class="col-md-12 text-right">
								<button type="button" id="frgtbtn" onclick="forgotPassword();"
									class="btn btn-link forgotButtonClass"><spring:message code="label.send_reset"/></button>
							</div>
						</div>
						<!-- /.col -->
					</form>
					
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

		<!-- Register -->
		<div class="login-signup ">
			<div class="wrapper-lg ">
				
				<div class="text-center" id="register-icon">
	
					<a href="<%=hostUrl %>">
					<img src="<%=appUrl%>/images/logo.png"
						 class="iMg" /></a>
				</div>
				<div class="login-info ">
					<div class="message text-center" id="register-success"
						style="display: none">
						<p>
							<img src="<%=appUrl%>/images/message-bg.png" />
						</p>
						<h4><spring:message code="label.a-created"/></h4>
						<!--  <p>Congratulations! Your new account has been successfully created.</p> -->
						<p><spring:message code="label.receive-email"/></p>
						<a class="btn backbutton btn-blue "><spring:message code="label.conti-drysign"/></a>
					</div>
					
					<div class="message text-center" id="tempUser-success"
						style="display: none">
						<p>
							<img src="<%=appUrl%>/images/message-bg.png" />
						</p>
						<!--  <p>Congratulations! Your new account has been successfully created.</p> -->
						<p><spring:message code="label.linkmail"/> <b id="regMail"></b> <spring:message code="label.linkmail-c"/></p>
					</div>
					

					<div class="alert alert-danger fade in"
						style="display: none; text-align: center; margin: 0px;"
						id="regsiterModelalert">
					<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>
						<div id="registerdmessage"></div>
							<a class="close" data-hide="alert" aria-label="close"
							onclick="$(this).parent().hide();">&times;</a>
					</div>
					<form id="register-form" autocomplete="off">
						<div class="form-group has-feedback paddTB15">
							<label><spring:message code="label.login-fname"/></label><span class="redstar1">*</span> <input type="text"  id="firstName"
								name="firstName" placeholder="<spring:message code="label.fname"/>" class="form-control" maxlength="30">
						</div>
						<div class="form-group has-feedback paddTB15">
							<label><spring:message code="label.login-lname"/></label><span class="redstar1">*</span> <input type="text"  id="lastname"
								name="lastname" placeholder="<spring:message code="label.lname"/>" class="form-control" maxlength="30">
						</div>
							<div class="form-group has-feedback paddTB15">
							<label><spring:message code="label.login-cname"/></label> <input type="text" id="companyName"
								name="companyName" placeholder="<spring:message code="label.cname"/>" class="form-control" maxlength="50">
						</div>
							<div class="form-group has-feedback paddTB15">
							<label><spring:message code="label.login-contact"/></label> 
							<div class="row">
							<div class="col-md-12">
								<div class="flag_select_css">
								<div class="img_parent">
									<img  id="imgflage" alt="Trulli">
									</div>
									<select id="codes" class="form-control col-md-8 pull-right"></select>
								</div>
								<!-- <input type="hidden" id="countryCodeHidden" /> -->
							</div>
							<div class="col-md-12" >
							<input type="text" id="contactNo" maxlength=12
								name="contactNo" placeholder="<spring:message code="label.mobileNumber"/>" class="form-control">
							</div>
							</div>
							
											
							
						</div>
						<div class="form-group has-feedback paddTB15">
							<label><spring:message code="label.login-email"/></label><span class="redstar1">*</span> <input type="text" id="email" autocomplete="off"
								name="email" placeholder="<spring:message code="label.email"/>" class="form-control" maxlength="70">
						</div>
						<div class="form-group has-feedback paddTB15 newerrorMsg">
							<!--  <div class="input-group"> -->
							<label><spring:message code="label.login-Password"/></label><span class="redstar1">*</span>
							<!--  <i class="fa fa-eye pull-right" aria-hidden="true"></i> -->
								<input type="password" id="password-field1" name="password" maxlength="15" 
								placeholder="<spring:message code="label.password"/>" class="form-control" autocomplete="new-password">
								<span toggle="#password-field1" class="fa fa-fw fa-eye field-icon1 toggle-password1" id="toggle_password_eye_signup1"></span> 
							<!-- </div> -->
						</div>
						<div class="form-group has-feedback paddTB15 newerrorMsg">
							<!--  <div class="input-group"> -->
							<label><spring:message code="label.confirm"/></label><span class="redstar1">*</span>
							<!--  <i class="fa fa-eye pull-right" aria-hidden="true"></i> -->
							 
							<input type="password" id="password-field2" name="confirmpassword" maxlength="15"  
								placeholder="<spring:message code="label.placeholder.confirmPassword"/>" class="form-control" autocomplete="new-password">
								<span toggle="#password-field2" class="fa fa-fw fa-eye field-icon1 toggle-password2"  id="toggle_password_eye_signup2"></span>
							<!-- </div> -->
						</div>
						<!-- <div class="form-group has-feedback paddTB15 newerrorMsg">
							  <div class="input-group">
							<label>Re-Type Password</label>
							  <i class="fa fa-eye pull-right" aria-hidden="true"></i>
							<span toggle="#password-field2"
								class="fa fa-fw fa-eye field-icon toggle-password2"></span> <input
								type="password" id="password-field2" name="confirmpassword"
								placeholder="Re-Type Password" class="form-control ">

							 </div>
						</div> -->
						<div class="form-group row" style="padding: 5px 16px;">
						
							<div class="col-xs-12">
							
								<div class="checkbox checkbox-primary" style="margin-bottom:0px;">
									<input type="checkbox" class="checkbox2 checkbox3" id="checkbox3" name="checkbox3"
										> <label for="checkbox3"> <spring:message code="label.acct"/>
							
										<a href="<%=appUrl %>/termsandcondition" class="anchor-decoration" target="_blank"><spring:message code="label.tc"/></a><span class="redstar1">*</span>
									</label>
										
								</div>
								<div class="row" style="padding:0 3px;">
								<label id="checkBoxerr" style="display:none;color:#e10543"><spring:message code="label.terms_condition"/></label></div>
								
								</div>
				
						
						</div>
						<div class="row">
							<div class="col-md-12 text-right">
										
								<%-- <button id="signupbtn" type="button" onclick="register();"
									class="btn btn-primary"><spring:message code="label.signup"/></button> --%>
									<!-- Above is original button -->
									<a href="#" class="otpsingup anchor-decoration">	<button id="signupbtn" type="button" onclick="register();"
									class="btn btn-primary"><spring:message code="label.signup"/></button></a>
							</div>

						</div>
					</form>
				</div>
				<div class="wrapper-footer">
					<div class="wrapper-footer_content">
						<p class="alreadyaccunt_css">
							<spring:message code="label.already_ac"/> <a href="#" class="backbutton"><spring:message code="label.signin"/></a>
						</p>
						<p>
							&copy; 
							<script>
								document.write(new Date().getFullYear())
							</script>
							<spring:message code="label.company"/>
						</p>
					</div>
				</div>
			</div>

		</div>
<!-- OTP Sign up -->
<div class="signup-securecode" style="display:none;">
<div class="wrapper-lg ">
				<a class="back_align backbutton_signup pull-left"><span
					class="glyphicon glyphicon-arrow-left"></span></a>
					
				<div class="text-center" id="forgot-icon" style="padding-top: 50px">
					
					
					<a href="<%=hostUrl%>"><img src="<%=appUrl%>/images/logo.png" alt="Logo" class="iMg"
						 /></a>
				</div>
				
				<div class="text-center" id="login-icon" style="display: none">
				
					
					<a href="<%=hostUrl%>">
					<img src="<%=appUrl%>/images/logo.png" alt="Logo" class="iMg"
						 /></a> 
				</div>
				<div class="login-info">	
					<div class="message" id="setup_Secure_Code" style="display:none;">

						<h1><spring:message code="label.proc_without_sec_code"/></h1>
		
						<form id="otpsecure_code" class="digit-group" data-group-name="digits" data-autosubmit="false" autocomplete="off">
						<div class="form-group" style="padding: 15px 0px;">
							<label><spring:message code="label.secu_code"/></label>
					          <!-- <input id="partitioned" type="text" maxlength="6" /> -->
					          <div>
					          <!-- name="digit-1"name="digit-2"name="digit-3"name="digit-4"name="digit-5" name="digit-6"-->
								<input type="password" id="digit-1" class="digit-VVV secrete" name="digit-1" data-next="digit-2" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-2" class="digit-VVV secrete" name="digit-2" data-next="digit-3" maxlength="1" data-previous="digit-1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-3" class="digit-VVV secrete" name="digit-3" data-next="digit-4" maxlength="1" data-previous="digit-2" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								
								<input type="password" id="digit-4" class="digit-VVV secrete" name="digit-4" data-next="digit-5" maxlength="1" data-previous="digit-3" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-5" class="digit-VVV secrete" name="digit-5" data-next="digit-6" maxlength="1" data-previous="digit-4" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-6" class="digit-VVV secrete" name="digit-6" data-previous="digit-5" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
							</div>
							<input type="hidden" class="secureCodeVVV" id="secureCodeVVV" />
						</div>
							
							<div class="form-group" style="padding:0 3px;">
								<label id="securityCodeSignUpErr" style="display:none;color:#e10543"><spring:message code="label.enter_6_digit"/></label>
							</div>		
							
					
						<div class="form-group" style="padding: 15px 0px;">
							<label><spring:message code="label.conf_secu_code"/></label>
					          <!-- <input id="partitioned" type="text" maxlength="6" /> -->
					          <div>
					          <!-- name="digit-1"name="digit-2"name="digit-3"name="digit-4"name="digit-5" name="digit-6"-->
								<input type="password" id="digit-1" class="digit-confirmVVV secrete" name="digit-1" data-next="digit-2" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-2" class="digit-confirmVVV secrete" name="digit-2" data-next="digit-3" maxlength="1" data-previous="digit-1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-3" class="digit-confirmVVV secrete" name="digit-3" data-next="digit-4" maxlength="1" data-previous="digit-2" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								
								<input type="password" id="digit-4" class="digit-confirmVVV secrete" name="digit-4" data-next="digit-5" maxlength="1" data-previous="digit-3" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-5" class="digit-confirmVVV secrete" name="digit-5" data-next="digit-6" maxlength="1" data-previous="digit-4" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-6" class="digit-confirmVVV secrete" name="digit-6" data-previous="digit-5" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
							</div>
							
							<input type="hidden" class="confirmSecureCodeVVV" id="confirmSecureCodeVVV" />
						</div>
						<div class="form-group" style="padding:0 3px;">
								<label id="confirmSecurityCodeSignUpErr" style="display:none;color:#e10543"><spring:message code="label.securecode.error" /></label>
							</div>		

						<div class="row">
							<div class="col-md-12 text-right">
									<!--  <button type="button" id="frgtbtn_securecode" onclick="register();"
									class="btn btn-primary submitMFASignUp frgtbtncls">Submit</button>  -->
									 <button type="button" id="frgtbtn_securecode" 
									class="btn btn-primary submitMFASignUp frgtbtncls"><spring:message code="label.submit"/></button> 
									
							</div>
							<br/>
							<div class="col-md-12 text-center">
										<a href="#" class="anchor-decoration SecureCodeCancelButton"><spring:message code="label.cancel"/></a>
						</div>
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
	 <!-- OTP Login -->
	 <div class="login-securecode">
			<div class="wrapper-lg ">
				<a class="backbutton pull-left"><span
					class="glyphicon glyphicon-arrow-left"></span></a>
					
				<div class="text-center" id="forgot-icon" style="padding-top: 50px">
					
					
					<a href="<%=hostUrl%>"><img src="<%=appUrl%>/images/logo.png" alt="Logo" class="iMg"
						 /></a>
				</div>
				
				<div class="text-center" id="login-icon" style="display: none">
				
					
					<a href="<%=hostUrl%>">
					<img src="<%=appUrl%>/images/logo.png" alt="Logo" class="iMg"
						 /></a> 
				</div>
				<div class="login-info">
				
				 <div class="message" id="OTP_verification" style="display:none;">

						<h1><spring:message code="label.otp_verification"/></h1>
						<h3><spring:message code="label.otp_verification_on_mobile"/></h3>
						<form id="otpmobile-form" method="get" class="digit-group" data-group-name="digits" data-autosubmit="false" autocomplete="off">
						<div class="form-group" style="padding: 15px 0px;">
					          <!-- <input id="partitioned1" type="text" maxlength="4" /> -->
					          <div>
								<input type="text" id="digit-1" name="digit-1" data-next="digit-2" tabindex="1" pattern="\d*" inputmode="numeric" />
								<input type="text" id="digit-2" name="digit-2" data-next="digit-3" data-previous="digit-1" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="text" id="digit-3" name="digit-3" data-next="digit-4" data-previous="digit-2" tabindex="1" pattern="\d*" inputmode="numeric"/>
								
								<input type="text" id="digit-4" name="digit-4" data-previous="digit-3" tabindex="1" pattern="\d*" inputmode="numeric" />
								
							</div>
						</div>
						<div class="text-right resendotp">
										<a href="#" class="anchor-decoration"><spring:message code="label.resend_otp"/></a>
						</div>
						<div class="row">
							<div class="col-md-12 text-right">
								<button type="button" id="frgtbtn_verify"
									class="btn btn-link frgtbtncls"><spring:message code="label.VerifyEmailLinkNow"/></button>
							</div>
						</div>
						</form>			
					</div>  
					<form id="otplogin-form" method="get" class="digit-group" data-group-name="digits" data-autosubmit="false" autocomplete="off">
						<h1><spring:message code="label.two_step_verifi"/></h1>
						<h3><spring:message code="label.set_secure_code"/></h3>
				

						<div class="form-group" style="padding: 15px 0px;">
						<label ><spring:message code="label.enter_secure_code"/></label>
						
						<div>
						<input type="text" id="digit-1" name="digit-1" data-next="digit-2" tabindex="1" pattern="\d*" inputmode="numeric"/>
						<input type="text" id="digit-2" name="digit-2" data-next="digit-3" data-previous="digit-1" tabindex="1" pattern="\d*" inputmode="numeric" />
						<input type="text" id="digit-3" name="digit-3" data-next="digit-4" data-previous="digit-2" tabindex="1" pattern="\d*" inputmode="numeric" />
						
						<input type="text" id="digit-4" name="digit-4" data-next="digit-5" data-previous="digit-3" tabindex="1" pattern="\d*" inputmode="numeric"/>
						<input type="text" id="digit-5" name="digit-5" data-next="digit-6" data-previous="digit-4" tabindex="1" pattern="\d*" inputmode="numeric"/>
						<input type="text" id="digit-6" name="digit-6" data-previous="digit-5" tabindex="1" pattern="\d*" inputmode="numeric"/>
						</div>

					          <!-- <input id="partitioned" type="text" maxlength="6"/> -->
						</div>
						<div class="row">
							<div class="col-md-12 text-right">
								<button type="button" id="frgtbtn_verify1"
									class="btn btn-link frgtbtncls"><spring:message code="label.VerifyEmailLinkNow"/></button>
							</div>
						</div>
						<div class="col-md-12">
						<h4 class="otptext"><spring:message code="label.Or"/></h4>
						</div>
						
						<h3><spring:message code="label.login_otp"/></h3>
						<div class="radio col-xs-12 col-md-12">
							<label> <input type="radio" name="radio-input" checked="checked"
								id="reasons2" value="Send OTP on email">
								&nbsp;&nbsp; <spring:message code="label.sent_otp_email"/> <span
								class="checkmark"></span>
							</label>
						</div>
						<div class="radio col-xs-12 col-md-12">
							<label> <input type="radio" name="radio-input" checked="checked"
								id="reasons2" value="Send OTP on email">
								&nbsp;&nbsp;<spring:message code="label.sent_otp_mobile"/><span
								class="checkmark"></span>
							</label>
						</div>
						<div class="row">
							<div class="col-md-12 text-right">
								<button type="button" id="frgtbtn_sendOTP" onclick="verifycode();"
									class="btn btn-link frgtbtncls"><spring:message code="label.send_otp"/></button>
							</div>
						</div>
						<!-- /.col -->
					</form>
					
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
			
<%-- 			<div> 
				<div class="cookies_part fixedClr" style="padding-left: 10px;display:none">
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
						<p class="cookie_txt">
							<spring:message code="label.cookie_para" /> <a href="#" data-toggle="modal"
								data-target="#PModal" class="coolies-labal"><spring:message code="label.policy" /></a>.
						</p>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="btnset">
							<a id="accecpt_cookies" class="btn cookie-btn"
								style="text-transform: uppercase"><spring:message code="label.policy_agree" /></a> <a
								data-toggle="modal" data-target="#PModal" class="btn cookie-btn"
								style="text-transform: uppercase"><spring:message code="label.policy_moreinfo" /></a>
						</div>
					</div>
				</div>
			
		</div>

		 
			
				
				<div class="cookies_part_confirmed fixedClr" style="display:none">
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
						<p class="cookie_txt"><spring:message code="label.cookie_acceptencess" /></p>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="btnset">
							<a id="hidewindow" class="btn cookie-btn"
								style="text-transform: uppercase"><spring:message code="label.cookie_hide" /></a> <a id="more_info"
								data-toggle="modal" data-target="#PModal" class="btn cookie-btn"
								style="text-transform: uppercase"><spring:message code="label.cookie_more" /></a>
						</div>
					
				</div>
			</div> --%>
		
	</section>

	

	


	<!-- Modal -->
	<div class="modal fade" id="PModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog ">
		<!-- Modal content-->
		<div class="modal-content" style="padding: 0px">
			<div class="modal-header model-header-background">
				
					<button type="button" class="cookie-close closeiconcss" title="close" data-dismiss="modal">X</button>
				<div class="logo_pop">
					<img src="<%=appUrl %>/images/logo_inner.png" width="100">
				</div>
			</div>
			<div class="cookies-modal-body print_body model-body-custom" style="max-height: auto">
				<p class="boldtxt">1. <spring:message code="label.introduction" /></p>
				<ul>
					<li><p class="sub-cat-id">1.1</p>
						<p class="sub-cat-txt"><spring:message code="label.introduction_1_1" /></p></li>
					<li><p class="sub-cat-id">1.2</p>
						<p class="sub-cat-txt"><spring:message code="label.introduction_1_2" /></p></li>
				</ul>

				<p class="boldtxt">2. <spring:message code="label.scope" /></p>
				<ul>
					<li><p class="sub-cat-id">2.1</p>
						<p class="sub-cat-txt"><spring:message code="label.scope_2_1" /></p></li>
				</ul>
				<ul>
					<li><p class="sub-cat-id">2.2</p>
						<p class="sub-cat-txt"><spring:message code="label.scope_2_2" /> (<a href="<%=drySignPath%>"><spring:message code="label.dry_exelatech" /></a>) <spring:message code="label.scope_2_2_continue" /></p></li>
				</ul>
				<p class="boldtxt">3. <spring:message code="label.cpi" /></p>
				<ul>
					<li><p class="sub-cat-id">3.1</p>
						<p class="sub-cat-txt"><spring:message code="label.cpi_3_1" /></p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_a" /></p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_b" /></p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_c" /></p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_d" /></p></li>
							<li><p class="sub-cat-id">(e)</p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_e" /></p></li>
							<li><p class="sub-cat-id">(f)</p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_f" /></p></li>
						</ul>
					</li>
					<li><p class="sub-cat-id">3.2</p>
						<p class="sub-cat-txt"><spring:message code="label.cpi_3_2" /></p></li>
				</ul>
				<p class="boldtxt">4.	<spring:message code="label.upi" /></p>
				<ul>
					<li><p class="sub-cat-id">4.1</p>
						<p class="sub-cat-txt"><spring:message code="label.upi_4_1" /></p></li>
					<li><p class="sub-cat-id">4.2</p>
						<p class="sub-cat-txt"><spring:message code="label.upi_4_2" /></p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_a" /></p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_b" /></p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_c" /></p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_d" /></p></li>
							<li><p class="sub-cat-id">(e)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_e" /></p></li>
							<li><p class="sub-cat-id">(f)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_f" /></p></li>
							<li><p class="sub-cat-id">(g)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_g" /></p></li>
							<li><p class="sub-cat-id">(h)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_h" /></p></li>
							<li><p class="sub-cat-id">(i)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_i" /></p></li>
							<li><p class="sub-cat-id">(j)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_j" /></p></li>
							<li><p class="sub-cat-id">(k)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_k" /></p></li>
							<li><p class="sub-cat-id">(l)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_l" /></p></li>
						</ul></li>
					<li><p class="sub-cat-id">4.3</p>
						<p class="sub-cat-txt"><spring:message code="label.upi_4_3" /></p></li>
				</ul>
				<p class="boldtxt">5.   <spring:message code="label.lbp" /></p>
				<ul>
					<li><p class="sub-cat-id">5.1</p>
						<p class="sub-cat-txt"><spring:message code="label.lbp_5_1" /></p></li>
					<li><p class="sub-cat-id">5.2</p>
						<p class="sub-cat-txt"><spring:message code="label.lbp_5_2" /></p></li>
					<li><p class="sub-cat-id">5.3</p>
						<p class="sub-cat-txt"><spring:message code="label.lbp_5_3" /></p></li>
					<li><p class="sub-cat-id">5.4</p>
						<p class="sub-cat-txt"><spring:message code="label.lbp_5_4" /></p></li>
				</ul>
				<p class="boldtxt">6.   <spring:message code="label.olbi" /></p>
				<ul>
					<li><p class="sub-cat-id">6.1</p>
						<p class="sub-cat-txt"><spring:message code="label.olbi_6_1" /></p></li>
					<li><p class="sub-cat-id">6.2</p>
						<p class="sub-cat-txt"><spring:message code="label.olbi_6_2" /></p></li>
					<li><p class="sub-cat-id">6.3</p>
						<p class="sub-cat-txt"><spring:message code="label.olbi_6_3" /></p></li>
					
				</ul>
				<p class="boldtxt">7. <spring:message code="label.dpi" /></p>
				<ul>
					<li><p class="sub-cat-id">7.1</p>
						<p class="sub-cat-txt"><spring:message code="label.dpi_7_1" /></p></li>
					<li><p class="sub-cat-id">7.2</p>
						<p class="sub-cat-txt"><spring:message code="label.dpi_7_2" /></p></li>
					<li><p class="sub-cat-id">7.3</p>
						<p class="sub-cat-txt"><spring:message code="label.dpi_7_3" /></p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><spring:message code="label.dpi_7_3_a" /></p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt"><spring:message code="label.dpi_7_3_b" /></p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt"><spring:message code="label.dpi_7_3_c" /></p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt"><spring:message code="label.dpi_7_3_d" /></p></li>
							<li><p class="sub-cat-id">(e)</p>
								<p class="sub-cat-txt"><spring:message code="label.dpi_7_3_e" /></p></li>
						</ul></li>
					<li><p class="sub-cat-id">7.4</p>
						<p class="sub-cat-txt"><spring:message code="label.dpi_7_4" /></p></li>
				</ul>
				<p class="boldtxt">8. <spring:message code="label.idt" /></p>
				<ul>
					<li><p class="sub-cat-id">8.1</p>
						<p class="sub-cat-txt"> <spring:message code="label.idt_8_1" /></p></li>
					<li><p class="sub-cat-id">8.2</p>
						<p class="sub-cat-txt"><spring:message code="label.idt_8_2" /></p></li>
				</ul>
				<p class="boldtxt">9. <spring:message code="label.rpi" /></p>
				<ul>
					<li><p class="sub-cat-id">9.1</p>
						<p class="sub-cat-txt"><spring:message code="label.rpi_9_1" /></p></li>
					<li><p class="sub-cat-id">9.2</p>
						<p class="sub-cat-txt"><spring:message code="label.rpi_9_2" /> <b><spring:message code="label.rpi_9_2_c" /></b></p></li>
					<li><p class="sub-cat-id">9.3</p>
						<p class="sub-cat-txt"><spring:message code="label.rpi_9_3" /></p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><spring:message code="label.rpi_9_3_a" /> <b><spring:message code="label.rpi_9_2_c" /></b></p></li>
						</ul></li>
					<li><p class="sub-cat-id">9.4</p>
						<p class="sub-cat-txt"><spring:message code="label.rpi_9_4" /> </p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><spring:message code="label.rpi_9_4_a" /></p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt"><spring:message code="label.rpi_9_4_b" /></p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt"><spring:message code="label.rpi_9_4_c" /></p></li>
						</ul></li>
				</ul>
				<p class="boldtxt">10. <spring:message code="label.spi" /></p>
				<ul>
					<li><p class="sub-cat-id">10.1</p>
						<p class="sub-cat-txt"><spring:message code="label.spi_10_1" /></p></li>
					<li><p class="sub-cat-id">10.2</p>
						<p class="sub-cat-txt"><spring:message code="label.spi_10_2" /></p></li>
					<li><p class="sub-cat-id">10.3</p>
						<p class="sub-cat-txt"><spring:message code="label.spi_10_3" /></p></li>
					<li><p class="sub-cat-id">10.4</p>
						<p class="sub-cat-txt"><spring:message code="label.spi_10_4" /></p></li>
					<li><p class="sub-cat-id">10.5</p>
						<p class="sub-cat-txt"><spring:message code="label.spi_10_5" /></p></li>	
				</ul>
				<p class="boldtxt">11. <spring:message code="label.amendment" /></p>
				<ul>
					<li><p class="sub-cat-id">11.1</p>
						<p class="sub-cat-txt"><spring:message code="label.amendment_11_1" /></p></li>
					<li><p class="sub-cat-id">11.2</p>
						<p class="sub-cat-txt"><spring:message code="label.amendment_11_2" /></p></li>
					<li><p class="sub-cat-id">11.3</p>
						<p class="sub-cat-txt"><spring:message code="label.amendment_11_3" /></p></li>
				</ul>
				<p class="boldtxt">12. <spring:message code="label.uright" /></p>
				<ul>
					<li><p class="sub-cat-id">12.1</p>
						<p class="sub-cat-txt"><spring:message code="label.uright_12_1" /> 1-844-9352832 <spring:message code="label.uright_12_1_c" /> (<a href="mailto:drysign.support@exelatech.com"><spring:message code="label.dry_exelatech" /></a>)</p></li>
					<li><p class="sub-cat-id">12.2</p>
						<p class="sub-cat-txt"><spring:message code="label.uright_12_2" /></p>
					<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_a" /></b> <spring:message code="label.uright_12_2_a_c" /></p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_b" /></b> <spring:message code="label.uright_12_2_b_c" /></p></li>
							<li><p class="sub-cat-id subcatid_css">(c)</p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_c" /></b> <spring:message code="label.uright_12_2_c_c" /></p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_d" /></b> <spring:message code="label.uright_12_2_d_c" /></p></li>
							<li><p class="sub-cat-id">(e)</p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_e" /></b> <spring:message code="label.uright_12_2_e_c" /></p></li>
							<li><p class="sub-cat-id">(f)</p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_f" /></b> <spring:message code="label.uright_12_2_f_c" />  <a href="https://ico.org.uk/concerns/"><spring:message code="label.uk_concerns" /></a></p></li>
						</ul></li>	
					<li><p class="sub-cat-id">12.3</p>
						<p class="sub-cat-txt"><spring:message code="label.uright_12_3" /></p></li>
					<li><p class="sub-cat-id">12.4</p>
						<p class="sub-cat-txt"><spring:message code="label.uright_12_4" /></p></li>
					<li><p class="sub-cat-id">12.5</p>
						<p class="sub-cat-txt"><spring:message code="label.uright_12_5" /></p></li>	
				</ul>

				<p class="boldtxt">13. <spring:message code="label.ui" /></p>
				<ul>
					<li>
						<p class="sub-cat-id">13.1</p><p class="sub-cat-txt"><spring:message code="label.ui_13_1" /> 1-844-9352832 <spring:message code="label.uright_12_1_c" /> (<a href="mailto:drysign.support@exelatech.com"><spring:message code="label.dry_exelatech" /></a>)</p></li>
				</ul>	
				<p class="boldtxt">14. <spring:message code="label.cookie" /></p>
				<ul>
					<li><p class="sub-cat-id">14.1</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_1" /></p></li>
					<li><p class="sub-cat-id">14.2</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_2" /></p></li>
					<li><p class="sub-cat-id">14.3</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_3" /></p></li>
					<li><p class="sub-cat-id">14.4</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_4" /></p></li>
					<li><p class="sub-cat-id">14.5</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_5" /></p></li>
					<li><p class="sub-cat-id">14.6</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_6" /></p>
							<table border="1" align="center" id="cookiestbl">
							<tr><th><spring:message code="label.cookie_name" /></th><th><spring:message code="label.cookie_type" /></th><th><spring:message code="label.cookie_des" /></th></tr>
							<tr><td><spring:message code="label.cookie_name_val" /></td><td><spring:message code="label.cookie_type_val" /></td><td><spring:message code="label.cookie_des_val" /></td></tr>
							</table>
					</li>
					<li><p class="sub-cat-id">14.7</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_7" /></p></li>
					<li><p class="sub-cat-id">14.8</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_8" /></p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_8_a" /></p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_8_b" /></p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_8_c" /></p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_8_d" /></p></li>
						</ul>
					</li>
					<li><p class="sub-cat-id">14.9</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_9" /></p></li>
					<li><p class="sub-cat-id">14.10</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_10" /></p></li>
					<li><p class="sub-cat-id">14.11</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_11" /></p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_11_a" /> <a href="http://windows.microsoft.com/en-gb/internet-explorer/delete-manage-cookies#ie=ie-11"><spring:message code="label.del_manage_cookies"/></a>).</p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_11_b" /></p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_11_c" /></p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_11_d" /></p></li>
						</ul></li>
				</ul>
				<p class="boldtxt">15. <spring:message code="label.details" /></p>
				<ul>
					<li><p class="sub-cat-id">15.1</p>
						<p class="sub-cat-txt"><spring:message code="label.details_15_1" /></p></li>
				</ul>
					
					
			</div>
			<div class="modal-footer">
				<!--          <a title="Download  Privacy Notice" href="#" class="btn btn-default print_term_link no-print" download="">Download</a> -->

			</div>
		</div>
	</div>
</div>






	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	<%-- <script src="<%=appUrl%>/js/bootstrap.min.js"></script> --%>
	<script src="<%=appUrl%>/js/bluebird.min.js"></script>
	<script src="<%=appUrl%>/js/nagging-menu.js"></script>
	<!-- Validation -->
	<script src="<%=appUrl%>/js/jquery.validate.min.js"></script>
	<!-- Loader -->
	<script src="<%=appUrl%>/js/jquery.buttonLoader.js"></script>
	<script src="<%=appUrl %>/js/contact/countryCodes.js"></script>
	
	<!--  Timo integratation -->
	
	<script src="<%=timoptimoScriptPath%>"></script> 

	<script>
	
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
/* 	var obj = document.getElementById('partitioned1');
	obj.addEventListener('keydown', stopCarret); 
	obj.addEventListener('keyup', stopCarret); 

	function stopCarret() {
		if (obj.value.length > 3){
			setCaretPosition(obj, 3);
		}
	}

	function setCaretPosition(elem, caretPos) {
	    if(elem != null) {
	        if(elem.createTextRange) {
	            var range = elem.createTextRange();
	            range.move('character', caretPos);
	            range.select();
	        }
	        else {
	            if(elem.selectionStart) {
	                elem.focus();
	                elem.setSelectionRange(caretPos, caretPos);
	            }
	            else
	                elem.focus();
	        }
	    }
	}
	
	var obj1 = document.getElementById('partitioned');
	obj1.addEventListener('keydown', stopCarret); 
	obj1.addEventListener('keyup', stopCarret); 

	function stopCarret() {
		if (obj1.value.length > 5){
			setCaretPosition(obj1, 5);
		}
	}

	function setCaretPosition(elem, caretPos) {
	    if(elem != null) {
	        if(elem.createTextRange) {
	            var range = elem.createTextRange();
	            range.move('character', caretPos);
	            range.select();
	        }
	        else {
	            if(elem.selectionStart) {
	                elem.focus();
	                elem.setSelectionRange(caretPos, caretPos);
	            }
	            else
	                elem.focus();
	        }
	    }
	}
	 */
	/* country code started */
   // console.dir(countryCodes);
    var i,options='';
    var cont = "US";

    for(i=0;i<countryCodes.length;i++){
    		if(countryCodes[i].alpha2Code==cont){
    			options += '<option selected value="'+countryCodes[i].callingCodes[0]+" "+countryCodes[i].alpha2Code+'">'+countryCodes[i].name +'&nbsp;(+'+countryCodes[i].callingCodes[0] +')</option>';
    			document.getElementById("imgflage").src = countryCodes[i].flag;
    		}
    		else{
    	options += '<option value="'+countryCodes[i].callingCodes[0]+" "+countryCodes[i].alpha2Code+'">'+countryCodes[i].name +'&nbsp;(+'+countryCodes[i].callingCodes[0] +')</option>';
    	}
    }
    	document.getElementById('codes').innerHTML = options;
    	
    	   	
    $(document).ready(function()
    {

    	 $('input').keyup(function(){
 	        if($(this).val().length==$(this).attr("maxlength")){
 	            $(this).next().focus();
 	        }

 	    });
    	
      $("#codes").change(function()
      {
    	var a = $("#codes option:selected").val();
    	var counntryName = a.split(" ");
    	var val = counntryName[1];
    	for(i=0;i<countryCodes.length;i++){
    		if(countryCodes[i].alpha2Code==val){
    			
    			document.getElementById("imgflage").src = countryCodes[i].flag;
    			return;
    		}
    		}
       });
      
      
      $("#checkbox3").change(function(){
    	  if(!$("#checkbox3").is(":checked")){
				$("#checkBoxerr").show();
			}
    	  else{			$("#checkBoxerr").hide();
    		  }
    	  
      })
      
      
      sessionStorage.removeItem("userDetails");
    });
    
    /* country code ended */
	
    
    //vvv set securecode in a hidden field  
/* 	//vvv26Nov2020 
  
 	$(document).on("change", ".digit-VVV", function() {
		    var code="";
		    $(".digit-VVV").each(function(){		     
		        code+=$(this).val();
		    });		   		    
		    $("#secureCodeVVV").val(code);
		    
	});
    
	 $(document).on("change", ".digit-confirmVVV", function() {
		 $("#frgtbtn_securecode").removeAttr('disabled');
		    var codeStr="";
		    $(".digit-confirmVVV").each(function(){		     
		    	codeStr+=$(this).val();
		    });		   		    
		    $("#confirmSecureCodeVVV").val(codeStr);
		   	    
	}); */
   /////////////////////////////////////////////////////// 
	 
    $(document).ready(function(){
    	//var region = window.location.href.split("=");
    	//alert(region[1]);
    	localStorage.clear();
    	if(window.location.href.indexOf("region=in") != -1 || window.location.href.indexOf("region=IN") != -1 || sessionStorage.getItem("region") == "in"){
    		$("#needSignup").hide();
    		$("#country_loginDropdown").hide();
    		sessionStorage.setItem("region", "in");
    		localStorage.setItem("region", "in");
    	}
    	
    	<%
    	if ("This account has been blocked. Please reset your password using Forgot Password.".equals(googleErrorMsg)) {
    	%>
    	$("#loginInactiveUserAlert").show();
		$("#loginmessage").html("<spring:message code="label.account_blocked"/>");
    		//$("#loginInactiveUserAlert").hide();
    		//$("#successloginInactiveUserAlert").hide();
			
    	<%
    	} else {
    	%>
    		//$("#googleErrorMsgId").show();
    		//$("#successloginInactiveUserAlert").show();
			$("#loginInactiveUserAlert").hide();
			
    	<%
		}
	    %>
    	
    	<%
		if ("true".equals(buyplan)) {
	    %>
		$("#borderwithtext").hide();
		$("#googleBtn").hide();
	    <%
		} else {
	    %>
	    $("#borderwithtext").show();
	    $("#googleBtn").show();
	    <%
		}
	    %>
			$.validator.addMethod('customphone', function (value, element) {
				 var valu2=value;
				  valu2 = valu2.replace(/-/g, "");
				return this.optional(element) || /^\d{3}\d{3}\d{4}$/.test(valu2);
			}, "<spring:message code="label.validnumber"/>");
			
	//vvv password rule for exelaAuth

/*     $.validator.addMethod("pwcheck", function(value, element) {
        return this.optional(element) || /^[a-zA-Z0-9!@#$%^*_&\-]+$/i.test(value)  
        				&& /[a-z]/.test(value) // has a lowercase letter
    			       && /[A-Z]/.test(value) // has a lowercase letter
    			       && /\d/.test(value) // has a digit;
    			       && /[!@#$%^*_&\-]/.test(value); // has a lowercase letter
    	}, "Password should contain at least 1 - lowercase, uppercase alphabet, number, special character from @#$%^*_&- ");
 
 */   
 
 	$.validator.addMethod("pwcheck", function(value, element) {
        return this.optional(element) || /^[a-zA-Z0-9\`\-=\]\[\;\',\.\\\/~!@#\$%\^&\*()_\+{}\|:"<>\?]+$/i.test(value)  
        				&& /[a-z]/.test(value) // has a lowercase letter
    			       && /[A-Z]/.test(value) // has a uppercase letter
    			       && /\d/.test(value) // has a digit;
    			       && /[\`\-=\]\[\;\',\.\\\/~!@#\$%\^&\*()_\+{}\|:"<>\?]/.test(value);
    	}, "<spring:message code="label.pwd_validation_msg"/>");

///  /([a-zA-Z0-9\`\-=\]\[\;\',\.\\\/~!@#\$%\^&\*()_\+{}\|:"<>\?])+/g
	
    $.validator.addMethod("emailcheck", function(value, element) {
        var re = /^(([^<>(){}[\]\\.,;:\s@\"]+(\.[^<>(){}[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return this.optional(element) || re.test(value);
    }, "<spring:message code="label.validEmail_msgrequired"/>");
 
			 
			 $('#contactNo').keydown(function (e) {
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
			
			
			$.validator.addClassRules('customphone', {
			    customphone: true,
			    required : true
			});
			
			jQuery.validator.addMethod("lettersonly", function(value, element) {
			//	return this.optional(element) || /^[a-zA-Z ]+(([,._ /-][a-zA-Z 0-9])?[a-zA-Z0-9 ]*)*$/i.test(value);
			//}, 	"<spring:message code="label.allowedchar"/>");
				return this.optional(element) || /^[A-Za-z0-9]+$/.test(value);
			}, 	"<spring:message code="label.allowedCharOnly"/>");  
  
			 //Accept UTF 8 character  only firstname lastname validations
   
			  $(function(){
/* 
	   $( "#firstName" ).bind( 'paste',function()
	   {
		   var regex = new RegExp("/[^a-z0-9]/gi, ''");
	      	 var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	      		    if (regex.test(key)) {
	      		       event.preventDefault();
	      		       return false;
	      		    }

	    }); */
	   /* $( "#lastname" ).bind( 'paste',function(){
		   var regex = new RegExp("^[A-Za-z ,.'-]+$");
	      	 var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	      		    if (regex.test(key)) {
	      		       event.preventDefault();
	      		       return false;
			      		    }

			    }); */
	   
	});  
			  $(function(){

				   $( "#firstName" ).bind( 'paste',function()
				   {
				       setTimeout(function()
				       { 
				          //get the value of the input text
				          var data= $( '#firstName' ).val() ;
				          //replace the special characters to '' 
				          var dataFull = data.replace(/[^\w\s]/gi, '');
				          //set the new value of the input text without special characters
				          $( '#firstName' ).val(dataFull);
				       });

				    });
				   $( "#lastname" ).bind( 'paste',function()
						   {
						       setTimeout(function()
						       { 
						          //get the value of the input text
						          var data= $( '#lastname' ).val() ;
						          //replace the special characters to '' 
						          var dataFull = data.replace(/[^\w\s]/gi, '');
						          //set the new value of the input text without special characters
						          $( '#lastname' ).val(dataFull);
						       });

						    });
				});
      		    
			
	$('#firstName').on('keypress ,paste', function (e) {
		var keynum;
	    var keychar;
	    var numcheck;
	    // For Internet Explorer
	    if (window.event) {
	        keynum = e.keyCode;
	    }	
	    // For Netscape/Firefox/Opera
	    else if (e.which) {
	        keynum = e.which;
	    }
	    keychar = String.fromCharCode(keynum);
	    //List of special characters you want to restrict
	    if (keychar =="!" || keychar =="@" || keychar =="#" || keychar =="$" || keychar =="%" || keychar =="^" || keychar =="&" || keychar =="*" || keychar =="(" || keychar ==")" || keychar =="+" || keychar =="=" || keychar =="/" || keychar =="~" || keychar =="<" || keychar ==">" || keychar =="," || keychar ==";" || keychar ==":" || keychar =="|" || keychar =="?" || keychar =="{" || keychar =="}" || keychar =="[" || keychar =="]" || keychar =="¬" || keychar =="£" || keychar =='"' || keychar =="\\") {	
	    	e.preventDefault();
	    	return false;
	    } else {
	        return true;
	    }
	});
	
			$('#lastname').on('keypress', function (e) {
				var keynum;
			    var keychar;
			    var numcheck;
			    // For Internet Explorer
			    if (window.event) {
			        keynum = e.keyCode;
			    }	
			    // For Netscape/Firefox/Opera
			    else if (e.which) {
			        keynum = e.which;
			    }
			    keychar = String.fromCharCode(keynum);
			    //List of special characters you want to restrict
			    if (keychar =="!" || keychar =="@" || keychar =="#" || keychar =="$" || keychar =="%" || keychar =="^" || keychar =="&" || keychar =="*" || keychar =="(" || keychar ==")" || keychar =="+" || keychar =="=" || keychar =="/" || keychar =="~" || keychar =="<" || keychar ==">" || keychar =="," || keychar ==";" || keychar ==":" || keychar =="|" || keychar =="?" || keychar =="{" || keychar =="}" || keychar =="[" || keychar =="]" || keychar =="¬" || keychar =="£" || keychar =='"' || keychar =="\\") {	
			    	e.preventDefault();
			    	return false;
			    } else {
			        return true;
			    }
			}); 
			 
			
			jQuery.validator.addMethod("checkempty", function(value) {
				return $.trim( value );
				}, "<spring:message code="label.emptyfld"/>"); 	
			
		
		}); //end of document.ready
  
		/////////////////////////////////////////	
			
		var loginForm = $("#login-form")
				.validate(
						{
							//specify the validation rules
							rules : {
								username : {
									required : true,
									email : true
								//email is required AND must be in the form of a valid email address
								},
								password : {
									required : true,
									minlength : 8
								},
								termsandcondition:{
									
									required : true
								}
								
							},
							messages:{
								username:{
									required:"<spring:message code="label.enter_email_addr"/>"
								},
								password:{
									required:"<spring:message code="label.enter_pwd"/>"
								}
							},
							//specify validation error messages
							/* messages : {
								firstname : "First name field cannot be blank",
								lastname : "Last name field cannot be blank",
								password : {
									required : "Password field cannot be blank",
									minlength : "Your password must be at least 8 characters long"
								},
								username : {
									required : "Email address field cannot be blank",
									email : "Please enter a valid email address"
								},
								termsandcondition : {
									required : "Please accept Terms and Conditions, Privacy Policy and Consent to Proceed Electronically"
								}
							}, */
							submitHandler : function(form) {
								encrypt();
								//$("#aa").buttonLoader('start');
								$("#loader2").show();
								sessionStorage.setItem("freePopUp", true);
								form.submit();
							},
							

						});
		var registerForm = $("#register-form")
				.validate(
						{
							//specify the validation rules
							rules : {
								firstName : { 
									//lettersonly: true,
									required : true,
									checkempty : true
								},
							
								lastname : { 
									//lettersonly: true,
									required : true,
									checkempty : true
								},
								email : {
									required : true,
									email : true,
									emailcheck:true
								//email is required AND must be in the form of a valid email address
								},
								password : {
									required : true,
									minlength : 8,
									maxlength:15,
									pwcheck: true		//vvv exelaAUth password rule
								},
								confirmpassword : {
									//required : true,
									//minlength : 8,
									equalTo: "#password-field1"
								},
								/* companyName : {
									required : true,
									checkempty : true
									
								}, */
								contactNo : {
								//vvv	required : true,	//not mandatory for exelaAuth
									customphone: true,
									minlength: 10
									
								},
								checkbox3:{
									required : true
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
				                confirmpassword: "<spring:message code="label.pwd_not_match"/>",
				                firstName:{required:"<spring:message code="label.enter_fname"/>"},
				                lastname:{required:"<spring:message code="label.enter_lname"/>"},
				              //  companyName:{required:"Enter company name."},
				                email:{required:"<spring:message code="label.enter_email_addr"/>"},
				                password: {
				                	required:"<spring:message code="label.enter_pwd"/>",
				               		minlength: "<spring:message code="label.pwd_validation_msg"/>"
				                }
				            }
							
						});
		

		//vvv validate for sign up
		function validateSecurityCode(securityCode, confirmSecurityCode){

			var isNum_securityCode = /^\d+$/.test(securityCode);
		//	var isnum_confirmSecurityCode = /^\d+$/.test(confirmSecurityCode);
		/// alert("securityCode:"+securityCode+"=>isnum1: "+isNum_securityCode+"  ---confirmSecurityCode "+confirmSecurityCode);

			if(securityCode =="" && confirmSecurityCode==""){
				
				///alert("EMPTYsecureCodeVVV: "+$("#secureCodeVVV").val()+" ==confirm "+$("#confirmSecureCodeVVV").val()+" ==both are empty securityCode--"+securityCode+" ===confirmSecurityCode "+confirmSecurityCode);
				$("#securityCodeSignUpErr").css("display", "none");
				$("#confirmSecurityCodeSignUpErr").css("display", "none");
				return true;
			}
			else if(!isNum_securityCode){
				$("#frgtbtn_securecode").removeAttr('disabled');
				$("#securityCodeSignUpErr").css("display", "block");
				$("#confirmSecurityCodeSignUpErr").css("display", "none");
				return false;
			}
			else if(securityCode =="undefined" || securityCode.length < 6){	
				$("#frgtbtn_securecode").removeAttr('disabled');
			//	alert("===1");
				$("#securityCodeSignUpErr").css("display", "block");
				$("#confirmSecurityCodeSignUpErr").css("display", "none");
				return false;
			}
			else if(confirmSecurityCode =="undefined" || confirmSecurityCode.length < 6 || securityCode != confirmSecurityCode){	
			//	alert("===2");
				$("#frgtbtn_securecode").removeAttr('disabled');
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

		function encrypt(){
			var value = $("#password-field").val();
			var iv = CryptoJS.lib.WordArray.random(128/8).toString(CryptoJS.enc.Hex);
		    var salt = CryptoJS.lib.WordArray.random(128/8).toString(CryptoJS.enc.Hex);
		    var aesUtil = new AesUtil(128, 1000);
		    var ciphertext = aesUtil.encrypt(salt, iv, "1234567891234567", value);
		    var aesPassword = (iv + "::" + salt + "::" + ciphertext);
		    var passwordEncript = btoa(aesPassword);
		   	$("#password-field").val(passwordEncript);
		}
		function register() { 
			var planDetails={};
			planDetails.category="<%=category%>";
			 planDetails.token="<%=token1%>";
			 sessionStorage.setItem("planSelected",JSON.stringify(planDetails));
		//	$("#frgtbtn_securecode").attr('disabled',true);	//vvv26Nov2020

			var con = $("#codes option:selected").val().split(" ");
			//alert(con[0]);		
			var countryCodeVar=con[1].trim();		//get countrycode[].alpha2Code
			

		//	var validSecureCode = validateSecurityCode($("#secureCodeVVV").val(),$("#confirmSecureCodeVVV").val());		//vvv26Nov2020
			
 		var valid = $("#register-form").valid();		//vvv26Nov2020	new
			if (valid == true) {						//vvv26Nov2020	new
 			
 			//if (validSecureCode == true) {	 //vvv26Nov2020	//after sign up form is valid, if securecode is valid, proceed
				
 				if(!$("#checkbox3").is(":checked")){
					$("#checkBoxerr").show();
					return;
				}
//=====================start vvv26Nov2020 below code added to reset form fields from sign up  page========//

				forgotForm.resetForm();
				//$(".signup-securecode").hide();		//vvv26Nov2020 show()
				$("#login-icon").hide();
				$("#password-success").hide();
				$("#forgotpwdModelalert").hide();
				$("#forgotpwdmessage").val('');
				
				$('#forgotpassword-form')[0].reset();
				$("#otplogin-form")[0].reset();
				$("#otplogin-form").hide();
			//	$("#otpsecure_code").show();	//vvv26Nov2020
				$("#forgotpassword-form").hide();
				$("#forgot-icon").hide();		
				$("#successForgotPwdInactiveUserAlert").hide();
//=====================end vvv26Nov2020 below code added to reset form fields from sign up  page========//				
				
				var phValue=$("#contactNo").val();
				phValue=phValue.replace(/-/g, "");    // removing hyphen from contact no val to get the ph number digits
	//vvv			var contct ="+"+con[0]+"-"+phValue;  //
				
				var contct ="";
				if(phValue !=""){
						contct ="+"+con[0]+"-"+phValue;
				}
				else{
					contct ="";
				}
				
				var data = {
					"firstName" : $("#firstName").val().trim(),
					"lastname" : $("#lastname").val().trim(),
					"email" : $("#email").val().trim(),
					"password" : $("#password-field1").val(),
				//	"confirmpassword" : $("#password-field2").val(),
					"companyName":$("#companyName").val(),
		    	     "phone":contct,
		    	  //   "mfaSecureCode" : $("#secureCodeVVV").val(),	//vvv26Nov2020
		    	     "countryCode":countryCodeVar
				}
				
			///	alert("data "+JSON.stringify(data));
				
				var forBuyPlan=getUrlParameter('buyplan');
				if(forBuyPlan=="true"){
					checkIfuserExist(data.email).then(function(userexist){
	                
					if(!userexist){ 
					// Check if user email id is from exela family
  	                 if(!belongToexlaFamily(data.email)){  	                	 
  	                	sessionStorage.setItem('userDetails',JSON.stringify(data));
  						var planSelected= JSON.parse(sessionStorage.getItem("planSelected"));	
  						var appUrl="<%=appUrl %>";
  						//console.log(location.href);
  						//location.href=appUrl+"/checkoutForNewUser?plan="+planSelected.token+"&category="+planSelected.category+"&frompricing=true"+"&firstName="+data.firstName+"&lastname="+data.lastname+"&email="+data.email+"&password="+data.password+"&companyName="+data.companyName+"&phone="+data.phone;		        
  						// true for temporary registration. 
  						signUpAjax(data,true);
  	                 
  	                 }
  	                 else{
  	                	 // Signup according to normal flow 
  	                	signUpAjax(data,false);
  	                 }
  	                 }
	                else{
	                	//alert("user exist");
	                	//go back to signup page to display error
	                	$("#register-form").show();		
						var $slider = $('.login-signup');
					//	var $slider1=$(".signup-securecode"); 
						$slider.animate({
							right : parseInt($slider.css('right'), 10) == -415 ? 0 : 0
						});
						/* $slider1.animate({
							right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
						}); */
						
	                	$("#regsiterModelalert").show();
						$("#registerdmessage").html("<spring:message code="label.user-exist"/>");
	                }
				});
			}
			else{
				signUpAjax(data,false);
			 }
 		}
//vvv			}

	//CURRENT CODE COMMENTED BELOW FOR TESTING NEW EXELA AUTH MFA		
			<%-- var valid = $("#register-form").valid();
			
						
			if (valid == true) {
			
				if(!$("#checkbox3").is(":checked")){
					$("#checkBoxerr").show();
					return;
				}
		      
		     
				var phValue=$("#contactNo").val();
				phValue=phValue.replace(/-/g, "");    // removing hyphen from contact no val
				var contct ="+"+con[0]+"-"+phValue;
				
				var data = {
					"firstName" : $("#firstName").val().trim(),
					"lastname" : $("#lastname").val().trim(),
					"email" : $("#email").val(),
					"password" : $("#password-field1").val(),
				//	"confirmpassword" : $("#password-field2").val(),
					"companyName":$("#companyName").val(),
		    	     "phone":contct
				}
				
				var forBuyPlan=getUrlParameter('buyplan');
				if(forBuyPlan=="true"){
					checkIfuserExist(data.email).then(function(userexist){
	                
					if(!userexist){ 
					// Check if user email id is from exela family
  	                 if(!belongToexlaFamily(data.email)){  	                	 
  	                	sessionStorage.setItem('userDetails',JSON.stringify(data));
  						var planSelected= JSON.parse(sessionStorage.getItem("planSelected"));	
  						var appUrl="<%=appUrl %>";
  						//console.log(location.href);
  						//location.href=appUrl+"/checkoutForNewUser?plan="+planSelected.token+"&category="+planSelected.category+"&frompricing=true"+"&firstName="+data.firstName+"&lastname="+data.lastname+"&email="+data.email+"&password="+data.password+"&companyName="+data.companyName+"&phone="+data.phone;		        
  						// true for temporary registration. 
  						signUpAjax(data,true);
  	                 
  	                 }
  	                 else{
  	                	 // Signup according to normal flow 
  	                	signUpAjax(data,false);
  	                 }
  	                 }
	                else{
	                	//alert("user exist");
	                	$("#regsiterModelalert").show();
						$("#registerdmessage").html("<spring:message code="label.user-exist"/>");
	                }
				});
			}
			else{
				signUpAjax(data,false);
			  } 
			} --%>
		}
		
		var forgotForm = $("#forgotpassword-form").validate({
			//specify the validation rules
			rules : {
				email : {
					required : true,
					email : true,
					emailcheck:true
					
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
		
		
		
		function checkIfuserExist(email){
		 var returnVal= false;
		 
		 var promise1 = new Promise(function(resolve, reject) {
			  		 
		    var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath = $("#contextPath").val();
			var dt={};
			dt.email=email;
			
			$.ajax({
				contentType : 'application/json; charset=utf-8',
				type : "POST",
				url : "checkUserExist",
				dataType : 'json',
				crossDomain : true,
				data : JSON.stringify(dt),
				beforeSend : function(xhr) {
					//$('#signupbtn').buttonLoader('start');
					xhr.setRequestHeader(header, token);
				},
				complete : function() {
					//$("#signupbtn").buttonLoader('stop');
				},
				success : function(response) { 
				var res= JSON.parse(JSON.stringify(response));
				if(res.userExist==true){
		         resolve(true)		
				}
				else{
				resolve(false);
				}
			}
		
	      });
			
		 });
		 return promise1;
		}
		
		
		function belongToexlaFamily(email){
			
			var retValue=false;
			var domain = email.replace(/.*@/, "");
			var emailList=drySignConfiguration.corperatEmailList;
			//domain=domain.slice(1, domain.length);
			for(var i=0;i<emailList.length;i++){
					if(domain===emailList[i]){
					retValue=true;
					break;
				}
			}
             return retValue;
		}
		
		function signUpAjax(userData,temp){
	//	alert("sign uo called "+JSON.stringify(userData))	
			
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath = $("#contextPath").val();
			
		    // if temporary user registration
			if(temp==true)
			{
				userData.tempRegistration="true";	
				
				var planSelected= JSON.parse(sessionStorage.getItem("planSelected"));	
				userData.planToken=planSelected.token;
				
				//alert("in temp registration");
			}
			else{
				userData.tempRegistration="false";
			}
			// check if temport
			
			$.ajax({
				contentType : 'application/json; charset=utf-8',
				type : "POST",
				url : "registration",
				dataType : 'json',
				crossDomain : true,
				data : JSON.stringify(userData),
				beforeSend : function(xhr) {
					$('#signupbtn').buttonLoader('start');		//to be changed to submit btn on securecode screen
				 // $('.submitMFASignUp').buttonLoader('start');
					xhr.setRequestHeader(header, token);
				//	$("#frgtbtn_securecode").attr('disabled',true);	//vvv26Nov2020	
					$("#signupbtn").attr('disabled',true);		//vvv26Nov2020	new
				},
				complete : function() {
					$("#signupbtn").buttonLoader('stop');		//to be changed to submit btn on securecode screen
				 // $(".submitMFASignUp").buttonLoader('stop');	
				//	$("#frgtbtn_securecode").removeAttr('disabled');	//vvv26Nov2020
					$("#signupbtn").removeAttr('disabled');	//vvv26Nov2020	new
			
				},
				success : function(response) {
					//vvv== go back to sign up page to display errors ============================================
						$("#register-form").show();		
						/* //vvv26Nov2020	
						var $slider = $('.login-signup');
						var $slider1=$(".signup-securecode"); 
						$slider.animate({
							right : parseInt($slider.css('right'), 10) == -415 ? 0 : 0
						});
						$slider1.animate({
							right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
						}); */
					//vvv ========================================================================================
					//$("#frgtbtn_securecode").removeAttr('disabled');	//vvv26Nov2020
					$("#signupbtn").removeAttr('disabled');	//vvv26Nov2020 new
					if (response.msg == 1 || response.msg == "1") {
						//alert('Success');
						$("#registerdmessage").val('');
						$("#regsiterModelalert").hide();
						$("#register-form").hide();
						
						//$(".signup-securecode").hide();//vvv hide otp screen
						//$("#otpsecure_code").hide();		//vvv hide otp screen
					
						if(temp==true){
							$("#tempUser-success").show();
							$("#regMail").html(userData.email);
						}
						else{
							$("#register-success").show();
						//	$("#frgtbtn_securecode").removeAttr('disabled');	//vvv26Nov2020		
							$("#signupbtn").removeAttr('disabled');
						}
						
					} else {
					//	alert('Error');
						
						//vvv== go back to sign up page to display errors ============================================
						/* 	$("#register-form").show();		
							var $slider = $('.login-signup');
							var $slider1=$(".signup-securecode");
							$slider.animate({
								right : parseInt($slider.css('right'), 10) == -415 ? 0 : 415
							});
							$slider1.animate({
								right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
							}); */
						//vvv ========================================================================================
						
						$("#regsiterModelalert").show();
						$("#registerdmessage").html(<c:out value="response.msg"></c:out>);
						
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
       	    	                btnClass: 'btn-primary',
       	    	            }
       	    	        }
					});
					
					return false;
				}
			});
		
		}
		function verifycode() {
			$("#otplogin-form").hide();
			$("#OTP_verification").show();	
		}
		
		
		
		function forgotPassword() {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath = $("#contextPath").val();
			var forgotemail = $('#forgortEmailPassword');
			
			$("#successForgotPwdInactiveUserAlert").hide(); //vvv29may2020
			
			var valid = $("#forgotpassword-form").valid();
			if (valid == true) {
				$.ajax({
					type : "POST",
					url : "forgotPassword",
					data : {
						"forgotemail" : forgotemail.val().trim()
					},
					beforeSend : function(xhr) {
						$('#frgtbtn').buttonLoader('start');
						xhr.setRequestHeader(header, token);
					},
					complete : function() {
						$("#frgtbtn").buttonLoader('stop');
					},
					success : function(response) {
						if (response == 1) {
							//alert('Success');
							$("#forgotpwdModelalert").hide();
							$("#forgotpassword-form").hide();
							$("#forgot-icon").hide();
							$("#login-icon").show();
							$("#password-success").show();

							$(".forgotButtonClass").removeAttr('disabled');
							$(".forgotButtonClass").removeClass('disabled');
							
						} else {
							//alert('Error');
							$("#forgotpwdModelalert").show();
							$("#forgotpwdmessage").html(<c:out value="response"></c:out>);
							
							//$(".forgotButtonClass").attr('disabled','disabled');
							//$(".forgotButtonClass").addClass('disabled');
						}
					},
					error : function(xhr, textStatus, errorThrown) {
						alert('<spring:message code="label.loading_error"/>');
						return false;
					}
				});
			}
		}

		/* $("#email").change(function(){
		    alert("The text has been changed.");
		    var data=$("#email").val();
		    var contextPath=$("#contextPath").val();
		    $.ajax({
		   	 type: "POST",
			 url: $("#contextPath").val()+"login/checkUserExistOrNot",   
			 dataType: "json",
			 data: data, 
			 success: function(returnData)
			 {
				  if (returnData!== 'true')
				  {
					  alert(true);
				  	return '<p>This email address is already registered.</p>';
				  }
				  else
				  {
					  alert(false);
				  	return true;
				  }
			 },
			 error: function(xhr, textStatus, errorThrown)
			 {
			 	alert('Something went wrong.Please try again.');
			 	return false;
			 }
		  	});
		});  */
	</script>

	<script>
	
		//open forgot password pop up
		$('a.forgotpass, #back').click(function() {
			$('a.forgotpass').css("pointer-events","none");
			 $("#toggle_password_eye_signup1").removeClass("fa-eye-slash").addClass("fa-eye");
		        $("#toggle_password_eye_signup2").removeClass("fa-eye-slash").addClass("fa-eye");
	//	alert("a.forgotpass, #back");
			$("#forgortEmailPassword").focus();
			//reset form and validation
			loginForm.resetForm();
			registerForm.resetForm();
			forgotForm.resetForm();
		//$("#forgortEmailPassword").focus();
			$("#login-icon").hide();
			$("#password-success").hide();
			$("#forgotpwdModelalert").hide();
			$("#forgotpwdmessage").val('');
			$('#login-form')[0].reset();
			$("#otplogin-form")[0].reset();
			$('#forgotpassword-form')[0].reset();
			$("#otplogin-form").show();
			$("#forgotpassword-form").show();
			$("#forgot-icon").show();
			$('#register-form')[0].reset();
			
			$("#successForgotPwdInactiveUserAlert").hide(); //vvv29may2020
			$("#successloginInactiveUserAlert").hide(); //vvv29may2020
			$("#loginInactiveUserAlert").hide(); //vvv29may2020
			$(".forgotButtonClass").removeAttr('disabled'); //vvv29may2020
			$(".forgotButtonClass").removeClass('disabled'); //vvv29may2020
			
			var $slider = $('.login-forgotpass');
			var $slider1 = $('.login-signup');
			var $slider2 = $('.login-securecode');
		//	var $slider3=$('.signup-securecode');	  //vvv26Nov2020
			$slider.animate({
				right : parseInt($slider.css('right'), 10) == -415 ? 0 : 415
			});
			$slider1.animate({
				right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
			});
			$slider2.animate({
				right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
			});
			$slider3.animate({
				right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
			});
		});

		$('a.backbutton').click(function() {
			$('a.forgotpass').css("pointer-events","auto");
			$("a.signup").css("pointer-events","auto");	////vvv26Nov2020 make SignUp text clickable again
			
			 $("#toggle_password_eye_signup1").removeClass("fa-eye-slash").addClass("fa-eye");
		        $("#toggle_password_eye_signup2").removeClass("fa-eye-slash").addClass("fa-eye");
		//	alert("a.backbutton");
			//reset form and validation
			loginForm.resetForm();
			registerForm.resetForm();
			forgotForm.resetForm();
			$('#login-form')[0].reset();
			$("#otplogin-form")[0].reset();
			$('#forgotpassword-form')[0].reset();
			$('#register-form')[0].reset();
			$("#OTP_verification").hide();
			
			$("#loginmodalalret").hide();
			$("#checkBoxerr").hide();
			$(".msg").hide();
			var $slider = $('.login-signup');
			var $slider1 = $('.login-forgotpass');
			var $slider2 = $('.login-securecode');
		//	var $slider3=$('.signup-securecode');	  //vvv26Nov2020
			$slider.animate({
				right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
			});
			$slider1.animate({
				right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
			});
			$slider2.animate({
				right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
			});
			$slider3.animate({
				right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
			});
			
		});
		//Open OPT Sign Up
 		$('a.otpsingup,#back').click(function(){
	/// 	alert("vvva.otpsingup,#back secureCodeVVV--"+$("#secureCodeVVV").val()+"  confirmSecureCodeVVV== "+$("#confirmSecureCodeVVV").val());
			$("a.backbutton_signup,.SecureCodeCancelButton").css("pointer-events","auto");
			//validate form fields and then move to secure code setup screen
			 //	 $("#toggle_password_eye_signup1").removeClass("fa-eye-slash").addClass("fa-eye");
		     //   $("#toggle_password_eye_signup2").removeClass("fa-eye-slash").addClass("fa-eye"); 
			var valid = $("#register-form").valid();
			if(valid == true){ //validated successfully
				
				if(!$("#checkbox3").is(":checked")){
					$("#checkBoxerr").show();
					return;
				}
				
				//reset form and validation
				
				//vvv	registerForm.resetForm();
					forgotForm.resetForm();
				//	$(".signup-securecode").show();		//vvv26Nov2020
				//$("#forgortEmailPassword").focus();
					$("#login-icon").hide();
					$("#password-success").hide();
					$("#forgotpwdModelalert").hide();
					$("#forgotpwdmessage").val('');
					
					$('#forgotpassword-form')[0].reset();
					$("#otplogin-form")[0].reset();
					$("#otplogin-form").hide();
					$("#otpsecure_code").show();
					$("#forgotpassword-form").hide();
					$("#forgot-icon").hide();
			//vvv		$('#register-form')[0].reset();
			
				$("#successForgotPwdInactiveUserAlert").hide(); //vvv29May2020
			
				//	var $slider = $('.signup-securecode');	  //vvv26Nov2020
					var $slider1 = $('.login-signup');
					$slider.animate({
						right : parseInt($slider.css('right'), 10) == -415 ? 0 : 0
					});
					$slider1.animate({
						right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
					});
			
			}
		
		})
 		
		
		//Open opt Login
		
		$('a.otplogin, #back').click(function() {
		//	alert("a.otplogin,#back");
			
			//reset form and validation
			loginForm.resetForm();
			registerForm.resetForm();
			forgotForm.resetForm();
		//$("#forgortEmailPassword").focus();
			$("#login-icon").hide();
			$("#password-success").hide();
			$("#forgotpwdModelalert").hide();
			$("#forgotpwdmessage").val('');
			$('#login-form')[0].reset();
			$('#forgotpassword-form')[0].reset();
			$("#otplogin-form")[0].reset();
			$("#otplogin-form").show();
			$("#forgotpassword-form").show();
			$("#forgot-icon").show();
			$('#register-form')[0].reset();
			
			$("#successForgotPwdInactiveUserAlert").hide(); //vvv29may2020
			
			var $slider = $('.login-securecode');
			var $slider1 = $('.login-signup');
			$slider.animate({
				right : parseInt($slider.css('right'), 10) == -415 ? 0 : 415
			});
			$slider1.animate({
				right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
			});
		});

		function flagselect(){
			for(i=0;i<countryCodes.length;i++){
				if(countryCodes[i].alpha2Code=="US"){
				//	options += '<option selected value="'+countryCodes[i].callingCodes[0]+" "+countryCodes[i].alpha2Code+'">'+countryCodes[i].name +'&nbsp;(+'+countryCodes[i].callingCodes[0] +')</option>';
					document.getElementById("imgflage").src = countryCodes[i].flag;
				}
			}
		}
		
		//open register pop up
		$('a.signup').click(function() {
		
			$("a.signup").css("pointer-events","none");
 			$("#toggle_password_eye").removeClass("fa-eye-slash").addClass("fa-eye");
			flagselect();
			$("#firstName").focus();
			//reset form and validation
			loginForm.resetForm();
			registerForm.resetForm();
			forgotForm.resetForm();
			$('#login-form')[0].reset();
			$('#forgotpassword-form')[0].reset();
			$('#register-form')[0].reset();
			
/* 	//vvv26Nov2020		
 			$('#otpsecure_code').find('input:text').val(''); 	//reset digits from signup secure code
			//$('.digit-group').find('input:text').val(''); 	//reset digits from signup secure code
			$('.digit-VVV').val(''); 
			$('.digit-confirmVVV').val('');
			$("#secureCodeVVV").val('');			//reset secure code
			$("#confirmSecureCodeVVV").val('');		//reset confirmSecure code 
*/
			 $("#tempUser-success").hide();			//vvv23jun
			
			$("#registerdmessage").val('');
			$("#regsiterModelalert").hide();
			$("#register-form").show();
			$("#register-success").hide();

			var $slider = $('.login-signup');
			$slider.animate({
				right : parseInt($slider.css('right'), 10) == -415 ? 0 : 415
			});
	
		});
		$('a.backbutton_signup, .SecureCodeCancelButton').click(function(){
			$("a.backbutton_signup,.SecureCodeCancelButton").css("pointer-events","none");
			 $("#toggle_password_eye").removeClass("fa-eye-slash").addClass("fa-eye");
			 $("#toggle_password_eye_signup1").removeClass("fa-eye-slash").addClass("fa-eye");
		        $("#toggle_password_eye_signup2").removeClass("fa-eye-slash").addClass("fa-eye");
		///	alert("canclebtn vvva.backbutton_signup-goback to signup form");
			//reset form and validation
		/*vvv 	loginForm.resetForm();
			registerForm.resetForm();
			forgotForm.resetForm();
			$('#login-form')[0].reset();
			$('#forgotpassword-form')[0].reset();
			$('#register-form')[0].reset(); */
			$("#register-form").show();
			
			var $slider = $('.login-signup');
		//	var $slider1=$(".signup-securecode");	  //vvv26Nov2020
			$slider.animate({
				right : parseInt($slider.css('right'), 10) == -415 ? 0 : 415
			});
			$slider1.animate({
				right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
			});
		})
		
		$('a.backbutton').click(function() {
			$("a.signup").css("pointer-events","auto");
		//	alert("a.backbutton");
		 $("#toggle_password_eye").removeClass("fa-eye-slash").addClass("fa-eye");	
			//reset form and validation
			loginForm.resetForm();
			registerForm.resetForm();
			forgotForm.resetForm();
			//$('#login-form')[0].reset();
			$('#forgotpassword-form')[0].reset();
			$('#register-form')[0].reset();
			$("#").hide();
			$(".msg").hide();
			var $slider = $('.login-signup');
			$slider.animate({
				right : parseInt($slider.css('right'), 10) == 415 ? 0 : -415
			});
		});
	</script>

	<script>
		$(".toggle-password").click(function() {

			$(this).toggleClass("fa-eye fa-eye-slash");
			var input = $($(this).attr("toggle"));
			if (input.attr("type") == "password") {
				input.attr("type", "text");
			} else {
				input.attr("type", "password");
			}
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

		/* $("#checkbox2").click(function() {
			if ($("#password-field").attr("type")=="password") {
			 $("#password-field").attr("type", "text");
			 }
			 else{
			 $("#password-field").attr("type", "password");
			}
		}); */

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

	  /* var alreadystored = false;
		 $(window).on("load", function() {
			checkCookie()
		});
		function checkCookie() {
			var user = getCookie("drysigncookies");
			if (user != "") {
				alreadystored = true;
				$(".cookies_part").css("display", "none");
			}
			if (user == "") {
				$(".cookies_part").css("display", "block");
			}
		} */


/*		$(document).ready(function() {
			$("#accecpt_cookies").click(function() {
				setCookie("drysigncookies", "stored", 30);
				$(".cookies_part").css("display", "none");
				$(".cookies_part_confirmed").css("display", "block");
			});

			$("#no_give_me_more").click(function() {
				$("#cookiesModal").modal("show");
			});

			$("#more_info").click(function() {
				$("#cookiesModal").modal("show");
			});
			$("#privacypolicywindow").click(function() {
				$("#cookiesModal").modal("show");
			});

			
		});	*/
		
		

		$(document).ready(function() { 
			setInterval(function(){
				location.reload();
			},1000*60*10);
			});
		
		
		
		var getUrlParameter = function getUrlParameter(sParam) {
		    var sPageURL = window.location.search.substring(1),
		        sURLVariables = sPageURL.split('&'),
		        sParameterName,
		        i;

		    for (i = 0; i < sURLVariables.length; i++) {
		        sParameterName = sURLVariables[i].split('=');

		        if (sParameterName[0] === sParam) {
		            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
		        }
		    }
		};
		
		
		 $("#forgortEmailPassword").keypress(function(){
			 
			$(".forgotButtonClass").removeAttr('disabled'); ///vvv29may2020
			$(".forgotButtonClass").removeClass('disabled'); ///vvv29may2020
				
			 if (event.which == 13) {
				forgotPassword();
				 return false;
			 }

		});
		 
		function jsFunction(value){
			window.location="<%=appUrl %>/login?locale="+value;
			//response.setHeader("Content-Language", value);
		}
		 
		$(document).ready(function(){
			if(window.location.href.indexOf("locale=en") != -1){
	    		localStorage.setItem("langCode", "en");
	    	}else if(window.location.href.indexOf("locale=de") != -1){
	    		localStorage.setItem("langCode", "de");
	    	}else if(window.location.href.indexOf("locale=fr") != -1){
	    		localStorage.setItem("langCode", "fr");
	    	}else if(window.location.href.indexOf("locale=es") != -1){
	    		localStorage.setItem("langCode", "es");
	    	}else if(window.location.href.indexOf("locale=sv") != -1){
	    		localStorage.setItem("langCode", "sv");
	    	}else{
	    		localStorage.setItem("langCode", "en");	
	    	}
			
			
		/* 	var url = window.location.href
			var arrUrl = url.split("=");
			
			if(arrUrl[1] == "de"){
				//document.getElementById("b").setAttribute("selected", "selected");
				localStorage.setItem("langCode",arrUrl[1]);
			}else if(arrUrl[1] == "en"){
				//document.getElementById("a").setAttribute("selected", "selected");
				localStorage.setItem("langCode",arrUrl[1]);
			}else if(arrUrl[1] == "fr"){
				//document.getElementById("c").setAttribute("selected", "selected");
				localStorage.setItem("langCode",arrUrl[1]);
			}else if(arrUrl[1] == "sv"){
				//document.getElementById("d").setAttribute("selected", "selected");
				localStorage.setItem("langCode",arrUrl[1]);
			}else if(arrUrl[1] == "es"){
				//document.getElementById("e").setAttribute("selected", "selected");
				localStorage.setItem("langCode",arrUrl[1]);
			}
			
			
			
			/*	if( localStorage.getItem("langCode") != null){
				// var ln = localStorage.getItem("langCode");
				if(localStorage.getItem("langCode") == "en"){
					//document.getElementById("a").setAttribute("selected", "selected");	
				}else if(localStorage.getItem("langCode") == "de"){
					//document.getElementById("b").setAttribute("selected", "selected");
			    }else if(localStorage.getItem("langCode") == "fr"){
					//document.getElementById("c").setAttribute("selected", "selected");
			    }else if(localStorage.getItem("langCode") == "sv"){
					//document.getElementById("d").setAttribute("selected", "selected");
			    }else if(localStorage.getItem("langCode") == "es"){
					//document.getElementById("e").setAttribute("selected", "selected");
			    } 
		}else */
		/*	
			if(arrUrl[1] != null){
			var localeParam = arrUrl[1].split("&");
			//locale = arrUrl[1];
			/* On logout load locale */
		/*	if(localeParam[0] == "de"){
				//document.getElementById("b").setAttribute("selected", "selected");
				localStorage.setItem("langCode",localeParam[0]);
			}else if(localeParam[0] == "en"){
				//document.getElementById("a").setAttribute("selected", "selected");
				localStorage.setItem("langCode",localeParam[0]);
			}else if(localeParam[0] == "fr"){
				//document.getElementById("c").setAttribute("selected", "selected");
				localStorage.setItem("langCode",localeParam[0]);
			}else if(localeParam[0] == "sv"){
				//document.getElementById("d").setAttribute("selected", "selected");
				localStorage.setItem("langCode",localeParam[0]);
			}else if(localeParam[0] == "es"){
				//document.getElementById("e").setAttribute("selected", "selected");
				localStorage.setItem("langCode",localeParam[0]);
			}
		} */
			/*  else{
			// On home page load locale 
		    var userLang =  window.navigator.language ||  window.navigator.userLanguage; 
			var lng = userLang.split("-");
			
			localStorage.setItem("langCode",lng[0]);
			
			if(localStorage.getItem("langCode") == "de"){
				//document.getElementById("b").setAttribute("selected", "selected");
			}else if(localStorage.getItem("langCode") == "en"){
				//document.getElementById("a").setAttribute("selected", "selected");
			}else if(localStorage.getItem("langCode") == "fr"){
				//document.getElementById("c").setAttribute("selected", "selected");
			}else if(localStorage.getItem("langCode") == "sv"){
				//document.getElementById("d").setAttribute("selected", "selected");
		    }else if(localStorage.getItem("langCode") == "es"){
				//document.getElementById("e").setAttribute("selected", "selected");
		    } 
		} */
	});
	
		
//vvv26May2020 - resend email link	
	function resendEmailToInactiveUser(typeOfInactiveUser){
		///alert("resend: ----hiddenTemp1----"+$("#hiddenInactiveUser").val()+" --typeOfInactiveUser:"+typeOfInactiveUser);
	
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath = $("#contextPath").val();
	
		var inactiveUsername = $("#hiddenInactiveUser").val();
		var typeOfInactiveUser = typeOfInactiveUser;
		
		$.ajax({
		//	contentType : 'application/json; charset=utf-8',
			type : "POST",
			url : "resendEmailToInactiveUser",
			dataType : 'json',
			crossDomain : true,
			data : {
				"inactiveUsername":inactiveUsername,
				"typeOfInactiveUser":typeOfInactiveUser
			},
			beforeSend : function(xhr) {
			///	$('.submitMFASignUp').buttonLoader('start');			
				xhr.setRequestHeader(header, token);
			},
			complete : function() {
			///	$(".submitMFASignUp").buttonLoader('stop');	
			},
			success : function(response) {
				if (response.msg == 1 || response.msg == "1") {
			
					$("#loginmodalalret").hide();
				
					$("#loginInactiveUserAlert").hide();
					///$("#loginmessage").html("Verification link sent on registered email.");
					
					$("#successloginInactiveUserAlert").show();
					$("#loginSuccessInactiveUserMessage").html("<spring:message code="label.veri_link_sent"/>");
					
				} else {
				//	alert('Error');
					$("#loginmodalalret").hide();
					
					$("#successloginInactiveUserAlert").hide();
					$("#loginInactiveUserAlert").show();
					$("#loginmessage").html(<c:out value="response.msg"></c:out>);
				}
			},
			error : function(xhr, textStatus, errorThrown) {
				alert('<spring:message code="label.loading_error"/>');
				return false;
			}
		});
		
		
	}


//29May2020 Resend Link for Forgot Password

function resendEmailToInactiveUserFromForgotPass(inactiveUsername,typeOfInactiveUser){
	///alert("resend:inactiveUsername --"+inactiveUsername+"---typeOfInactiveUser:"+typeOfInactiveUser);

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
			"inactiveUsername":inactiveUsername,
			"typeOfInactiveUser":typeOfInactiveUser
		},
		beforeSend : function(xhr) {
		///	$('.submitMFASignUp').buttonLoader('start');			
			xhr.setRequestHeader(header, token);
		},
		complete : function() {
		///	$(".submitMFASignUp").buttonLoader('stop');	
		},
		success : function(response) {
			
			if (response.msg == 1 || response.msg == "1") {
				$("#forgotpwdModelalert").hide();
			
				$("#successForgotPwdInactiveUserAlert").show();
				$("#forgotPwdSuccessInactiveUserMessage").html("<spring:message code="label.veri_link_sent"/>");
				 
			} else {
			//	alert('Error');
				$("#successForgotPwdInactiveUserAlert").hide();
				$("#forgotpwdModelalert").show();
				$("#forgotpwdmessage").html(<c:out value="response.msg"></c:out>);
				
			}
		},
		error : function(xhr, textStatus, errorThrown) {
			alert('<spring:message code="label.loading_error"/>');
			return false;
		}
	});
	
	
}

	</script>
	
	<!--   <script type="text/javascript">
     var userLang = navigator.language || navigator.userLanguage; 
     alert ("The language is: " + userLang);
    </script> -->
	
 	<script>
	document.addEventListener('contextmenu', function(e) {
		  e.preventDefault();
		});
/* To Disable Inspect Element */
	document.onkeydown = function(e) {
		  if(event.keyCode == 123) {
		     return false;
		  }
		  if(e.ctrlKey && e.shiftKey && e.keyCode == 'I'.charCodeAt(0)) {
		     return false;
		  }
		  if(e.ctrlKey && e.shiftKey && e.keyCode == 'C'.charCodeAt(0)) {
		     return false;
		  }
		  if(e.ctrlKey && e.shiftKey && e.keyCode == 'J'.charCodeAt(0)) {
		     return false;
		  }
		  if(e.ctrlKey && e.keyCode == 'U'.charCodeAt(0)) {
		     return false;
		  }
		}
/* To Disable Inspect Element */
$(document).bind("contextmenu",function(e) {
 e.preventDefault();
});

$(document).keydown(function(e){
    if(e.which === 123){
       return false;
    }
});
$( document ).ready( function(){
    history.pushState(null,  document.title, location.href);        
});

</script>
 
</body>
</html>