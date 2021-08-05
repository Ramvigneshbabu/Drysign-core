<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import = "java.util.ResourceBundle" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String appUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	String appUrl1 = request.getScheme() + "://" + request.getServerName() + request.getContextPath();
	ResourceBundle resource = ResourceBundle.getBundle("commonsutils");
	String DrySignPathIN =resource.getString("DrySignPathIN");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=12.0, minimum-scale=.25, user-scalable=yes" />

<!--  <meta content="width=device-width, initial-scale=0.80, maximum-scale=3, user-scalable=yes" name="viewport">-->
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title><spring:message code="label.sign_document" /> | DrySign</title>


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
<link href="<%=appUrl%>/css/cookie.css" rel="stylesheet" />
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="<%=appUrl%>/images/fav-icon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">


<!-- <link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet"> -->
<%--<link rel="stylesheet" href="<%=appUrl%>/css/bootstrap.min.css">
<script src="<%=appUrl%>/js/jquery.min.js"></script>
<script src="<%=appUrl%>/js/bootstrap.min.js"></script>
<script src="<%=appUrl%>/js/nagging-menu.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=appUrl%>/css/login.css">
<link href="<%=appUrl%>/css/buttonLoader.css" rel="stylesheet"
	type="text/css"> --%>


<!-- Bootstrap -->


<!-- <link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet"> -->
<link href="<%=appUrl%>/css/bootstrap.css" rel="stylesheet">

<link rel="stylesheet" href="<%=appUrl%>/css/fonts_icon.css">
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> -->
<link rel="stylesheet" href="<%=appUrl %>/css/fontAwesome4-4-0.css">

<link rel="stylesheet" href="<%=appUrl%>/css/inner_page.css" />
<link href="<%=appUrl%>/css/buttonLoader.css" rel="stylesheet"
	type="text/css">
<link href="<%=appUrl%>/css/jquery.signature.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.css">
<link href="<%=appUrl%>/css/cookie.css" rel="stylesheet">
<link href="<%=appUrl%>/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=appUrl%>/css/style1.css" />
<link href="<%=appUrl%>/css/signaturepad.css" rel="stylesheet">
<%-- <link rel="stylesheet" href="<%=appUrl%>/css/exela_theme.css" /> --%>
<script src="<%=appUrl %>/js/jsapi.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dompurify/2.0.8/purify.js"></script>
<script type="text/javascript" src="https://js.live.net/v7.2/OneDrive.js"></script>


</head>
<body>


<div class="scrollclass">
<input type="hidden" id="signerCountryCode" value="${signerCountryCode}"/>
<input type="hidden" id="authSignEmudha" value="${authSignEmudha}"/>

	<input type="hidden" id="contextPath" value="<%=appUrl%>/" />
	<div id="loader1" class="loader2" style="display: none">
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
	<!--  <div class="PDF_Loading_view">
		<div class="PDF_Innner_loading text-center">
			<img src="<%=appUrl%>/images/1.0/logo_inner.png" /> <br /> <br />
			<div class="progress">
				<div class="progress-bar" id="progress" role="progressbar"
					aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
					style="width: 0%">
					<span class="sr-only">70% Complete</span>
				</div>
			</div>
			<p>Loading document, Please wait !</p>
		</div>
	</div>-->
	<nav class="navbar navbar-default inner-header">
		<div class="">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header" style="width: 100%">

				<a class="navbar-brand removecursor hidden-xs" href="#"><img
					src="<%=appUrl%>/images/drysignlogo.png" /></a>
					<span class="logo-lg visible-xs devicelogo"><img  class="img-responsive" src="<%=appUrl %>/images/1.0/logo1.png" height="auto"  alt="logo"> </span> 

				<div class="pull-right rightbutton">
					<span class="welcm"><spring:message code="label.welcm" /> <c:out
							value="${signerName}"></c:out></span>
					<!--  <a class="btn" style=" text-decoration: none; " onclick="openMySignature();" href="#">HELLO</a> -->
					<div style="display: none;">
					<button id="qa_sign" value="1" class="btn has-spinner PDF-btn-pri tooltip1"
						
						onclick="qualityImprove(event);" data-toggle="tooltip">
						<!-- <i class="fa fa-magic" aria-hidden="true"></i> -->
						<img src="<%=appUrl%>/images/Enhance-document.png" >
						<span class="tooltiptext tooltip-bottom"><spring:message code="label.enhance"/></span>
					</button>
                    </div>
					<button type="button" id="download"
						class="btn PDF-btn-red tooltip1" value="download" onclick="download();">
						<!-- <i class="fa fa-download" aria-hidden="true"></i> -->
						<img src="<%=appUrl%>/images/download.png" >
						<span class="tooltiptext tooltip-bottom1"><spring:message code="label.blk_down"/></span>
					</button>
					<button type="button" id ="rejectbutton" class="btn PDF-btn-reject tooltip1" value="reject">
						<!-- <i class="fa fa-file-image-o" aria-hidden="true"></i> -->
						<img src="<%=appUrl%>/images/Reject.png" >
						<span class="tooltiptext tooltip-bottom2">Reject</span>
					</button>
					<button type="button" id="finish"
						class="btn has-spinner PDF-btn-pri tooltip1" onclick="finishDocumentSign();"
						 disabled>
						<!-- <i class="fa fa-file" aria-hidden="true"></i> -->
						<img src="<%=appUrl%>/images/finish.png" >
						<span class="tooltiptext tooltip-bottom3"><spring:message code="label.finish"/></span>
					</button>

					<button type="button" id="refreshSign"
						style="display: none;"
						class="btn has-spinner PDF-btn-pri tooltip1" onclick="refreshSign();"
						>
						<img src="<%=appUrl%>/images/sign-document.png" >
						<span class="tooltiptext tooltip-bottom3">Sign Document</span>
					</button>
					
				</div>
			</div>
		</div>
		<div class="progress">
			<div class="progress-bar" id="progress_bar" role="progressbar"
				aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
				style="width: 0%">
				<span class="sr-only"><spring:message code="label.complete"/></span>
			</div>
		</div>
	</nav>
	<div class="container-fluid" style="margin-top: 100px;">
		<!-- <div id="pixelTracker">Result goes here</div> -->
		<!--  <div class="col-md-2" id="show_arrow"> -->

		<!-- 				</div> -->

		<div class="row PDF_Main  margTB20" id="pdfview">
			<!-- div class="PDF_View"  style="width: 895px; max-width: 100%; overflow-x: scroll;"}" -->
			<div class="PDF_View">
				<div class="PDF_arrow">
					<img class="arrow1" id="arrowright1"
						src="<%=appUrl%>/images/arrowright1.png" style="display: none;">
					<img class="arrow1" id="arrowdown"
						src="<%=appUrl%>/images/arrowdown.png" style="display: none;">
					<img class="arrow1" id="arrowup"
						src="<%=appUrl%>/images/arrowup.png" style="display: none;">
					<img class="arrow1" id="completed"
						src="<%=appUrl%>/images/completed.png"
						style="position: fixed; width: 40px; height: 40px;border-radius:50px; bottom: 10; right: 5px; z-index: 1; display: none;">
				</div>
				<div class="page">
					<div class='document-reader' id="document-reader">

						<input type="hidden" id="fileName"
							value="<c:out value="${fileName}"></c:out>" />

						<%-- 			 	 <c:forEach var="page" begin="1" end="${numpages}">
					<div id="page_${page}" data-doc-id="${page}">
						 <img width="${pwidth}px" height="${pheight}px"  src="<%=appUrl %>/viewDocument?filename=${efaFile}&page=${page}&userId=${userId}"  onload="loadImage()" />
					</div>
					<!-- class="img-responsive img-center" -->
				</c:forEach>  --%>

					</div>
					<!-- <img width="890px" height="1152px" class="loadImage" onload="loadImage()" src="http://drysign.global:80/img?fileid=689&filename=2OfferLetterHourlyTemplatewithDSlanguage_2015Updated (1).pdf&page=1">
                <div class="page-number">Page 1</div>
                
                <img width="890px" height="1152px" class="loadImage" onload="loadImage()" src="http://drysign.global:80/img?fileid=689&filename=2OfferLetterHourlyTemplatewithDSlanguage_2015Updated (1).pdf&page=2">
                <div class="page-number">Page 2</div>
                
                 <img width="890px" height="1152px" class="loadImage" onload="loadImage()" src="http://drysign.global:80/img?fileid=689&filename=2OfferLetterHourlyTemplatewithDSlanguage_2015Updated (1).pdf&page=2">
                <div class="page-number">Page 3</div>
                
                 <img width="890px" height="1152px" class="loadImage" onload="loadImage()" src="http://drysign.global:80/img?fileid=689&filename=2OfferLetterHourlyTemplatewithDSlanguage_2015Updated (1).pdf&page=2">
                <div class="page-number">Page 4</div> -->

					<%-- <img width="890px" height="1152px" src="<%=appUrl %>/images/PDF_view.jpg">
                <div class="page-number">3</div> --%>
				</div>
				<%-- <img class="img-responsive" src="<%=appUrl %>/images/PDF_view.jpg"/> --%>
			</div>
		</div>
		<div id="cosentAccept" style="display: none;">
			<spring:message code="label.accptconsent" />

			<button type="button" class="btn-link" onclick="readandaccept()">
				<spring:message code="label.readconsent" />
			</button>
		</div>

	</div>
	<!--/.Footer -->
	<div class="footer">
		<div class="text-center">
			<!-- <span class="icon-language"></span> ENGLISH | -->
			&copy;
			<script>document.write(new Date().getFullYear())</script>
			<spring:message code="label.company" />
		</div>
	</div>
	<!-- Draw Signature -->
	<div class="signature-sign">
		<div class="header">
			<a class="close" href="#"><span class="icon-close"></span></a>
		</div>
		<ul class="nav nav-tabs self-sign">
			<li id="sDraw"><a href="#draw" data-toggle="tab"><spring:message
						code="label.drw" /></a></li>
			<li id="tDraw" style="height: 43px;"><a href="#tdraw"
				data-toggle="tab"><spring:message code="label.drw" /></a></li>
			<li id="sType" style="height: 43px;"><a href="#type"
				data-toggle="tab"><spring:message code="label.type" /></a></li>
			<li id="uType" style="height: 43px;"><a href="#upload"
				data-toggle="tab"><spring:message code="label.upld" /></a></li>
			<li id="mSignature" style="height: 43px;"><a href="#mysignature"
				data-toggle="tab"><spring:message code="label.saved" /></a></li>


		</ul>
		<div class="tab-content self_sing_tab ">
			<%-- 			<div class="tab-pane" id="draw">
				<div class="row margTB20"></div>
				<div class="row margB20">
					<div class="col-xs-12 text-right">
	 <button class="btn btn-light"  id="clear">Clear</button>						   
	<button class="btn btn-blue" id="save">Save</button>
					</div>
				</div>
				<div class="row margTB20">
					<div class="col-xs-12">
						<div class="wrapper" style="background-color: #fcfcfc">
							<canvas id="signature-pad" class="signature-pad" width=320 height=200>
							</canvas>
						</div>
					</div>
					<div class="col-xs-12">
						<input type="checkbox" id="default_sign_check_sdraw"
							name="default_sign_check"> Use this as default signature
					</div>
					<div class="col-xs-12" id="drawsignature_error"
						style="display: none">
						<div class="alert alert-danger">Please draw your signature.
						</div>
					</div>
				</div>
			</div> --%>
			<div class="tab-pane" id="upload">
				<div class="row margTB20"></div>
				<div class="row margB20">
					<div class="col-xs-12 text-right">
						<a class="btn btn-light" onclick="clearUploadSignature();"><spring:message
								code="label.clr" /></a> <a class="btn btn-primary"
							onclick="saveUploadSignature();"><spring:message
								code="label.save" /></a>
					</div>
				</div>
				<div class="row margTB20" id="show_upload_signature">
					<div class="col-xs-12 head3_0 text-center">
						<spring:message code="label.upld_pic" />
					</div>
					<br> <br>
					<div class="col-xs-12 text-center">
						<div id="upload_signature">

							<label class="btn-bs-file"> <i class="fa fa-upload point"
								aria-hidden="true"></i> <input type='file' id="imgInp"
								class="demoInputBox" accept=".png, .jpg, .jpeg, .bmp"/>
							</label>

							<button data-toggle="tooltip" class="red-tooltip"
								data-placement="top" title="Google Drive" type="submit" class=""
								id="googlePic"
								style="border: 0; background: transparent; right: -20px; padding: 0 5px; margin: 0;">
								<img src="<%=appUrl%>/images/Drive.png" width="19" height="19"
									alt="submit" />
							</button>

							<button data-toggle="tooltip" class="red-tooltip"
								data-placement="top" title="Dropbox" type="submit" class=""
								id="dropbox"
								style="border: 0; background: transparent; right: -50px; padding: 0 5px; margin: 0;">
								<img src="<%=appUrl%>/images/Dropbox.svg" width="20" height="20"
									alt="submit" />
							</button>

							<button data-toggle="tooltip" class="red-tooltip"
								data-placement="top" title="OneDrive" type="submit" class=""
								id="onedrive" onclick="launchOneDrivePicker()"
								style="border: 0; background: transparent; right: -90px; padding: 0 5px; margin: 0;">
								<img src="<%=appUrl%>/images/Cloud.svg" width="25"
									height="25" alt="submit" />
							</button>


							<!-- Egnyte -->
							<!--	<button onclick="return openEgnyteWindow('app/document/egnyteSign')" data-toggle="tooltip" class="red-tooltip" data-placement="top" title="egnyte" type="submit" class="" id="egnyte1" style="border: 0;background: transparent;right: -128px; padding: 0; margin: 0;height: 36px;top: 8px;">
									<img src="<%=appUrl%>/images/egnyte.png" width="20" height="20" alt="submit" />
								</button>-->

						</div>

					</div>

					<div class="col-xs-12 text-center">
						<br> <br>
						<p class="text-warning">
							<spring:message code="label.file_sz" />
						</p>
						<p class="text-warning">
							<spring:message code="label.file_frmt" />
						</p>
					</div>
				</div>
				<div class="row margTB20" id="show_upload_error_signature">

					<div class="alert alert-danger" id="file_error"
						style="display: none" ></div>
				</div>
				<div class="col-xs-12 text-center">
					<img id="blah" src="" class="img-thumbnail" width="750px"
						height="186px" alt="" style="display: none" />
				</div>
				<div class="checkbox checkbox-primary"
					id="default_sign_check_upload_show">
					<input type="checkbox" class="checkbox2"
						id="default_sign_check_upload" name="default_sign_check"><label
						for="default_sign_check_upload" style="margin-top: 20px;"><spring:message
							code="label.defaultpic" /></label>
				</div>

				<!--  <div class="col-xs-12" id="default_sign_check_upload_show"
					style="display: none">
					<input type="checkbox" id="default_sign_check_upload"
						name="default_sign_check"> <spring:message code="label.defaultpic"/>
				</div>-->
			</div>
			<div class="tab-pane" id="mysignature">
				<div class="row margTB20"></div>
				<div class="row margB20">
					<div class="col-xs-12 text-right">
						<a class="btn btn-primary" id="saveMySignature" href="#/"><spring:message
								code="label.save" /></a>
					</div>
				</div>
				<div class="row margTB20">
					<div class="col-xs-12">
						<c:set var="mysignature" value="${signature}" />
						<c:choose>
							<c:when test="${mysignature == null}">
								<img id="save_my_signature"
									style="box-shadow: 9px 11px 28px -12px #080808; max-width: 100%"
									src="" />
							</c:when>
							<c:otherwise>
								<img id="save_my_signature"
									style="box-shadow: 9px 11px 28px -12px #080808; max-width: 100%"
									src="<c:out value="${signature}"></c:out>" />
							</c:otherwise>
						</c:choose>

					</div>

					<div class="col-xs-12" id="drawsignature_error"
						style="display: none">
						<div class="alert alert-danger">
							<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>
							<spring:message code="label.savedsign" />
							<a class="close" data-hide="alert" aria-label="close"
								onclick="$(this).parent().hide();">&times;</a>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane" id="type">
				<div class="row margTB20">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="input-field">
							<label for="last_name" class="dashboard_typeName"><spring:message
									code="label.typesign" /></label> <input id="typeName" maxlength=36
								type="text" value="<c:out value="${signerName}"></c:out>"
								class="form-control">

						</div>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12 text-right">
						<!-- <a class="text-red" href="#">Reset</a> -->
						<a class="btn btn-primary" href="#/"
							onclick="saveTypeSignature();"><spring:message
								code="label.save" /></a>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12"></div>
				</div>

				<div>
					<div class="col-xs-12">
						<div class="alert alert-danger" id="signature-type-error"
							style="display: none"></div>
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
				<div class="col-xs-12">
					<div class="checkbox checkbox-primary" style="margin-bottom: 80px;">
						<input type="checkbox" class="checkbox2"
							id="default_sign_check_type" name="default_sign_check"><label
							for="default_sign_check_type"><spring:message
								code="label.defaultpic" /></label>
					</div>
				</div>

			</div>
			<div class="tab-pane" id="tdraw">
				<div class="row margTB20"></div>
				<div class="row margB20">
					<div class="col-xs-12 text-right">
						<button class="btn btn-light" id="clearSignaturepad">
							<spring:message code="label.clr" />
						</button>
						<button class="btn btn-primary" id="saveSignaturepad">
							<spring:message code="label.save" />
						</button>
					</div>
				</div>
				<div class="row margTB20">
					<div class="col-xs-12 nopadding">
						<div class="wrapperpad" style="background-color: #fcfcfc">
							<canvas id="signaturepad" class="signature-pad" width=310
								height=200>
							</canvas>
						</div>
					</div>
				<div class="col-xs-12" style="padding:6px;">
					<div id="tdrawsignature_error"
						style="display: none">
						<div class="alert alert-danger">
							<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>
							<spring:message code="label.drw_sign" />
							<a class="close2" data-hide="alert" aria-label="close"
								onclick="$('#tdrawsignature_error').hide();">&times;</a>
						</div>
					</div>
					</div>

					<div class="col-xs-12 row">
						<div class="checkbox checkbox-primary">
							<input type="checkbox" class="checkbox2"
								id="default_sign_check_tdraw" name="default_sign_check"><label
								for="default_sign_check_tdraw"><spring:message
									code="label.defaultpic" /></label>
						</div>
					</div>

				</div>
			</div>
		</div>
		<input type="text" id="filenamedrive" type="text"
			style="display: none;"> <input type="hidden"
			id="fileIddrive">
	</div>

	<div class="modal fade" id="PModal" tabindex="-1" role="dialog"
		style="z-index: 100000000;" aria-labelledby="myModalLabel"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" id="consentModal">
			<div class="modal-content modal-content-custom">
				<div class="modal-header model-header-background">
					<!-- Consents to Proceed Electronically -->
					<!-- <button type="button" class="close no-print" title="close"
						data-dismiss="modal">
						<i class="glyphicon glyphicon-remove"></i>
					</button> -->
					<div class="logo_pop">
						<img  class="consent_logo" src="<%=appUrl%>/images/drysignlogo.png">
					</div>
				</div>

				<div class="text-center label-heading">
					<spring:message code="label.consent.consentheading" />
				</div>
				<div style="border:1px solid #ccc; margin:20px;">
				<div class="cookies-modal-body print_body model-body-custom">
					<p>
						<spring:message code="label.consent.consentnote1" />
					</p>
					<br>
					<p>
						<spring:message code="label.consent.consentnote2" />
					</p>
					<ul>
						<li><p class="sub-cat-id">1.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.consent1" />
							</p></li>
						<li><p class="sub-cat-id">2.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.consent2" />
							</p></li>
						<li><p class="sub-cat-id">3.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.consent3" />
							</p></li>
						<li><p class="sub-cat-id">4.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.consent4" />
							</p></li>
						<li><p class="sub-cat-id">5.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.consent5" />
							</p></li>
						<li><p class="sub-cat-id">6.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.consent6" />
							</p></li>
						<li><p class="sub-cat-id">7.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.consent7" />
							</p></li>

					</ul>

					<p class="boldtxt">
						<spring:message code="label.consent.consentagreement" />
					</p>
					<ul>
						<li><p class="sub-cat-id">1.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.agreementcomment1" />
							</p></li>

						<li><p class="sub-cat-id">2.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.agreementcomment2" />
							</p></li>

						<li><p class="sub-cat-id">3.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.agreementcomment3" />
							</p></li>

						<li><p class="sub-cat-id">4.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.agreementcomment4" />
							</p></li>

						<li><p class="sub-cat-id">5.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.agreementcomment5" />
							</p></li>

						<li><p class="sub-cat-id">6.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.agreementcomment6" />
							</p></li>

						<li><p class="sub-cat-id">7.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.agreementcomment7" />
							</p></li>

						<li><p class="sub-cat-id">8.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.agreementcomment8" />
							</p></li>

						<li><p class="sub-cat-id">9.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.agreementcomment9" />
							</p></li>

						<li><p class="sub-cat-id">10.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.agreementcomment10" />
							</p></li>

						<li><p class="sub-cat-id">11.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.agreementcomment11" />
							</p></li>
					</ul>

					<br>
					<p class="boldtxt">
						<spring:message code="label.consent.consentnote3" />
					</p>
					<ul>
						<li><p class="sub-cat-id">1.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.consentcomment1" />
							</p></li>

						<li><p class="sub-cat-id">2.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.consentcomment2" />
							</p></li>

						<li><p class="sub-cat-id">3.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.consentcomment3" />
							<p></li>

						<li><p class="sub-cat-id">4.</p>
							<p class="sub-cat-txt">
								<spring:message code="label.consent.consentcomment4" />
							</p></li>

					</ul>

					<br>
					<p class="boldtxt">
						<spring:message code="label.consent_decline" />
					</p>
				</div>
				</div>
				<div class="modal-footer">
					<div class="row">
						<div class="col-md-7 col-sm-7 col-xs-12 text-left">
							<div class="checkbox checkbox-primary">
								<input type="checkbox" class="filled-in checkbox2"
									id="checkbox2" /> <label for="checkbox2"> <spring:message
										code="label.selectelecto" />
								</label>
							</div>
							<label id="fileerror" class="error" />

						</div>
						<div class="col-md-5 col-sm-5 col-xs-12 text-right">
							<button type="button" class="btn btn-light"
								onclick="closeCurrentTab()">
								<spring:message code="label.s_dec" />
							</button>
							<!-- <button class="btn-link" onclick="checkedCheckbox();" id="aa" data-dismiss="modal" disabled>I Agree</button> -->
							<button type="button" class="btn btn-primary" id="agrd">
								<spring:message code="label.agree" />
							</button>
						</div>
					</div>
					<!-- <div class="col-md-12 col-xs-12 text-left">
                        <input type="checkbox" class="filled-in" id="checkbox2"  >
                        <label for="checkbox2"> By selecting this, you agree to our Consent to Proceed Electronically </label>
                        <br><label id="fileerror" style="color:red"> </label>
                 </div> -->



				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="passwordDialog" role="dialog" style="z-index: 1000000000;"
		data-backdrop="static" data-keyboard="false">
	  <div class="modal-dialog modal-md" id="consentModalForPassword">
	    <div class="modal-content modal-content-custom">
		<div class="modal-header">					
					<h3><spring:message code="label.proceed_password"/></h3>
				</div>
		
			<div class="col-md-12">	
			<span toggle="#doc_key" class="fa fa-fw fa-eye field-icon toggle-password pull-right" id="toggle_password_eye"></span>							 
					<input type="password" class="doc_key form-control" name="doc_key" id="doc_key" class="form-control" maxlength="20" autocomplete="new-password"/>
					<div><label id="Message1" class="error" /></div>
			</div> 
					
			<div class="modal-footer">
					<div class="row">						
						<div class="col-md-12 col-sm-12 col-xs-12 text-right paswordSubmitBtn">
							<button type="button" class="btn btn-blue pull-right" id="submit_pwd" style="padding: 10px 15px!important;"
								onclick="submitPassword()">
								<spring:message code="label.submit" />
							</button>							
						</div>
					</div>
				</div>
		</div>
		</div>
	</div>
	
<div class="Messagereject" id="rejectdocinitiated" style="width: 500px !important">
	<form action="" class="formName" id="form">
		<div class="modal-header">
			<span class="model-title"><spring:message code="label.areYouSureRejectDoc"/></span>
		</div>
		<div class="modal-body">
			<div class="deleteaccount">
				<p>
					<spring:message code="label.comments"/><span class="redstar">*</span>
				</p>
				<textarea id="rejectmessage" onchange="$('#rejectreasonMessage').hide()" name="message"
					class="form-control messagedelete" maxlength="500" style="width:100% !important;"></textarea>
				<span id='rejectreasonMessage' class="error" hidden = "hidden"><spring:message code="label.resonRejectDocument"/>.</span>
				<div>
					<div class="text-right">
						<button type="button" class="btn btn-light"
							onclick="hiderejectpopup();">
							<spring:message code="label.cancel" />
						</button>
						<button type="button" class="btn btn-blue" id=""
							onclick="docRejectfirmation();">
							<spring:message code="label.submit" />
						</button>

					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<div class="modal fade" id="eMudhra" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					
					<div class="modal-body ">
						<div class="text-center margB25"><img src="<%=appUrl %>/images/drysignlogo.png" height="auto"  alt="logo"></div>
						<!--  Below code change to resolve DrySign:1325 by Rupali.Shinde  -->
						
						<h3 class="margB25">eMudhra eSign (IN) is requesting permission to:</h3>
						
						<ul class="margB25">
							<li><h4>Read and apply digital signatures to documents during signing.</h4></li>
							<li><h4>Read document content during digital signing.</h4></li>
						</ul>
						
						 <p>  
						 	The application you are connecting to is not provided by 
							DrySign. By clicking Accept, you are allowing the application to 
							use your information in accordance with their 
							respective terms of service and privacy policies.
						</p>
				<div class="row">
				  <div class="col-sm-12 col-md-12 text-right">
					      <button type="button" id="buttonCancel" class="btn btn-light"  data-dismiss="modal" onclick = "closeOnCancel();"><spring:message code="label.cancel"/></button>
					      <button type="button"  class="btn btn-primary" onclick = "redirectToEmudhraGroupSign();">Accept</button>
					     
						 </div>  
              </div>
					</div>
				</div>
			</div>
		</div>

<div class="overlay-bg"></div>
	<script type="text/javascript" src="<%=appUrl%>/js/utility.js"></script>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.browser.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.js"></script>
	
<script>
$('#rejectbutton').click(function(){
	//alert('hi');
	$("#rejectdocinitiated").show();
	$(".overlay-bg").show();
	 
});

function closeOnCancel(){
	$("#eMudhra").hide();
}


function hiderejectpopup(){
	$("#rejectdocinitiated").hide();
	$("#rejectreasonMessage").hide();
	$("#rejectmessage").val("");
	$(".overlay-bg").hide();
}

function finishDocumentSign(){
	
	var countryCode= $("#signerCountryCode").val();
	var isEmudhra = $("#authSignEmudha").val();
	/* alert(countryCode);
	alert(isEmudhra); */
	if(countryCode == "IN" && isEmudhra == "true"){
		$("#eMudhra").modal('toggle');
	}else{
		saveDocument();
	}
}

function docRejectfirmation(){
	var message =  document.getElementById('rejectmessage').value.trim();
		if(message=="" ){
			$("#rejectreasonMessage").show();
		}else{
			$("#rejectdocinitiated").hide();
			$(".overlay-bg").hide();
			var jsonArray = [];
			var contextPath=$("#contextPath").val();
			var commentArea = message;
			var fname = escape($("#fileName").val());
			var token = $("#token").val();
			var returnURL = $("#returnURL").val();
			var token1 = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var info = "?token="+token;
			var item = {};
			
				item ["comments"] = commentArea;
				item ["documentName"] = fname;
				item ["termCond"] = $("#checkbox2").val();
			jsonArray.push(item);
			
			console.log("jsonArray"+JSON.stringify(jsonArray));
		  	 $.ajax({
				type : "POST",
				url : "rejectdocument"+info,
				dataType: 'json', 
			    data: JSON.stringify(jsonArray),
			    contentType: "application/json;",
			    beforeSend : function(xhr) {	         
			    	//$(btn).buttonLoader('start');
			    	$("#loader1").show();
			    	xhr.setRequestHeader(header, token1);
			    },
			    complete: function () {
			    	//$(btn).buttonLoader('stop');
			    	$("#loader1").hide();
			    },
		        success : function(response) { 
		        	if(response == "500"){
		        		if(location.href.indexOf("dashboard")!=-1){
		        			var pendingPageURL=appUrl+"/app/myfiles?tab=pending";
		        			window.location.href = "rejectPage?returnURL="+pendingPageURL;	
		        		}
		        		else if(returnURL !=''){
		        			console.log("returnURL===>"+returnURL);
		        			window.location.href = "rejectPage?returnURL="+returnURL;	
		            	}
		        		else{
		        			window.location.href = "rejectDoc";	
		        		}
		                if(redirecturl != "" || redirecturl.trim() !="")
		            	{	
		                	$(".page").hide();
			            	$('#successMessage').modal('show');
			                $("#header").hide();
			                $("#view-docrender").hide();
			                $(".form-control").hide();
			                $("#nav_down").hide();
		            	}else{ 	
		            	 	$(".page").hide();
			            	$('#successMessage').modal('show');
			            	$("#view-docrender").hide();
			                $("#header").hide();
			                $(".form-control").hide();
			                $("#nav_down").hide();
		            	}	
		          } else if(response == "502"){
		        	 	 window.location.href = "error";
		          }else{
		                alert('<spring:message code="label.errorSaving"/>');
		          }
				} 
			}); 
		} //else end
}//rejectdoc method end


	/* -----------production page----------------*/
	var appUrl="<%=appUrl%>";
	jQuery(document).ready(function($){
		
		var maxWidth  = $('.page').width();
		var maxHeight = $('.page').height();

		//$(window).resize(function(evt) {
			
		$(window).on("load resize",function(evt){
		    var $window = $(window);
		    var width = $window.width();
		    var height = $window.height();
		    var scale;

		    // early exit
		    if(width >= maxWidth && height >= maxHeight) {
		        $('.page').css({'-webkit-transform': ''});
		        $('.page').css({ width: '', height: '' });
		        return;
		    }
		    
		    scale = Math.min(width/maxWidth, height/maxHeight);
		    
		    $('.page').css({'-webkit-transform': 'scale(' + scale + ')'});
		    $('.page').css({ width: maxWidth * scale, height: maxHeight * scale });
		    $('.page').css({'-webkit-transform-origin': '0 0'});
		    //transform-origin
		});
		$(window).resize(function(){
		    // your code
		    var windowWidth=$(window).width();
		   // var mainContainerWidth=windowWidth-100; // For example
		    //$(".page").css({"width":windowWidth+"px"});
		});
	  
		    
		});
		
</script>
	<script type="text/javascript">

	<!-- close current tab -->
	function closeCurrentTab(){
		window.removeEventListener('scroll', noScroll);
		    		 var docId="<c:out value="${docId}"></c:out>";
	    			var fileName="<c:out value="${fileName}"></c:out>";
	    			var userId="<c:out value="${signRequestedBy}"></c:out>";	
	    			var email="<c:out value="${email}"></c:out>";
	    			var decline=true;
	    		getImageRender(docId,fileName,userId,email,decline);
		$("#consentModal").hide();
		$("#PModal").hide();
		//$("#passwordDialog").hide();
		$("#finish").hide();
		$('.modal-backdrop').hide();
		$("#refreshSign").show();
		 $("#rejectbutton").show();
		 $("#download").show();
		 $("#qa_sign").show();
	
	}
			
     function refreshSign(){
    	 window.location.reload();
    	 
     }
	function readandaccept(){
		
		$("#pdfview").show();
		$("#consentModal").show();
	}
	//checkbox value
 $("#checkbox2").on('change', function() {
				  if ($(this).is(':checked')) {
				    $(this).attr('value', 'true');
				    //document.getElementById("aa").disabled = false; //disable enable button on click
				  } else {
				    $(this).attr('value', 'false');
				 // document.getElementById("aa").disabled = true;
				  }
				 
				});

	
	$(function () {
	    $("#agrd").on('click', function() {
	      
	    	window.removeEventListener('scroll', noScroll);
	    	//$(window).off('scroll');
	       
	   	     //body.style('overflow', 'scroll');
	    	  //$('').unbind('mousewheel touchmove', lockScroll);
	        var s = $('#checkbox2').val();
	    	///alert(s);
	    	if(s=="true"){
	    		 var docId="<c:out value="${docId}"></c:out>";
	    			var fileName="<c:out value="${fileName}"></c:out>";
	    			var userId="<c:out value="${signRequestedBy}"></c:out>";
	    			var email="<c:out value="${email}"></c:out>";
	    			var decline=false;
	    		getImageRender(docId,fileName,userId,email,decline);
	    		$('#PModal').modal('hide');
	    		//$("#passwordDialog").hide();
	    	
	    }else{
	    	$("#fileerror").show();
			$("#fileerror").html('<spring:message code="label.consenterror"/>');
	    }
	    });
	    
	});

</script>

	<script>	

$(window).on("load resize", function() {
    var viewportWidth = $(window).width();
    if (viewportWidth < 768) {
	(function($) {
            $(document).ready(function() {
				//alert('hi');
              $( ".m-view" ).prependTo( ".dropdown-menu li.bottom" );
 				$( ".m-view.user" ).prependTo( ".dropdown-menu" );  
            });
         }) (jQuery);
    }
});	

//Guide me on click- Anirudh
$(".PDF_arrow #arrowdown").on('click touchstart touchmove',function(){
    console.log("The paragraph was clicked.");
    var num =$("#progresscount").val();
    for(var i=0;i<num;i++)
    {
    	var val =$("#field_"+i).val();
    	//console.log("value-"+val);
		if(val == ''){
			//changes for defect 1479
			if(navigator.userAgent.match(/(iPod|iPhone|Android)/)) {           
			    document.querySelector("#field_"+i).scrollIntoView({ behavior: 'smooth', block:'center'});
			} else {
			$('html, body').animate({scrollTop:$("#field_"+i).offset().top -100}, 2000);
			}	

			//$('html, body').animate({scrollTop:$("#field_"+i).offset().top -100}, 2000);
			//window.scrollTo(0, $("#field_"+i).offset().top -100);
			
			//Changes for defect 1532
			$("#arrowdown").show(1).delay(1500).hide(1);
			document.getElementById("arrowup").style.display = "none";
			document.getElementById("completed").style.display = "none";
			$("#arrowright1").delay(1500).show(0);
			document.getElementById("arrowright1").style.top = $("#field_"+i).offset().top - 132+"px";
			//Changes End
			break;
		}
    	
    }
    
});

$(".PDF_arrow #arrowup").on('click touchstart touchmove',function(){
    console.log("The paragraph was clicked.");
    var num =$("#progresscount").val();
    for(var i=0;i<num;i++)
    {
    	var val =$("#field_"+i).val();
    	//console.log("value-"+val);
		if(val == ''){
			//cahnges for defect 1479
			if(navigator.userAgent.match(/(iPod|iPhone|Android)/)) {           
			    document.querySelector("#field_"+i).scrollIntoView({ behavior: 'smooth', block:'center'});
			} else {
			$('html, body').animate({scrollTop:$("#field_"+i).offset().top -100}, 2000);
			}
			//$('html, body').animate({scrollTop:$("#field_"+i).offset().top -100}, 2000);
			//.scrollTo(0, $("#field_"+i).offset().top -100);
			
			//Changes for defect 1532
			document.getElementById("arrowdown").style.display = "none";
			$("#arrowup").show(1).delay(1500).hide(1);
			document.getElementById("completed").style.display = "none";
			$("#arrowright1").delay(1500).show(0);
			document.getElementById("arrowright1").style.top = $("#field_"+i).offset().top - 132+"px";
			//Changes end
			break;
		}
    	
    }
    
});

var key="";
$(document).ready(function(){
	$("#loader1").show();
	currentURL = window.location.href;
   var keyURL = currentURL.split("=");
   key = keyURL[1];
   var docKeyFlag = "<c:out value="${docFlag}"></c:out>";
   //alert("DocKeyFlag:"+docKeyFlag);
   
   
   if(docKeyFlag == '1'){
	  
	  $("#passwordDialog").modal('show');
	   //$("#PModal").modal('hide');
	  	
	    if( $("#passwordDialog").modal('show')){ 	
		  $("#loader1").hide();
	  
		  window.addEventListener('scroll', noScroll);
		   }  
	   }else{
		  	  
		$("#PModal").modal('show');	 
		$("#passwordDialog").modal('hide');
		  if( $("#PModal").modal('show')){ 
		  $("#loader1").hide();
	  
		  window.addEventListener('scroll', noScroll);
		  }  
	   } 	
});

// Code for Defect 1459
$("#doc_key").keyup(function(event) {
    if (event.keyCode === 13) {
        $("#submit_pwd").click();
    }
});
// Code End

 function submitPassword(){
	 //encrypt();
	 var docKey = $("#doc_key").val();
		var docId="<c:out value="${docId}"></c:out>";  		 
	    var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath = $("#contextPath").val();
		var dt={};
		dt.docId=docId;
		dt.docKey=docKey;
		
		$.ajax({
			contentType : 'application/json; charset=utf-8',
			type : "POST",
			url : "validatePassword",
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
			if(res.validPassword==true){
				$("#PModal").modal('show');	 
				$("#passwordDialog").modal('hide');
				  if( $("#PModal").modal('show')){ 
				  $("#loader1").hide();
			  
				  window.addEventListener('scroll', noScroll);
				  }  
			}
			else{
				$("#PModal").modal('hide');
				$('#Message1').show().html("<span class='required'><spring:message code="label.incorrect_password"/></span>").fadeOut(8000);
			}
		}
	
      });
		
	 
	}
	
 
function noScroll() {
	  window.scrollTo(0, 0);
	}

function download(){
	//console.log("download click : "+key);
	   var docId="<c:out value="${docId}"></c:out>";
	   var userId="<c:out value="${signRequestedBy}"></c:out>";
	   var info = "?docId="+docId+"&userId="+userId+"&key="+key;
	var contextPath=$("#contextPath").val();
	//console.log(contextPath);
		 $.ajax({
		type : "GET",
		url : contextPath+"reviewFile"+info,
		success : function(response) {
			
			if(response){
				
				//alert("Your file is verified"+response);
				window.location.assign(contextPath+'downloaddoc/external?fileName='+response+"&docId="+docId+"&userId="+userId);
			
			}else{
				alert("<spring:message code="label.comp_err_ver"/>");
			}
			

		}
	}); 
	}

$(document).ready(function(){
	
	
	//Guide me- Anirudh
	
	//alert(num);
	//mousemove mousescroll
    $(window).bind('touchmove keyup scroll mousemove',function (event) {

       // $(window).scroll(function(){ mousedown wheel DOMMouseScroll mousewheel   'body,html'
        /*debugging*/
		var num =$("#progresscount").val();
        var scrollBottom = $(window).scrollTop() + $(window).height();
      //  $("#infoText").text(" Top-"+scrollBottom+"Window scrollTop: "+$(window).scrollTop()+" Scroll bottom "+scrollBottom+"Top Offsets (service, clients):"+$("#formElement1").offset().top+", "+$("#formElement2").offset().top);
        /*end-debugging*/
        var test ;
for(var i=0;i<num;i++){
var a= $("#field_"+i).offset().top;
//console.log("value of a - "+a);
        if(scrollBottom < a){
        	var val =$("#field_"+i).val();
        	//console.log("value-"+val);
    		if(val == ''){
        document.getElementById("arrowdown").style.top = $(window).height()-150+"px";
		document.getElementById("arrowdown").style.display = "block";
		//document.getElementById("arrowdown").style.marginLeft = "2%";
		document.getElementById("arrowright1").style.display = "none";
		document.getElementById("completed").style.display = "none";
		console.log("In down");
		break;
		}}
	//	else if($(window).scrollTop() > a)
	//	{
	//	document.getElementById("arrowright1").style.display = "none";
	//	document.getElementById("arrowdown").style.display = "none";
	//	document.getElementById("arrowup").style.top = $(window).scrollTop()+100+"px";
	//	document.getElementById("arrowup").style.display = "block";
	//	} 
        else if (scrollBottom >= ($("#field_"+i).offset().top)) {
		var val =$("#field_"+i).val();
		if(val == ''){
              //  console.log("To #ab"+i);
				//$("#show_arrow").append("<img class='arrow' id='arrowright1' src='img/batman.png' style=' position:absolute; width: 100px; height: 100px; top:"+a+"px; left:80px;'>");
				document.getElementById("arrowdown").style.display = "none";
				document.getElementById("arrowup").style.display = "none";
				document.getElementById("completed").style.display = "none";
				document.getElementById("arrowright1").style.display = "block";
				document.getElementById("arrowright1").style.top = a-132+"px";
				test=i;
			//	console.log("value of test- "+test);
				break;
				

            }
        }
}
if(typeof test !='undefined')
{
if($(window).scrollTop()>($("#field_"+test).offset().top)){
		var val =$("#field_"+test).val();
		if(val == ''){
		document.getElementById("arrowright1").style.display = "none";
		document.getElementById("arrowdown").style.display = "none";
		document.getElementById("completed").style.display = "none";
		document.getElementById("arrowup").style.top = $(window).scrollTop()+"px";
		document.getElementById("arrowup").style.display = "block";
		//document.getElementById("arrowup").style.marginLeft = "15px";
		}
}}
    }).scroll();
       
});

var fnm;
var pdfInfo2;
function getImageRender(docId,fileName,userId,email,decline){
	//alert();
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var contextPath=$("#contextPath").val();
	//alert($(".file-upload-input").attr('title'));
	

	var info = "?docId="+docId+"&fileName="+encodeURIComponent(fileName)+"&userId="+userId+"&email="+email;
	$.ajax({
		//contentType : 'application/json; charset=utf-8',
		type : "GET",
		url : contextPath+"getViewDocument"+info,
		//dataType : 'json',
		//data : JSON.stringify(data),
		beforeSend : function(xhr) {
			//$('#signupbtn').buttonLoader('start');
			$("#loader1").show();
			console.time("Loadingtime");
			xhr.setRequestHeader(header, token);
		},
		complete : function() {
			//$("#signupbtn").buttonLoader('stop');
		},
		success : function(response) {
			var numpages="";
			var filename="";
			var fileid="";
			var width="";
			var height="";
			var heights = [];
			pdfInfo2 = response;
			pdfInfo = pdfInfo2;
			if(response != 'failed'){
				var i=1;
				$.each( response, function( key, value ) {
						//  alert( key + ": " + value );
					if(key == "numpages" ){
						numpages=value;
						$("#numpages").val(numpages);
					}
					
					else if(key =="filename"){
						filename=value;
						fnm = filename;
						//alert(filename);
					}
					
					else if(key =="fileid"){
						fileid=value;
					}
					
					else if(key =="pwidth"){
						width=value;
						
					}
					
					else if(key =="pheight"){
						height=value;
						$("#pageHeight").val(height)
					}
					
					else if(key =="heights"){
						heights = value;
						$("#heights").val(heights);
					}
					
				});
				
			  		//$("#document-reader").append('<div class="drop" id="'+i+'"><img width="'+width+'px" height="'+height+'px" class="render-image" onload="loadImage()" src="'+contextPath+'getImgDocument?fileid='+fileid+'&filename='+filename+'&page='+i+'&userId='+userId+'"></div>');
					$.ajax({
						//contentType : 'application/json; charset=utf-8',
						type : "GET",
						url : contextPath+'getImgDocument?fileid='+fileid+'&filename='+encodeURIComponent(filename)+'&page=1&userId='+userId+'&numpages='+numpages+'&docId='+docId,
						async: false,
						//dataType : 'json',
						//data : JSON.stringify(data),
						beforeSend : function(xhr) {
							//$('#signupbtn').buttonLoader('start');
							$("#loader1").show();
							xhr.setRequestHeader(header, token);
						},
						complete : function() {
							//$("#signupbtn").buttonLoader('stop');
						},
						success : function(response) {
							//alert(response);
							
							if(response.indexOf('allPageImageJson')==-1){
								//alert("Calling getAllPages");
								//getAllPages(contextPath,fileid,filename,userId,numpages,docId,header,width,height);
								getAllPages(contextPath,fileid,filename,userId,numpages,docId,header,pdfInfo); 
							}
							else{
								//alert("Calling getAllPages1");
								var json=JSON.parse(response);
						    	if(json.allPageImageJson==true){
							    apppendAllpageJsonImgtoDoucment(docId,width,height,response,numpages,pdfInfo);
							    }
							 }
							
							/*if(response=="base64error"){
						        alert(response);		
							}
							else{
								getAllPages(contextPath,fileid,filename,userId,numpages,docId,header,width,height);
							}*/
							
							
						},
						error : function(response) {
							//alert("Calling getAllPages2");
							$("#document-reader").append('<div class="drop" id="'+i+'"><img width="'+width+'px" height="'+height+'px" class="render-image" onload="loadImage()" src="data:image/png;base64,'+<c:out value="response"></c:out>+'"></div>');
						},
					});
			  		
			}
			
			$("#loader1").hide();
			console.timeEnd("Loadingtime");
			if(!decline){
				//alert("Calling getAllPages3");	
				getFieldData();
			}
			
			
        	
		},
		error: function(xhr, textStatus, errorThrown)
		 {
		 	//alert('ajax loading error... ... getImage render ');
		 	console.log('ajax loading error... ... getImage render');
		 	return false;
		}
	})	
	    
}



	function getAllPages(contextPath,fileid,filename,userId,numpages,docId,header,pdfInfo){

		for (var i=1; i <= numpages; i++) {
	  		//$("#document-reader").append('<div class="drop" id="'+i+'"><img width="'+width+'px" height="'+height+'px" class="render-image" onload="loadImage()" src="'+contextPath+'getImgDocument?fileid='+fileid+'&filename='+filename+'&page='+i+'&userId='+userId+'"></div>');
	  		//alert("Calling :" + contextPath+'getImgDocument?fileid='+fileid+'&filename='+filename+'&page='+i+'&userId='+userId+'&numpages='+numpages+'&docId='+docId);
			$.ajax({
				//contentType : 'application/json; charset=utf-8',
				
				type : "GET",
				url : contextPath+'getImgDocument?fileid='+fileid+'&filename='+encodeURIComponent(filename)+'&page='+i+'&userId='+userId+'&numpages='+numpages+'&docId='+docId,
				async: false,
				//dataType : 'json',
				//data : JSON.stringify(data),
				beforeSend : function(xhr) {
					//$('#signupbtn').buttonLoader('start');
					$("#loader1").show();
					xhr.setRequestHeader(header, token);
				},
				complete : function() {
					//$("#signupbtn").buttonLoader('stop');
				},
				success : function(response) {	
					//alert('<div class="drop" id="'+i+'"><img width="' + pdfInfo.widths[i-1] + 'px" height="' + pdfInfo.heights[i-1] + 'px" class="render-image" onload="loadImage()" src="data:image/png;base64,'+response+'"></div>');
					//old $("#document-reader").append('<div class="drop" id="'+i+'"><img width="'+width+'px" height="'+height+'px" class="render-image" onload="loadImage()" src="data:image/png;base64,'+response+'"></div>');
					$("#document-reader").append('<div class="drop" id="'+i+'"><img width="' + pdfInfo.widths[i-1] + 'px" height="' + pdfInfo.heights[i-1] + 'px" class="render-image" onload="loadImage()" src="data:image/png;base64,'+<c:out value="response"></c:out>+'"></div>');
				},
				error : function(response) {
					$("#document-reader").append('<div class="drop" id="'+i+'"><img width="'+width+'px" height="'+height+'px" class="render-image" onload="loadImage()" src="data:image/png;base64,'+<c:out value="response"></c:out>+'"></div>');
				},
			});
	  		
	}	
		
	}


function apppendAllpageJsonImgtoDoucment(docId,width,height,response,numpages,pdfInfo){
	
	/*
	for (var i = 1; i <=numpages; i++) {
		$("#document-reader").append('<div class="drop" id="'+i+'"><img width="'+width+'px" height="'+height+'px" class="render-image" onload="loadImage()" src="data:image/png;base64,'+response.Images[i-1]+'"></div>');
	}*/
	
	var dopid;
	var src="";
	for (var i = 0; i <numpages; i++) {
     src="./docimages/"+docId+"/"+i+".png";
     dropid=i+1;
     //alert(pdfInfo.widths[i]);
     if(pdfInfo.widths[i]>818){
     	$(".scrollclass").addClass('addScroll');
      }
	$("#document-reader").append('<div class="drop" id="'+dropid+'"><img width="' + pdfInfo.widths[i] + 'px" height="' + pdfInfo.heights[i] + 'px" class="render-image" onload="loadImage()" src='+src+'></div>');
	}
	
}

function deleteImageDocument(){
	
	
}
    
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
	$("#signature-type-error").html("<spring:message code="label.typedsign"/>");
	return false;
}
if(typeSign == ""){
	$("#signature-type-error").show();
	$("#signature-type-error").html("<spring:message code="label.signtyped"/>");
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
	
	 var element = document.getElementById('typeName');
	 element.value = element.value.replace(/[^a-zA-Z ]+/, '');	
	
$("#signature-type-error").hide();
$("#signature-type-error").html('');
var typeValue=$("#typeName").val().fulltrim();
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
var contextPath=$("#contextPath").val();
$.ajax({  
     type : "GET",   
     url : contextPath+"typeSignature?imgType="+typeValue,  
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
     global: false,
     error : function(e) {  
      alert('Error:  typename keyup' );  
    //  console.log("ERROR : ", JSON.stringify(e));
     }  
    });  
});	
function getSigntype(){
$("#signature-type-error").hide();
$("#signature-type-error").html('');
var typeValue=$("#typeName").val().fulltrim();
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
var contextPath=$("#contextPath").val();
$.ajax({  
     type : "GET",   
     url : contextPath+"typeSignature",   
     data : "imgType="+typeValue,  
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
     global: false,
     error : function(e) {  
      alert('Error: getsigntype');   
    //  console.log("ERROR : ", JSON.stringify(e));
     }  
 });  
}

String.prototype.fulltrim = function() {
	  return this.replace(/(?:(?:^|\n)\s+|\s+(?:$|\n))/g, '').replace(/\s+/g, ' ');
	};
	
/*****************************Progress bar front ***********************************/
/* function countdown(callback) {
   var bar = document.getElementById('progress'),
   time = 0, max = 5,
   int = setInterval(function() {
       bar.style.width = Math.floor(100 * time++ / max) + '%';
       if (time - 1 == max) {
           clearInterval(int);
           // 600ms - width animation time
           callback && setTimeout(callback, 100);
       }
   }, 1000);
   
   
}

countdown(function() {
   $(".PDF_Loading_view").hide();
  
  
   var docId="<c:out value="${docId}"></c:out>";
	var fileName="<c:out value="${fileName}"></c:out>";
	var userId="<c:out value="${signRequestedBy}"></c:out>";
	
	//getImageRender(docId,fileName,userId);
  
}); */

function loadImage() {
	$("#loader1").fadeOut("slow");
}


/***********Drop all textfield and date and signature on document**************/
function getFieldData(){
	var contextPath=$("#contextPath").val();
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	var filename=escape("<c:out value="${filename}"></c:out>");
	var fileId="<c:out value="${fileId}"></c:out>";
	var email="<c:out value="${email}"></c:out>";		//vvv staticscan
	var newEmail=email.replace(/&#039;/g,"'"); 			//vvv staticscan

	if(dd<10) {
	    dd='0'+dd
	} 
	if(mm<10) {
	    mm='0'+mm
	} 
	today = mm+'/'+dd+'/'+yyyy;
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var pageHeight=$("#pageHeight").val();
$.ajax({  
    type : "GET",   
    url : contextPath+"getApplicationFieldData",   
    data : {"fname":filename,"fileid":fileId,"email":newEmail},  	//vvv //vvv staticscan    03April "email":email
 	dataType: 'json',
    contentType: "application/json; charset=utf-8",
    beforeSend : function(xhr) {	                
    	xhr.setRequestHeader(header, token);
    },
	success : function(response) {  
  	  if(response){
        var heights = $("#heights").val();
        heights = heights.split(",");
  		$("#fieldLength").val(response.length)
  		var count=1;
  		var signatureCount=0;
  		var totalCount=0;
  		
  		var digitalStampCount=0;		//vvv21Jan2021
  		
  		for ( var key =0; key < response.length; ++key) 
  		{
  			var newTextBoxDiv = $(document.createElement('div')).attr("id", 'mypage_' + key);
	   		var y = calculateY(response,key, heights);
  			//check field name  || response[key].fieldName =='textbox' || response[key].fieldName =='initials'
  			if(response[key].fieldName =='name'){
  				//alert("1");
  				y=y+6;
  				//var x = response[key].xPosition + 12;
	  	   		 if(response[key].fieldValue != 'null' && response[key].fieldValue !='Signer1'){
	  	   		    var fieldKeyValue=parseFloat(response[key].fieldValue.length)*parseFloat(7)+parseFloat(20);
	  	   			//newTextBoxDiv.after().html('<input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><input class="" type="text" placeholder="'+ response[key].fieldName+'"  type="text" style="margin-left:'+ response[key].xPosition+'px;width:'+ fieldKeyValue+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;position: absolute;border:0px;background-color: transparent;" name="document_field" id="field_'+key+'" readonly value="'+ response[key].fieldValue+'" >');	
	  	   		//chnages for truncating field
	  	   		//vvv21Jan2021//	newTextBoxDiv.after().html('<input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><textarea class="" type="text" placeholder="'+ response[key].fieldName+'"  style="margin-left:'+ response[key].xPosition+'px;width:'+ fieldKeyValue+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;position: absolute;border:0px;background-color: transparent;" name="document_field" id="field_'+key+'" readonly >'+response[key].fieldValue+'</textarea>');	
				  //vvv21Jan2021 new change below	
				  //hegiht added 56px to fields resolve DrySign: 1494 issue
					newTextBoxDiv.after().html('<input type="hidden" id="field_name'+key+'" value="'+response[key].fieldName+'"><input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><textarea class="" type="text" placeholder="'+ response[key].fieldName+'"  style="margin-left:'+ response[key].xPosition +'px;width:'+ response[key].fieldWidth +'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;font-size:'+ response[key].fontSize+';position: absolute;border:0px;background-color: transparent;" name="document_field" id="field_'+key+'" readonly >'+response[key].fieldValue+'</textarea><input type="hidden" value="'+ response[key].fieldWidth+'" id="fieldWidth_'+key+'" /><input type="hidden" value="'+ response[key].fieldHeight+'" id="fieldHeight_'+key+'"/><input type="hidden" value="'+ response[key].fontSize+'" id="fieldFontSize_'+key+'"/> ');

	  	   		 } else{
	  	   			//newTextBoxDiv.after().html('<input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><input class="name" type="text" placeholder="'+ response[key].fieldName+'"  type="text" style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;position: absolute;background-color: transparent;" name="document_field" id="field_'+key+'" maxlength=50  onkeypress="enlargeText(field_'+key+',this.value);" onchange="progressdata(this.value);"  value="" >');
	  	   			//chnages for truncating field
	  	   	   //vvv21Jan2021//	newTextBoxDiv.after().html('<input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><textarea class="name" type="text" placeholder="'+ response[key].fieldName+'"   style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;position: absolute;background-color: transparent;" name="document_field" id="field_'+key+'" maxlength=50  onkeypress="enlargeText(field_'+key+',this.value);" onchange="progressdata(this.value);"><textarea>');
	  	   			  //vvv21Jan2021 new change below	
	  	   			newTextBoxDiv.after().html('<input type="hidden" id="field_name'+key+'" value="'+response[key].fieldName+'"><input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><textarea class="name" type="text" placeholder="'+ response[key].fieldName+'"   style="margin-left:'+ response[key].xPosition +'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;font-size:'+ response[key].fontSize+';position: absolute;background-color: transparent;" name="document_field" id="field_'+key+'" maxlength=50  onkeypress="enlargeText(field_'+key+',this.value);" onchange="progressdata(this.value);"><textarea><input type="hidden" value="'+ response[key].fieldWidth+'" id="fieldWidth_'+key+'" /><input type="hidden" value="'+ response[key].fieldHeight+'" id="fieldHeight_'+key+'"/><input type="hidden" value="'+ response[key].fontSize+'" id="fieldFontSize_'+key+'"/> ');

	  	   			totalCount++;
	  	   		 }
  	   			 newTextBoxDiv.appendTo("#document-reader");
	  	   		
  	    	}
  			else if(response[key].fieldName =='textbox'){
  			
  				y = y+6;
  	   			if(response[key].fieldValue != 'null' && response[key].fieldValue !='Signer1'){
  	   			    var fieldKeyValue=parseFloat(response[key].fieldValue.length)*parseFloat(7)+parseFloat(20);
  	   				//vvv21Jan2021 new change below	
  	   				newTextBoxDiv.after().html('<input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><textarea class="textbox" type="text" placeholder="'+ response[key].fieldName+'"  type="text" style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;font-size:'+ response[key].fontSize+';top:'+y+'px;position: absolute;background-color: transparent;" name="document_field" id="field_'+key+'" readonly value="'+ response[key].fieldValue+'" autocomplete="off"></textarea><input type="hidden" value="'+ response[key].fieldWidth+'" id="fieldWidth_'+key+'" /><input type="hidden" value="'+ response[key].fieldHeight+'" id="fieldHeight_'+key+'"/><input type="hidden" value="'+ response[key].fontSize+'" id="fieldFontSize_'+key+'"/>');	
  	   			//chnages for truncating field
  	   				//newTextBoxDiv.after().html('<input type="hidden" id="fstyield_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><textarea class="textbox" placeholder="'+ response[key].fieldName+'"  style="margin-left:'+ response[key].xPosition+'px;width:'+ fieldKeyValue+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;position: absolute;background-color: transparent;" name="document_field" id="field_'+key+'" readonly>'+response[key].fieldValue+'</textarea>');
  	   			}else{
  	   				//vvv21Jan2021 new change below	
  	   				newTextBoxDiv.after().html('<input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><textarea class="textbox" type="text" placeholder="'+ response[key].fieldName+'"  type="text" style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;font-size:'+ response[key].fontSize+';top:'+y+'px;position: absolute;background-color: transparent;" name="document_field" id="field_'+key+'"  maxlength="25" max="25" autocomplete="off" onkeypress="enlargeText(field_'+key+',this.value);" onchange="progressdata(this.value);"  value="" ></textarea><input type="hidden" value="'+ response[key].fieldWidth+'" id="fieldWidth_'+key+'" /><input type="hidden" value="'+ response[key].fieldHeight+'" id="fieldHeight_'+key+'"/><input type="hidden" value="'+ response[key].fontSize+'" id="fieldFontSize_'+key+'"/>');
  	   			//chnages for truncating field
  	   				//newTextBoxDiv.after().html('<input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><textarea class="textbox" placeholder="'+ response[key].fieldName+'"   style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;position: absolute;background-color: transparent;" name="document_field" id="field_'+key+'"  maxlength=50 onkeypress="enlargeText(field_'+key+',this.value);" onchange="progressdata(this.value);" ></textarea>');
  	   				totalCount++
  	   			}
  	   			newTextBoxDiv.appendTo("#document-reader");
  	    	}
  			else if(response[key].fieldName =='initials'){
  				//alert("3");
  				y = y+6;
  				if(response[key].fieldValue != 'null' ){
  	   			    var fieldKeyValue=parseFloat(response[key].fieldValue.length)*parseFloat(7);
  	   				newTextBoxDiv.after().html('<input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><textarea class="initials" type="text" placeholder="'+ response[key].fieldName+'"  type="text" style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;font-size:'+ response[key].fontSize+';top:'+y+'px;position: absolute;background-color: transparent;" autocomplete="off" name="document_field" id="field_'+key+'" readonly value="'+ response[key].fieldValue+'" ></textarea>');	
  	   			//chnages for truncating field
  	   			//vvv21Jan2021
  	   				newTextBoxDiv.after().html('<input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><textarea class="initials" placeholder="'+ response[key].fieldName+'"   style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;font-size:'+ response[key].fontSize+';top:'+y+'px;position: absolute;background-color: transparent;" name="document_field" id="field_'+key+'" readonly >'+ response[key].fieldValue+'</textarea><input type="hidden" value="'+ response[key].fieldWidth+'" id="fieldWidth_'+key+'" /><input type="hidden" value="'+ response[key].fieldHeight+'" id="fieldHeight_'+key+'"/><input type="hidden" value="'+ response[key].fontSize+'" id="fieldFontSize_'+key+'"/>');	
	   				
  	   			}else{
  	   			//vvv21Jan2021
  	   			newTextBoxDiv.after().html('<input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><textarea class="initials" type="text" placeholder="'+ response[key].fieldName+'"  type="text" style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;font-size:'+ response[key].fontSize+';top:'+y+'px;position: absolute;background-color: transparent;" name="document_field" id="field_'+key+'" maxlength=5 onkeypress="enlargeText(field_'+key+',this.value);" onchange="progressdata(this.value);"  value="" autocomplete="off"></textarea><input type="hidden" value="'+ response[key].fieldWidth+'" id="fieldWidth_'+key+'" /><input type="hidden" value="'+ response[key].fieldHeight+'" id="fieldHeight_'+key+'"/><input type="hidden" value="'+ response[key].fontSize+'" id="fieldFontSize_'+key+'"/>');
  	   			//chnages for truncating field
  	   				//newTextBoxDiv.after().html('<input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><textarea class="initials" placeholder="'+ response[key].fieldName+'"  style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;position: absolute;background-color: transparent;" name="document_field" id="field_'+key+'" maxlength=50 onkeypress="enlargeText(field_'+key+',this.value);" onchange="progressdata(this.value);"></textarea>');
	   			    totalCount++
  	   			}
  	   			newTextBoxDiv.appendTo("#document-reader");
  	    	}
  			else if(response[key].fieldName =='date'){
  				//alert("4");
  				y = y+6;
  				today = mm+'/'+dd+'/'+yyyy;
  				//vvv21Jan2021
  				newTextBoxDiv.after().html('<input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><textarea class="date" placeholder="DD/MM/YYYY" type="text" placeholder="'+ response[key].fieldName+'"  style="display: block;width:'+ response[key].fieldWidth+'px;height: '+ response[key].fieldHeight+'px;font-size:'+ response[key].fontSize+';margin-left:'+ response[key].xPosition+'px;top:'+y+'px;position: absolute;" name="document_field" id="field_'+key+'" onchange="progressdata(this.value);"  placeholder="DD/MM/YYYY"  value="'+today+'" readonly>'+today+'</textarea><input type="hidden" value="'+ response[key].fieldWidth+'" id="fieldWidth_'+key+'" /><input type="hidden" value="'+ response[key].fieldHeight+'" id="fieldHeight_'+key+'"/><input type="hidden" value="'+ response[key].fontSize+'" id="fieldFontSize_'+key+'"/>');
	    		newTextBoxDiv.appendTo("#document-reader");
  	    	}
  			else if( response[key].fieldName =='signature' || response[key].fieldName =='sign'){
  				//alert("5");
  				//alert(response[key].fieldValue);
  				y = y-5;
  				if(response[key].fieldValue != 'null' && response[key].fieldValue != ''){
	   				//alert("51");
	   				//alert(response[key].fieldValue);
	   				//vvv21Jan2021 new change below	
  					newTextBoxDiv.after().html('<input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" id="field_name'+key+'" value="'+response[key].fieldName+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ (response[key].yPosition - 8) +'" id="yposition_'+key+'" ><input class="signature" type="text" placeholder="'+ response[key].fieldName+'"  type="text" style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;font-size:'+ response[key].fontSize+';position: absolute;text-decoration: none;background-color: transparent;image-rendering:-webkit-optimize-contrast" data-left="'+response[key].xPosition+'" name="document_field" id="field_'+key+'" readonly value="'+ response[key].fieldValue+'" ><input type="hidden" value="'+ response[key].fieldWidth+'" id="fieldWidth_'+key+'" /><input type="hidden" value="'+ response[key].fieldHeight+'" id="fieldHeight_'+key+'"/><input type="hidden" value="'+ response[key].fontSize+'" id="fieldFontSize_'+key+'"/> ');	
   				}else{
   					//alert("52");
   					//alert(response[key].fieldValue);
   					//vvv21Jan2021 new change below	
 
   					newTextBoxDiv.after().html('<input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" id="field_name'+key+'" value="'+response[key].fieldName+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ (response[key].yPosition - 8) +'" id="yposition_'+key+'" ><a href="javascript:void(0)"><input class="signature" placeholder="'+ response[key].fieldName+'"  type="text" style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;font-size:'+ response[key].fontSize+';position: absolute;text-decoration: none;background-color: transparent;image-rendering:-webkit-optimize-contrast" data-left="'+response[key].xPosition+'" name="document_field" id="field_'+key+'" onclick="openMySignature('+key+')" onchange="progressdata(this.value);" value="" readonly></a><input type="hidden" value="'+ response[key].fieldWidth+'" id="fieldWidth_'+key+'" /><input type="hidden" value="'+ response[key].fieldHeight+'" id="fieldHeight_'+key+'"/><input type="hidden" value="'+ response[key].fontSize+'" id="fieldFontSize_'+key+'"/> ');
   					totalCount++;
   				}
				signatureCount++;	
			newTextBoxDiv.appendTo("#document-reader");
			} //vvv21Jan2021 new change below start
 			else if(response[key].fieldName =='data-digitalStamp'){ //vvv21Jan2021
 	  			var key1 = key + 1;
 				var signerName = '${signerName}';
 	  			var currentDate = new Date();
 	  			var date = currentDate.getFullYear()+'.'+padFormat((currentDate.getMonth()+1))+'.'+padFormat(currentDate.getDate());
 	  			var time = padFormat(currentDate.getHours()) + ":" + padFormat(currentDate.getMinutes()) + ":" + padFormat(currentDate.getSeconds());
 	  			var dateTime = date+' '+time+' '+currentDate.toString().split("GMT")[1].split("(")[0];
  				//alert(response[key].fieldValue);
  				console.log('response : ',response);
  				if(y<=5){
  					response[key1].yPosition = 10;
  					response[key].yPosition = 10;
  				}
  				var dateFont;
  				if((parseFloat(response[key].fontSize) - 10)>=14){
  					dateFont=13;
  				}
  				else{
  					dateFont = parseFloat(response[key].fontSize) - 10;
  				}
   				var html1;
  				if(response[key].fieldValue != 'null' ){
	   				if(response[key1].fieldValue != 'null'){

	   					html1 ='<input type="hidden" id="field_name'+key1+'" value="'+response[key1].fieldName+'"><input type="hidden" id="field_id'+key1+'" value="'+response[key1].id+'"><input type="hidden" value="'+ response[key1].pageNumber+'" id="pageNumber_'+key1+'" name="pageNumber"><input type="hidden" value="'+ response[key1].yPosition+'" id="yposition_'+key1+'" ><div class="field111_stamp"><input class="signature" type="text" placeholder="'+ response[key1].fieldName+'"  type="text" name="document_field" id="field_'+key1+'" readonly value="'+ response[key1].fieldValue+'" data-left="'+response[key1].xPosition+'" style="height: 100%;width:100%;image-rendering:-webkit-optimize-contrast"><input type="hidden" value="'+ response[key1].fieldWidth+'" id="fieldWidth_'+key1+'" /><input type="hidden" value="'+ response[key1].fieldHeight+'" id="fieldHeight_'+key1+'"/><input type="hidden" value="'+ response[key1].fontSize+'" id="fieldFontSize_'+key1+'"/></div>';
	   				}else{
	
	   					html1 ='<input type="hidden" id="field_name'+key1+'" value="'+response[key1].fieldName+'"><input type="hidden" id="field_id'+key1+'" value="'+response[key1].id+'"><input type="hidden" value="'+ response[key1].pageNumber+'" id="pageNumber_'+key1+'" name="pageNumber"><input type="hidden" value="'+ response[key1].yPosition+'" id="yposition_'+key1+'" ><input class="signature" placeholder="'+ response[key1].fieldName+'"  type="text"  name="document_field" id="field_'+key1+'" onclick="openMySignature('+key1+')" onchange="progressdata(this.value);" value="" readonly  data-left="'+response[key1].xPosition+'" style="height: 100%;width:100%;image-rendering:-webkit-optimize-contrast"><input type="hidden" value="'+ response[key1].fieldWidth+'" id="fieldWidth_'+key1+'" /><input type="hidden" value="'+ response[key1].fieldHeight+'" id="fieldHeight_'+key1+'"/><input type="hidden" value="'+ response[key1].fontSize+'" id="fieldFontSize_'+key1+'"/>';
	   				}
  				//	newTextBoxDiv.after().html('<input type="hidden" id="field_name'+key+'" value="'+response[key].fieldName+'"><input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><input class="digitalStampClass" type="hidden" placeholder="'+ response[key].fieldName+'"  style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;position: absolute;text-decoration: none;background-color: transparent;" name="document_field" id="field_'+key+'" readonly value="'+ response[key].fieldValue+'" >');	
  					//newTextBoxDiv.after().html('<input type="hidden" id="field_name'+key+'" value="'+response[key].fieldName+'"><input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><input class="digitalStampClass" type="hidden" placeholder="'+ response[key].fieldName+'"  style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;position: absolute;text-decoration: none;background-color: transparent;" name="document_field" id="field_'+key+'" value="'+ response[key].fieldValue+'" >');	
  		//v			newTextBoxDiv.after().html('<input type="hidden" id="field_name'+key+'" value="'+response[key].fieldName+'"><input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><input class="digitalStampClass" type="hidden" placeholder="'+ response[key].fieldName+'"  style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;position: absolute;text-decoration: none;background-color: transparent;" name="document_field" id="field_'+key+'" value="'+ response[key].fieldValue+'" >');	
  					newTextBoxDiv.after().html('<div style="left:'+ response[key1].xPosition+'px;width:'+ response[key1].fieldWidth+'px;top:'+y+'px;height:'+ response[key1].fieldHeight+'px;font-size:'+ response[key1].fontSize+';position: absolute;text-decoration: none;background-color: transparent;" >\
  							<div class="drop-select very-specific-stamp-design">\
  							<a href="javascript:void(0)" style="width:50%;">'+html1+'</a>\
  							<div class="stamp groupSignStamp" id="field_'+key+'"  data-stamp="data-digitalStamp" ><span class="span1"  style="font-size:'+ (parseFloat(response[key].fontSize) - 10)+'px">Digitally signed by</span><br/><span class="span2" style="font-size:'+ response[key].fontSize+'">'+signerName+'</span><br/><span id = "dateSpan" class="span3" style="font-size:'+ dateFont +'px">'+dateTime+'</span><input type="hidden" value="'+ response[key].fieldWidth+'" id="fieldWidth_'+key+'" /><input type="hidden" value="'+ response[key].fieldHeight+'" id="fieldHeight_'+key+'"/><input type="hidden" value="'+ response[key].fontSize+'" id="fieldFontSize_'+key+'"/><input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><input type="hidden" value="'+response[key].fieldName+'" id="field_name'+key+'" /> </div></div></div>');
  				//	<input type="image" class="digitalStampClass" placeholder="'+ response[key].fieldName+'"  style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;position: absolute;text-decoration: none;background-color: transparent;" name="document_field" id="field_'+key+'" data-stamp="data-digitalStamp"  src="http://localhost:8081/DrySign/images/drysign_icon.png">');	
  				///	newTextBoxDiv.after().html('<input type="hidden" id="field_name'+key+'" value="'+response[key].fieldName+'"><input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><input class="digitalStampClass" type="hidden" placeholder="'+ response[key].fieldName+'"  style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;position: absolute;text-decoration: none;background-color: transparent;" name="document_field" id="field_'+key+'" value="'+ response[key].fieldValue+'" >');	
  					totalCount++;
  				
  				}else{
   					//alert("52");
   				//	newTextBoxDiv.after().html('<input type="hidden" id="field_name'+key+'" value="'+response[key].fieldName+'"><input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><a href="javascript:void(0)"><input class="digitalStampClass" placeholder="'+ response[key].fieldName+'"  type="text" style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:56px;position: absolute;text-decoration: none;background-color: transparent;" name="document_field" id="field_'+key+'"  onchange="progressdata(this.value);" value="'+ response[key].fieldValue+'"  readonly></a>');
   			//		newTextBoxDiv.after().html('<input type="hidden" id="field_name'+key+'" value="'+response[key].fieldName+'"><input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><input class="digitalStampClass" placeholder="'+ response[key].fieldName+'"  type="hidden" style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:56px;position: absolute;text-decoration: none;background-color: transparent;" name="document_field" id="field_'+key+'"  onchange="progressdata(this.value);" value="'+ response[key].fieldValue+'"  readonly>');
   			 //vvv21Jan2021 		newTextBoxDiv.after().html('<input type="hidden" id="field_name'+key+'" value="'+response[key].fieldName+'"><input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><input type="image" class="digitalStampClass" placeholder="'+ response[key].fieldName+'" style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+response[key].fieldHeight+'px;position: absolute;text-decoration: none;background-color: transparent;" name="document_field" id="field_'+key+'"  onchange="progressdata(this.value);"  data-stamp="data-digitalStamp" src="http://localhost:8081/DrySign/images/drysign_icon.png"><input type="hidden" value="'+ response[key].fieldWidth+'" id="fieldWidth_'+key+'"/><input type="hidden" value="'+ response[key].fieldHeight+'" id="fieldHeight_'+key+'"/> ');
   					newTextBoxDiv.after().html('<div class="very-specific-stamp-design"><input type="hidden" id="field_name'+key+'" value="'+response[key].fieldName+'"><input type="hidden" id="field_id'+key+'" value="'+response[key].id+'"><input type="hidden" value="'+ response[key].pageNumber+'" id="pageNumber_'+key+'" name="pageNumber"><input type="hidden" value="'+ response[key].yPosition+'" id="yposition_'+key+'" ><div class="stamp groupSignStamp" id="field_'+key+'"   style="margin-left:'+ response[key].xPosition+'px;width:'+ response[key].fieldWidth+'px;top:'+y+'px;height:'+ response[key].fieldHeight+'px;font-size:'+ response[key].fontSize+';position: absolute;text-decoration: none;background-color: transparent;" data-stamp="data-digitalStamp" ><span class="span1" style="font-size:'+ (parseFloat(response[key].fontSize) - 10)+'px">Digitally signed by</span><br/><span class="span2" style="font-size:'+ response[key].fontSize+'">'+signerName+'</span><br/><span id = "dateSpan" class="span3" style="font-size:'+ (parseFloat(response[key].fontSize) - 10)+'px">'+dateTime+'</span><input type="hidden" value="'+ response[key].fieldWidth+'" id="fieldWidth_'+key+'" /><input type="hidden" value="'+ response[key].fieldHeight+'" id="fieldHeight_'+key+'"/><input type="hidden" value="'+ response[key].fontSize+'" id="fieldFontSize_'+key+'"/> </div></div>');	
   			  		
   					
  				}
  				digitalStampCount++;	
				newTextBoxDiv.appendTo("#document-reader");
				key++;
			}//vvv21Jan2021 new change above end    
	
  		   count++;
  		 $("#progresscount").val(count);
  		}	
  		//alert(totalCount);
	  	 //alert(totalCount);
  		
  		
  		 $("#requiredCount").val(totalCount);
  		  		  		
  		 if(totalCount ==0){
  			progressdata(0);
  			 $("#finish").show();
   			 $("#rejectbutton").show();
   			 $("#download").show();
   			 $("#qa_sign").show();
  		 }else{
  			$("#finish").attr('disabled','disabled');
  		 }
  		 var count=totalCount;  		 
		   if(count != 0 && count !="" && count !=undefined){
			// $("#PModal").modal('show'); //agreement modal
			   $.alert({
					 title: count+' <spring:message code="label.sign_docs"/>',
					 content: '<spring:message code="label.invited"/>',
					 type: 'dark',
					 buttons: {
                         somethingElse: {
                             text: 'OK',
                             btnClass: 'btn-primary',
				            keys: ['enter', 'shift'],
				            action: function(){
				            	 $("#finish").show();
					   			 $("#rejectbutton").show();
					   			 $("#download").show();
					   			 $("#qa_sign").show();
					   			 $('body').css("overflow","auto");
				            }	
                         }
                     }
			  	});  
			$('body').css("overflow","hidden");
		   } 
		 
  		$("#signatureCount").val(signatureCount);
  	   }
    },  
    error : function(e) {  
     alert('Error: getfielddata' );   
   //  console.log("ERROR : ", JSON.stringify(e));
    }  
 });  
}

function padFormat(d) {
	return (d < 10) ? '0' + d.toString() : d.toString();
}
/****Progress bar increase and decrease base on textfield,date and signature fields from document **************/
function progressdata(textValue){
	var completeness = $("#progresscount").val();
	//var completeness = 5;
	var tcompleteness=parseFloat(100)/parseFloat(completeness);
	$(".page input[id][name$='document_field']").each(function () {
		//alert(this.value);
		if (this.value == "") {
			 completeness--;
		}
	});
	
	$(".page textarea[id][name$='document_field']").each(function () {
		//alert(this.value);
		if (this.value == "") {
			 completeness--;
		}
	});
	
	slide_progress(completeness*tcompleteness);
}

function slide_progress(completeness){
	 $('#progress_bar').attr('aria-valuenow', (completeness)).css('width',(completeness)+"%");
	 if(completeness >= 100){
		 $("#finish").removeAttr('disabled');
		 document.getElementById("arrowdown").style.display = "none";
		 document.getElementById("arrowup").style.display = "none";
	     document.getElementById("arrowright1").style.display = "none";
		 document.getElementById("completed").style.display = "block";
		 
		 //Changes for defect 1396
		 $(window).unbind('mousemove keyup scroll touchmove');
		 //Changes End
		 
		/* document.getElementById("finish").disabled = false;
		$("#finish").css("color","background-color: #3c763d");
		$("#finish").show() */
	 }else{
		 $("#finish").attr('disabled','disabled'); 
	 }
}
function enlargeText(id,value){
	 // alert(value.length);
	//  $(id).css('width',((value.length + 2) * 8) + 'px');
 }
function saveDocument(){	
	var contextPath=$("#contextPath").val();
	var fieldLength=$("#fieldLength").val();
	var projectName=$("#projectName").val();
	//var fieldValue=$("#imageField").val();
	var jsonArray = [];
	var signeremail = $("#email").val();
	var fname = escape($("#fname").val());
	var fileid = $("#fileid").val();
	var token = $("#token").val();
	var returnURL = $("#returnURL").val();
	var token1 = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	var envelopeid = $("#envelopeid").val();
	var info = "?token="+token;
	var btn="#finish";
	for(var i=0; i<fieldLength; i++) {
		var item = {};
		var fieldType=$("#field_"+i).attr("type");

		var dataFieldType=$("#field_"+i).attr("data-stamp");	//data-signer vvv21Jan2021

	//	if(fieldType == 'image'){ //vvv21Jan2021 new change below in if cond	
		if(fieldType == 'image' && dataFieldType != "data-digitalStamp"){
		
			var sign = document.getElementById('field_'+i);
			var signature = sign.getAttribute('src');
			var pageNumber=$("#pageNumber_"+i).val();
			item ["id"] =$("#field_id"+i).val();
			item ["documentName"] = $("#fname").val();
			item ["top"] = $("#yposition_"+i).val();
			item ["left"] = parseFloat($("#field_"+i).attr("data-left")) - 10;
			item ["fieldType"] = "image";
			item ["fieldValue"] = signature;
			//item ["pageNumber"] = pageNumber-parseInt(1);
			item ["pageNumber"] = pageNumber;
			item ["termCond"] = $("#checkbox2").val();
			//vvv21Jan2021 new change below	3 lines
			item ["fieldWidth"] = $("#fieldWidth_"+i).val(); //$("#field_"+i).css("width");		//vvv21Jan2021
			item ["fieldHeight"] = $("#fieldHeight_"+i).val(); //$("#field_"+i).css("height");		//vvv21Jan2021
			item ["fieldName"] =$("#field_name"+i).val();		//vvv21Jan2021
			item ["fontSize"] =$("#fieldFontSize_"+i).val();	//Changes to get Font size 10/05/2021
			//added dynamic padding value by Rupali.Shinde
			item ["leftPadding"] =$("#field_"+i).css("padding-left");
			item ["topPadding"] = $("#field_"+i).css("padding-top");
		}else if(fieldType == 'text'){
			var pageNumber=$("#pageNumber_"+i).val();
			item ["id"] =$("#field_id"+i).val();
			item ["documentName"] = $("#fname").val();
			item ["top"] = $("#yposition_"+i).val()
			item ["left"] = $("#field_"+i).css("margin-left");
			item ["fieldType"] = "text";
			item ["fieldValue"] = $("#field_"+i).val();
			//item ["pageNumber"] = pageNumber-parseInt(1);
			item ["pageNumber"] = pageNumber;
			item ["termCond"] = $("#checkbox2").val();
			//vvv21Jan2021 new change below	3 lines
			item ["fieldWidth"] = $("#fieldWidth_"+i).val();		//vvv21Jan2021
			item ["fieldHeight"] = $("#fieldHeight_"+i).val();		//vvv21Jan2021
			item ["fieldName"] =$("#field_name"+i).val();		//vvv21Jan2021
			item ["fontSize"] =$("#fieldFontSize_"+i).val();	//Changes to get Font size 10/05/2021
			//added dynamic padding value by Rupali.Shinde
			item ["leftPadding"] =$("#field_"+i).css("padding-left");
			item ["topPadding"] = $("#field_"+i).css("padding-top");
		}else if(fieldType == 'date'){
			var pageNumber=$("#pageNumber_"+i).val();
			item ["id"] =$("#field_id"+i).val();
			item ["documentName"] = $("#fname").val();
			item ["top"] = $("#yposition_"+i).val()
			item ["left"] = $("#field_"+i).css("margin-left");
			item ["fieldType"] = "text";
			item ["fieldValue"] = $("#field_"+i).val();
			//item ["pageNumber"] = pageNumber-parseInt(1);
			item ["pageNumber"] = pageNumber;
			item ["termCond"] = $("#checkbox2").val();
			//vvv21Jan2021 new change below	3 lines
			item ["fieldWidth"] =$("#fieldWidth_"+i).val();		//vvv21Jan2021
			item ["fieldHeight"] =$("#fieldHeight_"+i).val();		//vvv21Jan2021
			item ["fieldName"] =$("#field_name"+i).val();		//vvv21Jan2021
			item ["fontSize"] =$("#fieldFontSize_"+i).val();//Changes to get Font size 10/05/2021
			//added dynamic padding value by Rupali.Shinde
			item ["leftPadding"] =$("#field_"+i).css("padding-left");
			item ["topPadding"] = $("#field_"+i).css("padding-top");
		}		//vvv21Jan2021 new change below start
	//	else if(fieldType == 'hidden'){		//type=hidden for digital stamp which is kept hidden 
		else if(dataFieldType == "data-digitalStamp"){
		
		//	var sign = document.getElementById('field_'+i);
/* 			var sign = document.getElementById('mySpanImg_'+i);
			var signature = sign.getAttribute('src');
			var pageNumber=$("#pageNumber_"+i).val();
			item ["id"] =$("#field_id"+i).val();
			
			item ["documentName"] = $("#fname").val();
			item ["top"] = $("#yposition_"+i).val();
			item ["left"] = $("#mySpanImg_"+i).css("margin-left");  //item ["left"] = $("#field_"+i).css("margin-left");
			item ["fieldType"] = "image";
			item ["fieldValue"] = signature;
			//item ["pageNumber"] = pageNumber-parseInt(1);
			item ["pageNumber"] = pageNumber;
			item ["termCond"] = $("#checkbox2").val(); */
			
		
		  	var pageNumber=$("#pageNumber_"+i).val();
			item ["id"] =$("#field_id"+i).val();
			item ["documentName"] = $("#fname").val();
			//item ["top"] = $("#field_"+i).parents('.very-specific-stamp-design').parent().css("top");
			item ["top"] =$("#yposition_"+i).val();
			item ["left"] = (parseFloat($("#field_"+i).parents('.very-specific-stamp-design').parent().css("left")) + (parseFloat($("#field_"+i).parents('.very-specific-stamp-design').width())/ 2) + 25) + 'px';  //item ["left"] = $("#field_"+i).css("margin-left");
			item ["fieldType"] = "text";
			item ["fieldValue"] = $("#field_"+i).val();		//$("#field_"+i).val();
			//item ["pageNumber"] = pageNumber-parseInt(1);
			item ["pageNumber"] = pageNumber;
			item ["termCond"] = $("#checkbox2").val();
			
			item ["fieldName"] =$("#field_name"+i).val();
			item ["fieldWidth"] = (parseFloat($("#fieldWidth_"+i).val())/2);		//vvv21Jan2021
			item ["fieldHeight"] = $("#fieldHeight_"+i).val();		//vvv21Jan2021
			item ["fontSize"] =$("#fieldFontSize_"+i).val();	//Changes to get Font size 10/05/2021
			//added dynamic padding value by Rupali.Shinde
			item ["leftPadding"] =$("#field_"+i).css("padding-left");
			item ["topPadding"] = $("#field_"+i).css("padding-top");
			item ['currentDate'] = $("#dateSpan").html();
			//alert("datafieldType"+dataFieldType+"---item fieldWidth:"+item ["fieldWidth"]+"==="+$("#fieldHeight_"+i).val());
		} 
		/* else if(fieldType == 'hidden'){		//type=hidden for digital stamp which is kept hidden 
			var pageNumber=$("#pageNumber_"+i).val();
			item ["id"] =$("#field_id"+i).val();
			item ["documentName"] = $("#fname").val();
			item ["top"] = $("#yposition_"+i).val()
			item ["left"] = $("#field_"+i).css("margin-left");
			item ["fieldType"] = "text";
			item ["fieldValue"] = $("#field_"+i).val();
			//item ["pageNumber"] = pageNumber-parseInt(1);
			item ["pageNumber"] = pageNumber;
			item ["termCond"] = $("#checkbox2").val();
			
			
		//	item ["width"] = $("#field_"+i).css("width");
		//	item ["height"] = $("#field_"+i).css("height");
			item ["fieldName"] =$("#field_name"+i).val();
			
		} */ //vvv21Jan2021 new change below end
		jsonArray.push(item);
	}
//vvv21Jan2021 new change below console.log
	//console.log("SIGNDOCJSON.stringify(jsonArray) ====="+JSON.stringify(jsonArray));

  	 $.ajax({
		type : "POST",
		url : "saveDocument"+info,
		dataType: 'json', 
	    data: JSON.stringify(jsonArray),
	    contentType: "application/json;",
	    beforeSend : function(xhr) {	         
	    	//$(btn).buttonLoader('start');
	    	$("#loader1").show();
	    	xhr.setRequestHeader(header, token1);
	    },
	    complete: function () {
	    	//$(btn).buttonLoader('stop');
	    	$("#loader1").hide();
	    },
        success : function(response) { 
        	if(response == "500"){
        		if(location.href.indexOf("dashboard")!=-1){
        			var pendingPageURL=appUrl+"/app/myfiles?tab=pending";
             		window.location.href = "successPage?returnURL="+pendingPageURL;	
        		}
        
        		else if(returnURL !=''){
            		window.location.href = "successPage?returnURL="+returnURL;	
            	}
        		else{
        			window.location.href = "success";	
        		}
        		
            	//alert('success');
                if(redirecturl != "" || redirecturl.trim() !="")
            	{	
                	$(".page").hide();
	            	$('#successMessage').modal('show');
	                $("#header").hide();
	                $("#view-docrender").hide();
	                $(".form-control").hide();
	                $("#nav_down").hide();
            		
            	}else{ 	
            	 	$(".page").hide();
	            	$('#successMessage').modal('show');
	            	$("#view-docrender").hide();
	                $("#header").hide();
	                $(".form-control").hide();
	                $("#nav_down").hide();
            	}
                
          }
        	else if(response=="503")
      	  {
      	  if(location.href.indexOf("dashboard")!=-1){
    			var pendingPageURL=appUrl+"/app/myfiles?tab=pending";
         		window.location.href = "errorSign?returnURL="+pendingPageURL;
         		$(".page").hide();
          	    $('#successMessage').modal('hide');
                $("#header").hide();
                $("#view-docrender").hide();
                $(".form-control").hide();
                $("#nav_down").hide();
      		
    		}else{
    			alert("<spring:message code="label.error.sign"/>");
    		/* 	$.confirm({
    			    title: 'Error',
    			    content: 'Soemthing went wrong please try again !!',
    			    buttons: {
    			        ok: function () {
    			        	location.reload();
    			        }
    			    }
    			}); */
    		}
      	      
      	  }
        	else if(response == "502"){
        	 	 window.location.href = "error";
        	  
          }else if(response == "108"){
        	 	 window.location.href = "docstatus";
        	  
          }else{
                alert("<spring:message code="label.savingerror"/>");
          }

		},
		error:function(res){
			$.confirm({
			    title: 'Session Expired',
			    content: 'Please try again !!',
			    buttons: {
			    	'<spring:message code="label.ok1"/>': function () {
			        	location.reload();
			        }
			    }
			});
		}
	}); 
		 
}
		
function redirectToEmudhraGroupSign(){
	var contextPath=$("#contextPath").val();
	var fieldLength=$("#fieldLength").val();
	var projectName=$("#projectName").val();
	//var fieldValue=$("#imageField").val();
	var jsonArray = [];
	var signeremail = $("#email").val();
	var fname = escape($("#fname").val());
	var fileid = $("#fileid").val();
	var token = $("#token").val();
	var returnURL = $("#returnURL").val();
	var token1 = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	var envelopeid = $("#envelopeid").val();
	var info = "?token="+token;
	var btn="#finish";
	for(var i=0; i<fieldLength; i++) {
		var item = {};
		var fieldType=$("#field_"+i).attr("type");

		var dataFieldType=$("#field_"+i).attr("data-stamp");	//data-signer vvv21Jan2021

	//	if(fieldType == 'image'){ //vvv21Jan2021 new change below in if cond	
		if(fieldType == 'image' && dataFieldType != "data-digitalStamp"){
		
			var sign = document.getElementById('field_'+i);
			var signature = sign.getAttribute('src');
			var pageNumber=$("#pageNumber_"+i).val();
			item ["id"] =$("#field_id"+i).val();
			item ["documentName"] = $("#fname").val();
			item ["top"] = $("#yposition_"+i).val();
			item ["left"] = parseFloat($("#field_"+i).attr("data-left")) - 10;
			item ["fieldType"] = "image";
			item ["fieldValue"] = signature;
			//item ["pageNumber"] = pageNumber-parseInt(1);
			item ["pageNumber"] = pageNumber;
			item ["termCond"] = $("#checkbox2").val();
			//vvv21Jan2021 new change below	3 lines
			item ["fieldWidth"] = $("#fieldWidth_"+i).val(); //$("#field_"+i).css("width");		//vvv21Jan2021
			item ["fieldHeight"] = $("#fieldHeight_"+i).val(); //$("#field_"+i).css("height");		//vvv21Jan2021
			item ["fieldName"] =$("#field_name"+i).val();		//vvv21Jan2021
			item ["fontSize"] =$("#fieldFontSize_"+i).val();	//Changes to get Font size 10/05/2021
			//added dynamic padding value by Rupali.Shinde
			item ["leftPadding"] =$("#field_"+i).css("padding-left");
			item ["topPadding"] = $("#field_"+i).css("padding-top");
		}else if(fieldType == 'text'){
			var pageNumber=$("#pageNumber_"+i).val();
			item ["id"] =$("#field_id"+i).val();
			item ["documentName"] = $("#fname").val();
			item ["top"] = $("#yposition_"+i).val()
			item ["left"] = $("#field_"+i).css("margin-left");
			item ["fieldType"] = "text";
			item ["fieldValue"] = $("#field_"+i).val();
			//item ["pageNumber"] = pageNumber-parseInt(1);
			item ["pageNumber"] = pageNumber;
			item ["termCond"] = $("#checkbox2").val();
			//vvv21Jan2021 new change below	3 lines
			item ["fieldWidth"] = $("#fieldWidth_"+i).val();		//vvv21Jan2021
			item ["fieldHeight"] = $("#fieldHeight_"+i).val();		//vvv21Jan2021
			item ["fieldName"] =$("#field_name"+i).val();		//vvv21Jan2021
			item ["fontSize"] =$("#fieldFontSize_"+i).val();	//Changes to get Font size 10/05/2021
			//added dynamic padding value by Rupali.Shinde
			item ["leftPadding"] =$("#field_"+i).css("padding-left");
			item ["topPadding"] = $("#field_"+i).css("padding-top");
		}else if(fieldType == 'date'){
			var pageNumber=$("#pageNumber_"+i).val();
			item ["id"] =$("#field_id"+i).val();
			item ["documentName"] = $("#fname").val();
			item ["top"] = $("#yposition_"+i).val()
			item ["left"] = $("#field_"+i).css("margin-left");
			item ["fieldType"] = "text";
			item ["fieldValue"] = $("#field_"+i).val();
			//item ["pageNumber"] = pageNumber-parseInt(1);
			item ["pageNumber"] = pageNumber;
			item ["termCond"] = $("#checkbox2").val();
			//vvv21Jan2021 new change below	3 lines
			item ["fieldWidth"] =$("#fieldWidth_"+i).val();		//vvv21Jan2021
			item ["fieldHeight"] =$("#fieldHeight_"+i).val();		//vvv21Jan2021
			item ["fieldName"] =$("#field_name"+i).val();		//vvv21Jan2021
			item ["fontSize"] =$("#fieldFontSize_"+i).val();//Changes to get Font size 10/05/2021
			//added dynamic padding value by Rupali.Shinde
			item ["leftPadding"] =$("#field_"+i).css("padding-left");
			item ["topPadding"] = $("#field_"+i).css("padding-top");
		}		//vvv21Jan2021 new change below start
	//	else if(fieldType == 'hidden'){		//type=hidden for digital stamp which is kept hidden 
		else if(dataFieldType == "data-digitalStamp"){
		
		//	var sign = document.getElementById('field_'+i);
/* 			var sign = document.getElementById('mySpanImg_'+i);
			var signature = sign.getAttribute('src');
			var pageNumber=$("#pageNumber_"+i).val();
			item ["id"] =$("#field_id"+i).val();
			
			item ["documentName"] = $("#fname").val();
			item ["top"] = $("#yposition_"+i).val();
			item ["left"] = $("#mySpanImg_"+i).css("margin-left");  //item ["left"] = $("#field_"+i).css("margin-left");
			item ["fieldType"] = "image";
			item ["fieldValue"] = signature;
			//item ["pageNumber"] = pageNumber-parseInt(1);
			item ["pageNumber"] = pageNumber;
			item ["termCond"] = $("#checkbox2").val(); */
			
		
		  	var pageNumber=$("#pageNumber_"+i).val();
			item ["id"] =$("#field_id"+i).val();
			item ["documentName"] = $("#fname").val();
			//item ["top"] = $("#field_"+i).parents('.very-specific-stamp-design').parent().css("top");
			item ["top"] =$("#yposition_"+i).val();
			item ["left"] = (parseFloat($("#field_"+i).parents('.very-specific-stamp-design').parent().css("left")) + (parseFloat($("#field_"+i).parents('.very-specific-stamp-design').width())/ 2) + 25) + 'px';  //item ["left"] = $("#field_"+i).css("margin-left");
			item ["fieldType"] = "text";
			item ["fieldValue"] = $("#field_"+i).val();		//$("#field_"+i).val();
			//item ["pageNumber"] = pageNumber-parseInt(1);
			item ["pageNumber"] = pageNumber;
			item ["termCond"] = $("#checkbox2").val();
			
			item ["fieldName"] =$("#field_name"+i).val();
			item ["fieldWidth"] = (parseFloat($("#fieldWidth_"+i).val())/2);		//vvv21Jan2021
			item ["fieldHeight"] = $("#fieldHeight_"+i).val();		//vvv21Jan2021
			item ["fontSize"] =$("#fieldFontSize_"+i).val();	//Changes to get Font size 10/05/2021
			//added dynamic padding value by Rupali.Shinde
			item ["leftPadding"] =$("#field_"+i).css("padding-left");
			item ["topPadding"] = $("#field_"+i).css("padding-top");
			item ['currentDate'] = $("#dateSpan").html();
			//alert("datafieldType"+dataFieldType+"---item fieldWidth:"+item ["fieldWidth"]+"==="+$("#fieldHeight_"+i).val());
		} 
		/* else if(fieldType == 'hidden'){		//type=hidden for digital stamp which is kept hidden 
			var pageNumber=$("#pageNumber_"+i).val();
			item ["id"] =$("#field_id"+i).val();
			item ["documentName"] = $("#fname").val();
			item ["top"] = $("#yposition_"+i).val()
			item ["left"] = $("#field_"+i).css("margin-left");
			item ["fieldType"] = "text";
			item ["fieldValue"] = $("#field_"+i).val();
			//item ["pageNumber"] = pageNumber-parseInt(1);
			item ["pageNumber"] = pageNumber;
			item ["termCond"] = $("#checkbox2").val();
			
			
		//	item ["width"] = $("#field_"+i).css("width");
		//	item ["height"] = $("#field_"+i).css("height");
			item ["fieldName"] =$("#field_name"+i).val();
			
		} */ //vvv21Jan2021 new change below end
		jsonArray.push(item);
	}
//vvv21Jan2021 new change below console.log
	//console.log("SIGNDOCJSON.stringify(jsonArray) ====="+JSON.stringify(jsonArray));

  	 $.ajax({
		type : "POST",
		url : "redirectToEmudhraGroupSign"+info,
		dataType: 'json', 
	    data: JSON.stringify(jsonArray),
	    contentType: "application/json;",
	    beforeSend : function(xhr) {	         
	    	//$(btn).buttonLoader('start');
	    	$("#loader1").show();
	    	xhr.setRequestHeader(header, token1);
	    },
	    complete: function () {
	    	//$(btn).buttonLoader('stop');
	    	$("#loader1").hide();
	    },
        success : function(response) { 
        	 window.location.href = "<%=DrySignPathIN%>DrySign/eMudhra?gatewayParam="+response;

		},
		error:function(res){
			$.confirm({
			    title: 'Session Expired',
			    content: 'Please try again !!',
			    buttons: {
			    	'<spring:message code="label.ok1"/>': function () {
			        	location.reload();
			        }
			    }
			});
		}
	}); 
  	 
}
</script>
	<%-- 	<script src="<%=appUrl%>/js/signature.js"></script> --%>
	<script src="<%=appUrl%>/js/jquery.buttonLoader.js"></script>
	<script src="<%=appUrl%>/js/signaturepad.js"></script>


	<script>
	
//zkSignature.capture();
$('.close').click(function(){
	//$('.save-signature-box').hide();
	$(".signature-sign").hide();
	$('.overlay-bg').hide();
	 //return false;
}); 
$('#close1').click(function(){
	//$('.save-signature-box').hide();
	$("#showSignCount").hide();
	$('.overlay-bg').hide();
	 //return false;
}); 
/*

$('#decline').click(function(){
	//$('.save-signature-box').hide();
	    $('.signature-sign').hide();
		$('.overlay-bg').hide();
		$('.Message').hide();
		$('.overlaywhite_bg').hide();
	 //return false;
});  */

//Draw Signature
function openMySignature(id){
	$("#drawsignature_error").hide();
	$("#tdrawsignature_error").hide();
	$("#file_error").hide();
	$("#myType").val('');
	$(".thumbnail").removeClass('selected');
	 var projectName=$("#projectName").val();
	
	 $("#default_sign_check_upload_show").hide();
	 $("#default_sign_check_sdraw").prop("checked", false);
	 $("#default_sign_check_tdraw").prop("checked", false);
	 $("#default_sign_check_type").prop("checked", false);
	 $("#default_sign_check_upload").prop("checked", false);
	 
	/* $("#sDraw").addClass("active");
	$("#draw").addClass("active"); */
	var isSaved=$("#isSaved").val();
 
		/* if ($.browser.msedge || $.browser.msie && $.browser.version <= 6 || $.browser.msie && $.browser.version > 6 && projectName =='Talento'){
		 */	//show
			$("#tDraw").show();
			$("#sDraw").hide();
			if(isSaved == "YES"){
				$("#sType").removeClass('active');
				$("#type").removeClass('active');
				$("#sDraw").removeClass('active');
				$("#draw").removeClass('active');
				$("#mSignature").addClass('active');
				$("#mysignature").addClass('active');
				$("#tDraw").removeClass('active');
				$("#tdraw").removeClass('active');
				$("#uType").removeClass('active');
				$("#upload").removeClass('active');
				$("#mSignature").show();
			}else{
				$("#sType").removeClass('active');
				$("#type").removeClass('active');
				$("#sDraw").removeClass('active');
				$("#draw").removeClass('active');
				$("#mSignature").removeClass('active');
				$("#mysignature").removeClass('active');
				$("#tDraw").addClass('active');
				$("#tdraw").addClass('active');
				$("#uType").removeClass('active');
				$("#upload").removeClass('active');
				$("#mSignature").hide();
				
			}
			
			
		/* }else{
			//hide
			$("#tDraw").hide();
			if(isSaved == "YES"){
				$("#sType").removeClass('active');
				$("#type").removeClass('active');
				$("#tDraw").removeClass('active');
				$("#tdraw").removeClass('active');
				$("#mSignature").addClass('active');
				$("#mysignature").addClass('active');
				$("#sDraw").removeClass('active');
				$("#draw").removeClass('active');
				$("#mSignature").show();
			}else{
				$("#sType").removeClass('active');
				$("#type").removeClass('active');
				$("#tDraw").removeClass('active');
				$("#tdraw").removeClass('active');
				$("#mSignature").removeClass('active');
				$("#mysignature").removeClass('active');
				$("#sDraw").addClass('active');
				$("#draw").addClass('active');
				$("#mSignature").hide();
			}
		} */
	
	
		
	$("#show_upload_signature").show();
	
	signaturePad.clear();
	$("#blah").hide();
	//zkSignature.clear();
	$('#signature').signature('clear');
	$("#blah").attr('src', '');
	document.getElementById("imgInp").value = "";
	$('.overlay-bg').show();
	//$('body').css('overflow','hidden')
	$('.signature-sign').show();
		var $slider = $('.signature-sign');
		$slider.animate({
		 right: parseInt($slider.css('right'),10) == -350 ? 0 : 0
	});
	$("#drawsignature_no").val(id);	
	getSigntype();
	
	
}
$("#saveSignature").click(function(){
	var id=$("#drawsignature_no").val();
	var canvas = document.getElementById("newSignature");
	var dataURL = canvas.toDataURL("image/png",1);
	//console.log(dataURL);
	//var defaultBase64=$("#drawBaseIE64").val();
	 //Check if browser is IE or not
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
		$("#field_"+id).attr('type', 'image'); 
		val= $("#field_"+id).attr('src', dataURL);	
		$("#field_"+id).val(id);
		var stamp_Id = id-1;
		if($("#field_"+stamp_Id).attr("data-stamp")=="data-digitalStamp"){
			$("#field_"+stamp_Id).val(stamp_Id);
		}
 		progressdata(val);
 		$(".signature-sign").hide();
 		$('.overlay-bg').hide();
 		var checkSignature=$("#isSaved").val();
 		
 		if($("#default_sign_check_sdraw").prop('checked') ==true){
 			var token = $("meta[name='_csrf']").attr("content");
 			var header = $("meta[name='_csrf_header']").attr("content");
 			var contextPath=$("#contextPath").val();
 			var data = {
 					 "signature" : dataURL,
 					 "signType" :"Draw",
 					 "email" :$("#email").val(),
 					 "fullName":$("#signerName").val(),
 					 "status":"1"
 			}
 			$.ajax({
 				type : "POST",
 				url : contextPath+"saveSignerSignature",
 				dataType: 'json',
 			    contentType: "application/json; charset=utf-8",
 			    data: JSON.stringify(data),
 			    beforeSend: function (xhr) {
 		   			xhr.setRequestHeader(header, token);
 		   			//$("#loader2").show();
 			    },
 			    complete: function () {
 			    	//$("#loader2").hide();
 			    },
 		        success : function(response) {
 		         	if(response != 'failed'){
 		        	
 		         		$("#save_my_signature").attr('src', dataURL);
 		    	 		$("#save_my_signature").addClass("saved_signature");
 		    	 		$("#isSaved").val("YES");	
 		    	 		
 		        				
 		            }else{
 		            	alert('failed');
 		            }
 				},
 				 error : function(e) {  
 				    alert('Error: savesignature' );   
 				//   console.log("ERROR : ", JSON.stringify(e));
 				}  
 			 });
 		}
 		var signatureCount=$("#fieldLength").val();
 		if(signatureCount > 1){
	 		for(var i=0; i<signatureCount; i++) {
	 			
	 			var fieldType=$("#field_"+i).attr("type");
	 			var fieldSrc=$("#field_"+i).attr("src");
	 			if(fieldType == 'image' &&  fieldSrc !=''){
	 			   $("#field_"+i).attr('src', dataURL);		
				
	 			}
	 		}
	     }
	}
});

function saveSignaturetodb(){
   	
	if (!signaturePad.isEmpty()){
	var id=$("#drawsignature_no").val();
	var canvas = document.getElementById("signaturepad");
	var dataURL = canvas.toDataURL("image/png",1);
		//var defaultBase64=$("#drawBaseIE64").val();
	 //Check if browser is IE or not
	var defaultBase64=$("#tdrawBaseIE64").val();;
	//console.log(dataURL);
	//if ($.browser.msedge || $.browser.msie && $.browser.version <= 6 || $.browser.msie && $.browser.version > 6  ){
	if( $.browser.safari ){
		 defaultBase64=$("#drawBaseSafari641").val();
	} 
	if ($.browser.mozilla && $.browser.version >= "2.0" ){
		defaultBase64=$("#drawBaseMozilla641").val();
	}
	if ($.browser.msedge || $.browser.msie && $.browser.version <= 6 || $.browser.msie && $.browser.version > 6){
		   	//alert('IE')
			defaultBase64=$("#drawBaseIE641").val();
		}
	if(defaultBase64 == dataURL){
		 
		$("#tdrawsignature_error").show();
	}else{
	
		$("#field_"+id).attr('type', 'image'); 
		val= $("#field_"+id).attr('src', dataURL);	
		$("#field_"+id).val(id);
		var stamp_Id = id-1;
		if($("#field_"+stamp_Id).attr("data-stamp")=="data-digitalStamp"){
			$("#field_"+stamp_Id).val(stamp_Id);
		}
 		progressdata(val);
 		$(".signature-sign").hide();
 		$('.overlay-bg').hide();
 		var checkSignature=$("#isSaved").val();
 		if($("#default_sign_check_tdraw").prop('checked') ==true){
 			
 			var token = $("meta[name='_csrf']").attr("content");
 			var header = $("meta[name='_csrf_header']").attr("content");
 			var contextPath=$("#contextPath").val();
 			var data = {
 					 "signature" : dataURL,
 					 "signType" :"Draw",
 					 "email" :$("#email").val(),
 					 "fullName":$("#signerName").val(),
 					 "status":"1"
 			}
 			$.ajax({
 				type : "POST",
 				url : contextPath+"saveSignerSignature",
 				dataType: 'json',
 			    contentType: "application/json; charset=utf-8",
 			    data: JSON.stringify(data),
 			    beforeSend: function (xhr) {
 		   			xhr.setRequestHeader(header, token);
 		   			//$("#loader2").show();
 			    },
 			    complete: function () {
 			    	//$("#loader2").hide();
 			    },
 		        success : function(response) {
 		         	if(response != 'failed'){
 		    
 		         		$("#save_my_signature").attr('src', dataURL);
 		    	 		$("#save_my_signature").addClass("saved_signature");
 		    	 		$("#isSaved").val("YES");	
 		        				
 		            }else{
 		            	alert('failed');
 		            }
 				},
 				 error : function(e) {  
 				    alert('Error: savesignature1');   
 				//   console.log("ERROR : ", JSON.stringify(e));
 				}  
 			 });
 			
 		}
 		
 		var signatureCount=$("#fieldLength").val();
 		if(signatureCount > 1){
	 		for(var i=0; i<signatureCount; i++) {
	 			
	 			var fieldType=$("#field_"+i).attr("type");
	 			var fieldSrc=$("#field_"+i).attr("src");
	 			if(fieldType == 'image' &&  fieldSrc !=''){
	 			   $("#field_"+i).attr('src', dataURL);		
				
	 			}
	 		}
	     }
	}
}
	else{
		$("#tdrawsignature_error").show();
	}
	
	
		
}

function saveTypeSignature(){
	var id=$("#drawsignature_no").val();
    var sign = $("#myType").val();
	var typeSign=$("#typeName").val();
	var check=validationSignature1(sign,typeSign,"type");
	if(check ==true){
		
		$("#field_"+id).attr('type', 'image'); 
		val= $("#field_"+id).attr('src', sign);	
		$("#field_"+id).val(id);
		var stamp_Id = id-1;
		if($("#field_"+stamp_Id).attr("data-stamp")=="data-digitalStamp"){
			$("#field_"+stamp_Id).val(stamp_Id);
		}
 		progressdata(val);
 		$(".signature-sign").hide();
 		$('.overlay-bg').hide();
 		var checkSignature=$("#isSaved").val();
 		if($("#default_sign_check_type").prop('checked')==true){
 			
 			var token = $("meta[name='_csrf']").attr("content");
 			var header = $("meta[name='_csrf_header']").attr("content");
 			var contextPath=$("#contextPath").val();
 			var data = {
 					 "signature" : sign,
 					 "signType" :"Type",
 					 "email" :$("#email").val(),
 					 "fullName":$("#signerName").val(),
 					 "status":"1"
 			}
 			$.ajax({
 				type : "POST",
 				url : contextPath+"saveSignerSignature",
 				dataType: 'json',
 			    contentType: "application/json; charset=utf-8",
 			    data: JSON.stringify(data),
 			    beforeSend: function (xhr) {
 		   			xhr.setRequestHeader(header, token);
 		   			//$("#loader2").show();
 			    },
 			    complete: function () {
 			    	//$("#loader2").hide();
 			    },
 		        success : function(response) {
 		         	if(response != 'failed'){
 		        	
 		         		$("#save_my_signature").attr('src', sign);
 		    	 		$("#save_my_signature").addClass("thumbnail selected");
 		    	 		$("#isSaved").val("YES");
 		        				
 		            }else{
 		            	alert('failed');
 		            }
 				},
 				 error : function(e) {  
 				    alert('Error: savetypesignature' );   
 			//	   console.log("ERROR : ", JSON.stringify(e));
 				}  
 			 });
 				
 		}
 		var signatureCount=$("#fieldLength").val();
 		if(signatureCount > 1){
	 		for(var i=0; i<signatureCount; i++) {
	 			
	 			var fieldType=$("#field_"+i).attr("type");
	 			var fieldSrc=$("#field_"+i).attr("src");
	 			if(fieldType == 'image' &&  fieldSrc !=''){
	 			   $("#field_"+i).attr('src', sign);		
				
	 			}
	 		}
	     }
		//$(".saved_signature").attr('src', sign);
	}

}


$("#saveMySignature").click(function(){
	var id=$("#drawsignature_no").val();
	var sign=$('#save_my_signature').attr('src');
	$("#field_"+id).attr('type', 'image'); 
	val= $("#field_"+id).attr('src', sign);	
	$("#field_"+id).val(id);
	var stamp_Id = id-1;
	if($("#field_"+stamp_Id).attr("data-stamp")=="data-digitalStamp"){
		$("#field_"+stamp_Id).val(stamp_Id);
	}
	progressdata(val);
	$(".signature-sign").hide();
	$('.overlay-bg').hide();
	
	var signatureCount=$("#fieldLength").val();
		if(signatureCount > 1){
 		for(var i=0; i<signatureCount; i++) {
 			
 			var fieldType=$("#field_"+i).attr("type");
 			var fieldSrc=$("#field_"+i).attr("src");
 			if(fieldType == 'image' &&  fieldSrc !=''){
 			   $("#field_"+i).attr('src', sign);		
			
 			}
 		}
     }
});

function saveUploadSignature(){
	var id=$("#drawsignature_no").val();
	var sign=$('#blah').attr('src');
	var fileInput = document.getElementById('imgInp');
	if(sign == ''){
		$("#file_error").show();
    	$("#file_error").html('<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>'+'<spring:message code="label.upl_picsign"/>'+'<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().parent().hide();">&times;</a>');
        fileInput.value = '';
	}else{
		$("#field_"+id).attr('type', 'image'); 
		val= $("#field_"+id).attr('src', sign);	
		$("#field_"+id).val(id);
		var stamp_Id = id-1;
		if($("#field_"+stamp_Id).attr("data-stamp")=="data-digitalStamp"){
			$("#field_"+stamp_Id).val(stamp_Id);
		}
		progressdata(val);
		$(".signature-sign").hide();
		$('.overlay-bg').hide();
		$("#file_error").hide();
		if($("#default_sign_check_upload").prop('checked') ==true){
 			
 			var token = $("meta[name='_csrf']").attr("content");
 			var header = $("meta[name='_csrf_header']").attr("content");
 			var contextPath=$("#contextPath").val();
 			var data = {
 					 "signature" : sign,
 					 "signType" :"Upload",
 					 "email" :$("#email").val(),
 					 "fullName":$("#signerName").val(),
 					 "status":"1"
 			}
 			$.ajax({
 				type : "POST",
 				url : contextPath+"saveSignerSignature",
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
 		        	
 		         		$("#save_my_signature").attr('src', sign);
 		    	 		$("#save_my_signature").addClass("saved_signature");
 		    	 		$("#isSaved").val("YES");	
 		        				
 		            }else{
 		            	alert('failed');
 		            }
 				},
 				 error : function(e) {  
 				    alert('Error: saveuploadsignature' );
 			//		console.log("ERROR : ", JSON.stringify(e));
 				}  
 			 });
 			
 		}
		var signatureCount=$("#fieldLength").val();
			if(signatureCount > 1){
	 		for(var i=0; i<signatureCount; i++) {
	 			
	 			var fieldType=$("#field_"+i).attr("type");
	 			var fieldSrc=$("#field_"+i).attr("src");
	 			if(fieldType == 'image' &&  fieldSrc !=''){
	 			   $("#field_"+i).attr('src', sign);		
				
	 			}
	 		}
	     }
	}
	
}
//upload siggnature code
function filevalidate() {
	$("#file_error").html("");
	$(".demoInputBox").css("border-color","#F0F0F0");
	var file_size = $('#imgInp')[0].files[0].size;
	var fileInput = document.getElementById('imgInp');
	var filePath = fileInput.value;
    var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.bmp)$/i;
    if(!allowedExtensions.exec(filePath)){
    	
    	$("#file_error").show();
    	$("#file_error").html('<spring:message code="label.slf_uplod"/>').fadeOut(10000);;
        fileInput.value = '';
        return false;
    }   
    else if(file_size>10485760) {
		
		$("#file_error").show();
		$("#file_error").html("<spring:message code="label.fil_siz"/>").fadeOut(10000);
		$(".demoInputBox").css("border-color","#FF0000");
		return false;
	} 
	return true;
}
function readURL(input) {
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
		    	     url : contextPath+"saveResizeSignature",   
		    	     dataType: 'json',
		 		     contentType: "application/json; charset=utf-8",
		 		     data: JSON.stringify(data),
		    	     beforeSend : function(xhr) {	                
		   	    	 xhr.setRequestHeader(header, token);
			   			$("#loader1").show();
				     },
				     complete: function () {
				    	 $("#loader1").hide();
				     },
					 success : function(response) {   
		
						 $("#show_upload_signature").hide();
						 $("#blah").show();
						 $("#file_error").hide();
		    	    	 $('#blah').attr('src', 'data:image/jpeg;base64,'+<c:out value="response"></c:out>);	 
		    	    	 $("#default_sign_check_upload_show").show();
		    		 },  
		    	     error : function(e) {  
		    	      alert('Error: readurl' );
		    	//      console.log("ERROR : ", JSON.stringify(e));
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
  readURL(this);
});


//End Draw Singature



</script>

	<script src="<%=appUrl%>/js/jquery-ui.js"></script>
	<script src="<%=appUrl%>/js/jquery.signature.js"></script>
	<script src="<%=appUrl%>/js/jquery.ui.touch-punch.js"></script>
	<script>
$(function() {
	// Initalize
	$('#signature').signature();

	// Clear signature area
	$('#clear').click(function() {
		$('#signature').signature('clear');
	});

});
function clearUploadSignature(){
	$('#blah').attr('src', '');
    $("#imgInp").val("");
    $("#show_upload_signature").show();
    $("#blah").hide();
		
}
</script>
	<!-- Signature download from OneDrive and DropBox -->
	
	<script type="text/javascript" src="<%=appUrl%>/js/dropins.js"
		id="dropboxjs" data-app-key="kktaxdj1402ec7u"></script>
	<script type="text/javascript">
	
	
  function launchOneDrivePicker(){
       
	  currentURL = window.location.href;
		//console.log(currentURL);
       var keyURL = currentURL.split("=");
       //console.log(keyURL[1]);
      var keyNew = keyURL[1].replace("#","");
      //console.log(keyNew);
                var odOptions = {
                       clientId: "0aa725db-3ba9-486d-8e42-a92554639a6d",
                       action: "download",
                       multiSelect: false,
                       linkType: "webViewLink",
                       advanced: {filter: ".png,.jpg,.jpeg,.bmp",
                           redirectUri: "<%=appUrl1%>/filePickerRedirect"},
                       success: function(response) { 

                    	   $("#loader1").show();
                    	   var downloadurl =  response.value[0]["@microsoft.graph.downloadUrl"];
                             var name = response.value[0]["name"];
                           //  console.log("done-->"+downloadurl);
                          //   console.log("done-->"+name);
                           
                             saveonedriveFile(downloadurl,name)
                            
                       },
                       cancel: function() {  },
      				  error: function(e) { 
      					  alert(e); 
      					  $("#loader1").hide();
      					  }
      				  }
                
       
    OneDrive.open(odOptions);
}
  
  function saveonedriveFile(downloadedUrl,fileName) {
              
              var token = $("meta[name='_csrf']").attr("content");
                     var header = $("meta[name='_csrf_header']").attr("content");
                     var contextPath=$("#contextPath").val();
                     
                     $.ajax({
                           url: contextPath+"saveonedriveFile",
                           type: "POST",
                           datatype:'json',
                           Accept : "application/json",
                         contentType: "application/json",
                           data: JSON.stringify({ "downloadedUrl":downloadedUrl , "fileName" :fileName }),
                           beforeSend: function (xhr) {
                                   xhr.setRequestHeader(header, token);                       
                                  $("#loader1").show();
                         },
                         complete: function () {                           
                                 $("#loader1").hide();
                               },
                               
                            success:function(response){
                               //alert('success');
                               $("#show_upload_signature").hide();
                               $("#blah").show();
                               $('#blah').attr('src', 'data:image/jpeg;base64,'+<c:out value="response"></c:out>);
                            
                         },
                         error: function(err){
                        	 alert('Error: ' + err);
                        	 $("#loader1").hide();
                         }
                     })
              }
  
 

document.getElementById("dropbox").onclick = function () {
       Dropbox.choose({
        success: function(files) {
 	    $("#loader1").show();

        //  console.log(files);
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
                           $("#loader1").show();
                  },
                  complete: function () {                     
                           $("#loader1").hide();
                         },
                         
                      success:function(response){
                           $("#show_upload_signature").hide();
                           $("#blah").show();
                           $('#blah').attr('src', 'data:image/jpeg;base64,'+<c:out value="response"></c:out>);
                     
                  },
                  error: function(err){
                	  alert('Error: ' + err);
                	  $("#loader1").hide();
                  }
              })
       }
</script>
	<!-- Signature download from Google Drive -->
	<script type="text/javascript" src="<%=appUrl%>/js/filepickerapi.js"></script>
	<script>
   var file = null;
     
               function initPicker() {
            	  //alert('init Picker called');
                     var picker = new FilePicker({
                    	 apiKey: 'AIzaSyBOIfItfyHfT9DM2vYIPN_XwuD8B2HhLyc',
       		          clientId:'927346535684-gkrnjl6o6akimdjse81gp3lb1j79n957.apps.googleusercontent.com',
                           buttonEl: document.getElementById('googlePic'),
                           onSelect: function(file) {
                                  $("#loader1").show();
                                  $("#filenamedrive").val(file.title);
                           //     $(".file-upload-input").val(file.title);
                                  $("#fileIddrive").val(file.id);
                             //     console.log(file);
                                  downloadImg();
                           //     document.getElementById("save").click();
                                  //alert('Selected File ' + file.title);
                                  //alert('Selected file Id ' + file.id);
                           }
                     });    
              } 
               
              function downloadImg() {
                     var fileId = $("#fileIddrive").val();
                     var fileName = $("#filenamedrive").val();
                     var byteArray = [];
                     if (fileId) {
                    //       console.log("fileId: ::" + fileId);
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
                //     console.log(contextPath);
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
                                   $("#loader1").show();
                            
                         },
                         complete: function () {
                         // $("#jumpstep2").buttonLoader('stop');
                            console.log("aasdas");
                            $("#loader1").hide();
                         },
                           
                         success:function(response){
                            //alert("sign doc success called");
                            
                            
                            $("#show_upload_signature").hide();
                            $("#blah").show();
                            $('#blah').attr('src', 'data:image/jpeg;base64,'+<c:out value="response"></c:out>);
                         },
                         error: function(err){
                        	 alert('Error: ' + err);
                        	 $("#loader1").hide(); 
                         }
                     })
              }
       </script>
	<script src="https://apis.google.com/js/client.js?onload=initPicker"></script>

	<script type="text/javascript">
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
	 	    	  $('#blah').attr('src', 'data:image/jpeg;base64,'+<c:out value="response"></c:out>);
	          
	        },
	        error: function(err){
	          
	        }
	    })
			 }else{
				 $("#file_error").show();
			     	$("#file_error").html('<spring:message code="label.slf_uplod"/>').fadeOut(10000);;
			         fileInput.value = '';
				 
			 }
	    
	 }   
	 /* end Egnyte javascript code */
 </script>
	<script>
function qualityImprove(val){
	//alert('Page :'+val);
var appURL="<%=appUrl %>";	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var contextPath=$("#contextPath").val();
	
	var userId='${signRequestedBy}';
	var fileId = '${docId}';
	var fileName = fnm;
	var numpages = $("#numpages").val();
	pdfInfo = pdfInfo2;
	//alert(JSON.stringify(pdfInfo));
	//alert("$(window).scrollTop():" + $(window).scrollTop());
	var i= calculatePageNo(pdfInfo.heights, $(window).scrollTop());
	//alert("Page no: " + i);
	//console.log('contextPath :'+contextPath+' userId :'+userId+' docId :'+fileId+' fileName :'+fileName+' numpages :'+numpages+' pdfInfo'+pdfInfo);
	width = pdfInfo.widths[i -1];
	height = pdfInfo.heights[i -1 ];
	
	$.ajax({
		type : "GET",
		url : contextPath+'imgQuality?fileid='+fileId+'&filename='+fileName+'&page='+i+'&userId='+userId+'&numpages='+numpages,
		//async: false, //loader work after comment async
		
		beforeSend : function(xhr) {
			//alert('beforeSend')
			$("#loader1").show();
			xhr.setRequestHeader(header, token);
		},
		complete : function() {
			//alert('complete')
			$("#loader1").hide();
		},
		success : function(response) {
	
		var  imgSrc=appURL+"/docimages/"+fileId+"/"+i+"_enhance.png";
		$('#'+i).replaceWith( '<div class="drop" id="'+i+'"><img width="'+ pdfInfo.widths[i - 1] +'px" height="' + pdfInfo.heights[i - 1] + 'px" class="render-image" onload="loadImage()" src='+imgSrc+'></div>' );
				
		},
		error : function(response) {
			
		},
	});
	
}	

$(window).scroll(function () {
   
    document.getElementById("qa").value = pageNoDetect();
});

function pageNoDetect() {
    var pageNo;
    var top = $(window).scrollTop();
    //var top = $("#mCSB_1_container").css("top");
    var Total_Page = $("#numpages").val();
    var page_height = $("#pageHeight").val();
    var page = [Total_Page];
    for(var i=0;i<=Total_Page;i++){
           page[i] =  i* (page_height-100);
        
    }
    //console.log('top pageNoDetect '+top)
    //console.log('page pageNoDetect '+page);
   // top = top.replace("-","");
    //top = top.replace("px","");
    for(var i=0;i<page.length;i++){
           var val =  i + 1;
           if(parseInt(top) >= parseInt(page[i]) && parseInt(top) <= parseInt(page[val])){
                  pageNo = val;
           } 
    }
   return pageNo;
}

	function calculateY(response, key, heights){
		var sum = 0.0;
		if(response[key].pageNumber > 1 ){
		    for(var i = 0; i < response[key].pageNumber-1; i++){
		    	sum += parseFloat(heights[i]);
		    }
		}
		//alert("For Page " + response[key].pageNumber + " sum: " + sum + " response[key].yPosition: " + response[key].yPosition);
		return parseFloat(sum) + parseFloat( response[key].yPosition);
	}
	
	/* function calculatePageNo(heights, height){
		var sum = 0.0;	
		for (var i = 0; i < heights.length; i++){
			sum += parseFloat(heights[i]);
		    if (height < sum) {
		    	return i + 1;	
		    }
		}
		return 1;
	} */
	

	function encrypt(){
		var value = $("#doc_key").val();
		var iv = CryptoJS.lib.WordArray.random(128/8).toString(CryptoJS.enc.Hex);
	    var salt = CryptoJS.lib.WordArray.random(128/8).toString(CryptoJS.enc.Hex);
	    var aesUtil = new AesUtil(128, 1000);
	    var ciphertext = aesUtil.encrypt(salt, iv, "1234567891234567", value);
	    var aesPassword = (iv + "::" + salt + "::" + ciphertext);
	    var passwordEncript = btoa(aesPassword);
	   	$("#doc_key").val(passwordEncript);
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

</script>

	<input type="hidden" id="fname"
		value="<c:out value="${filename}"></c:out>" />
	<input type="hidden" id="isSaved"
		value="<c:out value="${isSaved}"></c:out>" />
	<input type="hidden" id="returnURL"
		value="<c:out value="${returnURL}"></c:out>" />
	<input type="hidden" id="fileid"
		value="<c:out value="${fileId}"></c:out>" />
	<input type="hidden" id="email" value="<c:out value="${email}"></c:out>" />
	<input type="hidden" id="token" value="<c:out value="${key}"></c:out>" />
	<input type="hidden" id="redirecturl" value="" />
	<input type="hidden" id="envelopeid"
		value="<c:out value="${envelopeid}"></c:out>" />
	<input type="hidden" id="imageField" value="" />
	<input type="hidden" id="fieldLength" value="0" />
	<input type="hidden" id="myType" value="" />
	<input type="hidden" id="initial" value="0.0" />
	<input type="hidden" id="setIndexPixel" value="0" />
	<input type="hidden" id="checkFlag" value="true" />
	<input type="hidden" id="isLogin" value="false" />
	<input type="hidden" id="mysignatutreVal" value="" />
	<input type="hidden" id="progresscount" value="" />
	<input type="hidden" id="drawsignature_no" value="" />
	<input type="hidden" id="projectName"
		value="<c:out value="${projectName}"></c:out>" />
	<input type="hidden" id="signerName"
		value="<c:out value="${signerName}"></c:out>" />
	<input type="hidden" id="drawBase64"
		value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAALQ0lEQVR4Xu3W0QkAIAxDQV3W/Teo4BQ+uE4QLv3InpmzHAECBAgQIECAAAECXwtsw/3rfoQjQIAAAQIECBAg8AQMd49AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDgAqC3dsd5CiH1AAAAAElFTkSuQmCC" />
	<input type="hidden" id="drawBaseIE64"
		value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAPbSURBVHhe7dZBEcAwDMCwbmDLn0H2GYj4TvqYgp+ZuQcAAFjt/QsAACxm3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAACw3jkfMvcE1ytbuLQAAAAASUVORK5CYII=" />

	<input type="hidden" id="drawBaseMozilla64"
		value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAAD2UlEQVR4nO3WMREAIBDAMNTi38EjgRF6lyF7x66Z2QAAwN/W6wAAAODOuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAg4AAckOtgbGrrvgAAAABJRU5ErkJggg==" />
	<input type="hidden" id="drawBaseMozilla641"
		value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAACNElEQVR4nO3BMQEAAADCoPVPbQwfoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIC/AYTiAAFN6tGQAAAAAElFTkSuQmCC" />
	<input type="hidden" id="tdrawBaseIE64"
		value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAALOklEQVR4Xu3WQQ0AAAgDMfBvGhtcUhQsHY/tOAIECBAgQIAAAQIE3gvs+4QCEiBAgAABAgQIECAwhrsnIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgcBBMALvhIyDxAAAAAElFTkSuQmCC" />
	<input type="hidden" id="drawBaseSafari64"
		value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAALQ0lEQVR4Ae3WQQ3AQAwDweuBLX8GqVQUWWmCwBrn4Wdm3uMIECBAgAABAgQIEFgtcFenE44AAQIECBAgQIAAgV/AcPcIBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEPjL3BNcQbtHHAAAAAElFTkSuQmCC" />
	<input type="hidden" id="drawBaseSafari641"
		value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAALQElEQVR4Ae3WwQ0AIAwDMWD/nYvYgpPcCSKnj+yZWY4AAQIECBAgQIAAgb8Fzt/xpCNAgAABAgQIECBA4AkY7v6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQIDABT9oBHGy6bCzAAAAAElFTkSuQmCC" />
	<input type="hidden" id="drawBaseIE641"
		value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAI0SURBVHhe7cExAQAAAMKg9U9tDB8gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4K4GhOIAAQ18YIgAAAAASUVORK5CYII=">

	<input type="hidden" id="signatureCount" value="" />
	<input type="hidden" id="pageHeight" value="" />
	<input type="hidden" id="heights" value="" />
	<input type="hidden" id="numpages" value="" />
	<input type="hidden" id="requiredCount" value="" />


	<script src="<%=appUrl%>/js/signaturePadLoad.js"></script>

</div>
</body>


</html>