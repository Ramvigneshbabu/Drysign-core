<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% String appUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath(); %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title>${title}| DrySign</title>

<!-- Bootstrap -->
<link href="<%=appUrl %>/css/bootstrap.css" rel="stylesheet">
<link href="<%=appUrl%>/css/signaturepad.css" rel="stylesheet">
<style>
canvas {
	position: relative;
	/*margin: 1px;
	margin-left: 0px;*/
	border: 3px solid #2C3D4F;
	/*border-radius: 3px;
	width: 100%;*/
}
.selected {
    box-shadow: 9px 11px 28px -12px #080808;
}

.btn-bs-file{
    position:relative;
}
.btn-bs-file input[type="file"]{
    position: absolute;
    top: -9999999;
    filter: alpha(opacity=0);
    opacity: 0;
    width:0;
    height:0;
    outline: none;
    cursor: inherit;
}


.btn-blue {
    background-color: #0191e9;
    min-width: 89px;
    color: #fff;
    font-weight: bold;
    font-size: 14px !important;
    padding: 5px 10px !important;
    letter-spacing: 1px;
}
#myModal{
    z-index: 1;
}
.fade{
 z-index: 0;
}
</style>
</head>
<body>
<input type="hidden" id="contextPath" value="<%=appUrl %>/"/>
<%-- <input type="hidden" id="usertoken" value="<%= request.getParameter("token") %>"/> --%>

	<!-- Modal -->
	<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content" id="invalid_link" style="display:none">
				<div class="modal-header" style="background: #00b497;height: 94px;">
					<!--  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
					<!-- Nav tabs -->
					 <div class="text-left"><!-- <a href="index"> -->
					 <a href="<%=appUrl %>">
					 <img src="<%=appUrl %>/images/1.0/logo_inner.png" alt="Logo" class="iMg" title="Logo"/></a><br><br></div>
					</div>
					<div class="modal-body">
					<div class="alert alert-warning" role="alert" id="invalid_message"></div>				
					</div>
				
				
			  <%-- <div class="text-left"><a href="index"><img src="<%=appUrl %>/images/logo_inner.png" alt="Logo" class="iMg" title="Logo"/></a><br><br></div>
					
				 <div class="row">
				 <div class="col-xs-12">
				<div class="alert alert-warning" role="alert" id="invalid_message"></div>
				</div></div> --%>
			</div>
			<div class="modal-content" id="valid_link" style="display:none">
				<div class="modal-header" style="background: #337ab7;height: 94px;">
					<!--  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
					<!-- Nav tabs -->
					 <div class="text-left"> <!-- <a href="index"> -->
					 <a href="<%=appUrl %>">
					 <img src="<%=appUrl %>/images/1.0/logo_inner.png" alt="Logo" class="iMg" title="Logo"/></a><br><br></div>
					

				</div>
				<div class="modal-body">
				<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#draw"
							aria-controls="draw" role="tab" data-toggle="tab"><spring:message code="label.draw"/></a></li>
						<li role="presentation"><a href="#type" aria-controls="type"
							role="tab" data-toggle="tab"><spring:message code="label.type1"/></a></li>
						<li role="presentation"><a href="#upload" aria-controls="upload"
							role="tab" data-toggle="tab"><spring:message code="label.upload"/></a></li>	
						<li role="presentation"><a href="#mysignature"
							aria-controls="mysignature" role="tab" data-toggle="tab"><spring:message code="label.saved"/></a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content" style="padding:15px">
						<div role="tabpanel" class="tab-pane active" id="draw">
						  <div class="row">
							<div class="col-xs-12">
						  		<a class=""  href="" id="clearSignaturepad"><spring:message code="label.clear"/></a>
						   	 </div>
						   	 <div class="col-xs-12">
						<div class="wrapperpad" style="background-color: #fcfcfc">
							<canvas id="signaturepad" class="signature-pad" width=320 height=200>
							</canvas>
						</div>
					 		</div>
					 		<div class="col-xs-10 text-left">
									<div class="alert alert-success" id="signature-sucess-draw" style="display:none">
							      
									</div>
									<div class="alert alert-danger" id="drawsignature_error"  style="display:none">
					      				
									</div>
					  		</div>
					 		<div class="col-xs-2 text-right">
					 			<button type="button" class="btn btn_fullwidth font-18" style="background: #C75000; color: #fff;" id="saveSignaturepad" ><spring:message code="label.save"/></button>
					 		</div>
					 		
					 	   </div>	
						</div>
						<div role="tabpanel" class="tab-pane" id="type">
							<div class="row">
								  <div class="col-xs-12">
								  <spring:message code="label.yourName"/> <input type="text" maxlength=36 id="typeName" value="<c:out value="${firstName}"></c:out> <c:out value="${lastName}"></c:out>"/>
								  <br><br>
								  </div>
								  
								<div class="col-xs-12" id="showType">
								</div>
								<div class="col-xs-10 text-left">
									<div class="alert alert-success" id="signature-sucess-type" style="display:none">
							      
									</div>
									<div class="alert alert-danger" id="signature-type-error" style="display:none">
						      
									</div>
								</div>
								<div class="col-xs-2 text-right">
									<button type="button" class="btn btn_fullwidth font-18" style="background: #C75000; color: #fff;" onclick="saveSignature('type')"><spring:message code="label.save"/></button>
								</div>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane" id="upload">
							
							<div class="row">
								 <div class="col-md-12 text-right">
					 		  	 <a class="text-red" id="clearId" style="display:none" href="#" onclick="clearUploadSignature();"><spring:message code="label.clear"/></a>
								  
					  		</div>  
							</div>
							<div class="row" id="show_upload_signature">
							   <div class="col-md-12 text-center">
							   	
							   	<spring:message code="label.uploadPicture"/>
							  
							   </div>
							    	<br> 	<br>
								  <div class="col-md-12 text-center">
								  	<div id="upload_signature">
										<form id="form1" >
										   <label class="btn-bs-file btn btn-lg btn-blue">
			                					<i class="fa fa-upload" aria-hidden="true"></i><spring:message code="label.upload"/>
			                				<input type='file' id="imgInp" class="demoInputBox"  accept=".png, .jpg, .jpeg, .bmp"/>
			            					</label>
										   
										 
										</form>
									
									</div>
									
								 </div>
								 	
								  <div class="col-md-12 text-center">
								  <button data-toggle="tooltip" class="red-tooltip" data-placement="top" title="Google Drive" type="submit" class="" id="pick1"style="border: 0;background: transparent;right: -20px; padding: 0; margin: 0;height: 36px;top: 8px;">
								<img src="<%=appUrl %>/images/photo.jpg" width="30" height="30" alt="submit" />
								</button>
								<button data-toggle="tooltip" class="red-tooltip" data-placement="top" title="OneDrive" type="submit" class="" id="onedrive" onclick="launchOneDrivePicker()" style="border: 0;background: transparent;right: -90px; padding: 0; margin: 0;height: 36px;top: 8px;">
								<img src="<%=appUrl %>/images/onedrive.png" width="30" height="30" alt="submit" />
								</button>
								<button data-toggle="tooltip" class="red-tooltip" data-placement="top" title="Dropbox" type="submit" class="" id="dropbox1"style="border: 0;background: transparent;right: -50px; padding: 0; margin: 0;height: 36px;top: 8px;">
								<img src="<%=appUrl %>/images/dropbox.png" width="25" height="25" alt="submit" />
								</button>
						       <!--  <button onclick="return popitupEgnytePic('app/document/egnyteSign')" data-toggle="tooltip" class="red-tooltip" data-placement="top" title="egnyte" type="submit" class="" id="egnyte" style="border: 0;background: transparent;right: -128px; padding: 0; margin: 0;height: 36px;top: 8px;">
									<img src="<%=appUrl %>/images/egnyte.png" width="20" height="20" alt="submit" />
								</button> -->
								  <br><br>
							   		<p class="text-warning" ><spring:message code="label.fileSize"/></p>
							   		<p class="text-warning"><spring:message code="label.fileFormat"/></p>
							   	</div>
							</div>
							<div class="row" id="show_upload_error_signature">
					  			<div class="alert alert-danger"  id="file_error" style="display:none"></div>
								 </div>
							<div class="row" id="show_upload_yoursignature" style="display:none"> 		 
							<div class="col-md-12 text-center" style="height:300px">
								 <img id="blah" src="" class="img-thumbnail" width="750px" height="186px"  alt="" />
							</div>
							
							<div class="col-md-12 text-right">
									<button type="button" class="btn btn-default" style="background: #00BC9C;" onclick="saveSignature('upload')"><spring:message code="label.save"/></button>
							</div>
							<div class="col-xs-10 text-left">
									<div class="alert alert-success" id="signature-sucess-upload" style="display:none">
							      
									</div>
									<div class="alert alert-danger" id="signature-upload-error" style="display:none">
						      
									</div>
								</div>
						</div>	
						</div>
						
						<div role="tabpanel" class="tab-pane" id="mysignature">
						<div class="row">
						<div class="col-xs-12">
							<c:set var="mysignature" value="${userSignature}"/>
							<c:choose> 
					  			<c:when test="${userSignature == null}">
					  				<div class="alert alert-warning" role="alert"><spring:message code="label.signNotSave"/></div>
					  			</c:when>
					  			 <c:otherwise>
					  			 <div class="col-md-6 col-sm-6 col-xs-12 thumb">
					  			 
					  			 <img class="img-responsive" style="padding: 10px 10px 10px 10px;border: 1px solid #dee1e4;" id="showSignature"  src="<c:out value="${userSignature}"></c:out>" />
					  			 
					  			 </div>
					  			 </c:otherwise>
					  		</c:choose>	
							</div>
								<div class="col-xs-6 text-left">
									<!-- <button type="button" class="btn btn-primary" onclick="saveSignature('mysignature')">Save</button> -->
								</div>
								<div class="col-xs-6 text-right">
									<!-- <button type="button" class="btn btn-primary" onclick="saveSignature('mysignature')">Save</button> -->
								</div>
						   </div>
						</div>
					</div>
				</div>
				<!-- <div class="modal-footer">
       
      </div> -->
			</div>
		</div>
			<input  type="text" id="filename" type="text" style="display: none;" >
			<input type="hidden" id="fileId">
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.2/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="<%=appUrl %>/js/bootstrap.min.js"></script>
<%-- 	<script src="<%=appUrl %>/js/signature.js"></script> --%>
  <script src="<%=appUrl %>/js/signaturepad.js"></script>
    <script src="<%=appUrl %>/js/signaturePadLoad.js"></script>
	<script src="<%=appUrl %>/js/jquery.browser.js"></script>
    <script type="text/javascript" src="<%=appUrl %>/js/filepicker.js"></script>
    	<script src="https://www.google.com/jsapi?key=AIzaSyC4z1UzNEEZXpOGf547C0XifZ0HagRx64w"></script>
	<script src="https://apis.google.com/js/client.js?onload=initPicker"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/dompurify/2.0.8/purify.js"></script>
	<script>
    //zkSignature.capture();
    var usertoken='';
    $(document).ready(function () {
    	currentURL = window.location.href;
    	//console.log(currentURL);
       var keyURL = currentURL.split("=");
       usertoken = keyURL[1];
    	var serverResponse='${response}'; 
    	//alert(serverResponse);
    	if(serverResponse == 'error'){
    		$("#invalid_link").show();
    		$("#invalid_message").html('${message}');
    	}else{
    		$("#valid_link").show();
    	}
    		getSigntype();
	    	 $('#myModal').modal({
    		    backdrop: 'static',
    		    keyboard: false  // to prevent closing with Esc button (if you want this too)
    		})
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
    	     url : contextPath+"typeSignature1",   
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
    	     error : function(e) {  
    	      alert('Error: gettypesign');   
    	      console.log("ERROR : ", JSON.stringify(e));
    	     }  
    	 });  
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
   			     url : contextPath+"typeSignature1?imgType="+typeValue,  
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
   			     error : function(e) {  
   			     	 alert('Error: typesign' );   
   			      console.log("ERROR : ", JSON.stringify(e));
   			     }  
   			    });  
   });
    
    function saveSignature(type){
    	var signature="";
    	var status="";
    	if(type =='mysignature'){
    		signature=$('#showSignature').attr('src');
    	}
		if(type =='draw'){
			var canvas = document.getElementById("signaturepad");
			var dataURL = canvas.toDataURL("image/png",1);
			//console.log(dataURL);
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
				status="error"
				$("#drawsignature_error").empty();
				$("#drawsignature_error").show();
				$("#drawsignature_error").html('<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>'+'Please draw your signature.').fadeOut(2000);
			}else{
				signature=dataURL;
			}
    	}
		if(type =='type'){
			var sign = $("#myType").val();
			var typeSign=$("#typeName").val();
			var check=validationSignature1(sign,typeSign,"type");
			if(check ==true){
				signature=sign;
			}else{
				status="error";
			}
    	}if(type =='upload'){
    		var sign=$('#blah').attr('src');
    		signature=sign;
    	}
		if(status !="error"){
	//	var usertoken=$("#usertoken").val();
		var id='<c:out value="${id}"></c:out>';
		var email='<c:out value="${email}"></c:out>';
	    var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
		var data = {
				 "id": id,
				 "email":DOMPurify.sanitize(email),
				 "token" : DOMPurify.sanitize(usertoken),
				 "signature" : DOMPurify.sanitize(signature)	
		}
		var xhr = DOMPurify.sanitize(new XMLHttpRequest());

		$.ajax({  
		     type : "POST",   
		     url : contextPath+"saveUserSignature",  
		     dataType: 'json',
		     contentType: "application/json; charset=utf-8",
		     data: JSON.stringify(data),
		     beforeSend : function(<c:out value='xhr'></c:out>) {
		    	 xhr.setRequestHeader(header, token);
		     },
		     success : function(<c:out value='response'></c:out>) {
		    	if(response !="FAILURE" && response !=''){
		    		$("#showSignature").attr('src' , <c:out value='response'></c:out>);
		    		$( "#mysignature" ).load(window.location.href + " #mysignature" );
		    		if(type =='draw'){
		    			$("#signature-sucess-draw").empty();
			    		$("#signature-sucess-draw").show();
			    		$("#signature-sucess-draw").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i>'+'Signature has been saved successfully');	
		        	}
		    		if(type =='type'){
		    			$("#signature-sucess-type").empty();
			    		$("#signature-sucess-type").show();
			    		$("#signature-sucess-type").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i>'+'Signature has been saved successfully');	
		        		
		        	}
		    		if(type =='upload'){
		    			$("#signature-sucess-upload").empty();
			    		$("#signature-sucess-upload").show();
			    		$("#signature-sucess-upload").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i>'+'Signature has been saved successfully');	
		        		
		        	}
		    		
		    	}
		     },  
		     error : function(e) {  
		        alert('Error: savesigntype');   
		    	 console.log("ERROR : ", JSON.stringify(e));
		     }  
		    });  
		}
    }
    
    function getTypeData(key){
    	$("#signature-type-error").hide();
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
    	$("#signature-type-error").html('<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>'+'Please make sure that you have typed your signature and select a font');
    	return false;
    }
    if(typeSign == ""){
    	$("#signature-type-error").show();
    	$("#signature-type-error").html('<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>'+'Please make sure that you have typed your signature');
    	return false;
    }
    if(sign == ""){
    	$("#signature-type-error").show();
    	$("#signature-type-error").html('<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>'+'Please select a font');
    	return false;
    }

    return true;
    }
  

  
   $("#imgInp").change(function() {
    	  readURL(this);
   });
   
   function readURL(input) {
		if (input.files && input.files[0]) {
		    var reader = new FileReader();

		    reader.onload = function(e) {
		    	
		    	var checkFile=filevalidate();
		    	 if(checkFile == true){ 
			    	var token = $("meta[name='_csrf']").attr("content");
			    	var header = $("meta[name='_csrf_header']").attr("content");
			    	var contextPath=$("#contextPath").val();
			    	console.log(e.target.result);
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
				   			$("#loader2").show();
					     },
					     complete: function () {
					    	$("#loader2").hide();
					     },
						 success : function(response) {  
							 $("#show_upload_signature").hide();
							 $("#show_upload_yoursignature").show();
			    	    	 $('#blah').attr('src', 'data:image/jpeg;base64,'+<c:out value='response'></c:out>);	 
			    	    	 $("#clearId").show();
			    	    	 
			    		 },  
			    	     error : function(e) {  
			    	      alert('Error: readURL ' );   
			    	      console.log("ERROR : ", JSON.stringify(e));
			    	     }  
			    	 });  
		    	 }
	    
		    }

		    reader.readAsDataURL(input.files[0]);
		  }
	
	}
   function filevalidate() {
		$("#file_error").html("");
		$(".demoInputBox").css("border-color","#F0F0F0");
		var file_size = $('#imgInp')[0].files[0].size;
		var fileInput = document.getElementById('imgInp');
		var filePath = fileInput.value;
	    var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.bmp)$/i;
	    if(!allowedExtensions.exec(filePath)){
	    	
	    	$("#file_error").show();
	    	$("#file_error").html('<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>'+'Please upload file having extensions .png, jpg, jpeg, bmp only.');
	        fileInput.value = '';
	        return false;
	    }   
	    else if(file_size>10485760) {
			
			$("#file_error").show();
			$("#file_error").html("<spring:message code="label.fileSizeGraterthan10mb"/>").fadeOut(10000);
			$(".demoInputBox").css("border-color","#FF0000");
			return false;
		} 
		return true;
	}
   
 
   
   function clearUploadSignature(){
		
	   $('#blah').attr('src', '');
	    $("#imgInp").val("");
	    $("#show_upload_signature").show();
	    $("#show_upload_yoursignature").hide();
			
	}
 
    </script>
     <script type="text/javascript" src="<%=appUrl %>/js/filepickerapi.js"></script>
	<script>
	 var file = null;
		function initPicker() {
			var picker = new FilePicker({
				apiKey: 'AIzaSyBOIfItfyHfT9DM2vYIPN_XwuD8B2HhLyc',
		          clientId:'927346535684-gkrnjl6o6akimdjse81gp3lb1j79n957.apps.googleusercontent.com',
				buttonEl: document.getElementById('pick1'),
				onSelect: function(file) {
					
					$("#filename").val(file.title);
				//	$(".file-upload-input").val(file.title);
					$("#fileId").val(file.id);
					console.log(file);
					download();
				//	document.getElementById("save").click();
					//alert('Selected File ' + file.title);
					//alert('Selected file Id ' + file.id);
				}
			});	
		}
		
		function download() {
			var fileId = $("#fileId").val();
			var fileName = $("#filename").val();
			var byteArray = [];
			if (fileId) {
				console.log("fileId: ::" + fileId);
				var accessToken = gapi.auth.getToken().access_token;
				callToajax(fileId,'',fileName,accessToken);
				
				}
		  
				else {
				alert('Unable to download file.');
				}
			  
			}
		function callToajax(fileId,contentType,fileName,accessToken) {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath=$("#contextPath").val();
			console.log(contextPath);
		//	$("#jumpstep2").removeAttr('disabled');
			$.ajax({
				url: contextPath+"downloadapisignature",
				type: "POST",
				dataType: 'json',
			    contentType: "application/json; charset=utf-8",
			    data: JSON.stringify({ "fileId":fileId , "fileMimeType": contentType , "fileName" :fileName ,"accessToken":accessToken}),
			    beforeSend: function (xhr) {
		   			xhr.setRequestHeader(header, token);
		   		//	$("#jumpstep2").buttonLoader('start');
		   		
		   		
			    },
			    complete: function () {
			    //	$("#jumpstep2").buttonLoader('stop');
			    	console.log("aasdas");
			    },
				
			    success:function(response){
			    	$("#show_upload_signature").hide();
					 $("#show_upload_yoursignature").show();
	    	    	 $('#blah').attr('src', 'data:image/jpeg;base64,'+<c:out value='response'></c:out>);	 
	    	    	 $("#clearId").show();
			    },
			    error: function(err){
			    	
			    }
			})
		}

	
	</script>
	
<script type="text/javascript" src="https://js.live.net/v7.2/OneDrive.js"></script>
 <script type="text/javascript">
  function launchOneDrivePicker(){
	  var contextPath=$("#contextPath").val();
	  var odOptions = {
			  clientId: "0aa725db-3ba9-486d-8e42-a92554639a6d",
			  action: "download",
			  multiSelect: false,
			  linkType: "webViewLink",
			  advanced: {filter: ".png,.jpg,.jpeg,.bmp"},
			  success: function(response) { 
				  var downloadurl =  response.value[0]["@microsoft.graph.downloadUrl"];
				  var name = response.value[0]["name"];
				  console.log("done-->"+downloadurl);
				  console.log("done-->"+name);
				  var str = name;
				  saveonedriveChooserFile(downloadurl,name)

			  },
			  cancel: function() {  },
			  error: function(e) { alert(e); }
			}
    OneDrive.open(odOptions);
	  
  } 
  

  
  function saveonedriveChooserFile(downloadedUrl,fileName) {
      var token = $("meta[name='_csrf']").attr("content");
             var header = $("meta[name='_csrf_header']").attr("content");
             var contextPath=$("#contextPath").val();
             
             $.ajax({
                   url: contextPath+"/saveonedriveFile",
                   type: "POST",
                   datatype:'json',
                   Accept : "application/json",
                 contentType: "application/json",
                   data: JSON.stringify({ "downloadedUrl":downloadedUrl , "fileName" :fileName }),
                   beforeSend: function (xhr) {
                           xhr.setRequestHeader(header, token);

                 },
                 complete: function () {
                       
                       },
                       
                    success:function(response){
                       //alert('success');
                    	$("#show_upload_signature").hide();
   					 $("#show_upload_yoursignature").show();
   	    	    	 $('#blah').attr('src', 'data:image/jpeg;base64,'+<c:out value='response'></c:out>);	 
   	    	    	 $("#clearId").show();
                    
                 },
                 error: function(err){
                    
                 }
             })
      }
  

  </script>
  <script type="text/javascript" src="<%=appUrl %>/js/dropins.js" id="dropboxjs" data-app-key="kktaxdj1402ec7u"></script>
<script>
document.getElementById("dropbox1").onclick = function () {
       Dropbox.choose({
        success: function(files) {
            
          console.log(files);
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
                     url: contextPath+"saveonedriveFile",
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
        					 $("#show_upload_yoursignature").show();
        	    	    	 $('#blah').attr('src', 'data:image/jpeg;base64,'+<c:out value='response'></c:out>);	 
        	    	    	 $("#clearId").show();
                          
                       },
                  error: function(err){
                     
                  }
              })
       }


    </script>
    <script type="text/javascript">
    
    
    function saveSignaturetodb(){
    	
    	saveSignature('draw');
    }
    	
    /*Egnyte Pic download code */   
    
    function popitupEgnytePic(url) {
   	 //alert(url);
      // debugger; 
       var w=500;
        var h=500;
    var left = (screen.width/2) - (w/2);
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
					 $("#show_upload_yoursignature").show();
	    	    	 $('#blah').attr('src', 'data:image/jpeg;base64,'+<c:out value='response'></c:out>);	 
	    	    	 $("#clearId").show();
             
           },
           error: function(err){
             
           }
       })
   		 }else{
   			 $("#file_error").show();
   		     	$("#file_error").html('<spring:message code="label.uploadFileExtension"/>').fadeOut(10000);;
   		         fileInput.value = '';
   			 
   		 }
        
        
     }   
     /* end Egnyte javascript code */  
    
    </script>
	
	<script src="https://www.google.com/jsapi?key=AIzaSyC4z1UzNEEZXpOGf547C0XifZ0HagRx64w"></script>
	<script src="https://apis.google.com/js/client.js?onload=initPicker"></script>
</body>
<input type="hidden" id="myType" value=""/>
<input type="hidden" id="drawBase64" value="data:image/png;base64,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"/>
<input type="hidden" id="drawBaseIE64" value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAUAAAADICAYAAACZBDirAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAEOSURBVHhe7cEBAQAAAIIg/6+uIUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFwN6PUAAV2BT5gAAAAASUVORK5CYII="/>
<input type="hidden" id="drawBaseMozilla64" value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAUAAAADICAYAAACZBDirAAABDklEQVR4nO3BAQEAAACAkP6v7ggKAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAICqAej1AAHIbb/GAAAAAElFTkSuQmCC"/>
<input type="hidden" id="tdrawBaseIE64" value="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAu4AAAC6CAYAAADxncgCAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAI0SURBVHhe7cExAQAAAMKg9U9tDB8gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4K4GhOIAAQ18YIgAAAAASUVORK5CYII="/>

</html>