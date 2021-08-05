<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.authentication.AnonymousAuthenticationToken,org.springframework.security.core.Authentication" %>


<% 
String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>

<style>
canvas{

border:none !important;}
    #canvas_container{
width: 100%;
height:450px;
overflow: auto;
background-color: #333333;
text-align: center;
border: 3px solid;
    }
    
#emailform{
text-align:center;}
#emailform .modal-title{
text-align:left;}
#message{
padding:0 5px !important;}
.row{
text-align:left;
}


.pdfobject-container { height: 500px;}
.pdfobject { border: 1px solid #666; }

table tbody td {
    -ms-word-break: break-all;
   word-wrap:break-word;
}
</style>
<script src="<%=appUrl %>/js/pdfobject.min.js"></script>

						<table  id="CompletedDocumentsTable" class="display table Data_table_heading table-striped table-bordered dt-responsive nowrap" style="width:100%">
								<thead>
									<tr>

	                <th style="width: 30px" class="text-center"></th>
	                <th style="width: 350px" class="text-left"><spring:message code="label.slf_sub"/></th>
	                <th style="width: 150px" class="text-left"><spring:message code="label.sgntype"/></th>
	                <th style="width: 170px"class="text-left"><spring:message code="label.cmpltdate"/></th>
	                <th  style="width: 100px;"><spring:message code="label.out_actn"/></th>
									</tr>
									


								</thead>
								
								<tfoot>
            					<tr>
            					        <th>Plus</th>
                						<th><spring:message code="label.slf_sub"/></th>
                						<th><spring:message code="label.sgntype"/></th>
                						<th><spring:message code="label.cmpltdate"/></th>
                						<th ><spring:message code="label.out_actn"/></th>
            					</tr>
            					</tfoot>
								<tbody>
										<tr>
										<td></td>
										<td></td>
										<td></td>						
										<td></td>
										<td></td>
										</tr>
								</tbody>
								
							</table>
				
						
						
<button class="btn btn-primary btn-lg"  data-toggle="modal" data-target="#myModal2" id="test2" style="display:none;">
  <spring:message code="label.launch_demo_modal"/>
</button> 


<div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <spring:message code="label.modal_content"/>
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
       
      </div>
      <div id ="my_pdf_viewer">
                <div id="canvas_container">
                    <div id="pdf_renderer2"> </div>
                </div>
                
        </div>
    </div>

  </div>
</div>


<div id="myEmailModal" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
<form id = "emailform" name = "eform">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        <h4 class="modal-title"><spring:message code="label.com_sendemail"/> </h4>
      </div>
      <div class="modal-body">
      <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
	                <div class="form-horizontal">
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-4 control-label"><spring:message code="label.slfrec_add"/><span class="redstar">*</span></label>
					    <div class="col-sm-8">
					      <input id="emailadd" type="text" name ="email" class="form-control" placeholder="<spring:message code="label.login-email"/>">
					  
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="inputPassword3" class="col-sm-4 control-label"><spring:message code="label.slf_cc"/></label>
					    <div class="col-sm-8">
					    
					     	<input id="cc" name="cc" type="text" class="form-control" placeholder="<spring:message code="label.mail_cc"/>">
					    </div>
					  </div>
					   <div class="form-group">
					    <label for="inputPassword3" class="col-sm-4 control-label"><spring:message code="label.slf_subject"/><span class="redstar">*</span></label>
					    <div class="col-sm-8">
					      	 <input id="subject" name="subject" type="text" class="form-control" placeholder="<spring:message code="label.slf_sub"/>">
					    </div>
					  </div>
					   <div class="form-group">
					    <label for="inputPassword3" class="col-sm-4 control-label"><spring:message code="label.slf_msg"/><span class="redstar">*</span></label>
					    <div class="col-sm-8">
					      <input id="docuID" name="docid" type="hidden" class="form-control">
					      <textarea id="message" name="message" class="form-control" placeholder="<spring:message code="label.slf_msg"/>"></textarea>
					    </div>
					  </div>
					 
					  <div class="form-group">
					    <div class="col-sm-12 col-md-12 text-right">
					       <button type="button"  id="" class="btn btn-light" Onclick="$('#successMsg').hide();" data-dismiss="modal"><spring:message code="label.cancel"/></button>
					      <button type="button" id="sendbtn1" onclick="sendemail();" style="text-transform: capitalize;" class="btn btn-blue"><spring:message code="label.sendmail"/></button>
					   
						 </div>
					  </div>
					</div>
                   
				  </div>     
              </div>

      </div>
    <div class="alert alert-success" style="display:none;text-align:center;margin: 0px;" id="successMsg">
				    	
	<spring:message code="label.dash_emailsucc"/> &nbsp;&nbsp;<span Onclick="$('#successMsg').hide();" style="cursor:pointer;">&times;</span>
</div> 
 <div class="alert alert-danger fade in" style="display:none;text-align:center;margin: 0px;" id="feedbackfailalert" style="display:none">
				    	<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>
						<div id="emailfail"></div>
						<a  data-hide="alert" aria-label="close">&times;</a>
</div> 
    </div>

  </div>
  </form>
</div>

				
		<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.3.200/pdf.min.js"></script>									
<script>



var appUrl;
var token;
var header;
var emailForm;
$(document).ready(function() {

	
	 appUrl="<%=appUrl%>";
	  token = $("meta[name='_csrf']").attr("content");
	  header = $("meta[name='_csrf_header']").attr("content");	

	  
	   $('#CompletedDocumentsTable').dataTable( {
		   "language": {
			   "info": "<spring:message code="label.dis_item"/> _START_ - _END_  <spring:message code="label.of"/> _MAX_",
                  "emptyTable": "<spring:message code="label.no_data_avai"/>",
                  "infoEmpty": "",                       //hides the Showing text if 0 records
                  "lengthMenu": "<spring:message code="label.show"/> _MENU_ <spring:message code="label.entries"/>",
                  "search": "<spring:message code="label.search"/>",
                  "paginate": {
                      "previous": "<spring:message code="label.prvi"/>",
                      "next": "<spring:message code="label.nxt"/>"
                   }
 	    	 },
		   "autoWidth": false,
		   "pagingType": "full_numbers",
		   "columnDefs": [	
    	    { className: "details-control", "targets": [ 0 ] },
    	    { className: "text-center", "targets": [ 4 ] },
    	    {targets : [4],	orderable: false}
    	  ], 	
    	}); 
	   
	   var table=$('#CompletedDocumentsTable').DataTable();
	   
	    $('#CompletedDocumentsTable tbody').on('click', 'td.details-control', function () {
	         var tr = $(this).closest('tr');
	        var row = table.row(tr);
	       
	       /*  var dt=JSON.parse(tr.attr("id"));
	        alert(dt.signers); */
	 
	        if ( row.child.isShown() ) {

	            // This row is already open - close it
	            row.child.hide();
	            tr.removeClass('shown');

	        }
	
	        
	        else {
	        	if ( table.row( '.shown' ).length ) {
	                  $('.details-control', table.row( '.shown' ).node()).click();
	          }
	            var addData=JSON.parse(tr.attr('additionalData'));
	            row.child(formatCompleteDocuments(addData)).show();
	            tr.addClass('shown');
	                 	
	        } 
	  }); 
	 
	  
	/*   var table= $('#CompletedDocumentsTable').DataTable( {
			  colReorder: {
		         realtime: true
		     }, 
			 order: [],
			 columns: [
							 {
							    "className":      'details-control',
							    "orderable":      false,
							    "data":           null,
							    "defaultContent": ''
							},
							
							{ "data": "subject" }, 
							{ "data": "signType" },
							{ "data": "completedDate" },
							{ "data": "docId" },
							{
							    "data":           null,
							    "defaultContent": '<li class="dropdown pull-right "> <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"> <i class="fa fa-ellipsis-v" aria-hidden="true"></i></a><ul class="dropdown-menu"><li><a class="email" href="#" data-backdrop="static" data-toggle="modal" data-target="#myModal" data-keyboard="false">SEND EMAIL</a></li></ul></li>'
							},
							{ "data": "signerName","visible": false },
		  		 ]

		}); */// end of dataTable
	  
	  
	//getcompleteDocumentData();
   
	//appendAddEvent();
	
	
	$.validator.addMethod("multiemail", function (value, element) {
	     if (this.optional(element)) {
	         return true;
	     }
	     var emails = value.split(','),
	         valid = true;
	     for (var i = 0, limit = emails.length; i < limit; i++) {
	         value = emails[i];
	         valid = valid && jQuery.validator.methods.email.call(this, value, element);
	     }
	     return valid;
	}, "<spring:message code="label.sep_comma"/>");
	
	
	
	  emailForm=$("#emailform").validate({
		 	/* errorElement: 'p',
	    	errorClass: 'error', */
			//specify the validation rules
			rules: {
				email: {
		     		required: true,
		     	    multiemail:true,
		     		},
		     	cc:{
		     		 multiemail:true
		     	},	
				subject:"required",
				message:"required",
			},
			//specify validation error messages
			messages: {
				subject: "<spring:message code="label.slf_subval"/>",
				message: "<spring:message code="label.slf_msgval"/>",
				email:{
					
		    		 required: "<spring:message code="label.email_msgrequired"/>"
		    	 },
				cc:{
		    		 required: "<spring:message code="label.email_msgrequired"/>"
		    	},
			},
	});
	 
	 
	 
	/* $('[data-dismiss=modal]').on('click', function (e) {
			emailForm.resetForm();
		    var $t = $(this),
		    target = $t[0].href || $t.data("target") || $t.parents('.modal') || [];
		$(".alert").hide();
		$(target)
		.find("input,textarea,select")
		   .val('')
		   .end();
		});*/


	
});


function sendemail() {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    var contextPath = $("#contextPath").val();
    var subject = $('#subject');
    var email = $('#emailadd');
    var message = $("#message");
    var cc = $("#cc");
    var docId = $('#docuID').val();
    var valid = $("#emailform").valid();
    /* 		var data = {
     "name" : name.val(),
     "email" : email.val().trim(),
     "message" : message.val()	     
     } */
     
     //alert(docId);
    if (valid == true) {
        $.ajax({
            type: "POST",
            url: 'history/sendemail',
            data: {
                subject: subject.val(),
                email: email.val().trim(),
                cc : cc.val(),
                message: message.val(),
                docId: docId
            },
            beforeSend: function(xhr) {
                $('#sendbtn1').buttonLoader('start');
                xhr.setRequestHeader(header, token);
            },
            complete: function() {
            	//alert('HII');
                $("#sendbtn1").buttonLoader('stop');
            },

            success: function(response) {
            	//alert('SUCCESS');
                if (response == 1) {
                	$("#sendbtn1").buttonLoader('stop');
                    $("#successMsg").show(); 
                    var frm=$("#emailform");
                    frm[0].reset();
                    
                } else {

                    $("#emailfailalert").show();
                    $("#emailfail").html(<c:out value="response"></c:out>);
                }
            },
            error: function(xhr, textStatus, errorThrown) {
                alert('<spring:message code="label.loading_error"/>' + errorThrown);
                console.log(errorThrown);
                return false;
            }
        });
    }
}







function displayCompletedSignType(signType){
	 var sType;
	 if(signType=='S'){
		 sType='<i class="icon-self fontIcon"></i>&nbsp; SELF';
	 }
	 if(signType=='G'){
		 sType='<i class="icon-group fontIcon"></i>&nbsp; GROUP';
	 }
	 if(signType=='R'){
		 sType='<i class="fa fa-globe"></i>&nbsp; Web Service Sign';
	 }
	 return sType;
}
function formatCompleteDocuments ( d ) {
    // `d` is the original data object for the row
    var y=displayCompletedSignType(d.signType);
    
    var z=displayCompletedDocumentSigners(d.signType,d.signerEmail,d.signerName,d.signerStatus,d.priority,d.emailCount,d.signerEmailId,d.requestedBy);
    
    return '<table class="noborder"  cellpadding="5" width="100%" cellspacing="0" border="0" style="padding-left:50px;">'+
       /*  '<tr>'+
            '<td>Full name:</td>'+
            '<td>'+d.requestedBy+'</td>'+
        '</tr>'+ */
       /*  '<tr>'+
        	'<td><strong>Title:</strong></td>'+
       	 	'<td>'+d.subject+'</td>'+
    	'</tr>'+  */
    	'<tr>'+
        '<td><strong><spring:message code="label.comp_envlpid"/>:</strong></td>'+
        '<td>'+d.envelopeId+'</td>'+
    	'</tr>'+  
    	'<tr>'+
        '<td><strong><spring:message code="label.grp_doc"/>:</strong></td>'+
        '<td>'+d.documentName+'</td>'+
    	'</tr>'+  

    	'<tr>'+
            '<td><strong><spring:message code="label.comp_reqstdby"/>:</strong></td>'+
            '<td>'+d.requestedBy+'</td>'+
        '</tr>'+ 
       /*  '<tr>'+
            '<td><strong>Type:</strong></td>'+
            '<td>'+y+'</td>'+
        '</tr>'+  */
        '<tr>'+
            '<td><strong><spring:message code="label.dft_sgn_type"/>:</strong></td>'+
            '<td>'+z+'</td></td>'+
   		 '</tr>'+ 
        '<tr>'+
            '<td><strong><spring:message code="label.comp_vwfile"/>:</strong></td>'+
            '<td><button type="button" onclick="viewCompletedDocument('+d.docId+');" class="badge badge-workView"><spring:message code="label.vew"/></button></td>'+
            
        '</tr>'+
        	'<td><strong><spring:message code="label.comp_dwnldfle"/>:</strong></td>'+
    		'<td><button type="button" onclick="DownloadCompletedDocument('+d.docId+');" class="badge badge-workDownload"><spring:message code="label.blk_down"/></button></td>'+
    	'</tr>'+
    	'<tr>'+
    		'<td><strong><spring:message code="label.slf_sub"/>:</strong></td>'+
   	 		'<td>'+d.subject+'</td>'+
		'</tr>'+ 
		'<tr>'+
			'<td><strong><spring:message code="label.slf_msg"/>:</strong></td>'+
	 			'<td>'+d.message+'</td>'+
		'</tr>'+ 
    '</table>';
}



function displayCompletedDocumentSigners(signType,signerEmail,signerName,signerStatus,priority,emailCount,signerEmailId,requestedBy){
	 var signers;
	 var content = "<table class='table table-bordered'><tr><th style='background:#00bc9c;font-size: 15px;'><spring:message code="label.tmp-name"/></th><th style='background:#00bc9c;font-size: 15px;'><spring:message code="label.grp_email"/></th><th style='background:#00bc9c;font-size: 15px;'><spring:message code="label.comp_sts"/></th></tr>";
	 if(signType=='S'){
		 
	content+='<tr><td>'+requestedBy+'</td><td>'+signerEmail+'</td><td><button type="button" class="badge badge-workSigned" style="cursor: inherit;"><spring:message code="label.sgned"/></button></td></tr>';
		 //content+=signerEmail+'&nbsp<button type="button"  class="badge badge-workSigned" style="cursor: inherit;">Signed</button>';
	content+='</table>';
	signers=content;
	 }
	 if(signType=='G' || signType=='R'){
		
			var sn=signerName.split(",");
			var ss=signerStatus.split(",");
			var pp=priority.split(",");
			//var ec=emailCount.split(",");
			var eID=signerEmailId.split(",");
			var msg=''; 
			
			if(pp[0] == 0){
				
				for(i=0; i<sn.length; i++){
					if(ss[i] == "0" || ss[i] == "1"){
				   		//content += '<tr><td>'+pp[i]+'</td><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="btn btn-warning">PENDING</button></td></tr>';
						//}else{
						content += '<tr><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="badge badge-workSigned" style="cursor: inherit;"><spring:message code="label.sgned"/></button></td></tr>';
					}
				}
				content += "</table>"
			}else{
			var content = "<table class='table table-bordered'><tr><th style='background:#00bc9c;font-size: 15px;'><spring:message code="label.grp_prio"/></th style='background:#00bc9c;font-size: 15px;'><th style='background:#00bc9c;font-size: 15px;'><spring:message code="label.tmp-name"/></th><th style='background:#00bc9c;font-size: 15px;'><spring:message code="label.grp_email"/></th><th style='background:#00bc9c;font-size: 15px;'><spring:message code="label.comp_sts"/></th></tr>";
			
			for(i=0; i<sn.length; i++){
				if(ss[i] == "0" || ss[i] == "1"){
			   		//content += '<tr><td>'+pp[i]+'</td><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="btn btn-warning">PENDING</button></td></tr>';
					//}else{
					content += '<tr><td>'+pp[i]+'</td><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="badge badge-workSigned" style="cursor: inherit;"><spring:message code="label.sgned"/></button></td></tr>';
				}
			}
			content += "</table>"
			}
		signers=content;
			
	 }
	 
	 return signers;
}



function appendCompletedDocumentDatatoDataTable(table,response){

	    var signType="";
		var list= JSON.parse(response.list);
		
		console.log("completed document list:");

		table.clear().draw();
		 list.forEach(function(value, index, array){ 
			 
			 if(value.signType=='G')
				 signType='<spring:message code="label.grp_sgn"/>'
			 else
				signType='<spring:message code="label.selfsign"/>';
		
			// var anchor="<a href="+appUrl+"/app/document/redirect/"+value.envelopeId+">";			 
			//  var buttonhtml="<button onClick=deleteDraft('"+value.envelopeId+"')>"; */
			  //value.subject,value.signType,value.completedDate
			  var openemail="openEmailModal('"+value.docId+"')";
		      var emailIcon='<a href="#"  onClick="'+openemail+'"><i class="fa fa-envelope-o" aria-hidden="true" data-backdrop="static" data-keyboard="false"></i></a>';
		      var rowNode= table.row.add(['',value.subject,signType,value.completedDate,emailIcon]).draw(true).node(); 
	   		  $(rowNode).attr("additionalData",JSON.stringify(value));
		 }); 	
		

	
}


function openEmailModal(docid){
   // alert(docid);
	$("#myEmailModal").modal('toggle');
	$("#docuID").val(docid);
	emailForm.resetForm();
}

	function viewCompletedDocument(docId){
  		var contextPath=$("#contextPath").val();
  		 $.ajax({
			type : "GET",
			url : "<%=appUrl%>/app/downloadFiles/internal",
			data : "docId="+docId,
			success : function(response) {
				
				if(response){
					var url=contextPath+'app/download/internal?fileName='+response+"&docId="+docId;
					//PDFObject.embed(a, "#example2",{pdfOpenParams: { toolbar: 0 }});
				//	 document.getElementById('myiframe').src = contextPath+'app/download/internal?fileName='+response+"&docId="+docId;
					 document.getElementById("test2").click();
					 $("#pdf_renderer2").empty();
					 var currPage = 1; //Pages are 1-based not 0-based
					 var numPages = 0;
					 var thePDF = null;

					 //This is where you start
					 pdfjsLib.getDocument(url).then(function(pdf) {

					         //Set PDFJS global object (so we can easily access in our page functions
					         thePDF = pdf;

					         //How many pages it has
					         numPages = pdf.numPages;

					         //Start with first page
					         pdf.getPage( 1 ).then( handlePages );
					 });



					 function handlePages(page)
					 {
					     //This gives us the page's dimensions at full scale
					     var viewport = page.getViewport( 1.2 );

					     //We'll create a canvas for each page to draw it on
					     var canvas = document.createElement( "canvas" );
					     canvas.style.display = "block";
					     canvas.style.margin= "auto";
					     var context = canvas.getContext('2d');
					     canvas.height = viewport.height;
					     canvas.width = viewport.width;

					     //Draw it on the canvas
					     page.render({canvasContext: context, viewport: viewport});

					     //Add it to the web page
					     document.getElementById("pdf_renderer2").appendChild( canvas );

					     //Move to next page
					     currPage++;
					     if ( thePDF !== null && currPage <= numPages )
					     {
					         thePDF.getPage( currPage ).then( handlePages );
					     }
					 }
				//	window.open(contextPath+'app/download/internal?fileName='+response+"&docId="+docId);
					
				}else{
					alert('<spring:message code="label.comp_err_ver"/>');
				}
				

			}
		}); 
  	}
  	
	function DownloadCompletedDocument(docId){

		var contextPath=$("#contextPath").val();
 		 $.ajax({
			type : "GET",
			url : "<%=appUrl%>/app/downloadFiles/external",
			data : "docId="+docId,
			success : function(response) {
				
				if(response){
					
					//alert("Your file is verified"+response);
					window.location.assign(contextPath+'app/download/external?fileName='+response+"&docId="+docId);
				
				}else{
					alert('<spring:message code="label.comp_err_ver"/>');
				}
				

			}
		}); 
 	}




function appendAddEvent(){
$('#example tbody').on('click', 'td.details-control', function () {
    var tr = $(this).closest('tr');
    var row = table.row( tr );

    if ( row.child.isShown() ) {
        // This row is already open - close it
        row.child.hide();
        tr.removeClass('shown');
    }
    else {
        // Open this row
        row.child( format(row.data()) ).show();
        tr.addClass('shown');
    }
}); 

}



$('#example tbody').on('click', 'a.email', function() {

			    
    var row = $('#example').DataTable().row( $(this).parents('tr') ),
        index = row.index(),
        data = row.cell(index, 4).data();
		$("#docuID").val(data) ;
//document.getElementById("docuID").value = data;
   // alert(data);
});


function getcompleteDocumentData (){

	$.ajax({
		type : "GET",
		url : appUrl+"/app/history/newcompletedDocuments",		
	beforeSend : function(xhr) {
	 		xhr.setRequestHeader(header, token);
	 		$("#loader2").show();
	 	    $("#CompletedDocuments").hide();
	 		$('#datanotAvailable').hide();
	 		},
		complete : function() {
			$("#loader2").hide();

	 		},
	 		success : function(response) {
	 			var list= response.list;
	 		if(list=='[]'){
	 				$('#CompletedDocuments').hide();
	 				$('#datanotAvailable').show();
	 				dataAvailableForApi.CompletedDocumentsRowCount=0;
	 				
	 			}
	 			else{	 				
	 				$('#CompletedDocuments').show();
	 			} 
	 			var table=$('#CompletedDocumentsTable').DataTable();
	 			dataAvailableForApi.completedDocumentDataData=true;

	 			appendCompletedDocumentDatatoDataTable(table,response);
	 			makeIndividualCompletedDocumentSearch(table);
 	
	 		}
	 		});		
}



function makeIndividualCompletedDocumentSearch(table){
	var i=0;
	 $('#CompletedDocumentsTable tfoot th').each( function () {
	        var title = $(this).text();
	        console.log(title);
	    if(i!=0 && i!=4){
	    	$(this).html( '<input type="text" placeholder="<spring:message code="label.filter"/>" />' );
	    }
	    else{
	    	$(this).html( '' );
	    }
	    
	    i++;
	        
	    });
		 
		 table.columns().every( function () {
	        var that = this;
	 
	        $( 'input', this.footer() ).on( 'keyup change', function () {
	            if ( that.search() !== this.value ) {
	                that
	                    .search( this.value )
	                    .draw();
	            }
	        } );
	    } );
}

  



</script>
						
						