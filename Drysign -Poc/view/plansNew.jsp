<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page
	import="com.drysign.model.Registration, org.springframework.security.core.context.SecurityContextHolder, org.springframework.security.core.Authentication"%>

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

<meta charset="utf-8">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><spring:message code="label.hometitle" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" sizes="57x57"
	href="<%=appUrl %>/images/fav-icon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="<%=appUrl %>/images/fav-icon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="<%=appUrl %>/images/fav-icon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="<%=appUrl %>/images/fav-icon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="<%=appUrl %>/images/fav-icon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="<%=appUrl %>/images/fav-icon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="<%=appUrl %>/images/fav-icon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="<%=appUrl %>/images/fav-icon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="<%=appUrl %>/images/fav-icon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="<%=appUrl %>/images/fav-icon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="<%=appUrl %>/images/fav-icon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="<%=appUrl %>/images/fav-icon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=appUrl %>/images/fav-icon/favicon-16x16.png">
<link rel="manifest" href="<%=appUrl %>/images/fav-icon/manifest.json">

<link
	href="https://fonts.googleapis.com/css?family=Work+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=appUrl %>/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=appUrl %>/css/newCSS/style.css" />
<link rel="stylesheet" href="<%=appUrl %>/css/newCSS/global.css" />
<link rel="stylesheet" href="<%=appUrl %>/css/newCSS/custom.css" />
<link rel="stylesheet" href="<%=appUrl %>/css/newCSS/drysign.css" />

<style>
#setupSecureCode {
	color: #666;
	font-weight: normal;
	font-size: 22px;
}

.pricingtext {
	margin: 0 auto;
	text-align: center;
	display: inline-block;
	float: none;
}

.pricingtext span h4 {
	width: 70% !important;
	display: inline-block;
	text-align: center;
}

.pricingtxth1 {
	margin-top: 70px;
}

.img_parent img {
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

sup {
	top: -1.9em;
	font-size: 22px;
}

.toggle-password, .toggle-password2 {
	position: absolute;
	right: 4px;
	/* left: 0; */
	/* text-align: right; */
	/* width: 100%; */
	/* display: inline-block; */
	top: 8px;
}

.passwordGroup {
	position: relative;
}

.fa.fa-eye, .fa.field-icon {
	color: #000;
}

ul.nav.nav-tabs {
	margin: 0 auto;
	/*  width: 370px; */
	width: 282px;
	border: 0;
}

.nav>li>a:focus, .nav>li>a:hover {
	text-decoration: none;
	background-color: transparent;
	border-color: transparent;
}

.nav-tabs>li>a {
	color: #80888f;
	font-size: 16px;
}

ul.nav.nav-tabs li.active a {
	color: #40505b;
	font-size: 16px;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover
	{
	color: #555;
	cursor: default;
	background-color: transparent;
	border: 0;
	border-bottom-color: transparent;
}

@media ( min-width : 768px) {
	.panel-heading {
		display: none;
	}
	.panel {
		border: none;
		box-shadow: none;
	}
	.panel-collapse {
		height: auto;
	}
	.panel-collapse.collapse {
		display: block;
	}
}

@media ( max-width : 299px) {
	.termLinkOne label::before {
		margin-left: 0;
	}
}

@media ( max-width : 767px) {
	.pricingtxth1 {
		margin-top: 15px;
	}
	.btn-primary {
		padding: 10px 9px !important;
	}
	.bottom-20 {
		padding-top: 0px !important;
	}
	h1 {
		font-size: 26px;
	}
	.padding-l h4 {
		font-size: 26px;
	}
	.parent {
		display: block !important;
	}
	.parent .modules {
		background-color: #e3f5fd;
		width: 400px !important;;
		text-align: center;
		line-height: 75px;
		font-size: 30px;
		max-width: 100% !important;;
		margin: 0 auto 20px !important;;
		padding: 15px !important;;
	}
	.tab-content .tab-pane {
		display: block;
	}
	.nav-tabs {
		display: none;
	}
	.panel-title a {
		display: block;
		color: #141821;
	}
	.panel {
		margin: 0;
		box-shadow: none;
		border-radius: 0;
		margin-top: -2px;
	}
	.tab-pane:first-child .panel {
		border-radius: 5px 5px 0 0;
	}
	.tab-pane:last-child .panel {
		border-radius: 0 0 5px 5px;
	}
}

.nav.nav-tabs li span {
	height: 44px;
	width: 1px;
	background: #1f94e6;
	display: block;
	position: absolute;
}

.parent {
	display: flex;
	display: -webkit-flex;
	flex-direction: row;
	-webkit-flex-direction: row;
	justify-content: center;
	-webkit-justify-content: center;
	height: 100%;
}

.parent .modules {
	background-color: #e3f5fd;
	width: 300px;
	max-width: 90%;
	margin: 10px;
	text-align: center;
	line-height: 75px;
	font-size: 30px;
	position: relative
}

.headers h1 {
	font-size: 21px;
	color: #1f94e6;
	font-weight: normal;
}

.headers p {
	font-size: 75px !important;
	margin: 40px 0 0 0;
	padding: 0;
	line-height: 100%;
}

.headers span {
	font-size: 17px;
	color: #666;
}

.modules ul {
	border-top: 1px solid #4dc5f2;
	padding: 25px 0;
	margin: 0 auto;
}

.modules ul li {
	font-size: 15px;
	line-height: 36px;
	margin-bottom: 50px;
}

.modules:hover {
	background: transparent;
}

.textinfo h2 {
	font-size: 26px;
	font-weight: normal;
	margin: 10px 0;
	color: #18191b;
}

.textinfo {
	margin-bottom: 55px;
}

.textinfo p {
	font-size: 17px;
	color: #40505b;
	text-align: justify;
}

@media ( max-width : 991px) {
	.textinfo p {
		text-align: left;
	}
}

.bottomaligne {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
}

input.secrete {
	/*  -webkit-text-security:disc; */
	font-size: 15px;
}
</style>

</head>

<body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MRTTRCL"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-102458969-1"></script>
	<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-102458969-1');
  //gtag('config', 'AW-747261926');
   </script>
	<header>
		<div class="row">
			<div class="fixedHeader">
				<nav class="navbar navbar-fixed-top">
					<div class="nav-logo ">

						<div id="logoHolder">
							<a href="<%=appUrl %>"><img
								src="<%=appUrl %>/images/newimages/drysign_logo.png"></a>
						</div>
					</div>
					<div class="navbar-header">

						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target=".navbar-collapse">
							<span class="closemenu"></span>

						</button>


					</div>
					<div class="navbar-collapse collapse" style="height: 1px;">

						<ul class="nav navbar-nav">
							<li class="nav-item"><a class="nav-link"
								href="<%=appUrl %>/#section1"><spring:message
										code="label.benefits" /><span class="sr-only"></span></a></li>
							<li class="nav-item" id="faqsection"><a class="nav-link"
								href="#sectionFaq" onclick="myclickFunction()"
								id="sectionFaq123"><spring:message code="label.faq" /></a></li>
							<li class="nav-item active" id="pricingsction"><a
								class="nav-link "
								href="<%=appUrl %>/plancharge?category_name=General%20Plans&category=1"
								id="pricingsection123" onclick="myclickFunction()"><spring:message
										code="label.pricing" /> </a></li>
							<li class="nav-item"><a class="nav-link"
								href="<%=appUrl %>/login?locale=en"><spring:message
										code="label.signin" /></a></li>
							<li class="nav-item">
								<!-- <a class="nav-link" data-toggle="modal" data-target="#myModal2" >Try DrySign</a> -->
								<a onClick="openSignUp()" class="nav-link" id="trysignclick"><spring:message
										code="label.trydrysign" /></a>
							</li>
							<li class="nav-item">
                                <a class="blogslink" target="_blank" href="https://drysignblogs.exelatech.com/"><spring:message code="label.Blogs"/></a>
                            </li>
							
						</ul>
						<div class="navbar-header navbar-right">
							<p class="navbar-text">
								<a href="https://www.exelatech.com" class="navbar-link"><spring:message code="label.exelatechCom"/>
									<i class="fa fa-arrow-right"></i>
								</a>
							</p>
						</div>
					</div>
				</nav>

			</div>
		</div>
	</header>

	<div class="bodySection">
		<div class="container-fluid">
			<div class="row padding-l">
				<div class="col-lg-12">
					<span class="text-center">
						<h1 class="pricingtxth1">
							<spring:message code="label.tpt-pricing" />
						</h1>
						<p>
							<spring:message code="label.tpt-pricingcontent" />
						</p>
					</span>
				</div>

			</div>

			<div class="container">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab1" data-toggle="tab"><spring:message
								code="label.aplan" /></a></li>
					<li><span></span></li>
					<li><a href="#tab2" data-toggle="tab"><spring:message
								code="label.mplan" /></a></li>
				</ul>

				<div class="tab-content">
					<div class="tab-pane active" id="tab1">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent=".tab-pane"
										href="#collapseOne"> <spring:message code="label.aplan" />
									</a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in">
								<div class="panel-body">
									<div class="parent">
										<c:choose>
											<c:when test="${not empty plans}">
												<c:forEach items="${plans }" var="plan">
													<c:if test="${plan.duration.time == '365' }">
														<div class="modules">
															<div class="headers">
																<h1>${plan.name }</h1>
																<p>
																	<sup> ${plan.currency.name}</sup> <fmt:formatNumber value="${plan.price/12}"></fmt:formatNumber>
																</p>
																<span><spring:message code="label.perUserPerMonth" /></span>
															</div>
															<ul>
																<li><c:if test="${not empty plan.noOfDocuments}">${plan.noOfDocuments} <spring:message code="label.documents" /><br />
																	</c:if> <c:if test="${not empty plan.template}">${plan.template} <spring:message code="label.templates" /><br />
																	</c:if> <c:forTokens items="${plan.features }" delims=","
																		var="splitPlan">
																		<c:set var="splitPlan" scope="request"
																			value="${splitPlan}" />
																		<c:forEach items='${features1}' var='feature1'>
																			<c:set var="fid" scope="request"
																				value="${feature1.id}" />
																			<% if(request.getAttribute("fid").toString().equals(request.getAttribute("splitPlan"))){ %>${feature1.name}<br />
																			<% } %>

																		</c:forEach>

																	</c:forTokens></li>

															</ul>
															<div class="text-center bottom-20 bottomaligne">
																<%-- 			   <button type="button" class="btn btn-primary scrollbotom" data-toggle="modal" data-target="#buynowModal">Buy Now</a></button>--%>
																<button type="button"
																	class="btn btn-primary scrollbotom" data-toggle="modal"
																	data-target="#buynowModal"
																	onclick="planBuy('${plan.token}','${plan.price}','<%= request.getParameter("category_name") %>');">
																	<spring:message code="label.buyNow" /></a>
																</button>

															</div>
														</div>


													</c:if>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<p style="min-height: 480px;"><%-- <spring:message code="label.noplans"/> --%></p>
											</c:otherwise>
										</c:choose>
										<div class="modules">
											<div class="headers">
												<h1><spring:message code="label.premium" /></h1>
												<br>
												<p>
													<sup><spring:message code="label.contactSales" /></sup>
												</p>
												<ul>
													<br />
												</ul>
												<span id="business_primium"></span>
											</div>
											<div class="text-center bottom-20 bottomaligne">
												<%-- 			   <button type="button" class="btn btn-primary scrollbotom" data-toggle="modal" data-target="#buynowModal">Buy Now</a></button>--%>
												<button type="button" class="btn btn-primary scrollbotom">
													<a href="mailto:sales.support@exelaonline.com"
														style="font-size: 20px;"><spring:message code="label.contactSales" /></a>
												</button>

											</div>
										</div>
									</div>

								</div>

							</div>
						</div>
					</div>

					<div class="tab-pane" id="tab2">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent=".tab-pane"
										href="#collapseTwo"> <spring:message code="label.mplan" />
									</a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse">
								<div class="panel-body">
									<div class="parent">
										<c:choose>
											<c:when test="${not empty plans}">
												<c:forEach items="${plans }" var="plan">
													<c:if test="${plan.duration.time == '30' }">
														<div class="modules">
															<div class="headers">
																<h1>${plan.name }</h1>
																<p>
																	<sup> ${plan.currency.name}</sup> ${plan.price}
																</p>
																<span><spring:message code="label.perUser" /></span>
															</div>
															<ul>
																<li><c:if test="${not empty plan.noOfDocuments}">${plan.noOfDocuments} <spring:message code="label.documents" /><br />
																	</c:if> <c:if test="${not empty plan.template}">${plan.template} <spring:message code="label.templates" /><br />
																	</c:if> <c:forTokens items="${plan.features }" delims=","
																		var="splitPlan">
																		<c:set var="splitPlan" scope="request"
																			value="${splitPlan}" />
																		<c:forEach items='${features1}' var='feature1'>
																			<c:set var="fid" scope="request"
																				value="${feature1.id}" />
																			<% if(request.getAttribute("fid").toString().equals(request.getAttribute("splitPlan"))){ %>${feature1.name}<br />
																			<% } %>

																		</c:forEach>

																	</c:forTokens></li>

															</ul>
															<div class="text-center bottom-20 bottomaligne">
																<button type="button"
																	class="btn btn-primary scrollbotom" data-toggle="modal"
																	data-target="#buynowModal"
																	onclick="planBuy('${plan.token}','${plan.price}','<%= request.getParameter("category_name") %>');">
																	Buy Now</a>
																</button>

															</div>
														</div>
													</c:if>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<p style="min-height: 480px;"><%-- <spring:message code="label.noplans"/> --%></p>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>


			<!--  Hide data as per request -->
			<div class="row padding-l">
				<div class="col-lg-12 pricingtext">
					<span class="text-center">
						<h4>
							<spring:message code="label.pricing-seamless" />
							<spring:message code="label.pricing-seamless-c" />
						</h4>
						<h4></h4>
					</span>
				</div>
				<div class="col-lg-12">
					<div class="text-center bottom-20">
						<!--  <button type="button" class="btn btn-primary scrollbotom" ><a class="nav-link" data-toggle="modal" data-target="#myModal2">Try DrySign for Free</a></button> -->
						<button type="button" class="btn btn-primary scrollbotom"
							onClick="openSignUp()">
							<spring:message code="label.tryfree" />
						</button>
					</div>
					<div class="text-center bottom-20">
						<a href="<%=appUrl %>/images/productSheet.pdf" target="_blank"><spring:message
								code="label.sheet" /></a>
					</div>
				</div>
			</div>
		</div>

	</div>
	<section class="" id="sectionFaq">
		<div class="platform-div">
			<div class="text-center">
				<div class="home-header-title">
					<spring:message code="label.pricingfaq" />
				</div>
			</div>
			<div class="textinfo">
				<h2>
					<spring:message code="label.wtdrysign" />
				</h2>

				<p>
					<spring:message code="label.wtdrysign_c" />
				</p>
			</div>
			<div class="textinfo">
				<h2>
					<spring:message code="label.q2" />
				</h2>

				<p>
					<spring:message code="label.q2-c" />
				</p>
			</div>

			<div class="textinfo">
				<h2>
					<spring:message code="label.q3" />
				</h2>

				<p>
					<spring:message code="label.q3-c" />
				</p>
			</div>
			<div class="textinfo">

				<h2>
					<spring:message code="label.q4" />
				</h2>

				<p>
					<spring:message code="label.q4-c" />
					<a target="_blank"
						href="https://www.fdic.gov/regulations/compliance/manual/10/x-3.1.pdf">
						<spring:message code="label.q4-c-1" />
					</a>
					<spring:message code="label.q4-c-2" />
					<a target="_blank"
						href="http://euro.ecom.cmu.edu/program/law/08-732/Transactions/ueta.pdf">
						<spring:message code="label.q4-c-3" />
					</a>.
					<spring:message code="label.q4-c-4" />
				</p>

			</div>
			<div class="textinfo">

				<h2>
					<spring:message code="label.q5" />
				</h2>

				<p>
					<spring:message code="label.q5-c" />
					<a target="_blank"
						href="https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=CELEX:32014R0910&from=EN"><spring:message
							code="label.q5-c-1" /> </a>
					<spring:message code="label.q5-c-2" />
				</p>

			</div>
			<div class="textinfo">

				<h2>
					<spring:message code="label.q6" />
				</h2>

				<p>
					<spring:message code="label.q6-c" />
				</p>

			</div>

			<div class="textinfo">

				<h2>
					<spring:message code="label.q7" />
				</h2>

				<p>
					<spring:message code="label.q7-c" />
				</p>

			</div>
			<div class="textinfo">

				<h2>
					<spring:message code="label.q8" />
				</h2>

				<p>
					<spring:message code="label.q8-c" />
					<a href="https://drysign.exelatech.com/"><spring:message code="label.drysignExelatechCom" /></a>
					<spring:message code="label.q8-c-1" />
				</p>

			</div>
		</div>
	</section>


	<section class="resource-container" id="section2">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="col-lg-12 text-center">
						<h1 class="block-title1">
							<spring:message code="label.signup-free" />
						</h1>
					</div>

					<div class="message text-center" id="register-success2"
						style="display: none; padding: 30px; background-color: white; width: 500px; margin: 0 auto; max-width: 90%; margin-top: 70px;">
						<!--  <span class="pull-right"><button type="button" class="close" onClick="sucessmsgClose()">&times;</button></span>-->
						<p>
							<img src="<%=appUrl %>/images/message-bg.png" />
						</p>
						<h4>
							<spring:message code="label.a-created" />
						</h4>
						<!--  <p>Congratulations! Your new account has been successfully created.</p> -->
						<p>
							<spring:message code="label.receive-email" />
						</p>
						<a href="login" class="btn backbutton btn-link continuelink"><spring:message
								code="label.conti-drysign" /></a>
					</div>

					<div class="alert alert-danger fade in"
						style="display: none; text-align: center; margin: 15px auto; width: 500px; max-width: 80%; overflow: hidden;"
						id="regsiterModelalert2">
						<a class="close" data-hide="alert" aria-label="close"
							onclick="$(this).parent().hide();">&times;</a>
						<div id="registerdmessage2"></div>
					</div>

					<div class="resource-container-info">

						<div class="col-lg-12" id="registerFormDiv2">
							<form id="indexregister2">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<input type="text" class="form-control namevalidation"
												id="firstName2" name="firstName2"
												placeholder="<spring:message code="label.fname"/>"
												maxlength="30" />
										</div>

									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<input type="text" class="form-control namevalidation"
												id="lastname2" name="lastname2"
												placeholder="<spring:message code="label.lname"/>" value=""
												maxlength="30" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group">
											<input type="text" class="form-control" id="companyName2"
												name="companyName2"
												placeholder="<spring:message code="label.cname"/>" value=""
												maxlength="50" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group">
											<div class="img_parent">
												<img id="imgflage" alt="Trulli">
											</div>
											<select id="codes" class="form-control"></select>

										</div>
									</div>
									<div class="col-lg-12">
										<div class="form-group">
											<input type="text" class="form-control" maxlength=12
												id="contactNo2" name="contactNo2"
												placeholder="<spring:message code="label.mobileNumber"/> (optional)"
												value="">
										</div>
									</div>

								</div>

								<div class="row">
									<div class="col-lg-12">
										<div class="form-group">
											<input type="text" autocomplete="off" class="form-control"
												id="email2" name="email2"
												placeholder="<spring:message code="label.email"/>" value=""
												maxlength="70" />
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-12">
										<div class="form-group passwordGroup">
											<span toggle="#password-field2"
												class="fa fa-fw fa-eye field-icon toggle-password2"></span>
											<input type="password" autocomplete="new-password"
												class="form-control" id="password-field2" name="password2"
												placeholder="<spring:message code="label.password"/> "
												value="" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group passwordGroup">
											<span toggle="#confirmpassword2"
												class="fa fa-fw fa-eye field-icon toggle-password2"></span>
											<input type="password" autocomplete="new-password"
												class="form-control" id="confirmpassword2"
												name="confirmpassword2"
												placeholder="<spring:message code="label.placeholder.confirmPassword"/>    "
												value="" />
										</div>
									</div>
								</div>

								<!-- -vvvv -->
								<div class="digit-group" data-group-name="digits"
									data-autosubmit="false" autocomplete="off">
									<h4><spring:message code="label.secureCodeOptional"/></h4>
									<div class="form-group has-feedback"
										style="padding: 10px 0px; margin-bottom: 0px;">
										<label><spring:message code="label.secureCode"/></label>
										<!--  <input id="partitioned"  type="text" maxlength="6" /> -->
										<div>
											<!--vvv name="digit-1"name="digit-2"name="digit-3"name="digit-4"name="digit-5" name="digit-6"-->
											<input type="password" id="digit-1" class="digit-VVV secrete"
												name="digit-VVV" data-next="digit-2" maxlength="1"
												onkeypress="return isNumber(event)" tabindex="1"
												pattern="\d*" inputmode="numeric" /> <input type="password"
												id="digit-2" class="digit-VVV secrete" name="digit-VVV"
												data-next="digit-3" maxlength="1" data-previous="digit-1"
												onkeypress="return isNumber(event)" tabindex="1"
												pattern="\d*" inputmode="numeric" /> <input type="password"
												id="digit-3" class="digit-VVV secrete" name="digit-VVV"
												data-next="digit-4" maxlength="1" data-previous="digit-2"
												onkeypress="return isNumber(event)" tabindex="1"
												pattern="\d*" inputmode="numeric" /> <input type="password"
												id="digit-4" class="digit-VVV secrete" name="digit-VVV"
												data-next="digit-5" maxlength="1" data-previous="digit-3"
												onkeypress="return isNumber(event)" tabindex="1"
												pattern="\d*" inputmode="numeric" /> <input type="password"
												id="digit-5" class="digit-VVV secrete" name="digit-VVV"
												data-next="digit-6" maxlength="1" data-previous="digit-4"
												onkeypress="return isNumber(event)" tabindex="1"
												pattern="\d*" inputmode="numeric" /> <input type="password"
												id="digit-6" class="digit-VVV secrete" name="digit-VVV"
												data-previous="digit-5" maxlength="1"
												onkeypress="return isNumber(event)" tabindex="1"
												pattern="\d*" inputmode="numeric" />
										</div>
										<input type="hidden" class="secureCodeVVV" id="secureCodeVVV" />
									</div>
									<div class="form-group"
										style="padding: 0px; margin-bottom: 5px;">
										<label id="securityCodeSignUpErr" class="error_otp"
											style="display: none;"><spring:message code="label.enter6Digit"/></label>
									</div>

									<div class="form-group"
										style="padding: 10px 0px; margin-bottom: 0px;">
										<label><spring:message code="label.confirmSecureCode"/></label>
										<!--  <input id="partitioned"  type="text" maxlength="6" /> -->
										<div>
											<input type="password" id="digit-1"
												class="digit-confirmVVV secrete" name="digit-confirmVVV"
												data-next="digit-2" maxlength="1"
												onkeypress="return isNumber(event)" tabindex="1"
												pattern="\d*" inputmode="numeric" /> <input type="password"
												id="digit-2" class="digit-confirmVVV secrete"
												name="digit-confirmVVV" data-next="digit-3" maxlength="1"
												data-previous="digit-1" onkeypress="return isNumber(event)"
												tabindex="1" pattern="\d*" inputmode="numeric" /> <input
												type="password" id="digit-3"
												class="digit-confirmVVV secrete" name="digit-confirmVVV"
												data-next="digit-4" maxlength="1" data-previous="digit-2"
												onkeypress="return isNumber(event)" tabindex="1"
												pattern="\d*" inputmode="numeric" /> <input type="password"
												id="digit-4" class="digit-confirmVVV secrete"
												name="digit-confirmVVV" data-next="digit-5" maxlength="1"
												data-previous="digit-3" onkeypress="return isNumber(event)"
												tabindex="1" pattern="\d*" inputmode="numeric" /> <input
												type="password" id="digit-5"
												class="digit-confirmVVV secrete" name="digit-confirmVVV"
												data-next="digit-6" maxlength="1" data-previous="digit-4"
												onkeypress="return isNumber(event)" tabindex="1"
												pattern="\d*" inputmode="numeric" /> <input type="password"
												id="digit-6" class="digit-confirmVVV secrete"
												name="digit-confirmVVV" data-previous="digit-5"
												maxlength="1" onkeypress="return isNumber(event)"
												tabindex="1" pattern="\d*" inputmode="numeric" />
										</div>
										<input type="hidden" class="confirmSecureCodeVVV"
											id="confirmSecureCodeVVV" />
									</div>

									<div class="form-group"
										style="padding: 0px; margin-bottom: 5px;">
										<label id="confirmSecurityCodeSignUpErr" class="error_otp"
											style="display: none;"><spring:message
												code="label.securecode.error" /></label>
									</div>

								</div>
								<!-- -vvvv -->




								<div class="row">
									<div class="col-lg-12 text-left checkdiv">
										<div class="form-group">
											<div class="termLinkOne checkbox-primary">
												<input type="checkbox" id="termsandcondition2"
													class="termsandcondition2" name="termsandcondition2">

												<label for="termsandcondition2" class="termLink"
													style="margin-left: 4px !important"> <spring:message
														code="label.acct" /> <a
													href="<%=appUrl %>/termsandcondition" target="_blank">
														<spring:message code="label.tc" />
												</a>
												</label>
											</div>
											<label for="termsandcondition2" class="error"
												generated="true"></label>
										</div>


									</div>
								</div>



								<div class="text-center bottom-20">
									<button type="button" id="signupbtn2" class="btn btn-primary"
										onClick="register2();">
										<spring:message code="label.sfreetrial" />
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div id="buynowModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content modal-content1">
				<div class="modal-body">
					<p>
						<spring:message code="label.proceed" />
					</p>
					<div class="row">
						<div class="col-sm-12 col-md-12 text-right">
							<button type="button" class="btn btn-light" data-dismiss="modal"">
								<spring:message code="label.cancel" />
							</button>
							<button type="button" class="btn btn-orange" onclick="proceed();">
								<spring:message code="label.out_confm" />
							</button>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- signup form -->


	<!-- Modal -->
	<div class="modal right fade" id="myModal2" tabindex="-1" role="dialog"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modeldiv">
					<span></span>

					<button type="button" class="close"
						onclick="closeRegistrationModal()" aria-label="Close">
						<img src="<%=appUrl %>/images/newimages/cancel.png">
					</button>

					<h4 id="myModalLabel">
						<spring:message code="label.sign4free" />
					</h4>

				</div>

				<div class="message text-center" id="register-success"
					style="display: none; padding: 30px;">

					<p>
						<img src="<%=appUrl %>/images/message-bg.png" />
					</p>
					<h4>
						<spring:message code="label.a-created" />
					</h4>
					<!--  <p>Congratulations! Your new account has been successfully created.</p> -->
					<p>
						<spring:message code="label.receive-email" />
					</p>
					<a href="login" class="btn backbutton btn-link continuelink"><spring:message
							code="label.conti-drysign" /></a>
				</div>

				<div class="alert alert-danger fade in"
					style="display: none; text-align: center; margin: 0px;"
					id="regsiterModelalert">
					<a class="close" data-hide="alert" aria-label="close"
						onclick="$(this).parent().hide();">&times;</a>
					<div id="registerdmessage"></div>
				</div>


				<div class="modal-body " id="registerFormDiv">
					<form id="indexregister"  autocomplete="off">
						<div class="form-group">

							<input type="text" class="form-control namevalidation"
								id="firstName" name="firstName"
								placeholder="<spring:message code="label.fname"/>" value=""
								maxlength="50">
						</div>
						<div class="form-group">
							<input type="text" class="form-control namevalidation"
								id="lastname" name="lastname"
								placeholder="<spring:message code="label.lname"/>" value=""
								maxlength="50">

						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="companyName"
								name="companyName"
								placeholder="<spring:message code="label.cname"/>" value=""
								maxlength="50">
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<div class="img_parent">
										<img id="imgflage1" alt="Trulli">
									</div>
									<select id="codes1" class="form-control"></select>

								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<input type="text" class="form-control" maxlength=12
										id="contactNo" name="contactNo"
										placeholder="<spring:message code="label.mobileNumber"/> (optional)"
										value="">
								</div>
							</div>
						</div>
						<!-- <div class="form-group">
                       
                            <input type="text" class="form-control"  maxlength=10 id="contactNo" name="contactNo" placeholder="Contact No" value="">
                        </div> -->

						<div class="form-group">
							<input type="text" class="form-control" autocomplete="off"
								id="email" name="email"
								placeholder="<spring:message code="label.email"/>"
								maxlength="70" />
						</div>

						<div class="form-group passwordGroup">
							<span toggle="#password-field1"
								class="fa fa-fw fa-eye field-icon toggle-password"
								id="toggle_password_eye"></span> <input type="password"
								autocomplete="new-password" class="form-control"
								placeholder="<spring:message code="label.password"/> "
								id="password-field1" name="password" value="">
						</div>

						<div class="form-group passwordGroup">
							<span toggle="#confirmpassword1"
								class="fa fa-fw fa-eye field-icon toggle-password"
								id="toggle_password_eye1"></span> <input type="password"
								autocomplete="new-password" class="form-control"
								id="confirmpassword1" name="confirmpassword1"
								placeholder="<spring:message code="label.placeholder.confirmPassword"/>    "
								value="">
						</div>

						<div class="digit-group" data-group-name="digits"
							data-autosubmit="false" autocomplete="off">
							<h4 id="setupSecureCode"><spring:message code="label.secureCodeOptional"/></h4>
							<div class="form-group has-feedback"
								style="padding: 10px 0px; margin-bottom: 0px;">
								<label><spring:message code="label.secureCode"/></label>
								<!--  <input id="partitioned"  type="text" maxlength="6" /> -->
								<div>
									<input type="password" id="digit-1" class="digit-VVV1 secrete"
										name="digit-1" data-next="digit-2" maxlength="1"
										onkeypress="return isNumber(event)" tabindex="1" pattern="\d*"
										inputmode="numeric" /> <input type="password" id="digit-2"
										class="digit-VVV1 secrete" name="digit-2" data-next="digit-3"
										maxlength="1" data-previous="digit-1"
										onkeypress="return isNumber(event)" tabindex="1" pattern="\d*"
										inputmode="numeric" /> <input type="password" id="digit-3"
										class="digit-VVV1 secrete" name="digit-3" data-next="digit-4"
										maxlength="1" data-previous="digit-2"
										onkeypress="return isNumber(event)" tabindex="1" pattern="\d*"
										inputmode="numeric" /> <input type="password" id="digit-4"
										class="digit-VVV1 secrete" name="digit-4" data-next="digit-5"
										maxlength="1" data-previous="digit-3"
										onkeypress="return isNumber(event)" tabindex="1" pattern="\d*"
										inputmode="numeric" /> <input type="password" id="digit-5"
										class="digit-VVV1 secrete" name="digit-5" data-next="digit-6"
										maxlength="1" data-previous="digit-4"
										onkeypress="return isNumber(event)" tabindex="1" pattern="\d*"
										inputmode="numeric" /> <input type="password" id="digit-6"
										class="digit-VVV1 secrete" name="digit-6"
										data-previous="digit-5" maxlength="1"
										onkeypress="return isNumber(event)" tabindex="1" pattern="\d*"
										inputmode="numeric" />
								</div>
								<input type="hidden" class="secureCodeVVV" id="secureCodeVVV1" />
							</div>
							<div class="form-group" style="padding: 0px; margin-bottom: 5px;">
								<label id="securityCodeSignUpErr1"
									style="display: none; color: #e10543"><spring:message code="label.enter6Digit"/></label>
							</div>
							<div class="form-group"
								style="padding: 10px 0px; margin-bottom: 0px;">
								<label><spring:message code="label.confirmSecureCode"/></label>
								<!--  <input id="partitioned"  type="text" maxlength="6" /> -->
								<div>
									<input type="password" id="digit-1"
										class="digit-confirmVVV1 secrete" name="digit-1"
										data-next="digit-2" maxlength="1"
										onkeypress="return isNumber(event)" tabindex="1" pattern="\d*"
										inputmode="numeric" /> <input type="password" id="digit-2"
										class="digit-confirmVVV1 secrete" name="digit-2"
										data-next="digit-3" maxlength="1" data-previous="digit-1"
										onkeypress="return isNumber(event)" tabindex="1" pattern="\d*"
										inputmode="numeric" /> <input type="password" id="digit-3"
										class="digit-confirmVVV1 secrete" name="digit-3"
										data-next="digit-4" maxlength="1" data-previous="digit-2"
										onkeypress="return isNumber(event)" tabindex="1" pattern="\d*"
										inputmode="numeric" /> <input type="password" id="digit-4"
										class="digit-confirmVVV1 secrete" name="digit-4"
										data-next="digit-5" maxlength="1" data-previous="digit-3"
										onkeypress="return isNumber(event)" tabindex="1" pattern="\d*"
										inputmode="numeric" /> <input type="password" id="digit-5"
										class="digit-confirmVVV1 secrete" name="digit-5"
										data-next="digit-6" maxlength="1" data-previous="digit-4"
										onkeypress="return isNumber(event)" tabindex="1" pattern="\d*"
										inputmode="numeric" /> <input type="password" id="digit-6"
										class="digit-confirmVVV1 secrete" name="digit-6"
										data-previous="digit-5" maxlength="1"
										onkeypress="return isNumber(event)" tabindex="1" pattern="\d*"
										inputmode="numeric" />
								</div>
								<input type="hidden" class="confirmSecureCodeVVV"
									id="confirmSecureCodeVVV1" />
							</div>
							<div class="form-group" style="padding: 0px; margin-bottom: 5px;">
								<label id="confirmSecurityCodeSignUpErr1"
									style="display: none; color: #e10543"><spring:message
										code="label.securecode.error" /></label>
							</div>
						</div>
						<div class="text-left bottom-20">
							<div class="termLinkTwo checkbox-primary">
								<input type="checkbox" id="termsandcondition"
									class="termsandcondition" name="termsandcondition"> <label
									for="termsandcondition" class="termLink"> <spring:message
										code="label.acct" /> <a href="<%=appUrl %>/termsandcondition"
									target="_blank"> <spring:message code="label.tc" /></a>
								</label>
							</div>

							<label style="float: none;" for="termsandcondition" class="error"
								generated="true"></label>
						</div>
						<div class="text-left bottom-20">
							<button type="button" id="signupbtn" onClick="register();"
								class="btn btn-primary">
								<spring:message code="label.sfreetrial" />
							</button>
						</div>

					</form>
				</div>

			</div>
			<!-- modal-content -->
		</div>
		<!-- modal-dialog -->
	</div>
	<!-- modal -->

	<!-- Modal -->

	<div class="overlay-bg"></div>


	<script src="<%=appUrl %>/js/js_landing/jquery-1.11.3.min.js"></script>
	<script src="<%=appUrl %>/js/js_landing/bootstrap.js"></script>
	<script src="<%=appUrl %>/js/jquery.validate.js"></script>
	<script src="<%=appUrl %>/js/popper.min.js"></script>
	<script src="<%=appUrl %>/js/jquery.buttonLoader.js"></script>
	<script src="<%=appUrl %>/js/contact/countryCodes.js"></script>

	<script>
//vvv set securecode in a hidden field
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

$("#sectionFaq123").click(function() {
	$("#faqsection").addClass("active");
	$("#pricingsction").removeClass("active");
});
$("#pricingsection123").click(function(){
	$("#pricingsction").addClass("active");
	$("#faqsection").removeClass("active");

});
$("#trysignclick").click(function(){
	  $('.navbar-toggle span').toggleClass("closemenu mainmenu");
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
function myclickFunction() {	
	$('.navbar-toggle span').toggleClass("closemenu mainmenu");
	}


    $(document).ready(function(){
    	 $('input').keyup(function(){
 	        if($(this).val().length==$(this).attr("maxlength")){
 	            $(this).next().focus();
 	        }
 	    });
    	//if($(".nav-item").hasClass(active)){
    	//alert("hi");
   		// }
    	
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
    	
    	
    	
    	$("#tab2").click(function(){
    	
    		document.body.scrollTop = 0;
			 document.documentElement.scrollTop = 0;
    	});
    	$('a.nav-link').click(function(){
		//alert("hi");
		$('a.nav-link').parent().parent().parent().removeClass('in');
		
	});
        $('.navbar-toggle').click(function() {
           // $('span').toggle('1000');
            $('span', this).toggleClass("mainmenu closemenu");
			});
   

    $('body').scrollspy({target: ".navbar", offset: 50});
    
  //vvv
    $.validator.addMethod("pwcheck", function(value, element) {
        return this.optional(element) || /^[a-zA-Z0-9!@#$%^*_&\-]+$/i.test(value)  
        				&& /[a-z]/.test(value) // has a lowercase letter
    			       && /[A-Z]/.test(value) // has a lowercase letter
    			       && /\d/.test(value) // has a digit;
    			       && /[!@#$%^*_&\-]/.test(value); // has a lowercase letter
    	}, "<spring:message code="label.passwordMustBeAlfhanumeric"/>");

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
   // 	return this.optional(element) || /^[a-zA-Z ]+(([,._ -/][a-zA-Z 0-9])?[a-zA-Z0-9 ]*)*$/i.test(value);
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
   // var requestUrl = "http://ip-api.com/json";
   /* var requestUrl = "https://ipapi.co/country/";

         $.ajax({
           url: requestUrl,
           type: 'GET',
           async: false,
           success: function(json)
           {
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
    $(document).ready(function()
    {
    	//console.log("category1");
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
      sessionStorage.removeItem("planSelected");
    });
    
    /* country code ended */
    
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
    //myclickFunction();
  
    //	$('.navbar-toggle span').toggleClass("closemenu mainmenu");
   	 //alert("in signup");
   	 $("#myModal2").modal('toggle');
   	 $("#termsandcondition"). prop("checked", false);
   	 indexregisterform.resetForm();
   	 
	 $('.digit-group').find('input:text').val(''); //vvv reset mfa section
	 
	///Set mfa error codes to empty and hidden text data to empty
		$("#secureCodeVVV1").val('');
		$("#confirmSecureCodeVVV1").val('');
		$("#securityCodeSignUpErr1").css("display", "none");
		$("#confirmSecurityCodeSignUpErr1").css("display", "none");
		$("#confirmpassword1").val('');
    }
    
    function closeRegistrationModal(){
    
   	 	$("#register-success").hide();
   		$("#regsiterModelalert").hide();
   		$("#myModalLabel").html('<spring:message code="label.sign4free"/>');
   		$('.modal').modal('hide');
   		$("#registerFormDiv").show();
   		$("#registerFormDiv .form-control").removeClass("error");
   		resetForm();
   		 
   	///Set mfa error codes to empty and hidden text data to empty
  		$("#secureCodeVVV1").val('');
 		$("#confirmSecureCodeVVV1").val('');
 		$("#securityCodeSignUpErr1").css("display", "none");
		$("#confirmSecurityCodeSignUpErr1").css("display", "none");  	
		$("#confirmpassword1").val('');
		$('#codes1').empty();
	    var newOption = $('<option value="1 US"><spring:message code="label.USA"/></option>');
	    $('#codes1').append(newOption);
	    document.getElementById("imgflage1").src = countryCodes[1].flag;
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
 
  //vvv validate Security Codefor sign up
	function validateSecurityCode(securityCode, confirmSecurityCode){
	//	alert("securityCode, confirmSecurityCode-"+securityCode+"   & "+confirmSecurityCode);
		
		var isNum_securityCode = /^\d+$/.test(securityCode);
		////	alert("securityCode:"+securityCode+"=>isnum1: "+isNum_securityCode+"  ---confirmSecurityCode "+confirmSecurityCode);

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
  
  
	  //vvv validate Security Codefor sign up - Register SignUp
	function validateSecurityCode1(securityCode, confirmSecurityCode){
	//	alert("securityCode, confirmSecurityCode-"+securityCode+"   & "+confirmSecurityCode);
		
		var isNum_securityCode = /^\d+$/.test(securityCode);
		///alert("securityCode:"+securityCode+"=>isnum1: "+isNum_securityCode+"  ---confirmSecurityCode "+confirmSecurityCode);
		
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
	//		alert("===3");
			$("#securityCodeSignUpErr1").css("display", "none");
			$("#confirmSecurityCodeSignUpErr1").css("display", "none");
			return true;
		}	
	}
  
    function register(){
    	var con = $("#codes1 option:selected").val().split(" ");
		//alert(con[0]);
		var countryCodeVar=con[1].trim();		//get countrycode[].alpha2Code
		//var contct ="+"+con[0]+"-"+$("#contactNo").val();
		
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
    	
//    	if(valid == true){
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
    		
    ///	alert("reg "+JSON.stringify(data));
    		
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
    			 	alert('<spring:message code="label.loading_error"/>');
    			 	return false;
    			}
    		});		
    	}
    }
    
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
    			checkempty:true
    		},
    		lastname : {
    			required : true,
    			//lettersonly: true,
    			checkempty:true
    		},
    		password : {
    			required : true,
    			minlength : 8,
    			maxlength:15,
    			pwcheck: true		//vvv exelaAUth password rule
    		},
    		confirmpassword1 : {
			//	required : true,
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
            confirmpassword1:'<spring:message code="label.passwordNotMatch"/>'
        }
    	//specify validation error messages

    	

    	/* messages : {
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
    
    /* registration from bottom form */
    
     var indexregisterform2 = $("#indexregister2").validate({
		
		rules : {
			email2 : {
				required : true,
				email : true,
				emailcheck:true
			},
			firstName2 : {
				required : true,
				//lettersonly: true,
				checkempty:true
			},
			lastname2 : {
				required : true,
				//lettersonly: true,
				checkempty:true
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
            confirmpassword2: "<spring:message code="label.passwordNotMatch"/>"
        }
			/* messages : {
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

     function register2(){
    		var con = $("#codes option:selected").val().split(" ");
    		//alert(con[0]);
			var countryCodeVar=con[1].trim();		//get countrycode[].alpha2Code
			
    		var phValue=$("#contactNo2").val();
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
    		var valid = $("#indexregister2").valid();
    		
        	//vvv validate security code 
        	var validSecureCode = validateSecurityCode($("#secureCodeVVV").val(),$("#confirmSecureCodeVVV").val());
        	
//        	if(valid == true){
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
    				
    		///	alert("reg2 "+JSON.stringify(data));
    			
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
    						$("#registerdmessage2").html(response.msg);
    					}
    				},
    				error: function(xhr, textStatus, errorThrown)
    				 {
    				 	alert('<spring:message code="label.loading_error"/>');
    				 	return false;
    				}
    			});		
    		}
    	 }
     
     function  sucessmsgClose(){
  	   $("#registerFormDiv2").show();
  		$("#register-success2").hide();
  		resetForm2();
  }
     
     function resetForm2(){
     	
         $("#firstName2").val(''),
         $("#lastname2").val(''),
         $("#email2").val(''),
         $("#password-field2").val(''),
         $("#companyName2").val(''),
         $("#contactNo2").val('')
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

     $(".toggle-password2").click(function() {

     	$(this).toggleClass("fa-eye fa-eye-slash");
     	var input = $($(this).attr("toggle"));
     	if (input.attr("type") == "password") {
     		input.attr("type", "text");
     	} else {
     		input.attr("type", "password");
     	}
     });
     
     function planBuy(token,price,category){
    	 var planDetails={};
    	 planDetails.token=token;
    	 planDetails.category=category;
    	 planDetails.price=price;
    	 sessionStorage.setItem("planSelected",JSON.stringify(planDetails));
    	 
    	 <%-- var r = confirm("To proceed further, Please Sign In/Sign Up.");
		  if (r == true) {
			  window.location.href='<%=appUrl %>/login?buyplan=true';
		    //txt = "You pressed OK!";
		  } else {
		    //txt = "You pressed Cancel!";
		  } --%>
     }
     
 	function proceed(){
 		var appUrl="<%=appUrl %>";
 		<%-- window.location.href='<%=appUrl %>/login?buyplan=true'; --%>
 		var planSelected=JSON.parse(sessionStorage.getItem("planSelected"));
 		window.location.href=appUrl+"/login?buyplan=true&plan="+planSelected.token+"&category="+planSelected.category+"&frompricing=true&locale=en";
 	}
    </script>

	<jsp:include page="new_footer.jsp" />
</body>

</html>