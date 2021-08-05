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
<!DOCTYPE html>
<html>
   <head>
      <title>Reset OTP | DrySign</title>
      
      
      
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
      <meta http-equiv="refresh" content="540" />
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="_csrf" content="${_csrf.token}"/>
	  <meta name="_csrf_header" content="${_csrf.headerName}"/>
      <!-- <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> -->
      <link rel="stylesheet" href="<%=appUrl %>/css/bootstrap.min.css">
      <script src="<%=appUrl %>/js/jquery.min.js"></script>
      <script src="<%=appUrl %>/js/bootstrap.min.js"></script>
      <script src="<%=appUrl %>/js/nagging-menu.js"></script>
      <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> -->
      <link rel="stylesheet" href="<%=appUrl %>/css/fontAwesome4-4-0.css">
      <link rel="stylesheet" href="<%=appUrl %>/css/login.css">
      <link href="<%=appUrl %>/css/buttonLoader.css" rel="stylesheet" type="text/css">
	  <style>
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
		  
		
	 	  
		.login-info .QRCode input {
			    height: 40px;
		    
		    font-size: 18px;
		    padding: 10px 20px 10px 0;
			font-family: roboto;
			    border-radius: 0;
    
    border-bottom: 1px solid #000;
    border-top: 0;
    border-left: 0;
    border-right: 0;
        
    width: 100%;
    
    box-shadow: none;
    
			}
			.login-info label{
				font-size: 14px;
			}
			
		.login-info .QRCode input:focus{
				box-shadow: none;
			-webkit-appearance: none
			}
			.login-info .QRCode input{
				height: 40px;
			    color: #00bc9c;
			    font-size: 18px;
			    padding: 10px 20px 10px 0;
			    font-family: roboto;
			}
			.login-info .QRCode input:focus, 
			.login-info .QRCode input:active, 
			.login-info .QRCode input:visited {
    			border-bottom: 1px solid #00bc9c;
    			    outline: 0;
			}
			
			.login-info .QRCode button{
				font-weight: 400;
				color: #fff;
				border-radius: 0;
				font-size: 14px;
				font-family: roboto;
				text-transform: uppercase;
				padding: 3px 12px;
				background: #00bc9c;
				border-radius: 4px;
				display: inline-block;
				padding: 6px 12px;
				margin-bottom: 0;
				font-size: 14px;
				font-weight: 400;
				line-height: 1.42857143;
				text-align: center;
				white-space: nowrap;
				vertical-align: middle;
				-ms-touch-action: manipulation;
				touch-action: manipulation;
				cursor: pointer;
				-webkit-user-select: none;
				-moz-user-select: none;
				-ms-user-select: none;
				user-select: none;
				background-image: none;
				border: 1px solid transparent;
				border-radius: 4px;
				text-decoration: none;
				margin-top:20px;
				float:right;
			}
			
			.login-info .QRCode button:hover{
			    color: #333;
    			text-decoration: none;
    		}
    		.login-info .error {
			    color: #ff0000;
			}
	  </style>
	</head>
   <body class="bg">
   <input type="hidden" id="contextPath" value="<%=appUrl %>/"/>
      <section>
        <!-- Login -->
	     <div class="login">
            <div class="wrapper-lg">
                <div class="text-center">
                <!-- <a href="index"> -->
                
                <a href="<%=appUrl %>">
                <img src="<%=appUrl %>/images/logo.png" alt="Logo" class="iMg" title="Logo"/></a></div>
               <div class="login-info ">
               
               <%--	<div class="form-group has-feedback" style="padding:15px 0px;">
                   <label>OTP </label>
                   <input type="text" name="email" placeholder="" class="form-control" value="" aria-required="true">
                </div>--%>
                <div id="QRCode" class="QRCode"></div>
                 
                 <label id="Error" class="error" for="token"></label>
			   </div>  
               <div class="wrapper-footer">
			 <div class="wrapper-footer_content">
				 <!-- <p>Need an account? <a href="#" class="signup">Sign Up</a></p> -->
				 
				 <p>  &copy;  <script>document.write(new Date().getFullYear())</script> Exela Technologies Inc., All Rights Reserved. </p>
			 </div>
			 </div>
            </div>
		</div>
		
		<div class="cookies_part fixedClr" style="padding-left:10px">
			<div class="">
				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
						<p class="cookie_txt">
							This website uses cookies. By continuing to navigate this site
							without altering the cookie settings of your Internet browser, you
							agree to our use of cookies. For more information on cookies,
							please refer to our <a href="#" data-toggle="modal" data-target="#PModal">Privacy Policy</a>.
						</p>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="btnset">
							<a id="accecpt_cookies" class="btn cookie-btn" style="text-transform: uppercase">OK, I agree</a>
							 <a data-toggle="modal" data-target="#PModal" class="btn cookie-btn" style="text-transform: uppercase">No,
								give me more info</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="cookies_part_confirmed fixedClr">
			<div class="">
				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
						<p class="cookie_txt">Thank you for accepting cookies. You can
							now hide this message or find out more about cookies.</p>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
						<div class="btnset">
							<a id="hidewindow" class="btn cookie-btn" style="text-transform: uppercase">Hide</a>
							 <a id="more_info" data-toggle="modal" data-target="#PModal" class="btn cookie-btn" style="text-transform: uppercase">More Info</a>
						</div>
					</div>
				</div>
			</div>
		</div>
 </section>
 
 <!-- Modal -->
<div class="modal fade" id="PModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content" style="padding:0px">
			<div class="modal-header model-header-background">
				
				<button type="button" class="cookie-close" title="close" data-dismiss="modal"><i class="glyphicon glyphicon-remove"></i></button>
				<div class="logo_pop">
					<img src="<%=appUrl %>/images/logo_inner.png" width="100">
				</div>
			</div>
			<div class="cookies-modal-body print_body model-body-custom" style="max-height:auto">
				<p class="boldtxt">1. Introduction</p>
				<ul>
					<li><p class="sub-cat-id">1.1</p>
						<p class="sub-cat-txt">We are committed to safeguarding the privacy of all Personal Data provided to Exela Technologies by visitors to our website; in this policy we explain your rights under the General Data Protection Regulations (GDPR) and how we will treat your personal information.</p></li>
					<li><p class="sub-cat-id">1.2</p>
						<p class="sub-cat-txt">We will ask you to consent to our use of cookies in accordance with the terms of this policy when you first visit our website.</p></li>
				</ul>

				<p class="boldtxt">2.Scope</p>
				<ul>
					<li><p class="sub-cat-id">2.1</p>
						<p class="sub-cat-txt">Exela Technologies is a Controller of the personal data you provide to us.</p></li>
				</ul>
				<ul>
					<li><p class="sub-cat-id">2.2</p>
						<p class="sub-cat-txt">This is information about you that you give us on our website (https://drysign.exelatech.com) It includes information you provide when you register to use our site, to enter our database, subscribe to our services, and when you report a problem with our site.</p></li>
				</ul>
				<p class="boldtxt">3. Collecting Personal Information</p>
				<ul>
					<li><p class="sub-cat-id">3.1</p>
						<p class="sub-cat-txt">We may collect, store and use the
							following kinds of personal information:</p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt">Information about your computer and about your visits to and use of DrySign website including your IP address, geographical location, browser type and version, operating system, referral source, length of visit, page views and website navigation paths;</p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt">Information that you provide to us when registering with our website including your email address;</p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt">Information that you provide when completing your profile on our website including your Name, Address, Telephone No#, email address, as well as where applicable photographs or other pictoral representations;</p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt">Information that you provide to us for the purpose of subscribing to our email notifications;</p></li>
							<li><p class="sub-cat-id">(e)</p>
								<p class="sub-cat-txt">Information that you provide to us when using the services on our website, or that is generated in the course of the use of those services (including the timing, frequency and pattern of service use);</p></li>
							<li><p class="sub-cat-id">(f)</p>
								<p class="sub-cat-txt">Information contained in or relating to any communication that you send to us or send through our website including the communication content and metadata associated with the communication;</p></li>
						</ul>
					</li>
					<li><p class="sub-cat-id">3.2</p>
						<p class="sub-cat-txt">Before you disclose to us the personal information of another person, you must obtain that person's consent to both the disclosure and the processing of that personal information in accordance with this policy.</p></li>
				</ul>
				<p class="boldtxt">4.	Using Personal Information</p>
				<ul>
					<li><p class="sub-cat-id">4.1</p>
						<p class="sub-cat-txt">Personal information submitted to us through our website will be used for the purposes specified in this policy or on the relevant pages of the website.</p></li>
					<li><p class="sub-cat-id">4.2</p>
						<p class="sub-cat-txt">We may use your personal information to: </p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt">Process and Store your information to help you with your business transaction;</p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt">Where applicable personalise our website for you;</p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt">Enable your use of the services available on our website;</p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt">Supply to you services purchased through our website;</p></li>
							<li><p class="sub-cat-id">(e)</p>
								<p class="sub-cat-txt">Send you alerts of the flow of document signing process and the status;</p></li>
							<li><p class="sub-cat-id">(f)</p>
								<p class="sub-cat-txt">Help you with quick and secure way of signing contracts;</p></li>
							<li><p class="sub-cat-id">(g)</p>
								<p class="sub-cat-txt">Send you email notifications that you have specifically requested;</p></li>
							<li><p class="sub-cat-id">(h)</p>
								<p class="sub-cat-txt">Send you marketing communications relating to our business or the businesses of carefully-selected third parties which we think may be of interest to you, by post or, where you have specifically agreed to this, by email or similar technology (you can inform us at any time if you no longer require marketing communications);</p></li>
							<li><p class="sub-cat-id">(i)</p>
								<p class="sub-cat-txt">Provide third parties with statistical information about our users (but those third parties will not be able to identify any individual user from that information);</p></li>
							<li><p class="sub-cat-id">(j)</p>
								<p class="sub-cat-txt">Deal with enquiries and complaints made by or about you relating to our website;</p></li>
							<li><p class="sub-cat-id">(k)</p>
								<p class="sub-cat-txt">Keep our website secure and prevent fraud; and</p></li>
							<li><p class="sub-cat-id">(l)</p>
								<p class="sub-cat-txt">Verify compliance with the terms and conditions governing the use of our website (including monitoring private messages sent through our website private messaging service).</p></li>
						</ul></li>
					<li><p class="sub-cat-id">4.3</p>
						<p class="sub-cat-txt">We will not, without your express consent, supply your personal information to any third party for the purpose of their or any other third party's direct marketing.</p></li>
				</ul>
				<p class="boldtxt">5.   Legal Basis For Processing</p>
				<ul>
					<li><p class="sub-cat-id">5.1</p>
						<p class="sub-cat-txt">Our legal basis for the processing of personal data is our legitimate business interests, described in more detail below, although we will also rely on contract, legal obligation and consent for specific uses of data.</p></li>
					<li><p class="sub-cat-id">5.2</p>
						<p class="sub-cat-txt">We will rely on contract if we are negotiating or have entered into an agreement with you or your organisation or any other contract to provide services to you or receive services from you or your organisation.</p></li>
					<li><p class="sub-cat-id">5.3</p>
						<p class="sub-cat-txt">We will rely on legal obligation if we are legally required to hold information on you to fulfil our legal obligations.</p></li>
					<li><p class="sub-cat-id">5.4</p>
						<p class="sub-cat-txt">We will in some circumstances rely on consent for particular uses of your data and you will be asked for your express consent, if legally required.</p></li>
				</ul>
				<p class="boldtxt">6.	Our Legitimate Business Interests</p>
				<ul>
					<li><p class="sub-cat-id">6.1</p>
						<p class="sub-cat-txt">To provide information and introductions about our services products;</p></li>
					<li><p class="sub-cat-id">6.2</p>
						<p class="sub-cat-txt">To maintain, expand and develop our business we need to record the personal data of client contacts;</p></li>
					<li><p class="sub-cat-id">6.3</p>
						<p class="sub-cat-txt">Help you with quick and secure way of signing contracts;</p></li>
					
				</ul>
				<p class="boldtxt">7.	Disclosing Personal Information</p>
				<ul>
					<li><p class="sub-cat-id">7.1</p>
						<p class="sub-cat-txt">We may disclose your personal information to any of our employees, officers, insurers, professional advisers, agents, suppliers or subcontractors insofar as reasonably necessary for the purpose of helping you with your business transactions.</p></li>
					<li><p class="sub-cat-id">7.2</p>
						<p class="sub-cat-txt">We may disclose your personal information to any member of our group of companies (this means our subsidiaries, our ultimate holding company and all its subsidiaries) insofar as reasonably necessary for the purposes set out in this policy.</p></li>
					<li><p class="sub-cat-id">7.3</p>
						<p class="sub-cat-txt">We may disclose your personal information: </p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt">To the extent that we are required to do so by law;</p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt">In connection with any ongoing or prospective legal proceedings;</p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt">In order to establish, exercise or defend our legal rights (including providing information to others for the purposes of fraud prevention and reducing credit risk);</p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt">To the purchaser (or prospective purchaser) of any business or asset that we are (or are contemplating) selling; and</p></li>
							<li><p class="sub-cat-id">(e)</p>
								<p class="sub-cat-txt">To any person who we reasonably believe may apply to a court or other competent authority for disclosure of that personal information where, in our reasonable opinion, such court or authority would be reasonably likely to order disclosure of that personal information.</p></li>
						</ul></li>
					<li><p class="sub-cat-id">7.4</p>
						<p class="sub-cat-txt">Except as provided in this policy, we will not provide your personal information to third parties.</p></li>
				</ul>
				<p class="boldtxt">8.	International Data Transfers</p>
				<ul>
					<li><p class="sub-cat-id">8.1</p>
						<p class="sub-cat-txt">The data that we collect from you will not be shared outside EEA.</p></li>
					<li><p class="sub-cat-id">8.2</p>
						<p class="sub-cat-txt">We will take all steps reasonably necessary to ensure that your data is treated securely and in accordance with this privacy notice.</p></li>
				</ul>
				<p class="boldtxt">9.	Retaining Personal Information</p>
				<ul>
					<li><p class="sub-cat-id">9.1</p>
						<p class="sub-cat-txt">This Section 9 sets out our data retention policies and procedure, which are designed to help ensure that we comply with our legal obligations in relation to the retention and deletion of personal information.</p></li>
					<li><p class="sub-cat-id">9.2</p>
						<p class="sub-cat-txt">Personal information that we collect from our website and processed for marketing and service update notifications will be kept by us for <b>5 Years.</b></p></li>
					<li><p class="sub-cat-id">9.3</p>
						<p class="sub-cat-txt">Without prejudice to Section 9.2, we will usually delete personal data falling within the categories set out below at the date/time set out below:</p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt">Personal Data which can be used to identify an individual will be deleted in line with statute or best practice as amended from time to time. The current retention period is <b>5 Years.</b></p></li>
						</ul></li>
					<li><p class="sub-cat-id">9.4</p>
						<p class="sub-cat-txt">Notwithstanding the other provisions of this Section 9, we will retain documents (including electronic documents) containing personal data: </p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt">To the extent that we are required to do so by law;</p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt">If we believe that the documents may be relevant to any ongoing or prospective legal proceedings; and</p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt">In order to establish, exercise or defend our legal rights (including providing information to others for the purposes of fraud prevention and reducing credit risk).</p></li>
						</ul></li>
				</ul>
				<p class="boldtxt">10.	Security of Personal Information</p>
				<ul>
					<li><p class="sub-cat-id">10.1</p>
						<p class="sub-cat-txt">We will take reasonable technical and organisational precautions to prevent the loss, misuse or alteration of your personal information.</p></li>
					<li><p class="sub-cat-id">10.2</p>
						<p class="sub-cat-txt">We will store all the personal information you provide on our secure (password- and firewall-protected) servers.</p></li>
					<li><p class="sub-cat-id">10.3</p>
						<p class="sub-cat-txt">All electronic financial transactions entered into through our website will be protected by encryption technology.</p></li>
					<li><p class="sub-cat-id">10.4</p>
						<p class="sub-cat-txt">You acknowledge that the transmission of information over the internet is inherently insecure, and we cannot guarantee the security of data sent over the internet.</p></li>
					<li><p class="sub-cat-id">10.5</p>
						<p class="sub-cat-txt">You are responsible for keeping the password you use for accessing our website confidential; we will not ask you for your password (except when you log in to our website).</p></li>	
				</ul>
				<p class="boldtxt">11.	Amendments</p>
				<ul>
					<li><p class="sub-cat-id">11.1</p>
						<p class="sub-cat-txt">We may update this policy from time to time by publishing a new version on our website.</p></li>
					<li><p class="sub-cat-id">11.2</p>
						<p class="sub-cat-txt">You should check this page occasionally to ensure you are happy with any changes to this policy.</p></li>
					<li><p class="sub-cat-id">11.3</p>
						<p class="sub-cat-txt">We may also notify you of changes to this policy by email or through the private messaging system on our website.</p></li>
				</ul>
				<p class="boldtxt">12.	Your Rights</p>
				<ul>
					<li><p class="sub-cat-id">12.1</p>
						<p class="sub-cat-txt">You can exercise your right to accept or prevent processing of your personal data for marketing purposes by checking certain boxes on the forms we use to collect your data. You can also exercise the right at any time by contacting us on: 1-844-9352832 or by email at: (drysign.support@exelatech.com )</p></li>
					<li><p class="sub-cat-id">12.2</p>
						<p class="sub-cat-txt">Under the GDPR, you have the following rights</p>
					<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><b>Request correction</b> of the personal information that we hold about you. This enables you to have any incomplete or inaccurate information we hold about you corrected.</p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt"><b>Request erasure</b> of your personal information. This enables you to ask us to delete or remove personal information where there is no good reason for us continuing to process it. You also have the right to ask us to delete or remove your personal information where you have exercised your right to object to processing (see below).</p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt"><b>Object to processing</b> of your personal information where we are relying on a legitimate interest (or those of a third party) and there is something about your particular situation which makes you want to object to processing on this ground. You also have the right to object where we are processing your personal information for direct marketing purposes.</p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt"><b>Request the restriction</b> of processing of your personal information. This enables you to ask us to suspend the processing of personal information about you, for example if you want us to establish its accuracy or the reason for processing it.</p></li>
							<li><p class="sub-cat-id">(e)</p>
								<p class="sub-cat-txt"><b>Request the transfer</b> of your personal information to another party in certain formats, if practicable.</p></li>
							<li><p class="sub-cat-id">(f)</p>
								<p class="sub-cat-txt"><b>Make a complaint</b> to a supervisory body which in the United Kingdom is the Information Commissioner's Office. The ICO can be contacted through this link:  https://ico.org.uk/concerns/</p></li>
						</ul></li>	
					<li><p class="sub-cat-id">12.3</p>
						<p class="sub-cat-txt">You may instruct us to provide you with any personal information we hold about you; provision of such information will be subject to the supply of appropriate evidence of your identity (for this purpose, we will usually accept a photocopy of your passport certified by a solicitor or bank plus an original copy of a utility bill showing your current address). No fee shall be charged for any such request.</p></li>
					<li><p class="sub-cat-id">12.4</p>
						<p class="sub-cat-txt">Should you believe that any personal data we hold on you is incorrect or incomplete, you have the ability to request to see this information, rectify or have it deleted. Please contact us through Data Subject Requests (DSRs).</p></li>
					<li><p class="sub-cat-id">12.5</p>
						<p class="sub-cat-txt">We may withhold personal information that you request to the extent permitted by law or where it impacts on the rights and freedoms of other data subjects.</p></li>	
				</ul>

				<p class="boldtxt">13.	Updating information</p>
				<ul>
					<li><p class="sub-cat-id">13.1</p>
						<p class="sub-cat-txt">13.1	Please let us know if the personal information that we hold about you needs to be corrected or updated by contacting us on: 1-844-9352832 or by email at: (drysign.support@exelatech.com )</p></li>
				</ul>	
				<p class="boldtxt">14.	Cookies</p>
				<ul>
					<li><p class="sub-cat-id">14.1</p>
						<p class="sub-cat-txt">Our website uses cookies.</p></li>
					<li><p class="sub-cat-id">14.2</p>
						<p class="sub-cat-txt">A cookie is a file containing an identifier (a string of letters and numbers) that is sent by a web server to a web browser and is stored by the browser. The identifier is then sent back to the server each time the browser requests a page from the server.</p></li>
					<li><p class="sub-cat-id">14.3</p>
						<p class="sub-cat-txt">Cookies may be either "persistent" cookies or "session" cookies: a persistent cookie will be stored by a web browser and will remain valid until its set expiry date, unless deleted by the user before the expiry date; a session cookie, on the other hand, will expire at the end of the user session, when the web browser is closed.</p></li>
					<li><p class="sub-cat-id">14.4</p>
						<p class="sub-cat-txt">Cookies do not typically contain any information that personally identifies a user, but personal information that we store about you may be linked to the information stored in and obtained from cookies.</p></li>
					<li><p class="sub-cat-id">14.5</p>
						<p class="sub-cat-txt">We use both session and persistent cookies on our website.</p></li>
					<li><p class="sub-cat-id">14.6</p>
						<p class="sub-cat-txt">The cookies we use and their purpose is as in the table below</p>
							<table border="1" align="center">
							<tr><th>Cookie Name</th><th>Cookie Type</th><th>Description of Use</th></tr>
							<tr><td>JSesssionID</td><td>Session</td><td>Used to verify user has been authenticated</td></tr>
							</table>
					</li>
					<li><p class="sub-cat-id">14.7</p>
						<p class="sub-cat-txt">we use various cookie programmes to recognise a computer when a user visits our website.</p></li>
					<li><p class="sub-cat-id">14.8</p>
						<p class="sub-cat-txt">Most browsers allow you to refuse to accept cookies; for example:</p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt">In Internet Explorer (version 11), you can block cookies using the cookie handling override settings available by clicking "Tools", "Internet Options", "Privacy" and then "Advanced";</p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt">In Firefox (version 47), you can block all cookies by clicking "Tools", "Options", "Privacy", selecting "Use custom settings for history" from the drop-down menu, and unticking "Accept cookies from sites"; and</p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt">In Chrome (version 52), you can block all cookies by accessing the "Customise and control" menu, and clicking "Settings", "Show advanced settings" and "Content settings", and then selecting "Block sites from setting any data" under the "Cookies" heading.</p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt">In Microsoft Edge (version 41), you can block cookies by clicking the "..." icon in the top right corner of the browser window. Towards the bottom click "Setting" then "View advanced settings. From the drop-down menu under the "Cookies" heading, select "Block all cookies".</p></li>
						</ul>
					</li>
					<li><p class="sub-cat-id">14.9</p>
						<p class="sub-cat-txt">Blocking all cookies will have a negative impact upon the usability of our and many other websites.</p></li>
					<li><p class="sub-cat-id">14.10</p>
						<p class="sub-cat-txt">If you block cookies, you will not be able to use all the features on our website.</p></li>
					<li><p class="sub-cat-id">14.11</p>
						<p class="sub-cat-txt">You can delete cookies already stored on your computer; for example:</p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt">In Internet Explorer (version 11), you must manually delete cookie files (you can find instructions for doing so at http://windows.microsoft.com/en-gb/internet-explorer/delete-manage-cookies#ie=ie-11);</p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt">In Firefox (version 47), you can delete cookies by clicking "Tools", "Options" and "Privacy", then selecting "Use custom settings for history" from the drop-down menu, clicking "Show Cookies", and then clicking "Remove All Cookies"; and</p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt">In Chrome (version 52), you can delete all cookies by accessing the "Customise and control" menu, and clicking "Settings", "Show advanced settings" and "Clear browsing data", and then selecting "Cookies and other site and plug-in data" before clicking "Clear browsing data".</p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt">In Microsoft Edge (version 41), you can delete all cookies by selecting the "..." icon in the top right corner of the browser window. Towards the bottom click "Setting" then "Choose what to clear". Select "Cookies and saved website data" and "Cached data and files and click on "Clear".</p></li>
						</ul></li>
				</ul>
				<p class="boldtxt">15.	Our Details</p>
				<ul>
					<li><p class="sub-cat-id">15.1</p>
						<p class="sub-cat-txt">DrySign website is owned and operated by Exela Technologies.</p></li>
				</ul>
					
					
			</div>
			<div class="modal-footer">
				<!--          <a title="Download  Privacy Notice" href="#" class="btn btn-default print_term_link no-print" download="">Download</a> -->

			</div>
		</div>
		</div>
	</div>
 

 <!-- script --> 
 

 <script>
 var email ="<c:out value="${email}"></c:out>";
 //console.log(email);
$(document).ready(function() {
	 	var xhttp = new XMLHttpRequest();
	 	    xhttp.onreadystatechange = function() {
	 	        if (this.readyState == 4 && this.status == 200) {
	 	        	document.getElementById("QRCode").innerHTML =
	 	        		xhttp.responseText; 
	 	        	document.getElementById("token").focus();
	 	       }
	 	    };
	 	    
	 	    xhttp.open("GET", "<%=appUrl %>/qrcode/reset?email="+email, true);  
	 	 	xhttp.setRequestHeader("Content-type", "application/json"); 
	 	 	xhttp.send();
	 	});
 
 
 function on2FAValidation(token){
	   /* alert('token is '+token);
	   alert('email is '+ email); */
	  // debugger;
	   var xhttpVerify = new XMLHttpRequest();
	   /* xhttpVerify.open("GET", "http://localhost:8086/DrySign/otpVerify?email="+email+"&token="+token, true); */
	   xhttpVerify.open("GET", "<%=appUrl %>/otpVerify?email="+email+"&token="+token, true);
	   xhttpVerify.send();
  		xhttpVerify.onreadystatechange = function() {
	 	        if (this.readyState == 4 && this.status == 200) {
	 	        	// console.log('success', xhttpVerify.responseText);
	 	        	if(xhttpVerify.responseText=="true"){
	 	        		/* window.location="http://localhost:8086/DrySign/app/dashboard"; */
	 	        		window.location="<%=appUrl %>/app/dashboard";
	 	        	}else{
	 	        		document.getElementById("Error").innerHTML =
		 	        		"Please enter valid OTP";
	 	        	}
	 	        	
	 	       		 }
	 	        }; 
 			}
	
</script>
</body>
</html>

