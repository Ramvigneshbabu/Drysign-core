<%@page import="java.util.ResourceBundle"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.core.Authentication" %>
<%@ page language="java" import="java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<% 
ResourceBundle resource = ResourceBundle.getBundle("commonsutils");
String hostURL =resource.getString("server.oneDriveurl");
String hostURLIn =resource.getString("server.oneDriveurlInd");
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
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> -->
<link href="<%=appUrl %>/css/buttonLoader.css" rel="stylesheet" type="text/css">


<link href="<%=appUrl %>/css/materialize.css" rel="stylesheet"/>
<%-- <link rel="stylesheet" href="<%=appUrl %>/css/style.css"> --%>
<%-- <link rel="stylesheet" href="<%=appUrl %>/css/inner_page.css"/> --%>
<%-- <link rel="stylesheet" href="<%=appUrl %>/css/site-demos.css"> --%>

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
	<ol class="breadcrumb col-md-6 col-sm-6 col-xs-12">
	<li class="Groupsignhead"><spring:message code="label.template"/> |</li>
		<li><a href="<%=appUrl %>/app/dashboard"><spring:message code="label.dash"/></a></li>
		<li class="active"><spring:message code="label.template"/></li>
		
	</ol>
	<ul class="list-inline col-md-6 col-sm-6 col-xs-12 nopadding rightPos">
                      <li id = "isStepOne">
                        <button type="button" id="jumpstep2" class="btn btn-primary next-step " disabled><spring:message code="label.svnxt"/> </button>
                      </li>
                                      
                    	  <li id = "isStepTwo" style = "display:none">
                    	  

                    	   <div class="tooltip1 tooltip-w" style="display: none;">
                    	   <button class="btn btn-light" id="qa" value="1" onclick="qualityImprove(this.value);"><spring:message code="label.enhance"/>
                       	</button>
                       	<span class="tool-tip tooltiptext tooltip-top tooltip_css_tmplt"><spring:message code="label.improve_readability"/></span> 
                       	</div>
                    	   <!--   <button class="btn btn-light" id="qa" value="1" onclick="qualityImprove(this.value);" data-toggle="tooltip" title="Improve readability of focused page"><spring:message code="label.enhance"/></button>-->
                    	    
                    	     <div class="tooltip1 tooltip-w">
                        	<button type="button" id="step3-button" onclick="jumpstep2(3)" class="btn btn-primary next-step test-btn" disabled><spring:message code="label.svnxt"/>
                        	 </button>
                        	 <span class="tool-tip tooltiptext tooltip-top tooltip_css_snd"><spring:message code="label.enhancepara"/></span> 
                        	</div> 
                        	<!--  <button type="button" id="step3-button" onclick="jumpstep2(3)" class="btn btn-primary next-step" disabled>Save And Next</button>-->
                      	  </li>
                      	                      
                      <li id = "isStepThree" style = "display:none">
                        <%--  <button type="button" class="btn btn-light" id="preview" value="Prepare Document"><spring:message code="label.previ"/></button> --%>
                         <button id="send" type="button" onclick="saveGroupSign();" class="btn btn-primary"><spring:message code="label.save"/></button>
                      </li>
                    
                     
                    </ul>
	  </div>
        <!-- breadcrumb -->
        
        <!-- Main content -->
        
       <div class="container-fluid">   
       <div id="show-groupsign-steps">
    <div class="wizard signature drysign-wizard">
      <!--vvv16july2020 <div class="wizard-inner group-sign" > -->
      <div class="wizard-inner  group-sign">
        
        <%-- <ul class="nav nav-tabs" role="tablist">
			<li role="presentation" id="steplist1" class="disabled"> <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" > <img class="groupsignsvg backgroundstep" src="<%=appUrl %>/images/step1_groupsign_new.svg" alt="submit" /></a> </li>
      vvv16july2020       <li role="presentation" id="steplist2" class="disabled"> <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" > <img class="groupsignsvg1 backgroundstep" src="<%=appUrl %>/images/step2_groupsign_new.svg" alt="submit" /></a> </li>
             <li role="presentation" id="steplist3" class="disabled"> <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" > <img class="groupsignsvg3 backgroundstep" src="<%=appUrl %>/images/step3_groupsign_new.svg" alt="submit" /> </a> </li>
            <li role="presentation" id="steplist3" class="disabled"> <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" > <img class="tempsignsvg3 backgroundstep" src="<%=appUrl %>/images/step3_groupsign_new.svg" alt="submit" /> </a> </li>
            <li role="presentation" id="steplist4" class="disabled"> <a href="#step4" data-toggle="tab" aria-controls="step4" role="tab" > <img class="groupsignsvg2 backgroundstep" src="<%=appUrl %>/images/step4_groupsign_new.svg" alt="submit" />  </a> </li>
        </ul> --%>
        <ul class="nav nav-tabs" role="tablist">
			<li role="presentation" id="steplist1" class="disabled iconSize"> 
				<a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" >
					<span class="wizardStatusIcon active"></span>
					<span class="texticon">Upload</span>
					<span class="wizardArrowIcon active"></span>
				</a> 
			</li>
            
            <li role="presentation" id="steplist3" class="disabled iconSize"> 
            <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" >
            <span class="wizardStatusIcon"></span>
            <span class="texticon">Prepare</span>
            <span class="wizardArrowIcon"></span>            
            </a> 
            </li>   
            <li role="presentation" id="steplist4" class="disabled iconSize"> 
            <a href="#step4" data-toggle="tab" aria-controls="step4" role="tab" >
            <span class="wizardStatusIcon"></span>
            <span class="texticon">Recipients</span>            
            </a> 
            </li>
        </ul>


      </div>
      <div class="tab-content accordion"> 
        <!-- Personal Information -->
        <div class="tab-pane" role="tabpanel" id="step1">
          <div class="step1">
            <section>
              <div class="row_center">
                <div class="col-md-6 col-sm-8 col-xs-12 col-centered">
                  <div>
                                     
                    <div id = "dropzone" class="row uploadFileSelfSignGroupSign">                    
                      <div class="col-xs-12">   
<!--                       <button type="submit" id="pick"style="border: 0; background: transparent"> -->
<%-- 							<img src="<%=appUrl %>/images/photo.jpg" width="70" height="70" alt="submit" /> --%>
<!-- 							</button>                     -->
                        <div class="upload-fild col-lg-6 col-md-6 col-sm-6 col-xs-6">                      
                        
                          <div class="custom-file-upload">
                          <div class="icon fileUploadIcon">
     						<i class="fa fa-cloud-upload" id="cloudUpload_sign" aria-hidden="true"></i>
     						<input id="fileupload" type="file" style="border:none!important"name="files" accept=".pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx,.txt,.rtf,.jpg,.jpeg,.gif,.bmp,.png,.htm,.html,.tiff">
     					</div>
     					
   						<span><spring:message code="label.drg_drp_brw"/> </span>
   						 </div>
   						 </div>
   						 <div class="col-md-6 col-xs-6 nopadding">
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
								<button data-placement="top" type="submit" class="tooltip1" id="onedrive" onclick="launchOneDrivePicker()" style="border: 0;background: transparent;">
								<span class="tooltiptext tooltip-bottom"><spring:message code="label.od"/></span>	
								<img src="<%=appUrl %>/images/Cloud.svg" width="30" height="30" alt="submit" />
								</button>
								</c:if>
							 </c:forTokens><br/>
						<span class="uploadFromIcon"><spring:message code="label.or_upload"/> </span>
						</div>	
						 
                      </div>
                    </div>
                    
                    
                  </div>
                   <div class="uploadSuccessHeading row">
                  <h3><spring:message code="label.document"/></h3>
                  <div><span id="uploadSuccess"></span>
                  <span id="remove-icon"></span></div>
                 <!--  <span id="fileSizeandDate"></span>  -->
                  <span><spring:message code="label.file_size"/> <span id="fileSize"></span> &nbsp;&nbsp; <spring:message code="label.date_dash"/> <span id="uploadDate"></span></span>
                  <hr/>
                  <span id="show_upload_error" class="error"></span>
                
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
          
          <!-- button --> 
          
              <div>

	<input  type="text" id="filename" type="text" style="display: none;" >
	<input  type="button" id="save" value="save" onclick="download()" style="display: none;"><!-- </button> -->
	<input type="hidden" id="fileId">
	<input type="hidden" id="isCountryCode" value="${countryCode}"/>

</div>
          
      <!-- </div> --> <!-- -vvv16july2020 -->
        
        <!-- Profestional Information -->
        <!-- vvv16july2020 STEP2 IS ADDED IN STEP1 AND KEPT DISPLAY:NONE SINCE IT HAS NO PURPOSE OTHER THAN SETTING NAME AS SIGNATORY. THUS SKIPPING STEP2 AND DIRECTLY GOING TO STEP 3 AFTER STEP1. NOT CHANGING ANYTHING ELSE SINCE A LOT OF METHODS GETTING CALLED -->
        <div class="tab-pane" role="tabpanel" id="step2" style="display:none">
          <div class="step2">
            <section>
              <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="signature">
                    <div class="row row_1">
                      <div class="col-md-12 col-sm-12 col-xs-12">
                        <h3 class="head3_1"><spring:message code="label.stp2"/></h3>
                      </div>
                    </div>
                    
                    
                    
					<!--   <div class="Group-Sign-addremove">
						  <div class="row th">
						  	<div class="col-md-1 col-xs-1 col-sm-1 th">
							  </div>
							  <div class="col-md-4 col-xs-12 col-sm-4 th">
							  	Signee Name
							  </div>
							   <div class="col-md-4 col-xs-12 col-sm-4 th">
							   	Email Address
							   </div>
							    <div class="col-md-3 col-xs-12 col-sm-3 th">
							    	
							    </div>
						  </div>
                   <div class="row marg ">
						  	<div class="col-md-1 col-xs-1 col-sm-1 ">
						  	1
							  </div>
							  <div class="col-md-4 col-xs-12 col-sm-4 ">
							  	GurcharanJeet Singh (ME)
							  </div>
							   <div class="col-md-4 col-xs-12 col-sm-4 ">
							   	gurcharanjeet.singh@banctec.in
							   </div>
							    <div class="col-md-3 col-xs-12 col-sm-3 ">
									<button type="submit" class="btn btn-red" value="Remove">Remove</button>
							    </div>
						  </div>
                   <div class="row marg ">
						  	<div class="col-md-1 col-xs-1 col-sm-1 ">
						  	2
							  </div>
							  <div class="col-md-4 col-xs-12 col-sm-4 ">
							  	GurcharanJeet Singh (ME)
							  </div>
							   <div class="col-md-4 col-xs-12 col-sm-4 ">
							   	gurcharanjeet.singh@banctec.in
							   </div>
							    <div class="col-md-3 col-xs-12 col-sm-3 ">
									<button type="submit" class="btn btn-red" value="Remove">Remove</button>
							    </div>
						  </div>
                   <div class="row marg ">
						  	<div class="col-md-1 col-xs-1 col-sm-1 ">
						  	3
							  </div>
							  <div class="col-md-4 col-xs-12 col-sm-4 ">
							  	GurcharanJeet Singh (ME)
							  </div>
							   <div class="col-md-4 col-xs-12 col-sm-4 ">
							   	gurcharanjeet.singh@banctec.in
							   </div>
							    <div class="col-md-3 col-xs-12 col-sm-3 ">
									<button type="submit" class="btn btn-red" value="Remove">Remove</button>
							    </div>
						  </div>
                    </div>
					  
					  <div class="text-left margTB15">
					  <a class="" href="#">Add More</a>
					  </div> -->
					  
			
	            <table class="table Group-Sign-addremove table-striped" id="diagnosis_list" style="display: none;">
	                <thead>
	                    <tr class="th" ><th class="priority_header"><spring:message code="label.grp_prio"/></th><th><spring:message code="label.dft_sgn_type"/> </th><th></th></tr>
	                </thead>
	                <tbody>
						<tr id='addr0'>
						  <td class='priority' id="priority0">1</td>
						  <td >
							<input type="text" name='signername' value="Signatory" id="signername0" placeholder='<spring:message code="label.sgntory"/> ' class="test" onchange="validateSigners();" disabled/>
							
						  </td>
						 <!--  <td><a class='btn btn-red'>Remove</a></td> -->
						</tr>
						<tr id='addr1'></tr>
						
	                </tbody>
	            </table>
			
			<!--  <div class="text-left margTB15">
			 	<a class="" id="add_row" href="#">Add More</a> &nbsp 	 <a class="" id="add_row" href="#">Add CC</a>
			 </div> -->
			 <div class="row">
                  <div class="col-xs-3">
                   <!--   <div class="checkbox checkbox-primary">
                        <input type="checkbox" onclick="enable_disable_proirity();" class="mycheckbox" id="checkbox2"  >
                        <label for="checkbox2"> Assign signer order </label>
                     </div> -->
                  </div>
                  <div class="col-xs-9"></div>
               </div>
				<input type="hidden" id="add-row" value="1"/>
				<input type="hidden" id="total-row" value="1"/>
                   <hr/>
                    <ul class="list-inline text-right">                     
                      <li>
                     
                        <button id="save_next_2" type="button" class="btn btn-primary next-step " ><spring:message code="label.svnxt"/></button>
                        <button id="testload" type="button" class="btn btn-primary" style="display: none"><i class="fa fa-refresh fa-spin"></i><spring:message code="label.lding"/></button>
					</li>
                    </ul>
                  </div>
				  </div>
                <!-- Buttons --> 
              </div>
            </section>
          </div>
        </div>

        </div>   <!-- vvv16july2020 add step2 in step1 and keep display none --> 
        
         <!-- Profestional Information -->
        <div class="tab-pane" role="tabpanel" id="step3">
          <div class="step3">
            <section>
              <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="self-slide">  
                	 <div class="pollSlider">
                	 <div id="pollSlider-button"><span class="fa fa-angle-double-left"></span></div>                 		
               			 <div class="header-text">
               			 	<div class="menuIcon fields"></div><span><spring:message code="label.fields"/></span>
					 		<%-- <i id="i-drag-drop"><spring:message code="label.srg_drp"/></i> --%>
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
				<%-- <div id="pollSlider-button"><span class="icon-arrow_left"></span>
				<div class="rotedtext"><spring:message code="label.addfields"/></div>
				</div> --%>
                </div>
                  <div class="signature">
                   
                     <div class="pdf_view">
					  	<div class="force-overflow">
						  	 <div class="pdf-inner mCustomScrollbar" >
						 	 		<div id="loader1" class="loader"></div>
					  			 <div class='document-reader' id="document-reader">
		                          	<div id='draggable-signature' class="fixed">
		                          	
		                      			
		                            
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
	                      </div>
	                      </div>
						   <%-- <div class="pdf-inner mCustomScrollbar">
						  	  <img src="<%=appUrl %>/images/PDF_view.jpg"/>
								 <div class="drop-select">
									<a class="btn btn-default btn-select">
                						<input type="hidden" class="btn-select-input" id="" name="" value="" />
                						<span class="btn-select-value">Select an Item</span>
                					<span class="btn-select-arrow fa fa-angle-down"></span>
                						<ul>
						                    <li>Option 1</li>
						                    <li class="selected">Option 2</li>
						                    <li>Option 3</li>
						                    <li>Option 4</li>
						                </ul>
            						</a>
								</div>
					    		<button type="button" class="btn btn-light-Bermuda signature-tab"><span class="icon-menu pull-left"></span>SIGNATURE<span class="icon-menu pull-right"></span></button>
					  		 </div> --%>
						  </div>
					  </div>
                 	   <%-- <ul class="list-inline text-right">                     
                    	  <li>
                    	  
                    	   <div class="tooltip1 tooltip-w">
                    	   <button class="btn btn-light" id="qa" value="1" onclick="qualityImprove(this.value);"><spring:message code="label.enhance"/>
                       	<span class="tool-tip tooltiptext tooltip-top tooltip_css" style="top:-56px;"><spring:message code="label.improve_readability"/></span>
                       	</button>
                       	</div>
                    	   <!--   <button class="btn btn-light" id="qa" value="1" onclick="qualityImprove(this.value);" data-toggle="tooltip" title="Improve readability of focused page"><spring:message code="label.enhance"/></button>-->
                    	    
                    	     <div class="tooltip1 tooltip-w">
                        	<button type="button" id="step3-button" onclick="jumpstep2(3)" class="btn btn-primary next-step test-btn" disabled><spring:message code="label.svnxt"/> <span class="tool-tip tooltiptext tooltip-top tooltip_css"><spring:message code="label.enhancepara"/></span></button>
                        	</div> 
                        	<!--  <button type="button" id="step3-button" onclick="jumpstep2(3)" class="btn btn-primary next-step" disabled>Save And Next</button>-->
                      	  </li>
                      </ul> --%>
                  </div>
                  <%-- <div class="self-slide">  
                	 <div class="pollSlider">
                 		<div class="main-content">
                 			 <div class="header-text text-center">
						 		<i><spring:message code="label.srg_drp"/></i>
					 		</div>
							 <div class="text-center margTB20">
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
                            
                            <!--  <div id="signer-5" class="btn btn-light-blue margB20 dragMe dragSigners" data-signer-id="5" data-document-id="1">
                              <span class="icon-menu pull-left"></span>CHECKBOX<span class="icon-menu pull-right"></span>
                            </div> -->
                            
                            <div id="signer-6" class="btn btn-light-brown margB20 dragMe dragSigners" data-signer-id="6" data-document-id="1">
                              <span class="icon-menu pull-left"></span><spring:message code="label.slf_initial"/><span class="icon-menu pull-right"></span>
                            </div>
						 </div>
					 </div>
                 </div>
				<div id="pollSlider-button"><span class="icon-arrow_left"></span>
				<div class="rotedtext"><spring:message code="label.addfields"/></div>
				</div>
                </div> --%>
				  </div>
                <!-- Buttons --> 
                
              </div>
            </section>
          </div>
        </div>
        
        
        
         <div class="tab-pane" role="tabpanel" id="step4">
          <div class="step4">
            <section>
            <form id="step3-form">
              <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div>
                   
                    <div class="row ">
                    <div class="col-md-4 col-sm-4 col-xs-12 form-group disabled">
							<label><spring:message code="label.slffrm_add"/><span class="redstar">*</span></label> <input type="text" id="from"
								value="<c:out value="<%=registration.getEmail()%>"></c:out>" readonly class="form-control validate">
						</div>
						<div class="col-md-4 col-sm-4 col-xs-12 form-group disabled tooltip1">
							<label><spring:message code="label.cc_email"/></label> <input type="text" id="cc"
								name="cc" class="form-control validate">
								 <span class="tool-tip tooltiptext tooltip-down tooltip_css" id="ttip" autocomplete="off"></span>
						</div>
						 <div class="col-md-4 col-sm-4 col-xs-12 form-group disabled">
							<label><spring:message code="label.slf_sub"/><span class="redstar">*</span></label> <input type="text" id="subject"
								name="subject" maxlength = 255 class="form-control validate" autocomplete="off">
						</div>
					  </div> 
                    <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12 form-group disabled">
							<label><spring:message code="label.slf_msg"/><span class="redstar">*</span></label> 
							 <textarea id="message" name="message" class="materialize-textarea"></textarea>
						</div>
						<%--   <div class="col-md-8 col-sm-8 col-xs-12">						  	
						  	<div class="input-field">
							 <textarea id="message" name="message" class="materialize-textarea"></textarea>
          						<label for="textarea1"><spring:message code="label.slf_msg"/><span class="redstar">*</span></label>
							</div>
						  </div> --%>
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
    </div>
    </div>
    
 
   
	  </div>
 <!-- /.content --> 
  </div>
<jsp:include page="footer.jsp"></jsp:include>
<input type="hidden" id="docId" value=""/>
<input type="hidden" id="draftId" value=""/>
<input type="hidden" id="stepNumber" value=""/>
<input type="hidden" id="isstep3" value=""/>
<input type="hidden" id="isRemoveIconVisible" value="0"/>
 <!--  Signatucher Tab -->
<input type="hidden" id="drawsignature_no" value=""/>
 <div class="signature-sign">
	 <div class="header">	 	
		 <a class="close" href="#"><span class="icon-close"></span></a>
	 </div>
	 
	
		<ul class="nav nav-tabs self-sign">
			<li class="active">
       		 <a  href="#type" data-toggle="tab"><spring:message code="label.type"/></a>
			</li>
			<li><a href="#draw" data-toggle="tab"><spring:message code="label.drw"/></a>
			</li>
			<li><a href="#saved" data-toggle="tab"><spring:message code="label.saved"/></a>
			</li>
		</ul>

			<div class="tab-content self_sing_tab ">
			  <div class="tab-pane active" id="type">
				  <div class="row">
						<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="input-field">
     	<input id="" type="text" class="validate">
							<label for="last_name"><spring:message code="label.ur_name"/></label>
							</div>
							
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="input-field">
							 <input id="" type="text" class="validate">
          <label for="file_name"><spring:message code="label.file_name"/></label>
							</div>
						</div>
						
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="input-field">							
								<select>
								  <option value="" disabled selected><spring:message code="label.signericaMediumRegular"/></option>
								  <option value="1"><spring:message code="label.signericaMediumRegular"/></option>
								  <option value="2"><spring:message code="label.signericaMediumRegular"/></option>
								  <option value="3"><spring:message code="label.signericaMediumRegular"/></option>
								</select>
								<label><spring:message code="label.fontType"/></label>
							</div>
						</div>
				  </div>
				  
				  <div class="row">
					  <div class="col-xs-12 text-right">
						  <a class="text-red" href="#"><spring:message code="label.reset"/></a>
						   <a class="text-green" href="#"><spring:message code="label.save"/></a>
					  </div>
				  </div>
				  
				  <div class="row margTB20">
					  <div class="col-xs-12">
					  	<div class="pdf_view">
					  <br>
				    <br>
				    <br>
				    <br><br>
				    <br><br>
				    <br><br> 
					
					  </div>
					  </div>
				  </div>
				</div>
				<div class="tab-pane" id="draw">
          
         
				  <div class="row margTB20 tab-pen-eraser">
					  <div class="colmd-12">
						  <button type="submit" class="btn btn-blank-defulte active_btn"  style="min-width: 110px;" value=""><spring:message code="label.pen"/></button>
						   <button type="submit" class="btn btn-blank-defulte"  style="min-width: 110px;" value=""><spring:message code="label.eraser"/></button>
					  </div>
				  	
				  </div>
				  <div class="row margB20">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select>
								  <option value="" disabled selected><spring:message code="label.round1"/></option>
								  <option value="1"><spring:message code="label.round"/></option>
								</select>
								<label><spring:message code="label.shabe"/></label>
					
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select>
								  <option value="" disabled selected><spring:message code="label.2"/></option>
								  <option value="1"><spring:message code="label.3"/></option>
								  <option value="2"><spring:message code="label.4"/></option>
								  <option value="3"><spring:message code="label.5"/></option>
								</select>
								<label><spring:message code="label.size"/></label>
						</div>
						
						<div class="col-md-6 col-sm-6 col-xs-12">
								<div class="input-field">
     				<input id="" type="text" class="validate">
							<label for="last_name"><spring:message code="label.fulname"/></label>
							</div>
						</div>
				  </div>
				  
				  <div class="row margB20">
					  <div class="col-xs-12 text-right">
						  <a class="text-red" href="#"><spring:message code="label.reset"/></a>
						   <a class="text-green" href="#"><spring:message code="label.save"/></a>
					  </div>
				  </div>
				  
				  <div class="row margTB20">
					  <div class="col-xs-12">
					  	<div class="pdf_view">
					  <br>
				    <br>
				    <br>
				    <br><br>
				    <br><br>
				    <br><br> 
					
					  </div>
					  </div>
				  </div>
			
          
          
				</div>
        <div class="tab-pane" id="saved">
			<div class="row margTB20">
				
				<div class="col-md-4">
					<div class="save-signature-box selected">
					<a href="#">
						<img src="<%=appUrl %>/images/signature.jpg" class="responsive-img"/>
						<div class="bottom-box">
								<span><spring:message code="label.officialSignature"/></span>
						</div>
						</a>
					</div>
					
				</div>
				<div class="col-md-4">
					<div class="save-signature-box">
					<a href="#">
						<img src="<%=appUrl %>/images/signature.jpg" class="responsive-img"/>
						<div class="bottom-box">
								<span><spring:message code="label.officialSignature"/></span>
						</div>
						</a>
					</div>
				</div>
				<div class="col-md-4">
					<div class="save-signature-box">
					<a href="#">
						<img src="<%=appUrl %>/images/signature.jpg" class="responsive-img"/>
						<div class="bottom-box">
								<span><spring:message code="label.officialSignature"/></span>
						</div>
						</a>
					</div>
				</div><div class="col-md-4">
					<div class="save-signature-box">
					<a href="#">
						<img src="<%=appUrl %>/images/signature.jpg" class="responsive-img"/>
						<div class="bottom-box">
								<span><spring:message code="label.officialSignature"/></span>
						</div>
						</a>
					</div>
				</div><div class="col-md-4">
					<div class="save-signature-box">
					<a href="#">
						<img src="<%=appUrl %>/images/signature.jpg" class="responsive-img"/>
						<div class="bottom-box">
							<span><spring:message code="label.officialSignature"/></span>
						</div>
						</a>
					</div>
				</div>
				
			</div>
				</div>
			</div>

 	
 	
 	
	
 	
 </div>
 <div class="modal fade in" id="success-group-messgae" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document" id="centeralignModel">
				<div class="modal-content">
					
					<div class="modal-body text-center">
						<img src="<%=appUrl %>/images/message-bg.png"/>		   	
	   <h4 class="message-text text-color-burmoda"><spring:message code="label.temp_succ"/></h4>
	   <p style="margin-top: 50px; font-size: 16px; width: 850px; max-width: 90%; margin: 0 auto"><spring:message code="label.temp_succ_msg"/> > <a href="<%=appUrl %>/app/templateview"> <spring:message code="label.temp_template"/></a>
		 
		</p>
		<a style="margin-top: 50px;" type="submit" value="GO to dashboard" href="<%=appUrl %>/app/dashboard" class="btn btn-primary font-24"><spring:message code="label.todash"/></a>
					</div>
					</div>
					</div>
					</div>
  	<%-- <div class="Content-wh-module text-center Message" id="success-group-messgae" style="display:none;width:700px;">
   	
   	<img src="<%=appUrl %>/images/message-bg.png"/>		   	
	   <h4 class="message-text text-color-burmoda"><spring:message code="label.temp_succ"/></h4>
	   <p style="margin-top: 50px; font-size: 16px; width: 850px; max-width: 90%; margin: 0 auto"><spring:message code="label.temp_succ_msg"/> > <a href="<%=appUrl %>/app/templateview"> <spring:message code="label.temp_template"/></a>
		 
		</p>
		<a style="margin-top: 50px;" type="submit" value="GO to dashboard" href="<%=appUrl %>/app/dashboard" class="btn btn-primary font-24"><spring:message code="label.todash"/></a>
   </div>  --%>  
  <div class="Message" id="skippopup">	
   	
	  <div>
	  	<a class="close" href="#"><span class="icon-close"></span></a>
	  </div>
		 <div class="header text-center margTB20 paddLR10">		 	
		 	<spring:message code="label.slf_skp_later"/>
		 </div>	
	  <div class="text-right">	  
						  <a class="text-red"  style="color: #252f3a" href="#"><spring:message code="label.decln"/></a>
						   <a class="text-green" onclick="saveSelfsign('skipandsend')" href="#"><spring:message code="label.acpt"/></a>					
	  </div> 	
 </div>
  <div class="modal" id="showfilenotuplad">	
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
	  	<!-- <a class="close" href="#"><span class="icon-close"></span></a> -->
	  	<h4 class="modal-title"><spring:message code="label.deleteUploadDocument"/></h4>
	  </div>
		<div class="modal-body">	 	
		 	<p><spring:message code="label.delte-confirm"/></p>
		 </div>	
	  <div class="text-right">	  
		<button type="button" class="btn btn-light" style="background: #2c3d4f;border: 1px solid transparent;" onclick="hiderDocumentPopUp();" ><spring:message code="label.cancel"/></button>
		<button type="button" class="btn btn-primary" onclick="deleteDocumentPopUp();" ><spring:message code="label.out_confm"/></button>
		
	  </div> 	
 </div>
 </div>
 </div>
 <div id="myModal" class="modal fade in" role="dialog" style="display:none;">
    <div class="modal-dialog" style=""> 
      
      <!-- Modal content-->
      <div class="modal-content" style="top: 31px">
        <div class="modal-header">
          <button type="button" class="close" onclick="closeSummary();">&times;</button>
          
          <h4 class="modal-title"><spring:message code="label.previ"/></h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-xs-12">
                <div class="para4" style="margin-bottom: 0;"><spring:message code="label.temp-stp1"/>  </div>
              </div>
              <div class="col-xs-12">              	
                
                <table cellpadding="0" cellspacing="0" width="100%;" class=" table table-bordered">
                <tr>
                	
                    <td><strong><spring:message code="label.grp_doc"/></strong></td>
                    <td id="summaryDocName"></td>
               </tr>
              <tr>
                	
                    <td><strong><spring:message code="label.comp_reqstdby"/></strong></td>
                    <td><c:out value="${fulnme}"></c:out> </td>
                    </tr>
                </table>
               
              </div>
            </div>
            <div class="row">
              <div class="col-xs-12">
                <div class="para4" style="margin-bottom: 0;"><spring:message code="label.prev-stp2"/> </div>
              </div>
             <div class="col-xs-12">              	
               <table id="summarySignerList" cellpadding="0" cellspacing="0" width="100%;" class=" table table-bordered">
                <thead>
                <tr>
	                <th id="priorityHeaderSummary"><spring:message code="label.grp_prio"/></th>
	                <th><spring:message code="label.tmp-name"/></th>
	                <th><spring:message code="label.grp_email"/></th>
                </tr>
                </thead>
                <tbody id="showSummarySignerList">
                <!-- <tr>
                	<td>1</td>
                    <td>snaket navale</td>
                    <td>Sanketnavale@gmail.com</td>
                </tr>
             	<tr>
                    <td>2</td>
                    <td>snaket navale</td>
                    <td>Sanketnavale@gmail.com</td>
                    </tr>
                <tr>
                    <td>3</td>
                    <td>snaket navale</td>
                    <td>Sanketnavale@gmail.com</td>
                 </tr> -->
                 </tbody>
                </table>
                
              </div>
            </div>
            <div class="row">
              <div class="col-xs-12">
                <div class="para4" style="margin-bottom: 0;"><spring:message code="label.prv-stp3"/> </div>
              </div>
             <div class="col-xs-12">              	
               
                <table cellpadding="0" cellspacing="0" width="100%;" class=" table table-bordered">
                <tr>
                	
                    <td><strong><spring:message code="label.slf_sub"/></strong></td>
                    <td id="preview_subject"><spring:message code="label.grp_text"/></td>
               </tr>
              <tr>
                	
                    <td><strong><spring:message code="label.slf_msg"/></strong></td>
                    <td id="preview_message"><spring:message code="label.grp_test"/></td>
                    </tr>
                </table>
               
              </div>
            </div>
            
          </div>
        </div>
        <!-- <div class="modal-footer text-center">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Done</button>
        </div> -->
         <div class="text-right">	  
			<a class="btn btn-light"  onclick="closeSummary();" href="#"><spring:message code="label.cancel"/></a>
			<a class="btn btn-primary" onclick="closeSummary();"href="#"><spring:message code="label.out_confm"/></a>					
	  </div> 
      </div>
    </div>
  </div>

<div class="overlay-bg"></div>

<!-- Draw Signature -->
  <div class="signature-sign">
	 <div class="header">	 	
		 <a class="close" href="#"><span class="icon-close"></span></a>
	 </div>
	 <ul class="nav nav-tabs self-sign">
			<li class="active"><a href="#draw" data-toggle="tab"><spring:message code="label.drw"/></a>
			</li>
			<li >
       		 <a  href="#type" data-toggle="tab"><spring:message code="label.type"/></a>
			</li>
			
	</ul>
	<div class="tab-content self_sing_tab ">
			<div class="tab-pane active" id="draw">
         		 <div class="row margTB20">
					 
				 </div>
				 <div class="row margB20">
					  <div class="col-xs-12 text-right">
						  <a class="text-red" onclick="zkSignature.clear()" href="#"><spring:message code="label.clr"/></a>
						   <a class="text-green" id="saveSignature" href="#"><spring:message code="label.save"/></a>
					  </div>
				  </div>
				  <div class="row margTB20">
					  <div class="col-xs-12">
					  	<div id="canvas">
								<spring:message code="label.cnvs_suprt"/>
						</div>
				</div>
					</div>
				</div>
			  <div class="tab-pane" id="type">
				  <div class="row">
						<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="input-field">
							<input id="" type="text" class="validate">
							<label for="last_name"><spring:message code="label.ur_name"/></label>
						</div>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="input-field">
							 <input id="" type="text" class="validate">
								<label for="file_name"><spring:message code="label.file_name"/></label>
							</div>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12">
					</div>
				  </div>
				  <div class="row">
					  <div class="col-xs-12 text-right">
						  <a class="text-red" href="#"><spring:message code="label.reset"/></a>
						   <a class="text-green" href="#"><spring:message code="label.save"/></a>
					  </div>
				  </div>
				  <div class="row margTB20">
					  <div class="col-xs-12">
					  	<div class="pdf_view">
					  <br>
				    <br>
				    <br>
				    <br><br>
				    <br><br>
				    <br><br> 
					</div>
					  </div>
				  </div>
				</div>	
	</div>
</div>

 <div class="overlay-bg"></div>
<div class="overlaywhite_bg"></div>
<input type="hidden" id="generator" value="1" />
<input type="hidden" id="fieldshtml" value="" />
<input type="hidden" id="flag" value=""/>
<input type="hidden" id="setpriority" value="0"/>
<input type="hidden" id="signature" value="<c:out value="${signature}"></c:out>"/>
<input type="hidden" id="dragList" value=""/>
<input type="hidden" id="signer_list" value=""/>
<input type="hidden" id="viewpagecount" value="0"/>
<input type="hidden" id="draganddropList" value=""/>
<input type="hidden" id="enableButton" value=""/>
<input type="hidden" id="pageHeight" value="0"/>
<input type="hidden" id="numpages" value="0"/>

<script type="text/javascript" language="javascript" src="<%=appUrl %>/js/jquery.mCustomScrollbar.js"></script>
<script src="<%=appUrl %>/js/file_upload.js"></script>
<script src="<%=appUrl %>/js/materialize.js"></script>
<script type="text/javascript" src="<%=appUrl%>/js/utility.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.10.4/typeahead.bundle.min.js"></script>
<script src="<%=appUrl %>/js/materialize-tags.min.js"></script>
<script src="<%=appUrl %>/js/jquery.validate.js"></script>

<!-- ./wrapper --> 


<script>
function loadImage() {
	$("#loader1").fadeOut("slow");
	//$(".loadImage").show();
	//$('.drop').width($('.drop').children('img').width());
	var stepNumber= $('#stepNumber').val();
	  /* if(stepNumber==3){
	  $('.document-reader').width($('.drop').children('img').width());
	  
	  } */
}

(function($){
	  $(window).on("load",function(){
	$(".content").mCustomScrollbar({
				axis:"xy",

				advanced:{
					autoExpandHorizontalScroll:true
				}
			});
       });
})(jQuery);	

/* $(window).on("load resize", function() {
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
});	 */
</script>
<script>
var appURL;
	$(document).ready(function () {
		$("body").addClass("sidebar-collapse");
		$("#showfilenotuplad").hide();
		 appURL="<%=appUrl %>";		
		$("#myModal").hide();
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
	   	var increment=1;
		//alert(increment);
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
		   	$(".icon-upload").hide();
			$("#remove-icon").append('<i class="fa fa-trash-o pull-right" aria-hidden="true" onclick="deleteDocument();" style=""></i>');
			$(".progress-bar").css("width", "100%");
			$("#jumpstep2").removeAttr('disabled');
			$("#step1").removeAttr("href"); 
		//	 $("#steplist1").addClass('disabled');
			$("#draganddropList").val(dragList);
			getSignerList();
	   	}
		if(stepNumber == 1){
			/* $("#steplist1").removeClass('disabled');
	   	    $("#steplist1").addClass('active');
	   	    $("#step1").removeClass('disabled');
	   	    $("#step1").addClass('active');
	   	     */
	   	}
		/* else if(stepNumber == 2){		//vvv16july2020 commenting step2
			//$("#step1").removeAttr("href"); 
	   		$("#steplist2").removeClass('disabled');
	   	    $("#steplist2").addClass('active');
	   	    $("#step2").removeClass('disabled');
	   	    $("#step2").addClass('active');
	   //		document.getElementById("steplist1").disabled = true;
	   	 	
	   	} */
		else if(stepNumber == 3){
			//$("#steplist2").addClass('disabled');
			$("#steplist3").removeClass('disabled');
	   	    $("#steplist3").addClass('active');
	   	    $("#step3").removeClass('disabled');
	   	    $("#step3").addClass('active');
	     	var count=$("#viewpagecount").val();
	   	    jumpstep3(count);
	   	 	signerEmailList();
	   	    
	   	}else if(stepNumber == 4){
	   	// $("#send").click(); 
	   	//$("#steplist3").addClass('disabled');
			 $("#steplist4").removeClass('disabled');
	   	    $("#steplist4").addClass('active');
	   	    $("#step4").removeClass('disabled');
	   	    $("#step4").addClass('active'); 
	   	}else{
	   		$("#steplist1").removeClass('disabled');
	   	    $("#steplist1").addClass('active');
	   	    $("#step1").removeClass('disabled');
	   	    $("#step1").addClass('active'); 
	   	}	
	
	$('.tab-pen-eraser button').click(function(){
		$(this).addClass('active_btn').siblings().removeClass('active_btn');
	});	
    $(".btn-select").each(function (e) {
        var value = $(this).find("ul li.selected").html();
        if (value != undefined) {
            $(this).find(".btn-select-input").val(value);
            $(this).find(".btn-select-value").html(value);
        }
    });
});

//dropdown drag fields
$(document).on('click', '.btn-select', function (e) {
    e.preventDefault();
    var ul = $(this).find("ul");
    if ($(this).hasClass("active")) {
        if (ul.find("li").is(e.target)) {
            var target = $(e.target);
            var signerEmail=e.target.id;
            var signerPriority=$(e.target).attr('data-name');
           // var priority=e.target.data-priority-id;
           // alert(signerEmail);
            //alert(signerPriority);
            //alert(target.html());
            target.addClass("selected").siblings().removeClass("selected");
            var value = target.html();
            
          	$(this).find(".btn-select-priority").val(signerPriority);
            $(this).find(".btn-select-email").val(signerEmail);
            $(this).find(".btn-select-input").val(value);
            $(this).find(".btn-select-value").html(value);
            
            signerEmailList();
            
        }
        ul.hide();
        $(this).removeClass("active");
    }
    else {
        $('.btn-select').not(this).each(function () {
            $(this).removeClass("active").find("ul").hide();
        });
        ul.slideDown(300);
        $(this).addClass("active");
    }
    jumpstep2(3);
});

$(document).on('click', function (e) {
    var target = $(e.target).closest(".btn-select");
    if (!target.length) {
        $(".btn-select").removeClass("active").find("ul").hide();
    }
});

function signerEmailList(){
	var generatorLength=$("#generator").val();
	var array1 = [];
	for(var i=0; i<generatorLength ; i++) {
		var fieldType=$("#field"+i).attr("data-signer");
		if(fieldType !=null && fieldType !=undefined){
			array1[i]=$("#fieldvalue"+i).val();   
		}
	}
	//alert("array1 "+array1);
	var array2 = [];
	var total_row=$("#total-row").val()
	for (var i = 0; i <= total_row; i++) {
		var signeremail=$("#signername"+i).val();
		if(signeremail  != undefined && signeremail !=""){
       	
       	array2[i]=signeremail;   
		}
	}
	//alert("array2 "+array2);
	var foo = [];

	$.grep(array2, function(el) {

		if ($.inArray(el, array1) != -1) {
			foo.push(el);
		}

	});
	
	//alert("FOO" + foo);
	var a1=foo.sort();
	var a2=array2.sort();
	var is_same = a1.length == a2.length && a1.every(function(element, index) {
	    return element === a2[index]; 
	});
	var checkButton=false;
	if(is_same == false){
		checkButton=false;
	}else{
		checkButton=checkArray(array1);	
	}
	//alert(checkButton);
	if(checkButton ==true){

		$("#step3-button").removeAttr('disabled');
		// $("#steplist3").addClass('disabled');
	}else{
		 $("#step3-button").attr('disabled','disabled');
	}
	
	/* for (var i = 0; i <array1.length; i++) {
		/* if(array1[i] == ""){
			 $("#step3-button").attr('disabled','disabled');
		// alert("EMPTY ARRAY")	
		}if(array1[i] != ""){
		 //alert("NOT EMPTY ARRAY")
			if(is_same == 'true' || is_same== true){
				$("#step3-button").removeAttr('disabled');
			}else{
				$("#step3-button").attr('disabled','disabled');
			}
		} 
		
		if(array1[i] === "")   
	      return false;
		
		
	}  */
	
	
}
function checkArray(my_arr){
	   for(var i=0;i<my_arr.length;i++){
	       if(my_arr[i] === "")   
	          return false;
	   }
	   return true;
	}
/* function signerEmailList(){
	var jsonArray = [];
	var generatorLength=$("#generator").val();
	for(var i=0; i<generatorLength; i++) {
		var item = {};
		var fieldType=$("#field"+i).attr("data-signer");
		if(fieldType !=null && fieldType !=undefined){
			if(fieldType == "name"){
				item ['signerName'] = $("#fieldvalue"+i).val();
				item ['signerEmail'] = $("#fieldemailvalue"+i).val();
			}else if(fieldType == "date"){
				item ['signerName'] = $("#fieldvalue"+i).val();
				item ['signerEmail'] = $("#fieldemailvalue"+i).val();		
			}else if(fieldType == "signature"){
				item ['signerName'] = $("#fieldvalue"+i).val();
				item ['signerEmail'] = $("#fieldemailvalue"+i).val();
			}else if(fieldType == "textbox"){
				item ['fieldName'] = $("#field"+i).attr("data-signer");
				item ['priority'] = $("#fieldpriorityvalue"+i).val();
				item ['signerName'] = $("#fieldvalue"+i).val();
				item ['signerEmail'] = $("#fieldemailvalue"+i).val();
			}else if(fieldType == "checkbox"){
				item ['signerName'] = $("#fieldvalue"+i).val();
				item ['signerEmail'] = $("#fieldemailvalue"+i).val();
			}else if(fieldType == "initials"){
				item ['signerName'] = $("#fieldvalue"+i).val();
				item ['signerEmail'] = $("#fieldemailvalue"+i).val();
			}
			//alert('Signer Name'+item ['signerName'] +' Signer Email ' +item ['signerEmail'] );
			jsonArray.push(item);
		}
	}
	var total_row=$("#total-row").val()
	var jsonSignerArray = [];
        for (var i = 0; i <= total_row; i++) {
        	var item = {};
        	var signername=$("#signername"+i).val();
        	var signeremail=$("#signeremail"+i).val();
        	if(signername  != undefined && signername !="" && signeremail  != undefined && signeremail !=""){
        		item ['name'] = signername;
				item ['email'] =signeremail;
				jsonSignerArray.push(item);
        	}
     }
	$.each(jsonArray, function(key, value) {
		  if(value.signerName !='' || value.signerEmail != ''){
			 $.each(jsonSignerArray, function(key1, value1) {
					if(value1.email != value.signerEmail ){
						$("#step3-button").attr('disabled','disabled');
					}else{
						$("#step3-button").removeAttr('disabled');
					} 
				})
		 }else if(value.signerName =='' || value.signerEmail == ''){
			 $("#step3-button").attr('disabled','disabled');
		 }else{
			 $("#step3-button").removeAttr('disabled');
		 }
	});
	
     var check=getDifferences(jsonSignerArray,signerEmailList);
}
*/

</script>
<!-- <script src="//cdn.ckeditor.com/4.5.9/standard/ckeditor.js"></script> -->
<!-- <script src="//cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script> -->
<script src="<%=appUrl %>/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
CKEDITOR.on('instanceCreated', function(event) {
	  var editor = event.editor;
	  editor.on('instanceReady', function(e) {
	    $(".cke_wysiwyg_frame").removeAttr("title");
	  });
	});
CKEDITOR.replace( 'message', {
removeButtons: 'Undo,Redo,Image,Maximize,Source,About,Table,Strike,Subscript,Superscript,Blockquote,Format,Styles,Link,Unlink,Anchor', 
});

 
var editorText;
function updateDiv(){
    editorText = CKEDITOR.instances.message.getData();
    val = $(editorText).text().trim();
    editortext_validation =CKEDITOR.instances.message.getData().length;
    if( editortext_validation != 0 ) { 
			$("#ckeditor_error").css("display","none");     
	      }
	 if(editortext_validation == 0 ){
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
	document.querySelector('.file-upload-input').setAttribute('placeholder','<spring:message code="label.sel_drag_file"/>');
	$("#cc").keyup(
			function(){
			    var one=$(this).val();
			    $("#ttip").fadeIn().text(one);
			    }
			);
	Materialize.updateTextFields();
		   $('select').material_select();
	
	  $('button.signature-tab').click(function() {
			//$('.wrapper').addClass('overlay-bg')
			$('.overlay-bg').show();
             $('.signature-sign').show();
						var $slider = $('.signature-sign');
						$slider.animate({
						 right: parseInt($slider.css('right'),10) == -350 ? 0 : 0
						});
			});
	$('.close, .overlay-bg').click(function(){
		$('.signature-sign').hide();
		$('.overlay-bg').hide();
	});
	
	$('#pollSlider-button').click(function() {
		   $('#pollSlider-button span').toggleClass("fa-angle-double-left fa-angle-double-right");
		  //$(this).find($("span")).removeClass('icon-arrow_left').addClass('icon-arrow_right');
		  	$('.self-slide').toggleClass('mini-pollsidebar');
	        $('#pollSlider-button').parents('.self-slide').siblings('.signature').toggleClass('mini-pollsidebar');
		  
	    if($(this).css("margin-right") == "176px")
	    {
	        $('.pollSlider').animate({"margin-right": '-=176'});
	        //$('#pollSlider-button').animate({"margin-right": '-=176'});
			
	    }
	    else
	    {
	        $('.pollSlider').animate({"margin-right": '+=176'});
	        //$('#pollSlider-button').animate({"margin-right": '+=176'});	        
	    }


	  });
 }); 	
</script> 
<script type="text/javascript">
     function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('.blah')
                        .attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
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
</script> 
<script>
	  $(document).ready(function () {
		  window.addEventListener('resize', checkMediaQuery);
    //Initialize tooltips
    $('.nav-tabs > li a[title]').tooltip();
    $('[data-toggle="tooltip"]').tooltip(); 
    
    //Wizard
    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
        var $target = $(e.target);   
        if ($target.parent().hasClass('disabled')) {
            return false;
        } 
        if(e.currentTarget.hash =="#step1"){
			//alert('Step1');	
        	$("#isStepOne").show();
			$("#isStepTwo").hide();
			$("#isStepThree").hide();
	    }if(e.currentTarget.hash =="#step2"){
	    	//alert('Step2');
	    	jumpstep2(2);
	    	$("#steplist1").removeClass('disabled');
	    	
		}if(e.currentTarget.hash =="#step3"){
			var count=$("#viewpagecount").val();
			$("#steplist1").removeClass('disabled');	//vvv16july2020
			jumpstep3(count);
			$("#isStepOne").hide();
			$("#isStepTwo").show();
			$("#isStepThree").hide();
			//signerEmailList();
			//jumpstep2(3)
			//jumpstep2(3);
		}if(e.currentTarget.hash =="#step4"){
			//alert('Step3');
			//jumpstep3(3);
			$("#isStepOne").hide();
			$("#isStepTwo").hide();
			$("#isStepThree").show();
			
		}
		
        if ($target.parent().hasClass('disabled')) {
            return false;
        } 
    });

    $(".next-step").click(function (e) {
        /* var $active = $('.wizard .nav-tabs li.active');
        $active.next().removeClass('disabled');
        nextTab($active); */
    	var $active = $('.wizard .nav-tabs li.active');
        $active.next().removeClass('disabled');
        $active.next().find('.fa.fa-circle-o').removeClass('fa-circle-o').addClass('fa-dot-circle-o');
        $active.find('.fa.fa-dot-circle-o').removeClass('fa-dot-circle-o').addClass('fa-check-circle-o');
        $active.addClass('complete');
        nextTab($active);
    });
    $(".prev-step").click(function (e) {
        var $active = $('.wizard .nav-tabs li.active');
        prevTab($active);
    });
});

function nextTab(elem) {
    $(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
    $(elem).prev().find('a[data-toggle="tab"]').click();
}
	$('#example').DataTable( {
		aoColumnDefs: [
		               {
		                  bSortable: false,
		                  aTargets: [ -1 ]
		               }
		             ]
	});
	  
	  $('.square_2').on('click', function(){
    $('.square_2.active').removeClass('active');
    $(this).addClass('active');
	
	$('.row_4').show('.square_2.active#test12');
	//$('.row_4').hide('.square_2 #test12');
	  });
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

<script src="<%=appUrl %>/js/signature.js"></script>
<!-- Loader -->
<script src="<%=appUrl %>/js/jquery.buttonLoader.js"></script>
<script>
zkSignature.capture();

$('.close').click(function(){
	//$('.save-signature-box').hide();
	$(".signature-sign").hide();
	$('.overlay-bg').hide();
	 //return false;
}); 

//Draw Signature
function openMySignature(id){
	$('.overlay-bg').show();
	$('.signature-sign').show();
		var $slider = $('.signature-sign');
		$slider.animate({
		 right: parseInt($slider.css('right'),10) == -350 ? 0 : 0
	});
		
	$("#drawsignature_no").val(id);	
		
}
$("#saveSignature").click(function(){
	var id=$("#drawsignature_no").val();
	$(".signature-sign").hide();
	$('.overlay-bg').hide();
	var canvas = document.getElementById("newSignature");
	// save canvas image as data url (png format by default)
	var dataURL = canvas.toDataURL("image/png",1);
	
	 $("#field"+id).attr('type', 'image'); 
	 $("#field"+id).attr('src', dataURL);
	 $("#field"+id).removeClass('form-control');
	 //$("#fieldclose"+id).css("right", "6px");
	//$("#fiel1d"+id).val(dataURL);
});

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
	  var total_element = $(".signWithStampClose1").length;
	  var total_element1 = $(".signWithStampClose2").length;

	  $("#drop-select" + id).parents('.dragMe').remove();
	 
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
	  
	  signerEmailList();
  }
  
  
  function hideTextbox(id){
	  $("#drop-select" + id).parents('.dragMe').remove();
	  
	  // $("#field"+id).find("a.closeIt").removeClass("hideIt");
	  //jumpstep3(3);
	  //checkFields();
	  signerEmailList();
	  
  }

 
  function enlargeText(id,value){
	 // alert(value.length);
	  $(id).css('width',((value.length + 1) * 8) + 'px');
  }
  
 
</script>
<script src="<%=appUrl %>/js/jquery.ui.widget.js"></script>
<script src="<%=appUrl %>/js/jquery.iframe-transport.js"></script>
<script src="<%=appUrl %>/js/jquery.fileupload.js"></script>
<script src="<%=appUrl %>/js/jquery.fileupload-process.js"></script>
<script src="<%=appUrl %>/js/jquery.fileupload-validate.js"></script>
<script src="<%=appUrl %>/js/jquery.validate.js"></script>



 <script type="text/javascript" src="https://js.live.net/v7.2/OneDrive.js"></script>
 
 <script type="text/javascript">
  function launchOneDrivePicker(){
	  var url ="<%=hostURL%>DrySign/app/document/selfsign";
	  if($("#isCountryCode").val() == "IN"){
		  url ="<%=hostURLIn%>DrySign/app/document/selfsign";
	  }
	  var odOptions = {
			  clientId: "0aa725db-3ba9-486d-8e42-a92554639a6d",
			  action: "download",
			  multiSelect: false,
			  linkType: "webViewLink",
			  advanced: {filter: [".pdf",".docx",".doc",".xls",".xlsx",".ppt",".pptx",".rtf",".bmp",".png",".jpg",".jpeg",".gif",".txt",".tiff",".htm",".html"],
				  redirectUri: url},
			  success: function(response) { 
				  var uploadErrors = [];
				  var downloadurl =  response.value[0]["@microsoft.graph.downloadUrl"];
				  var name = response.value[0]["name"];
				 // console.log("done-->"+downloadurl);
				 // console.log("done-->"+name);
				  $(".file-upload-input").val(name);
				  if(response.value[0]["size"] > 26214400) {
			            uploadErrors.push('<spring:message code="label.mx_file"/>');
			            errorFlag="true";
			            
			        }else{
			        		$("#document-reader-firststep").html(""); // to remove uploaded file
							$("#uploadSuccess").html(name);
			                $(".uploadSuccessHeading").css("display","block");
			                //var d = new Date();
			                //SimpleDateFormat ft = new SimpleDateFormat ("MM/dd/YYYY");
			                //var currentDate = d.getMonth()+1+"/"+d.getDate()+"/"+d.getFullYear();
			                //var currentDate = ft.format(d);
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

			  },
			  cancel: function() { /* cancel handler */ },
			  error: function(e) { /* error handler */ }
			}
    OneDrive.open(odOptions);
  }
  
  
  function saveonedriveChooserFile(downloadedUrl,fileName) {
  	
  	var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
		
		$.ajax({
			url: contextPath+"app/saveDropoxChooserFile?signtype=T",
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
</script>
 

 <script type="text/javascript" src="<%=appUrl %>/js/dropins.js" id="dropboxjs" data-app-key="kktaxdj1402ec7u"></script>
 
 
     <script>
   document.getElementById("dropbox").onclick = function () {
	   var uploadErrors = [];
    	 Dropbox.choose({
            success: function(files) {
                var linkTag = document.getElementById('file-upload-input');
             //   linkTag.href = files[0].link;
              //  linkTag.textContent = files[0].link;
                //var str = files[0].name;
                $(".file-upload-input").val(files[0].name);
                //var res = str.slice(-3);
                  if(files[0].bytes > 26214400) {
			            uploadErrors.push('<spring:message code="label.mx_file"/>');
			            errorFlag="true";
			            
			        }else{
                	
			        	 $("#document-reader-firststep").html(""); // to remove uploaded file
							$("#uploadSuccess").html(files[0].name);
			                $(".uploadSuccessHeading").css("display","block");
			                //var d = new Date();
			                //SimpleDateFormat ft = new SimpleDateFormat ("MM/dd/YYYY");
			                //var currentDate = d.getMonth()+1+"/"+d.getDate()+"/"+d.getFullYear();
			                //var currentDate = ft.format(d);
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
            },
            linkType: 'direct',
            multiselect: false,
            extensions: [".pdf",".docx",".doc",".xls",".xlsx",".ppt",".pptx",".rtf",".bmp",".png",".jpg",".jpeg",".gif",".txt",".tiff",".htm",".html"],
        });
     };
        
        function saveDropoxChooserFile(downloadedUrl,fileName) {
        	
        	var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath=$("#contextPath").val();
			
    		$.ajax({
    			url: contextPath+"app/saveDropoxChooserFile?signtype=T",
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
			            	$("#show_upload_error").html("<spring:message code="label.tmp-limit"/>");
			            		
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
    		    error: function(err){
    		    	
    		    }
    		})
    	}
        
        
/* start Egnyte javascript code */   
        
        function popitupEgnyte(url) {
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
                              $("#show_upload_error").html(<c:out value="response"></c:out>);
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
		function initPicker() {
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
						//console.log(file);
						$("#document-reader-firststep").html(""); // to remove uploaded file
						$("#uploadSuccess").html(file.title);
	                    $(".uploadSuccessHeading").css("display","block");
	                    //var d = new Date();
	                    //SimpleDateFormat ft = new SimpleDateFormat ("MM/dd/YYYY");
		                //var currentDate = d.getMonth()+1+"/"+d.getDate()+"/"+d.getFullYear();
		                //var currentDate = ft.format(d);
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
				//console.log("fileId: ::" + fileId);
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
			//alert("Hai");
			$.ajax({
				url: contextPath+"cloud/downloadFieByFileId?signtype=T",
				type: "POST",
				dataType: 'json',
			    contentType: "application/json; charset=utf-8",
			    data: JSON.stringify({ "fileId":fileId , "fileMimeType": contentType , "fileName" :fileName ,"accessToken":accessToken}),
			    beforeSend: function (xhr) {
		   			xhr.setRequestHeader(header, token);
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
	
	</script>
	
	<script src="https://www.google.com/jsapi?key=AIzaSyC4z1UzNEEZXpOGf547C0XifZ0HagRx64w"></script>
	<script src="https://apis.google.com/js/client.js?onload=initPicker"></script>
	
<script>
/*global window, $ */
$(function () {
    'use strict';
    // Change this to the location of your server-side upload handler:
    var contextPath=$("#contextPath").val();
    var url = "app/tempUpload?signtype=T";
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
	        //$(".file-upload-input").val(data.originalFiles[0].name);
	        var errorFlag="false";
			     //   var acceptFileTypes = /^application\/(pdf)$/i;
			       // if(data.originalFiles[0]['type'].length == 0){
			        //	 uploadErrors.push('<spring:message code="label.onl_pdf"/>');
			        	// errorFlag="false";
			        //}
			        //if(data.originalFiles[0]['type'].length && !acceptFileTypes.test(data.originalFiles[0]['type'])) {
			          ///  uploadErrors.push('<spring:message code="label.onl_pdf"/>');
			            //errorFlag="false";		//upload icon should not change for any type other than pdf WITHOUT drag and Drop
			        //}
			        if(data.originalFiles[0]['size'] && data.originalFiles[0]['size'] > 26214400) {
			            uploadErrors.push('<spring:message code="label.mx_file"/>');
			            errorFlag="true";
			        }
			        var is =  $("#isstep3").val();
			        if (is){
			        	//$("#show_upload_error").html('');
			            //$("#show_upload_error").html("Please remove the existing document to upload new one.").fadeOut(10000)
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
                        if(counter <= 1){
                        	$("#remove-icon").append('<i class="fa fa-times pull-right" aria-hidden="true" onclick="deleteDocument1();" style=""></i>');	
                        }
						
                        $("#jumpstep2").attr('disabled',true);
			        } else {
			        	$(".file-upload-input").val(data.originalFiles[0].name);
						// $("#steplist1").addClass('disabled');
						//Below code change to resolve DrySign:1336 & 1339 by Rupali.Shinde
						 $("#dropzone").hide();
			        	 $(".icon-upload").hide();
			        	 $("#pick").hide();
		            	 $("#dropbox").hide();
		            	 $("#onedrive").hide();
                         $("#egnyte").hide();
                         if(counter <= 1)
                        	 {
						 $("#remove-icon").append('<i class="fa fa-trash-o pull-right" aria-hidden="true" onclick="deleteDocument();" style=""></i>');
                        	 }
                         $("#uploadSuccess").html(data.originalFiles[0].name);
                         $(".uploadSuccessHeading").css("display","block");
                         //var d = new Date();
                         //SimpleDateFormat ft = new SimpleDateFormat ("MM/dd/YYYY");
			             //var currentDate = d.getMonth()+1+"/"+d.getDate()+"/"+d.getFullYear();
			             //var currentDate = ft.format(d);
                         var fileSize = convertSize(data.originalFiles[0]['size']);
                         //$("#fileSizeandDate").html("File Size- "+fileSize+"  Date- "+currentDate);
                         $("#fileSize").html(fileSize);
		                 $("#uploadDate").html("<%= ft.format(date)%>");
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
        	//alert('FAILED')
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
            //alert(response)
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
            	// $("#pick").hide();
            	 $("#dropbox").hide();
            	 $("#onedrive").hide();
                 $("#egnyte").hide();
            	$("#jumpstep2").removeAttr('disabled');
            }else{
            	//vvv05jun2020 existing code commented. added cond for corrupt
            	/* $("#show_upload_error").html('');
            	$("#show_upload_error").html(<c:out value="response"></c:out>); */
            	
            	if(response =="corrupt"){
            		$.alert({
		                title: '',
		                content: '<spring:message code="label.corruptDocument"/>',
		            });
            		//$("#show_upload_error").html('');
            		//$("#show_upload_error").html("<spring:message code="label.corruptDocument"/>").fadeOut(10000);
            		$("#jumpstep2").attr('disabled',true);
                }
            	else{
            		$("#show_upload_error").html('');
                	$("#show_upload_error").html(<c:out value="response"></c:out>);
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
	var val = (size/ 1024)/1024; //MB
	var returnsize;
	if(val>= 1 ){
		returnsize = val | 0;
		return returnsize+" MB";
	}else{
		returnsize = (size / 1024) | 0;
	}
	return returnsize+" KB";
}

$('.close, .overlay-bg, .overlaywhite_bg').click(function(){
	$('.signature-sign').hide();
	$('.overlay-bg').hide();
	$('.Message').hide();
	$('.overlaywhite_bg').hide();
	
});
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
}

function getfieldValue(currentValue,id){
	//alert('CurrentValue'+currentValue+id);
	$("#field"+id).attr("value", currentValue);
	 //jumpstep3(2);
	 //checkFields();
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
			url : contextPath+"deleteTemplate?docId="+docId,
			beforeSend : function(xhr) {
				//$('#signupbtn').buttonLoader('start');
				xhr.setRequestHeader(header, token);
			},
			complete : function() {
				//$("#signupbtn").buttonLoader('stop');
			},success : function(response) {
				//alert(response);
				if(response == "103"){
					$("#deleteDocument").hide();
					$('.overlaywhite_bg').hide();	
					$("#show-selfsign-steps").hide();
	        		$("#skippopup").hide();
	        		$("#show-selfsign-error").show();
	        		$("#error-messgae").empty();
	        		$("#error-messgae").append('<spring:message code="label.sgn_prvs"/>');
				}else if(response == "invalid"){
					$("#deleteDocument").hide();
					$('.overlaywhite_bg').hide();	
					$("#show-selfsign-steps").hide();
	        		$("#skippopup").hide();
	        		$("#show-selfsign-error").show();
	        		$("#error-messgae").empty();
	        		$("#error-messgae").append('<spring:message code="label.invalid"/>');
				}
				else if(response == "success"){
					if(flag == "draft"){
						$("#deleteDocument").hide();
						$('.overlaywhite_bg').hide();	
						 window.location.href=contextPath+"app/document/selfsign" 
					}else{
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
			if(response == '103'){
        		$("#show-selfsign-steps").show();
        		$("#skippopup").hide();
        		$("#show-selfsign-error").show();
        		$('.overlaywhite_bg').show();
        		$("#error-messgae").empty();
        		$("#error-messgae").append('<spring:message code="label.sgn_prvs"/>');
        	}else if(response == "invalid"){
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
</script>
  
  
  <!--Validation -->
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script> -->
 <input type="hidden" id="count_row" value="1"/> 
<script>
$("#loader2").show();
 $(document).ready(function(){
	 $("#loader2").hide();
	     $(".priority_header").hide();
	     $(".priority").hide();
	     var i=parseInt($("#count_row").val());
		 $("#add_row").click(function(){
			 
			 
			 var j=parseInt($("#add-row").val());
			 var setpriority=$("#setpriority").val();
			 if(setpriority == 1){
				 $('#addr'+i).html("<td class='priority' id='priority"+(i)+"'>"+ (j+1) +"</td><td><input name='signername' value='Signer"+(j+1)+"' id='signername"+(i)+"' type='text' placeholder='Signatory' class='test' onchange='validateSigners();' disabled /></td><td><a class='btn btn-red' style='style='background: #f44336;'>Remove</a></td>");	 
			 }else{
				 $(".priority_header").hide();
				 $('#addr'+i).html("<td class='priority' id='priority"+(i)+"' style='display:none'>"+ (j+1) +"</td><td><input name='signername' value='Signer"+(j+1)+"' id='signername"+(i)+"' type='text' placeholder='Signatory' class='test' onchange='validateSigners();' disabled/></td><td><a class='btn btn-red' style='style='background: #f44336;'>Remove</a></td>");
			 }
		 	 $('#diagnosis_list').append('<tr id="addr'+(i+1)+'"></tr>');
		  	 i++; 
		     $("#add-row").val(j+parseInt(1));
		     $("#total-row").val(i+parseInt(1));
		  saveSignerList();
		});
		
		$("#save_next_2").click(function(){
			// $("#steplist2").addClass('disabled');
			//$("#testload").css("display", "block");
			saveSignerList()
			savetempcount();
		
		});
		
		$("#step3-button").click(function(){
			//saveSignerList()
		});
	  
 });
 
	function savetempcount(){
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
	//	var scount= $('#diagnosis_list tr').length-2;	//vvv16july2020	
		var scount= 1;			//vvv16july2020 set 1 since step2 is commented
		/* var data1 = {
	    	      "docId" : $("#docId").val(),
	    	     "count" :scount
	    	      
	    } */
		//alert(contextPath);
		var btn='#send1';
			$.ajax({
			//	contentType : 'application/json; charset=utf-8',
				type : "POST",
				url : contextPath+"app/saveSignerListTemp",
				//dataType : 'json',
				//data : JSON.stringify(data1),
				data :{  
					  docId : $("#docId").val(),
					  count :scount
				},
				beforeSend : function(xhr) {
					$(btn).buttonLoader('start');
					xhr.setRequestHeader(header, token);
				},
				complete : function() {
					$(btn).buttonLoader('stop');
				},
				success : function(response) {

				},
				error: function(xhr, textStatus, errorThrown)
				 {
				 	alert('<spring:message code="label.loading_error"/>');
				 	return false;
				}
			});	
		
	}
 
 function getSignerList(){
	    var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
        var docId=$("#docId").val();   
 		$.ajax({
		type : "GET",
		url : contextPath+"app/getSignerList?docId="+docId,
	    beforeSend: function (xhr) {
   			xhr.setRequestHeader(header, token);
	    },
	    complete: function () {
	    },
        success : function(response) {
         	if(response != 'failed'){
        	 var i=1;
       		 $(".priority_header").hide();
       		 $(".priority").hide();
       		var ckbox = $('#checkbox2');
	       	 
       		 
       		  $.each(response, function( key, value ) {
       		   	 var j=parseInt($("#add-row").val());
       			 var setpriority=$("#setpriority").val();
       			 
	       			if (value.flag =="1") {
	       				//alert('checked');
	       			    $("#checkbox2").attr('checked','checked')
	 	             	$(".priority_header").show();
	 	       	 	 	$(".priority").show();
	 	       	 	 	$("#setpriority").val(1);
	 	       	 	} else {
	 	       	 		$(".priority_header").hide();
		 	        	$(".priority").hide();
		 	        	$("#setpriority").val(0);
	 	            }
       			 if(key == 0){
       				 	$("#signername0").val(value.signerName);
       				 	$("#signeremail0").val(value.signerEmail);
       			 }else{
       				if(setpriority == 1){
       				 	$('#addr'+i).html("<td class='priority' id='priority"+(i)+"'>"+ (j+1) +"</td><td><input name='signername' id='signername"+(i)+"' value="+value.signerName+" type='text' placeholder='Signatory Name' class='form-control input-md' onchange='validateSigners();' disabled /><span class='required' id='signervalidname"+(i)+"' style='display:none'>Please enter signatory name </span> </td><td><input  name='signeremail' id='signeremail"+(i)+"'  type='text' placeholder='Email Address' value="+value.signerEmail+" class='form-control input-md' onchange='validateSigners();'><span class='required' id='signervalidemail"+(i)+"' style='display:none'>Please enter valid email address </span></td><td><a class='btn btn-red' style='style='background: #f44336;'>Remove</a></td>");	 
       				 }else{
       				 	$(".priority_header").hide();
       				 	$('#addr'+i).html("<td class='priority' id='priority"+(i)+"' style='display:none'>"+ (j+1) +"</td><td><input name='signername' id='signername"+(i)+"'  value="+value.signerName+" type='text' placeholder='Signatory Name' class='form-control input-md' onchange='validateSigners();' disabled /><span class='required' id='signervalidname"+(i)+"' style='display:none'>Please enter signatory name </span></td><td><input  name='signeremail' id='signeremail"+(i)+"'  type='text' placeholder='Email Address' value="+value.signerEmail+"  class='form-control input-md' onchange='validateSigners();'><span class='required' id='signervalidemail"+(i)+"' style='display:none'>Please enter valid email address </span></td><td><a class='btn btn-red' style='style='background: #f44336;'>Remove</a></td>");
       				 }
       				 	$('#diagnosis_list').append('<tr id="addr'+(i+1)+'"></tr>');
       				 	$("#add-row").val(j+parseInt(1));
  				     	$("#total-row").val(i+parseInt(1));
  				  i++; 
       			 }
       		 });	
         	
       		validateSigners();
       		//findDuplicates();
         	}else{
            	alert('failed');
            }
		},
		 error : function(e) {  
		    alert('Error: ' + e);   
		}  
	 });
	   
	  
 }

 //save signer name and signer email in tempSigner table(step2)
 function saveSignerList(){
	    var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
		var totalRows=parseInt($("#total-row").val());
		var draftId=$("#draftId").val();
		var stepNumber=3;
		var docId=$("#docId").val();
		var jsonArray = [];
		var ckbox = $('#checkbox2');
		var flag="1";
		if (ckbox.is(':checked')) {
			var flag="1";	 
		}else{
			var flag="0";
		}
		
	   for(var i=0; i<totalRows; i++) {
			 var item = {};
		 	 if($("#priority"+i).text()!=undefined && $("#priority"+i).text()!="" && $("#signername"+i).val()!=undefined && $("#signername"+i).val()!="" && $("#signeremail"+i).val()!=undefined && $("#signeremail"+i).val()!="" ){
				item ['docId'] = docId;
				item ['draftId'] = draftId;
			    item ['stepNumber'] = stepNumber;
				item ["priority"] =$("#priority"+i).text();
				item ["signerName"] =$("#signername"+i).val();
				item ["signerEmail"] =$("#signeremail"+i).val();
				item ["signType"] ="T"; 
				item ["flag"] =flag; 
			  jsonArray.push(item); 
			
		  }  
		} 
		$.ajax({
			type : "POST",
			url : contextPath+"app/saveSignerList",
			dataType: 'json',
		    contentType: "application/json; charset=utf-8",
		    data: JSON.stringify(jsonArray),
		    beforeSend: function (xhr) {
	   			xhr.setRequestHeader(header, token);
		    },
		    complete: function () {
		    },
	        success : function(response) {
	         	if(response != 'failed'){
	        			//alert("success");
	        			$("#stepNumber").val(3);
	            }else{
	            	//alert('failed');
	            }
			},
			 error : function(e) {  
			    alert('Error hahahah: ' + e);   
			}  
		 });
		//$("#signer_list").val(jsonArray);
 }
 function enable_disable_proirity(){
	 var ckbox = $('#checkbox2');
	 if (ckbox.is(':checked')) {
        // alert('You have Checked it');
		 $(".priority_header").show();
	 	 $(".priority").show();
	 	 $("#setpriority").val(1);
	 	 
     } else {
        // alert('You Un-Checked it');
    	$(".priority_header").hide();
 	    $(".priority").hide();
 	    $("#setpriority").val(0);
     }
	 saveSignerList();
 }
</script>
<script type="text/javascript">

$(document).ready(function() {
	//Helper function to keep table row from collapsing when being sorted
	var fixHelperModified = function(e, tr) {
		var $originals = tr.children();
		var $helper = tr.clone();
		$helper.children().each(function(index)
		{
		  $(this).width($originals.eq(index).width())
		});
		return $helper;
	};

	//Make diagnosis table sortable
	/* $("#diagnosis_list tbody").sortable({
		helper: fixHelperModified,
		stop: function(event,ui) {renumber_table('#diagnosis_list')}
	}).disableSelection();
 */
 
	//Delete button in table rows
	$('table').on('click','.btn-red',function() {
		tableID = '#' + $(this).closest('table').attr('id');
		var flag=$("#flag").val();
		var dragList=$("#draganddropList").val();
		//alert('dragList'+dragList);
		if($("#add-row").val()>1){
		if(flag == "draft" && dragList !=""){
			r = confirm('<spring:message code="label.youWillLose3Attempt"/>');
			draganddrop(2,"signerRemove");
			var increment=$("#generator").val();
			for(var i=0;i<=increment;i++){
				$("#fieldPosition"+i).remove();
			}
		}else{
			r = confirm('<spring:message code="label.dlt_signeename"/>');
		} }else{
			alert('<spring:message code="label.atlistOneSign"/>');
		}
		
		if(r) {
			//console.log("r"+r);
			$(this).closest('tr').remove();
			 var j=parseInt($("#add-row").val());
			 $("#add-row").val(j-1);
			renumber_table(tableID);
			saveSignerList();
			validateSigners();
			r=false;
		}
		
		
	});
	
	$("#preview").click(function(){
		
		var fileName=$(".file-upload-input").val();
		var subject=$("#subject").val();
		//var message=$("#message").val();
		var message=editorText;             //issue resolve DrySign1031 (blank message value)
		$("#preview_subject").html(subject);
		$("#preview_message").html(message);
		$(".overlay-bg").show();
		
		$("#myModal").show();
		    
		var totalRows=parseInt($("#total-row").val());
		var jsonArray = [];
		var ckbox = $('#checkbox2');
		var flag="1";
		if (ckbox.is(':checked')) {
			var flag="1";	 
		}else{
			var flag="0";
		}
		$('#showSummarySignerList').empty();
       var str =""; 
	   for(var i=0; i<=totalRows; i++) {
			
		 	 if($("#priority"+i).text()!=undefined && $("#priority"+i).text()!="" && $("#signername"+i).val()!=undefined && $("#signername"+i).val()!="" && $("#signeremail"+i).val()!=undefined && $("#signeremail"+i).val()!="" ){
				str+="<tr>";
		 		str+="<td class='prioritySummary'>"+$("#priority"+i).text()+"</td>";
		 		str+="<td>"+$("#signername"+i).val()+"</td>";
		 		str+="<td>"+$("#signeremail"+i).val()+"</td>";
		        str+="</tr>";
		  }  
		} 
	   
	   
	    $('#showSummarySignerList').append(str);
	    if(flag == 0){
			   $("#priorityHeaderSummary").hide();
			   $(".prioritySummary").hide();
		   }
		$("#summaryDocName").html(fileName);
		$('body').css('overflow','hidden');
	    //alert("The paragraph was clicked.");
	});

});

function closeSummary(){
	$(".overlay-bg").hide();
	$("#myModal").hide();
	$('body').css('overflow','scroll');
	
}

//Renumber table rows
function renumber_table(tableID) {
	$(tableID + " tr").each(function() {
		count = $(this).parent().children().index($(this)) + 1;
		$(this).find('.priority').html(count);
		$(this).find('.test').val("Signer"+count);
		
		
	});
}

//Renumber table rows
function renumber(tableID) {
	$(tableID + " tr").each(function() {
		count = $(this).parent().children().index($(this)) + 1;
		$(this).find('.addr-row').val(count);
		
		
	});
}

//email validation expression
function validateEmail(email) {
  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}


//Validation Table
function validateSignes(){
	var isValid = true;

	if (isValid == false) 
		e.preventDefault();
	else 
		document.getElementById('save_next_2').removeAttribute('disabled');
	 //$("#steplist2").addClass('disabled');

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
			 "signType":"T"
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
          	alert('failed');
          }

		},
		 error : function(e) {  
		    alert('Error: ' + e);   
		}  
	 });
}
 
function jumpstep2(stepNumber){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var contextPath=$("#contextPath").val();
	$("#fieldshtml").val("");
	var fieldsHTML = "";
	$(".drop > .dragMe").each(function() {
		fieldsHTML += $(this).prop("outerHTML");
	});
	var signType="T";
	//console.log(stepNumber);
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
			 "signType":signType
	}
	$.ajax({
		type : "POST",
		url : contextPath+"app/step2SelfSign",
		dataType: 'json',
	    contentType: "application/json; charset=utf-8",
	    data: JSON.stringify(data),
	    beforeSend: function (xhr) {
   			xhr.setRequestHeader(header, token);
   		//	$('#save_next_2').buttonLoader('start');
	    },
	    complete: function () {
	    //	$('#save_next_2').buttonLoader('stop');
	    },
        success : function(response) {
         	if(response != 'failed'){
        			//alert("success");
        	//	$("#stepNumber").val(2);	//vvv16july2020	commenting step2
        		$("#stepNumber").val(3);	//vvv16july2020 added step3 call since commenting step2
            }else{
            	alert('failed');
            }
		},
		 error : function(e) {  
		    alert('Error: ' + e);   
		}  
	 });
}

var fnm;
var pdfInfo2;
function jumpstep3(count){
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
	var info = "?docId="+docId+"&fileName="+encodeURIComponent(fileName)+"&draftId="+draftId+"&flag="+flag+"&step=3";
	$.ajax({
		//contentType : 'application/json; charset=utf-8',
		type : "GET",
		url : contextPath+"app/getDocument"+info,
		async: false,
		//dataType : 'json',
		//data : JSON.stringify(data),
		beforeSend : function(xhr) {
			//$('#signupbtn').buttonLoader('start');
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
			pdfInfo = response;
			pdfInfo2 = response;
/* 			if(response != 'failed'){
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
				for (var i = 1; i <= numpages; i++) {
				  		$("#document-reader").append('<div class="drop" id="'+i+'"><img width="'+width+'px" height="'+height+'px" class="loadImage" onload="loadImage()" src="'+contextPath+'app/img?fileid='+fileid+'&filename='+filename+'&page='+i+'"></div>');
				}
				$("#stepNumber").val(3);
				//var test1='<div class="dragMe drgfields ui-draggable ui-draggable-dragging ui-draggable-handle" style="padding: 0px; position: absolute; left: 154.25px; top: 60px;" data-signer-id="1" data-document-id="1" id="fieldPosition1"><span>Name</span><span class="closeIt">x</span><input type="text" id="field1" class="selfsign-control" onchange="getfieldValue(this.value,1)" value="asdasd" name="name" required=""></div><div class="dragMe ui-draggable ui-draggable-handle ui-draggable-dragging" data-signer-id="1" data-document-id="1" style="position: absolute; left: 422px; top: 31.4844px;" id="fieldPosition1"><span>Name</span><span class="closeIt">x</span><input type="text" id="field1" class="selfsign-control" onchange="getfieldValue(this.value,1)" value="" name="name" required=""></div>';
				
				
				
				jumpstep2(3);
				 
			}else{
				alert('failed')
			}
		}, */
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
						fnm = filename;
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
				//for (var i = 1; i <= numpages; i++) {
					var i=1;
			  		//$("#document-reader").append('<div class="drop" id="'+i+'"><img width="'+width+'px" height="'+height+'px" class="render-image" onload="loadImage()" src="'+contextPath+'getImgDocument?fileid='+fileid+'&filename='+filename+'&page='+i+'&userId='+userId+'"></div>');
					$.ajax({
						//contentType : 'application/json; charset=utf-8',
						type : "GET",
						url : contextPath+'app/img?fileid='+fileid+'&filename='+filename+'&page='+i+'&numpages='+numpages+'&docId='+docId,
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
									apppendAllpageJsonImgtoDoucment(docId,width,height,response,numpages,pdfInfo,"step2");
									}
								}
							
						},
						error : function(response) {
							$("#document-reader").append('<div class="drop" id="'+i+'"><img width="'+width+'px" height="'+height+'px" class="render-image" onload="loadImage()" src="data:image/png;base64,'+<c:out value='response'></c:out>+'"></div>');
						},
					});
			  		
				//}
				$("#loader2").hide();
				$("#stepNumber").val(3);
				//var test1='<div class="dragMe drgfields ui-draggable ui-draggable-dragging ui-draggable-handle" style="padding: 0px; position: absolute; left: 154.25px; top: 60px;" data-signer-id="1" data-document-id="1" id="fieldPosition1"><span>Name</span><span class="closeIt">x</span><input type="text" id="field1" class="selfsign-control" onchange="getfieldValue(this.value,1)" value="asdasd" name="name" required=""></div><div class="dragMe ui-draggable ui-draggable-handle ui-draggable-dragging" data-signer-id="1" data-document-id="1" style="position: absolute; left: 422px; top: 31.4844px;" id="fieldPosition1"><span>Name</span><span class="closeIt">x</span><input type="text" id="field1" class="selfsign-control" onchange="getfieldValue(this.value,1)" value="" name="name" required=""></div>';
				
				savetempcount();	//vvv16july2020 added to save count 1 in db which was called in step 2
				
				
				jumpstep2(3);
				 
			}else{
					alert('failed')
				
        	}
		},
		error: function(xhr, textStatus, errorThrown)
		 {
		 	alert('<spring:message code="label.loading_error"/> '+errorThrown);
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
     	$("#document-reader").append('<div class="drop" id="'+dropid+'"><img width="'+pdfInfo.widths[i]+'px" height="'+pdfInfo.heights[i]+'px" class="render-image" onload="loadImage()" src='+src1+'></div>');
	  }else{
		  $("#document-reader-firststep").append('<div><img width="' + pdfInfo.widths[i] + 'px" height="' + pdfInfo.heights[i] + 'px" class="render-image" onload="loadImage()" src='+src1+'></div>'); 
	  }
     if(parseFloat(pdfInfo.widths[i])>parseFloat(maxwidth))
     {    
    	 maxwidth=pdfInfo.widths[i];	 
     }
    // console.log("for dropid " + dropid + ":pdf image width and height:" + width +"," + height);
     $("#document-reader").find(".drop#"+dropid).css("width",pdfInfo.widths[i]);
	}
	

	if(step == "step2"){
	 	//for width of  document reader for drag and drop depending page size
    	$("#document-reader").css("width",maxwidth-10);
	 }else{
		 $("#document-reader-firststep").css("width",maxwidth); 
	  }
}



function getAllPages(contextPath,fileid,filename,numpages,docId,header,width,height,pdfInfo,token, step){
	var maxwidth=pdfInfo.widths[0];
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
				$("#document-reader").append('<div class="drop" id="'+i+'" style="width:'+pdfInfo.widths[i-1]+'px"><img width="'+ pdfInfo.widths[i - 1] +'px" height="'+ pdfInfo.heights[i - 1] +'px" class="render-image" onload="loadImage()" src="data:image/png;base64,'+<c:out value='response'></c:out>+'"></div>');
				}else{
					  $("#document-reader-firststep").append('<div><img width="'+ pdfInfo.widths[i - 1] +'px" height="' + pdfInfo.heights[i - 1] + 'px"  class="render-image" onload="loadImage()" src="data:image/png;base64,'+<c:out value='response'></c:out>+'"></div>'); 
				  }
			},
			error : function(response) {
				if(step == "step2"){
					$("#document-reader").append('<div class="drop" id="'+i+'" style="width:'+width+'px"><img width="'+width+'px" height="'+height+'px" class="render-image" onload="loadImage()" src="data:image/png;base64,'+<c:out value='response'></c:out>+'"></div>');
				}else{
					  $("#document-reader-firststep").append('<div><img width="'+width+'px" height="'+height+'px" class="render-image" onload="loadImage()" src="data:image/png;base64,'+<c:out value='response'></c:out>+'"></div>');
				  }
			},
		});
  		
	}
	$("#document-reader").css("width",maxwidth-10);
}	
	
function dragSignatureasItis(dragEl,droppableId,ui,top,left){
	//console.log(dragEl["0"].innerHTML);
	var html=ui.draggable[0].outerHTML;
	var id =$(ui.draggable[0].outerHTML).find("a.btn-default").attr('id');
	
	$("#"+droppableId).append(ui.draggable[0].outerHTML);
	$("#"+id).attr("data-top",top);
	$("#"+id).attr("data-left",left);
	$("#"+id).attr("data-pagenumber",droppableId);
	 
	DragMe();
    draganddrop(3,"");
}

function chekForDraggingElementasitis(dragEl,droppableId,ui,topPosition,leftPosition,innertext,signer_id){
	
	
	 if(signer_id==1 && !innertext.includes('NAME')){
   	   dragSignatureasItis(dragEl,droppableId,ui,topPosition,leftPosition);
       return true;	
      }
   	   
     
      if(signer_id==2 && !innertext.includes('DATE')){
   	   dragSignatureasItis(dragEl,droppableId,ui,topPosition,leftPosition);
     	return true;
      }

      
      if(signer_id==3 && !innertext.includes('SIGNATURE')){
   	  
       dragSignatureasItis(dragEl,droppableId,ui,topPosition,leftPosition);
        	return true;
       }
      
      if(signer_id==4 && !innertext.includes('TEXTBOX')){
    	  
       	dragSignatureasItis(dragEl,droppableId,ui,topPosition,leftPosition);
       	return true;
      }
      //below change done to resolve DrySign:1405 issue by Rupali.Shinde
      if(signer_id==5 && (innertext.indexOf('SIGNATURE')==-1)){
     	  
          dragSignatureasItis(dragEl,droppableId,ui,topPosition,leftPosition);
           	return true;
      }
      
      if(signer_id==6 && !innertext.includes('INITIALS')){
    	  
       	dragSignatureasItis(dragEl,droppableId,ui,topPosition,leftPosition);
       	return true;
      }

  return false;

}

function DragSigner(){
	var dragEl = null;
	
    $(".dragSigners").draggable({
    	containment : "#document-reader",
      helper: 'clone',
      cursor: 'move',
      tolerance: 'fit',
      revert: true 
    });

    $(".drop").droppable({
      accept: '.dragSigners',
      activeClass: "drop-area",

      drop: function(e, ui) {
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
        
        var droppableId = $(this).attr("id");
        var innertext=ui.draggable[0].innerText;
        innertext=innertext.toUpperCase();
        var uniqueGenerator = $("#generator").val();
       
        
      //  console.log("image width is "+$("#"+droppableId).find("img").attr('width'));
        var pageWidthString=$("#"+droppableId).find("img").attr('width');
        
        if(isNaN(pageWidthString)){
       	 //remnoving px from string
       	 pageWidth=pageWidthString.substring(0, (pageWidthString.length-2)); 
        }
        else{
       	 pageWidth=pageWidthString;
        }
         
        // console.log("leftPosition="+leftPosition);
         if((pageWidth-167)<leftPosition){
       	  leftPosition=pageWidth-167;
       	  //console.log("left position ===="+leftPosition);
       	  //return;
         }
       
        
        if(chekForDraggingElementasitis(dragEl,droppableId,ui,topPosition,leftPosition,innertext,signer_id)){
        	return;
        }
  
        
        
        if (document_id == 1 && signer_id == 1) {
        	var fullname=$("#fullName").val();
			$("#"+droppableId).append(ui.helper.clone().html('<div class="drop-select very-specific-design element_'+ uniqueGenerator +'" id="drop-select'+uniqueGenerator+'"><a class="closeIt hideIt" style=" text-decoration: none;"  onclick="hideTextbox('+uniqueGenerator+')" href="#clear"><span class="fa fa-times-circle"></span></a><a data-signer="name" class="btn btn-default btn-select name" id="field'+uniqueGenerator+'" data-top="'+topPosition+'" data-left="'+leftPosition+'" data-pagenumber='+droppableId+'><input type="hidden" class="btn-select-priority" id="fieldpriorityvalue'+uniqueGenerator+'"  value="" /><input type="hidden" class="btn-select-input" id="fieldvalue'+uniqueGenerator+'"  value="" /><input type="hidden" class="btn-select-email" id="fieldemailvalue'+uniqueGenerator+'"  value="" /><div class="field111" id="field111'+uniqueGenerator+'"><span class="btn-select-value">Name</span><span class="btn-select-arrow fa fa-angle-down"></span></div></a></div>'));
   
   			$(this).find("div.dragMe").attr('id', 'fieldPosition'+uniqueGenerator+'');
   			//$('.element_'+ uniqueGenerator).find( ".field111" ).css( "font-size", ( $('.element_'+ uniqueGenerator).find(".field111").width()-50) + "%" );
   			if(docHeight <= dragElTopPoss){
	        	$('.element_'+ uniqueGenerator).parent('.dragMe.dragSigners').css('top', docHeight);
	        	$('.element_'+ uniqueGenerator).find('input').attr('data-top', docHeight);
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
			var mm = today.getShortMonthName(); //January is 0!
			var yyyy = today.getFullYear();

			if(dd<10) {
			    dd='0'+dd
			} 

			if(mm<10) {
			    mm='0'+mm
			} 

			today = dd+'-'+mm+'-'+yyyy;
			
			$("#"+droppableId).append(ui.helper.clone().html('<div class="drop-select very-specific-design element_'+ uniqueGenerator +'" id="drop-select'+uniqueGenerator+'"><a class="closeIt hideIt" style=" text-decoration: none;" id="" onclick="hideTextbox('+uniqueGenerator+')" href="#clear"><span class="fa fa-times-circle"></span></a><a data-signer="date" class="btn btn-default btn-select date" id="field'+uniqueGenerator+'" data-top="'+topPosition+'" data-left="'+leftPosition+'" data-pagenumber='+droppableId+'><input type="hidden" class="btn-select-priority" id="fieldpriorityvalue'+uniqueGenerator+'"  value="" /><input type="hidden" class="btn-select-input" id="fieldvalue'+uniqueGenerator+'"  value="" /><input type="hidden" class="btn-select-email" id="fieldemailvalue'+uniqueGenerator+'"  value="" /><div class="field111" id="field111'+uniqueGenerator+'"><span class="btn-select-value">Date</span><span class="btn-select-arrow fa fa-angle-down"></span></div></a></div>'));
  		
  			$(this).find("div.dragMe").attr('id', 'fieldPosition'+uniqueGenerator+'');
  			//$('.element_'+ uniqueGenerator).find( ".field111" ).css( "font-size", ( $('.element_'+ uniqueGenerator).find(".field111").width()-50) + "%" );
  			if(docHeight <= dragElTopPoss){
	        	$('.element_'+ uniqueGenerator).parent('.dragMe.dragSigners').css('top', docHeight);
	        	$('.element_'+ uniqueGenerator).find('input').attr('data-top', docHeight);
	        }
		}else if (document_id == 1 && signer_id == 3) {
		
	     	$("#"+droppableId).append(ui.helper.clone().html('<div class="drop-select very-specific-design element_'+ uniqueGenerator +'" id="drop-select'+uniqueGenerator+'"><a class="closeIt hideIt" style=" text-decoration: none;" id="" onclick="hideTextbox_Sig('+uniqueGenerator+','+signer_id+')" href="#clear"><span class="fa fa-times-circle"></span></a><a data-signer="signature" class="btn btn-default btn-select signature1 signWithStampClose1" id="field'+uniqueGenerator+'"  data-top="'+topPosition+'" data-left="'+leftPosition+'" data-pagenumber='+droppableId+'><input type="hidden" class="btn-select-priority" id="fieldpriorityvalue'+uniqueGenerator+'"  value="" /><input type="hidden" class="btn-select-input" id="fieldvalue'+uniqueGenerator+'"  value="" /><input type="hidden" class="btn-select-email" id="fieldemailvalue'+uniqueGenerator+'"  value="" /><div class="field111" id="field111'+uniqueGenerator+'"><span class="btn-select-value">Signature</span><span class="btn-select-arrow fa fa-angle-down"></span></div></a></div>'));
  			
  			$(this).find("div.dragMe").attr('id', 'fieldPosition'+uniqueGenerator+'');
  			//$('.element_'+ uniqueGenerator).find( ".field111" ).css( "font-size", ( $('.element_'+ uniqueGenerator).find(".field111").width()-50) + "%" );
  			if(docHeight <= dragElTopPoss){
	        	$('.element_'+ uniqueGenerator).parent('.dragMe.dragSigners').css('top', docHeight);
	        	$('.element_'+ uniqueGenerator).find('input').attr('data-top', docHeight);
	        }
  			
  			$("#signer-5").removeClass("dragMe dragSigners ui-draggable ui-draggable-handle");
  			$("#signer-5").css("opacity","0.5");
  			$(".sign_stamp").css("opacity","0.7");
		}
		else if (document_id == 1 && signer_id == 5) {
		
	     	$("#"+droppableId).append(ui.helper.clone().html('<div class="drop-select very-specific-stamp-design element_'+ uniqueGenerator +'" id="drop-select'+uniqueGenerator+'" ><a class="closeIt hideIt" style=" text-decoration: none;" id="" onclick="hideTextbox_Sig('+uniqueGenerator+','+signer_id+')" href="#clear"><span class="fa fa-times-circle"></span></a><a data-signer="signature" class="btn btn-default btn-select signature1 signWithStampClose2" id="field'+uniqueGenerator+'"  data-top="'+topPosition+'" data-left="'+leftPosition+'" data-pagenumber='+droppableId+'><input type="hidden" class="btn-select-priority" id="fieldpriorityvalue'+uniqueGenerator+'"  value="" /><input type="hidden" class="btn-select-input" id="fieldvalue'+uniqueGenerator+'"  value="" /><input type="hidden" class="btn-select-email" id="fieldemailvalue'+uniqueGenerator+'"  value="" /><div class="field111_stamp"><span class="btn-select-value">Signature</span><span class="btn-select-arrow fa fa-angle-down"></span></div></a><div class="stamp groupSignStamp" id="mySpanImg'+uniqueGenerator+'" data-stamp="data-digitalStamp"><span class="span1">Digitally signed by</span><br/><span class="span2">Signatory</span><br/><span class="span3">Date</span></div></div>'));
	     	//$('.element_'+ uniqueGenerator).find( ".field111_stamp" ).css( "font-size", ( $('.element_'+ uniqueGenerator).find(".field111_stamp").width()-50) + "%" );
  			$(this).find("div.dragMe").attr('id', 'fieldPosition'+uniqueGenerator+'');
  			if(docHeight <= dragElTopPoss){
	        	$('.element_'+ uniqueGenerator).parent('.dragMe.dragSigners').css('top', docHeight);
	        	$('.element_'+ uniqueGenerator).find('input').attr('data-top', docHeight);
	        }
  			if(docWidth - 370 <= dragElLeftPoss){  				
  				$('#document-reader .element_'+ uniqueGenerator).parent('.dragMe.dragSigners').css('left', docWidth - $('#drop-select'+uniqueGenerator).width());
  	        	$('.element_'+ uniqueGenerator).find('input').attr('data-left', docWidth - $('#drop-select'+uniqueGenerator).width());
  	        }
  			
  			$('.element_'+ uniqueGenerator).find('.stamp').attr('data-width', parseFloat($('.element_'+ uniqueGenerator).parent('.dragMe.dragSigners').width()) / 2);
  			$('.element_'+ uniqueGenerator).find('.stamp').attr('data-left', parseFloat($('.element_'+ uniqueGenerator).parent('.dragMe.dragSigners').width()) / 2);
  			$('.element_'+ uniqueGenerator).find('.stamp').attr('data-height', parseFloat($('.element_'+ uniqueGenerator).parent('.dragMe.dragSigners').height()));

  			$(this).find("div.stampwithsig").addClass('sintatureStamp');
  			$("#signer-3").removeClass("dragMe dragSigners ui-draggable ui-draggable-handle");
  			$("#signer-3").css("opacity","0.5");
  			$(".sign").css("opacity","0.7");
	     	
		}else  if (document_id == 1 && signer_id == 4) {
        	
			$("#"+droppableId).append(ui.helper.clone().html('<div class="drop-select very-specific-design element_'+ uniqueGenerator +'" id="drop-select'+uniqueGenerator+'" ><a class="closeIt hideIt" style=" text-decoration: none;" id="" onclick="hideTextbox('+uniqueGenerator+')" href="#clear"><span class="fa fa-times-circle"></span></a><a data-signer="textbox" class="btn btn-default btn-select textbox" id="field'+uniqueGenerator+'"  data-top="'+topPosition+'" data-left="'+leftPosition+'" data-pagenumber='+droppableId+' ><input type="hidden" class="btn-select-priority" id="fieldpriorityvalue'+uniqueGenerator+'"  value="" /><input type="hidden" class="btn-select-input" id="fieldvalue'+uniqueGenerator+'"  value="" /><input type="hidden" class="btn-select-email" id="fieldemailvalue'+uniqueGenerator+'"  value="" /><div class="field111" id="field111'+uniqueGenerator+'"><span class="btn-select-value">Text</span><span class="btn-select-arrow fa fa-angle-down"></span></div></a></div>'));
  		
  			$(this).find("div.dragMe").attr('id', 'fieldPosition'+uniqueGenerator+'');
  			if(docHeight <= dragElTopPoss){
	        	$('.element_'+ uniqueGenerator).parent('.dragMe.dragSigners').css('top', docHeight);
	        	$('.element_'+ uniqueGenerator).find('input').attr('data-top', docHeight);
	        }
  			//$('.element_'+ uniqueGenerator).find( ".field111" ).css( "font-size", ( $('.element_'+ uniqueGenerator).find(".field111").width()-50) + "%" );
        	
		}else  if (document_id == 1 && signer_id == 6) {
    		var firstname=$("#firstName").val();
		
    		$("#"+droppableId).append(ui.helper.clone().html('<div class="drop-select very-specific-design element_'+ uniqueGenerator +'" id="drop-select'+uniqueGenerator+'" ><a class="closeIt hideIt" style=" text-decoration: none;"  onclick="hideTextbox('+uniqueGenerator+')" href="#clear"><span class="fa fa-times-circle"></span></a><a data-signer="initials" class="btn btn-default btn-select initials" id="field'+uniqueGenerator+'" data-top="'+topPosition+'" data-left="'+leftPosition+'" data-pagenumber='+droppableId+'><input type="hidden" class="btn-select-priority" id="fieldpriorityvalue'+uniqueGenerator+'"  value="" /><input type="hidden" class="btn-select-input" id="fieldvalue'+uniqueGenerator+'"  value="" /><input type="hidden" class="btn-select-email" id="fieldemailvalue'+uniqueGenerator+'"  value="" /><div class="field111" id="field111'+uniqueGenerator+'"><span class="btn-select-value">Initials</span><span class="btn-select-arrow fa fa-angle-down"></span></div></a></div>'));
  		
  			$(this).find("div.dragMe").attr('id', 'fieldPosition'+uniqueGenerator+'');
  			if(docHeight <= dragElTopPoss){
	        	$('.element_'+ uniqueGenerator).parent('.dragMe.dragSigners').css('top', docHeight);
	        	$('.element_'+ uniqueGenerator).find('input').attr('data-top', docHeight);
	        }
  			//$('.element_'+ uniqueGenerator).find( ".field111" ).css( "font-size", ( $('.element_'+ uniqueGenerator).find(".field111").width()-50) + "%" );
		
		}
        var incremented = parseInt(uniqueGenerator)+1;
        $("#generator").val(incremented);
    

        dragEl.draggable({
          helper: 'original',
          cursor: 'move',
          containment: '.drop',
          tolerance: 'fit',
          drop: function (event, ui) {
            $(ui.draggable).remove();
          }
        });

        // append element to #document-reader
        dragEl.addClass("dragMe");
    
        
        var total_row=$("#total-row").val()
        var html = '<ul>';
	        for (var i = 0; i <= total_row; i++) {
	        	var signername=$("#signername"+i).val();
	        	var signeremail=$("#signeremail"+i).val();
	        	
	        	var ckbox = $('#checkbox2');
	       		if (ckbox.is(':checked')) {
	       			var priority=$("#priority"+i).html();
		        	
	       		} else {
	       			var priority=$("#priority"+i).html();
	           }
	        	if(signername  != undefined && signername !=""){
	        		//alert($("#signername"+i).val());
	        		html += '<li data-name="'+priority+'" id="'+signeremail+'">'+$("#signername"+i).val()+'</li>';
	        	}
	        }
        html += '</ul>';
        if (document_id == 1 && signer_id == 1 && html != '<ul></ul>') {
	    	$('#field'+uniqueGenerator).append(html);
        }else if (document_id == 1 && signer_id == 2 && html != '<ul></ul>') {
        	$('#field'+uniqueGenerator).append(html);
        }else if (document_id == 1 && signer_id == 3 && html != '<ul></ul>') {
        	$('#field'+uniqueGenerator).append(html);
        }else if (document_id == 1 && signer_id == 4 && html != '<ul></ul>') {
        	$('#field'+uniqueGenerator).append(html);
        }else if (document_id == 1 && signer_id == 5 && html != '<ul></ul>') {
        	$('#field'+uniqueGenerator).append(html);
        }else if (document_id == 1 && signer_id == 6 && html != '<ul></ul>') {
        	$('#field'+uniqueGenerator).append(html);
        }
        
        
       draganddrop(3,"");
       
       signerEmailList();
        // update draged element position to database
        // updateDraggedPosition(dragEl, stopPosition, document_id, signer_id)
		//checkFields()
        // activate dragging for cloned element
        DragMe();
      }
    });
  }


  function DragMe(){
    var document_id;
    $(".dragMe").draggable({
      containment: "#document-reader",
      cursor: 'move',
      // opacity: 0.35,
      stack: $('#document-reader'),
      scroll: false,
      appendTo: $("#document-reader"),
      start: function(event, ui) {
        startPosition = $(this).position();
      },
      stop: function(event, ui) {
        dragEl        = $(this);
        stopPosition  = dragEl.position();
        document_id   = dragEl.data("document-id");
        signer_id     = dragEl.data("signer-id");
        
        var dropElement = $('.drop .dragMe');
        
      	for(i = 0; i < dropElement.length + 1; i++){
      		
    	$(dropElement[i]).find( ".field111" ).css( "font-size", ( $(dropElement[i]).width()-45) + "%" );
       	$(dropElement[i]).find(".field111_stamp").css( "font-size", ( $(dropElement[i]).width()/20-3) + "px" ); 
       	$(dropElement[i]).find(".span1").css( "font-size", ( $(dropElement[i]).width()/20-10) + "px" );
       	$(dropElement[i]).find(".span2").css( "font-size", ( $(dropElement[i]).width()/20) + "px" );
       	$(dropElement[i]).find(".span3").css( "font-size", ( $(dropElement[i]).width()/20-10) + "px" );
       	$(dropElement[i]).find(".stamp").attr( "data-fontsize", ( $(dropElement[i]).width()/20) + "px" );
      	}
        

        if(!dragEl.hasClass("parent")){
         // updateDraggedPosition(dragEl, stopPosition, document_id, signer_id)
        }
      }
    });
    $(".drop .dragMe").resizable({        
      //  animate: true,
        //aspectRatio: 16 / 9,
         containment: "#document-reader .drop",
       // stack: $('#document-reader'),
        handles: "se",
       // helper: "ui-resizable-helper",
        //handles: "n, e, s, w, nw, ne, sw,se"
        	 resize: function(event, ui)
        	 {	
        			var resizeId = $(this).find('.drop-select').attr('id');
        			
        			$("#"+resizeId).find( ".field111" ).css( "font-size", ( $("#"+resizeId).width()-50) + "%" );
        			$("#"+resizeId).find(".field111_stamp").css( "font-size", ( $("#"+resizeId).width()/20-3) + "px" );
        			$("#"+resizeId).find(".span1").css( "font-size", ( $("#"+resizeId).width()/20 - 10) + "px" );
        			$("#"+resizeId).find(".span2").css( "font-size", ( $("#"+resizeId).width()/20 ) + "px" );
        			$("#"+resizeId).find(".span3").css( "font-size", ( $("#"+resizeId).width()/20 - 10) + "px" );
        			
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
        //console.log(dragged_signer_id);
        //console.log(dragEl);
        dragEl.data("id", dragged_signer_id);
      }
    })
  }
  

/*   jQuery.validator.addMethod("multiemail", function (value, element) {
	    if (this.optional(element)) {
	        return true;
	    }
	    var emails = value.split(','),
	        valid = /^(([^<>(){}[\]\\.,;:\s@\"]+(\.[^<>(){}[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	    for (var i = 0, limit = emails.length; i < limit; i++) {
	        value = emails[i];
	        valid = valid && jQuery.validator.methods.email.call(this, value, element);
	    }
	    return valid;
	}, "<spring:message code="label.sep_comma"/> <spring:message code="label.validEmail_msgrequired"/>"); */
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
	         //console.log("Hello"+ reg.test(value)); 
	     }
	     return valid;
	}, "<spring:message code="label.emailValidationText"/>");
///	}, "<spring:message code="label.sep_comma"/> <spring:message code="label.validEmail_msgrequired"/>");

var step4Form=$("#step3-form").validate({
	//specify the validation rules
	errorElement: 'p',
    errorClass: 'error',
	rules: {
		subject : {
			required : true,
			checkempty : true
		
		},
		message:"required",
		cc:{
			//emailcheck:true,
    		 multiemail:true,
		}
	},
	//specify validation error messages
	messages: {
		subject: "<spring:message code="label.slf_subval"/>",
		message: "<spring:message code="label.slf_msgval"/>",
		cc:{
   		 required: "<spring:message code="label.email_msgrequired"/>"
   	}
	}
});

jQuery.validator.addMethod("checkempty", function(value) {
	return $.trim( value );
	}, "<spring:message code="label.emptyfld"/>"); 
/* function validateSigners(){
	var jsonArray = [];
	var totalRows=parseInt($("#total-row").val());
	for(var i=0; i<totalRows; i++) {
	  	var item = {};
	    if($("#signername"+i).val() !=undefined && $("#signeremail"+i).val() !=undefined  ){
		    item ["signerValidName"] = $("#signervalidname"+i).attr('id');
		    item ["signerValidEmail"] =$("#signervalidemail"+i).attr('id');
	 	 	item ["signerName"] =$("#signername"+i).val();
			item ["signerEmail"] =$("#signeremail"+i).val();
		jsonArray.push(item);
	    }
	 } 
	

	 $.each(jsonArray, function( key, value ) {
		 
		 if(value.signerName == ""){
			 $("#"+value.signerValidName).show();
		 }else{
			 $("#"+value.signerValidName).hide();
		 }
	     if (validateEmail(value.signerEmail)) {
	    	 $("#"+value.signerValidEmail).hide();
		 } else {
			 $("#"+value.signerValidEmail).show();
		 }
	     
	     if(value.signerName !="" && validateEmail(value.signerEmail)){
	    	 enableButton=1;
	     }else{
	    	 enableButton=0;
	     }
	     $("#enableButton").val(enableButton);
	 });
	 if($("#enableButton").val() == 1){
		 $("#save_next_2").removeAttr('disabled');	 
	 }else{
		 $("#save_next_2").attr('disabled','disabled');
	 }
	 
	 saveSignerList();
	 
} */

function validateSigners(){
	
	var isValid = true;
	 saveSignerList();
	if (isValid == false){ 
	 	$("#save_next_2").attr('disabled','disabled');
	}
	else{ 
		$("#save_next_2").removeAttr('disabled');
		// $("#steplist2").addClass('disabled');
	}
}
/* function checkExistEmail(value){
	var unique_values = {};
	var list_of_values = [];
	$('input[name$="signeremail"]').
	    each(function(item) { 
	        if ( ! unique_values[value] ) {
	            unique_values[value] = true;
	            list_of_values.push(value);
	        } else {
	            return false;
	        }
	    });
} */
function findDuplicates() {
    var isDuplicate = false;
    $("input[name^='signeremail']").each(function (i,el1) {
    	 var current_val = $(el1).val();
	    $('[name="signeremail"]').not(this).each(function(i,el2){
			 if($(el2).val().toLowerCase() == current_val.toLowerCase()) {
				 isDuplicate = true;
	             return;
			 }
		  }) 
    });
    if (isDuplicate) {
        //alert ("Duplicate values found.");
        return false;
    } else {
        return true;
    }
}
function validateEmail(email) {
	  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	  return re.test(email);
	}
	
function saveGroupSign(){
	//updateDiv();
	//Start issue resolve 1220
	editorText = CKEDITOR.instances.message.getData();
    val = $(editorText).text().trim();
    editortext_validation =CKEDITOR.instances.message.getData().length;
    if( editortext_validation != 0 ) { 
			$("#ckeditor_error").css("display","none");     
	      }
	 if(editortext_validation == 0 ){
		 $("#ckeditor_error").css("display","block");
		 valid = $("#step3-form").valid();   // issue resolve 1220
		 e.preventDefault();
	 }else{
		 valid = $("#step3-form").valid(); 
	 }    
	 if(val==0){
		 $("#ckeditor_error").css("display","block");
		 e.preventDefault();
	 }
	//End issue resolve 1220
	//var valid = $("#step3-form").valid();
	 if(valid == true){
		    var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath=$("#contextPath").val();
			var generatorLength=$("#generator").val();
			var docId=$("#docId").val();
			var draftId=$("#draftId").val();
			var fileName=$(".file-upload-input").val();
			var subject=$("#subject").val();
			var message=editorText;
			var cc=$("#cc").val();
			var ckbox = $('#checkbox2');
			var pageHeight=$("#pageHeight").val();
			var numpages=$("#numpages").val();
			var isActivePriority;
			 if (ckbox.is(':checked')) {
		        // alert('You have Checked it');
				 isActivePriority="active";
			 } else {
		        // alert('You Un-Checked it');
		    	 isActivePriority="inactive";
		     }
			var jsonArray = [];
			for(var i=1; i<generatorLength; i++) {
				var item = {};
				var sitem = {};
				//vvv new //vvv21Jan2021
				var fieldType=$("#field"+i).attr("data-signer");
				if(fieldType !=null && fieldType !=undefined){
				if(fieldType == "name"){
				item ['docId'] = docId;
				item ['draftId'] = draftId;
				item ['documentName'] = fileName;
				item ['top'] =$("#field"+i).attr("data-top");
				item ['left'] = $("#field"+i).attr("data-left");
				item ['fieldType'] = "text";
				item ['fieldName'] = $("#field"+i).attr("data-signer");
				item ['priority'] = $("#fieldpriorityvalue"+i).val();
				item ['signerName'] = $("#fieldvalue"+i).val();
				item ['signerEmail'] = $("#fieldemailvalue"+i).val();
				/* item ['fieldWidth']= "150";
				item ['fieldHeight']= "50"; */
				//if($("#drop-select"+i).width() == "0"){
				if($("#drop-select"+i).parent().width() == "0"){
				item ['fieldWidth']= "170";
				item ['fieldHeight']= "60";
				}else{
				item ['fieldWidth']= $("#drop-select"+i).parent().width(); 
				item ['fieldHeight']= $("#drop-select"+i).parent().height();
				}
				if((parseFloat($("#drop-select"+i).parent().width()) < 130)){
					item ['fieldWidth']= 130; 
				}
				if((parseFloat($("#drop-select"+i).parent().height()) < 40)){
					item ['fieldHeight']= 40;
				}
				if((parseFloat($("#drop-select"+i).parent().width()) > 325)){
					item ['fieldWidth']= 325; 
				}
				if((parseFloat($("#drop-select"+i).parent().height()) > 120)){
					item ['fieldHeight']= 120;
				}
				item ['pageHeight']= pageHeight;
				item ['numpages']= numpages;
				item ['subject'] = subject;  
				item ['message'] = message;
				 
				item ['cc'] = cc;
				item ['isActivePriority'] = isActivePriority;
				item ['pageNumber']= $("#field"+i).attr("data-pagenumber");
				item ['fieldValue'] = $("#fieldvalue"+i).val();
				//item ['mailflag'] = mailflag;
				//console.log('font-size : ', $("#field111"+i).css("font-size"));
				item['fontSize'] = $("#field111"+i).css("font-size");
				//changes for taking Font size 10/05/21
				//item['fontSize'] = $("#field"+i).attr("data-fontSize");
				//vvv21Jan2021
				}else if(fieldType == "date"){
				item ['docId'] = docId;
				item ['draftId'] = draftId;
				item ['documentName'] = fileName;
				item ['top'] =$("#field"+i).attr("data-top");
				item ['left'] = $("#field"+i).attr("data-left");
				item ['fieldType'] = "date";
				item ['fieldName'] = $("#field"+i).attr("data-signer");
				item ['priority'] = $("#fieldpriorityvalue"+i).val();
				item ['signerName'] = $("#fieldvalue"+i).val();
				item ['signerEmail'] = $("#fieldemailvalue"+i).val();
				/* item ['fieldWidth']= "150";
				item ['fieldHeight']= "50"; */
				//if($("#drop-select"+i).width() == "0"){
				if($("#drop-select"+i).parent().width() == "0"){
				item ['fieldWidth']= "170";
				item ['fieldHeight']= "60";
				}else{
				item ['fieldWidth']= $("#drop-select"+i).parent().width(); 
				item ['fieldHeight']= $("#drop-select"+i).parent().height();
				}
				if((parseFloat($("#drop-select"+i).parent().width()) < 130)){
					item ['fieldWidth']= 130; 
				}
				if((parseFloat($("#drop-select"+i).parent().height()) < 40)){
					item ['fieldHeight']= 40;
				}
				if((parseFloat($("#drop-select"+i).parent().width()) > 325)){
					item ['fieldWidth']= 325; 
				}
				if((parseFloat($("#drop-select"+i).parent().height()) > 120)){
					item ['fieldHeight']= 120;
				}
				item ['pageHeight']= pageHeight;
				item ['numpages']= numpages;
				item ['subject'] = subject;  
				item ['message'] = message;
				item ['cc'] = cc;
				 
				item ['isActivePriority'] = isActivePriority;
				item ['pageNumber']= $("#field"+i).attr("data-pagenumber");
				//item ['mailflag'] = mailflag;
				item['fontSize'] = $("#field111"+i).css("font-size");
				//console.log('date font-size : ', $("#field111"+i).css("font-size"));
				//changes for taking Font size 10/05/21
				//item['fontSize'] = $("#field"+i).attr("data-fontSize");
				//vvv21Jan2021
				}else if(fieldType == "signature"){
				item ['docId'] = docId;
				item ['draftId'] = draftId;
				item ['documentName'] = fileName;
				item ['top'] =$("#field"+i).attr("data-top");
				item ['left'] = $("#field"+i).attr("data-left");
				item ['fieldType'] = "image";
				item ['fieldName'] = $("#field"+i).attr("data-signer");
				item ['priority'] = $("#fieldpriorityvalue"+i).val();
				item ['signerName'] = $("#fieldvalue"+i).val();
				item ['signerEmail'] = $("#fieldemailvalue"+i).val();
				//  item ['fieldWidth']= "150"; //$("#field"+i).data("data-width");  //"150";
				//  item ['fieldHeight']="50"; //$("#field"+i).data("data-height");  // "50";
				//if($("#field"+i).width() == "0"){
				if($("#drop-select"+i).parent().width() == "0"){
				item ['fieldWidth']= "170";
				item ['fieldHeight']= "60";
				}else{
				//item ['fieldWidth']= $("#field"+i).width(); 
				//item ['fieldHeight']= $("#field"+i).height();
					if($("#mySpanImg"+i).attr("data-stamp") == "data-digitalStamp"){
						item ['fieldWidth']= (parseFloat($("#drop-select"+i).parent().width()) / 2);
					}else{
						item ['fieldWidth']= (parseFloat($("#drop-select"+i).parent().width()));
					}				 
				item ['fieldHeight']= (parseFloat($("#drop-select"+i).parent().height()));
				}
				if((parseFloat($("#drop-select"+i).parent().width()) < 130) && $("#mySpanImg"+i).attr("data-stamp") != "data-digitalStamp"){
					item ['fieldWidth']= 130;
				}else if((parseFloat($("#drop-select"+i).parent().width()) < 325) && $("#mySpanImg"+i).attr("data-stamp") == "data-digitalStamp"){
					item ['fieldWidth']= 162.5;
				}
				if((parseFloat($("#drop-select"+i).parent().height()) < 40) && $("#mySpanImg"+i).attr("data-stamp") != "data-digitalStamp"){
					item ['fieldHeight']= 40; 
				}else if((parseFloat($("#drop-select"+i).parent().height()) < 60) && $("#mySpanImg"+i).attr("data-stamp") == "data-digitalStamp"){			
					item ['fieldHeight']= 60; 
				}
				if((parseFloat($("#drop-select"+i).parent().width()) > 325) && $("#mySpanImg"+i).attr("data-stamp") != "data-digitalStamp"){
					item ['fieldWidth']= 325;
				}else if((parseFloat($("#drop-select"+i).parent().width()) > 500) && $("#mySpanImg"+i).attr("data-stamp") == "data-digitalStamp"){
					item ['fieldWidth']= 250;
				}
				if((parseFloat($("#drop-select"+i).parent().height()) > 120) && $("#mySpanImg"+i).attr("data-stamp") != "data-digitalStamp"){
					item ['fieldHeight']= 120; 
				}else if((parseFloat($("#drop-select"+i).parent().height()) > 90) && $("#mySpanImg"+i).attr("data-stamp") == "data-digitalStamp"){			
					item ['fieldHeight']= 90; 
				}

				item ['pageHeight']= pageHeight;
				item ['numpages']= numpages;
				item ['subject'] = subject;  
				item ['message'] = message;
				item ['cc'] = cc;
				item ['isActivePriority'] = isActivePriority;
				item ['pageNumber']= $("#field"+i).attr("data-pagenumber");
				//item ['mailflag'] = mailflag;
				//item['fontSize'] = $("#mySpanImg"+i).attr("data-fontSize");
				//vvv21Jan2021 check  font size
				//===============vishakha vvv21Jan2021=====================================================================//
				 
				var signTop = $("#field"+i).attr("data-top");
				//var signHeight=$("#field"+i).data("data-height"); 
				var signleft=$("#field"+i).attr("data-left");
				var signWidth= item['fieldWidth'];
				var stampleft=$("#mySpanImg"+i).attr("data-left");
				var stampleftAns =parseFloat(signleft)+parseFloat(stampleft);
				//alert("signWidth:"+signWidth);
				/* console.log("vSign:top:"+$("#field"+i).data("data-top"));
				console.log("vSign:left:"+$("#field"+i).data("data-left"));
				console.log("vSign:width:"+$("#field"+i).data("data-width"));
				console.log("vSign:height:"+$("#field"+i).data("data-height")); */
				//"data-digitalStamp"
				if($("#mySpanImg"+i).attr("data-stamp") == "data-digitalStamp" ){
				sitem ['docId'] = docId;
				sitem ['draftId'] = draftId;
				sitem ['documentName'] = fileName;
				sitem ['top'] = signTop;   ///$("#mySpanImg"+i).data("data-top");
				sitem ['left'] = stampleftAns;
				sitem ['fieldType'] = "image";
				sitem ['fieldName'] = $("#mySpanImg"+i).attr("data-stamp");
				//data-digitalStamp
				sitem ['priority'] = $("#fieldpriorityvalue"+i).val();
				sitem ['signerName'] = $("#fieldvalue"+i).val();
				sitem ['signerEmail'] = $("#fieldemailvalue"+i).val();
				//  sitem ['fieldWidth']= "150"; // $("#mySpanImg"+i).data("data-width");//"150";
				//  sitem ['fieldHeight']= "50";  // $("#mySpanImg"+i).data("data-height"); //"50";
				//alert(" stamp--width:"+$("#field"+i).width()+"----height:"+$("#field"+i).height());
				//if($("#field"+i).width() == "0"){
				if($("#drop-select"+i).parent().width() == "0"){
				//alert("if stamp--width:"+$("#field"+i).width()+"----height:"+$("#field"+i).height());
				sitem ['fieldWidth']= "170";
				sitem ['fieldHeight']= "60";
				}else{
				//alert("else stamp--width:"+$("#field"+i).width()+"----height:"+$("#field"+i).height());
				//sitem ['fieldWidth']=  $("#field"+i).width(); 
				//sitem ['fieldHeight']= $("#field"+i).height();
				sitem ['fieldWidth']= (parseFloat($("#drop-select"+i).parent().width()) / 2); 
				sitem ['fieldHeight']= (parseFloat($("#drop-select"+i).parent().height()));
				//alert('fieldWidth :'+ $("#drop-select"+i).parent().width());
				//alert('fieldHeight :'+ (parseFloat($("#drop-select"+i).parent().height())+10));
				}
				if((parseFloat($("#drop-select"+i).parent().width()) < 325)){
					sitem ['fieldWidth']= 162.5; 
				}
				if((parseFloat($("#drop-select"+i).parent().height()) < 60)){
					sitem ['fieldHeight']= 60;
				}
				if((parseFloat($("#drop-select"+i).parent().width()) > 500)){
					sitem ['fieldWidth']= 250; 
					}
				if((parseFloat($("#drop-select"+i).parent().height()) > 90)){
					sitem ['fieldHeight']= 90;
				}
				sitem ['pageHeight']= pageHeight;
				sitem ['numpages']= numpages;
				sitem ['subject'] = subject;  
				sitem ['message'] = message;
				sitem ['cc'] = cc;
				sitem ['isActivePriority'] = isActivePriority;
				sitem ['pageNumber']= $("#field"+i).attr("data-pagenumber");
				//sitem ['mailflag'] = mailflag;
				sitem['fontSize'] = $("#mySpanImg"+i).attr("data-fontSize");
				console.log('stamp font-size : ', $("#mySpanImg"+i).css("data-fontSize"));
				//vvv21Jan2021
				jsonArray.push(sitem);
				/* console.log("vStamp dataTop:"+$("#mySpanImg"+i).data("data-top")); //  yes change you atribute
				        console.log("vStamp dataLeft:"+$("#mySpanImg"+i).data("data-left")); //  yes change you atribute
				        console.log("vStamp dataWidth:"+$("#mySpanImg"+i).data("data-width")); //  yes change you atribute
				        console.log("vStamp dataHeight:"+$("#mySpanImg"+i).data("data-height")); //  yes change you atribute */
				    
				}
				//===============vishakha vvv21Jan2021=====================================================================//
				 
				}else if(fieldType == "textbox"){
				item ['docId'] = docId;
				item ['draftId'] = draftId;
				item ['documentName'] = fileName;
				item ['top'] =$("#field"+i).attr("data-top");
				item ['left'] = $("#field"+i).attr("data-left");
				item ['fieldType'] = "text";
				item ['fieldName'] = $("#field"+i).attr("data-signer");
				item ['priority'] = $("#fieldpriorityvalue"+i).val();
				item ['signerName'] = $("#fieldvalue"+i).val();
				item ['signerEmail'] = $("#fieldemailvalue"+i).val();
				//  item ['fieldWidth']= "150";
				//  item ['fieldHeight']= "50";
				//if($("#drop-select"+i).width() == "0"){
				if($("#drop-select"+i).parent().width() == "0"){
				item ['fieldWidth']= "170";
				item ['fieldHeight']= "60";
				}else{
				item ['fieldWidth']= $("#drop-select"+i).parent().width(); 
				item ['fieldHeight']= $("#drop-select"+i).parent().height();
				}
				if((parseFloat($("#drop-select"+i).parent().width()) < 130)){
					item ['fieldWidth']= 130; 
				}
				if((parseFloat($("#drop-select"+i).parent().height()) < 40)){
					item ['fieldHeight']= 40;
				}
				if((parseFloat($("#drop-select"+i).parent().width()) > 325)){
					item ['fieldWidth']= 325; 
				}
				if((parseFloat($("#drop-select"+i).parent().height()) > 120)){
					item ['fieldHeight']= 120;
				}
				item ['pageHeight']= pageHeight;
				item ['numpages']= numpages;
				item ['subject'] = subject;  
				item ['message'] = message;
				item ['cc'] = cc;
				 
				item ['isActivePriority'] = isActivePriority;
				item ['pageNumber']= $("#field"+i).attr("data-pagenumber");
				//item ['mailflag'] = mailflag;
				item['fontSize'] = $("#field111"+i).css("font-size");
				//console.log('text font-size : ', $("#field111"+i).css("font-size"));
				//changes for taking Font size 10/05/21
				//item['fontSize'] = $("#field"+i).attr("data-fontSize");
				//vvv21Jan2021
				}else if(fieldType == "checkbox"){
				item ['docId'] = docId;
				item ['draftId'] = draftId;
				item ['documentName'] = fileName;
				item ['top'] =$("#field"+i).attr("data-top");
				item ['left'] = $("#field"+i).attr("data-left");
				item ['fieldType'] = "image";
				item ['fieldName'] = $("#field"+i).attr("data-signer");
				item ['priority'] = $("#fieldpriorityvalue"+i).val();
				item ['signerName'] = $("#fieldvalue"+i).val();
				item ['signerEmail'] = $("#fieldemailvalue"+i).val();
				/* item ['fieldWidth']= "150";
				item ['fieldHeight']= "50"; */
				//if($("#drop-select"+i).width() == "0"){
				if($("#drop-select"+i).parent().width() == "0"){
				item ['fieldWidth']= "170";
				item ['fieldHeight']= "60";
				}else{
				item ['fieldWidth']= $("#drop-select"+i).parent().width(); 
				item ['fieldHeight']= $("#drop-select"+i).parent().height();
				}
				if((parseFloat($("#drop-select"+i).parent().width()) < 130)){
					item ['fieldWidth']= 130; 
				}
				if((parseFloat($("#drop-select"+i).parent().height()) < 40)){
					item ['fieldHeight']= 40;
				}
				if((parseFloat($("#drop-select"+i).parent().width()) > 325)){
					item ['fieldWidth']= 325; 
				}
				if((parseFloat($("#drop-select"+i).parent().height()) > 120)){
					item ['fieldHeight']= 120;
				}
				item ['pageHeight']= pageHeight;
				item ['numpages']= numpages;
				item ['subject'] = subject;  
				item ['message'] = message;
				item ['cc'] = cc;
				item ['isActivePriority'] = isActivePriority;
				item ['pageNumber']= $("#field"+i).attr("data-pagenumber");
				//item ['mailflag'] = mailflag;
				item['fontSize'] = $("#field"+i).attr("data-fontSize");
				//vvv21Jan2021
				}else if(fieldType == "initials"){
				item ['docId'] = docId;
				item ['draftId'] = draftId;
				item ['documentName'] = fileName;
				item ['top'] =$("#field"+i).attr("data-top");
				item ['left'] = $("#field"+i).attr("data-left");
				item ['fieldType'] = "text";
				item ['fieldName'] = $("#field"+i).attr("data-signer");
				item ['priority'] = $("#fieldpriorityvalue"+i).val();
				item ['signerName'] = $("#fieldvalue"+i).val();
				item ['signerEmail'] = $("#fieldemailvalue"+i).val();
				/* item ['fieldWidth']= "150";
				item ['fieldHeight']= "50"; */
				//if($("#drop-select"+i).width() == "0"){
				if($("#drop-select"+i).parent().width() == "0"){
				item ['fieldWidth']= "170";
				item ['fieldHeight']= "60";
				}else{
				item ['fieldWidth']= $("#drop-select"+i).parent().width(); 
				item ['fieldHeight']= $("#drop-select"+i).parent().height();
				}
				if((parseFloat($("#drop-select"+i).parent().width()) < 130)){
					item ['fieldWidth']= 130; 
				}
				if((parseFloat($("#drop-select"+i).parent().height()) < 40)){
					item ['fieldHeight']= 40;
				}
				if((parseFloat($("#drop-select"+i).parent().width()) > 325)){
					item ['fieldWidth']= 325; 
				}
				if((parseFloat($("#drop-select"+i).parent().height()) > 120)){
					item ['fieldHeight']= 120;
				}
				item ['pageHeight']= pageHeight;
				item ['numpages']= numpages;
				item ['subject'] = subject;  
				item ['message'] = message;
				item ['cc'] = cc;
				item ['isActivePriority'] = isActivePriority;
				item ['pageNumber']= $("#field"+i).attr("data-pagenumber");
				//item ['mailflag'] = mailflag;
				item['fontSize'] = $("#field111"+i).css("font-size");
				//changes for taking Font size 10/05/21

				//item['fontSize'] = $("#field"+i).attr("data-fontSize");
				//vvv21Jan2021
				}
				jsonArray.push(item);
				}
				}
			var btn='#send';
				$.ajax({
					type : "POST",
					url : contextPath+"app/saveGroupSign",
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
			        	if(response == 'success'){
			        		//alert("success");
			        		$("#show-groupsign-steps").show();
			        		$("#success-group-messgae").show();
			        		$('.overlaywhite_bg').show();
			        	}else{
			            	alert('failed');
			            }
					},
					 error : function(e) {  
					    alert('Error: ' + e);   
					}  
				 });
           }
	 }
	
function qualityImprove(val){
	//alert('click');
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var contextPath=$("#contextPath").val();
	var fileId = $("#docId").val();
	var fileName = fnm;
	var numpages = $("#numpages").val();
	pdfInfo = pdfInfo2;
	
	 var $scrollerOuter  = $( '.mCustomScrollbar' );
	    var $dragger        = $scrollerOuter.find( '.mCSB_dragger' );
	    var scrollHeight    = $scrollerOuter.find( '.mCSB_container' ).height();
	    var draggerTop      = $dragger.position().top;
	    var scrollTop = draggerTop / ($scrollerOuter.height() - $dragger.height()) * (scrollHeight - $scrollerOuter.height());
		var i = calculatePageNo(pdfInfo.heights, scrollTop);
		
	$.ajax({
		
		type : "GET",
		url : contextPath+'imgQuality?fileid='+fileId+'&filename='+fileName+'&page='+i+'&numpages='+numpages,
		//async: false,
		
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
			$("#loader2").show();
		},
		complete : function() {
			//$("#signupbtn").buttonLoader('stop');
			$("#loader2").hide();
		},
		success : function(response) {
			var  imgSrc=appURL+"/docimages/"+fileId+"/"+i+"_enhance.png";
			$('#'+i).replaceWith( '<div class="drop" id="'+i+'"><img width="'+ pdfInfo.widths[i - 1] +'px" height="' + pdfInfo.heights[i - 1] + 'px" class="render-image" onload="loadImage()" src='+imgSrc+'></div>' );
		
		DragSigner();
	    DragMe();

		signerEmailList();
		},
		error : function(response) {
			
		},
	});
	
	
    
}	


$(document).ready(function(){
	var title='${title}';
	if(title=='Template'){
		$("#documentSidebar").removeClass('active');
		$("#templateSidebar").addClass('active');
	}
});


	
</script>