<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.authentication.AnonymousAuthenticationToken,org.springframework.security.core.Authentication" %>



<!-- <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.0/css/jquery.dataTables.css"> 

 <script type="text/javascript" src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>

<script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script> -->
<!-- Latest compiled JavaScript -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
 <!-- <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script> --> 
<!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script> -->

 
  

<% 
String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>



<style>

tfoot {
    display: table-header-group;
}

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
padding:1px 5px !important;
width:100% !important;}
.row{
text-align:left;
}
.pdfobject-container { height: 500px;}
.pdfobject { border: 1px solid #666; }

table tbody td {
    -ms-word-break: break-all;
   word-wrap:break-word;
}


td.details-control {
background: url(../images/plus.svg)no-repeat center 14px;
   cursor: pointer;
   background-size:20px;
}
tr.details td.details-control {
background: url('../images/minus.svg') no-repeat center 14px;
        cursor: pointer;
        background-size:20px;
}
.table { 
    overflow: auto;
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
				
<div id="datanotAvailable" style="text-align: center; display:none" >
<br/><br/><br/><h4><spring:message code="label.nodatavail"/></h4> 
</div> 						
						
<button class="btn btn-primary btn-lg"  data-toggle="modal" data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#myModal2" id="test2" style="display:none;">
  <spring:message code="label.launch_demo_modal"/>
</button> 


<div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg" id="centeralignModel">

    <spring:message code="label.modal_content"/>
    <div class="modal-content">
      <div class="modal-header row">
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
        <h4 class="modal-title"><spring:message code="label.com_sendemail"/></h4>
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
<%-- <div class="recentActionPopup" id="successMsg" class="modal fade" role="dialog" style="width: 450px;display:none">	
  <div class="modal-header">
        <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        <h4 class="modal-title"><spring:message code="label.com_sendemail"/></h4>
      </div>
  	<div class="modal-body">
  		 <p><spring:message code="label.dash_emailsucc"/></p>	
	</div>
	 <div class="text-right">	  
		<button type="button" class="btn btn-blue" data-dismiss="modal" onclick="closeAction();"><spring:message code="label.ok"/></button>
		
	</div> 

</div>  --%>

 <div class="Message" id="actiondone">	
     <div class="modal-header">
    <h4 class="modal-title"><spring:message code="label.out_don"/></h4>
	  <!-- 	<a class="close" href="#" onclick="hiderDonePopUp();">
	  		<button type="button" class="close" data-dismiss="modal">×</button>
	  	</a>  -->
	  	 </div>
  	 <div class="modal-body">  		
		 	<p><span id="spanDone"></span></p>		 
	  </div>
		 
	  <div class="text-right">	 
			<button type="button" class="btn btn-blue" onclick="hiderDonePopUp();"><spring:message code="label.ok"/></button>
	  </div> 	
 </div>
 
 
 <div class="overlay-bg"></div>

				
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.3.200/pdf.min.js"></script>											
<script>

/* function closeAction(){
	$("#successMsg").hide();
	$('.overlay-bg').hide();
    $('.overlaywhite_bg').hide();
	/*  $("#feedbackModal").hide();
    
} */
//
//Pipelining function for DataTables. To be used to the `ajax` option of DataTables
//
$.fn.dataTable.pipeline = function ( opts ) {
	
// Configuration options
var conf = $.extend( {
   pages: 10,    // number of pages to cache
   url: '',      // script url
   data: null,   // function or object with parameters to send to the server
                 // matching how `ajax.data` works in DataTables
   method: 'GET' // Ajax HTTP method
}, opts );

// Private variables for storing the cache
var cacheLower = -1;
var cacheUpper = null;
var cacheLastRequest = null;
var cacheLastJson = null;

return function ( request, drawCallback, settings ) {
   var ajax          = false;
   var requestStart  = request.start;
   var drawStart     = request.start;
   var requestLength = request.length;
   var requestEnd    = requestStart + requestLength;

//   alert("vvv requestStart "+requestStart+" drawStart"+drawStart+" requestLength:"+requestLength+"  requestEnd:"+requestEnd )

   if ( settings.clearCache ) {
       // API requested that the cache be cleared
       ajax = true;
       settings.clearCache = false;
   }
   else if ( cacheLower < 0 || requestStart < cacheLower || requestEnd > cacheUpper ) {
       // outside cached data - need to make a request
       ajax = true;
   }
   else if ( JSON.stringify( request.order )   !== JSON.stringify( cacheLastRequest.order ) ||
             JSON.stringify( request.columns ) !== JSON.stringify( cacheLastRequest.columns ) ||
             JSON.stringify( request.search )  !== JSON.stringify( cacheLastRequest.search )
   ) {
       // properties changed (ordering, columns, searching)
       ajax = true;
   }
    
   // Store the request for checking next time around
   cacheLastRequest = $.extend( true, {}, request );

 //  alert("vvv ajax "+ajax+"  draw "+request.draw);
   if ( ajax ) {
       // Need data from the server
       if ( requestStart < cacheLower ) {
           requestStart = requestStart - (requestLength*(conf.pages-1));

           if ( requestStart < 0 ) {
               requestStart = 0;
           }
       }
        
       cacheLower = requestStart;
       cacheUpper = requestStart + (requestLength * conf.pages);

       request.start = requestStart;
       request.length = requestLength*conf.pages;

       // Provide the same `data` options as DataTables.
       if ( typeof conf.data === 'function' ) {
           // As a function it is executed with the data object as an arg
           // for manipulation. If an object is returned, it is used as the
           // data object to submit
           var d = conf.data( request );
           if ( d ) {
               $.extend( request, d );
           }
       }
       else if ( $.isPlainObject( conf.data ) ) {
           // As an object, the data given extends the default
           $.extend( request, conf.data );
       }

       settings.jqXHR = $.ajax( {
           "type":     conf.method,
           "url":      conf.url,
           "data":     request,
           "dataType": "json",
           "cache":    false,
           "success":  function ( json ) {
               cacheLastJson = $.extend(true, {}, json);
					
                if ( cacheLower != drawStart ) {
                   json.data.splice( 0, drawStart-cacheLower );
               }
               if ( requestLength >= -1 ) {
                   json.data.splice( requestLength, json.data.length );
               }
                
               drawCallback( json ); 
           }
       
		     
       } );
   }
   else {
       json = $.extend( true, {}, cacheLastJson );
       json.draw = request.draw; // Update the echo for each response
       json.data.splice( 0, requestStart-cacheLower );
       json.data.splice( requestLength, json.data.length );

       drawCallback(json);
   }
}
};

//Register an API method that will empty the pipelined data, forcing an Ajax
//fetch on the next draw (i.e. `table.clearPipeline().draw()`)
$.fn.dataTable.Api.register( 'clearPipeline()', function () {
return this.iterator( 'table', function ( settings ) {
   settings.clearCache = true;
} );
} );


//
//DataTables initialisation
//

var appUrl;
var token;
var header;
var emailForm;


$(document).ready(function() {
/* 	$.validator.addMethod("emailcheck", function(value, element) {
        var re = /^(([^<>(){}[\]\\.,;:\s@\"]+(\.[^<>(){}[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return this.optional(element) || re.test(value);
    }, "<spring:message code="label.validEmail_msgrequired"/>"); */
	/*  $("#cc").keyup(
				function(){
				    var one=$(this).val();
				    $("#ttip").fadeIn().text(one);
				    }
				);
	 $("#emailadd").keyup(
				function(){
				    var one=$(this).val();
				    $("#ttip1").fadeIn().text(one);
				    }
				); */
	
	appUrl="<%=appUrl%>";
	  token = $("meta[name='_csrf']").attr("content");
	  header = $("meta[name='_csrf_header']").attr("content");	
	
	  
	/*MG   $('#companies tfoot th').each( function () {
      	var title = $(this).text();
	        $(this).html( '<input type="text" placeholder="Search '+title+'" />');
	    }); */
	  
	    
	    var i=0;
		 $('#CompletedDocumentsTable tfoot th').each( function () {
		        var title = $(this).text();
		     //   console.log(title);
		    if(i!=0 && i!=4){
		    	$(this).html( '<input type="text" placeholder="<spring:message code="label.filter"/>" />' );
		    }
		    else{
		    	$(this).html( '' );
		    }
		    
		    i++;
		        
		    });
			 
		
	  
var table = $('#CompletedDocumentsTable').DataTable( {
 "processing": false,
 "serverSide": true,
 "responsive":false,
 "order": [[ 3, "desc" ]],		//sets default Assigned Date column in DESC order and also removes order icon from 0th column
 "ajax": $.fn.dataTable.pipeline( {
     url: appUrl+"/app/history/newcompletedDocumentServerSidePagination/",
     pages: 10 		// number of pages to cache
    
 } ),
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
/* fnInitComplete : function() {
 	      if ($(this).find('tbody tr').length<=1) {
 	         $(this).parent().parent().parent().hide();
 	   	 	$('#datanotAvailable').show();
 	      }else{
 	    	 $('#datanotAvailable').hide();
 	      }
}, */ 
/*    "columns" : [
	   	 	{"data" : "docId"},
         	{"data" : "documentName"},
         	{"data" : "requestedEmail"},] */  
         	
"columns": [
  {
      "className":      'details-control',
      "orderable":      false,
      "data":           null,
      "defaultContent": ''
  },
  
  { "data": "subject"},
  /* { "data": "signType" }, */
  
  {
      "orderable":      true,
      "data":           null,
   // "defaultContent": ''
   	"targets": 2,
        "render": function (data, type, row) {      	
        	//var signTypeValue="getSignTypeVal('"+data.signType+"')";
        	
        	// var emailIcon='<a href="#"  onClick="'+openemail+'"><i class="fa fa-envelope-o" aria-hidden="true" data-backdrop="static" data-keyboard="false"></i></a>';
          	return getSignTypeVal(data.signType);              
       } 
  },
  
  { "data": "completedDate" },
  {
      "orderable":      false,
      "data":           null,
   // "defaultContent": ''
   	"targets": 4,
        "render": function (data, type, row) {      	
        	var openemail="openEmailModal('"+data.docId+"')";
        	 var emailIcon='<a href="#"  onClick="'+openemail+'"><i class="fa fa-envelope-o" aria-hidden="true" data-backdrop="static" data-keyboard="false"></i></a>';
        	//var deleteDocument="deleteDocument('"+data.envelopeId+"')";
          	//var deleteHtml = '<a href="#" class="text-red" onclick="'+deleteDocument+'"><i class="fa fa-trash" aria-hidden="true"></i></a>';
          	return emailIcon;              
       } 
  }
]         

});
/* jQuery.validator.addMethod("multiemail", function (value, element) {
    if (this.optional(element)) {
        return true;
    }
    var emails = value.split(','),
        valid = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
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

 emailForm=$("#emailform").validate({
	 	/* errorElement: 'p',
   	errorClass: 'error', */
		//specify the validation rules
		rules: {
			email: {
	     		required: true,
	     		//emailcheck:true,
	     	    multiemail:true,
	     		},
	     	cc:{
	     		//emailcheck:true,
	     		 multiemail:true
	     	},	
	     	subject : {
				required : true,
				checkempty : true
			
			},
			message : {
				required : true,
				checkempty : true
			
			}
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
 jQuery.validator.addMethod("checkempty", function(value) {
		return $.trim( value );
		}, "<spring:message code="label.emptyfld"/>");
makeIndividualCompletedDocumentsSearch(table);
// Apply the search //MG
  /* table.columns().every( function () {
      var that = this;
		$( 'input', this.footer() ).on( 'keyup change clear', function () {
		  

      });
  });  */


//Array to track the ids of the details displayed rows

  var openRows = new Array();
     function closeOpenedRows(table, selectedRow) {
    // debugger
      $.each(openRows, function (index, openRow) {
          // not the selected row!
          if ($.data(selectedRow) !== $.data(openRow)) {
              var rowToCollapse = table.row(openRow);
              //rowToCollapse.child.hide();
              rowToCollapse.child( false ).remove();
              openRow.removeClass('details');
              var index = $.inArray(selectedRow, openRows);
              openRows.splice(index, 1);
          }
      });
  }
//Array to track the ids of the details displayed rows

var detailRows = [];
         	
$('#CompletedDocumentsTable tbody').on( 'click', 'tr td.details-control', function () {
  var tr = $(this).closest('tr');
  var row = table.row( tr );
  var idx = $.inArray( tr.attr('id'), detailRows );

  if ( row.child.isShown() ) {
      tr.removeClass( 'details' );
      row.child.hide();

      // Remove from the 'open' array
      detailRows.splice( idx, 1 );
  }

  else {
	  closeOpenedRows(table, tr);	  
      tr.addClass( 'details' );
      //row.child( format( row.data() ) ).show();
      row.child( formatCompleteDocuments( row.data() ) ).show();

      // Add to the 'open' array
      if ( idx === -1 ) {
	    	detailRows.push( tr.attr('id') );
      }
      openRows.push(tr);

  }

} );


});

function getSignTypeVal(signTypeVal){
	//alert(signTypeVal)
	var signType ='';
	if(signTypeVal=='G')
		signType='<spring:message code="label.grp_sgn"/>';
	 else
		signType='<spring:message code="label.selfsign"/>';
	return signType;
}


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
 
    var eVerify = '';
    if(d.countryCode == 'IN'){
    	eVerify = '<tr><td><strong>E-Verified:</strong></td><td>'+d.emudhraStatus+'</td></tr>';
    }
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
   		eVerify +
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



/* function appendCompletedDocumentDatatoDataTable(table,response){

	    var signType="";
		var list= JSON.parse(response.list);
		
		console.log("completed document list:");

		table.clear().draw();
		 list.forEach(function(value, index, array){ 
			 
			 if(value.signType=='G')
				 signType="Group Sign";
			 else
				signType="Self Sign";
		
			// var anchor="<a href="+appUrl+"/app/document/redirect/"+value.envelopeId+">";			 
			//  var buttonhtml="<button onClick=deleteDraft('"+value.envelopeId+"')>"; 
			  //value.subject,value.signType,value.completedDate
			  var openemail="openEmailModal('"+value.docId+"')";
		      var emailIcon='<a href="#"  onClick="'+openemail+'"><i class="fa fa-envelope-o" aria-hidden="true" data-backdrop="static" data-keyboard="false"></i></a>';
		      var rowNode= table.row.add(['',value.subject,signType,value.completedDate,emailIcon]).draw(true).node(); 
	   		  $(rowNode).attr("additionalData",JSON.stringify(value));
		 }); 	
		

	
} */


	function openEmailModal(docid){
	   // alert(docid);
		$("#myEmailModal").modal('toggle');
		$("#docuID").val(docid);
		emailForm.resetForm();
	}

<%-- 	function viewCompletedDocument(docId){
  		var contextPath=$("#contextPath").val();
  		 $.ajax({
			type : "GET",
			url : "<%=appUrl%>/app/downloadFiles/internal",
			data : "docId="+docId,
			success : function(response) {
				
				if(response){
					var a=contextPath+'app/download/internal?fileName='+response+"&docId="+docId;
					PDFObject.embed(a, "#example2",{pdfOpenParams: { toolbar: 0 }});
				//	 document.getElementById('myiframe').src = contextPath+'app/download/internal?fileName='+response+"&docId="+docId;
					 document.getElementById("test2").click();
				//	window.open(contextPath+'app/download/internal?fileName='+response+"&docId="+docId);
					
				}else{
					alert("Error in File Verification.");
				}
				

			}
		}); 
  	} --%>
  	
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


/* (function ($) {
    $('.has-spinner').attr("disabled", false);
    $.fn.buttonLoader = function (action) {
        var self = $(this);
        if (action == 'start') {
            if ($(self).attr("disabled") == "disabled") {
                return false;
            }
            $('.has-spinner').attr("disabled", true);
            $(self).attr('data-btn-text', $(self).text());
            var text = 'Loading';
            console.log($(self).attr('data-load-text'));
            if($(self).attr('data-load-text') != undefined && $(self).attr('data-load-text') != ""){
                var text = $(self).attr('data-load-text');
            }
            $(self).html('<span class="spinner"><i class="fa fa-refresh fa-spin" title="button-loader"></i></span> '+text);
            $(self).addClass('active');
        }
        if (action == 'stop') {
            $(self).html($(self).attr('data-btn-text'));
            $(self).removeClass('active');
            $('.has-spinner').attr("disabled", false);
        }
    }
})(jQuery);
 */
 
	
	function makeIndividualCompletedDocumentsSearch(table){
		var i=0;
		 $('#companies tfoot th').each( function () {
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
		         
		             ////////////////////////set interval -----------------------------//
			            
 				/* 	var searchWaitInterval;
		         		searchWaitInterval = setInterval(function(){
					      
		         			clearInterval(searchWaitInterval);
		         			 alert("search  "+searchWaitInterval);
		         			 searchWaitInterval = '';
		         			  
		         		
					         	
		         		},2000);   
		            	 */
						////////////////////////////-------------------------------------------------------------/	    
			        
			           that.search( this.value ).draw();
		        	
		            	
		               
		            }
		        } );
		    } );
	
	}
	

</script>

						
						