<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.authentication.AnonymousAuthenticationToken,org.springframework.security.core.Authentication" %>

<!-- https://stackoverflow.com/questions/33790350/datatables-use-only-specific-parts-of-a-json-object -->
<!-- https://datatables.net/examples/ajax/objects_subarrays.html -->

<!-- https://legacy.datatables.net/release-datatables/examples/server_side/pipeline.html -->
 

<!--these 3 links are added in mystorage.jsp so that paging info does not display twice
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script> -->

 <!--  above datatable scripts for pipeline -->


<% 
String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>

<!-- COMMENTED THE SCRIPT APP.MIN.JS SINCE SIDE-MENU SHOW/HIDE DOES NOT HAPPEN  -->
<%--  <script src="<%=appUrl %>/js/app.min.js"></script>  --%>

<style>
tfoot {
    display: table-header-group;
}
.row{
text-align:left;
}

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
#companies_filter label {
    border-bottom: 1px solid #9FB6C1;
}

.table { 
    overflow: auto;
}
</style>

				
<%-- <table id="companies" class="display" style="width:100%">
              <thead>
                	<tr>
										 <th style="width: 30px"  class="details-control"></th>
										<th style="width: 300px"><spring:message code="label.slf_sub"/> </th>
										<th style="width: 300px"><spring:message code="label.grp_doc"/> </th>
										<th style="width: 170px"><spring:message code="label.asgn-date"/> </th>
										 <th style="width: 150px ;text-align: center;"><spring:message code="label.out_actn"/></th>
     	                        		</tr>
              </thead>
           	
        </table> --%>
        

		
						<table id="companies" class="display table Data_table_heading table-striped table-bordered dt-responsive nowrap" style="width:100%">
								<thead>
									<tr>
										<%-- <th style="width: 10px"  class="details-control"></th>
										<th style="width: 300px"><spring:message code="label.slf_sub"/> </th>
										<th style="width: 300px"><spring:message code="label.grp_doc"/> </th>
										<th style="width: 190px"><spring:message code="label.asgn-date"/> </th>
										<th style="width: 50px ;text-align: center !important;"><spring:message code="label.out_actn"/></th>
									 --%>	
									 
										<th style="width: 10px"  class="details-control"></th>
										<th><spring:message code="label.slf_sub"/> </th>
										<th><spring:message code="label.grp_doc"/> </th>
										<th style="width: 200px"><spring:message code="label.asgn-date"/> </th>
										<%-- <th style="width: 50px ;text-align: center !important;"><spring:message code="label.out_actn"/></th> 		 --%>
										<c:choose>
										     <c:when test="${isInternal == true }">
										          <th style="width: 50px ;text-align: center !important;"><spring:message code="label.out_actn"/></th>
										     </c:when>
										     
										</c:choose>										
     	                        		</tr>
								</thead>
								
							 	<tfoot>
            					<tr>
            					        <th>Plus</th>
                						<th><spring:message code="label.slf_sub"/></th>
                						<th><spring:message code="label.grp_doc"/></th>
                						<th><spring:message code="label.asgn-date"/></th>
                						<%-- <th><spring:message code="label.out_actn"/></th> --%>
                						<c:choose>
										     <c:when test="${isInternal == true }">
										           <th><spring:message code="label.out_actn"/></th>
										     </c:when>
										</c:choose>
            					</tr>
            					</tfoot>
								
								<tbody>
									<tr>
										<td></td>
										<td></td>
										<td></td>						
										<!-- <td></td> -->
										<!-- <td></td> -->			
									</tr>

								</tbody>
							</table>
			

<div id="datanotAvailable" style="text-align: center; display:none" >
<br/><br/><br/><h4><spring:message code="label.nodatavail"/></h4> 
</div>

<div class="Message" id="invalidCallNotify">	
   <div class="modal-header"> 
	  	<!-- <h4 class="modal-title">Invalid Request</h4> -->
	</div>
	  	<div class="modal-body">
 	<p><spring:message code="label.notify_option_avail"/></p> 	
		 </div>	
	  <div class="text-right">	  
		<button type="button" class="btn btn-blue" onclick="hideInvalidCallNotify();"><spring:message code="label.ok"/></button>
	  </div> 	
 </div>

<div class="Message" id="invalidCallReassign">	
   <div class="modal-header"> 
	  	<!-- <h4 class="modal-title">Invalid Request</h4> -->
	</div>
	  	<div class="modal-body">
 	<p><spring:message code="label.reassign_option_avail"/></p> 	
		 </div>	
	  <div class="text-right">	  
		<button type="button" class="btn btn-blue" onclick="hideInvalidCallReassign();"><spring:message code="label.ok"/></button>
	  </div> 	
 </div>

						
<div class="Message" id="deleteDocument">	
   <div class="modal-header">
	 
	  	<h4 class="modal-title"><spring:message code="label.comp_delete"/></h4>
	</div>
	  	
	  	<div class="modal-body">
		 	<p><spring:message code="label.delte-confirm"/></p>
		 	
		 </div>	
	 	 
	  <div class="text-right">	  
		<button type="button" class="btn btn-light" onclick="hiderOutForSignatureDocumentPopUp();"><spring:message code="label.cancel"/></button>
		<button type="button" class="btn btn-blue" onclick="deleteOutForSignatureDocumentPopUp();"><spring:message code="label.out_confm"/></button>
		
	  </div> 	
 </div>
 
 <div class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false"  id="recentActionShow">	
   <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
    <div class="modal-header" >
    	<h4 class="modal-title"><spring:message code="label.rcntaction"/></h4>
	  <!--	<a class="close" href="#" onclick="recentActionClose();"> x
	  		  <button type="button" class="close" data-dismiss="modal">xï¿½</button> 
	  	</a>-->
	</div>
  	<div class="modal-body">
  		 <div id="actionShow">
		 </div>	
	</div>
	<div class="text-right">	  
		<button type="button" class="btn btn-blue" id="" onclick="recentActionClose();" data-dismiss="modal"><spring:message code="label.ok"/></button>
		
	</div> 
	</div>
	</div>
</div>
   <div class=" modal fade" role="dialog" data-backdrop="static" data-keyboard="false" id="sendreminder">	
      <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
    <div class="modal-header">
    	<h4 class="modal-title"><spring:message code="label.reminder"/></h4>
	  	<!-- <a class="close" href="#" onclick="hiderReminderPopUp();">
	  		<button type="button" class="close" data-dismiss="modal">Ã—</button>
	  	</a> -->
	</div>
	
  	 <div class="modal-body">
  		 
		 	<p><spring:message code="label.remd_success"/></p>
		 
	  </div>
		 
	  <div class="text-right">	  
		<button type="button" class="btn btn-light" onclick="hiderReminderPopUp();" data-dismiss="modal"><spring:message code="label.cancel"/></button>
		<button type="button" class="btn btn-blue" id="reminderConfirm"  data-dismiss="modal" onclick="sendReminderConfirm();"><spring:message code="label.out_confm"/></button>
		
	  </div> 
	  </div>
	  </div>	
 </div>
 
 <div class=" modal fade" role="dialog" data-backdrop="static" data-keyboard="false" id="senddiscard">	
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
    <div class="modal-header">
    <h4 class="modal-title"><spring:message code="label.remove"/></h4>
	  	<!-- <a class="close" href="#" onclick="hiderDiscardPopUp();">
	  		<button type="button" class="close" data-dismiss="modal">Ã—</button>
	  	</a>
	  	 -->
	  	 </div>
  	 <div class="modal-body">
  		 
		 	<p><spring:message code="label.removesucc"/> <span id="sdiscard"></span> <spring:message code="label.removesucc_c"/></p>
		 
	  </div>
		 
	  <div class="text-right">	  
		<button type="button" class="btn btn-light" data-dismiss="modal" onclick="hiderDiscardPopUp();"><spring:message code="label.cancel"/></button>
		<button type="button" class="btn btn-blue" id="discardConfirm" data-dismiss="modal" onclick="sendDiscardConfirm();"><spring:message code="label.out_confm"/></button>
		
	  </div>
	  </div>
	  </div> 	
 </div>
 
 
 <div class="modal fade" id="sendreassign" role="dialog" data-backdrop="static" data-keyboard="false" >	
 <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
  <form action="" class="formName" id="sendReassignedForm">
    <div class="modal-header">
    	<h4 class="model-title"><spring:message code="label.reassign"/></h4>
	  	<!-- <a class="close" href="#" onclick="hiderReassignPopUp();">
	  		<button type="button" class="close" data-dismiss="modal">Ã—</button>
	  	</a> -->
	</div>
  	<div class="modal-body">
	  	<div class="row">
		  	<div class="col-md-12">  		 
				 	<div class="form-horizontal">
				 		<div class="form-group">
				 			<label for="" class="col-sm-4 control-label"><spring:message code="label.tmp-name"/> <span class="redstar">*</span></label>
				 			<div class=" col-sm-8">
				 			<input type="text" id="txtFullname" autocomplete="off" placeholder="<spring:message code="label.rasgn_name"/>" class="form-control" maxlength="30" required />
				 			<span id="nameerror" class="error"></span>
				 			</div>
				 		</div>
				 		<div class="form-group">
				 		
				 			<label for="" class="col-sm-4 control-label"><spring:message code="label.grp_email"/><span class="redstar">*</span></label>
				 			<div class=" col-sm-8">
				 			<input type="text" id="txtEmail" autocomplete="off" placeholder="<spring:message code="label.rasgn_email"/>" class="form-control" maxlength="70" required />
				 		<span id="emailerror" class="error"></span>
				 		</div>
				 		</div>	
				    </div>
			</div>
			<div class="col-md-12">
				<div class="text-right">	  
					<button type="button" class="btn btn-light" data-dismiss="modal" onclick="hiderReassignPopUp();"><spring:message code="label.cancel"/></button>
					<button type="button" class="btn btn-blue" id="" data-dismiss="modal" onclick="sendReassignConfirm();"><spring:message code="label.out_confm"/></button>
					
				</div>
			</div>
		</div>
	</div>

	 
 </form>
 </div>
 </div>	
</div>

<div class="modal fade" id="eSignReassign" role="dialog" data-backdrop="static" data-keyboard="false" >	
 	<div class="modal-dialog">
    <!-- Modal content-->
	    <div class="modal-content">
		    <div class="modal-header">
			  	<button type="button" class="close" data-dismiss="modal" onclick="hiderESignReassignPopUp();">x</button>
			</div>
		  	<div class="modal-body">
			  	<p><spring:message code="label.sure_reassign_eSign"/></p>
			</div>
			<div class="text-right">	  
				<button type="button" class="btn btn-light" data-dismiss="modal" onclick="hiderESignReassignPopUp();"><spring:message code="label.no"/></button>
				<button type="button" class="btn btn-blue" id="" data-dismiss="modal" onclick="showESignReassignConfirm();"><spring:message code="label.ys"/></button>	
			</div>
		</div>
	</div>	
</div>

 
   <div class="modal fade" id="actiondone" role="dialog" data-backdrop="static" data-keyboard="false">	
    <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
     <div class="modal-header">
    <h4 class="modal-title"><spring:message code="label.out_don"/></h4>
	  <!-- 	<a class="close" href="#" onclick="hiderDonePopUp();">
	  		<button type="button" class="close" data-dismiss="modal">Ã—</button>
	  	</a>  -->
	  	 </div>
  	 <div class="modal-body">  		
		 	<p><span id="spanDone"></span></p>		 
	  </div>
		 
	  <div class="text-right">	 
			<button type="button" class="btn btn-blue" data-dismiss="modal" onclick="hiderDonePopUp();" ><spring:message code="label.ok"/></button>
	  </div> 
	  </div>
	  </div>	
 </div>
 
 <!-- Modal for Emudhra Code -->
 
 <!-- Delete Modal for single Auth signer  -->
  <div class=" modal fade" role="dialog" data-backdrop="static" data-keyboard="false" id="sendDiscardSingleAuth">	
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
    <div class="modal-header">
    <h4 class="modal-title"><spring:message code="label.remove"/></h4>
	  	<!-- <a class="close" href="#" onclick="hiderDiscardPopUp();">
	  		<button type="button" class="close" data-dismiss="modal">Ã—</button>
	  	</a>
	  	 -->
	  	 </div>
  	 <div class="modal-body">
  		 	<p><spring:message code="label.remove_authsinglesigner"/></p>
		 	<p><spring:message code="label.removesucc"/> <span id="sendDiscardSingleAuthEmail"></span> <spring:message code="label.removesucc_c"/></p>
		 
	  </div>
		 
	  <div class="text-right">	  
		<button type="button" class="btn btn-light" data-dismiss="modal" onclick="hiderDiscardPopUp();"><spring:message code="label.cancel"/></button>
		<button type="button" class="btn btn-blue" id="discardConfirm" data-dismiss="modal" onclick="sendDiscardConfirm();"><spring:message code="label.out_confm"/></button>
		
	  </div>
	  </div>
	  </div> 	
 </div>
 
 <!-- Delete Modal for Auth signer but signed by all Signatory -->
  <div class=" modal fade" role="dialog" data-backdrop="static" data-keyboard="false" id="sendDiscardAuthSigner">	
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
    <div class="modal-header">
    <h4 class="modal-title"><spring:message code="label.remove"/></h4>
	  	<!-- <a class="close" href="#" onclick="hiderDiscardPopUp();">
	  		<button type="button" class="close" data-dismiss="modal">Ã—</button>
	  	</a>
	  	 -->
	  	 </div>
  	 <div class="modal-body">
  		 	<p><spring:message code="label.remove_authsignercompletedoc"/></p>
		 	<p><spring:message code="label.removesucc"/> <span id="sendDiscardAuthSignerEmail"></span> <spring:message code="label.removesucc_c"/></p>
		 
	  </div>
		 
	  <div class="text-right">	  
		<button type="button" class="btn btn-light" data-dismiss="modal" onclick="hiderDiscardPopUp();"><spring:message code="label.cancel"/></button>
		<button type="button" class="btn btn-blue" id="discardConfirm" data-dismiss="modal" onclick="sendDiscardConfirm();"><spring:message code="label.out_confm"/></button>
		
	  </div>
	  </div>
	  </div> 	
 </div>
 
 <!-- Delete Modal for Auth signer , the signer above not signed yet -->
  <div class=" modal fade" role="dialog" data-backdrop="static" data-keyboard="false" id="sendDiscardAuth_NotSigned">	
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
    <div class="modal-header">
    <h4 class="modal-title"><spring:message code="label.remove"/></h4>
	  	<!-- <a class="close" href="#" onclick="hiderDiscardPopUp();">
	  		<button type="button" class="close" data-dismiss="modal">Ã—</button>
	  	</a>
	  	 -->
	  	 </div>
  	 <div class="modal-body">
  		 	<p><spring:message code="label.remove_authsigner"/></p>
		 	<p><spring:message code="label.removesucc"/> <span id="sendDiscardAuth_NotSignedEmail"></span> <spring:message code="label.removesucc_c"/></p>
		 
	  </div>
		 
	  <div class="text-right">	  
		<button type="button" class="btn btn-light" data-dismiss="modal" onclick="hiderDiscardPopUp();"><spring:message code="label.cancel"/></button>
		<button type="button" class="btn btn-blue" id="discardConfirm" data-dismiss="modal" onclick="sendDiscardConfirm();"><spring:message code="label.out_confm"/></button>
		
	  </div>
	  </div>
	  </div> 	
 </div>
 
 
 <!-- Emudhra modal End -->
 
 <div class="overlay-bg"></div>
   
   
<input type="hidden" id="docId" value=""/>
<input type="hidden" id="signerEmailId" value=""/>	
   
<input type="hidden" id="aOldEmail" value=""/>
<input type="hidden" id="aSignerList" value=""/>
<input type="hidden" id="RsignerName" value=""/>
<input type="hidden" id="RsignerEmailId" value=""/>
<input type="hidden" id="RenvelopeId" value=""/>
<input type="hidden" id="RdocumentName" value=""/>
<input type="hidden" id="RrequestedBy" value=""/>
<input type="hidden" id="RdocId" value=""/>
<input type="hidden" id="RsignerId" value=""/>
<input type="hidden" id="Rid" value=""/>
<input type="hidden" id="dPriority" value=""/>


<script>


//
//Pipelining function for DataTables. To be used to the `ajax` option of DataTables
//
$.fn.dataTable.pipeline = function ( opts ) {

	
 // Configuration options
 var conf = $.extend( {
     pages: 10, //5,     // number of pages to cache
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
  
 //    alert("vvv requestStart "+requestStart+" drawStart"+drawStart+" requestLength:"+requestLength+"  requestEnd:"+requestEnd )
    
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
    
    
$(document).ready(function() {
	$('body').css("overflow","auto");
	$('html').css("overflow","auto");
	appUrl="<%=appUrl%>";
	  token = $("meta[name='_csrf']").attr("content");
	  header = $("meta[name='_csrf_header']").attr("content");	

	  var show = ${isInternal};  
	  var table="";
	  
	  //true: SHOW DELETE ICON WHEN USER BELONGS TO EXELA-ACCOUNT. false: DONT SHW DELETE ICON.
	  if(show == true){
	       table = $('#companies').DataTable( {
	             //  "processing": true,
	                  "serverSide": true,
	                  "responsive":false,  //to make td clickable to expand set to false
	                  "order": [[ 3, "desc" ]],       //sets default Assigned Date column in DESC order and also removes order icon from 0th column
	                  "ajax": $.fn.dataTable.pipeline({
	                    url: appUrl+"/app/history/getOutForSignServerSideDatatable/",
	                    pages: 10           // number of pages to cache
	                   
	                }),
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
	             "columns": [
	                 {
	                     "className":      'details-control',
	                     "orderable":      false,
	                        "data":           null,
	                        "targets":0,
	                        "defaultContent": ''
	                 },
	                 { "data": "subject","name":"subject"},
	                 { "data": "documentName" },
	                 { "data": "uploadDate" },
	                 {
	                   "orderable": false,
	                   "data": null,
					   "targets": 4,
	                   "render": function (data, type, row) {      
	                             var deleteDocument="deleteDocument('"+data.envelopeId+"')";
	                             var deleteHtml = '<a href="#" class="text-red" onclick="'+deleteDocument+'"><i class="fa fa-trash" aria-hidden="true"></i></a>';
	                             return deleteHtml;              
	                        }
	                 } ]
	               
	             });
	  }else{ 
	  	var  table = $('#companies').DataTable( {
	             //  "processing": true,
	                  "serverSide": true,
	                  "responsive":false,  //to make td clickable to expand set to false
	                  "order": [[ 3, "desc" ]],       //sets default Assigned Date column in DESC order and also removes order icon from 0th column
	                  "ajax": $.fn.dataTable.pipeline({
	                    url: appUrl+"/app/history/getOutForSignServerSideDatatable/",
	                    pages: 10           // number of pages to cache
	                   
	                }),
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
	             "columns": [
	                 {
	                     "className": 'details-control',
	                     "orderable": false,
	                     "data": null,
	                     "targets":0,
	                     "defaultContent": ''
	                 },
	                 { "data": "subject","name":"subject"},
	                 { "data": "documentName" },
	                 { "data": "uploadDate" }
	              ]         
	             });
	  }

	  
/*old code without delte button - 15july2020 vvv
var table = $('#companies').DataTable( {
 //  "processing": true,
   	"serverSide": true,
	"responsive":false,	//to make td clickable to expand set to false
   	"order": [[ 3, "desc" ]],		//sets default Assigned Date column in DESC order and also removes order icon from 0th column
   	"ajax": $.fn.dataTable.pipeline({
    //   url: appUrl+"/app/history/vvvGetServerSideDatatable2/",
       url: appUrl+"/app/history/getOutForSignServerSideDatatable/",
       pages: 10  		// number of pages to cache
      
   }),
   "language": {
        "info": "Displaying  item _START_ - _END_  of _MAX_",
        "emptyTable": "No data available",
        "infoEmpty": ""					//hides the Showing text if 0 records
 	 },
 "columns": [
    {
        "className":      'details-control',
        "orderable":      false,
       	"data":           null,
       	"targets":0,
       	"defaultContent": ''
    },
    { "data": "subject","name":"subject"},
    { "data": "documentName" },
    { "data": "uploadDate" } 
   // ,
   // {
   //     "orderable":      false,
   //     "data":           null,
   //  	"targets": 4,
   //     "render": function (data, type, row) {      	
 	//			var deleteDocument="deleteDocument('"+data.envelopeId+"')";
   //         	var deleteHtml = '<a href="#" class="text-red" onclick="'+deleteDocument+'"><i class="fa fa-trash" aria-hidden="true"></i></a>';
   //         	return deleteHtml;              
 //          }
  //  }  
    ]
  
}); */



makeIndividualOutForSignColumnSearch(table);

//Array to track the ids of the details displayed rows

var openRows = new Array();
   function closeOpenedRows(table, selectedRow) {

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
   
var detailRows = [];
           	
$('#companies tbody').on( 'click', 'tr td.details-control', function () {
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
        row.child( formatOutForSign( row.data() ) ).show();

        // Add to the 'open' array
        if ( idx === -1 ) {
	    	detailRows.push( tr.attr('id') );
        }
        
        openRows.push(tr);
    }

} );


});


/* function appendtoOutForSignatureDatable(table,response){
	 
	 var signType="";
		var list= JSON.parse(response.list);
   console.log("list is ");
		console.dir(list);
		table.clear().draw();
		list.forEach(function(value, index, array){

			
		var deleteDocument="deleteDocument('"+value.envelopeId+"')";
	   	 var deleteHtml='<a href="#" class="text-red" onclick="'+deleteDocument+'"><i class="fa fa-trash" aria-hidden="true"></i></a>';
	   	var rowNode=table.row.add(['',value.subject,value.documentName,value.uploadDate,deleteHtml]).draw(true).node(); 
			$(rowNode).attr("additionalData",JSON.stringify(value));
		
		});  
} */

function formatOutForSign ( d ) {
	//alert("formatOutForSign "+d);
	var displayDocuemntName=d.documentName;
	d.documentName=escape(d.documentName);
	var y=displaySigners(d.signerName,d.signerStatus,d.priority,d.emailCount,d.signerEmailId, d.envelopeId, d.documentName, d.requestedBy, d.subject, d.message,d.docId,d.signerId,d.authSign);
	////var y=displaySignersList(d.signerList,d.envelopeId, d.documentName, d.requestedBy, d.subject, d.message,d.docId);
	
	// `d` is the original data object for the row
  /* d.documentName=unescape(d.documentName); */
  
  /*changes made bySarika*/
   
    if ($(".odd").hasClass("details")) {
    	d.documentName=unescape(d.documentName); 
    }
    else{
    	d.documentName=escape(d.documentName);
    }
  
    return '<table class="noborder" cellpadding="5" cellspacing="0" border="0" style=" width: 100%;">'+
    	'<tr>'+
        '<td><strong><spring:message code="label.grp_doc"/>:</strong></td>'+
        '<td>'+displayDocuemntName+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<img type="button" class="pointer" onclick="view(\''+d.envelopeId+'\');"  title="Download" src="<%=appUrl%>/images/download-20.png"></td>'+
    	'</tr>'+  
    	'<tr>'+
            '<td><strong><spring:message code="label.comp_reqstdby"/>:</strong></td>'+
            '<td>'+d.requestedBy+'</td>'+
        '</tr>'+  
        '<tr>'+
        	'<td><strong><spring:message code="label.dft_sgn_type"/>:</strong></td>'+
       		'<td>'+y+'</td>'+
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

	
	var submsg=[];
 function displaySigners(signerName,signerStatus,priority,emailCount,signerEmailId, envelopeId, documentName, requestedBy, subject, message,docId,signerId,authSign) {

		var sn=signerName.split(",");
		var ss=signerStatus.split(",");
		var si=signerId.split(",");
		var pp=priority.split(",");
		//alert(emailCount);
		//var ec=emailCount.split(",");
		var eID=signerEmailId.split(",");
		var eSignFlag=authSign.split(",");
		var msg=''; 
		 //message=message.replace(/\n|\r/g, "").split( "\"" ).join( "\\\"" ).split( "'" ).join( "\\'" ); 	
		 //subject= subject.replace(/\n|\r/g, "").split( "\"" ).join( "\\\"" ).split( "'" ).join( "\\'" ); 
      	var envelop={};
      	envelop.subject=subject;
      	envelop.message=message;
   
		submsg[envelopeId]=envelop; 
		
	/* 	 var envelopeId = envelopeId.split(",");
		var documentName = documentName.split(",");
		var requestedBy = requestedBy.split(",");
		var subject = subject.split(",");
		var message = message.split(","); */ 
		
		$("#signerEmailId").val(eID);
	
		if(pp[0] == 0){
			var content = "<table class='table table-bordered table-signers'><tr><th><spring:message code="label.tmp-name"/></th><th><spring:message code="label.grp_email"/></th><th><spring:message code="label.comp_sts"/></th><th width='20%'><spring:message code="label.out_actn"/></th></tr>";
			//	var content = "<table class='table table-bordered'><tr><th>Name</th><th>Email ID</th><th>Status</th></tr>";
			for(i=0; i<sn.length; i++){
				if(eSignFlag[i] == "1"){
				if((ss[i] == "0" || ss[i] == "false")){
					
				var emailID = escapeChar(eID[i]); 
				
					content += '<tr><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="badge badge-workInProgress" style="cursor: context-menu;"><spring:message code="label.wting"/></button></td><td><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.info_label"/>" id="send_info_'+i+'" src="<%=appUrl %>/images/info.png"  onclick="sendInfo(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.notify"/>" id="send_reminder_'+i+'" src="<%=appUrl %>/images/Notify_icon.png"  onclick="sendReminder(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.reassign"/>" id="send_raessign_'+i+'" src="<%=appUrl %>/images/re-assign_icon.png"  onclick="sendReassign(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\',\''+eID+'\',\''+eSignFlag[i]+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.remove"/>" id="send_discard_'+i+'" src="<%=appUrl %>/images/Discard_icon.png" onclick="sendDiscard(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\',0,\''+eSignFlag[i]+'\',\''+ss[i-1]+'\')"><img data-toggle="tooltip" data-placement="top" title="Authorized Signatory" id="auth_sign_'+i+'" src="<%=appUrl %>/images/authorized-signatory-icon.png" /></td></tr>';
					//content += '<tr><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="btn btn-red">WAITING</button></td></tr>';
				}//else if((ss[i] == "0" || ss[i] == "false") ){
			   		//content += '<tr><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="btn btn-red">WAITING</button></td><td>'+ec[i]+'&nbsp;&nbsp;<button type="button" class="btn-sm btn-warning"  onclick="sendReminder(\''+sn[i]+'\',\''+eID[i]+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+subject+'\',\''+message+'\',\''+docId.toString()+'\')" class="btn btn-yellow">REMIND</button></td></tr>';
				else if(ss[i] == "1" || ss[i] == "true"){
					content += '<tr><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button style="cursor: context-menu;" type="button" class="badge badge-workSigned"><spring:message code="label.sgned"/></button></td><td></td></tr>';
				}
				}else{
					if((ss[i] == "0" || ss[i] == "false")){
						
						var emailID = escapeChar(eID[i]); 
						
							content += '<tr><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="badge badge-workInProgress" style="cursor: context-menu;"><spring:message code="label.wting"/></button></td><td><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.info_label"/>" id="send_info_'+i+'" src="<%=appUrl %>/images/info.png"  onclick="sendInfo(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.notify"/>" id="send_reminder_'+i+'" src="<%=appUrl %>/images/Notify_icon.png"  onclick="sendReminder(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.reassign"/>" id="send_raessign_'+i+'" src="<%=appUrl %>/images/re-assign_icon.png"  onclick="sendReassign(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\',\''+eID+'\',\''+eSignFlag[i]+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.remove"/>" id="send_discard_'+i+'" src="<%=appUrl %>/images/Discard_icon.png" onclick="sendDiscard(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\',0,\''+eSignFlag[i]+'\',\''+ss[i-1]+'\')"></td></tr>';
							//content += '<tr><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="btn btn-red">WAITING</button></td></tr>';
						}//else if((ss[i] == "0" || ss[i] == "false") ){
					   		//content += '<tr><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="btn btn-red">WAITING</button></td><td>'+ec[i]+'&nbsp;&nbsp;<button type="button" class="btn-sm btn-warning"  onclick="sendReminder(\''+sn[i]+'\',\''+eID[i]+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+subject+'\',\''+message+'\',\''+docId.toString()+'\')" class="btn btn-yellow">REMIND</button></td></tr>';
						else if(ss[i] == "1" || ss[i] == "true"){
							content += '<tr><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button style="cursor: context-menu;" type="button" class="badge badge-workSigned"><spring:message code="label.sgned"/></button></td><td></td></tr>';
						}
				}
			}
			content += "</table>"
		}else{
			
			//var emailID = escapeChar(eID[i]);
		var content = "<table class='table  table-bordered table-signers'><tr><th><spring:message code="label.grp_prio"/></th><th><spring:message code="label.tmp-name"/></th><th><spring:message code="label.grp_email"/></th><th><spring:message code="label.comp_sts"/></th><th width='20%'><spring:message code="label.out_actn"/></th></tr>";
		
			for(i=0; i<sn.length; i++){
				var emailID = escapeChar(eID[i]); 
				var eIDEscape =  escapeChar(eID[i]);
				if(eSignFlag[i] == "1"){
					//esign -true  :e-Sign Authority to signatory
					if((ss[i] == "0" || ss[i] == "false")){
					if(i>0 && ss[i-1] == "0"){
						content += '<tr><td>'+pp[i]+'</td><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button style="cursor: context-menu;" type="button" class="badge badge-workInProgress"><spring:message code="label.wting"/></button></td><td><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.info_label"/>" id="send_info_'+i+'" src="<%=appUrl %>/images/info.png"  onclick="sendInfo(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.notify"/>" id="send_reminder_'+i+'" src="<%=appUrl %>/images/Notify_icon.png"  onclick="invalidCallNotify()"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.reassign"/>"  id="send_raessign_'+i+'" src="<%=appUrl %>/images/re-assign_icon.png"  onclick="invalidCallReassign()"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.remove"/>" id="send_discard_'+i+'" src="<%=appUrl %>/images/Discard_icon.png" onclick="sendDiscard(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\',0,\''+eSignFlag[i]+'\',\''+ss[i-1]+'\')"><img data-toggle="tooltip" data-placement="top" title="Authorized Signatory" id="auth_sign_'+i+'" src="<%=appUrl %>/images/authorized-signatory-icon.png" /></td></tr>';
					}
					else{
						content += '<tr><td>'+pp[i]+'</td><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button style="cursor: context-menu;" type="button" class="badge badge-workInProgress"><spring:message code="label.wting"/></button></td><td><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.info_label"/>" id="send_info_'+i+'" src="<%=appUrl %>/images/info.png"  onclick="sendInfo(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.notify"/>" id="send_reminder_'+i+'" src="<%=appUrl %>/images/Notify_icon.png"  onclick="sendReminder(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.reassign"/>"  id="send_raessign_'+i+'" src="<%=appUrl %>/images/re-assign_icon.png"  onclick="sendReassign(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\',\''+eID+'\',\''+eSignFlag[i]+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.remove"/>" id="send_discard_'+i+'" src="<%=appUrl %>/images/Discard_icon.png" onclick="sendDiscard(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\',0,\''+eSignFlag[i]+'\',\''+ss[i-1]+'\')"><img data-toggle="tooltip" data-placement="top" title="Authorized Signatory" id="auth_sign_'+i+'" src="<%=appUrl %>/images/authorized-signatory-icon.png" /></td></tr>';	
						}
				}else if(ss[i] == "1" || ss[i] == "true"){
					content += '<tr><td>'+pp[i]+'</td><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button style="cursor: context-menu;" type="button" class="badge badge-workSigned"><spring:message code="label.sgned"/></button></td><td></td></tr>';	
					}
				}else{
					//esign -false  :e-Sign Authority to signatory
					if((ss[i] == "0" || ss[i] == "false")){
						if(i>0 && ss[i-1] == "0"){
							content += '<tr><td>'+pp[i]+'</td><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button style="cursor: context-menu;" type="button" class="badge badge-workInProgress"><spring:message code="label.wting"/></button></td><td><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.info_label"/>" id="send_info_'+i+'" src="<%=appUrl %>/images/info.png"  onclick="sendInfo(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.notify"/>" id="send_reminder_'+i+'" src="<%=appUrl %>/images/Notify_icon.png"  onclick="invalidCallNotify()"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.reassign"/>"  id="send_raessign_'+i+'" src="<%=appUrl %>/images/re-assign_icon.png"  onclick="invalidCallReassign()"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.remove"/>" id="send_discard_'+i+'" src="<%=appUrl %>/images/Discard_icon.png" onclick="sendDiscard(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\',0,\''+eSignFlag[i]+'\',\''+ss[i-1]+'\')"></td></tr>';
						}
						else{
							content += '<tr><td>'+pp[i]+'</td><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button style="cursor: context-menu;" type="button" class="badge badge-workInProgress"><spring:message code="label.wting"/></button></td><td><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.info_label"/>" id="send_info_'+i+'" src="<%=appUrl %>/images/info.png"  onclick="sendInfo(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.notify"/>" id="send_reminder_'+i+'" src="<%=appUrl %>/images/Notify_icon.png"  onclick="sendReminder(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.reassign"/>"  id="send_raessign_'+i+'" src="<%=appUrl %>/images/re-assign_icon.png"  onclick="sendReassign(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\',\''+eID+'\',\''+eSignFlag[i]+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="<spring:message code="label.remove"/>" id="send_discard_'+i+'" src="<%=appUrl %>/images/Discard_icon.png" onclick="sendDiscard(\''+sn[i]+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si[i]+'\',\''+i+'\',0,\''+eSignFlag[i]+'\',\''+ss[i-1]+'\')"></td></tr>';	
							}
					}else if(ss[i] == "1" || ss[i] == "true"){
						content += '<tr><td>'+pp[i]+'</td><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button style="cursor: context-menu;" type="button" class="badge badge-workSigned"><spring:message code="label.sgned"/></button></td><td></td></tr>';	
						}
				}
			}
			content += "</table>"
		}
				
		//alert(msg);
		return content;
	    
	}
	
		function escapeChar(eID){
			return eID.replace(/'/g,"\\'");
			//return eID.replace(/'/g,"'");
		}
 
 

		function invalidCallNotify(){
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
			$("#invalidCallNotify").show();
			$('.overlay-bg').show();
			$('.overlaywhite_bg').show();
		}

		function invalidCallReassign(){
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
			$("#invalidCallReassign").show();
			$('.overlay-bg').show();
			$('.overlaywhite_bg').show();
			}

		function hideInvalidCallNotify(){
			$("#invalidCallNotify").hide();
			$('.overlay-bg').hide();
			$('.overlaywhite_bg').hide();
		}

		function hideInvalidCallReassign(){
			$("#invalidCallReassign").hide();
			$('.overlay-bg').hide();
			$('.overlaywhite_bg').hide();
		}

		function view(envId){
			var token = $("meta[name='_csrf']").attr("content");
	  		var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath=$("#contextPath").val();

	 		 $.ajax({
				type : "GET",
				url : "<%=appUrl%>/app/downloadsignerFiles/external",
				data : "envId="+envId,
				beforeSend : function(xhr) {
					//$('#signupbtn').buttonLoader('start');
					xhr.setRequestHeader(header, token);
			
				},
				success : function(response) {
					
					if(response){
						  window.location.assign(contextPath+'app/downloadsigner/external?fileName='+response+"&envId="+envId);
					
					}else{
						alert("<spring:message code="label.comp_err_ver"/>");
					}
					

				}
			}); 
		 }			
			
		function deleteDocument(docId){
			//alert(docId);
			$("#docId").val(docId)
			$('.overlay-bg').show();
		     
			$('#deleteDocument').show();
			$('.overlaywhite_bg').show();
		}
				
		
		function deleteOutForSignatureDocumentPopUp(){
			
			var docId=$("#docId").val();
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath=$("#contextPath").val();
			$.ajax({
				//contentType : 'application/json; charset=utf-8',
				type : "GET",
				url : contextPath+"app/deleteDocumentByEnvelopeId?docId="+docId,
				beforeSend : function(xhr) {
					//$('#signupbtn').buttonLoader('start');
					xhr.setRequestHeader(header, token);
				},
				complete : function() {
					//$("#signupbtn").buttonLoader('stop');
				},success : function(response) {
					//alert(response);
					if(response == "success"){
						$("#deleteDocument").hide();
						$('.overlaywhite_bg').hide();
						$('.overlay-bg').hide();
						var table=$('#companies').DataTable();
						getOutForSignatureData();
					}else{
						alert('<spring:message code="label.err"/>');
					}
				},
				error: function(xhr, textStatus, errorThrown)
				{
				 	alert('<spring:message code="label.loading_error"/>');
				 	return false;
				}
			})	
			
		}
				
				
		function hiderOutForSignatureDocumentPopUp(){
			$('.overlay-bg').hide();
			$('#deleteDocument').hide();
			$('.overlaywhite_bg').hide();
		}
			
				
		function sendDiscard(signerName,signerEmailId,envelopeId,documentName,requestedBy,docId,signerId,id,priority,eSignFlag,prevSignerStatus){
		
			/*  alert("signerEmailId "+signerEmailId+" envelopeId:"+envelopeId+
		        		" documentName:"+documentName+" requestedBy:"+requestedBy+" docId:"+docId+
		        		" signerId:"+signerId+"  signerId:"+signerId+" id"+id+" priority: "+priority); */

		    var token = $("meta[name='_csrf']").attr("content");
		    var header = $("meta[name='_csrf_header']").attr("content");
		    var contextPath=$("#contextPath").val();
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
			
			var countryCode = '<c:out value="${countryCode}"></c:out>';
			
			if(countryCode == "US"){
				
			$('.overlay-bg').show();
			$('.overlaywhite_bg').show();
			$("#senddiscard").modal('toggle');
			
			$("#RsignerName").val(signerName);
			$("#RsignerEmailId").val(signerEmailId);
			$("#RenvelopeId").val(envelopeId);
			$("#RdocumentName").val(documentName);
			$("#RrequestedBy").val(requestedBy);
			$("#RdocId").val(docId);
			$("#RsignerId").val(signerId);
			$("#dPriority").val(priority);
			
			$("#sdiscard").html(signerName+" <strong>("+signerEmailId+")</strong>");
			
			}
			else{
				
				
				$.ajax({
					type : "GET",
					url : contextPath+"app/getSignerListToDiscard?docId="+docId,
				    beforeSend: function (xhr) {
			   			xhr.setRequestHeader(header, token);
			   			$("#loader2").show();
				    },
				    complete: function () {
				    	$("#loader2").hide();
				    
				    },
			        success : function(response) {
			         	if(response != 'failed'){
			         		
			         		for(var i=0;i<response.length ; i++){
			         			
			         			if(response[i].signerId ==signerId && response[i].authSignEmudhra ) {
			         				
			    					if( response.length == 1) {
			    						$('.overlay-bg').show();
				    					$('.overlaywhite_bg').show();
				    					$("#sendDiscardSingleAuth").modal('toggle');
				    					
				    					$("#RsignerName").val(signerName);
				    					$("#RsignerEmailId").val(signerEmailId);
				    					$("#RenvelopeId").val(envelopeId);
				    					$("#RdocumentName").val(documentName);
				    					$("#RrequestedBy").val(requestedBy);
				    					$("#RdocId").val(docId);
				    					$("#RsignerId").val(signerId);
				    					$("#dPriority").val(priority);
				    					
				    					$("#sendDiscardSingleAuthEmail").html(signerName+" <strong>("+signerEmailId+")</strong>");
			    						break;
			    					}
			    					else {
			    						
			    						if(response[response.length - 2].signStatus == 1 || response[response.length - 2].signStatus == 2) {
			    							
			    							$('.overlay-bg').show();
					    					$('.overlaywhite_bg').show();
					    					$("#sendDiscardAuthSigner").modal('toggle');
					    					
					    					$("#RsignerName").val(signerName);
					    					$("#RsignerEmailId").val(signerEmailId);
					    					$("#RenvelopeId").val(envelopeId);
					    					$("#RdocumentName").val(documentName);
					    					$("#RrequestedBy").val(requestedBy);
					    					$("#RdocId").val(docId);
					    					$("#RsignerId").val(signerId);
					    					$("#dPriority").val(priority);
					    					
					    					$("#sendDiscardAuthSignerEmail").html(signerName+" <strong>("+signerEmailId+")</strong>");
			    							
			    							break;
			    						}
			    						else {
			    							$('.overlay-bg').show();
					    					$('.overlaywhite_bg').show();
					    					$("#sendDiscardAuth_NotSigned").modal('toggle');
					    					
					    					$("#RsignerName").val(signerName);
					    					$("#RsignerEmailId").val(signerEmailId);
					    					$("#RenvelopeId").val(envelopeId);
					    					$("#RdocumentName").val(documentName);
					    					$("#RrequestedBy").val(requestedBy);
					    					$("#RdocId").val(docId);
					    					$("#RsignerId").val(signerId);
					    					$("#dPriority").val(priority);
					    					
					    					$("#sendDiscardAuth_NotSignedEmail").html(signerName+" <strong>("+signerEmailId+")</strong>");
			    							break;
			    						}
			    					}
			    				}
			    				else if(response[i].signerId ==signerId && !response[i].authSignEmudhra){
			    					
			    					$('.overlay-bg').show();
			    					$('.overlaywhite_bg').show();
			    					$("#senddiscard").modal('toggle');
			    					
			    					$("#RsignerName").val(signerName);
			    					$("#RsignerEmailId").val(signerEmailId);
			    					$("#RenvelopeId").val(envelopeId);
			    					$("#RdocumentName").val(documentName);
			    					$("#RrequestedBy").val(requestedBy);
			    					$("#RdocId").val(docId);
			    					$("#RsignerId").val(signerId);
			    					$("#dPriority").val(priority);
			    					
			    					$("#sdiscard").html(signerName+" <strong>("+signerEmailId+")</strong>");
			    					break;
			    				}
			         		}
			         		
			         	}
			         	else{
			         		alert("Something went wrong Failed Response");
			         	}
			        },
					 error : function(e) {  
						    alert('Error: Something wrong' + e);   
						}
				    
				});
				
			}
		}

		function hiderDiscardPopUp(){
			$('.overlay-bg').hide();
			$('.overlaywhite_bg').hide();
			$("#senddiscard").hide();
		}
		
		
		function hiderDonePopUp(){
			/* $('.overlay-bg').hide();
			$("#actiondone").hide();
			$('.overlaywhite_bg').hide(); */
			//location.reload();
			 $(".sidebar-mini").find('.modal-backdrop').removeClass("modal-backdrop fade in");
			 $(".sidebar-mini").removeClass("modal-open");
			getOutForSignatureData();
			//$(body).removeClass("modal-backdrop fade in");
			//after sendDiscardConfirm() on click of Done refresh by calling getOutForSignatureData()				
		}

		 function sendDiscardConfirm(){
			 
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			
			var signerName = $("#RsignerName").val();
			var signerEmailId = $("#RsignerEmailId").val();
			var envelopeId = $("#RenvelopeId").val();
			var documentName = $("#RdocumentName").val();
			var requestedBy = $("#RrequestedBy").val();
			var docId = $("#RdocId").val();
			var signerId = $("#RsignerId").val();
			var priority = $("#dPriority").val();
				
			$.ajax({
				type : "POST",
				async: false,
				url : "history/sendDiscard",
				data: {"signerName":signerName, "signerEmailId":signerEmailId, "envelopeId":envelopeId, "documentName":documentName, "requestedBy":requestedBy, "subject":submsg[envelopeId].subject, "message":submsg[envelopeId].message,"docId":docId,"signerId":signerId,"priority":priority},
				 beforeSend: function (xhr) {
		   			xhr.setRequestHeader(header, token);
		   			$("#loader2").show();
			    },
				success : function(response) {
			 		$("#actiondone").modal('toggle');
			 		$('body').css('overflow',"hidden");
		 			$('html').css('overflow',"hidden");
			 		$("#senddiscard").hide();
			 		if(response.FAILURE == "1"){
			 			$("#spanDone").html('<spring:message code="label.DocumentSign"/>'+" "+signerName+".");
			 		}else if(response.FAILURE == "2"){
			 			$("#spanDone").html("Document already rejected by"+" "+signerName+".");
			 		}else {
			 			$("#spanDone").html('<spring:message code="label.sgn_remove_prefix"/> ('+signerEmailId+") <spring:message code="label.sgn_remove_suffix"/>");
			 		
			 		}
			 				
				},
			    complete: function () {
			    	$("#loader2").hide();	//uncommented
			    
			    	
			    }
				 
		  	});
		 }
				    	
				
	 function sendReassign(signerName,oldEmail,envelopeId,documentName,requestedBy,docId,signerId,id,signerList,eSignFlag){
		
	      /* alert("oldEmail "+oldEmail+" signerList: "+signerList+" envelopeId:"+envelopeId+
	        		" documentName:"+documentName+" requestedBy:"+requestedBy+" docId:"+docId+
	        		" signerId:"+signerId+"  signerName:"+signerName+" id"+id); */
		 
		 document.body.scrollTop = 0;
		 document.documentElement.scrollTop = 0;
		    
		    if(eSignFlag == '1'){
		    	$("#eSignReassign").show();
		    	$("#eSignReassign").addClass("in");
		    }else{
		    	$("#sendreassign").show();
		    	$("#sendreassign").addClass("in");
		    }
	 
			//$("#sendreassign").show();
			//$("#sendreassign").addClass("in");
			$('body').css("overflow","hidden");
			$('html').css("overflow","hidden");
	 		$("#txtFullname").val("");
	 		$("#txtEmail").val("");
	 		
	 		
			$('.overlay-bg').show();
			$('.overlaywhite_bg').show();
			
			$("#aOldEmail").val(oldEmail);
			$("#aSignerList").val(signerList);
			$("#RsignerName").val(signerName);
			$("#RenvelopeId").val(envelopeId);
			$("#RdocumentName").val(documentName);
			$("#RrequestedBy").val(requestedBy);
			$("#RdocId").val(docId);
			$("#RsignerId").val(signerId);
			//$("#RdocId").val(id);
			//$("#RsignerEmailId").value(oldEmail);
		}
	 
		function hiderReassignPopUp(){
			$('.overlay-bg').hide();
			$("#sendreassign").hide();
			$("#sendreassign").removeClass("in");
			$('body').css("overflow","auto");
			$('html').css("overflow","auto");
			$('.overlaywhite_bg').hide();
			$("input:text").val("");
			$('#nameerror').hide();
			$('#emailerror').hide();
		}
		function hiderESignReassignPopUp(){
			$('.overlay-bg').hide();
			$("#eSignReassign").hide();
			$("#eSignReassign").removeClass("in");
			$('body').css("overflow","auto");
			$('html').css("overflow","auto");
			$('.overlaywhite_bg').hide();
			$("input:text").val("");
			$('#nameerror').hide();
			$('#emailerror').hide();
		}
		function showESignReassignConfirm(){
			$("#eSignReassign").hide();
			$("#eSignReassign").removeClass("in");
			
			$("#sendreassign").show();
	    	$("#sendreassign").addClass("in");
	    	
	    	$('body').css("overflow","hidden");
			$('html').css("overflow","hidden");
	 		$("#txtFullname").val("");
	 		$("#txtEmail").val("");
	 		
			$('.overlay-bg').show();
			$('.overlaywhite_bg').show();
		}
		 $('#txtFullname').on('keypress', function (e) {
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
 		    if (keychar =="-" || keychar =="!" || keychar =="@" || keychar =="#" || keychar =="$" || keychar =="%" || keychar =="^" || keychar =="&" || keychar =="*" || keychar =="(" || keychar ==")" || keychar =="+" || keychar =="=" || keychar =="/" || keychar =="~" || keychar =="<" || keychar ==">" || keychar =="," || keychar ==";" || keychar ==":" || keychar =="|" || keychar =="?" || keychar =="{" || keychar =="}" || keychar =="[" || keychar =="]" || keychar =="¬" || keychar =="£" || keychar =='"' || keychar =="\\" || keychar=="'" || keychar =="`") {	
	    	e.preventDefault();
	    	return false;
	    } else {
	        return true;
	    }
      		});	
		$(function(){

			   /* $( "#txtFullname" ).bind( 'paste',function()
			   {
				   var regex = new RegExp("[^\\w-_. ]");
			      	 var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
			      		    if (regex.test(key)) {
			      		       event.preventDefault();
			      		       return false;
			      		    }

			    }); */
			$( "#txtFullname" ).bind( 'paste',function()
					   {
					       setTimeout(function()
					       { 
					          //get the value of the input text
					          var data= $( '#txtFullname' ).val() ;
					          //replace the special characters to '' 
					          var dataFull = data.replace(/[^\w\s]/gi, '');
					          //set the new value of the input text without special characters
					          $( '#txtFullname' ).val(dataFull);
					       });

					    });
			}); 
		function validateEmail(email) {
			  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			  return re.test(email);
			}
		$('#txtFullname').on('keypress', function (e) {
		 if ($.trim(txtFullname).length == 0) {
		       // if(txtFullname.length ==0){     //original text
		      //  alert('<spring:message code="label.name_msg"/>');
		           $('#nameerror').show();
		      	  $('#nameerror').html('<spring:message code="label.name_msg"/>');
		            e.preventDefault();
		        } 
		       else{
		    	   $('#nameerror').hide(); 
		    	   }
		});
		     
		$('#txtEmail').on('keypress', function (e) {
			 if ($.trim(txtEmail).length == 0) {
		         // alert('<spring:message code="label.email_msgrequired"/>');
		         $('#emailerror').show();
		           $('#emailerror').html('<spring:message code="label.email_msgrequired"/>');
		           // e.preventDefault();
		           return;
		        }
			 else{
				 $('#emailerror').hide();	 
				 }
			 
			});
		       
		function sendReassignConfirm(){
		
			//alert("vvv #aSignerList: "+$("#aSignerList").val());
		
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
			var token = $("meta[name='_csrf']").attr("content");
	   		var header = $("meta[name='_csrf_header']").attr("content");
	   	
	   		var oldEmail = $("#aOldEmail").val();
			var signerList = $("#aSignerList").val();
			
			var signerName = $("#RsignerName").val();
			var envelopeId = $("#RenvelopeId").val();
			var documentName = $("#RdocumentName").val();
			var requestedBy = $("#RrequestedBy").val();
			var docId = $("#RdocId").val();
			var signerId = $("#RsignerId").val();
			
			var newEmail = $('#txtEmail').val();
	        var txtFullname=$('#txtFullname').val();
	        		
	       
	       if($.trim(txtFullname).length == 0) {
	           $('#nameerror').show();
	      	  $('#nameerror').html('<spring:message code="label.name_msg"/>');
	   
	           // e.preventDefault();
	          
	        } 
	       if ($.trim(newEmail).length == 0) {
     	         // alert('<spring:message code="label.email_msgrequired"/>');
     	         $('#emailerror').show();
     	           $('#emailerror').html('<spring:message code="label.email_msgrequired"/>');
     	           // e.preventDefault();
     	      
     	        }	
	               
	  	  
	  	
	  	 if(!validateEmail($.trim($("#txtEmail").val()))){
	  		$('#emailerror').show();
	           $('#emailerror').html('<spring:message code="label.email_msgrequired"/>');
			}
	  	
	        var checkEmailExist = signerList.toLowerCase().indexOf(newEmail.toLowerCase());
	 	  if (validateEmail(newEmail)) {
	 		 if(checkEmailExist > -1){
	 			$.confirm({
	    	        title: '',
	    	        content: '<spring:message code="label.rasgn_alrdmsg"/>',
	    	       		 buttons: {
	    	        	
	    	            somethingElse: {
	    	                text: 'OK',
	    	                btnClass: 'btn-primary', 
	    	            }
	    	        }
	    	    });
	 			$('body').css("overflow","hidden");
	 			$('html').css("overflow","hidden");
	 		    //alert('<spring:message code="label.rasgn_alrdmsg"/>');
	 	            //e.preventDefault();
	 	 	   }else{

				$.ajax({
					type : "POST",
					url : "history/sendReAssign",
					data: {"signerName":txtFullname, "oldEmail":oldEmail, "newEmail":newEmail, "envelopeId":envelopeId, "documentName":documentName, "requestedBy":requestedBy, "subject":submsg[envelopeId].subject, "message":submsg[envelopeId].message,"docId":docId,"signerId":signerId},
					 beforeSend: function (xhr) {
			   			xhr.setRequestHeader(header, token);
			   			$("#loader2").show();
				    },
				    complete: function () {
				    	$("#loader2").hide();
				    },
					success : function(response) 
					{		
						if(response == "success")
							{
							/* $("#actiondone").show(); */
							$.confirm({
					    	        title: '',
					    	        content: '<h4 class="modal-title"><spring:message code="label.out_don"/></h4> <br/><br/> <spring:message code="label.out_emai_snt"/> '+txtFullname+' ('+newEmail+') <spring:message code="label.sgn_removed_c"/>',
					    	       		 buttons: {
					    	        	
					    	            somethingElse: {
					    	                text: 'OK',
					    	                btnClass: 'btn-primary',
					    	                action:function(){
					    	                	$('body').css("overflow","auto");
												$('html').css("overflow","auto");
					    	                	}
					    	            }
					    	        }
					    	    });
							$('body').css("overflow","hidden");
							$('html').css("overflow","hidden");
							$("#sendreassign").hide();
							$("#sendreassign").removeClass("in");
							
							$('.overlay-bg').hide();
							$('.overlaywhite_bg').hide();
							
				            //$("#spanDone").html('<spring:message code="label.out_emai_snt"/> '+txtFullname+' ('+newEmail+') <spring:message code="label.sgn_removed_c"/>');
				        	getOutForSignatureData();
							}
						else{
							$("#sendreassign").hide();
							$("#sendreassign").removeClass("in");
							$("#loader2").hide();
				            $("#actiondone").hide();
				            var obj = {
				                      title: '',
				                      content: '',
				                       buttons: {
				                          somethingElse: {
				                              text: 'OK',
				                              btnClass: 'btn-primary',
				                          }
				                      }
				                  };
				            if(response == "1"){
				            	obj.content = '<spring:message code="label.DocumentSign"/>'+" "+signerName+".";
				            }else{
				            	obj.content = '<spring:message code="label.doc_reject"/>'+" "+signerName+".";
				            }
				            $.confirm(obj);

				            //alert("Document already signed by "+signerName+".");
				            //$("#spanDone").html('<spring:message code="label.DocumentSign"/> '+signerName+'"."');
							getOutForSignatureData();
							}
					    }
				  });
	 	 	   }
	 	  }else {
	   
	                $('#emailerror').show();
	                $('#emailerror').html('<spring:message code="label.email_msgrequired"/>');
	               // e.preventDefault();
	            }

		}
   	
		function validateEmail(sEmail) {
		    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		    if (filter.test(sEmail)) {
		        return true;
		    }
		    else {
		        return false;
		    }
		}
		
		
		
		function sendReminder(signerName,signerEmailId,envelopeId,documentName,requestedBy,docId,signerId,id){
			document.body.scrollTop = 0;
			 document.documentElement.scrollTop = 0;
		
			$("#sendreminder").modal('toggle');
			/* $('.overlay-bg').show();
			$('.overlaywhite_bg').show();
			 */
				$("#RsignerName").val(signerName);
				$("#RsignerEmailId").val(signerEmailId);
				$("#RenvelopeId").val(envelopeId);
				$("#RdocumentName").val(documentName);
				$("#RrequestedBy").val(requestedBy);
				$("#RdocId").val(docId);
				$("#RsignerId").val(signerId);
				$("#Rid").val(id);
		
		}
		
		function hiderReminderPopUp(){
			$('.overlay-bg').hide();
			$("#sendreminder").hide();
			$('.overlaywhite_bg').hide();
		}
		function sendReminderConfirm(){
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			
			var signerName = $("#RsignerName").val();
			var signerEmailId = $("#RsignerEmailId").val();
			var envelopeId = $("#RenvelopeId").val();
			var documentName = $("#RdocumentName").val();
			var requestedBy = $("#RrequestedBy").val();
			var docId = $("#RdocId").val();
			var signerId = $("#RsignerId").val();
			//var id = $("#Rid").val();
			
			//var btn=$("#reminderConfirm");
			
			$.ajax({
				type : "POST",
				url : "history/sendreminder",						
				data: {"signerName":signerName, "signerEmailId":signerEmailId, "envelopeId":envelopeId, "documentName":documentName, "requestedBy":requestedBy, "subject":submsg[envelopeId].subject, "message":submsg[envelopeId].message,"docId":docId,"signerId":signerId},
					beforeSend : function(xhr) {	                
					xhr.setRequestHeader(header, token);
					//$(btn).buttonLoader('start');
					$("#loader2").show();
				},
			    complete : function() {
			 	   	//$(btn).buttonLoader('stop');
			    	$("#loader2").hide();
				},
				success : function(response){			
			        $("#sendreminder").hide();
			        $('.overlay-bg').hide();
			        $(".sidebar-mini").find('.modal-backdrop').removeClass("modal-backdrop fade in");
			        $(".body").css("overflow","auto");
		            $("#actiondone").modal('toggle');
		         	if(response == "0"){
		         		$("#spanDone").html('<spring:message code="label.out_rmdr_sent_suc"/> '+signerName+' ('+signerEmailId+") <spring:message code="label.sgn_removed_c"/>");
		         	}else if(response == "1"){
		         		$("#spanDone").html('<spring:message code="label.DocumentSign"/>'+" "+signerName+".");
		         	}else{
		         		$("#spanDone").html("Document already rejected by"+" "+signerName+".");
		         	}
		            
				}
		  }); 
			
		}

		
		function sendInfo(signerName,signerEmailId,envelopeId,documentName,requestedBy,docId,signerId,id){	 
			
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
			
			var btn=$("#send_info_"+id);
			
		    var token = $("meta[name='_csrf']").attr("content");
     		var header = $("meta[name='_csrf_header']").attr("content");
	     	
			$.ajax({
				type : "GET",
				url : "history/getActionHistoryList",
				data: {"docId":docId,"signerId":signerId},
			    beforeSend: function (xhr) {
		   			xhr.setRequestHeader(header, token);
		   		 },
			    complete: function () {
			    },
				success : function(response) {	
				
					var i=1;
					var content="";
					content += "<table class='table table-striped'>"
					if (!$.trim(response)){   
						
						document.body.scrollTop = 0;
						 document.documentElement.scrollTop = 0;
						content = "<table class='table table-striped'><p><spring:message code="label.noreslt"/></p></tbody></table>"
					}
					else{   
						content += "<thead> <tr> <th>#</th> <th><spring:message code="label.out_type"/></th> <th><spring:message code="label.pay_detail"/></th> <th><spring:message code="label.succ_date"/></th> </tr> </thead><tbody>"
						$.each( response, function( key, value ) {
							content += '<tr style="word-break:break-word;"> <td scope="row">'+i+'</td> <td> <p class="text-warning">' + value.type  + '</p></td> <td style="word-wrap:anywhere;">'+value.details+'</td><td>'+value.createdOn+'</td></tr>';
							 i++;
						});
							
					}
					
					//$("#recentActionShow").show();
					$("#recentActionShow").modal('toggle');
					$("#actionShow").html(content);
		            /* $('.overlay-bg').show();
		    	   $('.overlaywhite_bg').show(); */
		    	   
		    	    
				}
			  }); 
		}
		
		function recentActionClose(){
			$("#recentActionShow").hide();
			$('.overlay-bg').hide();
		    $('.overlaywhite_bg').hide();
		    //$("#myTab-accordion").load(location.href + " #myTab-accordion");
    
		    $("#recentActionShow").scrollLeft($("#recentActionShow").scrollLeft());
		}
		
		function makeIndividualOutForSignColumnSearch(table){
			var i=0;
			 $('#companies tfoot th').each( function () {
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
				 
				 table.columns().every( function () {
			        var that = this;
			 
			        $( 'input', this.footer() ).on( 'keyup change', function () {
			      
			            if ( that.search() !== this.value ) {
			               that.search( this.value ).draw();
			               
			            }
			        });
			    });
		
		}
					
					
					
////////////////////////////////////////////////////////////////////////////					
					
<%-- 					
function displaySignersList(signerList,envelopeId, documentName, requestedBy, subject, message,docId) {

	////for (i in signerList) {
	////	console.log("valuesignid "+signerList[i].signerId+"  |email "+signerList[i].signerEmail+"  |signerStatus "+signerList[i].signStatus);
	///} 
  
	var content1='';

	var varEmailIds="";
	
	signerList.forEach(function(value, index, array){
		//to send list of emails to checking for reassign
		if(varEmailIds ==""){
			varEmailIds =varEmailIds+value.signerEmail;
		}else{
			varEmailIds =varEmailIds+","+value.signerEmail;
		}
		
		$("#signerEmailId").val(varEmailIds);	//adds list of email ids comma separated belonging to the document
		
		
	});
	
	signerList.forEach(function(value, index, array){
		//alert(index+" valuesignid "+value.signerId+"  |email "+value.signerEmail+"  |signerStatus "+value.signStatus+"   |value[].signStatus:"+array[index].signStatus);
		
		var si=value.signerId;	
		var sn=value.signerName;
		var eID=value.signerEmail;
		var ss=value.signStatus;
		var pp=value.priority;
		
		var msg=''; 
	    var envelop={};
        envelop.subject=subject;
        envelop.message=message;
      
		submsg[envelopeId]=envelop; 
		
	//vvv	$("#signerEmailId").val(eID);	//adds only one email id at a time
		
	
		if(pp == 0 ){
			
				var content = "<table class='table  table-signers'><tr><th><spring:message code="label.tmp-name"/></th><th><spring:message code="label.grp_email"/></th><th><spring:message code="label.comp_sts"/></th><th width='20%'><spring:message code="label.out_actn"/></th></tr>";
			//for(i=0; i<sn.length; i++){
				if((ss == "0" || ss == "false")){
					
					var emailID = escapeChar(eID); 
					content += '<tr><td>'+sn+'</td><td>'+eID+'</td><td><button type="button" class="badge badge-workInProgress" style="cursor: context-menu;"><spring:message code="label.wting"/></button></td><td><img type="button" data-toggle="tooltip" data-placement="top" title="Info" id="send_info_'+index+'" src="<%=appUrl %>/images/info.png"  onclick="sendInfo(\''+sn+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si+'\',\''+index+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="Notify" id="send_reminder_'+index+'" src="<%=appUrl %>/images/Notify_icon.png"  onclick="sendReminder(\''+sn+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si+'\',\''+index+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="Reassign" id="send_raessign_'+index+'" src="<%=appUrl %>/images/re-assign_icon.png"  onclick="sendReassign(\''+sn+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si+'\',\''+index+'\',\''+varEmailIds+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="Remove" id="send_discard_'+index+'" src="<%=appUrl %>/images/Discard_icon.png" onclick="sendDiscard(\''+sn+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si+'\',\''+index+'\',0)"></td></tr>';
				}
				else if(ss == "1" || ss == "true"){
					content += '<tr><td>'+sn+'</td><td>'+eID+'</td><td><button style="cursor: context-menu;" type="button" class="badge badge-workSigned"><spring:message code="label.sgned"/></button></td><td></td></tr>';
				}
			//}
			content += "</table>"
		}
		else{
			//if(index==0){
				var content = "<table class='table  table-signers'><tr><th><spring:message code="label.grp_prio"/></th><th><spring:message code="label.tmp-name"/></th><th><spring:message code="label.grp_email"/></th><th><spring:message code="label.comp_sts"/></th><th width='20%'><spring:message code="label.out_actn"/></th></tr>";
			//}
			
				////for(i=0; i<sn.length; i++){
					var emailID = escapeChar(eID); 
					if((ss == "0" || ss == "false")){
						
						if(index > 0 && array[index-1].signStatus == "0"){
							content += '<tr><td>'+pp+'</td><td>'+sn+'</td><td>'+eID+'</td><td><button style="cursor: context-menu;" type="button" class="badge badge-workInProgress"><spring:message code="label.wting"/></button></td><td><img type="button" data-toggle="tooltip" data-placement="top" title="Info" id="send_info_'+index+'" src="<%=appUrl %>/images/info.png"  onclick="sendInfo(\''+sn+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si+'\',\''+index+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="Notify" id="send_reminder_'+index+'" src="<%=appUrl %>/images/Notify_icon.png"  onclick="invalidCallNotify()"><img type="button" data-toggle="tooltip" data-placement="top" title="Reassign"  id="send_raessign_'+index+'" src="<%=appUrl %>/images/re-assign_icon.png"  onclick="invalidCallReassign()"><img type="button" data-toggle="tooltip" data-placement="top" title="Remove" id="send_discard_'+index+'" src="<%=appUrl %>/images/Discard_icon.png" onclick="sendDiscard(\''+sn+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si+'\',\''+index+'\',0)"></td></tr>';
						}
						else{
							content += '<tr><td>'+pp+'</td><td>'+sn+'</td><td>'+eID+'</td><td><button style="cursor: context-menu;" type="button" class="badge badge-workInProgress">Waiting</button></td><td><img type="button" data-toggle="tooltip" data-placement="top" title="Info" id="send_info_'+index+'" src="<%=appUrl %>/images/info.png"  onclick="sendInfo(\''+sn+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si+'\',\''+index+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="Notify" id="send_reminder_'+index+'" src="<%=appUrl %>/images/Notify_icon.png"  onclick="sendReminder(\''+sn+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si+'\',\''+index+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="Reassign"  id="send_raessign_'+index+'" src="<%=appUrl %>/images/re-assign_icon.png"  onclick="sendReassign(\''+sn+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si+'\',\''+index+'\',\''+varEmailIds+'\')"><img type="button" data-toggle="tooltip" data-placement="top" title="Remove" id="send_discard_'+index+'" src="<%=appUrl %>/images/Discard_icon.png" onclick="sendDiscard(\''+sn+'\',\''+emailID+'\',\''+envelopeId+'\',\''+documentName+'\',\''+requestedBy+'\',\''+docId.toString()+'\',\''+si+'\',\''+index+'\',0)"></td></tr>';	
						}
						
					}else if(ss == "1" || ss == "true"){
						content += '<tr><td>'+pp+'</td><td>'+sn+'</td><td>'+eID+'</td><td><button style="cursor: context-menu;" type="button" class="badge badge-workSigned"><spring:message code="label.sgned"/></button></td><td></td></tr>';	
					}
				////}
				content += "</table>"
		}
		
		content1+=content;
	});
	
	
	//alert("content:"+content1);
	return content1;
	    
} --%>
									
////////////////////////////////////////////////////////////////////////////					
					
     
</script>    
     
     
     
     