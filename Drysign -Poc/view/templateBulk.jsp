<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.core.Authentication" %>
 <jsp:include page="header.jsp"></jsp:include>
<% 
String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>
<% Authentication auth = SecurityContextHolder.getContext().getAuthentication(); %>
<% Registration registration = (Registration)auth.getPrincipal(); %>
<script src="<%=appUrl %>/js/jquery.min.js"></script> 

<%-- <link rel="stylesheet" href="<%=appUrl %>/css/style.css"/> --%>
<%-- <link rel="stylesheet" href="<%=appUrl %>/css/inner_page.css"/> --%>
<link rel="stylesheet" href="<%=appUrl %>/css/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="<%=appUrl %>/css/jquery-ui.css">
<link rel="stylesheet" href="<%=appUrl %>/css/materialize-tags.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="<%=appUrl %>/css/buttonLoader.css" rel="stylesheet" type="text/css">
<link href="<%=appUrl %>/css/materialize.css" rel="stylesheet"/>

  <style>
  .file-upload-button{
  float:right;}
  .checkbox label::after{
  margin-top:0px !important;}
  .checkbox-primary label::after{
  margin-left: -13px !important;
  }
  .checkbox.checkbox-primary {
    margin-left: 13px;
}
  #remove{
  cursor:pointer;}
  #error_content{
  padding-left:29px;
  }
  .dataTables_filter {
    text-align: left;
}
table.table.padding0 td {
    padding: 0 !important;
}

.upload-fild span.icon-upload {
    display: block;
    float: right;
    width: 24px;
    position: relative;
    bottom: 0px;
    outline: 0 none;
   color:#40505b;
   font-size:12px;
}

.icon-upload:before {
    font-size: 16px;
}


#upload{

	display: none !important;
    visibility: hidden;
    position: absolute;
    left: -9999px;
}
    
#filename{
	position: absolute;
	border:none !important;
	 height:1rem !important;
	width:80%;
	
} 
   
   @media (max-width: 480px){
.upload-fild {
    /* min-width: 600px; */
    max-width: 100%;
} 
}
/*
 .loader2 {
    position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 99999;
	background: url('<%=appUrl %>/images/ajax-loader_1.gif') 50% 50% no-repeat rgba(43, 40, 40, 0.37);
 }*/
 </style>
<div id="loader2" class="loader2" style="display:none">
	<div class="loaderdiv">
		 <p><img src="<%=appUrl %>/images/drysign_logo_mono.svg"></p>
		<p><img src="<%=appUrl %>/images/drysign-logo-line_only.gif" ></p> 		
		<p><spring:message code="label.wait"/></p>
	</div>
</div>
	<div class="content-wrapper bg_wrap">
		<div class="container-fluid">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
			<li class="Groupsignhead"><spring:message code="label.template"/> |</li>		
				<li><a href="<%=appUrl %>/app/dashboard"><spring:message code="label.cat_home"/></a></li>
				<li class="active"><spring:message code="label.template"/></li>		
			</ol>		
		</div>
		<!-- Main content -->
		<div class="container-fluid">
			<div class="step1">
				<div class="row margB20">
					<div class="col-xs-12">
						<div class="Content-wh-module"> 
	                		<br><br>
	                    	<center><spring:message code="label.blk_temp"/></center>
	                    	<ul class="list-inline text-center">
	                      		<li>
	                      			<a href="<%=appUrl %>/app/sampletemplate" class="btn btn-primary "><spring:message code="label.blk_down"/></a>
	                        		<!-- <button type="button" id="jumpstep2" class="btn btn-primary next-step " disabled>Save and Next </button> -->
	                      		</li>
	                    	</ul>
	                    	<br><br>
						    <hr>              	
			        		<!-- </div>
			        		<div class="row"> -->
			        		 <form id="bulktemp">
			        			<div class="col-md-8"> 
			        				<div class="upload-fild">
										<input type="hidden" id ="did" value="${docId}">
                                        <!-- <input type="file" name="file-7[]" id="file-7" class="inputfile inputfile-6" data-multiple-caption="{count} files selected" placeholder="select the pdf file to upload" onchange="readURL(this); " /> -->
                                        <div class="custom-file-upload">
                                            <input id="upload" type="file" name="files" accept=".csv" />
                                            <input id="filename" type="text" placeholder="<spring:message code="label.upload_csv"/> " readonly/>
                                            
                                            <span class="fa fa-times pull-right" id="remove" onclick="myFunction()" hidden></span>
                                            <!-- <input type="button" id="remove" onclick="myFunction()" value="Remove" hidden> -->
                                            <button id="openUpload" type="button" class="file-upload-button" tabindex="-1"><span class="icon-upload"></span></button>
                                        </div>
	
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:100%">
                                            </div>
                                        </div>
                                         <div>
                                         <div class="checkbox checkbox-primary">
				                    		<input type="checkbox" class="filled-in" id="checkbox" checked >
	                        				<label for="checkbox"><spring:message code="label.send-tem"/></label>
	                        				</div>
				                   		 </div>
				                   		 <span id="csverror" class="error"></span>
                                    </div>    
	                      				                       
	                      		</div>
	                      		<div class="col-md-4"> 
	                      			<ul class="list-inline text-center">
			                      		<li>
			                      			<button type="button" id="sendfile" class="btn btn-primary" value ="submit"><spring:message code="label.pre_upload"/></button>
			                      		</li>
			                    	</ul>
			                    </div>
			                   
                        <!-- <input type="checkbox"  class="mycheckbox1" id="checkbox" checked >
                        <label for="checkbox"> Mail Signers</label>
                    

                        <input type="checkbox"  class="mycheckbox1" id="checkbox" checked >
                        <label for="checkbox"> Send Copy to Signers</label> -->
                    <input type="hidden" name="hello" id ="testp" value="1">

			                    </form>
			                    
			<div class="row">
			<div class="col-md-12" style="display:none" id="error_content">	   	
			<p class="issue" id="error-messgae" style="color:#e83123" ></p>
			<!--  <button style="margin-top: 50px;" type="button" onClick="window.location.href = 'index.html';" value="GO to dashboard" class="btn btn-primary font-24">Go To Login</button> -->
		</div> 
		</div>
					</div>

				</div>
			</div>
		</div>
		
		<div class="Content-wh-module text-center container-fluid" id="success-group-message" style="display:none">
		 	<div class="col-xs-12">
   	<img src="<%=appUrl %>/images/message-bg.png"/>		   	
	   <!-- <h4 class="message-text text-color-burmoda"><spring:message code="label.msg_succ"/></h4>
	   <p style="margin-top: 50px; font-size: 16px; width: 850px; max-width: 90%; margin: 0 auto"><spring:message code="label.msg_em_succ"/> > <a href="<%=appUrl %>/app/myfiles?tab=outforsign"> <spring:message code="label.dash_outdoc"/>.</a>
				   <spring:message code="label.msg_em_succ_c1"/> > <a href="<%=appUrl %>/app/myfiles?tab=completed"><spring:message code="label.cmplt_doc"/>.</a> <spring:message code="label.msg_em_succ_c2"/>.
		</p> -->
		<h4 class="message-text text-color-burmoda"><spring:message code="label.msg_succ"/></h4>
	 <!--    Changes done to resolve DrySign: 1471 by Rupali.Shinde.
	 <p style="margin-top: 50px; font-size: 16px; width: 850px; max-width: 90%; margin: 0 auto"><spring:message code="label.msg_em_succ"/>
				   <spring:message code="label.msg_em_succ_c1"/> > <a href="<%=appUrl %>/app/myfiles?tab=outforsign"> <spring:message code="label.dash_outdoc"/>.</a> <spring:message code="label.msg_em_succ_c2"/>.
		</p>  -->
		
		
		<p style="margin-top: 50px; font-size: 16px; width: 850px; max-width: 90%; margin: 0 auto"><spring:message code="label.msg_succ_sent"/> > <a href="<%=appUrl %>/app/myfiles?tab=outforsign"> <spring:message code="label.dash_outdoc"/>.</a>	   
		</p>
		<br/>
		            <p><spring:message code="label.grp_sucessmsg"/> > <a href="<%=appUrl %>/app/myfiles?tab=completed"><spring:message code="label.cmplt_doc"/>.</a></p>
		
		<a style="margin-top:18px;" type="submit" value="GO to dashboard" href="<%=appUrl %>/app/dashboard" class="btn btn-primary font-24"><spring:message code="label.todash"/></a> 	
		 	
		 	</div>
			
		</div>  
			<!-- <div class="container-fluid" style="margin-top: 144px;display: none;" id="error_content" > -->
  
	<!-- </div> -->
	</div>
	
	

</div>
 
  
<jsp:include page="footer.jsp"></jsp:include>
<script src="<%=appUrl%>/js/materialize.js"></script>
<script src="<%=appUrl %>/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=appUrl%>/js/jquery.validate.js"></script>
<%-- <script src="<%=appUrl %>/js/jquery.fileupload.js"></script>
<script src="<%=appUrl %>/js/jquery.fileupload-process.js"></script>
<script src="<%=appUrl %>/js/jquery.fileupload-validate.js"></script> --%>
<script src="<%=appUrl %>/js/file_upload.js"></script>
<script src="<%=appUrl %>/js/materialize.js"></script>
<script>


$("#upload").click(function(){
    //$("#remove").show();
    $(".icon-upload").show();
});
function myFunction() {
	$("#remove").hide();
	location.reload();	
	//document.getElementById("bulktemp").reset();
	//$(".icon-upload").show();

}


$('#openUpload').click(function(){ $('#upload').trigger('click'); });

document.getElementById('upload').onchange = uploadOnChange;

function uploadOnChange() {
    var filename = this.value;
    var validExts = new Array(".csv");
    var fileExt = filename;
    fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
    if(filename != ''){
    	$("#remove").show();
    	 $(".icon-upload").hide();
    	 $("#sendfile").prop("disabled", false);
    }
    
    if (validExts.indexOf(fileExt) < 0) {
    	$('#csverror').html("<spring:message code="label.blk_validfile"/> " +  validExts.toString() + " <spring:message code="label.blk_validfile_c"/>.");
     // alert("<spring:message code="label.blk_validfile"/> " +
       //        validExts.toString() + " <spring:message code="label.blk_validfile_c"/>.");
  	document.getElementById("bulktemp").reset();
  	 $("#remove").hide();
     $(".icon-upload").show(); 
     $("#sendfile").prop("disabled", true);
    }
    else {
    	$('#csverror').html("");
        var lastIndex = filename.lastIndexOf("\\");
        if (lastIndex >= 0) {
            filename = filename.substring(lastIndex + 1);
        }
        document.getElementById('filename').value = filename;

    }

}

$("#sendfile").click(function (event) {
	$(".icon-upload").show();
	  $("#remove").hide();
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var contextPath=$("#contextPath").val();
	var ckbox2 = $('#checkbox');
	var mailflag="1";
	if (ckbox2.is(':checked')) {
		var mailflag="1";	 
	}else{
		var mailflag="0";
	}

    //stop submit the form, we will post it manually.
    event.preventDefault();

    // Get form
    var form = $('#bulktemp')[0];
console.log(form);
	// Create an FormData object 
    var data = new FormData(form);
console.log("data is "+data);
	// If you want to add an extra field for the FormData
  //  data.append("CustomField", "This is some extra data, testing");

	// disabled the submit button
    $("#sendfile").prop("disabled", true);
 var docId =${docId};
 var info = "?docId="+docId+"&mailflag="+mailflag;
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: contextPath+"app/bulkupload"+info,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        beforeSend : function(xhr) {
			//$('#signupbtn').buttonLoader('start');
			xhr.setRequestHeader(header, token);
			//added loader to resolve DrySign:1466 by Rupali.Shinde
			$("#loader2").show();
		},
		complete: function () {
		//added loader to resolve DrySign:1466 by Rupali.Shinde
		    	$("#loader2").hide();
		    },
        success: function (response) {

          //  $("#result").text(data);
            console.log(response);
          //  $("#btnSubmit").prop("disabled", false);
            if(response == 'success'){
       		 $(".step1").hide();
       		$("#success-group-message").show();
       		$(".icon-upload").show();
  		  $("#remove").hide();
       		//alert("success");
       	//	$("#show-groupsign-steps").hide();
       	}else if(response == 'less'){
       		//$(".step1").hide();
       		$("#error-messgae").empty();
    		$("#error-messgae").append("<spring:message code="label.blk_temp_doc"/>");
    		$("#error_content").show();
    		 $(".icon-upload").show();
    		  $("#remove").hide();
       	}
       	else if(response == 'subscription'){
       		//$(".step1").hide();
       		$("#error-messgae").empty();
    		$("#error-messgae").append("<spring:message code="label.blk_temp_nwplan"/>");
    		$("#error_content").show();
    		$(".icon-upload").show();
  		  $("#remove").hide();
       		
       	}
       	else if(response == 'nodata'){
       		//$(".step1").hide();
       		document.getElementById("bulktemp").reset();
       		$("#error-messgae").empty();
    		
    		$("#error-messgae").append("<spring:message code="label.csv_empty"/>");
    		$("#sendfile").prop("disabled", false);
    		$("#error_content").show();
    		$(".icon-upload").show();
  		  $("#remove").hide();
       	}

        },
        error: function (e) {

            $("#result").text(e.responseText);
            console.log("ERROR : ", e);
            $("#btnSubmit").prop("disabled", false);
            //added loader to resolve DrySign:1466 by Rupali.Shinde
            $("#loader2").hide();
        }
    });
  
});

$(document).ready(function(){
	var title='${title}';
	if(title=='Template Bulk'){
		$("#templateSidebar").addClass('active');
		$("#sendfile").attr("disabled", true);
	}
});
</script>