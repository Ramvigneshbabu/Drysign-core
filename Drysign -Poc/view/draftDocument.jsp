<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
#DraftsTable input{
font-size:13px !important;
}
div.dataTables_filter label{
font-weight:normal !important;
}
 tfoot {
    display: table-header-group;
}


/* vvv */
.table { 
    overflow: auto;
}

</style>


	<table id="DraftsTable" class="display table Data_table_heading table-striped table-bordered" style="width:100%">
		<thead>
			<tr>
				<th style="width: 300px"><spring:message code="label.draft_title"/></th>					
				<th style="width: 300px"><spring:message code="label.sgntype"/> </th>
				<th style="width: 170px"> <spring:message code="label.d&t"/> </th>
				<th style="width: 130px;text-align: center;"><spring:message code="label.out_actn"/></th>					
			</tr>			
		</thead>
		<tfoot>
			<tr>
				<%-- <th><spring:message code="label.grp_doc"/></th>
				<th><spring:message code="label.signtype"/></th>
				<th><spring:message code="label.succ_date"/></th>
				<th><spring:message code="label.out_actn"/></th> --%>
				
				<th><spring:message code="label.draft_title"/></th>
				<th><spring:message code="label.sgntype"/></th>
				<th><spring:message code="label.d&t"/></th>
				<th><spring:message code="label.out_actn"/></th>
			</tr>
		</tfoot>
		
		<tbody>
			<tr>
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
												
	<div class="modal fade" id="deleteConfirmDraftDocument" role="dialog" data-backdrop="static" data-keyboard="false">	
     
     <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
    <div class="modal-header">    
     
     	<h4 class="modal-title"><spring:message code="label.del_doc_drafts"/></h4>
     
          </div>
    
	  	<!-- <a class="close" href="#" onclick="hiderDocumentPopUp();">
	  		<button type="button" class="close" data-dismiss="modal">×</button>
	  	</a> -->
	  	
	  	 <div class="modal-body">
	  	 	<p><spring:message code="label.delte-confirm"/></p>
		 	<!--  <p><spring:message code="label.dlt_doc"/></p>-->
		 
	  </div>
		 
	  <div class="text-right">	  
		<button type="button" class="btn btn-light" onclick="hiderDocumentPopUp();" data-dismiss="modal" ><spring:message code="label.cancel"/></button>
		<button type="button" class="btn btn-blue" onclick="deleteDocumentPopUp();" data-dismiss="modal" ><spring:message code="label.out_confm"/></button>

	  </div> 
	  </div>
	  </div>	
 </div>
  <input type="hidden" id="docId" value=""/>
 <div class="overlay-bg"></div>


<script>
var appUrl;
var token;
var header;


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

$(document).ready(function(){
	
  appUrl="<%=appUrl%>";
  token = $("meta[name='_csrf']").attr("content");
  header = $("meta[name='_csrf_header']").attr("content");	
  //getDraftData();
  
  var table = $('#DraftsTable').DataTable( {
	 //   "processing": true,
	    "serverSide": true,
	 	"responsive":false,	//to make td clickable to expand set to false
	    "order": [[ 2, "desc" ]],		//sets default Assigned Date column in DESC order and also removes order icon from 0th column
	    "ajax": $.fn.dataTable.pipeline({
	        url: appUrl+"/app/history/getDraftDocumentServerSideDataTable/",
	        pages: 10  		// number of pages to cache
	       
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
		/*  fnInitComplete : function() {
			//  if ($(this).find('tbody tr').length<=1) {
	  	      if ($(this).find('tbody tr').length < 1) {
	  	         $(this).parent().parent().parent().hide();
	  	   	 	$('#datanotAvailable').show();
	  	      }else{
	  	    	 $('#datanotAvailable').hide();
	  	      }
	  	   }, */
	  "columns": [
	     {"data": "documentName"}, 		//0th col
	     {								//1st col			
	        "orderable":      true,
	        "data":           null,
	      	"targets": 1,
	     
        	"render": function (data, type, row) {
        		var signType ='';
        		if(data.signType =='G')
					signType="<spring:message code="label.grp_sgn"/>";
				else	//sign type is "S"
					signType="<spring:message code="label.selfsign"/>";
	      		 
	      		return signType;
	        }
		 },
	     {"data": "completedDate"},
	     {
	        "orderable":      false,
	        "data":           null,
	      	"targets": 3,	     
	         "render": function (data, type, row) {  
		      
	             //var vvvanchor="<ul class='table-menu'><li><a href="+appUrl+"/app/document/redirect/"+data.envelopeId+"><i class='fa fa-pencil' aria-hidden='true'></i></a></li>";			 
	             //var vvvbuttonhtml="<li><a onclick=deleteDraft('"+data.envelopeId+"')><i class='fa fa-trash' aria-hidden='true'></i></a></li></ul>";
	 		  	 var anchor="<ul class='table-menu'><li><a href="+appUrl+"/app/document/redirect/"+data.envelopeId+"><i class='fa fa-pencil' aria-hidden='true'></i></a></li><li><a onclick=deleteDraft('"+data.envelopeId+"')><i class='fa fa-trash' aria-hidden='true'></i></a></li></ul>";
	 			 return anchor;
	            	
				 
	        }   
	    }]
	   
	 });
  
  
 
	////appendtoDatable(table,response)
	makeIndividualColumnSearch(table);
//	setOrderByDate(table);	 
	dataAvailableForApi.draftsData=true;

});


/* function appendtoDatable(table,response){
	
	    var signType="";
		var list= JSON.parse(response.list);
		table.clear().draw();
		 list.forEach(function(value, index, array){
			 if(value.signType=='G')
				 signType="Group Sign";
			 else
				signType="Self Sign";
		
			 var anchor="<ul class='table-menu'><li><a href="+appUrl+"/app/document/redirect/"+value.envelopeId+">";			 
			  var buttonhtml="<li><a onClick=deleteDraft('"+value.envelopeId+"')>";
			  
		
			  table.row.add([value.documentName,signType,value.completedDate,anchor+'<i class="fa fa-pencil" aria-hidden="true"></i></a></li>'+buttonhtml+'<i class="fa fa-trash" aria-hidden="true"></i></a></li></ul>']).draw(true); 
		 }); 
		 
	} */
	
	
	
function deleteDraft(envvelopeId){
	document.body.scrollTop = 0;
	 document.documentElement.scrollTop = 0;
	//alert(envvelopeId);
	$("#docId").val(envvelopeId)
	$('.overlay-bg').show();
	$('#deleteConfirmDraftDocument').modal('toggle');
	//$('.overlaywhite_bg').show();
}
	
/* 	function getDraftData(){
	
	 	$.ajax({
		type : "GET",
		url : appUrl+"/app/history/newdraft",		
	beforeSend : function(xhr) {
	 		xhr.setRequestHeader(header, token);
	 		$("#loader2").show();
	 		$("#Drafts").hide();
	 		$('#datanotAvailable').hide();
	 		},
		complete : function() {
	 		$("#loader2").hide();
	 		//$("#Drafts").show();
		},
	 		success : function(response) {
	 			var list= response.list;
	 			if(list=='[]'){
	 				$('#Drafts').hide();
	 				$('#datanotAvailable').show();
	 				dataAvailableForApi.DraftsRowCount=0;
	 			}
	 			else{
	 				//$('#datanotAvailable').hide();
	 			     $("#Drafts").show();
    		 		 dataAvailableForApi.DraftsRowCount=list.length;			
	 			} 
	 			var table=$('#DraftsTable').DataTable();
	 			appendtoDatable(table,response)
	 			makeIndividualColumnSearch(table);
	 			setOrderByDate(table);	 
	 			dataAvailableForApi.draftsData=true;
	 	}

	});
	 		 	
	} */
	
	
	
	function deleteDocumentPopUp(){
		
		
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
				if(response == "success"){
					$("#deleteConfirmDraftDocument").hide();
					$('.overlaywhite_bg').hide();
					$('.overlay-bg').hide();
					 $(".sidebar-mini").find('.modal-backdrop').removeClass("modal-backdrop fade in");
					getDraftData();
					
				}else{
					alert('Invalid request');
					$("#deleteDocument").hide();
					//$('.overlaywhite_bg').hide();
					$('.overlay-bg').hide();
				}
			},
			error: function(xhr, textStatus, errorThrown)
			 {
			 	alert('<spring:message code="label.loading_error"/>');
			 	return false;
			}
		})	
		
	}
	
	
	function hiderDocumentPopUp(){
		 $('.overlay-bg').hide();
		$('#deleteConfirmDraftDocument').hide();
		$('.overlaywhite_bg').hide(); 
	}

	
	/*  function setOrderByDate(table){
	 
     table.order([[2, 'desc' ]]).draw();
	  $('#myInput').on('keyup', function () {
	        table.search( this.value ).draw();
	  } );
	  
	 } */
	
	function makeIndividualColumnSearch(table){
		var i=0;
		 $('#DraftsTable tfoot th').each( function () {
		        var title = $(this).text();
		        console.log(title);
		    if(i!=3){
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
		        } );
		    } );
		
	}

</script>


						
						
						