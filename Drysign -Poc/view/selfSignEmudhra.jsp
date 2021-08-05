<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" import="java.io.*,java.util.*" %> 
<%@ page import = "java.util.ResourceBundle" %>
<%@ page import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.core.Authentication" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<% 
ResourceBundle resource = ResourceBundle.getBundle("commonsutils");
String hostURL =resource.getString("server.url");
String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
Date date = new Date();
SimpleDateFormat ft = new SimpleDateFormat ("MM/dd/YYYY"); // 05/19/2021
%>
<% Authentication auth = SecurityContextHolder.getContext().getAuthentication(); %>
<% Registration registration = (Registration)auth.getPrincipal(); %>

 <jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="<%=appUrl %>/css/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="<%=appUrl %>/css/jquery-ui.css">
<link rel="stylesheet" href="<%=appUrl %>/css/materialize-tags.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="<%=appUrl %>/css/buttonLoader.css" rel="stylesheet" type="text/css">
<link href="<%=appUrl%>/css/signaturepad.css" rel="stylesheet">
<script src="<%=appUrl %>/js/jsapi.js"></script>

<link href="<%=appUrl %>/css/materialize.css" rel="stylesheet"/>

<div id="loader2" class="loader2" style="display:none">
	<div class="loaderdiv">
		 <p><img src="<%=appUrl %>/images/drysign_logo_mono.svg"></p>
		<p><img src="<%=appUrl %>/images/drysign-logo-line_only.gif" ></p> 		
		<p><spring:message code="label.wait"/></p>
	</div>
</div>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper bg_wrap">
  <div class="container-fluid">
    <!-- breadcrumb -->
	<ol class="breadcrumb col-md-9 col-sm-9 col-xs-12">
	<li class="Groupsignhead"><spring:message code="label.selfsign"/> |</li>
		<li><a href="<%=appUrl %>/app/dashboard"><spring:message code="label.dash"/></a></li>
		<li class="active"><spring:message code="label.selfsign"/></li>
		
	</ol>
	 <ul class="list-inline col-md-3 col-sm-3 col-xs-12 nopadding rightPos">
                     <!-- <li id = "isStepOne">
                        <button type="button" id="jumpstep2" class="btn btn-primary next-step " disabled><spring:message code="label.svnxt"/></button>
                      </li>
                                           
                      <li id = "isStepTwo" style = "display:none">
                      <div class="tooltip1 tooltip-w">
                        <button type="button" id="jumpstep3" class="btn btn-primary next-step" disabled><spring:message code="label.svnxt"/>
                      <%--   <span class="tool-tip tooltiptext tooltip-top tooltip_css"><spring:message code="label.slffields"/></span> --%>
                        	 </button>
                       </div>
                      </li> -->
                                        
                      <li id = "isStepThree" style = "display:none">
                       <!-- <button type="button"  class="btn btn-red font-16" onclick="checkEmailValid();">TEST</button> -->
                       <!-- <button class="btn has-spinner btn-default" type="submit">Button</button> -->
                       <!--  <button type="button"  id="skipandsend" class="btn btn-light" onclick="saveDocumentPopUp('skipandsend');"><spring:message code="label.skp_snd"/></button>-->
                         <!-- <button type="button"  onClick="window.location.href = 'selfSign_message.html';"  class="btn btn-primary next-step">Send</button> -->
                         <button type="button" id="send" onclick="saveSelfsign2('send');" class="btn btn-primary next-step"><spring:message code="label.sendmail"/></button>
                      </li>
                   
                    
        </ul>
	  </div>
        <!-- breadcrumb -->
        
        <!-- Main content -->
        
    <div class="container-fluid">   
    <div id="show-selfsign-steps">
    <div class="wizard signature drysign-wizard">
      <div class="wizard-inner group-sign">
     
        
        <%-- <ul class="nav nav-tabs" role="tablist">
		  <li role="presentation" id="steplist1" class="disabled"> <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" ><img class="selfsignsvg backgroundstep" src="<%=appUrl %>/images/step1_selfsign_1.svg" alt="submit" /> </a> </li>
          <li role="presentation" id="steplist2" class="disabled"> <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" > <img class="selfsignsvg1 backgroundstep" src="<%=appUrl %>/images/step2_selfsign_2.svg" alt="submit" /></a> </li>
         
          <li role="presentation" id="steplist3" class="disabled"> <a href="#step3" data-toggle="tab" aria-controls="complete" role="tab" ><img class="selfsignsvg2 backgroundstep" src="<%=appUrl %>/images/step3_selfsign_3.svg" alt="submit" /></a> </li>
        </ul> --%>
         <ul class="nav nav-tabs" role="tablist">
			<!-- <li role="presentation" id="steplist1" class="disabled iconSize"> 
				<a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" >
					<span class="wizardStatusIcon active"></span>
					<span class="texticon">Upload</span>
					<span class="wizardArrowIcon active"></span>
				</a> 
			</li>
            
            <li role="presentation" id="steplist2" class="disabled iconSize"> 
            <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" >
            <span class="wizardStatusIcon"></span>
            <span class="texticon">Sign</span>
            <span class="wizardArrowIcon"></span>            
            </a> 
            </li>   -->
            <li role="presentation" id="steplist3" class="disabled iconSize"> 
            <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" >
            <span class="wizardStatusIcon"></span>
            <span class="texticon">Recipients</span>            
            </a> 
            </li>
        </ul>
      </div>
      <!-- <form role="form"> -->
      <div class="tab-content accordion"> 
        <!-- Personal Information -->
       <!--  <div class="tab-pane" role="tabpanel" id="step1">
          <div class="step1">
            <section>
              <div class="row_center">
                <div class="col-md-6 col-sm-8 col-xs-12 col-centered">
                  <div>                  
                    <div id = "dropzone" class="row uploadFileSelfSignGroupSign">                    
                      <div class="upload-fild col-lg-6 col-md-6 col-sm-6 col-xs-6">                      
                        
                          <div class="custom-file-upload">
                          <div class="icon fileUploadIcon">
     						<i class="fa fa-cloud-upload" id="cloudUpload_sign" aria-hidden="true"></i>
     						<input id="fileupload" type="file" style="border:none!important"name="files" accept=".pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx,.txt,.rtf,.jpg,.jpeg,.gif,.bmp,.png,.htm,.html,.tiff">
     					</div>
     					
   						<span>Drag & Drop or Browse </span>
   						 </div>
   						 </div> -->
							<!--<label for="file">File: </label>--> 
							<!-- <input type="file" id="fileupload" placeholder="Please select uploaded file" name="files[]" /> -->
							  <!-- <input id="fileupload" placeholder="Please select uploaded file" type="file" name="files" accept=".pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx,.txt,.rtf,.jpg,.jpeg,.gif,.bmp,.png,.htm,.html,.tiff"> -->
					<!--  	<div class="col-md-6 col-xs-6 nopadding">
							  <c:forTokens items="${features1}" delims="," var="feature1">
							 <c:if test="${feature1 eq 1 }">
							  <button data-placement="top" type="submit" class="tooltip1" id="pick"style="border: 0;background: transparent;">
								<span class="tooltiptext tooltip-bottom"><spring:message code="label.googleDrive"/></span>
								<img src="<%=appUrl %>/images/Drive.png" width="25" height="25" alt="submit" />
								</button>
								</c:if>
								<c:if test="${feature1 eq 2 }">
								<button data-placement="top" type="submit" class="tooltip1" id="dropbox"style="border: 0;background: transparent;">
								<span class="tooltiptext tooltip-bottom"><spring:message code="label.db"/></span>
								<img src="<%=appUrl %>/images/Dropbox.svg" width="25" height="25" alt="submit" />
								</button>
								</c:if>
								<c:if test="${feature1 eq 3 }">
								<button data-placement="top" type="submit" class="tooltip1" id="onedrive" onclick="launchOneDrivePicker(1)" style="border: 0;background: transparent;">
								<span class="tooltiptext tooltip-bottom"><spring:message code="label.od"/></span>	
								<img src="<%=appUrl %>/images/Cloud.svg" width="30" height="30" alt="submit" />
								</button>
								</c:if>
							 </c:forTokens><br/>
						<span class="uploadFromIcon">Or Upload from here </span>
						</div>	
						
				
                    </div>
                    	     <span id="show_upload_error" class="error"></span>
                  </div>
                    <div class="uploadSuccessHeading row">
                  <h3>Document</h3>
                  <div><span id="uploadSuccess"></span>
                  <span id="remove-icon"></span></div>
                  <span id="fileSizeandDate"></span> 
                  <span>File Size- <span id="fileSize"></span> &nbsp;&nbsp; Date- <span id="uploadDate"></span></span>
                  <hr/>
                  </div>
                </div>
                 <div class="col-md-6 col-sm-6 col-xs-12 pdfShow">
                <div class="pdf_view">
					  	<div class="force-overflow">
						  	 <div class="pdf-inner mCustomScrollbar">
						 	 	   
					  			<div class='document-reader-firststep' id="document-reader-firststep">
		                          	<div id='draggable-signature' class="fixed"></div>
	                      		</div>
	                      </div>
					
						  </div>
					  </div>
                </div>
              </div>
            </section>
          </div>
          
           button 
          
        </div> -->
        
        <!-- Profestional Information -->
        <!-- <div class="tab-pane" role="tabpanel" id="step2">
          <div class="step2">
            <section>
              <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="self-slide">  
                	 <div class="pollSlider">
                	 <div id="pollSlider-button"><span class="fa fa-angle-double-left"></span></div>                 		
               			 <div class="header-text">
               			 	<div class="menuIcon fields"></div><span>FIELDS</span>
					 		 <i id="i-drag-drop"><spring:message code="label.srg_drp"/></i> 
			 			</div>
					 	<div class="text-center">
					 
					 	<div class="menuIcon fullname">
				 			<div id="signer-1" class="dragMe dragSigners" data-signer-id="1" data-document-id="1" title="Full Name">
                          		 <spring:message code="label.slf_name"/>
                           	</div>
                           </div>	
                           <div class="menuIcon date">
                           <div id="signer-2" class="dragMe dragSigners" data-signer-id="2" data-document-id="1" title="Date">
                             <spring:message code="label.slf_date"/>
                           </div>
                           </div>
                           <div class="menuIcon textbox">
                           <div id="signer-4" class="dragMe dragSigners" data-signer-id="4" data-document-id="1" title="Textbox">
                             TEXTBOX
                           </div>
                           </div>
                           <div class="menuIcon initials">
                           <div id="signer-6" class="dragMe dragSigners" data-signer-id="6" data-document-id="1" title="Initials">
                             INITIALS
                           </div>
                           </div>
                           <div class="menuIcon sign">
                           <div id="signer-3" class="dragMe dragSigners" data-signer-id="3" data-document-id="1" title="Signature">
                             <spring:message code="label.edt_sgn"/>
                           </div>
                           </div>
							<div class="menuIcon sign_stamp">
                            <div id="signer-5" class="dragMe dragSigners sintatureStamp " data-signer-id="5" data-document-id="1" title="Signature & Stamp">
                             <spring:message code="label.edt_sgn_stamp"/>
                           </div>
                           </div>  
					 </div>	 
                 </div>
				 <div id="pollSlider-button"><span class="icon-arrow_left"></span>
				<div class="rotedtext"><spring:message code="label.addfields"/></div>
				</div> 
                </div>
                  <div class="signature">
                    
				  <div class="pdf_view">
				  	<div class="force-overflow">
					 	 <div class="pdf-inner mCustomScrollbar" >
					 	 		<div id="loader2" class="loader"></div>
				  			 <div class='document-reader' id="document-reader">
	                          	<div id='draggable-signature' class="fixed">
	                          	
	      
	                        </div>
                      </div>
                      </div>
                    </div>
				  	 
					  </div>
                  
                    <ul class="list-inline text-right">                     
                      <li>
                      <div class="tooltip1 tooltip-w">
                        <button type="button" id="jumpstep3" class="btn btn-primary next-step" disabled><spring:message code="label.svnxt"/>
                        <span class="tool-tip tooltiptext tooltip-top tooltip_css"><spring:message code="label.slffields"/></span>
                        	 </button>
                       </div>
                      </li>
                    </ul> 
                  </div>
                  
                <div class="self-slide">  
                 <div class="pollSlider">
                 
                 <div class="main-content">
                 
                
                 	
					 <div class="header-text text-center">
						 <i id="i-drag-drop"><spring:message code="label.srg_drp"/></i>
					 </div>
					 
					 <div class="text-center margTB20" id="draggable1">
					 		<div id="signer-1" class="dragMe dragSigners btn btn-light-oragne margB20" data-signer-id="1" data-document-id="1">
                           		 <span class="icon-menu pull-left"></span><spring:message code="label.slf_name"/><span class="icon-menu pull-right"></span>
                            </div>
                            
                            <div id="signer-2" class="btn btn-light-yellow margB20 dragMe dragSigners" data-signer-id="2" data-document-id="1">
                              <span class="icon-menu pull-left"></span><spring:message code="label.slf_date"/><span class="icon-menu pull-right"></span>
                            </div>
                            
                            <div id="signer-3" class="btn btn-light-Bermuda margB20 dragMe dragSigners" data-signer-id="3" data-document-id="1">
                              <span class="icon-menu pull-left"></span><spring:message code="label.edt_sgn"/><span class="icon-menu pull-right"></span>
                            </div>
                            
                             <div id="signer-4" class="btn btn-light-purple margB20 dragMe dragSigners" data-signer-id="4" data-document-id="1">
                              <span class="icon-menu pull-left"></span><spring:message code="label.slf_text"/><span class="icon-menu pull-right"></span>
                            </div>
                            
                             <div id="signer-5" class="btn btn-light-blue margB20 dragMe dragSigners" data-signer-id="5" data-document-id="1">
                              <span class="icon-menu pull-left"></span>CHECKBOX<span class="icon-menu pull-right"></span>
                            </div>
                            
                            <div id="signer-6" class="btn btn-light-brown margB20 dragMe dragSigners" data-signer-id="6" data-document-id="1">
                              <span class="icon-menu pull-left"></span><spring:message code="label.slf_initial"/><span class="icon-menu pull-right"></span>
                            </div>
					 	
					 </div>
					 </div>
                 </div>
				<div id="pollSlider-button"><span class="icon-arrow_left"></span>
				 <div class="rotedtext"><spring:message code="label.addfields"/></div>
				</div>
                </div> 
				  </div>
                Buttons 
                
              </div>
            </section>
          </div>
        </div> -->
        
        <!-- Profestional Information -->
        <div class="tab-pane" role="tabpanel" id="step3">
          <div class="step3">
            <section>
              <form id="step3-form">
              <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div>
                 
                    
					  <div class="row ">
					  
					   
					  	<div class="col-md-6 col-sm-6 col-xs-12 form-group disabled">
							 <label><spring:message code="label.slffrm_add"/></label> <input type="text" class="readOnlyEmail" id=""
								 value="<c:out value="<%=registration.getEmail()%>"></c:out>"readonly class="form-control">
						</div>
				
						<div class="col-md-6 col-sm-6 col-xs-12 form-group tooltip1">
							<label><spring:message code="label.slfrec_add"/><span class="redstar">*</span></label> <input type="text" id="recipients" 
							name="recipients" class="form-control" autocomplete="off">
							<span class="tool-tip tooltiptext  tooltip-down tooltip_css" id="ttip1"></span>
						</div>
						</div>
						
						<div class="row">
						<div class="col-md-6 col-sm-6 col-xs-12 form-group tooltip1">
							<label><spring:message code="label.slf_cc"/></label> <input type="text" id="cc" 
							name="cc" class="form-control validate" autocomplete="off">
							 <span class="tool-tip tooltiptext  tooltip-down tooltip_css" id="ttip"></span>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12 form-group">
							<label><spring:message code="label.slf_sub"/><span class="redstar">*</span></label> <input type="text" id="subject" 
							 maxlength = 255 name="subject" class="form-control validate" autocomplete="off">
						</div>
					  </div> 
					 
                   
                    <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 form-group">
							<label><spring:message code="label.slf_msg"/><span class="redstar">*</span></label> <textarea id="message" name="message" class="materialize-textarea"></textarea>
						</div>
					  </div>
                    <div class="row col-lg-12">
						  <span id="ckeditor_error"class="error"><spring:message code="label.slf_msgval"/></span>
					</div>
					 
                  
                    
                  </div>
                
				  </div>
                <!-- Buttons --> 
                
              </div>
              </form>
            </section>
          </div>
        </div>
        <div class="clearfix"></div>
      </div>
<!--       </form> -->
    </div></div>
    <div>

	<input  type="text" id="filename" type="text" style="display: none;" >
	<input  type="button" id="save" value="save" onclick="download()" style="display: none;"></button>
	<input type="hidden" id="fileId">

</div>

    
</div>
    
    
    <!-- /.content --> 
  </div>
  
<jsp:include page="footer.jsp"></jsp:include>
<input type="hidden" id="docId" value=""/>
<input type="hidden" id="draftId" value=""/>
<input type="hidden" id="stepNumber" value=""/>
<input type="hidden" id="myType" value=""/>
<input type="hidden" id="drawBase64" value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAALQ0lEQVR4Xu3W0QkAIAxDQV3W/Teo4BQ+uE4QLv3InpmzHAECBAgQIECAAAECXwtsw/3rfoQjQIAAAQIECBAg8AQMd49AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDgAqC3dsd5CiH1AAAAAElFTkSuQmCC"/>
<input type="hidden" id="drawBaseIE64" value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAPbSURBVHhe7dZBEcAwDMCwbmDLn0H2GYj4TvqYgp+ZuQcAAFjt/QsAACxm3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAACw3jkfMvcE1ytbuLQAAAAASUVORK5CYII="/>
<input type="hidden" id="drawBaseMozilla64" value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAAD2UlEQVR4nO3WMREAIBDAMNTi38EjgRF6lyF7x66Z2QAAwN/W6wAAAODOuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAgwLgDAECAcQcAgADjDgAAAcYdAAACjDsAAAQYdwAACDDuAAAQYNwBACDAuAMAQIBxBwCAAOMOAAABxh0AAAKMOwAABBh3AAAIMO4AABBg3AEAIMC4AwBAgHEHAIAA4w4AAAHGHQAAAow7AAAEGHcAAAgw7gAAEGDcAQAg4AAckOtgbGrrvgAAAABJRU5ErkJggg=="/>
<input type="hidden" id="isstep3" value=""/>
<input type="hidden" id="isRemoveIconVisible" value="0"/>
 <!--  Signatucher Tab -->
 <input type="hidden" id="drawsignature_no" value=""/>
 <%-- <div class="Message" id="show-selfsign-success" style="display:none;width:700px;">
    	   <div class="Content-wh-module text-center" id="success_doocument">
		   			<img src="<%=appUrl %>/images/message-bg.png"/>		   	
			  		 <h4 class="message-text text-color-burmoda" id="success-messgae"></h4>
					  <p class="font-16" style="margin-top: 50px; width: 600px; max-width: 90%;margin: 0 auto; "><span id="success-messgae-email"></span>
						   <spring:message code="label.check_doc"/> > <a href="<%=appUrl %>/app/myfiles?tab=completed"> <spring:message code="label.cmplt_doc"/></a>.</p>
					 <a style="margin-top: 50px;" type="submit" value="GO to dashboard" href="<%=appUrl %>/app/dashboard" class="btn btn-primary font-24"><spring:message code="label.todash"/></a>
		   </div>
		      
    </div> --%>
    <div class="modal fade in" id="show-selfsign-success" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					
					<div class="modal-body text-center">
					<div class="Content-wh-module text-center" id="success_doocument">
		   			<img src="<%=appUrl %>/images/message-bg.png"/>		   	
			  		 <h4 class="message-text text-color-burmoda" id="success-messgae"></h4>
					  <p class="font-16" style="margin-top: 50px; width: 600px; max-width: 90%;margin: 0 auto; "><span id="success-messgae-email"></span>
						   <spring:message code="label.check_doc"/> > <a href="<%=appUrl %>/app/myfiles?tab=completed"> <spring:message code="label.cmplt_doc"/></a>.</p>
					 <a style="margin-top: 50px;" type="submit" value="GO to dashboard" href="<%=appUrl %>/app/dashboard" class="btn btn-primary font-24"><spring:message code="label.todash"/></a>
		   </div>
					</div>
					</div>
					</div>
					</div>
    <%-- <div  class="Message" id="show-selfsign-error" style="display:none;width:700px;">
    	   <div class="Content-wh-module text-center" id="error_doocument">
		   			<img src="<%=appUrl %>/images/fail.png"/>		   	
			  		 <h4 class="message-text text-color-burmoda" id="error-messgae" style="color:#e83123"></h4>
					  <p class="font-16" style="margin-top: 50px; width: 600px; max-width: 90%;margin: 0 auto; "><span id="success-messgae-email"></span>
						   <spring:message code="label.check_doc"/> > <a href="<%=appUrl %>/app/myfiles?tab=completed"> <spring:message code="label.cmplt_doc"/></a>.</p>
					 <a style="margin-top: 50px;" type="submit" value="GO to dashboard" href="<%=appUrl %>/app/dashboard" class="btn btn-primary font-24"><spring:message code="label.todash"/></a>
		   </div>
		      
    </div> --%>
    <div class="modal fade in" id="show-selfsign-error" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					
					<div class="modal-body text-center">
					<div class="Content-wh-module text-center" id="error_doocument">
		   			<img src="<%=appUrl %>/images/fail.png"/>		   	
			  		 <h4 class="message-text text-color-burmoda" id="error-messgae" style="color:#e83123"></h4>
					  <p class="font-16" style="margin-top: 50px; width: 600px; max-width: 90%;margin: 0 auto; "><span id="success-messgae-email"></span>
						   <spring:message code="label.check_doc"/> > <a href="<%=appUrl %>/app/myfiles?tab=completed"> <spring:message code="label.cmplt_doc"/></a>.</p>
					 <a style="margin-top: 50px;" type="submit" value="GO to dashboard" href="<%=appUrl %>/app/dashboard" class="btn btn-primary font-24"><spring:message code="label.todash"/></a>
		   </div>
					</div>
					</div>
					</div>
					</div>
					<div class="modal fade in" id="skippopup" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
	  <div class="modal-header">
	  	<!-- <a class="close" href="#"><span class="icon-close"></span></a> -->
	  	<h4 class="modal-title"><spring:message code="label.saveAndSend"/></h4>
	  </div>
	  
	  	<div class="modal-body">		 	
		 	<p><spring:message code="label.finishWorkingDoc"/>
		 	</p>
		 </div>	
	 
		 
	  <div class="text-right">	
	  	<button type="button" class="btn btn-light" id="decline" ><spring:message code="label.s_dec"/></button>  
	  	<button type="button" class="btn btn-primary" onclick="saveSelfsign2('skipandsend')" ><spring:message code="label.s_accept"/></button>
		
	  	<!-- <a class="" style="color: #252f3a" id="decline" href="#">DECLINE</a>
	   	<a class="text-green" onclick="saveSelfsign('skipandsend')" href="#">ACCEPT</a>	 -->				
	  </div> 	
 </div>
 </div>
 </div>
 <!-- <div class="modal" id="showfilenotuplad">	
 	<div class="modal-dialog modal-sm">
 	<div class="modal-content">
    <div class="modal-header" >
    <p><spring:message code="label.fileFormatNotSupport"/></p>
	</div>

	<div class="text-right modal-footer">	  
		<button type="button" class="btn btn-blue" id="" onclick="hiderDonePopUp();"><spring:message code="label.ok"/></button>	
	</div> 
	</div>
	</div>
</div>
  <div class="modal fade in" id="deleteDocument" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document" id="centeralignModel">
				<div class="modal-content">
	  <div class="modal-header">
	  	 <a class="close" href="#"><span class="icon-close"></span></a>
	  	<h4 class="modal-title"><spring:message code="label.deleteUploadDocument"/></h4>
	  	</div>
	  
	  	<div class="modal-body">	
		 	<p><spring:message code="label.areYouSureDeleteDoc"/></p>
		 </div>	
	  
		 
	  <div class="text-right">	  
		<button type="button" class="btn btn-light" onclick="hiderDocumentPopUp();" ><spring:message code="label.cancel"/></button>
		<button id = "deletePopup" type="button" class="btn btn-primary" onclick="deleteDocumentPopUp();" ><spring:message code="label.out_confm"/></button>
		
	  </div> 	
 </div>
 </div>
 </div> -->

<div class="overlay-bg"></div>

<!-- Draw Signature -->
 <!-- <div class="signature-sign">
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
         		  <div class="row margTB20">
					 
				 </div> 
				 <div class="row margB20">
					  <div class="col-xs-12 text-right">
						   <a class="btn btn-light" onclick="zkSignature.clear()" href="#">Clear</a>
						   <a class="btn btn-primary" id="saveSignature" href="#">Save</a>
							 
							 <button class="btn btn-light"  id="clearSignaturepad"><spring:message code="label.clr"/></button>						   
							<button class="btn btn-primary" id="saveSignaturepad"><spring:message code="label.save"/></button>
						   
					  </div>
				  </div>
				  <div class="row margTB20">
					  <div class="col-xs-12">
					 	<div class="wrapperpad" style="background-color: #fcfcfc">
							<canvas id="signaturepad" class="signature-pad signaturepad_selfsign" width="320px" height="200px">
							</canvas>
						</div>
						</div>
						  <div class="col-xs-12" id="drawsignature_error" style="display:none">
					   <div class="alert alert-danger">
					   <i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i> <spring:message code="label.drw_sign"/>
					   <a class="close2" aria-label="close"
						onclick="$('#drawsignature_error').hide()">&times;</a>
						</div>
					  </div>
					</div>
				</div>
				<div class="tab-pane" id="upload">
         		  <div class="row margTB20">
				 </div>
				 <div class="row margB20">
					  <div class="col-xs-12 text-right">
						   <a class="btn btn-light"  href="#" onclick="clearUploadSignature();"><spring:message code="label.clr"/></a>
						   <a class="btn btn-primary"  href="#" onclick="saveUploadSignature();"><spring:message code="label.save"/></a>
					  </div>
				  </div>
				  <div class="row margTB20" id="show_upload_signature">
				   <div class="col-xs-12 head3_0 text-center">
				   	
				   <spring:message code="label.upld_pic"/>
				  
				   </div>
				    	<br> 	<br>
					  <div class="col-xs-12 text-center">
					  	<div id="upload_signature">
							<form id="form1" >
							   <label class="btn-bs-file">
                					<i class="fa fa-upload point" aria-hidden="true"></i>
                				<input type='file' id="imgInp" class="demoInputBox"  accept=".png, .jpg, .jpeg, .bmp"/>
            					</label>							  					 
							</form>
							<c:forTokens items="${features1}" delims="," var="feature1">
							 <c:if test="${feature1 eq 1 }">
							  <button data-toggle="tooltip" class="red-tooltip tooltip1" data-placement="top" type="submit" class="" id="googlePic"style="border: 0;background: transparent;padding: 6px; margin: 0;height: 36px;">
								<span class="tooltiptext tooltip-bottom"><spring:message code="label.googleDrive"/></span>
								<img src="<%=appUrl %>/images/Drive.png" width="20" height="20" alt="submit" />
								</button>
								<%-- <button data-placement="top" type="submit" class="tooltip1" id="pick"style="border: 0;background: transparent;float: right;position: absolute;right: -30px; padding: 0; margin: 0;height: 36px;top: -6px;">
								<span class="tooltiptext tooltip-bottom">Google Drive</span>
								<img src="<%=appUrl %>/images/photo.jpg" width="30" height="30" alt="submit" />
								</button> --%>
								</c:if>
								<c:if test="${feature1 eq 2 }">
								<button data-toggle="tooltip" class="red-tooltip tooltip1" data-placement="top" type="submit" class="" id="dropbox1"style="border: 0;background: transparent; padding: 6px; margin: 0;height: 36px;">
								<span class="tooltiptext tooltip-bottom"><spring:message code="label.dropbox"/></span>
								<img src="<%=appUrl %>/images/Dropbox.svg" width="20" height="20" alt="submit" />
								</button>
								</c:if>
								<c:if test="${feature1 eq 3 }">
								<button data-toggle="tooltip" class="red-tooltip tooltip1" data-placement="top" type="submit" class="" id="onedrive1" onclick="launchOneDrivePicker(2)" style="border: 0;background: transparent;padding:6px; margin: 0;height: 36px;">
								<span class="tooltiptext tooltip-bottom"><spring:message code="label.oneDrive"/></span>
								<img src="<%=appUrl %>/images/Cloud.svg" width="25" height="25" alt="submit" />
								</button>
								</c:if>
							 </c:forTokens>
							 	
								 Egnyte
								 <button onclick="return popitupEgnytePic('egnyteSign')" data-toggle="tooltip" class="red-tooltip ignyteView" data-placement="top" title="egnyte" type="submit" id="egnyte1" style="border: 0;background: transparent;right: -128px; padding: 0; margin: 0;height: 36px;top: 8px;">
									<img src="<%=appUrl %>/images/egnyte.png" width="20" height="20" alt="submit" />
								</button> 
						</div>
						
					 </div>
					  <div class="col-xs-12 text-center">
					  <br><br>
				   		<p class="text-warning" ><spring:message code="label.file_sz"/></p>
				   		<p class="text-warning"><spring:message code="label.file_frmt"/></p>
				   	</div>
					</div>
					 <div class="row margTB20" id="show_upload_error_signature">
					  	
					  	<div class="alert alert-danger"  id="file_error" style="display:none"></div>
					 </div>
					  <div class="col-xs-12 text-center">
					 <img id="blah" src="" class="img-thumbnail" width="750px" height="186px"  alt="" style="display:none"/>
					 </div>
				</div>
		 	<div class="tab-pane" id="type">
				  <div class="row margTB20">
						<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="input-field">
						<label for="last_name"><spring:message code="label.ur_name"/></label>
							
							
						</div>
						</div>
						<div class="col-md-12 col-sm-12 col-xs-12 text-right">
							 <a class="text-red" href="#">Reset</a> 
						   <a class="btn btn-primary" href="#" onclick="saveTypeSignature();"><spring:message code="label.save"/></a>
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
						   <a class="text-red" href="#">Reset</a>
						   <a class="text-green" href="#">Save</a> 
					  </div>
				  </div>
				  <div class="row margTB20" id="showType">
					   <div class="col-xs-12">
					  	<div class="pdf_view" id="showType">
					 
						</div>
					  </div> 
				  </div>
				   
				</div>
	</div>
</div>-->

 <div class="overlay-bg"></div>
<div class="overlaywhite_bg"></div>
<input type="hidden" id="generator" value="1" />
<input type="hidden" id="fieldshtml" value="" />
<input type="hidden" id="flag" value=""/>
<input type="hidden" id="signature" value="<c:out value="${signature}"></c:out>"/>
<input type="hidden" id="dragList" value=""/>
<input type="hidden" id="viewpagecount" value="0"/>
<input type="hidden" id="pageHeight" value="0"/>
<input type="hidden" id="numpages" value="0"/>
<input type="hidden" id="drawBase64" value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAALQ0lEQVR4Xu3W0QkAIAxDQV3W/Teo4BQ+uE4QLv3InpmzHAECBAgQIECAAAECXwtsw/3rfoQjQIAAAQIECBAg8AQMd49AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDAcPcDBAgQIECAAAECBAIChnugJBEJECBAgAABAgQIGO5+gAABAgQIECBAgEBAwHAPlCQiAQIECBAgQIAAAcPdDxAgQIAAAQIECBAICBjugZJEJECAAAECBAgQIGC4+wECBAgQIECAAAECAQHDPVCSiAQIECBAgAABAgQMdz9AgAABAgQIECBAICBguAdKEpEAAQIECBAgQICA4e4HCBAgQIAAAQIECAQEDPdASSISIECAAAECBAgQMNz9AAECBAgQIECAAIGAgOEeKElEAgQIECBAgAABAoa7HyBAgAABAgQIECAQEDDcAyWJSIAAAQIECBAgQMBw9wMECBAgQIAAAQIEAgKGe6AkEQkQIECAAAECBAgY7n6AAAECBAgQIECAQEDAcA+UJCIBAgQIECBAgAABw90PECBAgAABAgQIEAgIGO6BkkQkQIAAAQIECBAgYLj7AQIECBAgQIAAAQIBAcM9UJKIBAgQIECAAAECBAx3P0CAAAECBAgQIEAgIGC4B0oSkQABAgQIECBAgIDh7gcIECBAgAABAgQIBAQM90BJIhIgQIAAAQIECBAw3P0AAQIECBAgQIAAgYCA4R4oSUQCBAgQIECAAAEChrsfIECAAAECBAgQIBAQMNwDJYlIgAABAgQIECBAwHD3AwQIECBAgAABAgQCAoZ7oCQRCRAgQIAAAQIECBjufoAAAQIECBAgQIBAQMBwD5QkIgECBAgQIECAAAHD3Q8QIECAAAECBAgQCAgY7oGSRCRAgAABAgQIECBguPsBAgQIECBAgAABAgEBwz1QkogECBAgQIAAAQIEDHc/QIAAAQIECBAgQCAgYLgHShKRAAECBAgQIECAgOHuBwgQIECAAAECBAgEBAz3QEkiEiBAgAABAgQIEDDc/QABAgQIECBAgACBgIDhHihJRAIECBAgQIAAAQKGux8gQIAAAQIECBAgEBAw3AMliUiAAAECBAgQIEDgAqC3dsd5CiH1AAAAAElFTkSuQmCC"/>
<script type="text/javascript" language="javascript" src="<%=appUrl %>/js/jquery.mCustomScrollbar.js"></script>
<script src="<%=appUrl %>/js/file_upload.js"></script>
<script src="<%=appUrl %>/js/materialize.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.10.4/typeahead.bundle.min.js"></script>
<script src="<%=appUrl %>/js/materialize-tags.min.js"></script>
 <script src="<%=appUrl %>/js/jquery.validate.js"></script>
 
 <script type="text/javascript" src="https://js.live.net/v7.2/OneDrive.js"></script>
 
 <script type="text/javascript">
 var setint  = '';
 $(document).ready(function() {
	 $("body").addClass("sidebar-collapse");
 $('.pdf_view').on('mousedown',function (e) {
    clearInterval(setint);
    setint = setInterval(function () {
       //  console.log("mousehold");
         $("#mCSB_1_scrollbar_vertical").css("display","none");
    },50);
 });
 $('.pdf_view').on("mouseleave mouseup", function () {
 	//console.log("mouse release");
 	$("#mCSB_1_scrollbar_vertical").css("display","block");
    clearInterval(setint);
 });
 });
 
  function launchOneDrivePicker(val){
	 
	  if(val == 1){
		 // alert("hello 1");
		  var odOptions = {
				  clientId: "0aa725db-3ba9-486d-8e42-a92554639a6d",
				  action: "download",
				  multiSelect: false,
				  linkType: "webViewLink",
				  advanced: {filter: [".pdf",".docx",".doc",".xls",".xlsx",".ppt",".pptx",".rtf",".bmp",".png",".jpg",".jpeg",".gif",".txt",".tiff",".htm",".html"],
					  redirectUri: "<%=appUrl%>/app/document/selfsign"},
				  success: function(response) { 
					  
					  var uploadErrors = [];
					  var downloadurl =  response.value[0]["@microsoft.graph.downloadUrl"];
					  var name = response.value[0]["name"];
					  console.log("done-->"+downloadurl);
					  console.log("done-->"+name);
					  $(".file-upload-input").val(name);
					  var str = name;
					/*   var res = str.slice(-3);
		                if(res=="pdf"){ */
					  //saveonedriveChooserFile(downloadurl,name)
				 if(response.value[0]["size"] > 26214400) {
			            uploadErrors.push('<spring:message code="label.mx_file"/>');
			            errorFlag="true";
			            
			        }else{
			        		$("#document-reader-firststep").html(""); // to remove uploaded file
							$("#uploadSuccess").html(name);
			                $(".uploadSuccessHeading").css("display","block");
			                //var d = new Date();
			                //var currentDate = d.getMonth()+1+"/"+d.getDate()+"/"+d.getFullYear();
			               // var currentDate = ft.format(date);
			                var fileSize = convertSize(response.value[0]["size"]);
			                //$("#fileSizeandDate").html("File Size- "+fileSize+"  Date- "+currentDate);
			                $("#fileSize").html(fileSize);
		                    $("#uploadDate").html("<%= ft.format(date)%>");
			                //console.log("File Size - "+fileSize+"KB  Date - "+currentDate);
			                $(".pdfShow").css("display","block");
			        	saveonedriveChooserFile(downloadurl,name)
			        }
                if(uploadErrors.length > 0) {
		        	$.alert({
		                title: '',
		                content: uploadErrors.join("\n"),
		            });
		        	$(".file-upload-input").val(response.value[0]["name"]);
		        	$("#dropzone").hide();
		            $(".icon-upload").hide();
		            $("#pick").hide();
	            	 $("#dropbox").hide();
	            	 $("#onedrive").hide();
                    $("#egnyte").hide();
                    //if(counter <= 1)
					$("#remove-icon").append('<i class="fa fa-times pull-right" aria-hidden="true" onclick="deleteDocument1();" ></i>');
                    $("#jumpstep2").attr('disabled',true);
		        }
		        
		                /* }
		                else{
		                	 $("#show_upload_error").html("<spring:message code="label.pdf_acpt"/>");
		                	 $("#dropbox").hide();
			            	  $("#pick").hide();
			            	  $("#onedrive").hide();
			            	  $("#egnyte").hide();
					            $(".icon-upload").hide();
								$("#remove-icon").append('<i class="fa fa-times pull-right" aria-hidden="true" onclick="deleteDocument1();" style=""></i>');
								 
		                } */

				  },
				  cancel: function() { /* cancel handler */ },
				  error: function(e) { /* error handler */ }
				}
	  }else{
		 // alert("hello 2")
		  var odOptions = {
			  clientId: "0aa725db-3ba9-486d-8e42-a92554639a6d",
			  action: "download",
			  multiSelect: false,
			  linkType: "webViewLink",
			  advanced: {filter: [".png,.jpg,.jpeg,.bmp"],
				  redirectUri: "<%=appUrl%>/app/document/selfsign"},

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
	  }
	
    OneDrive.open(odOptions);
  }
  
  
  function saveonedriveChooserFile(downloadedUrl,fileName) {
  	
  	var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
		
		$.ajax({
			url: contextPath+"app/saveDropoxChooserFile?signtype=S",
			type: "POST",
			datatype:'json',
			Accept : "application/json",
		    contentType: "application/json",
			data: JSON.stringify({ "downloadedUrl":downloadedUrl , "fileName" :fileName }),
			beforeSend: function (xhr) {
	   			xhr.setRequestHeader(header, token);
	   		//	$("#jumpstep2").buttonLoader('start');
	   			$("#loader2").show();
		    },
		    complete: function () {
			    //	$("#jumpstep2").buttonLoader('stop');
			    	$("#loader2").hide();
			    },
			    
			 success:function(response){
				 counter = $("#isRemoveIconVisible").val();
				 ++counter;
				 $("#isRemoveIconVisible").val(counter);
				 
		    	   if(response =="subscriptionend")
		            {
		            	$("#show_upload_error").html('');
		            	$("#show_upload_error").html("<spring:message code="label.crd_limit"/>");
		            		
		            }else if(response !="failed"){
		            	
		            	$.each( response, function( key, value ) {
		            		//alert(key +' '+value );
		            		if(key == 0){
		            			 $("#docId").val(value);
		            		}
		            		if(key == 1){
		           			 	 $("#draftId").val(value);
		           			}
		            	});
		            	 // alert(response)
		            	 //Below code change to resolve DrySign:1336 & 1339 by Rupali.Shinde
		            	$("#dropbox").hide();
		            	$("#pick").hide();
		            	$("#onedrive").hide();
                        $("#egnyte").hide();
		            	$(".icon-upload").hide();
		            	showDocumentInFirstStep();
		            	if(counter <= 1){
		            		$("#remove-icon").append('<i class="fa fa-trash-o pull-right" aria-hidden="true" onclick="deleteDocument();" style=""></i>');	
		            	}
		            	 
					
		            	$("#jumpstep2").removeAttr('disabled');
		            }else{
		            	$("#show_upload_error").html('');
		            	$("#show_upload_error").html(<c:out value="response"></c:out>);
		            }
		    	
		    },
		    error: function(){
		    	$(".pdfShow").css("display","none");// changes for defect 1596
		    	$("#showfilenotuplad").show();
	        	$('.overlaywhite_bg').show();
		    }
		})
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
			    	
			    }
			})
		}
  
 
</script>
 
<!--  signature from dropbox -->
  <script type="text/javascript" src="<%=appUrl %>/js/dropins.js" id="dropboxjs" data-app-key="kktaxdj1402ec7u"></script>
 <script>
 document.getElementById("dropbox1").onclick = function () {
	
	 Dropbox.choose({
        success: function(files) {
            
          console.log(files);
          
          var str = files[0].name;
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
		    	
		    }
		})
	}
 </script>
 
     <script>
     document.getElementById("dropbox").onclick = function () {
    	 
    	 var uploadErrors = [];
    	 //counter++;
    	 Dropbox.choose({
            success: function(files) {
            	
                var linkTag = document.getElementById('file-upload-input');
             //   linkTag.href = files[0].link;
              //  linkTag.textContent = files[0].link;
              console.log(files);
              var str = files[0].name;
                $(".file-upload-input").val(files[0].name);
                
                if(files[0].bytes > 26214400) {
			            uploadErrors.push('<spring:message code="label.mx_file"/>');
			            errorFlag="true";
			            
			        }else{
                	
			        	 $("#document-reader-firststep").html(""); // to remove uploaded file
							$("#uploadSuccess").html(files[0].name);
			                $(".uploadSuccessHeading").css("display","block");
			                //var d = new Date();
			                //var currentDate = d.getMonth()+1+"/"+d.getDate()+"/"+d.getFullYear();
			                //var currentDate = ft.format(date);
			                var fileSize = convertSize(files[0].bytes);
			                //$("#fileSizeandDate").html("File Size- "+fileSize+"  Date- "+currentDate);
			                $("#fileSize").html(fileSize);
		                    $("#uploadDate").html("<%= ft.format(date)%>");
			                //console.log("File Size - "+fileSize+"KB  Date - "+currentDate);
			                $(".pdfShow").css("display","block");
			                
                		saveDropoxChooserFile(files[0].link,files[0].name)
			        }
                if(uploadErrors.length > 0) {
		        	$.alert({
		                title: '',
		                content: uploadErrors.join("\n"),
		            });
		        	$(".file-upload-input").val(files[0].name);
		        	$("#dropzone").hide();
		            $(".icon-upload").hide();
		            $("#pick").hide();
	            	 $("#dropbox").hide();
	            	 $("#onedrive").hide();
                    $("#egnyte").hide();
                    //if(counter <= 1)
					$("#remove-icon").append('<i class="fa fa-times pull-right" aria-hidden="true" onclick="deleteDocument1();" ></i>');
                    $("#jumpstep2").attr('disabled',true);
		        }
                /* }
                else{
                	 $("#show_upload_error").html("<spring:message code="label.pdf_acpt"/>");
                	 $("#dropbox").hide();
	            	  $("#pick").hide();
	            	  $("#onedrive").hide();
	            	  $("#egnyte").hide();
			            $(".icon-upload").hide();
						$("#remove-icon").append('<i class="fa fa-times pull-right" aria-hidden="true" onclick="deleteDocument1();" style=""></i>');
						 
                } */
            },
            linkType: 'direct',
            multiselect: false,
            extensions: [".pdf",".docx",".doc",".xls",".xlsx",".ppt",".pptx",".rtf",".bmp",".png",".jpg",".jpeg",".gif",".txt",".tiff",".htm",".html"],
        });
     };
      //  document.getElementById('container').appendChild(button);
        
        function saveDropoxChooserFile(downloadedUrl,fileName) {
        	
        	var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath=$("#contextPath").val();
			
    		$.ajax({
    			url: contextPath+"app/saveDropoxChooserFile?signtype=S",
    			type: "POST",
    			datatype:'json',
    			Accept : "application/json",
    		    contentType: "application/json",
    			data: JSON.stringify({ "downloadedUrl":downloadedUrl , "fileName" :fileName }),
    			beforeSend: function (xhr) {
		   			xhr.setRequestHeader(header, token);
		   		//	$("#jumpstep2").buttonLoader('start');
		   			$("#loader2").show();
			    },
			    complete: function () {
				    //	$("#jumpstep2").buttonLoader('stop');
				    	$("#loader2").hide();
				    },
				    
				 success:function(response){
					 counter = $("#isRemoveIconVisible").val();
					 ++counter;
					 $("#isRemoveIconVisible").val(counter);
			    	   if(response =="subscriptionend")
			            {
			            	$("#show_upload_error").html('');
			            	$("#show_upload_error").html("<spring:message code="label.crd_limit"/>");
			            		
			            }else if(response !="failed"){
			            	
			            	$.each( response, function( key, value ) {
			            		//alert(key +' '+value );
			            		if(key == 0){
			            			 $("#docId").val(value);
			            		}
			            		if(key == 1){
			           			 	 $("#draftId").val(value);
			           			}
			            	});
			            	 // alert(response)
			            	 //Below code change to resolve DrySign:1336 & 1339 by Rupali.Shinde
			            	 $("#dropzone").hide();
			            	 $("#dropbox").hide();
			            	 $("#pick").hide();
			            	 $("#onedrive").hide();
                             $("#egnyte").hide();
			            	 $(".icon-upload").hide();
			            	 showDocumentInFirstStep();
			            	 if(counter <= 1){
			            		 $("#remove-icon").append('<i class="fa fa-trash-o pull-right" aria-hidden="true" onclick="deleteDocument();" style=""></i>');	 
			            	 }
			            	 
						
			            	$("#jumpstep2").removeAttr('disabled');
			            }else{
			            	$("#show_upload_error").html('');
			            	$("#show_upload_error").html(response);
			            }
			    	
			    },
    		    error: function(err){
    		    	
    		    }
    		})
    	}

        
/* start Egnyte javascript code */   
        
        function popitupEgnyte(url) {
	//debugger;
            var w=500;
            var h=500;
        var left = (screen.width/2)-(w/2);
        var top = (screen.height/2)-(h/2);
        var title = "Egnyte";
        return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
            
                 /* newwindow=window.open(url,'name','height=400,width=500');
                 if (window.focus) {newwindow.focus()}
                 return false; */
             }
             
         function HandlePopupResult(base64,fileName) {
             /* var div = document.getElementById('output');
            div.innerHTML += result;
            var div = document.getElementById('name');
            div.innerHTML += name; */
            $(".file-upload-input").val(fileName);
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            var contextPath=$("#contextPath").val();
            
            $.ajax({
                  url: contextPath+"app/saveFileByEgnyte?signtype=S",
                  type: "POST",
                  datatype:'json',
                  Accept : "application/json",
                contentType: "application/json",
                  data: JSON.stringify({ "downloadedUrl":base64 , "fileName" :fileName }),
                  beforeSend: function (xhr) {
                       xhr.setRequestHeader(header, token);
                 //    $("#jumpstep2").buttonLoader('start');
                       $("#loader2").show();
                },
                complete: function () {
                      //      $("#jumpstep2").buttonLoader('stop');
                       $("#loader2").hide();
                      },
                      
                   success:function(response){
                     if(response =="subscriptionend")
                        {
                              $("#show_upload_error").html('');
                              $("#show_upload_error").html("<spring:message code="label.crd_limit"/>");
                                    
                        }else if(response !="failed"){
                              
                              $.each( response, function( key, value ) {
                                    //alert(key +' '+value );
                                    if(key == 0){
                                           $("#docId").val(value);
                                    }
                                    if(key == 1){
                                           $("#draftId").val(value);
                                    }
                              });
                               // alert(response)
                               $("#dropzone").hide();
                               $("#dropbox").hide();
                                $("#pick").hide(); 
                                $("#onedrive").hide();
                                $("#egnyte").hide();
                                
                                
                                $(".icon-upload").hide();
                               $("#remove-icon").append('<i class="fa fa-trash-o pull-right" aria-hidden="true" onclick="deleteDocument();" style=""></i>');
                              
                              $("#jumpstep2").removeAttr('disabled');
                        }else{
                              $("#show_upload_error").html('');
                              $("#show_upload_error").html(response);
                        }
                  
                },
                error: function(err){
                  
                }
            })
            
            
         }   
         /* end Egnyte javascript code */   

    </script>
 
  <script type="text/javascript" src="<%=appUrl %>/js/filepicker.js"></script>
	<script>
	 var file = null;
		function initPickerPDF() {
			
			// alert("Hello1112");
			var uploadErrors = [];
			var picker = new FilePicker({
				apiKey: 'AIzaSyBOIfItfyHfT9DM2vYIPN_XwuD8B2HhLyc',
				clientId:'927346535684-gkrnjl6o6akimdjse81gp3lb1j79n957.apps.googleusercontent.com',
				buttonEl: document.getElementById('pick'),
				onSelect: function(file) {
										
					if(file.fileSize > 26214400) {
			            uploadErrors.push('<spring:message code="label.mx_file"/>');
			            errorFlag="true";
			            
			        }else{
                	
			        	$("#filename").val(file.title);
						$(".file-upload-input").val(file.title);
						$("#fileId").val(file.id);
						console.log(file);
						$("#document-reader-firststep").html(""); // to remove uploaded file
						$("#uploadSuccess").html(file.title);
	                    $(".uploadSuccessHeading").css("display","block");
	                    //var d = new Date();
	                    //var currentDate = d.getMonth()+1+"/"+d.getDate()+"/"+d.getFullYear();
	                    // var currentDate = ft.format(date);
	                    var fileSize = convertSize(file.fileSize);
	                    //$("#fileSizeandDate").html("File Size- "+fileSize+"  Date- "+currentDate);
	                    $("#fileSize").html(fileSize);
		                $("#uploadDate").html("<%= ft.format(date)%>");
	                    //console.log("File Size - "+fileSize+"KB  Date - "+currentDate);
	                    $(".pdfShow").css("display","block");
	                    
						document.getElementById("save").click();
						//alert('Selected File ' + file.title);
						//alert('Selected file Id ' + file.id);
			        }
                if(uploadErrors.length > 0) {
		        	$.alert({
		                title: '',
		                content: uploadErrors.join("\n"),
		            });
		        	$(".file-upload-input").val(file.originalFilename);
		        	$("#dropzone").hide();
		            $(".icon-upload").hide();
		            $("#pick").hide();
	            	 $("#dropbox").hide();
	            	 $("#onedrive").hide();
                    $("#egnyte").hide();
                    //if(counter <= 1)
					$("#remove-icon").append('<i class="fa fa-times pull-right" aria-hidden="true" onclick="deleteDocument1();" ></i>');
                    $("#jumpstep2").attr('disabled',true);
		        }
					
					
				}
			});	
		}
		
		function download() {
			var fileId = $("#fileId").val();
			var fileName = $("#filename").val();
			var byteArray = [];
			if (fileId) {
				console.log("fileId: ::" + fileId);
				console.log("fileName: ::" + fileName);
				var accessToken = gapi.auth.getToken().access_token;
				callToajax(fileId,"",fileName,accessToken);
				
			/* 	var xhr = new XMLHttpRequest();
				xhr.open('GET', filedownloadUrl);
				xhr.setRequestHeader('Authorization', 'Bearer ' + accessToken);
				xhr.onload = function() {
				var fileContent = xhr.responseText;
				var contentType= xhr.getResponseHeader ("Content-Type");
				 var contLength = xhr.getResponseHeader ("Content-Length");
				 var encodedfileContent = Base64.encode(fileContent);
				alert(fileContent);
				callToajax(filedId,contentType,fileName,accessToken);
			//	do_something_with_file_content(file.title, content);
				};
				xhr.onerror = function() {
				alert('Download failure.');
				};
				xhr.send(); */
				}
		  
				else {
				alert('<spring:message code="label.unble_down"/>');
				}
			  
			}
		function callToajax(fileId,contentType,fileName,accessToken) {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath=$("#contextPath").val();
		//	$("#jumpstep2").removeAttr('disabled');
			//alert("Hai");
			$.ajax({
				url: contextPath+"cloud/downloadFieByFileId?signtype=S",
				type: "POST",
				dataType: 'json',
			    contentType: "application/json; charset=utf-8",
			    data: JSON.stringify({ "fileId":fileId , "fileMimeType": contentType , "fileName" :fileName ,"accessToken":accessToken}),
			    beforeSend: function (xhr) {
		   			xhr.setRequestHeader(header, token);
		   		//	$("#jumpstep2").buttonLoader('start');
		   			$("#loader2").show();
			    },
			    complete: function () {
			    //	$("#jumpstep2").buttonLoader('stop');
			    	$("#loader2").hide();
			    },
				
			    success:function(response){
			    	counter = $("#isRemoveIconVisible").val();
			    	++counter;
			    	$("#isRemoveIconVisible").val(counter);
			    	   if(response =="subscriptionend")
			            {
			            	$("#show_upload_error").html('');
			            	$("#show_upload_error").html("<spring:message code="label.crd_limit"/>");
			            		
			            }else if(response=="error")
			            	{
			            	$(".pdfShow").css("display","none");// changes for defect 1596
			            	$("#showfilenotuplad").show();
			            	$('.overlaywhite_bg').show();
			            	}
			    	   else if(response !="failed"){
			            	
			            	$.each( response, function( key, value ) {
			            		//alert(key +' '+value );
			            		if(key == 0){
			            			 $("#docId").val(value);
			            		}
			            		if(key == 1){
			           			 	 $("#draftId").val(value);
			           			}
			            	});
			            	 // alert(response)
			            	 
            	 			showDocumentInFirstStep(); // show document on firststep
            	 			//Below code change to resolve DrySign:1336 & 1339 by Rupali.Shinde
            	 			  $("#dropzone").hide();
			            	  $("#pick").hide();
			            	  $("#dropbox").hide();
			            	  $("#onedrive").hide();
                              $("#egnyte").hide();
			            	  $(".icon-upload").hide();
			            	 if(counter <= 1){
			            		 $("#remove-icon").append('<i class="fa fa-trash-o pull-right" aria-hidden="true" onclick="deleteDocument();" style=""></i>');
			            	 }
			            	
						
			            	$("#jumpstep2").removeAttr('disabled');
			            }else{
			            	$("#show_upload_error").html('');
			            	$("#show_upload_error").html(response);
			            }
			    },
			    error: function(){
			    	$(".pdfShow").css("display","none");// changes for defect 1596
			    	$("#showfilenotuplad").show();
		        	$('.overlaywhite_bg').show();
			    }
			})
		}
	
	</script>
	
	
	
	<!-- <script src="https://www.google.com/jsapi?key=AIzaSyC4z1UzNEEZXpOGf547C0XifZ0HagRx64w"></script> -->
	<script src="https://apis.google.com/js/client.js?onload=initPickerPDF"></script>
	
<script>

//recipents email validation
function checkEmailRecipentsValid(){
	var str = $("#recipents").val();
	var str_array = str.split(',');
	 var emailErrors = [];
	 
	for(var i = 0; i < str_array.length; i++) {
	   // Trim the excess whitespace.
	   str_array[i] = str_array[i].replace(/^\s*/, "").replace(/\s*$/, "");
	   // Add additional code here, such as:
	   
	   if( !validateEmail(str_array[i])){
		   //alert('Email is not valid!'+str_array[i]);
		   emailErrors.push(str_array[i]);
		   
	   } 
	}
	if (emailErrors.length != 0) {
		$('#error_recipents').show();
	}else{
		$('#error_recipents').hide();
	}
}

function checkEmailCCValid(){
	var str = $("#cc").val();
	var str_array = str.split(',');
	 var emailErrors = [];
	 
	for(var i = 0; i < str_array.length; i++) {
	   // Trim the excess whitespace.
	   str_array[i] = str_array[i].replace(/^\s*/, "").replace(/\s*$/, "");
	   // Add additional code here, such as:
	   
	   if( !validateEmail(str_array[i])){
		   //alert('Email is not valid!'+str_array[i]);
		   emailErrors.push(str_array[i]);
		   
	   } 
	}
	if (emailErrors.length != 0) {
		$('#error_cc').show();
	}else{
		$('#error_cc').hide();
	}
}
function validateEmail($email) {
	  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	  return emailReg.test( $email );
}
function loadImage() {
	//$("#loader2").fadeOut("slow");
	//$(".loadImage").show();
	//$('.drop').width($('.drop').children('img').width());
	var stepNumber= $('#stepNumber').val();
	//alert(stepNumber);
	  /* if(stepNumber==2){
	  $('.document-reader').width($('.drop').children('img').width());
	  
	  } */
}


function signatureopen(){
	  
	  $('.overlay-bg').show();
    $('.signature-sign').show();
	  var $slider = $('.signature-sign');
	  $slider.animate({
	   right: parseInt($slider.css('right'),10) == -350 ? 0 : 0
	  });
}
	(function($){
		  $(window).on("load",function(){
		$(".content").mCustomScrollbar({
					axis:"xy",
	
					advanced:{
						autoExpandHorizontalScroll:true
					}
				});
				
      
            //$(".content").mCustomScrollbar();
			//$(".content").resizable();
			
        });
    })(jQuery);
	
	
/* $(window).on("load resize", function() {
    var viewportWidth = $(window).width();
    if (viewportWidth < 768) {
		//alert('hi')
		
          (function($) {
            $(document).ready(function() {
				//alert('hi');
              $( ".m-view" ).prependTo( ".dropdown-menu li.bottom" );
 $( ".m-view.user" ).prependTo( ".dropdown-menu" );  
            });
         }) (jQuery);
    }
});	 */
</script>
 <!-- <script src="//cdn.ckeditor.com/4.5.9/standard/ckeditor.js"></script> -->
 <%-- <script type="text/javascript" src="<%=appUrl %>/js/ckeditor.js"></script>  --%>
<!-- <script src="//cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script> -->
<script src="<%=appUrl %>/ckeditor/ckeditor.js"></script>
<script>
CKEDITOR.on('instanceCreated', function(event) {
	  var editor = event.editor;
	  editor.on('instanceReady', function(e) {
	    $(".cke_wysiwyg_frame").removeAttr("title");
	  });
	});

CKEDITOR.on('instanceReady', function (ck) {
    ck.editor.on("change", function (e) {
        var sel = ck.editor.getSelection();
        if (sel) {
            var selected = sel.getStartElement();
            if (selected && selected.$)
                sel.getStartElement().$.normalize();
        }
    });
 });
CKEDITOR.replace( 'message', {
	removeButtons: 'Undo,Redo,Image,Maximize,Source,Table,About,Strike,Subscript,Superscript,Blockquote,Format,Styles,Link,Unlink,Anchor', 
	});


 var editorText;

 function updateDiv(){
      editorText = CKEDITOR.instances.message.getData();
      val = $(editorText).text().trim();
      editortext_validation =CKEDITOR.instances.message.getData().length;
    
      if( editortext_validation != 0  ) {
    	  
			$("#ckeditor_error").css("display","none");
				      }
	 if(editortext_validation == 0){
		 $("#ckeditor_error").css("display","block");
		 e.preventDefault();	
	 }
	 if(val==0){
		 $("#ckeditor_error").css("display","block");
		 e.preventDefault();
	 }
 }
 CKEDITOR.instances["message"].on('change', function() { 	 
	 updateDiv();
	 
 });


$(document).ready(function(){
	/*  $.validator.addMethod("emailcheck", function(value, element) {
	        var re = /^(([^<>(){}[\]\\.,;:\s@\"]+(\.[^<>(){}[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	        return this.optional(element) || re.test(value);
	    }, "<spring:message code="label.validEmail_msgrequired"/>"); */
	 $("#cc").keyup(
			 
				function(){
				    var one=$(this).val();
				    $("#ttip").fadeIn().text(one);
				    }
				);
	 $("#recipients").keyup(
				function(){
				    var one=$(this).val();
				    $("#ttip1").fadeIn().text(one);
				    }
				);
	
	 $("#loader2").hide();
	var title='${title}';
	if(title=='Self Sign'){
		$("#templateSidebar").removeClass('active');
		$("#dashboardSidebar").addClass('active');}
	
	getSigntype();	
	$('.tab-pen-eraser button').click(function(){
		$(this).addClass('active_btn').siblings().removeClass('active_btn');
	});	
	
 // swal("Deleted!", "Your imaginary file has been deleted.", "success");

	
	Materialize.updateTextFields();
		   $('select').material_select();
	
	$('button.Message_popup').click(function(){
		$('.Message').show();
		$('.overlaywhite_bg').show();
	})
	
	  $('button.signature-tab').click(function() {
		  
		  
			//$('.wrapper').addClass('overlay-bg')
			$('.overlay-bg').show();
             $('.signature-sign').show();
						var $slider = $('.signature-sign');
						$slider.animate({
						 right: parseInt($slider.css('right'),10) == -350 ? 0 : 0
						});
			});
	$('.close, .overlay-bg, .overlaywhite_bg').click(function(){
		$('.signature-sign').hide();
		$('.overlay-bg').hide();
		$('.Message').hide();
		$('.overlaywhite_bg').hide();
		
	});
	
	
	$('#pollSlider-button').click(function() {
		   $('#pollSlider-button span').toggleClass("fa-angle-double-left fa-angle-double-right");
		  //$(this).find($("span")).removeClass('icon-arrow_left').addClass('icon-arrow_right');
		  	$('.self-slide').toggleClass('mini-pollsidebar');
	        $('#pollSlider-button').parents('.self-slide').siblings('.signature').toggleClass('mini-pollsidebar');
	       
	    if($(this).css("margin-right") == "176px")
	    {
	        $('.pollSlider').animate({"margin-right": '-=176'});
	       // $(".dragMe").css("width","100% !important");
	        //$('#pollSlider-button').animate({"margin-right": '-=176'});
			
	    }
	    else
	    {
	        $('.pollSlider').animate({"margin-right": '+=176'});
	       
	        //$(".dragMe").css("width","max-content !important");
	        //$('#pollSlider-button').animate({"margin-right": '+=176'});	        
	    }


	  });
 }); 	
</script> 
<script>
$("#loader2").show();
$(document).ready(function () {
	 $('#stepsModal').on('hidden.bs.modal', function () {
		 window.location.reload();
	    });
});

</script>


<script>
function checkMediaQuery() {
	  // If the inner width of the window is greater then 768px
	  if (window.innerWidth < 768) {
	    // Then log this message to the console
		  $('#pollSlider-button').parents('.self-slide').addClass('mini-pollsidebar');
		  
		  $('#pollSlider-button').parents('.self-slide').siblings('.signature').addClass('mini-pollsidebar');
	  }
	  else{
		  $('#pollSlider-button').parents('.self-slide').removeClass('mini-pollsidebar');
		  $('#pollSlider-button').parents('.self-slide').siblings('.signature').removeClass('mini-pollsidebar');
	
	  }
	}

var appURL;
$(document).ready(function () {
	window.addEventListener('resize', checkMediaQuery);
	$("#showfilenotuplad").hide();
    //Initialize tooltips
    	appURL="<%=appUrl %>"; 
    $('.nav-tabs > li a[title]').tooltip();
   $('[data-toggle="tooltip"]').tooltip(); 
    //step1 active
    
   	$(".loadImage").hide();
    $("#show-selfsign-success").hide();
    $('.overlaywhite_bg').hide();
		
 	var docName='<c:out value="${documentName}"></c:out>';
   	var docId='<c:out value="${docId}"></c:out>';
   	var draftId='<c:out value="${draftId}"></c:out>';
   	var dragList='<c:out value="${dragList}"></c:out>';
	
   //	alert(dragList);
   	var flag ='<c:out value="${flag}"></c:out>';
   	var stepNumber='<c:out value="${stepNumber}"></c:out>';
  
   	var increment='${increment}';
   	/* if(flag == "103"){
   		$("#show-selfsign-steps").show();
		$("#skippopup").hide();
		$("#show-selfsign-error").show();
		$('.overlaywhite_bg').show();
		$("#error-messgae").empty();
		$("#error-messgae").append('<spring:message code="label.sgn_prvs"/>');
   	}else */ if(flag == 'invalid'){
   		$("#show-selfsign-steps").show();
		$("#skippopup").hide();
		$("#show-selfsign-error").show();
		$("#error-messgae").empty();
		$("#error-messgae").append('<spring:message code="label.invalid"/>');
   	}else{
   		if(docName != ''){
	   		$("#docId").val(docId);
	   		$("#draftId").val(draftId);
	   		$("#flag").val(flag);
	   		if(increment !='' ){
	   			$("#generator").val(increment);
	   		}
	   		$(".file-upload-input").val(docName);
	   		if(dragList !=''){
	   			$("#document-reader").append(dragList);
	   		}
		   	//$(".icon-upload").hide();
		   			$("#uploadSuccess").html(docName);
                    $(".uploadSuccessHeading").css("display","block");
                    //var d = new Date();
                    //var currentDate = d.getMonth()+1+"/"+d.getDate()+"/"+d.getFullYear();
                    //var currentDate = ft.format(date);
                    var fileSize = convertSize('<c:out value="${fileSize}"></c:out>');
                    //$("#fileSizeandDate").html("File Size- "+fileSize+"  Date- "+currentDate);
                    $("#fileSize").html(fileSize);
		            $("#uploadDate").html("<%= ft.format(date)%>");
                    //console.log("File Size - "+fileSize+"KB  Date - "+currentDate);
                    $(".pdfShow").css("display","block");
                    $("#document-reader-firststep").html(""); // to remove uploaded file
            	 	showDocumentInFirstStep(); // show document on firststep
            	 	$("#isRemoveIconVisible").val(1);
					$("#remove-icon").append('<i class="fa fa-trash-o pull-right" aria-hidden="true" onclick="deleteDocument();" style=""></i>');
			
	   	}
		/*if(stepNumber == 1){			
			$("#steplist1").removeClass('disabled');
	   	    $("#steplist1").addClass('active');
	   	 	$("#steplist1").removeClass('complete');
	   	 	$("#steplist2").removeClass('complete');
	   	 	$("#steplist3").removeClass('complete');	   		   		
	   		
	   	    $("#step1").removeClass('disabled');
	   	    $("#step1").addClass('active');
	   	 	$("#jumpstep2").removeAttr('disabled');
	   	    $(".progress-bar").css("width", "100%");
	   	}
		else if(stepNumber == 2){

	   	 	$("#steplist1").removeClass('disabled');
	   	    $("#steplist1").addClass('complete');
	   	 	$("#steplist2").removeClass('complete');
	   		$("#steplist2").removeClass('disabled');
	   	    $("#steplist2").addClass('active');
	   	 	$("#steplist3").removeClass('complete');
	   	    $("#step2").removeClass('disabled');
	   	    $("#step2").addClass('active');
	   	    
	   	    //changes for defect 1498
	   	 	$("#isStepOne").hide();
			$("#isStepTwo").show();
			$("#isStepThree").hide();
			// End Changes
			
	   		var count=$("#viewpagecount").val();
	   	    jumpstep2(count);
	   		jumpstep3(2)
	   		checkFields();
	   	 $("#steplist1").removeClass('disabled');
	   	}
		else if(stepNumber == 3){*/
			$("#steplist1").addClass('complete');
			$("#steplist1").removeClass('disabled');
			$("#steplist2").addClass('complete');
			$("#steplist2").removeClass('disabled');
	   	 	
	   	 	$("#steplist3").removeClass('complete');
			$("#steplist3").removeClass('disabled');
	   	    $("#steplist3").addClass('active');
	   	    $("#step3").removeClass('disabled');
	   	    $("#step3").addClass('active');
	   		$("#isStepOne").hide();
			$("#isStepTwo").hide();
			$("#isStepThree").show();
			
	   /*	}else{
	   		$("#steplist1").removeClass('disabled');
	   	    $("#steplist1").addClass('active');
	   	    $("#step1").removeClass('disabled');
	   	    $("#step1").addClass('active');
	   	}*/
   	}
   		//alert(increment);
	   
   	
   		
  
  	//alert('DRAG'+dragList);
   	//alert(docId);
   	
    //Wizard
    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
        var $target = $(e.target);   
        if ($target.parent().hasClass('disabled')) {
            return false;
        } 
		if(e.currentTarget.hash =="#step1"){
			$("#isStepOne").show();
			$("#isStepTwo").hide();
			$("#isStepThree").hide();
			$(".progress-bar").css("width", "100%");
			$("#jumpstep2").removeAttr('disabled');
			//alert('Step1');	
	    }if(e.currentTarget.hash =="#step2"){
	    	//alert('Step2');
	    	$("#isStepOne").hide();
			$("#isStepTwo").show();
			$("#isStepThree").hide();
	    	var count=$("#viewpagecount").val();
	    	jumpstep2(count);
	    	//$("#steplist1").addClass('disabled');
	    	checkFields();
	    	
		}if(e.currentTarget.hash =="#step3"){
			//alert('Step3');
			//$("#steplist2").addClass('disabled');
			$("#isStepOne").hide();
			$("#isStepTwo").hide();
			$("#isStepThree").show();
			jumpstep3(2)
		}
		if ($target.parent().hasClass('disabled')) {
            return false;
        }
        
    });

    $(".next-step").click(function (e) {
        var $active = $('.wizard .nav-tabs li.active');
        $active.next().removeClass('disabled');        
        $active.addClass('complete');
        nextTab($active);
    });
    $(".prev-step").click(function (e) {
        var $active = $('.wizard .nav-tabs li.active');
        $active.removeClass('complete');
        prevTab($active);
    });
});

function nextTab(elem) {
    $(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
    $(elem).prev().find('a[data-toggle="tab"]').click();
}
	  
	/* $('.square_2').on('click', function(){
    $('.square_2.active').removeClass('active');
    $(this).addClass('active');
	
	$('.row_4').show('.square_2.active#test12'); 
	  });*/
	//$('.row_4').hide('.square_2 #test12');
      </script> 
<!--  Upload and Drag script  --> 
<script>
function saveUploadSignature(){
	var id=$("#drawsignature_no").val();
	var sign = $('img[id="blah"]').attr('src');
	var fileInput = document.getElementById('imgInp');
	if(sign == ''){
		$("#file_error").show();
    	$("#file_error").html('<spring:message code="label.upl_picsign"/>'+'<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
        fileInput.value = '';
	}else{
		$(".signature-sign").hide();
		$('.overlay-bg').hide();
			
		 $("#field"+id).attr('type', 'image'); 
		 $("#field"+id).attr('src', sign);
		 $("#field"+id).removeClass('form-control');
		 $("#signature").val(sign);
	
	}
}
function saveTypeSignature(){
	var id=$("#drawsignature_no").val();
    var sign = $("#myType").val();
	var typeSign=$("#typeName").val();
	var check=validationSignature1(sign,typeSign,"type");
	if(check ==true){
		$(".signature-sign").hide();
		$('.overlay-bg').hide();
	
		 $("#field"+id).attr('type', 'image'); 
		 $("#field"+id).attr('src', sign);
		 $("#field"+id).removeClass('form-control');
			$("#signature").val(sign);
	
	}
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
	$("#signature-type-error").html("<spring:message code="label.sign_font"/>");
	return false;
}
if(typeSign == ""){
	$("#signature-type-error").show();
	$("#signature-type-error").html("<spring:message code="label.type_sgn"/>");
	return false;
}
if(sign == ""){
	$("#signature-type-error").show();
	$("#signature-type-error").html('<spring:message code="label.slct_fnt"/>'+'<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
	return false;
}

return true;
}


$("#typeName").keyup(function(){
	 var element = document.getElementById('typeName');
	 element.value = element.value.replace(/[^a-zA-Z ]+/, '');
	 
$("#signature-type-error").hide();
$("#signature-type-error").html('');
var typeValue=$("#typeName").val();
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
     global: false,
     error : function(e) {  
      alert('Error: ' + e);   
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
      alert('Error: ' + e);   
     }  
 });  
}
	

                 
      
      
 /*  $(window).on("load resize", function(e) {
      var viewportWidth = $(window).width();
      if (viewportWidth < 769) {
      (function($) {
 		$("body").addClass('sidebar-collapse');
      })(jQuery);
		} else {
      $("body").removeClass('sidebar-collapse');
      }
  }); */

         
         
       
         
        
      </script> 

<!-- MOBLE SUPPORT HERE -->

<script src="<%=appUrl %>/js/jquery-ui.min.js"></script>
<script src="<%=appUrl %>/js/jquery.ui.touch-punch.min.js"></script>
<script>$('#widget').draggable();</script>
<script>
function touchHandler(event) {
    var touch = event.changedTouches[0];

    var simulatedEvent = document.createEvent("MouseEvent");
        simulatedEvent.initMouseEvent({
        touchstart: "mousedown",
        touchmove: "mousemove",
        touchend: "mouseup"
    }[event.type], true, true, window, 1,
        touch.screenX, touch.screenY,
        touch.clientX, touch.clientY, false,
        false, false, false, 0, null);

    touch.target.dispatchEvent(simulatedEvent);
    event.preventDefault();
}

function init() {
    document.addEventListener("touchstart", touchHandler, true);
    document.addEventListener("touchmove", touchHandler, true);
    document.addEventListener("touchend", touchHandler, true);
    document.addEventListener("touchcancel", touchHandler, true);
}


/* jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();

jQuery.curCSS = function(element, prop, val) {
    return jQuery(element).css(prop, val);
}; */
</script>

<!-- Re sizable -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

/* $('input.expandeble').css('width',((input.getAttribute('placeholder').length + 1) * 8) + 'px'); */

$( function() {
  $( ".resizable" ).resizable({
    handles: "se"
  });
} );
</script>

<%-- <script src="<%=appUrl %>/js/signature.js"></script> --%>
<!-- Loader -->

	<script src="<%=appUrl %>/js/signaturepad.js"></script>

<script src="<%=appUrl %>/js/jquery.buttonLoader.js"></script>


<script src="<%=appUrl %>/js/signaturePadLoad.js"></script>

<script>	
	

$('.close').click(function(){
	//$('.save-signature-box').hide();
	$(".signature-sign").hide();
	$('.overlay-bg').hide();
	 //return false;
}); 


$('#decline').click(function(){
	//$('.save-signature-box').hide();
	    $('.signature-sign').hide();
		$('.overlay-bg').hide();
		$('#skippopup').hide();
		$('.overlaywhite_bg').hide();
	 //return false;
}); 

//Draw Signature
function openMySignature(id){
	$("#drawsignature_error").hide();
	$("#signature-type-error").hide();
	$(".thumbnail").removeClass('selected');
	//zkSignature.clear();
	$('.overlay-bg').show();
	$("#sType").removeClass('active');
	$("#type").removeClass('active');
	$("#sDraw").addClass('active');
	$("#draw").addClass('active');
	$("#uType").removeClass('active');
	$("#upload").removeClass('active');
	$("#blah").attr('src', '');
	$("#show_upload_signature").show();
	$("#blah").hide();
	document.getElementById("imgInp").value = "";
	$("#myType").val('');
	$('.signature-sign').show();
		var $slider = $('.signature-sign');
		$slider.animate({
		 right: parseInt($slider.css('right'),10) == -350 ? 0 : 0
	});
		
	$("#drawsignature_no").val(id);	
	
	$('.overlay-bg').hide();
		
}
function saveSignaturetodb(){
	if (!signaturePad.isEmpty()){
	var id=$("#drawsignature_no").val();
	var canvas = document.getElementById("signaturepad");
	// save canvas image as data url (png format by default)
	var dataURL = canvas.toDataURL("image/png",1);
	var defaultBase64;
	if ($.browser.mozilla && $.browser.version >= "2.0" ){
		defaultBase64=$("#drawBaseMozilla64").val();
	}
	/* if( $.browser.safari ){
	   alert('Safari');
	} */
	if ($.browser.chrome){
	   defaultBase64=$("#drawBase64").val();
	}
	if ($.browser.msedge || $.browser.msie && $.browser.version <= 6 || $.browser.msie && $.browser.version > 6){
	   defaultBase64=$("#drawBaseIE64").val();
	}
	if(defaultBase64 == dataURL){
		
		$("#drawsignature_error").show();
	}else{
	 $("#field"+id).attr('type', 'image'); 
	 $("#field"+id).attr('src', dataURL);
	 $("#field"+id).removeClass('form-control');
	 $(".signature-sign").hide();
		$('.overlay-bg').hide();
		$("#signature").val(dataURL);
	}
	
	}
	else{
		$("#drawsignature_error").show();
		
	}
	 //$("#fieldclose"+id).css("right", "6px");
	//$("#fiel1d"+id).val(dataURL);
}

//End Draw Singature
</script>
<!-- DRAG AND DROP CODE HERE -->
<script>

  //remove the dragsigner when click on close icon
  $(document).on("click", ".closeIt", function(){
    var parent = $(this).parent();
    parent.remove();
  });

  function hideTextbox_Sig(id,signerID){
	  var total_element = $(".signatureb").length;
	  var total_element1 = $(".signatureb1").length;

	  $("#input-drop-fild"+id).parents('.dragMe').remove();
	 
	  if(signerID==3 && total_element == 1){
		  $("#signer-5").addClass("dragMe dragSigners ui-draggable ui-draggable-handle");
			$("#signer-5").css("opacity","1");
			$(".sign_stamp").css("opacity","1");
	  }
	  if(signerID==5 && total_element1 == 1){
		  $("#signer-3").addClass("dragMe dragSigners ui-draggable ui-draggable-handle");
			$("#signer-3").css("opacity","1");
			$(".sign").css("opacity","1");
	  }
	  
	  jumpstep3(2)
	  checkFields();
  }
  

  function hideTextbox(id){
	  $("#input-drop-fild"+id).parents('.dragMe').remove();
	  jumpstep3(2)
	  checkFields();
	  
  }
 
  function selfSignAll(){
	  var valid = $("#step3-form").valid();
	  alert(valid)
	  if(valid == true){
		
	   }
	  
  }
 
  function enlargeText(id,value){
	 // alert(value.length);
	  //$(id).css('width',((value.length + 1) * 8) + 'px');
  }
  
 
</script>
<script src="<%=appUrl %>/js/jquery.ui.widget.js"></script>
<script src="<%=appUrl %>/js/jquery.iframe-transport.js"></script>
<script src="<%=appUrl %>/js/jquery.fileupload.js"></script>
<script src="<%=appUrl %>/js/jquery.fileupload-process.js"></script>
<script src="<%=appUrl %>/js/jquery.fileupload-validate.js"></script>
 <script src="<%=appUrl %>/js/jquery.validate.js"></script>
<script>

/*global window, $ */
$(function () {
    'use strict';
    // Change this to the location of your server-side upload handler:
    var contextPath=$("#contextPath").val();
    var url = "app/fileUpload?signtype=S";
    var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var counter = $("#isRemoveIconVisible").val();
    $('#fileupload').fileupload({
        url: contextPath+url,
        type : 'POST',
        dataType: 'json',
        autoUpload: false,
        disableImageResize: /Android(?!.*Chrome)|Opera/
            .test(window.navigator.userAgent),
        previewMaxWidth: 100,
        previewMaxHeight: 100,
        previewCrop: true,
    	beforeSend : function(xhr) {
    		$("#loader2").show();
			xhr.setRequestHeader(header, token);
		},
		add: function(e, data) {
			++counter;
			$("#isRemoveIconVisible").val(counter);
	        var uploadErrors = [];
	        var errorFlag="false";
	       // $(".file-upload-input").val(data.originalFiles[0].name);
	        var errorTypeFlag="false";
			        //var acceptFileTypes = /^application\/(pdf)$/i;
			      // alert("type----"+data.originalFiles[0]['type']+"  leng"+data.originalFiles[0]['type'].length);
			      
			        //if(data.originalFiles[0]['type'].length == 0){
			        	// uploadErrors.push('<spring:message code="label.onl_pdf"/>');
			        	 //errorFlag="false";
			        //}
			        //if(data.originalFiles[0]['type'].length && !acceptFileTypes.test(data.originalFiles[0]['type'])) {
			          //  uploadErrors.push('<spring:message code="label.onl_pdf"/>');
			           // errorFlag="false";		//upload icon should not change for any type other than pdf WITHOUT drag and Drop
			        //}
			        if(data.originalFiles[0]['size'] && data.originalFiles[0]['size'] > 26214400) { //bytes
			            uploadErrors.push('<spring:message code="label.mx_file"/>');
			            errorFlag="true";
			        }
			        var is =  $("#isstep3").val();
			        if (is){
			        	$.alert({
			                title: '',
			                content: '<spring:message code="label.deleteExistingDocument"/>',
			            });
			        }
			        else if(uploadErrors.length > 0) {
			        	$.alert({
			                title: '',
			                content: uploadErrors.join("\n"),
			            });
			        	$(".file-upload-input").val(data.originalFiles[0].name);
			        	$("#dropzone").hide();
			            $(".icon-upload").hide();
			            $("#pick").hide();
		            	 $("#dropbox").hide();
		            	 $("#onedrive").hide();
                        $("#egnyte").hide();
                        if(counter <= 1)
						$("#remove-icon").append('<i class="fa fa-times pull-right" aria-hidden="true" onclick="deleteDocument1();" style=""></i>');
                        $("#jumpstep2").attr('disabled',true);
			        } else {
			        	$(".file-upload-input").val(data.originalFiles[0].name);
			        	//Below code change to resolve DrySign:1336 & 1339 by Rupali.Shinde
			        	$("#dropzone").hide(); //changes for defect 1595
			        	$(".icon-upload").hide();
			        	$("#pick").hide();
		            	$("#dropbox").hide();
		            	$("#onedrive").hide();
                        $("#egnyte").hide();
                         if(counter <= 1){
						 $("#remove-icon").append('<i class="fa fa-trash-o pull-right" aria-hidden="true" onclick="deleteDocument();" style=""></i>');
			       			 }
			        $("#uploadSuccess").html(data.originalFiles[0].name);
                    $(".uploadSuccessHeading").css("display","block");
                    //var d = new Date();
                    //var currentDate = d.getMonth()+1+"/"+d.getDate()+"/"+d.getFullYear();
                     //var currentDate = ft.format(date);
                    var fileSize = convertSize(data.originalFiles[0]['size']);
                    //$("#fileSizeandDate").html("File Size- "+fileSize+"  Date- "+currentDate);
                    $("#fileSize").html(fileSize);
		            $("#uploadDate").html("<%= ft.format(date)%>");
                    //console.log("File Size - "+fileSize+"KB  Date - "+currentDate);
                    $(".pdfShow").css("display","block");
			        	 data.submit();
			        }
			       
			},
			
			
        done: function (e, data) {
        	//alert('DONE')
        	 /* $.each(data.result.files, function (index, file) {
                $('<p/>').text(file.name).appendTo('#fileupload');
            }); */
        	
        },
        fail: function (e, data) {
        	$("#loader2").hide();
        	//alert('Failed')
            $.each(data.messages, function (index, error) {
                $('<p style="color: red;">Upload file error: ' + error + '<i class="elusive-remove" style="padding-left:10px;"/></p>')
                .appendTo('#div_files');
            });
        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .progress-bar').css(
                'width',
                progress + '%'
            );
        },
        success : function(response) {
            if(response =="subscriptionend")
            {
            	$("#show_upload_error").html('');
            	$("#show_upload_error").html("<spring:message code="label.crd_limit"/>");
            		
            }//vvv05jun2020 	else if(response !="failed"){
            else if(response=="error")
            	{
            	$(".pdfShow").css("display","none");// changes for defect 1596
            	$("#showfilenotuplad").show();
            	$('.overlaywhite_bg').show();
            	}
            else if(response !="failed" && response !="corrupt"){
            	
            	$.each( response, function( key, value ) {
            		//alert(key +' '+value );
            		if(key == 0){
            			 $("#docId").val(value);
            		}
            		if(key == 1){
           			 	 $("#draftId").val(value);
           			}
            	});
            	 // alert(response)
            	 $("#document-reader-firststep").html(""); // to remove uploaded file
            	 showDocumentInFirstStep(); // show document on firststep
            	 //Below code change to resolve DrySign:1336 & 1339 by Rupali.Shinde
            	 $("#dropzone").hide();
            	 $("#pick").hide();
			     $("#dropbox").hide();
			     $("#onedrive").hide();
                 $("#egnyte").hide();
            	$("#jumpstep2").removeAttr('disabled');
            }else{
            	//vvv05jun2020 existing code commented. added cond for corrupt
            /* 	$("#show_upload_error").html('');
            	$("#show_upload_error").html(response); */
            	
            	if(response =="corrupt"){
            		$.alert({
		                title: '',
		                content: '<spring:message code="label.corruptDocument"/>',
		            });
                	$("#jumpstep2").attr('disabled',true);
                }
            	else{
            		$("#show_upload_error").html('');
                	$("#show_upload_error").html(response);
            	}

            }
        },
        complete : function(response) {
        	//alert("File Upload success");
        	 $("#loader2").hide();
        },
        error : function() {
        	$(".pdfShow").css("display","none");// changes for defect 1596
        	$("#showfilenotuplad").show();
        	$('.overlaywhite_bg').show();
        }
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');
});

function convertSize(size){
//below change done to resolve DrySign:1395 issue by Rupali.Shinde
	if(size>=1024){
	var val = (size/ 1024)/1024; //MB
	var returnsize;
	if(val>= 1 ){
		returnsize = val | 0;
		return returnsize+" MB";
	}else{
		returnsize = (size / 1024) | 0;
		return returnsize+" KB";
	}
	}else{
		return size+" Bytes";
	}
}
function hiderDonePopUp(){
	deleteDocumentPopUp();
	$('.overlay-bg').hide();
	$("#showfilenotuplad").hide();
	$('.overlaywhite_bg').hide();
	
}
function deleteDocument(){
	//alert('HII');
	$('#deleteDocument').show();
	$('.overlaywhite_bg').show();
}
function deleteDocument1(){
	//alert('HII');
	location.reload();
}

function hiderDocumentPopUp(){
	$('#deleteDocument').hide();
	$('.overlaywhite_bg').hide();
}

function saveDocumentPopUp(){
	
	$('#skippopup').show();
	$('.overlaywhite_bg').show();
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}

function getfieldValue(currentValue,id){
	//alert('CurrentValue'+currentValue+id);
	$("#field"+id).attr("value", currentValue);
	
	jumpstep3(2)
	 checkFields();
}
function deleteDocumentPopUp(){
	
	var flag=$("#flag").val();
	var docId=$("#docId").val();
	if(docId != ''){
	
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
		$.ajax({
			//contentType : 'application/json; charset=utf-8',
			type : "GET",
			url : contextPath+"app/deleteDocument?docId="+docId,
			beforeSend : function(xhr) {
				$("#loader2").show();
				$("#jumpstep2").attr('disabled',true);
				xhr.setRequestHeader(header, token);
			},
			complete : function() {
				$("#loader2").hide();
			},success : function(response) {
				/* if(response == "103"){
					$("#deleteDocument").hide();
					$('.overlaywhite_bg').hide();	
					$("#show-selfsign-steps").show();
	        		$("#skippopup").hide();
	        		$("#show-selfsign-error").show();
	        		$('.overlaywhite_bg').show();
	        		$("#error-messgae").empty();
	        		$("#error-messgae").append('<spring:message code="label.sgn_prvs"/>');
				}else */ if(response == "invalid"){
					$("#deleteDocument").hide();
					$('.overlaywhite_bg').hide();	
					$("#show-selfsign-steps").show();
	        		$("#skippopup").hide();
	        		$("#show-selfsign-error").show();
	        		$('.overlaywhite_bg').show();
	        		$("#error-messgae").empty();
	        		$("#error-messgae").append('<spring:message code="label.invalid"/>');
				}
				else if(response == "success"){
					if(flag == "draft"){
						 window.location.href=contextPath+"app/document/selfsign";
						 $("#deleteDocument").hide();
						 $('.overlaywhite_bg').hide();	
					}else{
						$("#jumpstep2").attr('disabled',true);
						location.reload();	
					}
					
					
				}else{
					alert('<spring:message code="label.err"/>');
				}
			},
			error: function(xhr, textStatus, errorThrown)
			 {
			 	alert('<spring:message code="label.loading_error"/>');
			 	return false;
			}
		});	
	}else{
		location.reload();
	}
	
}

function showDocumentInFirstStep(){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var contextPath=$("#contextPath").val();
	var docId=$("#docId").val();
	var fileName=$(".file-upload-input").val();
	var draftId=$("#draftId").val();
	var flag=$("#flag").val();
	var info = "?docId="+docId+"&fileName="+encodeURIComponent(fileName)+"&draftId="+draftId+"&flag="+flag+"&step=1";
	$.ajax({
		
		type : "GET",
		url : contextPath+"app/getDocument"+info,
		
		async:false,
		beforeSend : function(xhr) {
			
			xhr.setRequestHeader(header, token);
		},
		complete : function() {
			
		},
		success : function(response) {
			var numpages="";
			var filename="";
			var fileid="";
			var width="";
			var height="";
			var pdfInfo = response;
			/* if(response == '103'){
        		$("#show-selfsign-steps").show();
        		$("#skippopup").hide();
        		$("#show-selfsign-error").show();
        		$('.overlaywhite_bg').show();
        		$("#error-messgae").empty();
        		$("#error-messgae").append('<spring:message code="label.sgn_prvs"/>');
        	}else  */if(response == "invalid"){
        		$("#show-selfsign-steps").show();
        		$("#skippopup").hide();
        		$("#show-selfsign-error").show();
        		$('.overlaywhite_bg').show();
        		$("#error-messgae").empty();
        		$("#error-messgae").append('<spring:message code="label.invalid"/>');
			}else {
				if(response != 'failed'){
					var i=1;
					$.each( response, function( key, value ) {
							//  alert( key + ": " + value );
						if(key == "numpages" ){
							numpages=value;
							$("#numpages").val(numpages)
						}
						
						if(key =="filename"){
							filename=value;
							//alert(filename);
						}
						
						if(key =="fileid"){
							fileid=value;
						}
						
						if(key =="pwidth"){
							width=value;
							
						}
						
						if(key =="pheight"){
							height=value;
							$("#pageHeight").val(height)
						}
					});
					for (var i = 1; i <= 1; i++) {
						$.ajax({
							type : "GET",
							url : contextPath+'app/img?fileid='+fileid+'&filename='+filename+'&page='+i+'&numpages='+numpages+"&docId="+docId,
							async: false,
							
							beforeSend : function(xhr) {
								
								//$("#loader2").show();
								xhr.setRequestHeader(header, token);
							},
							complete : function() {
								//$("#signupbtn").buttonLoader('stop');
							},
							success : function(response) {
																
								if(response.indexOf('allPageImageJson')==-1){
									getAllPages(contextPath,fileid,filename,numpages,docId,header,width,height,pdfInfo,token,"step1");
								}
								else{
									
									var json=JSON.parse(response);
										if(json.allPageImageJson==true){
										apppendAllpageJsonImgtoDoucment(docId,width,height,response,numpages, pdfInfo,"step1");
										}
									}
								
							},
							error : function(response) {
								//$("#document-reader").append('<div class="drop" id="'+i+'"><img width="'+width+'px" height="'+height+'px" class="render-image" onload="loadImage()" src="data:image/png;base64,'+'<c:out value='response'></c:out>'+'"></div>');
							},
						});
				  		
					}
					//$("#loader2").hide();
					$("#stepNumber").val(1);
					
				}else{
					alert('Failed')
				}
        	}
		},
		error: function(xhr, textStatus, errorThrown)
		 {
		 	alert('<spring:message code="label.loading_error"/>');
		 	return false;
		}
	})
}
function jumpstep2(count){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var contextPath=$("#contextPath").val();
	//alert($(".file-upload-input").attr('title'));
	if(count == 0){
		$("#viewpagecount").val(1);	
	}
	$("#isstep3").val(true);
	if(count != 1){
	var docId=$("#docId").val();
	var fileName=$(".file-upload-input").val();
	var draftId=$("#draftId").val();
	var flag=$("#flag").val();
	var info = "?docId="+docId+"&fileName="+encodeURIComponent(fileName)+"&draftId="+draftId+"&flag="+flag+"&step=2";
	$.ajax({
		//contentType : 'application/json; charset=utf-8',
		type : "GET",
		url : contextPath+"app/getDocument"+info,
		//dataType : 'json',
		//data : JSON.stringify(data),
		async:false,
		beforeSend : function(xhr) {
			$('#jumpstep2').buttonLoader('start');
			xhr.setRequestHeader(header, token);
		},
		complete : function() {
			$("#jumpstep2").buttonLoader('stop');
		},
		success : function(response) {
			var numpages="";
			var filename="";
			var fileid="";
			var width="";
			var height="";
			var pdfInfo = response;
			/* if(response == '103'){
        		$("#show-selfsign-steps").show();
        		$("#skippopup").hide();
        		$("#show-selfsign-error").show();
        		$('.overlaywhite_bg').show();
        		$("#error-messgae").empty();
        		$("#error-messgae").append('<spring:message code="label.sgn_prvs"/>');
        	}else  */if(response == "invalid"){
        		$("#show-selfsign-steps").show();
        		$("#skippopup").hide();
        		$("#show-selfsign-error").show();
        		$('.overlaywhite_bg').show();
        		$("#error-messgae").empty();
        		$("#error-messgae").append('<spring:message code="label.invalid"/>');
			}else {
				if(response != 'failed'){
					var i=1;
					$.each( response, function( key, value ) {
							//  alert( key + ": " + value );
						if(key == "numpages" ){
							numpages=value;
							$("#numpages").val(numpages)
						}
						
						if(key =="filename"){
							filename=value;
							//alert(filename);
						}
						
						if(key =="fileid"){
							fileid=value;
						}
						
						if(key =="pwidth"){
							width=value;
							
						}
						
						if(key =="pheight"){
							height=value;
							$("#pageHeight").val(height)
						}
					});
					for (var i = 1; i <= 1; i++) {
				  		//$("#document-reader").append('<div class="drop" id="'+i+'"><img width="'+width+'px" height="'+height+'px" class="render-image" onload="loadImage()" src="'+contextPath+'getImgDocument?fileid='+fileid+'&filename='+filename+'&page='+i+'&userId='+userId+'"></div>');
						$.ajax({
							//contentType : 'application/json; charset=utf-8',
							type : "GET",
							url : contextPath+'app/img?fileid='+fileid+'&filename='+filename+'&page='+i+'&numpages='+numpages+"&docId="+docId,
							async: false,
							//dataType : 'json',
							//data : JSON.stringify(data),
							beforeSend : function(xhr) {
								//$('#signupbtn').buttonLoader('start');
								$("#loader2").show();
								xhr.setRequestHeader(header, token);
							},
							complete : function() {
								//$("#signupbtn").buttonLoader('stop');
							},
							success : function(response) {
								//alert(response);
								//alert(response);
							
								//$("#document-reader").append('<div class="drop" id="'+i+'"><img width="'+ pdfInfo.widths[i - 1] +'px" height="'+ pdfInfo.heights[i - 1] +'px" class="render-image" onload="loadImage()" src="data:image/png;base64,'+response+'"></div>');
								/* if(response =="base64error"){
									alert('base64error');
								} */
								//alert(response);
								
								
								if(response.indexOf('allPageImageJson')==-1){
									getAllPages(contextPath,fileid,filename,numpages,docId,header,width,height,pdfInfo,token,"step2");
								}
								else{
									
									var json=JSON.parse(response);
										if(json.allPageImageJson==true){
										apppendAllpageJsonImgtoDoucment(docId,width,height,response,numpages, pdfInfo,"step2");
										}
									}
								
							},
							error : function(response) {
								$("#document-reader").append('<div class="drop" id="'+i+'"><img width="'+width+'px" height="'+height+'px" class="render-image" onload="loadImage()" src="data:image/png;base64,'+'<c:out value='response'></c:out>'+'"></div>');
							},
						});
				  		
					}
					$("#loader2").hide();
					$("#stepNumber").val(2);
					//var test1='<div class="dragMe drgfields ui-draggable ui-draggable-dragging ui-draggable-handle" style="padding: 0px; position: absolute; left: 154.25px; top: 60px;" data-signer-id="1" data-document-id="1" id="fieldPosition1"><span>Name</span><span class="closeIt">x</span><input type="text" id="field1" class="selfsign-control" onchange="getfieldValue(this.value,1)" value="asdasd" name="name" required=""></div><div class="dragMe ui-draggable ui-draggable-handle ui-draggable-dragging" data-signer-id="1" data-document-id="1" style="position: absolute; left: 422px; top: 31.4844px;" id="fieldPosition1"><span>Name</span><span class="closeIt">x</span><input type="text" id="field1" class="selfsign-control" onchange="getfieldValue(this.value,1)" value="" name="name" required=""></div>';
					
					//setTimeout(function(){
						//$("#document-reader").append(test1);
						
					//},1000);
					 
				}else{
					alert('Failed')
				}
        	}
		},
		error: function(xhr, textStatus, errorThrown)
		 {
		 	alert('<spring:message code="label.loading_error"/>');
		 	return false;
		}
	})	
	 DragSigner();
	 DragMe();
	 
	}
	

	 
	
}


function apppendAllpageJsonImgtoDoucment(docId,width,height,response,numpages,pdfInfo, step){
	
    var dropid;
	var src1="";
	var maxwidth=pdfInfo.widths[0];
	for (var i = 0; i <numpages; i++) {
     src1=appURL+"/docimages/"+docId+"/"+i+".png";
	  dropid=i+1;
	  if(step == "step2"){
		  $("#document-reader").append('<div class="drop" id="'+dropid+'"><img width="' + pdfInfo.widths[i] + 'px" height="' + pdfInfo.heights[i] + 'px" class="render-image" onload="loadImage()" src='+src1+'></div>');	  
	  }else{
		  $("#document-reader-firststep").append('<div><img width="' + pdfInfo.widths[i] + 'px" height="' + pdfInfo.heights[i] + 'px" class="render-image" onload="loadImage()" src='+src1+'></div>'); 
	  }
    
     if(parseFloat(pdfInfo.widths[i])>parseFloat(maxwidth))
     {    
    	 maxwidth=pdfInfo.widths[i];	 
     }
     $("#document-reader").find(".drop#"+dropid).css("width",pdfInfo.widths[i]);
     //console.log("for dropid " + dropid + ":pdf image width and height:" + width +"," + height);
	}
	
	 if(step == "step2"){
	 	//for width of  document reader for drag and drop depending page size
    	$("#document-reader").css("width",maxwidth-10);
	 }else{
		 $("#document-reader-firststep").css("width",maxwidth); 
	  }
}

function getAllPages(contextPath,fileid,filename,numpages,docId,header,width,height,pdfInfo,token, step){

	for (var i = 1; i <= numpages; i++) {
  		//$("#document-reader").append('<div class="drop" id="'+i+'"><img width="'+width+'px" height="'+height+'px" class="render-image" onload="loadImage()" src="'+contextPath+'getImgDocument?fileid='+fileid+'&filename='+filename+'&page='+i+'&userId='+userId+'"></div>');
		$.ajax({
			//contentType : 'application/json; charset=utf-8',
			type : "GET",
			url : contextPath+'app/img?fileid='+fileid+'&filename='+filename+'&page='+i+'&numpages='+numpages+"&docId="+docId,
			async: false,
			//dataType : 'json',
			//data : JSON.stringify(data),
			beforeSend : function(xhr) {
				//$('#signupbtn').buttonLoader('start');
				$("#loader2").show();
				xhr.setRequestHeader(header, token);
			},
			complete : function() {
				//$("#signupbtn").buttonLoader('stop');
			},
			success : function(response) {
			if(step == "step2"){
				$("#document-reader").append('<div class="drop" id="'+i+'"><img width="'+ pdfInfo.widths[i - 1] +'px" height="' + pdfInfo.heights[i - 1] + 'px" class="render-image" onload="loadImage()" src="data:image/png;base64,'+<c:out value='response'></c:out>+'"></div>');
			}else{
				  $("#document-reader-firststep").append('<div><img width="'+ pdfInfo.widths[i - 1] +'px" height="' + pdfInfo.heights[i - 1] + 'px"  class="render-image" onload="loadImage()" src="data:image/png;base64,'+<c:out value='response'></c:out>+'"></div>'); 
			  }
			},
			error : function(response) {
			if(step == "step2"){
				$("#document-reader").append('<div class="drop" id="'+i+'"><img width="'+width+'px" height="'+height+'px" class="render-image" onload="loadImage()" src="data:image/png;base64,'+<c:out value='response'></c:out>+'"></div>');
			}else{
				  $("#document-reader-firststep").append('<div><img width="'+width+'px" height="'+height+'px" class="render-image" onload="loadImage()" src="data:image/png;base64,'+<c:out value='response'></c:out>+'"></div>');
			  }
			},
		});
  		
	}
}	


function DragSigner(){
	var dragEl = null;

    //Make element draggable
    $(".dragSigners").draggable({
        helper: 'clone',
        cursor: 'move',
        tolerance: 'fit',
        //Rushikesh chnages related drag and drop
		//revert: true
        revert: false
    });
   

    $(".drop").droppable({
    	accept: '.dragSigners',
        activeClass: "drop-area",


      	drop: function (e, ui) {
        	  console.log('ui : ',ui);
        	  var pageWidth=0;
        	  dragEl = ui.helper.clone();
              ui.helper.remove();
              document_id   = dragEl.data("document-id");
              signer_id     = dragEl.data("signer-id");
              var off = $(this).offset();
              leftPosition  = ui.offset.left - off.left;;
              topPosition   = ui.offset.top - off.top;
              
              var dropElement = $('.drop .dragMe');
              var dropElementCnt = dropElement ? dropElement.length + 1 : 1;
              
              var dragElTopPoss = parseInt(dragEl[0].style.top.substring(0, (dragEl[0].style.top.length)));
              var dragElLeftPoss = parseInt(dragEl[0].style.left.substring(0, (dragEl[0].style.top.length)));
              
              
              var docHeight = $('#document-reader').height() - 70;
              var docWidth = $('#document-reader').width();
              
              var fontSize = $(this).css("font-size");
      			if(fontSize == "undefined" || fontSize == undefined){
      			fontSize =="";
      			}
              
              var droppableId = $(this).attr("id");
              var uniqueGenerator = $("#generator").val();
              var innertext=ui.draggable[0].innerText;
              innertext=innertext.toUpperCase();
              var pageWidthString=$("#"+droppableId).find("img").attr('width');
              
              if(isNaN(pageWidthString)){
             	 //remnoving px from string
             	 pageWidth=pageWidthString.substring(0, (pageWidthString.length-2)); 
              }
              else{
             	 pageWidth=pageWidthString;
              }
               
               console.log("leftPosition="+leftPosition);
               if((pageWidth-167)<leftPosition){
             	  leftPosition= pageWidth - 167;
             	  console.log("left position ===="+leftPosition);
             	  return;
               }
             
              
              if(chekForDraggingElementasitis(dragEl,droppableId,ui,topPosition,leftPosition,innertext,signer_id)){
              	return;
              }
    
        if (document_id == 1 && signer_id == 1) {
        	var fullname=$("#fullName").val();
        	
			$("#"+droppableId).append(ui.helper.clone().html('<div class="input-drop-fild very-specific-design element_'+ dropElementCnt +'" id="input-drop-fild'+uniqueGenerator+'"><div class="name" ><a class="closeIt hideIt" style=" text-decoration: none;" onclick="hideTextbox('+uniqueGenerator+')" href="#clear"><span class="fa fa-times-circle"></span></a><input name="name" class="field111" readonly type="text" id="field'+uniqueGenerator+'" data-top="'+topPosition+'" data-left="'+leftPosition+'" data-pagenumber='+droppableId+' onchange="getfieldValue(this.value,'+uniqueGenerator+')" placeholder="Name" value="'+fullname+'" type="text"></div></div>'));
        	
  			$(this).find("div.dragMe").attr('id', 'fieldPosition'+uniqueGenerator+'');
  			if(docHeight <= dragElTopPoss){
	        	$('.element_'+ dropElementCnt).parent('.dragMe.dragSigners').css('top', docHeight);
	        	$('.element_'+ dropElementCnt).find('input').attr('data-top', docHeight);
	        }
  		   
		}else if (document_id == 1 && signer_id == 2) {
			Date.prototype.monthNames = [
                "January", "February", "March",
                "April", "May", "June",
                "July", "August", "September",
                "October", "November", "December"
            ];

            Date.prototype.getMonthName = function() {
                return this.monthNames[this.getMonth()];
            };
            Date.prototype.getShortMonthName = function () {
                return this.getMonthName().substr(0, 3);
            };

			var today = new Date();
			var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!
			var yyyy = today.getFullYear();

			if(dd<10) {
			    dd='0'+dd
			} 

			if(mm<10) {
			    mm='0'+mm
			} 

			today = mm+'/'+dd+'/'+yyyy;
			
			$("#"+droppableId).append(ui.helper.clone().html('<div class="input-drop-fild very-specific-design element_'+ dropElementCnt +'" id="input-drop-fild'+uniqueGenerator+'"><div class="date "><a class="closeIt hideIt" style=" text-decoration: none;"  onclick="hideTextbox('+uniqueGenerator+')" href="#clear"><span class="fa fa-times-circle"></span></a><input name="date" class="field111" type="text" onchange="getfieldValue(this.value,'+uniqueGenerator+')" id="field'+uniqueGenerator+'" data-top="'+topPosition+'" data-left="'+leftPosition+'" data-pagenumber='+droppableId+' placeholder="Date.." value="'+today+'"  type="text" readonly></div></div>'));
  			
  			$(this).find("div.dragMe").attr('id', 'fieldPosition'+uniqueGenerator+'');
  			if(docHeight <= dragElTopPoss){
  	        	$('.element_'+ dropElementCnt).parent('.dragMe.dragSigners').css('top', docHeight);
  	        	$('.element_'+ dropElementCnt).find('input').attr('data-top', docHeight);
  	        }
  		  
		}else if (document_id == 1 && signer_id == 3) {
			var signature=$("#signature").val();
			
			
			if(signature !=''){
				$("#"+droppableId).append(ui.helper.clone().html('<div class="input-drop-fild very-specific-design element_'+ dropElementCnt +'" id="input-drop-fild'+uniqueGenerator+'"><div class="signatureb" id="input-drop-fild'+uniqueGenerator+'"><a class="closeIt hideIt" style=" text-decoration: none;" onclick="hideTextbox_Sig('+uniqueGenerator+','+signer_id+')" href="#clear"><span class="fa fa-times-circle"></span></a><input name="signature" class="field111" type="image"  id="field'+uniqueGenerator+'" data-top="'+topPosition+'" data-left="'+leftPosition+'"  data-pagenumber='+droppableId+' onclick="openMySignature('+uniqueGenerator+')" placeholder="Signature here" src="'+signature+'" readonly></div></div>'));
			}else{
				$("#"+droppableId).append(ui.helper.clone().html('<div class="input-drop-fild very-specific-design element_'+ dropElementCnt +'" id="input-drop-fild'+uniqueGenerator+'"><div class="signatureb" id="input-drop-fild'+uniqueGenerator+'"><a class="closeIt hideIt" style=" text-decoration: none;" onclick="hideTextbox_Sig('+uniqueGenerator+' ,'+signer_id+')" href="#clear"><span class="fa fa-times-circle"></span></a><input name="signature" class="field111" type="text"  id="field'+uniqueGenerator+'" data-top="'+topPosition+'" data-left="'+leftPosition+'" data-pagenumber='+droppableId+'  onclick="openMySignature('+uniqueGenerator+')"  placeholder="Signature here"  readonly></div></div>'));
			}
			
  			$(this).find("div.dragMe").attr('id', 'fieldPosition'+uniqueGenerator+'');
  			if(docHeight <= dragElTopPoss){
  	        	$('.element_'+ dropElementCnt).parent('.dragMe.dragSigners').css('top', docHeight);
  	        	$('.element_'+ dropElementCnt).find('input').attr('data-top', docHeight);
  	        }
  			//enable disable code by sarika
  			$("#signer-5").removeClass("dragMe dragSigners ui-draggable ui-draggable-handle");
  			$("#signer-5").css("opacity","0.3");
  			$(".sign_stamp").css("opacity","0.6");
		}
		else if (document_id == 1 && signer_id == 5){
			var signature=$("#signature").val();
			
			var today = new Date();
			var date = today.getFullYear()+'.'+(today.getMonth()+1)+'.'+today.getDate();
			var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
			var dateTime = date+', '+time+' '+today.toString().split("GMT")[1].split("(")[0];
			
			if(signature !=''){
	        	
	        	$("#"+droppableId).append(ui.helper.clone().html('<div class="input-drop-fild very-specific-stamp-design element_'+ dropElementCnt +'" id="input-drop-fild'+uniqueGenerator+'"><div class="signatureb1"><a class="closeIt hideIt" style=" text-decoration: none;" onclick="hideTextbox_Sig('+uniqueGenerator+' ,'+signer_id+')" href="#clear"><span class="fa fa-times-circle"></span></a><div id="input-drop-fild'+uniqueGenerator+'"><div class="field111_stamp"><input name="signaturewithstamp" type="image"  id="field'+uniqueGenerator+'" data-top="'+topPosition+'" data-left="'+leftPosition+'" data-pagenumber='+droppableId+' onclick="openMySignature('+uniqueGenerator+')" placeholder="Signature here" src="'+signature+'" readonly></span><div class="stamp groupSignStamp" id="mySpanImg'+uniqueGenerator+'" data-top="0" data-left="0" data-width="0" data-height="0" data-stamp="data-digitalStamp" data-fontSize="'+fontSize+'"><span class="span1">Digitally signed by</span><br/><span class="span2">'+$("#typeName").val()+'</span><br/><span class="span3">'+dateTime+'</span></div></div></div></div></div>'));
	        }else{
	        	$("#"+droppableId).append(ui.helper.clone().html('<div class="input-drop-fild very-specific-stamp-design element_'+ dropElementCnt +'" id="input-drop-fild'+uniqueGenerator+'"><div class="signatureb1"><a class="closeIt hideIt" style=" text-decoration: none;" onclick="hideTextbox_Sig('+uniqueGenerator+' ,'+signer_id+')" href="#clear"><span class="fa fa-times-circle"></span></a><div id="input-drop-fild'+uniqueGenerator+'"><div class="field111_stamp"><input name="signaturewithstamp" type="text"  id="field'+uniqueGenerator+'" data-top="'+topPosition+'" data-left="'+leftPosition+'" data-pagenumber='+droppableId+'  onclick="openMySignature('+uniqueGenerator+')" placeholder="Signature here"  readonly></span><div class="stamp groupSignStamp" id="mySpanImg'+uniqueGenerator+'" data-top="0" data-left="0" data-width="0" data-height="0" data-stamp="data-digitalStamp" data-fontSize="'+fontSize+'"><span class="span1">Digitally signed by</span><br/><span class="span2">'+$("#typeName").val()+'</span><br/><span class="span3">'+dateTime+'</span></div></div></div></div><</div>'));  
	        }
		
  			$(this).find("div.dragMe").attr('id', 'fieldPosition'+uniqueGenerator+'');
  			if(docHeight <= dragElTopPoss){
  	        	$('.element_'+ dropElementCnt).parent('.dragMe.dragSigners').css('top', docHeight);
  	        	$('.element_'+ dropElementCnt).find('input').attr('data-top', docHeight);
  	        }
  			if(docWidth - 370 <= dragElLeftPoss){  				
  	        	$('#document-reader .element_'+ dropElementCnt).parent('.dragMe.dragSigners').css('left', docWidth - 380);
  	        	$('.element_'+ dropElementCnt).find('input').attr('data-left', docWidth - 380);
  	        }
  			$(this).find("div.stampwithsig").addClass('sintatureStamp');
  			$("#signer-3").removeClass("dragMe dragSigners ui-draggable ui-draggable-handle");
  			$("#signer-3").css("opacity","0.5");
  			$(".sign").css("opacity","0.6");
  			
			}else  if (document_id == 1 && signer_id == 4) {
        	
			$("#"+droppableId).append(ui.helper.clone().html('<div class="input-drop-fild very-specific-design element_'+ dropElementCnt +'" id="input-drop-fild'+uniqueGenerator+'"><div class="text"><a class="closeIt hideIt" style=" text-decoration: none;" id="" onclick="hideTextbox('+uniqueGenerator+')" href="#clear"><span class="fa fa-times-circle"></span></a><input name="text" class="field111" type="text" maxlength="25" onchange="getfieldValue(this.value,'+uniqueGenerator+')" onkeypress="enlargeText(field'+uniqueGenerator+',this.value);"  id="field'+uniqueGenerator+'" data-top="'+topPosition+'" data-left="'+leftPosition+'" data-pagenumber='+droppableId+' placeholder="Text" value="" ></div></div>'));
			
  			$(this).find("div.dragMe").attr('id', 'fieldPosition'+uniqueGenerator+'');
  			if(docHeight <= dragElTopPoss){
  	        	$('.element_'+ dropElementCnt).parent('.dragMe.dragSigners').css('top', docHeight);
  	        	$('.element_'+ dropElementCnt).find('input').attr('data-top', docHeight);
  	        }
			
		}else  if (document_id == 1 && signer_id == 6) {
    		var firstname=$("#firstName").val();
			
    		$("#"+droppableId).append(ui.helper.clone().html('<div class="input-drop-fild very-specific-design element_'+ dropElementCnt +'" id="input-drop-fild'+uniqueGenerator+'"><div class="initials"><a class="closeIt hideIt" style=" text-decoration: none;" id="" onclick="hideTextbox('+uniqueGenerator+')" href="#clear"><span class="fa fa-times-circle"></span></a><input name="initials" class="field111" maxlength="5" type="text" class="expandeble" onkeypress="enlargeText(field'+uniqueGenerator+',this.value);" onchange="getfieldValue(this.value,'+uniqueGenerator+')"  id="field'+uniqueGenerator+'" data-top="'+topPosition+'" data-left="'+leftPosition+'" data-pagenumber='+droppableId+' placeholder="Initials" ></div></div>'));
  			
  			$(this).find("div.dragMe").attr('id', 'fieldPosition'+uniqueGenerator+'');
  			if(docHeight <= dragElTopPoss){
  	        	$('.element_'+ dropElementCnt).parent('.dragMe.dragSigners').css('top', docHeight);
  	        	$('.element_'+ dropElementCnt).find('input').attr('data-top', docHeight);
  	        }
			
		}
       

        

        
       var incremented = parseInt(uniqueGenerator)+1;
        $("#generator").val(incremented);
        
        dragEl.draggable({               
            helper: 'original',
            containment: '.drop',
            tolerance: 'fit',
    		//stack: '.dragSigners',
    		drop: function (event, ui) {
              $(ui.draggable).remove();
            }
    });
        
        
            dragEl.addClass("dragMe");
          //dragEl.appendTo('.drop');
          jumpstep3(2)
          // update draged element position to database
          // updateDraggedPosition(dragEl, stopPosition, document_id, signer_id)
    		checkFields();
          // activate dragging for cloned element
          
          DragMe();
          
          return uniqueGenerator;

      }
    });
 
  }
function dragSignatureasItis(dragEl,droppableId,ui,top,left){
	console.log(dragEl["0"].innerHTML);
	var html=ui.draggable[0].outerHTML;
	var id =$(ui.draggable[0].outerHTML).find("input").attr('id'); // anchor tag removed for misplaced
	
	$("#"+droppableId).append(ui.draggable[0].outerHTML);
	$("#"+id).attr("data-top",top);
	$("#"+id).attr("data-left",left);
	$("#"+id).attr("data-pagenumber",droppableId);
	 
	DragMe();
    draganddrop(3,"");
}

function draganddrop(stepNumber,checkFields){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var contextPath=$("#contextPath").val();
	if(checkFields == "signerRemove"){
		$("#fieldshtml").val("");
		var fieldsHTML = "";
	}else{
		$("#fieldshtml").val("");
		var fieldsHTML = "";
		/* $("#document-reader > .dragMe").each(function() {
			fieldsHTML += $(this).prop("outerHTML");
		}); */
	}
	//alert('fieldsHTML'+fieldsHTML);
	//$("#fieldshtml").val(fieldsHTML);
	var docId=$("#docId").val();
	var draftId=$("#draftId").val();
	var increment=$("#generator").val();
	var data = {
			 "docId": docId,
			 "draftId" : draftId,
			 "fieldHtml" : fieldsHTML,
			 "stepNumber":stepNumber,
			 "increment":1,
			 "signType":"G"
	}
	$.ajax({
		type : "POST",
		url : contextPath+"app/step2SelfSign",
		dataType: 'json',
	    contentType: "application/json; charset=utf-8",
	    data: JSON.stringify(data),
	    beforeSend: function (xhr) {
   			xhr.setRequestHeader(header, token);
	    },
	    complete: function () {
	    },
        success : function(response) {
        	//alert(response);
          if(response != 'failed'){
      			//alert("success");
      			$("#stepNumber").val(3);
          }else{
          	alert('Failed');
          }

		},
		 error : function(e) {  
		    alert('Error: ' + e);   
		}  
	 });
}

function chekForDraggingElementasitis(dragEl,droppableId,ui,topPosition,leftPosition,innertext,signer_id){
	
	console.log(" top position:"+topPosition +" left position: "+leftPosition);
	 if(signer_id==1 && (innertext.indexOf('NAME')==-1)){
		 
  	   dragSignatureasItis(dragEl,droppableId,ui,topPosition,leftPosition);
      return true;	
     }
  	   
    
     if(signer_id==2 && (innertext.indexOf('DATE')==-1)){
  	   dragSignatureasItis(dragEl,droppableId,ui,topPosition,leftPosition);
    	return true;
     }

     
     if(signer_id==3 && (innertext.indexOf('SIGNATURE')==-1)){
  	  
      dragSignatureasItis(dragEl,droppableId,ui,topPosition,leftPosition);
       	return true;
      }
     
     if(signer_id==4 && (innertext.indexOf('TEXTBOX')==-1)){
   	  
      	dragSignatureasItis(dragEl,droppableId,ui,topPosition,leftPosition);
      	return true;
     }
     
     if(signer_id==6 && (innertext.indexOf('INITIALS')==-1)){
   	  
      	dragSignatureasItis(dragEl,droppableId,ui,topPosition,leftPosition);
      	return true;
     }

 return false;

}

function DragMe(){ 
    var document_id;

    $(".dragMe").draggable({
    	//rushikesh changes related drag and drop
    	//containment: ".drop",
     	containment: "#document-reader",
      cursor: 'move',
      // opacity: 0.35,
      stack: $('#document-reader'),
      //scroll: false,
      appendTo: $("#document-reader"),
     
      start: function(event, ui) {
        startPosition = $(this).position();
      },
      stop: function(event, ui) {
        dragEl        = $(this);
        stopPosition  = dragEl.position();
        document_id   = dragEl.data("document-id");
        signer_id     = dragEl.data("signer-id");
        
        
        // debug current dropped position
        // this position is working perfectly fine.
        // above drag, drop and clone position should behave like this
      //  alert("top: " + stopPosition.top + ", left: " + stopPosition.left); 
           jumpstep3(2);
     
		
           var dropElement = $('.drop .dragMe');
           
          	for(i = 0; i < dropElement.length + 1; i++){
          		
           $(dropElement[i]).find( ".field111" ).css( "font-size", ( $(dropElement[i]).find(".field111").width()-50) + "%" );
           	$(dropElement[i]).find(".field111_stamp").css( "font-size", ( $(dropElement[i]).find(".field111_stamp").width()/20-5) + "px" ); 
           	$(dropElement[i]).find(".span1").css( "font-size", ( $(dropElement[i]).width()/20-12) + "px" );
           	$(dropElement[i]).find(".span2").css( "font-size", ( $(dropElement[i]).width()/20) + "px" );
           	$(dropElement[i]).find(".span3").css( "font-size", ( $(dropElement[i]).width()/20-12) + "px" );
           	$(dropElement[i]).find(".stamp").attr( "data-fontsize", ( $(dropElement[i]).width()/20) + "px" );
           	
           	$(dropElement[i]).find('.stamp').attr('data-width', parseFloat($(dropElement[i]).width()) / 2);
           	$(dropElement[i]).find('.stamp').attr('data-left', parseFloat($(dropElement[i]).width()) / 2);
           	$(dropElement[i]).find('.stamp').attr('data-height', parseFloat($(dropElement[i]).height()));
          	}
          	
          	
        if(!dragEl.hasClass("parent")){
         // updateDraggedPosition(dragEl, stopPosition, document_id, signer_id)
        }
      }
     
    });
 
  
    $(".drop .dragMe").resizable({    
    	
        //animate: true,
        //aspectRatio: 16 / 9,
        //helper: "ui-resizable-helper",
        handles: "se",
       //rushikesh changes related drag and drop
        containment: "#document-reader .drop",
        scroll: false,
        resize: function(event, ui)
     
    
    {	
		var resizeId = $(this).find('.input-drop-fild').attr('id');
		
		$("#"+resizeId).find( ".field111" ).css( "font-size", ( $("#"+resizeId).width()-50) + "%", );
		$("#"+resizeId).find(".field111_stamp").css( "font-size", ( $("#"+resizeId).width()/20-5) + "px" );
		$("#"+resizeId).find(".span1").css( "font-size", ( $("#"+resizeId).width()/20 - 15) + "px" );
		$("#"+resizeId).find(".span2").css( "font-size", ( $("#"+resizeId).width()/20 ) + "px" );
		$("#"+resizeId).find(".span3").css( "font-size", ( $("#"+resizeId).width()/20 - 15) + "px" );
		
		$("#"+resizeId).find(".stamp").attr( "data-fontsize", ( $("#"+resizeId).width()/20 ) + "px" );
		$("#"+resizeId).find('.stamp').attr('data-width', parseFloat($("#"+resizeId).parent('.dragMe.dragSigners').width()) / 2);
		$("#"+resizeId).find('.stamp').attr('data-left', parseFloat($("#"+resizeId).parent('.dragMe.dragSigners').width()) / 2);
		$("#"+resizeId).find('.stamp').attr('data-height', parseFloat($("#"+resizeId).parent('.dragMe.dragSigners').height()));
		
		var top = ui.position.top;
		var left = ui.position.left;
        var height = ui.size.height;
        var width = ui.size.width;
        var bottom = top + height;
        var right = left + width;
        // Define my constraints based on the element #2
        var constraintLeft = $(this).parents('.drop').position().left;
        var constraintWidth = $(this).parents('.drop').width();
        var constraintRight = constraintLeft + constraintWidth; 
        
        var constraintTop = $(this).parents('.drop').position().top;
        var constraintHeight = $(this).parents('.drop').height();
        var constraintBottom = (constraintTop + constraintHeight); 
        // if resizable has gone further left than the constraint

        if(top < constraintTop) { 
            var top = parseInt($(this).css('top'));
            var difference = constraintTop - top;
            $(this).css('top', constraintTop);      
            $(this).height($(this).height() - difference);
            // cancel the event
            $(this).resizable('widget').trigger('mouseup');
        }
        if( bottom > constraintBottom) {
        	constraintBottom = constraintBottom + 90;
            $(this).height(constraintBottom - bottom);
            $(this).resizable('widget').trigger('mouseup');
        }
        
        if(left < constraintLeft) { 
            var left = parseInt($(this).css('left'));
            var difference1 = constraintLeft - left;
            $(this).css('left', constraintLeft);      
            $(this).width($(this).width() - difference1);
            $(this).resizable('widget').trigger('mouseup');
        }
        if( right > constraintRight) {
            $(this).width(constraintRight - left);
            // cancel the event
            $(this).resizable('widget').trigger('mouseup');
        }
    },
        
      });
    

  }
  

  // this function is simply for updating required fields to database
  // please ignore this for now
  function updateDraggedPosition(dragEl, stopPosition, document_id, signer_id){
    $.ajax({
      url: '/signers/drag_signer',
      data: {
        drag_signer: {
          top: stopPosition.top,
          left: stopPosition.left,
          signer_id: signer_id,
          document_id: document_id,
          id: dragEl.data("id")
        }
      },
      type: "POST",
      dataType: "script",
      success: function(data) {
        console.log(dragged_signer_id);
        console.log(dragEl);
        dragEl.data("id", dragged_signer_id);
      }
    })
  }
function jumpstep3(stepNumber){
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var contextPath=$("#contextPath").val();
	$("#fieldshtml").val("");
	var fieldsHTML = "";
	$(".drop > .dragMe").each(function() {
		fieldsHTML += $(this).prop("outerHTML");
	});
	//alert('fieldsHTML'+fieldsHTML);
	//$("#fieldshtml").val(fieldsHTML);
	var docId=$("#docId").val();
	var draftId=$("#draftId").val();
	var increment=$("#generator").val();
	var data = {
			 "docId": docId,
			 "draftId" : draftId,
			 "fieldHtml" : "",
			 "stepNumber":stepNumber,
			 "increment":1,
			 "signType":"S"
	}
	$.ajax({
		type : "POST",
		url : contextPath+"app/step2SelfSign",
		dataType: 'json',
	    contentType: "application/json; charset=utf-8",
	    data: JSON.stringify(data),
	    beforeSend: function (xhr) {
   			xhr.setRequestHeader(header, token);
	    },
	    complete: function () {
	    },
        success : function(response) {
        	
        	//alert(response);
        	/* if(response == '103'){
        		$("#show-selfsign-steps").show();
        		$("#skippopup").hide();
        		$("#show-selfsign-error").show();
        		$('.overlaywhite_bg').show();
        		$("#error-messgae").empty();
        		$("#error-messgae").append('<spring:message code="label.sgn_prvs"/>');
        	}else */ if(response == "invalid"){
        		$("#show-selfsign-steps").show();
        		$("#skippopup").hide();
        		$("#show-selfsign-error").show();
        		$('.overlaywhite_bg').show();
        		$("#error-messgae").empty();
        		$("#error-messgae").append('<spring:message code="label.invalid"/>');
			}else{
	         	if(response != 'failed'){
	        			//alert("success");
	        			
	        			$("#stepNumber").val(3);
	            }else{
	            	alert('Failed');
	            }
        	}
		},
		 error : function(e) {  
		    alert('Error: ' + e);   
		}  
	 });
}

//changes
function saveSelfsign2(type){
	var checkError = true; 
	if( type == "send"){
		checkError= $("#step3-form").valid();
		updateDiv();
	}
if(checkError != false){
		
		$('#skippopup').hide();
		$('.overlaywhite_bg').hide();
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
		var generatorLength=$("#generator").val();
		var docId='<c:out value="${docId}"></c:out>';
		var draftId=$("#draftId").val();
		var to=$("#recipients").val();
		var cc=$("#cc").val();
		var subject=$("#subject").val();
		//var message=$("#message").val();
		var message=editorText;
		var stepNumber = $("#stepNumber").val();
		
		var btn;
		if(type =='skipandsend'){
			btn='#skipandsend';
		}else{
			btn='#send';
		}
		
		var data ={
			"docId" :docId,
			"type":type,
			"to": to,
			"cc": cc,
			"subject": subject,
			"message": message
		}
	
		$.ajax({
			type : "POST",
			url : contextPath+"app/saveSelfsignEmudhra",
			dataType: 'json',
		    contentType: "application/json; charset=utf-8",
		    data: JSON.stringify(data),
		    beforeSend: function (xhr) {
		    	//$(btn).buttonLoader('start');
		    	$("#loader2").show();
	   			xhr.setRequestHeader(header, token);
	   	    },
		    complete: function () {
		    	//$(btn).buttonLoader('stop');
		    	$("#loader2").hide();
		    },
	        success : function(response) {
	        	/* if(response == '103'){
	        		$("#show-selfsign-steps").show();
	        		$("#skippopup").hide();
	        		$("#show-selfsign-error").show();
	        		$('.overlaywhite_bg').show();
	        		$("#error-messgae").empty();
	        		$("#error-messgae").append('The document has signed previously.');
	        	}else */ 
	        	  if(response == "invalid"){
	        		$("#show-selfsign-steps").show();
	        		$("#skippopup").hide();
	        		$("#show-selfsign-error").show();
	        		$('.overlaywhite_bg').show();
	        		$("#error-messgae").empty();
	        		$("#error-messgae").append('<spring:message code="label.invalid"/>');
				}else{
	         	if(response != 'failed'){
	        			//alert("success");
	        			$("#show-selfsign-steps").show();
	        			$("#skippopup").hide();
	        			$("#show-selfsign-success").show();
	        			$('.overlaywhite_bg').show();
	        			if(type == 'send'){
	        				$("#success-messgae").html('<spring:message code="label.msg_succ"/>');
	        				$("#success-messgae-email").html('<spring:message code="label.sentsuccess"/> '+to+' <spring:message code="label.sentsuccess_c"/>');
	        					
	        				//$("#success-messgae-email").html('Message sent successfully to the sanket.navle@banctec.in email address.');
	        			}
	        			$("#stepNumber").val(3);
	            }else{
	            	alert('Failed');
	            }
	          }
			},
			 error : function(e) {  
			    alert('Error: ' + e);   
			}  
		 });
		
	}
}
//changes End

function saveSelfsign(type){
	
	var checkError = true; 
	if( type == "send"){
		checkError= $("#step3-form").valid();
		updateDiv();
	}
	if(checkError != false){
		
		$('#skippopup').hide();
		$('.overlaywhite_bg').hide();
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
		var generatorLength=$("#generator").val();
		var docId=$("#docId").val();
		var draftId=$("#draftId").val();
		var stepNumber=$("#stepNumber").val();
		var fileName=$(".file-upload-input").val();
		var to=$("#recipients").val();
		var cc=$("#cc").val();
		var subject=$("#subject").val();
		//var message=$("#message").val();
		var message=editorText;
		var pageHeight=$("#pageHeight").val();
		var numpages=$("#numpages").val();
		var jsonArray = [];
		for(var i=0; i<generatorLength; i++) { //counter value reduced bcause self sign is not working on draft
			var item = {};
			var sitem = {};
		  	var fieldType=$("#field"+i).attr("type");
			if(fieldType !=null && fieldType !=undefined){
				if(fieldType=="text"){
					item ['type'] = type;
					item ['stepNumber'] = stepNumber;
					item ['docId'] = docId;
					item ['draftId'] = draftId;
					item ['documentName'] = fileName;
					item ['top'] =$("#field"+i).attr("data-top");
					item ['left'] = $("#field"+i).attr("data-left");
					item ['fieldType'] = $("#field"+i).attr("type");
					item ['fieldName'] = $("#field"+i).attr("name");
					item ['pageHeight']= pageHeight;
					item ['numpages']= numpages;
					if($("#input-drop-fild"+i).parent('.dragMe').width() == "0"){
						item ['fieldWidth']= "170";
						item ['fieldHeight']= "60";
					}else{
						item ['fieldWidth']= $("#input-drop-fild"+i).parent('.dragMe').width(); //"100";
						item ['fieldHeight']= $("#input-drop-fild"+i).parent('.dragMe').height();//"30";
					}
					if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').width()) < 130)){
						item ['fieldWidth']= 130; 
					}
					if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').height()) < 40)){
						item ['fieldHeight']= 40;
					}
					if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').width()) > 325)){
						item ['fieldWidth']= 325; 
					}
					if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').height()) > 120)){
						item ['fieldHeight']= 120;
					}
					item ['fieldValue'] = $('#field'+i).val();
					item ['fontSize'] = $("#field"+i).css("font-size");
					item ['pageNumber']= $("#field"+i).attr("data-pagenumber");
					item ['userId'] = 1;
					item ['to'] = to;  
					item ['cc'] = cc;  
					item ['subject'] = subject;  
					item ['message'] = message;  
				}else if(fieldType=="image"){
					
					if($("#field"+i).attr("name") == "signature"){ // signature without stamp
						item ['fieldName'] = $("#field"+i).attr("name");
						item ['type'] = type;
						item ['stepNumber'] = stepNumber;
						item ['docId'] =docId
						item ['draftId'] = draftId;
						item ['documentName'] = fileName;
						var sign = document.getElementById('field'+i);
						var signature = sign.getAttribute('src');
						item ['top'] =$("#field"+i).attr("data-top");
						item ['left'] = $("#field"+i).attr("data-left");
						item ['pageHeight']= pageHeight;
						item ['numpages']= numpages;
						item ['fieldType'] = "image";
						item ['fieldValue'] = signature;
						item ['fontSize'] = $("#field"+i).css("font-size");
						if($("#mySpanImg"+i).attr("data-stamp") == "data-digitalStamp"){
							if($("#fieldPosition"+i).width() == "0"){
								item ['fieldWidth']= "170";
								item ['fieldHeight']= "80";
							}else{
								item ['fieldWidth']= parseFloat($("#input-drop-fild"+i).parent('.dragMe').width())/2;
								item ['fieldHeight']= $("#input-drop-fild"+i).parent('.dragMe').height();
							}
						}else{
							if($("#fieldPosition"+i).width() == "0"){
								item ['fieldWidth']= "170";
								item ['fieldHeight']= "60";
							}else{
								item ['fieldWidth']= $("#input-drop-fild"+i).parent('.dragMe').width();
								item ['fieldHeight']= $("#input-drop-fild"+i).parent('.dragMe').height();
							}
						}
						
						if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').width()) < 130) && $("#mySpanImg"+i).attr("data-stamp") != "data-digitalStamp"){
							item ['fieldWidth']= 130;
						}else if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').width()) < 325) && $("#mySpanImg"+i).attr("data-stamp") == "data-digitalStamp"){
							item ['fieldWidth']= 162.5;
						}
						if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').height()) < 40) && $("#mySpanImg"+i).attr("data-stamp") != "data-digitalStamp"){
							item ['fieldHeight']= 40; 
						}else if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').height()) < 60) && $("#mySpanImg"+i).attr("data-stamp") == "data-digitalStamp"){			
							item ['fieldHeight']= 60; 
						}
						
						if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').width()) > 325) && $("#mySpanImg"+i).attr("data-stamp") != "data-digitalStamp"){
							item ['fieldWidth']= 325;
						}else if((parseFloat($("#input-drop-fild"+i).parent('.dragMe ').width()) > 500) && $("#mySpanImg"+i).attr("data-stamp") == "data-digitalStamp"){
							item ['fieldWidth']= 250;
						}
						if((parseFloat($("#input-drop-fild"+i).parent('.dragMe ').height()) > 120) && $("#mySpanImg"+i).attr("data-stamp") != "data-digitalStamp"){
							item ['fieldHeight']= 120; 
						}else if((parseFloat($("#input-drop-fild"+i).parent('.dragMe ').height()) > 90) && $("#mySpanImg"+i).attr("data-stamp") == "data-digitalStamp"){			
							item ['fieldHeight']= 90; 
						}
						
						item ['pageNumber']= $("#field"+i).attr("data-pagenumber");
						item ['userId'] = 1;  
						item ['to'] = to;  
						item ['cc'] = cc;  
						item ['subject'] = subject;  
						item ['message'] = message;
					}else{ // signature with stamp
						//for signature section
						item ['fieldName'] = $("#field"+i).attr("name");
						item ['type'] = type;
						item ['stepNumber'] = stepNumber;
						item ['docId'] =docId
						item ['draftId'] = draftId;
						item ['documentName'] = fileName;
						var sign = document.getElementById('field'+i);
						var signature = sign.getAttribute('src');
						item ['top'] =$("#field"+i).attr("data-top");
						item ['left'] = $("#field"+i).attr("data-left");
						item ['pageHeight']= pageHeight;
						item ['numpages']= numpages;
						item ['fieldType'] = "image";
						item ['fieldValue'] = signature;
						item ['fontSize'] = $("#field"+i).css("font-size");
						if($("#mySpanImg"+i).attr("data-stamp") == "data-digitalStamp"){
							if($("#fieldPosition"+i).width() == "0"){
								item ['fieldWidth']= "170";
								item ['fieldHeight']= "80";
							}else{
								item ['fieldWidth']= parseFloat($("#input-drop-fild"+i).parent('.dragMe').width())/2;
								item ['fieldHeight']= $("#input-drop-fild"+i).parent('.dragMe').height();
							}
						}else{
							if($("#fieldPosition"+i).width() == "0"){
								item ['fieldWidth']= "170";
								item ['fieldHeight']= "60";
							}else{
								item ['fieldWidth']= $("#input-drop-fild"+i).parent('.dragMe').width();
								item ['fieldHeight']= $("#input-drop-fild"+i).parent('.dragMe').height();
							}
						}
						
						if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').width()) < 130) && $("#mySpanImg"+i).attr("data-stamp") != "data-digitalStamp"){
							item ['fieldWidth']= 130;
						}else if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').width()) < 325) && $("#mySpanImg"+i).attr("data-stamp") == "data-digitalStamp"){
							item ['fieldWidth']= 162.5;
						}
						if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').height()) < 40) && $("#mySpanImg"+i).attr("data-stamp") != "data-digitalStamp"){
							item ['fieldHeight']= 40; 
						}else if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').height()) < 60) && $("#mySpanImg"+i).attr("data-stamp") == "data-digitalStamp"){			
							item ['fieldHeight']= 60; 
						}
						
						if((parseFloat($("#input-drop-fild"+i).parent('.dragMe ').width()) > 325) && $("#mySpanImg"+i).attr("data-stamp") != "data-digitalStamp"){
							item ['fieldWidth']= 325;
						}else if((parseFloat($("#input-drop-fild"+i).parent('.dragMe ').width()) > 500) && $("#mySpanImg"+i).attr("data-stamp") == "data-digitalStamp"){
							item ['fieldWidth']= 250;
						}
						if((parseFloat($("#input-drop-fild"+i).parent('.dragMe ').height()) > 120) && $("#mySpanImg"+i).attr("data-stamp") != "data-digitalStamp"){
							item ['fieldHeight']= 120; 
						}else if((parseFloat($("#input-drop-fild"+i).parent('.dragMe ').height()) > 90) && $("#mySpanImg"+i).attr("data-stamp") == "data-digitalStamp"){			
							item ['fieldHeight']= 90; 
						}
						item ['pageNumber']= $("#field"+i).attr("data-pagenumber");
						item ['userId'] = 1;  
						item ['to'] = to;  
						item ['cc'] = cc;  
						item ['subject'] = subject;  
						item ['message'] = message;
						
						var signleft=$("#field"+i).attr("data-left");
						var stampleft=$("#mySpanImg"+i).attr("data-left");
						var stampleftAns =parseFloat(signleft)+parseFloat(stampleft);
						//for stamp section
						sitem ['fieldName'] = $("#field"+i).attr("name");
						sitem ['type'] = type;
						sitem ['stepNumber'] = stepNumber;
						sitem ['docId'] =docId
						sitem ['draftId'] = draftId;
						sitem ['documentName'] = fileName;
						sitem ['top'] =$("#field"+i).attr("data-top");
						sitem ['left'] = stampleftAns;
						sitem ['pageHeight']= pageHeight;
						sitem ['numpages']= numpages;
						sitem ['fieldType'] = "image";
						sitem ['fieldValue'] = ""; // this value will go blank
						sitem['fontSize'] = $("#mySpanImg"+i).attr("data-fontSize");
						item ['fontSize'] = $("#field"+i).css("font-size");
						if($("#fieldPosition"+i).width() == "0"){
							sitem ['fieldWidth']= "140";
							sitem ['fieldHeight']= "60";
						}else{
							sitem ['fieldWidth']= $("#input-drop-fild"+i).parent('.dragMe').width()/2; 
							sitem ['fieldHeight']= $("#input-drop-fild"+i).parent('.dragMe').height();
						}
						
						if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').width()) < 325)){
							sitem ['fieldWidth']= 162.5; 
						}
						if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').height()) < 60)){
							sitem ['fieldHeight']= 60;
						}	
						
						if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').width()) > 500)){
							sitem ['fieldWidth']= 250; 
							}
						if((parseFloat($("#input-drop-fild"+i).parent('.dragMe').height()) > 90)){
							sitem ['fieldHeight']= 90;
						}
						
						sitem ['pageNumber']= $("#field"+i).attr("data-pagenumber");
						sitem ['userId'] = 1;  
						sitem ['to'] = to;  
						sitem ['cc'] = cc;  
						sitem ['subject'] = subject;  
						sitem ['message'] = message;
						jsonArray.push(sitem);
					}
					
					  
				}else if(fieldType=="checkbox"){
					item ['type'] = type;
					item ['stepNumber'] = stepNumber;
					item ['docId'] =docId
					item ['draftId'] = draftId;
					item ['documentName'] = fileName;
					var sign = document.getElementById('field'+i);
					var signature = sign.getAttribute('src');
					item ['top'] =$("#field"+i).attr("data-top");
					item ['left'] = $("#field"+i).attr("data-left");
					item ['fieldName'] = "signature"
					item ['pageHeight']= pageHeight;
					item ['numpages']= numpages;
					item ['fieldType'] = "checkbox";
					item ['fieldValue'] = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAQAAABpN6lAAAABNElEQVR4Ae3QsVHEQBAF0TGhCgWkDAQX2iVzJhCAksHDkrcYG8CfwoLe7klg3i8zMzMzMzMzMzMzMzMzM/uPvdTS3eqr9pX5V436rn1l/qBPkPn4CTIfP0Hm4yfIfPgEmT/vfW3+WZv8Xydfvnz58uXLly9fvnz58uXLly9fvnz58uXLl/9UjzpW5n/UqKuOlfkjT0Dn5wmQ/M/5UJ6AyH+e/DwBn58nQPFn9/lQmADJn2115gm4/P4EWH5/Aiy/M8Erm9+fAMvvT4Dl9yfA8vsTYPmdCd7Y/P4EWH5/Aiy/PwGW358Ay+9NgOZ3JoDz8wSZz58g8/kTZD5/gsznT5D5/Akynz0BnJ8moPPDBHR+mIDODxPQ+WECOj9MAOeHCQIf3/Y3+GZmZmZmZmZmZmZmZmY/MrUQ01ASaE0AAAAASUVORK5CYII=";
					item ['fieldWidth']= "100";
					item ['fieldHeight']= "36";
					item ['pageNumber']= $("#field"+i).attr("data-pagenumber");
					item ['userId'] = 1;  
					item ['to'] = to;  
					item ['cc'] = cc;  
					item ['subject'] = subject;
					item ['message'] = message; 
				}
				
				jsonArray.push(item);
				//console.log(item);
			}
		}
		var btn;
		if(type =='skipandsend'){
			btn='#skipandsend';
		}else{
			btn='#send';
		}
	
		$.ajax({
			type : "POST",
			url : contextPath+"app/saveSelfsign",
			dataType: 'json',
		    contentType: "application/json; charset=utf-8",
		    data: JSON.stringify(jsonArray),
		    beforeSend: function (xhr) {
		    	//$(btn).buttonLoader('start');
		    	$("#loader2").show();
	   			xhr.setRequestHeader(header, token);
	   	    },
		    complete: function () {
		    	//$(btn).buttonLoader('stop');
		    	$("#loader2").hide();
		    },
	        success : function(response) {
	        	/* if(response == '103'){
	        		$("#show-selfsign-steps").show();
	        		$("#skippopup").hide();
	        		$("#show-selfsign-error").show();
	        		$('.overlaywhite_bg').show();
	        		$("#error-messgae").empty();
	        		$("#error-messgae").append('The document has signed previously.');
	        	}else */ if(response == "invalid"){
	        		$("#show-selfsign-steps").show();
	        		$("#skippopup").hide();
	        		$("#show-selfsign-error").show();
	        		$('.overlaywhite_bg').show();
	        		$("#error-messgae").empty();
	        		$("#error-messgae").append('<spring:message code="label.invalid"/>');
				}else{
	         	if(response != 'failed'){
	        			//alert("success");
	        			$("#show-selfsign-steps").show();
	        			$("#skippopup").hide();
	        			$("#show-selfsign-success").show();
	        			$('.overlaywhite_bg').show();
	        			if(type == 'send'){
	        				$("#success-messgae").html('<spring:message code="label.msg_succ"/>');
	        				$("#success-messgae-email").html('<spring:message code="label.sentsuccess"/> '+to+' <spring:message code="label.sentsuccess_c"/>');
	        					
	        				//$("#success-messgae-email").html('Message sent successfully to the sanket.navle@banctec.in email address.');
	        			}else{
	        				$("#success-messgae").html('<spring:message code="label.doc_succ"/>');
	        			}
	        			$("#stepNumber").val(3);
	            }else{
	            	alert('Failed');
	            }
	          }
			},
			 error : function(e) {  
			    alert('Error: ' + e);   
			}  
		 });
	}
}
/* jQuery.validator.addMethod("multiemail", function (value, element) {
    if (this.optional(element)) {
        return true;
    } 
    alert(value);
    var emails = value.split(',');
    alert(emails+"-----"+emails.length)
        var reg = /^(([^<>(){}[\]\\.,;:\s@\"]+(\.[^<>(){}[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var valid = true;
        for (var i = 0, limit = emails.length; i < limit; i++) {
        	var val_str=emails[i];
        	alert(val_str);
       // value = emails[i];
        //valid = valid && jQuery.validator.methods.email.call(this, value, element);
        valid = valid && reg.test(val_str);
        //return this.optional(element) || reg.test(val_str);
        }
        alert(valid);
        
    return valid;
}, "<spring:message code="label.sep_comma"/>"); */
//}, "<spring:message code="label.sep_comma"/> <spring:message code="label.validEmail_msgrequired"/>");
jQuery.validator.addMethod("multiemail", function (value, element) {
     if (this.optional(element)) {
         return true;
     }
     var reg = /^(([^<>(){}[\]\\.,;:\s@\"]+(\.[^<>(){}[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
     var emails = value.split(','),
       valid = true;
     for (var i = 0, limit = emails.length; i < limit; i++) {
         value = emails[i];
         valid = valid && reg.test(value) && value.length <=70;
        // console.log("Hello"+ reg.test(value)); 
     }
     return valid;
  }, "<spring:message code="label.emailValidationText"/>");
//}, "<spring:message code="label.sep_comma"/> <spring:message code="label.validEmail_msgrequired"/>");
jQuery.validator.addMethod("checkempty", function(value) {
	return $.trim( value );
	}, "<spring:message code="label.emptyfld"/>"); 

 var step3Form=$("#step3-form").validate({
		//specify the validation rules
		errorElement: 'p',
    	errorClass: 'error',
		rules: {
			recipients: {
	     		required: true,
	     		//emailcheck:true,
	     	   multiemail:true,
	     		},
	     	cc:{
	     		//emailcheck:true,
	     		 multiemail:true,
	     	},	
	     	subject : {
				required : true,
				checkempty : true
			
			},
			//subject:"required",
			message:"required",
		},
		//specify validation error messages
		messages: {
			subject: "<spring:message code="label.slf_subval"/>",
			message: "<spring:message code="label.slf_msgval"/>",
			recipients:{
	    		 required: "<spring:message code="label.email_msgrequired"/>"
	    	 },
			cc:{
	    		 required: "<spring:message code="label.email_msgrequired"/>"
	    	}
		}
});

 
 
 function checkFields(){
	 var generatorLength=$("#generator").val();
	// alert('asdasd');
	 var array = [];
	 for(var i=0; i<generatorLength ; i++) {		
	// for(var i=1; i<=generatorLength ; i++) { // for loop value decreased because draft flow was not working for selfsign
		 var fieldType=$("#field"+i).attr("name");
		 if(fieldType !=null && fieldType != undefined){
			 var item = {};
			 	if (fieldType == "name" || fieldType == 'date' || fieldType == 'initials' || fieldType == 'text'){
				 item ['fieldType'] = fieldType;
				 item ['fieldValue'] = $('#field'+i).val();
			 	}
			 	if(fieldType =='signature'){
			 		var sign = document.getElementById('field'+i);
					var signature = sign.getAttribute('src');
			 		item ['fieldType'] = fieldType;
					item ['fieldValue'] = signature;
			 	}
			 	if(fieldType == 'checkbox'){
			 		item ['fieldType'] = fieldType;
					item ['fieldValue'] =  "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAQAAABpN6lAAAABNElEQVR4Ae3QsVHEQBAF0TGhCgWkDAQX2iVzJhCAksHDkrcYG8CfwoLe7klg3i8zMzMzMzMzMzMzMzMzM/uPvdTS3eqr9pX5V436rn1l/qBPkPn4CTIfP0Hm4yfIfPgEmT/vfW3+WZv8Xydfvnz58uXLly9fvnz58uXLly9fvnz58uXLl/9UjzpW5n/UqKuOlfkjT0Dn5wmQ/M/5UJ6AyH+e/DwBn58nQPFn9/lQmADJn2115gm4/P4EWH5/Aiy/M8Erm9+fAMvvT4Dl9yfA8vsTYPmdCd7Y/P4EWH5/Aiy/PwGW358Ay+9NgOZ3JoDz8wSZz58g8/kTZD5/gsznT5D5/Akynz0BnJ8moPPDBHR+mIDODxPQ+WECOj9MAOeHCQIf3/Y3+GZmZmZmZmZmZmZmZmY/MrUQ01ASaE0AAAAASUVORK5CYII=";
			 	}
			 	array.push(item);
		}
	 }
	 if(array.length == 0){
		  $("#jumpstep3").attr('disabled','disabled');
	 }else{
	 	 
		  var disabledFlag=false;
		 $.each(array, function( key, value ) {
			  
			 if( value.fieldValue == ''){
				 //alert("FIELD VALUE "+value.fieldValue)	  
				 disabledFlag=true;
				 $("#jumpstep3").attr('disabled','disabled');
			  }else if(disabledFlag==false){
				 // alert("EMPTY VALUE "+value.fieldValue)
				  $("#jumpstep3").removeAttr('disabled');
			  }
		});
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
 		    	      alert('Error: ' + e);   
 		    	     }  
 		    	 });  
 	    	 }
     
 	    }

 	    reader.readAsDataURL(input.files[0]);
 	  }
 }

 $("#imgInp").change(function() {
   readURL(this);
 });
 
 function clearUploadSignature(){
		$('#blah').attr('src', '');
	    $("#imgInp").val("");
	    $("#show_upload_signature").show();
	    $("#blah").hide();
			
	}
 
 /*Egnyte Pic download code */   
 
 function popitupEgnytePic(url) {
	 //alert(url);
    var w=500;
     var h=500;
 var left = (screen.width/2)-(w/2);
 var top = (screen.height/2)-(h/2);
 var title = "Egnyte";
 return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
     
          /* newwindow=window.open(url,'name','height=400,width=500');
          if (window.focus) {newwindow.focus()}
          return false; */
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
		     	$("#file_error").html('<spring:message code="label.slf_uplod"/>').fadeOut(10000);;
		         fileInput.value = '';
			 
		 }
     
     
  }   
  /* end Egnyte javascript code */  
 

</script>

<!-- Signature download from Google Drive -->
<script type="text/javascript" src="<%=appUrl %>/js/filepickerapi.js"></script>
<script>
       var file = null;
               function initPickerImg() {
            	 
            	   // alert("initPickerImg called");
                     var picker = new FilePicker({
                           
                    	 apiKey: 'AIzaSyBOIfItfyHfT9DM2vYIPN_XwuD8B2HhLyc',
                           clientId:'927346535684-gkrnjl6o6akimdjse81gp3lb1j79n957.apps.googleusercontent.com',
                           buttonEl: document.getElementById('googlePic'),
                           onSelect: function(file) {
                                  
                                  $("#filename").val(file.title);
                           //     $(".file-upload-input").val(file.title);
                                  $("#fileId").val(file.id);
                                  console.log(file);
                                  downloadImg();
                           //     document.getElementById("save").click();
                                  //alert('Selected File ' + file.title);
                                  //alert('Selected file Id ' + file.id);
                           }
                     });    
              } 
              
              function downloadImg() {
                     var fileId = $("#fileId").val();
                     var fileName = $("#filename").val();
                     var byteArray = [];
                     if (fileId) {
                           console.log("fileId: ::" + fileId);
                           var accessToken = gapi.auth.getToken().access_token;
                           callToajaxImg(fileId,'',fileName,accessToken);
                           
                           }
                
                           else {
                           alert('<spring:message code="label.unble_down"/>');
                           }
                       
                     }
              function callToajaxImg(fileId,contentType,fileName,accessToken) {
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
                             
                            
                         },
                         complete: function () {
                         // $("#jumpstep2").buttonLoader('stop');
                            console.log("aasdas");
							
                         },
                           
                         success:function(response){
                            //alert("Image success called");
                           // alert("response"+response)
                            /* $("#show_upload_signature").hide();
                            $("#show_upload_yoursignature").show();
                            $('#blah').attr('src', 'data:image/jpeg;base64,'+response);  
                            $("#clearId").show(); */
                          	
                            $("#show_upload_signature").hide();
						 $("#blah").show();
		    	    	 $('#blah').attr('src', 'data:image/jpeg;base64,'+response); 
                         },
                         error: function(err){
                            
                         }
                     })
              }
             $('#pick').on('click', function () {
          		$(this).blur()
          	})
          	$('#dropbox').on('click', function () {
          		$(this).blur()
          	})
          	$('#onedrive').on('click', function () {
          		$(this).blur()
          	})

       
       </script>
<script src="https://apis.google.com/js/client.js?onload=initPickerImg"></script>
</body>
</html>