<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<% 
String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>


<script src="<%=appUrl %>/js/pdfobject.min.js"></script>

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
    
table {
    background-color: transparent;
    width: 100%;
}
		.newdashboard .fa.fa-eye {
  		  color: #124e73;
    		padding-left: 4px;
    		font-size:12px;
}
		.table.Data_table_heading th {
    		background-color: #f2f2f2!important;
			}
		table.dataTable thead th.sorting:after, table.dataTable thead th.sorting_asc:after, table.dataTable thead th.sorting_desc:after {
			position: relative;
			top: 0;
			right: 0;
			display: inline-table;
			font-family: FontAwesome;
			left: 10px;
		}
		.tab-content {
			padding: 20px 0;
		}
		thead input {
			width: 100%;
			border: none;
			padding: 3px;
		}

		.filters input {
			width: 100%;
			padding: 3px;
			box-sizing: border-box;
			border: 0 none;
		}
		.newdashboard .nav-tabs>li.active>a, .newdashboard .nav-tabs>li.active>a:focus, .newdashboard .nav-tabs>li.active>a:hover {
			color: #218ACC;
			cursor: default;
			background-color: #fff;
			border-bottom: 2px solid #218ACC;
			border-bottom-color: #218ACC;
			border-top: 0;
			border-left: 0;
			border-right: 0;
		}
		.nav-tabs>li>a:hover {
			border-color: transparent;
		}

		.newdashboard .nav-tabs>li>a {
			color: #666;
			padding: 10px 35px;
		}
		
		@media (max-width: 800px) {
			
			.newdashboard .nav-tabs>li>a {
				padding: 10px 11px;
			}
			table#PendingTable, 
			table#SignedTable, 
			table#CompletedDocumentsTable,
			table#OutForSignatureTable, 
			table#DraftsTable , 
			table#RejectedlistTable{
				width: 800px !important;
				overflow-x: scroll;
				display: block;
			}
		}
		
		#RejectedlistTable thead tr th:first-child:after, #CompletedDocumentsTable thead tr th:first-child:after, #OutForSignatureTable thead tr th:first-child:after{
			visibility:hidden;
			cursor: auto;
		}

		#RejectedlistTable th.details-control.sorting_disabled input, #RejectedlistTable th.sorting:last-child input,
		#CompletedDocumentsTable th.details-control.sorting_disabled input, #CompletedDocumentsTable th.sorting:last-child input,
		#CompletedDocumentsTable th.details-control.sorting_disabled input, #OutForSignatureTable th.sorting:last-child input {

			display: none;
		}
		/*table#PendingTable, 
		table#SignedTable, 
		table#CompletedDocumentsTable,
		table#OutForSignatureTable, 
		table#DraftsTable  {
			width: 942px !important;
			overflow-x: scroll;
			display: block;
		}*/
		
		.pagination>.disabled>a, .pagination>.disabled>a:focus, .pagination>.disabled>a:hover, .pagination>.disabled>span, .pagination>.disabled>span:focus, .pagination>.disabled>span:hover,
		.pagination>li>a:focus, .pagination>li>a:hover, .pagination>li>span:focus, .pagination>li>span:hover
		{
			border:none;
			background-color: #fff;
		}
		div.dataTables_paginate li.first > a, div.dataTables_paginate li.previous > a, div.dataTables_paginate li.next > a, div.dataTables_paginate li.last > a{
			padding-left:5px;
			padding-right:5px;
		}


thead input {
    width: 100%;
    border: none;
    padding: 3px;
}
.pdfobject-container { height: 500px;}
.pdfobject { border: 1px solid #666; }
table.dataTable.display tbody tr.odd { background-color: #f1f1f1; }
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
#RejectedlistTable_filter label {
    border-bottom: 1px solid #9FB6C1;
}
#RejectedlistTable_filter input:focus {
    border: none!important;
}
</style>  
<button class="btn btn-primary btn-lg" type="hidden" data-toggle="modal" data-target="#myModal1" id="test" style="display:none" data-backdrop="static" data-keyboard="false">
  <spring:message code="label.launchDemo" />
</button> 

<!-- Modal -->
<div class="modal fade bs-example-modal-lg" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      </div>
      <div id ="my_pdf_viewer">
                <div id="canvas_container">
                    <div id="pdf_renderer"> </div>
                </div>
                
        </div>
    </div>
  </div>
</div>
 
						<table id="RejectedlistTable" class="display table Data_table_heading table-striped table-bordered" style="width:100%">
								<thead>
									<tr>
										<th style="width: 30px" class="details-control"></th>
										<th style="width: 300px"><spring:message code="label.slf_sub"/></th>
										<th style="width: 300px"><spring:message code="label.grp_doc"/></th>
										<th style="width: 200px"><spring:message code="label.asgn-date"/></th>
										<th style="width: 200px"><spring:message code="label.rejcted-date"/></th>
										<th style="width: 150px"><spring:message code="label.rejcted-by"/></th>
										<th style="width: 100px; text-align: center;"><spring:message code="label.out_actn"/></th>
                             		</tr>
								</thead>
								
								 <tfoot>
									<tr>
											<th>Plus</th>			
											<th ><spring:message code="label.slf_sub"/></th>
											<th ><spring:message code="label.grp_doc"/></th>
											<th ><spring:message code="label.asgn-date"/></th>	
											 <th><spring:message code="label.rejcted-date"/></th>	 
											<th ><spring:message code="label.rejcted-by"/></th>	
											<th><spring:message code="label.out_actn"/></th>					
										</tr>
										
								

								</tfoot>
								<tbody>
								<tr>
								<td></td>
								<td></td>
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

<script>

//Pipelining function for DataTables. To be used to the `ajax` option of DataTables
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
	  
var table = $('#RejectedlistTable').DataTable( {
 "serverSide": true,
 "ajax": $.fn.dataTable.pipeline( {
     url: appUrl+"/app/getRejecteddoclist",
    // url: appUrl+"/app/history/vvvGetServerSideDatatable2/",
     pages: 10 //5 		// number of pages to cache
    
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
  {
      "className":      'details-control',
      "orderable":      false,
     // "data":          'docId', // null,
      "defaultContent": ''
  },
  { "data": "subject"},
  { "data": "documentName" },
  { "data": "uploadDate" },
  { "data": "rejectedDate" },
  { "data": "rejectedBy" },
  {
      "orderable":      false,
      "data":           null,
   
   	"targets": 6,
      "render": function (data, type, row) {      	
    	  data ='<td style="width:4px"><i class="fa fa-eye" aria-hidden="true" onclick="viewforsign(\''+data.envelopeId+'\');" data-toggle="modal" data-target="#exampleModal" data-placement="top" data-backdrop="static" data-keyboard="false"></i> </td><td style="width:4px"><i class="fa fa-download" aria-hidden="true" onclick="view1(\''+data.envelopeId+'\');" data-toggle="modal" data-target="#exampleModal" data-placement="top"></i></td>';
		  return data ;             
         }
  }]
});

rejectedPageColumnSearch(table);


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
         	
$('#RejectedlistTable tbody').on( 'click', 'tr td.details-control', function () {

  var tr = $(this).closest('tr');
  var row = table.row( tr );
  var idx = $.inArray( tr.attr('id'), detailRows );

  if ( row.child.isShown() ) {
      tr.removeClass( 'details' );
      row.child.hide();

      // Remove from the 'open' array
      detailRows.splice( idx, 1 );
    //  tr.removeClass('shown');
  }

  else {
	  closeOpenedRows(table, tr);
      tr.addClass( 'details' );
      //row.child( format( row.data() ) ).show();
      row.child( formatRejectedTable ( row.data() ) ).show();

      // Add to the 'open' array
      if ( idx === -1 ) {
	    	detailRows.push( tr.attr('id') );
      }
     // tr.addClass('shown');
      openRows.push(tr);
  }

} );

});


function rejectedPageColumnSearch(table){
	var i=0;
 $('#RejectedlistTable tfoot th').each( function () {
        var title = $(this).text();
        console.log(title);
    if(i!=0 && i!=6){
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

function formatRejectedTable ( d ) {
	   // `d` is the original data object for the row
	   var z=displaySignersDetail(d.signType,d.signerEmail,d.signerName,d.signerStatus,d.priority,d.emailCount,d.signerEmailId);
	return '<table class="noborder" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
		'<tr>'+
		'<td><strong><spring:message code="label.dft_sgn_type"/>:</strong></td>'+
			'<td>'+z+'</td>'+
		'</tr>'+
		'<tr>'+
			'<td><strong><spring:message code="label.cart_msg1"/>:</strong></td>'+
			'<td>'+d.message+'</td>'+
		'</tr>'+
		'<tr>'+
		'<td><strong><spring:message code="label.rejectcomments"/>:</strong></td>'+
		'<td>'+d.rejectedComments+'</td>'+
	'</tr>'+
	'</table>';
}

function displaySignersDetail(signType,signerEmail,signerName,signerStatus,priority,emailCount,signerEmailId){
	 var signers;
	 if(signType=='S'){
		 signers=signerEmail+'&nbsp<button type="button"  class="btn btn-success" style="cursor: inherit;"><spring:message code="label.comp_signd"/></button>';
	 }
	 if(signType=='E' || signType=='G' || signType=='R'){
		
			var sn=signerName.split(",");
			var ss=signerStatus.split(",");
			var pp=priority.split(",");
			//var ec=emailCount.split(",");
			var eID=signerEmailId.split(",");
			var msg=''; 
			//debugger;
			if(pp[0] == 0){
				var content = "<table class='table table-bordered'><tr><th style='background:#00bc9c;font-size: 15px;'><spring:message code="label.tmp-name"/></th><th style='background:#00bc9c;font-size: 15px;'><spring:message code="label.grp_email"/></th><th style='background:#00bc9c;font-size: 15px;'><spring:message code="label.comp_sts"/></th></tr>";
				
				for(i=0; i<sn.length; i++){
					if(ss[i] == "0"){
				   		content += '<tr><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="badge badge-workInProgress"><spring:message code="label.pending"/></button></td></tr>';
						}else if(ss[i] == "1"){
						content += '<tr><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="badge badge-workSigned" style="cursor: inherit;"><spring:message code="label.comp_signd"/></button></td></tr>';
					}
						else if(ss[i] == "2"){
							content += '<tr><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="badge badge-workReject" style="cursor: inherit;"><spring:message code="label.comp_rejsignd"/></button></td></tr>';
						}
						else if(ss[i] == "3"){
							content += '<tr><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="badge badge-workHold" style="cursor: inherit;"><spring:message code="label.void"/></button></td></tr>';
						}
				}
				content += "</table>"
			}else{
			var content = "<table class='table table-bordered'><tr><th style='background:#00bc9c;font-size: 15px;'><spring:message code="label.grp_prio"/></th style='background:#00bc9c;font-size: 15px;'><th style='background:#00bc9c;font-size: 15px;'><spring:message code="label.tmp-name"/></th><th style='background:#00bc9c;font-size: 15px;'><spring:message code="label.grp_email"/></th><th style='background:#00bc9c;font-size: 15px;'><spring:message code="label.comp_sts"/></th></tr>";
			
			for(i=0; i<sn.length; i++){
				if(ss[i] == "0"){
			   		content += '<tr><td>'+pp[i]+'</td><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="badge badge-workInProgress"><spring:message code="label.pending"/></button></td></tr>';
					}else if(ss[i] == "1"){
					content += '<tr><td>'+pp[i]+'</td><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="badge badge-workSigned" style="cursor: inherit;"><spring:message code="label.comp_signd"/></button></td></tr>';
				}
					else if(ss[i] == "2"){
						content += '<tr><td>'+pp[i]+'</td><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="badge badge-workReject" style="cursor: inherit;"><spring:message code="label.comp_rejsignd"/></button></td></tr>';
					}
					else if(ss[i] == "3"){
						content += '<tr><td>'+pp[i]+'</td><td>'+sn[i]+'</td><td>'+eID[i]+'</td><td><button type="button" class="badge badge-workHold" style="cursor: inherit;"><spring:message code="label.void"/></button></td></tr>';
					}
			}
			content += "</table>"
			}
		signers=content;
			
	 }
	 
	 return signers;
}

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.3.200/pdf.min.js"></script>
<script>
  	function viewforsign(envId){
  		var token = $("meta[name='_csrf']").attr("content");
  		var header = $("meta[name='_csrf_header']").attr("content");
  		var contextPath=$("#contextPath").val();
  		 $.ajax({
			type : "GET",
			url : "<%=appUrl%>/app/downloadsignerFiles/internal",
			data : "envId="+envId,
			beforeSend : function(xhr) {
				//$('#signupbtn').buttonLoader('start');
				xhr.setRequestHeader(header, token);
		
			},
			success : function(response) {
				
				if(response){
					var url=contextPath+'app/downloadsigner/internal?fileName='+response+"&envId="+envId;
					//PDFObject.embed(a, "#example1", {pdfOpenParams: { toolbar: 0 }});
				//	 document.getElementById('myiframe').src = contextPath+'app/download/internal?fileName='+response+"&docId="+docId;
					 $("#pdf_renderer").empty();
					 document.getElementById("test").click();
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
					     document.getElementById("pdf_renderer").appendChild( canvas );

					     //Move to next page
					     currPage++;
					     if ( thePDF !== null && currPage <= numPages )
					     {
					         thePDF.getPage( currPage ).then( handlePages );
					     }
					 }
				//	window.open(contextPath+'app/download/internal?fileName='+response+"&docId="+docId);
					
				}else{
					alert("<spring:message code="label.comp_err_ver"/>");
				}
				

			}
		}); 
  	}
  	
	function view1(envId){
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
					
					//alert("Your file is verified"+response);
					window.location.assign(contextPath+'app/downloadsigner/external?fileName='+response+"&envId="+envId);
				
				}else{
					alert("<spring:message code="label.comp_err_ver"/>");
				}
				

			}
		}); 
 	}
		
		 
  	</script>