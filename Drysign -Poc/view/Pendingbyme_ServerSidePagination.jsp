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
  tfoot {
    display: table-header-group;
} 
.table { 
    overflow: auto;
}
</style>
				<table id="PendingTable" class="display table Data_table_heading table-striped table-bordered dt-responsive nowrap" style="width:100%;">
								<thead>
									<tr>
										<th style="width: 300px;"><spring:message code="label.slf_sub"/></th>
										<th style="width: 300px;"><spring:message code="label.grp_doc"/></th>
										<th style="width: 170px;"><spring:message code="label.asgn-date"/></th>
										<th style="width: 170px;"><spring:message code="label.comp_reqstdby"/></th>
										<th style="width: 30px;text-align: center;"><spring:message code="label.out_actn"/></th>					
									</tr>		
								</thead>
								<tfoot>
            						<tr>
            							<th style="text-align: center;"><spring:message code="label.slf_sub"/></th>
            							<th style="text-align: center;"><spring:message code="label.grp_doc"/></th>
                						<th style="text-align: center;"><spring:message code="label.asgn-date"/></th>
                						<th style="text-align: center;"><spring:message code="label.comp_reqstdby"/></th>
                						<th style="text-align: center;"><spring:message code="label.out_actn"/></th>
            						</tr>
            					</tfoot>
								
								<tbody>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>						
										<td style="text-align: center;"></td>		
									</tr>
							</tbody>
					</table>    
		
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.3.200/pdf.min.js"></script>	 -->		
 <script>
 
 $.fn.dataTable.pipeline = function ( opts ) {
		//debugger;
		
	// Configuration options
	var conf = $.extend( {
	   pages: 10,     // number of pages to cache
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

	 //  debugger;
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
	    //   alert("vvv  json.draw "+ request.draw);
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

var appUrl;
var token;
var header;
$(document).ready(function(){
	
  appUrl="<%=appUrl%>";
  token = $("meta[name='_csrf']").attr("content");
  header = $("meta[name='_csrf_header']").attr("content");	
  //getPendingData();
  
	 /*  $('#PendingTable').dataTable( {
		  "language": {
	            "info": "Displaying  item _START_ - _END_  of _MAX_",
	    	 },
		  "autoWidth": false,
		  responsive: false,
		  //scrollX: true,
		     "pagingType": "full_numbers",
		   "columnDefs": [
		    {targets : [4],	orderable: false}
		  ], 	  	           
		}); */ 
		
	
	/*   var i=0;
		 $('#PendingTable tfoot th').each( function () {
		      var title = $(this).text();
		        console.log(title);
		    if(i!=4){
		    	$(this).html( '<input type="text" placeholder="Filter" />' );
		    }
		    else{
		    	$(this).html( '' );
		    }
		    
		    i++;
		        
		    }); */
			 
		
	
	var table = $('#PendingTable').DataTable( {
	"processing": false,
	"serverSide": true,
	"responsive":false,
 	"order": [[ 2, "desc" ]],	
	"ajax": $.fn.dataTable.pipeline( {
	url: appUrl+"/app/getPendingServerSidePagination/",
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
	"columns": [
	
	
	 { "data": "subject"},
	 { "data": "documentName" }, 
	 { "data": "uploadDate" },
	 { "data": "requestedBy" },
	
	 {
	    "orderable":      false,
	    "data":           null,
	   	"targets": 4,
	    "render": function (data, type, row) {      	
	        	 var anchor="<a href="+appUrl+"/signDocument?key="+data.envelopeId+"&from=dashboard><spring:message code="label.sign"/></a>";
	          	return anchor;              
	       } 
	  },
	  
	]         
	
	});
	
	pendingColumnSearch(table);
	
 });
 
function pendingColumnSearch(table){
		
	var i=0;
	 $('#PendingTable tfoot th').each( function () {
	        var title = $(this).text();
	    if(i!=4){
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

//===============================old Start===================
function appendtoDatable1(table,response){
	
    var signType="";
	var list= JSON.parse(response.list);
	table.clear().draw();
	 list.forEach(function(value, index, array){
		 var anchor="<a href="+appUrl+"/signDocument?key="+value.envelopeId+"&from=dashboard><spring:message code="label.sign"/></a>";			 
		 table.row.add([value.subject,value.documentName,value.uploadDate,value.requestedBy,anchor]).draw(true); 
	 }); 
	 
}

	/* function getPendingData(){
		$.ajax({
		type : "GET",
		url : appUrl+"/app/pending",		
	beforeSend : function(xhr) {
	 		xhr.setRequestHeader(header, token);
	 		$("#loader2").show();
	 		$("#Pending").hide();
	 		$('#datanotAvailable').hide();
	 		},
		complete : function() {
	 		$("#loader2").hide();
	 		},
	 		success : function(response) {
	 			var list= response.list;
	 			 if(list=='[]'){
	 				$('#Pending').hide();
	 				$('#datanotAvailable').show();
	 				dataAvailableForApi.PendingRowCount=0;
	 			}
	 			else{
	 				$("#PendingTable").show();
	 				$("#Pending").show();
	 				dataAvailableForApi.PendingRowCount=list.length;
	 			}
	 			 
	 			dataAvailableForApi.PendingData=true;
	 			var table=$('#PendingTable').DataTable();
	 			pendingColumnSearch(table);
	 			appendtoDatable1(table,response)
	 			setOrderByDate1(table);	 
	 	}

	});
	 		 	
	} */
	 function setOrderByDate1(table){
		 
	     table.order([[2, 'desc' ]]).draw();
		  $('#myInput').on('keyup', function () {
		        table.search( this.value ).draw();
		  } );
		  
		 }
	
	//===============================old end===================
/* 	function makeIndividualPendingSearch(table){
		var i=0;
		 $('#PendingTable tfoot th').each( function () {
		    var title = $(this).text();
		     //   console.log(title);
		    if( i!=4){
		    	$(this).html( '<input type="text" placeholder="Filter" />' );
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
	
 */
</script>
