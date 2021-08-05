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
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-MRTTRCL');</script>
<!-- End Google Tag Manager -->

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

<meta name="<spring:message code="label.homemetades" />" content="<spring:message code="label.metadescont" />"/>
<meta charset="utf-8">
<meta http-equiv="refresh" content="540" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title><spring:message code="label.hometitle" /></title>

	
	<!--  <link rel="stylesheet" href="<%=appUrl %>/css/newCSS/bootstrap.css" type="text/css">-->
	<link rel="stylesheet" href="<%=appUrl%>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=appUrl %>/css/font-awesome.min.css">
	<link rel="stylesheet" href="<%=appUrl %>/css/newCSS/style.css" />
	<link rel="stylesheet" href="<%=appUrl %>/css/newCSS/global.css" /> 
	<link rel="stylesheet" href="<%=appUrl %>/css/newCSS/custom.css" />
	<link rel="stylesheet" href="<%=appUrl %>/css/newCSS/drysign.css" />
	<link rel="stylesheet" href="<%=appUrl %>/css/cookie.css" />
	
	<link href="<%=appUrl %>/css/buttonLoader.css" rel="stylesheet" type="text/css">
	
<style>
#setupSecureCode{
color: #666;
font-weight: normal;
font-size: 22px;
}
.footer-links{
float:right;}
#Case-Study{
margin-top:20px;}
@media (max-width: 330px) {
.termLinkOne label::before{
margin-left:0;
}
#signupbtn2{
word-wrap: break-word;
white-space: unset;
}
}
@media (max-width: 767px) {
.btn-primary{
padding: 10px 9px !important;
}
}
.subcatid_css{
   margin-bottom: 21px;
}
#cookiestbl th{
padding:5px;}
#cookiestbl td{
padding:5px;}
/*#password-field1{
padding: 10px 15px !important;
}*/
#PModal{
 float: left !important;
margin-right: 10px !important;
box-sizing: inherit !important;
font-family: 'Source Sans Pro', sans-serif !important;
font-size: 14px !important;
color: #40505B !important;

 }
.img_parent img{
/*max-height:19px;*/

    max-height: 100%;
    max-width: 100%;
    vertical-align: middle;

}

.img_parent {
    /*position: absolute;
    top: 5px;
    left: 21px;
     width:auto !important;*/
     position: absolute;
    width: 30px;
    height: 100%;
    /* background: #000; */
    left: 22px;
  
    bottom: -3px;
}

img#imgflage1 {
    /*position: absolute;
    top: 5px;
    left: 21px;
    /*width: 20px;*/
}
  .toggle-password, .toggle-password2 {
    position: absolute;
    right: 4px;
    cursor:pointer;
    /* left: 0; */
    /* text-align: right; */
    /* width: 100%; */
    /* display: inline-block; */
    top:10px;
}
.passwordGroup {
    position: relative;
}
.fa.fa-eye, .fa.field-icon {
color: #000;}



input.secrete{
 /* -webkit-text-security: disc; */
   font-size:15px;
 	
}
  
</style> 

<body>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-102458969-1"></script>
<!-- <script> -->
//<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MRTTRCL"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
//<!-- End Google Tag Manager (noscript) -->
<!-- </script> -->

<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-102458969-1');
  //gtag('config', 'AW-747261926');
</script>
   
<!--    <script>
function gtag_report_conversion(url) {
	console.log("in gtag");
  var callback = function () {
    if (typeof(url) != 'undefined') {
      window.location = url;
    }
  };
  gtag('event', 'conversion', {
      'send_to': 'AW-747261926/q2YdCK641KABEOafqeQC',
      'event_callback': callback
  });
  return false;
}
</script> -->

   
<header>
        <div class="row">
            <div class="fixedHeader">
                <nav class="navbar navbar-fixed-top">
                    <div class="nav-logo">
                        <div id="logoHolder">
                            <a href="<%=appUrl %>"><img src="<%=appUrl %>/images/newimages/drysign_logo.png"></a>
                        </div>
                    </div>
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="closemenu"></span>
                        </button>
                    </div>

                    <div class="navbar-collapse collapse" style="height: 1px;">
                        <ul class="nav navbar-nav">
                            <li class="nav-item" id = "bnifit">
                                <a class="nav-link" id="section_benefit" href="#section1" onclick="myclickFunction()"><spring:message code="label.benefits" /> <span class="sr-only"></span></a>
                            </li>
                             
                            <li class="nav-item" id="faqsection">
                                <a class="nav-link" id="sectionFaq123" href="<%=appUrl %>/plancharge?category_name=General%20Plans&category=1#sectionFaq" onclick="faqclickFunction()"><spring:message code="label.faq" /></a>
                                
                            </li>
                            
                            <li class="nav-item" id="pricingsction">
                                <a class="nav-link" id="pricingsction123" href=" <%=appUrl %>/plancharge?category_name=General%20Plans&category=1"><spring:message code="label.pricing" /> </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<%=appUrl %>/login?locale=en"><spring:message code="label.signin" /></a>
                            </li>
                            <li class="nav-item trydrysign">
                                <a onClick="openSignUp()" class="nav-link " id="trysignclick" ><spring:message code="label.trydrysign" /></a>
                            </li>
                            <li class="nav-item">
                                <a class="blogslink" target="_blank" href="https://drysignblogs.exelatech.com/"><spring:message code="label.blogs"/></a>
                            </li>
                            
                        </ul>
                        <div class="navbar-header navbar-right">
                            <p class="navbar-text">
                                <a href="https://www.exelatech.com" class="navbar-link"><spring:message code="label.exelatech"/> <i class="fa fa-arrow-right"></i></a>
                            </p>
                        </div>
                    </div>
                </nav>

            </div>
        </div>
</header>

<div class="bodySection">
<!-- google analytics cookie hidden fields - not used as of now -->
<input type="hidden" id="hidden_GA_source" value="NO-VALUE"/>
<input type="hidden" id="hidden_GA_gclId" value="NO-VALUE"/>

     <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-lg-12">
                    <div class="fixedImage">
                        <div class="docTitle text-center bottom-20">
                <spring:message code="label.doctitle" />
                        </div>
                        <div class="doc-subTitle text-center bottom-50">
                             <spring:message code="label.docsubtitle" />
                        </div>
                        <div class="text-center bottom-20">
                            <button type="button" class="btn btn-primary" onClick="openSignUp()" > <spring:message code="label.tryfree" /></button>
                        </div>
                        <div class="text-center bottom-20 graycolor">
                            <spring:message code="label.try15" />
                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-12 ">
                    <div class="videoDiv rwd-media">

               <iframe width="100%" height="360" src="https://www.youtube.com/embed/B481cwDm9CQ?rel=0&enablejsapi=1" frameborder="0" ></iframe> 
			                 </div>
<!--   <iframe width="100%" height="360" src="https://www.youtube.com/embed/LtvKxX3aolE?rel=0&enablejsapi=1" frameborder="0" ></iframe>  -->

            </div>
        </div>

        <section class="fixedImage-platform" >
            <div class="container-fluid"  >
                <div class="row" id="section1">
                    <div class="">
                        <div>
                            <div class="platform-div">
                                <div class="text-center">
                                    <div class="home-header-title"><spring:message code="label.home-header-title" /></div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 hor-border">
                                        <div class="row">
                                            <div class="col-lg-10 offset-lg-3">
                                                <div class="plhi">
                                                    <label><spring:message code="label.plhi" /></label>
                                                    <div>
                                                       <spring:message code="label.plhi-content" />
                                                    </div>
                                                </div>
                                                <!-- <div class="plhi">
                                                    <label>Platform Integration</label>
                                                    <div>
                                                        Available API allows DrySign to be fully integrated with existing platforms for seamless signature execution
                                                    </div>
                                                </div> -->
                                                <div class="plhi">
                                                    <label><spring:message code="label.meet" /></label>
                                                    <div>
                                                   <spring:message code="label.meet_para" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-1"></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="row">
                                            <div class="col-lg-1"></div>
                                            <div class="col-lg-12 heighlightSection">
                                                <div class="plhi">
                                                    <label><spring:message code="label.seamless" /></label>
                                                    <div>
                                                       <spring:message code="label.seamless_para" />

                                                    </div>
                                                </div>
                                                <div class="plhi">
                                                    <label> <spring:message code="label.auto" /></label>
                                                    <div>
                                                     <spring:message code="label.autopara" />
                                                    </div>
                                                </div>
                                                <!-- <div class="plhi">
                                                    <label>Authentication and Security </label>
                                                    <div>
                                                        Options for single or multi-factor authentication and a complete audit trail for all documents
                                                    </div>
                                                </div> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="container-fluid">

            <div class="row padding-l">
                <div class="col-lg-12">
                    <span class="text-center">
                            <h4><spring:message code="label.whysign" /></h4>
                            <p><spring:message code="label.try-drySign" /></p>
                        </span>
                </div>
                <div class="col-lg-12">
                    <div class="text-center bottom-20">
                        <button type="button" class="btn btn-primary scrollbotom" onClick="openSignUp()"><spring:message code="label.tryfree" /></button>
                    </div>
                    <div class="text-center bottom-20">
                        <a href="<%=appUrl %>/images/productSheet.pdf"  target="_blank"><spring:message code="label.sheet" /></a>
                    </div> 
                </div>
            </div>
        </div>

        <div class="container">

            <div class="row">
                <div class="col-sm-6 col-sm-push-6">
                    <div class="feature-detail">
                        <label><spring:message code="label.extensions" /></label>
                        <p><spring:message code="label.integrated" /></p>
                    </div>
                </div>
                <div class="col-sm-6 col-sm-pull-6 feature-images">
                    <img src="<%=appUrl %>/images/newimages/sign-documents-digitally.png">
                </div>
            </div>
            <hr/ class="hidden-xs">
            <div class="row">
                <div class="col-sm-6 col-sm-push-6">
                    <div class="feature-detail">
                        <label><spring:message code="label.track" /></label>
                        <p><spring:message code="label.track-para" /></p>
                    </div>
                </div>
                <div class="col-sm-6 col-sm-pull-6 feature-images">
                    <img src="<%=appUrl %>/images/newimages/group-sign.png">
                </div>
            </div>
            <hr/ class="hidden-xs">
            <div class="row">
                <div class="col-sm-6 col-sm-push-6">
                    <div class="feature-detail">
                        <label><spring:message code="label.customizations" /></label>
                        <p><spring:message code="label.customizations-para" /></p>
                    </div>
                </div>
                <div class="col-sm-6 col-sm-pull-6 feature-images">
                    <img src="<%=appUrl %>/images/newimages/visibility.png">
                </div>
            </div>
            <hr/ class="hidden-xs">
            <div class="row">
                <div class="col-sm-6 col-sm-push-6">
                    <div class="feature-detail">
                        <label><spring:message code="label.sdashboard" /></label>
                        <p><spring:message code="label.sdashboardpara" /></p>
                        <!-- <p>View signature history</p> -->
                    </div>
                </div>
                <div class="col-sm-6 col-sm-pull-6 feature-images">
                    <img src="<%=appUrl %>/images/newimages/records.png">
                </div>
            </div>
            <!-- <hr/ class="hidden-xs">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="testimonial">" Testimonial lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
                        magna aliqua "                      
                        <div>Quote Source</div>
                    </div>
                </div>
            </div> -->
        </div>

        <section>
            <div id="Case-Study" class="Dept">
                <div class="home-case">
                    <div class="home-case-img fixedImage-documents">




                        <div class="home-case-content">
                            <div class="case-header-title"><spring:message code="label.doc" /></div>
                            <h2 class="home-case-title">


                               <spring:message code="label.docpara" />


                            </h2>
                            <span><spring:message code="label.by" /></span>

                            <div class="home-case-link">

                                <a href="https://www.exelatech.com/article/how-prepare-your-company-fourth-industrial-revolution" target="_blank"><spring:message code="label.view-article" /></a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

		<!-- Not Required -->
        <section class="resource-container" id="section2">
            
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-lg-12 text-center">
                            <h1 class="block-title1"><spring:message code="label.signup-free"/></h1>
                        </div>
                        
                       	<div class="message text-center" id="register-success2" style="display:none;padding: 30px; background-color:white; width: 500px;  margin: 0 auto;  max-width: 90%;margin-top:70px;">
							<!--  <span class="pull-right"><button type="button" class="close" onClick="sucessmsgClose()">&times;</button></span>-->
			   				<p><img src="<%=appUrl %>/images/message-bg.png"/></p>
			   				<h4><spring:message code="label.a-created" /></h4>
			  				<!--  <p>Congratulations! Your new account has been successfully created.</p> -->
			   				<p><spring:message code="label.receive-email" /></p>
			      			<a href="login" class="btn backbutton btn-link continuelink"><spring:message code="label.conti-drysign" /></a>                   
		   				</div>
			   
		 				<div class="alert alert-danger fade in" style="display:none;text-align:center;margin: 15px auto; width: 500px; max-width: 80%; overflow:hidden;" id="regsiterModelalert2">
		    				<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>
							<div id="registerdmessage2"></div>
						</div>
                        
                        <div class="resource-container-info">

                        	<div class="col-lg-12" id="registerFormDiv2" >
                            	<form id="indexregister2">  
	                                <div class="row">
	                                    <div class="col-lg-6">
	                                    	<div class="form-group">
	                                    		<input type="text" class="form-control namevalidation" id="firstName2" name="firstName2" placeholder="<spring:message code="label.fname" />" maxlength="30"/>
	                                    	</div>
	                                        
	                                    </div>
	                                    <div class="col-lg-6">
	                                    	<div class="form-group">
	                                        	<input type="text" class="form-control namevalidation" id="lastname2" name="lastname2" placeholder="<spring:message code="label.lname" />" value="" maxlength="30"/>
	                                    	</div>
	                                    </div>
	                                </div>
	                                <div class="row">
	                                	<div class="col-lg-12">
		                                	<div class="form-group">
		                                    	<input type="text" class="form-control"  id="companyName2" name="companyName2" placeholder="<spring:message code="label.cname" />" value="" maxlength="50"/>
		                                	</div>
		                                </div>
	                                </div>
	                           		<div class="row">
	                           		<!--  <div class="col-lg-12">
		                                	<div class="form-group">
		                                	<img  id="imgflage"alt="Trulli" width="30" height="25">
											<select id="codes" class="form-control"></select>	                            				
	                        				</div>
	                        			</div>-->
	                           		<div class="col-lg-12">
		                                	<div class="form-group">
		                                	<div class="img_parent">
		                                	<img  id="imgflage"alt="Trulli">
		                                	</div>
											<select id="codes" class="form-control"></select>	                            				
	                        				</div>
	                        			</div>
	                        			<div class="col-lg-12">
	                        				<div class="form-group">
	                        			 <input type="text" class="form-control"  maxlength=12 id="contactNo2" name="contactNo2" placeholder="<spring:message code="label.mobileNumber" /> (optional)" value="">
	                        			</div>
	                        			</div>
	                           			<!-- <div class="col-lg-12">
		                                	<div class="form-group">
	                            				<input type="text" class="form-control"  maxlength=10 id="contactNo2" name="contactNo2" placeholder="Contact No" value="">
	                        				</div>
	                        			</div> -->
	                        		</div>
	                                
	                                <div class="row">
	                                	<div class="col-lg-12">
		                                	<div class="form-group">
			                                    <input type="text" autocomplete="off" class="form-control" id="email2" name="email2" placeholder="<spring:message code="label.email" />" value="" maxlength="70"/>
			                                </div>
			                        	</div>
			                        </div>
									
	                                <div class="row">
	                                	<div class="col-lg-12">
		                                	<div class="form-group passwordGroup">
		                                	<span toggle="#password-field2" class="fa fa-fw fa-eye field-icon toggle-password2"></span>
	                                    		<input type="password" autocomplete="new-password" class="form-control" id="password-field2" name="password2"  placeholder="<spring:message code="label.password" /> " value="" />
	                                		</div>
	                                	</div>
	                                </div>
	                                <div class="row">
	                                	<div class="col-lg-12">
		                                	<div class="form-group passwordGroup">
		                                	<span toggle="#confirmpassword2" class="fa fa-fw fa-eye field-icon toggle-password2"></span>
	                                    		<input type="password" autocomplete="new-password" class="form-control" id="confirmpassword2" name="confirmpassword2"  placeholder="<spring:message code="label.placeholder.confirmPassword" />    " value="" />
	                                		</div>
	                                	</div>
	                                </div>
	 
	 <!-- -vvvv -->                               
	      <div  class="digit-group" data-group-name="digits" data-autosubmit="false" autocomplete="off">
                        <h4><spring:message code="label.setup_secu_code"/></h4>
                        <div class="form-group has-feedback" style="padding: 10px 0px;margin-bottom:0px;">
							<label><spring:message code="label.secu_code"/></label>
					         <!--  <input id="partitioned"  type="text" maxlength="6" /> -->
					         <div>
					           <!--vvv name="digit-1"name="digit-2"name="digit-3"name="digit-4"name="digit-5" name="digit-6"-->			
								<input type="password" id="digit-1" class="digit-VVV secrete" name="digit-VVV" data-next="digit-2" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric" />
								<input type="password" id="digit-2" class="digit-VVV secrete" name="digit-VVV" data-next="digit-3" maxlength="1" data-previous="digit-1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric" />
								<input type="password" id="digit-3" class="digit-VVV secrete" name="digit-VVV" data-next="digit-4" maxlength="1" data-previous="digit-2" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								
								<input type="password" id="digit-4" class="digit-VVV secrete" name="digit-VVV" data-next="digit-5" maxlength="1" data-previous="digit-3" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-5" class="digit-VVV secrete" name="digit-VVV" data-next="digit-6" maxlength="1" data-previous="digit-4" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-6" class="digit-VVV secrete" name="digit-VVV" data-previous="digit-5" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
							</div>
							<input type="hidden" class="secureCodeVVV" id="secureCodeVVV" />
						</div>
						<div class="form-group" style="padding:0px; margin-bottom:5px;">
								<label id="securityCodeSignUpErr" class="error_otp" style="display:none;"><spring:message code="label.enter_6_digit"/></label>
						</div>	
							
						<div class="form-group" style="padding: 10px 0px;margin-bottom:0px;">
							<label><spring:message code="label.conf_secu_code"/></label>
					         <!--  <input id="partitioned"  type="text" maxlength="6" /> -->
					         <div>
								<input type="password" id="digit-1" class="digit-confirmVVV secrete" name="digit-confirmVVV" data-next="digit-2" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-2" class="digit-confirmVVV secrete" name="digit-confirmVVV" data-next="digit-3" maxlength="1" data-previous="digit-1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-3" class="digit-confirmVVV secrete" name="digit-confirmVVV" data-next="digit-4" maxlength="1" data-previous="digit-2" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								
								<input type="password" id="digit-4" class="digit-confirmVVV secrete" name="digit-confirmVVV" data-next="digit-5" maxlength="1" data-previous="digit-3" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-5" class="digit-confirmVVV secrete" name="digit-confirmVVV" data-next="digit-6" maxlength="1" data-previous="digit-4" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-6" class="digit-confirmVVV secrete" name="digit-confirmVVV" data-previous="digit-5" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
							</div>
							<input type="hidden" class="confirmSecureCodeVVV" id="confirmSecureCodeVVV" />
						</div>
						
							<div class="form-group" style="padding:0px; margin-bottom:5px;">
								<label id="confirmSecurityCodeSignUpErr" class="error_otp" style="display:none;"><spring:message code="label.securecode.error" /></label>
							</div>	
							
						</div>
	      <!-- -vvvv -->                                
	                                
	                                <div class="row">
	                                	<div class="col-lg-12 text-left checkdiv" style="height:50px;">
		                                	<div class="form-group">
		                                		<div class="termLinkOne checkbox-primary">
					                        		<input type="checkbox" id="termsandcondition2" class="termsandcondition2" name="termsandcondition2">
										            
										            <label for="termsandcondition2" class="termLink" style="margin-left:4px !important">
													 &nbsp;<spring:message code="label.acct" /> <a href="<%=appUrl %>/termsandcondition" target="_blank"> <spring:message code="label.tc" /></a>
													</label>
										          </div>  
										          <label for="termsandcondition2" class="error" generated="true" ></label>                   
	                            				
	                            			</div>
	                            			
	                            			
	                            		</div>
	                            	</div>
	                            
	                            	
	                          <!-- FOOTER FREE TRIAL REGISTRATION -->
	                                <div class="text-center bottom-20" style="padding-top: 15px;">
	                                  <button type="button" id="signupbtn2" class="btn btn-primary" onClick="register2();"><spring:message code="label.sfreetrial" /></button>
	                              
	                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
          
        </section>


        
<%-- 			<div class="row">
			<div class="cookies_part fixedClr" style="padding-left:10px; display:none;">
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<p class="cookie_txt">
						<spring:message code="label.cookie_para" /> <a href="#" data-toggle="modal" data-target="#PModal"><spring:message code="label.policy" /></a>.
					</p>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="btnset">
						<a id="accecpt_cookies" class="cookie-btn myBtn"><spring:message code="label.policy_agree" /></a> <a
							data-toggle="modal" data-target="#PModal" class="cookie-btn myBtn"><spring:message code="label.policy_moreinfo" /></a>
					</div>
				</div>
			</div>
	</div>
	
	
			<div class="row">
			<div class="cookies_part_confirmed fixedClr" style="display:none;">
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<p class="cookie_txt"><spring:message code="label.cookie_acceptencess" /></p>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="btnset">
						<a id="hidewindow" class="cookie-btn myBtn"><spring:message code="label.cookie_hide" /></a> <a id="more_info"
							data-toggle="modal" data-target="#PModal" class="cookie-btn myBtn"><spring:message code="label.cookie_more" /></a>
					</div>
				</div>
			</div>
	</div> --%>
        

        <footer class="container-fluid site-footer">

            <div class="row">
                <div class="layout-container">
                    <div>
                        <div class="col-md-12 col-sm-12 top">
                            <div>
                                <span class="footerlinks">
                                <div class="region region-footer">
                                    <section class="footermap footermap--footermap_block col-md-7 col-sm-12 col-xs-12 block block-footermap block-footermap-block clearfix"
                                        id="block-footermap">
                                        <nav class="footermap-col footermap-col--1 footermap-col--sitemap">                                            
                                            <ul class="footermap-header footermap-header--sitemap">
                                                <li
                                                    class="footermap-item footermap-item--depth-1 footermap-item--haschildren">
                                                    <a href="https://www.exelatech.com/"  target="_blank" title="Discover"><spring:message code="label.discover" /></a>
                                                    <ul>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/digital-now"  target="_blank" title="Digital Now"><spring:message code="label.digital" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/smart-office" target="_blank" title="Exela Smart office"><spring:message code="label.soffice" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/innovation-centers" title="" target="_blank" ><spring:message code="label.innovation" /></a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li
                                                    class="footermap-item footermap-item--depth-1 footermap-item--haschildren">
                                                    <a href="https://www.exelatech.com/"  target="_blank" title="RESOURCES"><spring:message code="label.resources" /></a>
                                                    <ul>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/press-releases" target="_blank" title="News"><spring:message code="label.news" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/case-studies"  target="_blank" title="Case Studies"><spring:message code="label.cstudes" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/whitepapers" title="Whitepapers" target="_blank" ><spring:message code="label.wpapper" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/events" title="Events" target="_blank" ><spring:message code="label.event" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/faq" title="FAQ" target="_blank"><spring:message code="label.faq" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/blog" title="Blog" target="_blank" ><spring:message code="label.blg" /></a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li
                                                    class="footermap-item footermap-item--depth-1 footermap-item--haschildren">
                                                    <a href="https://www.exelatech.com/" title="Company" target="_blank" ><spring:message code="label.cmp" /></a>
                                                    <ul>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/about-us" title="About Us" target="_blank"  ><spring:message code="label.abt" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/contact-us" title="contact Us" target="_blank" ><spring:message code="label.contus" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/leadership-team" title="Leadership" target="_blank" ><spring:message code="label.leadership" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://investors.exelatech.com/"
                                                                title="Investors" target="_blank" ><spring:message code="label.investors" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/careers" title="Careers" target="_blank" ><spring:message code="label.crier" /></a>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </nav>
                                    </section>
                                    <section class="simplenews-subscriptions-block-61ace98f-d6b1-4aaa-8590-84bdaec6e04e simplenews-subscriber-form col-md-4 col-sm-12 col-xs-12 block block-simplenews block-simplenews-subscription-block clearfix"
                                        data-drupal-selector="simplenews-subscriptions-block-61ace98f-d6b1-4aaa-8590-84bdaec6e04e"
                                        id="block-simplenewssubscription">
                                        <form >
                                            <div class="form-wrapper"
                                                
                                                id="edit-subscriptions-wrapper">
											<div id="edit-message--2"
                                                class="form-item js-form-item form-type-item js-form-type-item form-item-message js-form-item-message form-no-label form-group">
                                               <spring:message code="label.subs-para" />
                                            </div>
                                            <div class="text-left bottom-20">
                            					<a href="https://www.exelatech.com/pluggedin" target="_blank"><button type="button" class="btn btn-primary subscribeclass"><spring:message code="label.subs-now" /></button></a>
                        					</div>                                            
                        					</div>
                        					<!-- <input autocomplete="off"
                                               
                                                type="hidden" name="form_build_id"
                                                value="form-L5v2clsmeI6xwKE0isO7mcTcYkvG2o8kaZWVArtEQsI" />
                                            <input
                                             
                                                type="hidden" name="form_id"
                                                value="simplenews_subscriptions_block_61ace98f-d6b1-4aaa-8590-84bdaec6e04e" />
                                            <div class="field--type-email field--name-mail field--widget-email-default form-group js-form-wrapper form-wrapper"
                                               >-->
                                                <div class="form-item js-form-item form-type-email js-form-type-email form-item-mail-0-value js-form-item-mail-0-value form-group">
                                                    
                                                   <!--  <input 
                                                        class="form-email required form-control" type="email"
                                                        id="edit-mail-0-value" name="mail[0][value]" value="" size="60"
                                                        maxlength="254" placeholder="Enter your email address..."
                                                        required="required" aria-required="true"
                                                        title=""
                                                        data-toggle="tooltip" / > -->
                                                </div>
                                                <!--  <input class="form-email required form-control subscribeEmail" type="email" id="subscribeEmail" value="" size="60" maxlength="254" placeholder="Enter your email address..." required="required" aria-required="true" title="" data-toggle="tooltip" data-original-title="The subscriber's email address.">
                                                <button class="button js-form-submit form-submit btn-default btn" type="submit" id="edit-subscribe" name="op" value="Subscribe">Subscribe</button>-->
                                            </div>
                                        </form>
                                    </section>
                                </div>
                            </span>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 bottom">
                            <div>
                                <span class="copy-right-block">
                                <div class="region region-footer-second">
                                    <section id="block-copyrightblock"
                                        class="pull-left col-md-4 col-sm-12 col-xs-12 block block-block-content block-block-contentdc2e2dce-7814-4126-8b6d-0e700bd17b9d clearfix">
                                        <div class="field field--name-body field--type-text-with-summary field--label-hidden field--item">
                                            <div class="copyright">
		&copy; <script>document.write(new Date().getFullYear())</script> <spring:message code="label.company"/>  
	</div>
                                        </div>
                                    </section>
                                    <section id="block-socialmediablock-4"
                                        class="pull-right col-md-8 col-sm-12 col-xs-12 block block-block-content block-block-content85f48d65-eb86-406c-a8de-2ed07e5d73ec clearfix">
                                        <div
                                            class="field field--name-body field--type-text-with-summary field--label-hidden field--item">
                                            <div class="footer-text">
                                                <div class="social">
                                                    <div class="social-share">
                                                        <section class="social-share-block">
                                                            <a class="social-share-instagram"
                                                                href="https://www.instagram.com/exelatechnologies/"  target="_blank" title="Instagram"><spring:message code="label.insta"/></a>
                                                            <a class="social-share-twitter"
                                                                href="https://twitter.com/exelatech" target="_blank"
                                                                title="Twitter"><spring:message code="label.Twitter"/></a>
                                                            <a class="social-share-linkedin"
                                                                href="https://www.linkedin.com/company/11174620" target="_blank" title="LinkedIn"><spring:message code="label.linkedIn"/></a>
                                                              <a class="social-share-facebook"
                                                                href="https://www.facebook.com/exelatechnologies" target="_blank" title="FaceBook"><spring:message code="label.fb"/></a>
                                                            <a class="social-share-youtube"
                                                                href="https://www.youtube.com/channel/UCAzeSD5qZ-5gXotIQxkHWDg" target="_blank" title="Youtube"><spring:message code="label.uTube"/></a>
                                                              
                                                        </section>
                                                    </div>
                                                </div>
                                                <div class="footer-links">
                                                    <a href="https://www.exelatech.com/sitemap" target="_blank"><spring:message code="label.sitemap" /></a>
                                                    <a href="https://www.exelatech.com/privacy-policy" target="_blank"><spring:message code="label.policy" /></a>
                                                    <a href="https://www.exelatech.com/terms" target="_blank"><spring:message code="label.tems" /></a>
                                                    <a href="https://www.exelatech.com/security-compliance" target="_blank"><spring:message code="label.security" /></a>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
       
</div>

	
<div class="modal fade" id="PModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog ">
		<!-- Modal content-->
		<div class="modal-content paddforprint">
			<div class="modal-header model-header-background">
				
				<button type="button" class="close no-print" title="close" data-dismiss="modal">X</button>
				<div class="logo_pop">
					<img src="<%=appUrl %>/images/logo_inner.png" width="100">
				</div>
			</div>
			<div class="modal-body print_body model-body-custom" style="max-height: auto">
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
						<p class="sub-cat-txt"><spring:message code="label.scope_2_2" /> (<a href="https://drysign.exelatech.com/"><spring:message code="label.dry_exelatech" /></a>) <spring:message code="label.scope_2_2_continue" /></p></li>
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
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_11_a" /> <a href="http://windows.microsoft.com/en-gb/internet-explorer/delete-manage-cookies#ie=ie-11">http://windows.microsoft.com/en-gb/internet-explorer/delete-manage-cookies#ie=ie-11</a>).</p></li>
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
	

	<!-- Modal -->
	<div class="modal right fade" id="myModal2" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				
                <div class="modeldiv">
				<span></span>                           

				<button type="button" class="close"  onclick="closeRegistrationModal()"  aria-label="Close" data-backdrop="static" data-keyboard="false"><img src="<%=appUrl %>/images/newimages/cancel.png"></button>
					
					<h4 id="myModalLabel"><spring:message code="label.sign4free"/></h4>
					
                </div>
                
                <div class="message text-center" id="register-success" style="display:none;padding: 30px;">
				
	   				<p><img src="<%=appUrl %>/images/message-bg.png"/></p>
	   				<h4><spring:message code="label.a-created"/></h4>
	  				<!--  <p>Congratulations! Your new account has been successfully created.</p> -->
	   				<p><spring:message code="label.receive-email"/></p>
	      			<a href="login" class="btn backbutton btn-link continuelink"><spring:message code="label.conti-drysign"/></a>                   
   				</div>
   
 				<div class="alert alert-danger fade in" style="display:none;text-align:center;margin: 0px;" id="regsiterModelalert">
    				<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>
					<div id="registerdmessage"></div>
				</div>
                

				<div class="modal-body " id="registerFormDiv" >                         
                	<form id="indexregister">  
                        <div class="form-group">
                            
                                <input type="text" class="form-control namevalidation" id="firstName" name="firstName" placeholder="<spring:message code="label.fname"/>" value="" maxlength="30">
                           </div>
                               <div class="form-group">
                                <input type="text" class="form-control namevalidation" id="lastname" name="lastname" placeholder="<spring:message code="label.lname"/>" value="" maxlength="30">
                           
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control"  id="companyName" name="companyName" placeholder="<spring:message code="label.cname"/>" value="" maxlength="50">
                        </div>
                         <div class="">
                         <div class="row">
                         <div class="col-lg-12 ">
		                                	<div class="form-group">
		                                	<div class="img_parent">
		                                	<img  id="imgflage1"alt="Trulli">
		                                	</div>
											<select id="codes1" class="form-control"></select>
	                            				
	                        				</div>
	                        			</div>
	                        			<div class="col-lg-12">
	                        				<div class="form-group">
	                        			 <input type="text" class="form-control"  maxlength=12 id="contactNo" name="contactNo" placeholder="<spring:message code="label.mobileNumber"/> (optional)" value="">
	                        			</div>
	                        			</div>
	                        			</div>
	                        			</div>
	                        			
                        <!-- <div class="form-group">
                            <input type="text" class="form-control"  maxlength=10 id="contactNo" name="contactNo" placeholder="Contact No" value="">
                        </div> -->
                        
                        	<div class="form-group" >
                        	<input type="text" autocomplete="off"class="form-control" id="email" name="email"  placeholder="<spring:message code="label.email"/>" maxlength="70"/>
                        	</div>
                       
                        <div class="form-group passwordGroup">
                        <span toggle="#password-field1" class="fa fa-fw fa-eye field-icon toggle-password" id="toggle_password_eye"></span>
                            <input type="password" autocomplete="new-password" class="form-control" placeholder="<spring:message code="label.password"/> " id="password-field1" name="password" value="">
                        </div>
                        <div class="form-group passwordGroup">
                        <span toggle="#confirmpassword1" class="fa fa-fw fa-eye field-icon toggle-password" id="toggle_password_eye1"></span>
                            <input type="password" autocomplete="new-password" class="form-control" id="confirmpassword1" name="confirmpassword1" placeholder="<spring:message code="label.placeholder.confirmPassword"/>    " value="">
                        </div>
                        
                        <div  class="digit-group" data-group-name="digits" data-autosubmit="false" autocomplete="off">
                        <div class="modeldiv_op">
                        <h4 id="setupSecureCode"><spring:message code="label.setup_secu_code"/></h4>
                        </div>
                        <div class="form-group has-feedback" style="padding: 10px 0px;margin-bottom:0px;">
							<label><spring:message code="label.secu_code"/></label>
					         <!--  <input id="partitioned"  type="text" maxlength="6" /> -->
					         <div>
					           <!--vvv name="digit-1"name="digit-2"name="digit-3"name="digit-4"name="digit-5" name="digit-6"-->			
								<input type="password" id="digit-1" class="digit-VVV1 secrete" name="digit-VVV" data-next="digit-2" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-2" class="digit-VVV1 secrete" name="digit-VVV" data-next="digit-3" maxlength="1" data-previous="digit-1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-3" class="digit-VVV1 secrete" name="digit-VVV" data-next="digit-4" maxlength="1" data-previous="digit-2" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								
								<input type="password" id="digit-4" class="digit-VVV1 secrete" name="digit-VVV" data-next="digit-5" maxlength="1" data-previous="digit-3" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-5" class="digit-VVV1 secrete" name="digit-VVV" data-next="digit-6" maxlength="1" data-previous="digit-4" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-6" class="digit-VVV1 secrete" name="digit-VVV" data-previous="digit-5" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
							</div>
							<input type="hidden" class="secureCodeVVV" id="secureCodeVVV1" />
						</div>
						<div class="form-group" style="padding:0px; margin-bottom:5px;">
							<label id="securityCodeSignUpErr1" class="error_otp" style="display:none;"><spring:message code="label.enter_6_digit"/></label>
						</div>	
							
						<div class="form-group" style="padding: 10px 0px;margin-bottom:0px;">
							<label><spring:message code="label.conf_secu_code"/></label>
					         <!--  <input id="partitioned"  type="text" maxlength="6" /> -->
					         <div>
								<input type="password" id="digit-1" class="digit-confirmVVV1 secrete" name="digit-confirmVVV" data-next="digit-2" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-2" class="digit-confirmVVV1 secrete" name="digit-confirmVVV" data-next="digit-3" maxlength="1" data-previous="digit-1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-3" class="digit-confirmVVV1 secrete" name="digit-confirmVVV" data-next="digit-4" maxlength="1" data-previous="digit-2" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								
								<input type="password" id="digit-4" class="digit-confirmVVV1 secrete" name="digit-confirmVVV" data-next="digit-5" maxlength="1" data-previous="digit-3" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-5" class="digit-confirmVVV1 secrete" name="digit-confirmVVV" data-next="digit-6" maxlength="1" data-previous="digit-4" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-6" class="digit-confirmVVV1 secrete" name="digit-confirmVVV" data-previous="digit-5" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
							</div>
							<input type="hidden" class="confirmSecureCodeVVV" id="confirmSecureCodeVVV1" />
						</div>
						
						<div class="form-group" style="padding:0px; margin-bottom:5px;">
							<label id="confirmSecurityCodeSignUpErr1" class="error_otp" style="display:none;"><spring:message code="label.securecode.error" /></label>
						</div>	
							
						</div>
                        <div class="text-left bottom-20">
                        	<div class="termLinkTwo checkbox-primary">
                        		<input type="checkbox" id="termsandcondition" class="termsandcondition" name="termsandcondition">
					            
					            <label for="termsandcondition" class="termLink">
								 <spring:message code="label.acct"/> <a href="<%=appUrl %>/termsandcondition" target="_blank"> <spring:message code="label.tc"/></a>
								</label>
					          </div>
                           	
							<label style="float: none;" for="termsandcondition" class="error" generated="true"></label>
                        </div>
                        <div class="text-left bottom-20">
                            <button type="button" id="signupbtn" onClick="register();"	 class="btn btn-primary"><spring:message code="label.sfreetrial"/></button>
                        </div>
                    
               </form>
				</div>

			</div><!-- modal-content -->
		</div><!-- modal-dialog -->
	</div><!-- modal -->
	
	<!-- Modal -->
	
	



 <!-- Plugin JavaScript -->   
	<script src="<%=appUrl %>/js/js_landing/jquery-1.11.3.min.js"></script>    
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
    <script src="<%=appUrl %>/js/js_landing/bootstrap.js"></script>
    <script src="<%=appUrl %>/js/jquery.validate.js"></script>
    <script src="<%=appUrl %>/js/popper.min.js"></script>
  <script src="<%=appUrl %>/js/jquery.buttonLoader.js"></script>
<script src="<%=appUrl %>/js/contact/countryCodes.js"></script>
  	
  	<!-- Below js for cookies show and hide properly -->
  	<script src="<%=appUrl %>/js/nagging-menu.js"></script>
 
<script>

//vvv set securecode in a hidden field  - Register()
 $(document).on("change", ".digit-VVV1", function() {
	    var code="";
	    $(".digit-VVV1").each(function(){		     
	        code+=$(this).val();
	    });		   		    
	    $("#secureCodeVVV1").val(code);
	    
});

 $(document).on("change", ".digit-confirmVVV1", function() {
	    var codeStr="";
	    $(".digit-confirmVVV1").each(function(){		     
	    	codeStr+=$(this).val();
	    });		   		    
	    $("#confirmSecureCodeVVV1").val(codeStr);
	   	    
});
 
//vvv set securecode in a hidden field  - Register2()
 $(document).on("change", ".digit-VVV", function() {
	    var code="";
	    $(".digit-VVV").each(function(){		     
	        code+=$(this).val();
	    });		   		    
	    $("#secureCodeVVV").val(code);
	    
});

 $(document).on("change", ".digit-confirmVVV", function() {
	    var codeStr="";
	    $(".digit-confirmVVV").each(function(){		     
	    	codeStr+=$(this).val();
	    });		   		    
	    $("#confirmSecureCodeVVV").val(codeStr);
	   	    
});
 //Accept UTF 8 character only firstname lastname validation
 
 $(function(){

	   $( ".namevalidation" ).bind( 'paste',function()
	   {
		   var regex = new RegExp("[^\\w-_. ]");
	      	 var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	      		    if (regex.test(key)) {
	      		       event.preventDefault();
	      		       return false;
	      		    }

	    });
	}); 
 
 $('.namevalidation').on('keypress', function (e) {
	 var keynum
	    var keychar
	    var numcheck
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
 
	/*$('#lastname2').on('keypress', function (event) {
		var regex = new RegExp("[^\\w-_. ]");
     	 var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
     		    if (regex.test(key)) {
     		       event.preventDefault();
     		       return false;
	    }
	});
	$('#firstName').on('keypress', function (event) {
		var regex = new RegExp("[^\\w-_. ]");
     	 var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
     		    if (regex.test(key)) {
     		       event.preventDefault();
     		       return false;
	    }
	});
	$('#lastname').on('keypress', function (event) {
		var regex = new RegExp("[^\\w-_. ]");
     	 var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
     		    if (regex.test(key)) {
     		       event.preventDefault();
     		       return false;
	    }
	}); */
/////////////////////////////////////////////////////// 
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
function myclickFunction() {
	
	$('.navbar-toggle span').toggleClass("closemenu mainmenu");
	}
    $(document).ready(function(){ 
    
    	 $('input').keyup(function(){
 	        if($(this).val().length==$(this).attr("maxlength")){
 	            $(this).next().focus();
 	        }
 	    });
     	/* $("#partitioned").focus(function(){
    		setTimeout(function(){
    			$("#partitioned").css("letter-spacing","2.7em")
    		},3000);
    	
    	})  */
    	$('a.nav-link').click(function(){
    		
    		$('a.nav-link').parent().parent().parent().removeClass('in');
    	});
        $('.navbar-toggle').click(function() {
           // $('span').toggle('1000');
            $('span', this).toggleClass("closemenu mainmenu");
});
   
       

    $('body').scrollspy({target: ".navbar", offset: 50});

// Add smooth scrolling on all links inside the navbar
/*$(".navbar-nav li a. .scrollbotom").on('click', function(event) {
//alert("hi");
  // Make sure this.hash has a value before overriding default behavior
  if (this.hash !== "") {

    // Prevent default anchor click behavior
    event.preventDefault();

    // Store hash
    var hash = this.hash;

    // Using jQuery's animate() method to add smooth page scroll
    // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
    $('html, body').animate({
      scrollTop: $(hash).offset().top
    }, 800, function(){

    // Add hash (#) to URL when done scrolling (default click behavior)
      window.location.hash = hash;
    });

  } // End if

});*/


//vvv
$.validator.addMethod("pwcheck", function(value, element) {
    return this.optional(element) || /^[a-zA-Z0-9!@#$%^*_&\-]+$/i.test(value)  
    				&& /[a-z]/.test(value) // has a lowercase letter
			       && /[A-Z]/.test(value) // has a lowercase letter
			       && /\d/.test(value) // has a digit;
			       && /[!@#$%^*_&\-]/.test(value); // has a lowercase letter
}, "Password should contain at least 1 - lowercase, uppercase alphabet, number, special character from @#$%^*_&-");

$.validator.addMethod("emailcheck", function(value, element) {
    var re = /^(([^<>(){}[\]\\.,;:\s@\"]+(\.[^<>(){}[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return this.optional(element) || re.test(value);      
}, "<spring:message code="label.validEmail_msgrequired"/>");
	
$.validator.addMethod('customphone', function (value, element) {
	 var valu2=value;
	  valu2 = valu2.replace(/-/g, "");
	return this.optional(element) || /^\d{3}\d{3}\d{4}$/.test(valu2);
}, "<spring:message code="label.validnumber"/>");


$.validator.addClassRules('customphone', {
    customphone: true,
    required:true
});

jQuery.validator.addMethod("lettersonly", function(value, element) {
	//return this.optional(element) || /^[a-zA-Z ]+(([,._ /-][a-zA-Z 0-9])?[a-zA-Z0-9 ]*)*$/i.test(value);
	//}, "<spring:message code="label.allowedchar"/>"); 
	return this.optional(element) || /^[a-zA-Z]+$/i.test(value);
	}, 	"<spring:message code="label.allowedCharOnly"/>");  

jQuery.validator.addMethod("checkempty", function(value) {
	return $.trim( value );
	}, "<spring:message code="label.emptyfld"/>"); 
    });
    
    /* country code started */
    console.dir(countryCodes);
    var i,options='';
    var cont = "US";
   // var requestUrl = "http://ip-api.com/json";//not secure will not work on production
   /*  var requestUrl = "https://ipapi.co/country/";

         $.ajax({
           url: requestUrl,
           type: 'GET',
           async: false,
           success: function(json)
           {
    		//cont = json.countryCode;
    		cont = json;
             console.log("My country is: " + json);
    	 console.log("cont is: " + cont);
           },
           error: function(err)
           {
             console.log("Request failed, error= " + err);
           }
         }); */
         
    for(i=0;i<countryCodes.length;i++){
    		if(countryCodes[i].alpha2Code==cont){
    			options += '<option selected value="'+countryCodes[i].callingCodes[0]+" "+countryCodes[i].alpha2Code+'">'+countryCodes[i].name +'&nbsp;(+'+countryCodes[i].callingCodes[0] +')</option>';
    			document.getElementById("imgflage").src = countryCodes[i].flag;
    			document.getElementById("imgflage1").src = countryCodes[i].flag;
    		}
    		else{
    			options += '<option value="'+countryCodes[i].callingCodes[0]+" "+countryCodes[i].alpha2Code+'">'+countryCodes[i].name +'&nbsp;(+'+countryCodes[i].callingCodes[0] +')</option>';
    	}
    }
    	document.getElementById('codes').innerHTML = options;
    	document.getElementById('codes1').innerHTML = options;

    	  	
    	

    $(document).ready(function()
    {
      
   	 $('#contactNo,#contactNo2').keydown(function (e) {
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
      
      $("#codes1").change(function()
    	      {
    	    	var a = $("#codes1 option:selected").val();
    	    	var counntryName = a.split(" ");
    	    	var val = counntryName[1];
    	    	for(i=0;i<countryCodes.length;i++){
    	    		if(countryCodes[i].alpha2Code==val){
    	    			
    	    			document.getElementById("imgflage1").src = countryCodes[i].flag;
    	    			return;
    	    		}
    	    		}
    	       });
    });
    
    /* country code ended */

var indexregisterform = $("#indexregister").validate({
	//specify the validation rules
	rules : {
		email : {
			required : true,
			email : true,
			emailcheck:true
		//email is required AND must be in the form of a valid email address
		},
		firstName : {
			required : true,
			//lettersonly: true,
			checkempty : true
		},
		lastname : {
			required : true,
			//lettersonly: true,
			checkempty : true
		},
		password : {
			required : true,
			minlength : 8,
			maxlength:15,
			pwcheck: true		//vvv exelaAUth password rule
		},
		confirmpassword1 : {
			//required : true,
			//minlength : 8,
			equalTo: "#password-field1"
		}, 
		companyName : {
			required : true,
			checkempty : true
			
		},
		contactNo : {
			//vvv	required : true,	//not mandatory for exelaAuth
			customphone:true,
			minlength: 10			
		},
		termsandcondition: {
			required : true
		}

	},
	messages: {
        confirmpassword1: "<spring:message code="label.pwd_not_match"/>"
    }
	//specify validation error messages

	

/* 	messages : {
		email : {
			required : "Email address field cannot be blank",
			email : "Please enter a valid email address"
		},
		firstName : {
			required : "First name field cannot be blank",

		},
		lastname : {
			required : "Last name field cannot be blank",

		},
		companyName : {
			required : "Please enter company name",
			
		},
		contactNo : {
			required : "Please enter contact no",
			minlength: "Contact no should be 10 digit"
			
		},
		password : {
			required : "Password field cannot be blank",
			minlength: "Your password must be at least 8 characters long"

		},
		termsandcondition: {
			required : "Please accept terms and conditions"
		}
	} */
});

 function closeRegistrationModal(){
	 $("#register-success").hide();
		$("#regsiterModelalert").hide();
		$("#myModalLabel").html('<spring:message code="label.sign4free"/>');
		 $('.modal').modal('hide');
		 $("#registerFormDiv").show();
		 $("#bnifit").removeClass("active");
		 $("#registerFormDiv .form-control").removeClass("error");
		 
		 resetForm();
		 
		///Set mfa error codes to empty and hidden text data to empty
		$("#secureCodeVVV1").val('');
		$("#confirmSecureCodeVVV1").val('');
		$("#securityCodeSignUpErr1").css("display", "none");
		$("#confirmSecurityCodeSignUpErr1").css("display", "none");
		$("#confirmpassword1").val('');
		$('#codes1').empty();
	    var newOption = $('<option value="1 US">United States of America (+1)</option>');
	    $('#codes1').append(newOption);
	    document.getElementById("imgflage1").src = countryCodes[1].flag;
		
 }
 $("#trysignclick").click(function(){
	  $('.navbar-toggle span').toggleClass("closemenu mainmenu");
	/******sarika*******/  
	  console.dir(countryCodes);
	    var i,options='';
	    var cont = "US";
	    for(i=0;i<countryCodes.length;i++){
	    		if(countryCodes[i].alpha2Code==cont){
	    			options += '<option selected value="'+countryCodes[i].callingCodes[0]+" "+countryCodes[i].alpha2Code+'">'+countryCodes[i].name +'&nbsp;(+'+countryCodes[i].callingCodes[0] +')</option>';
	    			document.getElementById("imgflage1").src = countryCodes[i].flag;
	    		}
	    		else{
	    			options += '<option value="'+countryCodes[i].callingCodes[0]+" "+countryCodes[i].alpha2Code+'">'+countryCodes[i].name +'&nbsp;(+'+countryCodes[i].callingCodes[0] +')</option>';
	    	}
	    }
	    	document.getElementById('codes1').innerHTML = options;


});
 
 function openSignUp(){
	 console.dir(countryCodes);
	    var i,options='';
	    var cont = "US";
	    for(i=0;i<countryCodes.length;i++){
	    		if(countryCodes[i].alpha2Code==cont){
	    			options += '<option selected value="'+countryCodes[i].callingCodes[0]+" "+countryCodes[i].alpha2Code+'">'+countryCodes[i].name +'&nbsp;(+'+countryCodes[i].callingCodes[0] +')</option>';
	    			document.getElementById("imgflage1").src = countryCodes[i].flag;
	    		}
	    		else{
	    			options += '<option value="'+countryCodes[i].callingCodes[0]+" "+countryCodes[i].alpha2Code+'">'+countryCodes[i].name +'&nbsp;(+'+countryCodes[i].callingCodes[0] +')</option>';
	    	}
	    }
	    	document.getElementById('codes1').innerHTML = options;
	 //$('.navbar-toggle span').toggleClass("closemenu mainmenu");
	 //alert("in signup");
	 $("#myModal2").modal('toggle');
	 $("#termsandcondition").prop("checked", false);
	 indexregisterform.resetForm();
 	
	 $('.digit-group').find('input:text').val(''); //vvv reset mfa section
	   
	 //$('.navbar-toggle span').toggleClass("closemenu mainmenu");
	 
	///Set mfa error codes to empty and hidden text data to empty
	$("#secureCodeVVV1").val('');
	$("#confirmSecureCodeVVV1").val('');
	$("#securityCodeSignUpErr1").css("display", "none");
	$("#confirmSecurityCodeSignUpErr1").css("display", "none");
	$("#confirmpassword1").val('');
		
 }
 
 
 
 var indexregisterform2 = $("#indexregister2").validate({
		//specify the validation rules
		rules : {
			email2 : {
				required : true,
				email : true,
				emailcheck:true
			//email is required AND must be in the form of a valid email address
			},
			firstName2 : {
				required : true,
				//lettersonly: true,
				checkempty : true
			},
			lastname2 : {
				required : true,
				//lettersonly: true,
				checkempty : true
			},
			password2 : {
				required : true,
				minlength : 8,
				maxlength:15,
				pwcheck: true		//vvv exelaAUth password rule
			},
			confirmpassword2 : {
			//	required : true,
				//minlength : 8,
				equalTo: "#password-field2"
			},
			companyName2 : {
				required : true,
				checkempty : true
				
			},
			contactNo2 : {
				//vvv	required : true,	//not mandatory for exelaAuth
				customphone:true,
				minlength: 10
				
			},
			termsandcondition2: {
				required : true
			}

		},
		messages: {
            confirmpassword2: "<spring:message code="label.pwd_not_match"/>"
        }
		//specify validation error messages

		

	/* 	messages : {
			email2 : {
				required : "Please enter a valid email address",
				email : "Please enter a valid email address"
			},
			firstName2 : {
				required : "First name field cannot be blank",

			},
			lastname2 : {
				required : "Last name field cannot be blank",

			},
			companyName2 : {
				required : "Please enter company name",
				
			},
			contactNo2 : {
				required : "Please enter contact no",
				minlength: "Contact no should be 10 digit"
				
			},
			password2 : {
				required : "Password field cannot be blank",
				minlength: "Your password must be at least 8 characters long"

			},
			termsandcondition2: {
				required : "Please accept terms and conditions"
			}
		} */
	});
 

//vvv validate Security Codefor sign up -Register()
	function validateSecurityCode1(securityCode, confirmSecurityCode){
	//	alert("securityCode, confirmSecurityCode-"+securityCode+"   & "+confirmSecurityCode);
		
		var isNum_securityCode = /^\d+$/.test(securityCode);
	///	alert("securityCode:"+securityCode+"=>isnum1: "+isNum_securityCode+"  ---confirmSecurityCode "+confirmSecurityCode);
		
		if(securityCode =="" && confirmSecurityCode==""){
			$("#securityCodeSignUpErr1").css("display", "none");
			$("#confirmSecurityCodeSignUpErr1").css("display", "none");
			return true;
		}
		else if(!isNum_securityCode){
			$("#securityCodeSignUpErr1").css("display", "block");
			$("#confirmSecurityCodeSignUpErr1").css("display", "none");
			return false;
		}
		else if(securityCode =="undefined" || securityCode.length < 6){	
		//	alert("===1");
			$("#securityCodeSignUpErr1").css("display", "block");
			$("#confirmSecurityCodeSignUpErr1").css("display", "none");
			return false;
		}
		else if(confirmSecurityCode =="undefined" || confirmSecurityCode.length < 6 || securityCode != confirmSecurityCode){	
		//	alert("===2");
			$("#securityCodeSignUpErr1").css("display", "none");	
			$("#confirmSecurityCodeSignUpErr1").css("display", "block");		
			return false;
		} 
		else{
		//	alert("===3");
			$("#securityCodeSignUpErr1").css("display", "none");
			$("#confirmSecurityCodeSignUpErr1").css("display", "none");
			return true;
		}	
	}
//vvv validate Security Codefor sign up -Register2()
	function validateSecurityCode(securityCode, confirmSecurityCode){
	//	alert("securityCode, confirmSecurityCode-"+securityCode+"   & "+confirmSecurityCode);
		
		var isNum_securityCode = /^\d+$/.test(securityCode);
	///	alert("securityCode:"+securityCode+"=>isnum1: "+isNum_securityCode+"  ---confirmSecurityCode "+confirmSecurityCode);
		
		if(securityCode =="" && confirmSecurityCode==""){
			$("#securityCodeSignUpErr").css("display", "none");
			$("#confirmSecurityCodeSignUpErr").css("display", "none");
			return true;
		}
		else if(!isNum_securityCode){
			$("#securityCodeSignUpErr").css("display", "block");
			$("#confirmSecurityCodeSignUpErr").css("display", "none");
			return false;
		}
		else if(securityCode =="undefined" || securityCode.length < 6){	
		//	alert("===1");
			$("#securityCodeSignUpErr").css("display", "block");
			$("#confirmSecurityCodeSignUpErr").css("display", "none");
			return false;
		}
		else if(confirmSecurityCode =="undefined" || confirmSecurityCode.length < 6 || securityCode != confirmSecurityCode){	
		//	alert("===2");
			$("#securityCodeSignUpErr").css("display", "none");	
			$("#confirmSecurityCodeSignUpErr").css("display", "block");		
			return false;
		} 
		else{
		//	alert("===3");
			$("#securityCodeSignUpErr").css("display", "none");
			$("#confirmSecurityCodeSignUpErr").css("display", "none");
			return true;
		}	
	}

function register(){ 
	var con = $("#codes1 option:selected").val().split(" ");
	//alert(con[0]);
	var countryCodeVar=con[1].trim();		//get countrycode[].alpha2Code
	
	var phValue=$("#contactNo").val();
	phValue=phValue.replace(/-/g, "");
	//vvv	var contct ="+"+con[0]+"-"+phValue;

	var contct ="";		//phone number can be non mandatory. if empty, send ""
	if(phValue !=""){		
			contct ="+"+con[0]+"-"+phValue;
			//alert("phvalue not empty:"+phValue+"===contct:"+contct);
	}
	else{
		contct ="";
		//alert("ph value empty:"+phValue+"===contct:"+contct);
	}
	
	//alert(contct);
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var contextPath=$("#contextPath").val();
	
	var valid = $("#indexregister").valid();
	
	//vvv validate security code 
	var validSecureCode = validateSecurityCode1($("#secureCodeVVV1").val(),$("#confirmSecureCodeVVV1").val());
			

//	if(valid == true){
	if(valid == true && validSecureCode == true){	
	
		var data = {
	    	      "firstName" : $("#firstName").val().trim(),
	    	      "lastname" :$("#lastname").val().trim(),
	    	      "email" :$("#email").val(),
	    	      "password" :$("#password-field1").val(),
	    	      "companyName":$("#companyName").val(),
	    	      "phone":contct,
	    	      "mfaSecureCode" : $("#secureCodeVVV1").val(),			//vvvMFA
	    	      "countryCode":countryCodeVar
	    	     // "confirmpassword" :$("#password-field2").val()	    	     
	    }
		data.tempRegistration="false";
	
		///alert("111: "+JSON.stringify(data));
		
		$.ajax({
			contentType : 'application/json; charset=utf-8',
			type : "POST",
			url : "registration",
			dataType : 'json',
			crossDomain: true,
			data : JSON.stringify(data),
			beforeSend : function(xhr) {
				$('#signupbtn').buttonLoader('start');
				xhr.setRequestHeader(header, token);
			},
			complete : function() {
				$("#signupbtn").buttonLoader('stop');
			},
			success : function(response) {
				if(response.msg == 1 || response.msg == "1"){
					$("#registerdmessage").val('');
					$("#registerFormDiv").hide();
					//$(".get_info").hide();
					$("#myModalLabel").html('');
					$("#register-success").show();
					$("#regsiterModelalert").hide();
			
				}else{
					
				$("#regsiterModelalert").show();
					$("#registerdmessage").html(<c:out value='response.msg'></c:out>);
				}
			},
			error: function(xhr, textStatus, errorThrown)
			 {
			 	alert('<spring:message code="label.something_went_wrong"/> ');
			 	return false;
			}
		});		
	}
 }


function register2(){
	var con = $("#codes option:selected").val().split(" ");
	//alert(con[0]);
	var countryCodeVar=con[1].trim();		//get countrycode[].alpha2Code
	
	var phValue=$("#contactNo2").val();
	phValue=phValue.replace(/-/g, "");
	//vvv 	var contct ="+"+con[0]+"-"+phValue;
	var contct ="";		//phone number can be non mandatory. if empty, send ""
	if(phValue !=""){		
			contct ="+"+con[0]+"-"+phValue;
			//alert("phvalue not empty:"+phValue+"===contct:"+contct);
	}
	else{
		contct ="";
		//alert("ph value empty:"+phValue+"===contct:"+contct);
	}
	

	//alert(contct);
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var contextPath=$("#contextPath").val();
	
	var valid = $("#indexregister2").valid();
	
	//vvv validate security code 
	var validSecureCode = validateSecurityCode($("#secureCodeVVV").val(),$("#confirmSecureCodeVVV").val());

//	if(valid == true){
	if(valid == true && validSecureCode == true){	

		var data = {
	    	      "firstName" : $("#firstName2").val().trim(),
	    	      "lastname" :$("#lastname2").val().trim(),
	    	      "email" :$("#email2").val(),
	    	      "password" :$("#password-field2").val(),
	    	      "companyName":$("#companyName2").val(),
	    	      "phone":contct,
	    	      "mfaSecureCode" : $("#secureCodeVVV").val(),			//vvvMFA
	    	      "countryCode":countryCodeVar
	    	     // "confirmpassword" :$("#password-field2").val()	    	     
	    }
		
		data.tempRegistration="false";
		
		///alert("footer:"+JSON.stringify(data));
		$.ajax({
			contentType : 'application/json; charset=utf-8',
			type : "POST",
			url : "registration",
			dataType : 'json',
			crossDomain: true,
			data : JSON.stringify(data),
			beforeSend : function(xhr) {
				$('#signupbtn2').buttonLoader('start');
				xhr.setRequestHeader(header, token);
			},
			complete : function() {
				$("#signupbtn2").buttonLoader('stop');
			},
			success : function(response) {
				if(response.msg == 1 || response.msg == "1"){
					$("#registerdmessage2").val('');
				    $("#registerFormDiv2").hide();
					//$(".get_info").hide();
					//s$("#myModalLabel").html('');
					$("#register-success2").show();
					$("#regsiterModelalert2").hide();
			
				}else{
					
				$("#regsiterModelalert2").show();
					$("#registerdmessage2").html(<c:out value="response.msg"></c:out>);
				}
			},
			error: function(xhr, textStatus, errorThrown)
			 {
			 	alert('<spring:message code="label.something_went_wrong"/>');
			 	return false;
			}
		});		
	}
 }
 
 
function  sucessmsgClose(){
	   $("#registerFormDiv2").show();
		$("#register-success2").hide();
		 indexregisterform2.resetForm();
}



function resetForm(){
	
    $("#firstName").val(''),
    $("#lastname").val(''),
    $("#email").val(''),
    $("#password-field1").val(''),
    $("#companyName").val(''),
    $("#contactNo").val(''),
    $(".secrete ").val('');
    $("#toggle_password_eye").removeClass("fa-eye-slash").addClass("fa-eye");
    $("#toggle_password_eye1").removeClass("fa-eye-slash").addClass("fa-eye");
    

}

//campaign cookie variables --------------------//
/* var storedSource="";
var storedGclid="";
var storedUtmSource="";
var storedFbclid="", storedFbsource="";
var storedSourceExpiry="";
//---------------------------------------------//
function setCookie(cname, cvalue, exdays) {
   var d = new Date();
 
   var creationDateMillSec = d.getTime();//for appending cookie creation date for google analytics
  
   d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
 
   // var expires = "expires=" + d.toGMTString();
   var expires = "expires=" + d.toUTCString();
   
    if(cname=="drysigncookies"){
    	document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
	}
  

    var cvalWithTime=cvalue+"-TS"+creationDateMillSec;	//setting value with creation time for google analytics cookie
	 
   	if(cname=="GA_source" && (cvalue != null ||cvalue != "null" || cvalue != "")){	
		document.cookie = cname + "=" + cvalWithTime + ";" + expires + ";path=/";   
	// store cookie expiration date for key in local/session storage
		//localStorage.setItem("GA_source_ExpiryDate", creationDate.toUTCString());   
	   	//document.cookie = "GA_source_ExpiryDate=" + creationDateMillSec+ ";" + expires + ";path=/";	   
	}
   	if(cname=="GA_gclid" && (cvalue != null ||cvalue != "null" || cvalue != "")){
	   	document.cookie = cname + "=" + cvalWithTime + ";" + expires + ";path=/";
	}
   	if(cname=="utm_source" && (cvalue != null ||cvalue != "null" || cvalue != "")){
		document.cookie = cname + "=" + cvalWithTime + ";" + expires + ";path=/";
	}
   	if(cname=="fbclid" && (cvalue != null ||cvalue != "null" || cvalue != "")){
	   document.cookie = cname + "=" + cvalWithTime + ";" + expires + ";path=/";
   	}
   	if(cname=="fbsource" && (cvalue != null ||cvalue != "null" || cvalue != "")){
	   document.cookie = cname + "=" + cvalWithTime + ";" + expires + ";path=/";
   	}

} */

/* function getCookie(cname) {
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
} */
/* var alreadystored = false;
$(window).on("load", function () {  checkCookie() });
function checkCookie() {
    var user = getCookie("drysigncookies");
   
    if (user != "stored") {
        alreadystored = false;
       $(".cookies_part_confirmed").css("display","none"); 
       $(".cookies_part").css("display", "block");
    }
    else{
       
        $(".cookies_part_confirmed").css("display","none"); 
        $(".cookies_part").css("display", "none");
    }
} */

$(document).ready(function () {
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
    
    //benifit tab highlight when user move one page to home page via benifit
    var parts = window.location.href;
    	var a = parts.split("#");
    	if('section1'==a[1]){
    		$("#bnifit").addClass("active");
    	}
  //=================================================================	

//========7AUG FETCH SOURCE AND GCLID FROM URL FOR GOOGLE ANALYTICS TRACKING	
 	//GOOGLE ANALYTICS SOURCE/GCLID
<%-- 	var GA_source="<%=request.getParameter("source")%>";
	var GA_gclid="<%=request.getParameter("gclid")%>";
	var utm_source="<%=request.getParameter("utm_source")%>";
	var fbclid="<%=request.getParameter("fbclid")%>";
	var fbsource="<%=request.getParameter("fbsource")%>"; --%>
	

/* 	 storedSource = getCookie("GA_source");
	 storedGclid = getCookie("GA_gclid");
	 storedUtmSource= getCookie("utm_source");
	 storedFbclid= getCookie("fbclid");
	 storedFbsource= getCookie("fbsource");
	 
	//get last occurrence of -TS and fetch string before it which contains actual value
	 var storedSourceVal= storedSource.substring(0, storedSource.lastIndexOf('-TS'));
	 var storedGclidVal=storedGclid.substring(0, storedGclid.lastIndexOf('-TS'));
	 var storedUtmSourceVal=storedUtmSource.substring(0, storedUtmSource.lastIndexOf('-TS'));
	 var storedFbclidVal=storedFbclid.substring(0, storedFbclid.lastIndexOf('-TS'));
	 var storedFbsourceVal=storedFbsource.substring(0, storedFbsource.lastIndexOf('-TS'));
	
	 //=========================================================================================//
	if(GA_source != "" && GA_source != null && GA_source != "null"){
		setCookie("GA_source",GA_source,90);	
	}else if(GA_source == "" || GA_source == null || GA_source == "null"){
		if(storedSource =="" || storedSourceVal[0] =="NO-VALUE"){		//if(storedSource =="" || storedSource =="NO-VALUE"){
			setCookie("GA_source","NO-VALUE",90);
		}
	}
	
	if(GA_gclid != "" && GA_gclid != null && GA_gclid != "null"){
		setCookie("GA_gclid",GA_gclid,90);	
	}else if(GA_gclid == "" || GA_gclid == null || GA_gclid == "null"){
		if(storedGclid =="" || storedGclidVal[0] =="NO-VALUE"){
			setCookie("GA_gclid","NO-VALUE",90);
		}
	}

 	//========7AUG FETCH SOURCE AND GCLID FROM URL FOR GOOGLE ANALYTICS TRACKING
 	
 	//-----18AUG FETCH UTM_SOURCE FROM URL FOR GOOGLE ANALYTICS TRACKING ------//
	if(utm_source != "" && utm_source != null && utm_source != "null"){
		setCookie("utm_source",utm_source,90);	
	}else if(utm_source == "" || utm_source == null || utm_source == "null"){
		if(storedUtmSource =="" || storedUtmSourceVal[0] =="NO-VALUE"){
			setCookie("utm_source","NO-VALUE",90);
		}
		
	}
 	//--------------------------------------------------//
 	
 	//========18AUG FETCH FBSOURCE AND FBCLID FROM URL FOR GOOGLE ANALYTICS TRACKING	

	if(fbsource != "" && fbsource != null && fbsource != "null"){
		setCookie("fbsource",fbsource,90);	
	}else if(fbsource == "" || fbsource == null || fbsource == "null"){
		if(storedFbsource =="" || storedFbsourceVal[0] =="NO-VALUE"){
			setCookie("fbsource","NO-VALUE",90);
		}
		
	}
	
	if(fbclid != "" && fbclid != null && fbclid != "null"){
		setCookie("fbclid",fbclid,90);	
	}else if(fbclid == "" || fbclid == null || fbclid == "null"){
		if(storedFbclid =="" || storedFbclidVal[0] =="NO-VALUE"){
			setCookie("fbclid","NO-VALUE",90);
		}
		
	}
 */
 	//========18AUG FETCH SOURCE AND GCLID FROM URL FOR GOOGLE ANALYTICS TRACKING
 	
//=================================================================	

  
});
                     
$(".toggle-password").click(function() {

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
//benifit highlight when user click on benifit

$("#section_benefit").click(function() {
	$("#bnifit").addClass("active");	
});
$("#faqsection").click(function() {
	$("#pricingsction").removeClass("active");
	$("#faqsection").addClass("active");
});
$("#pricingsction").click(function(){
	$("#pricingsction").addClass("active");
	$("#faqsection").removeClass("active");
});


    </script>
     <script src="<%=appUrl %>/js/videoPlugin.js"></script>
				
</body>

</html>