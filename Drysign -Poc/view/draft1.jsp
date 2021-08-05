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
                						<th><spring:message code="label.grp_doc"/></th>
                						<th><spring:message code="label.signtype"/></th>
                						<th><spring:message code="label.succ_date"/></th>
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
						
						
						
	<div class="Message" id="deleteConfirmDraftDocument">	
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
		<button type="button" class="btn btn-light" onclick="hiderDocumentPopUp();" ><spring:message code="label.cancel"/></button>
		<button type="button" class="btn btn-blue" onclick="deleteDocumentPopUp();" ><spring:message code="label.out_confm"/></button>

	  </div> 	
 </div>
  <input type="hidden" id="docId" value=""/>
 <div class="overlay-bg"></div>


<script>
var appUrl;
var token;
var header;
$(document).ready(function(){
	
  appUrl="<%=appUrl%>";
  token = $("meta[name='_csrf']").attr("content");
  header = $("meta[name='_csrf_header']").attr("content");	
  //getDraftData();
  
  $('#DraftsTable').dataTable( {
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
	    {targets : [3],	orderable: false}
	  ]	  	           
	}); 

});


function appendtoDatable(table,response){
	
	     var signType="";
		var list= JSON.parse(response.list);
		table.clear().draw();
		 list.forEach(function(value, index, array){
			 if(value.signType=='G')
				 signType="<spring:message code="label.grp_sgn"/>";
			 else
				signType="<spring:message code="label.selfsign"/>";
		
			 var anchor="<ul class='table-menu'><li><a href="+appUrl+"/app/document/redirect/"+value.envelopeId+">";			 
			  var buttonhtml="<li><a onClick=deleteDraft('"+value.envelopeId+"')>";
			  
		
			  table.row.add([value.documentName,signType,value.completedDate,anchor+'<i class="fa fa-pencil" aria-hidden="true"></i></a></li>'+buttonhtml+'<i class="fa fa-trash" aria-hidden="true"></i></a></li></ul>']).draw(true); 
		 }); 
		 
	}
	
	
	
function deleteDraft(envvelopeId){
	document.body.scrollTop = 0;
	 document.documentElement.scrollTop = 0;
	//alert(envvelopeId);
	$("#docId").val(envvelopeId)
	$('.overlay-bg').show();
	$('#deleteConfirmDraftDocument').show();
	//$('.overlaywhite_bg').show();
}
	
	function getDraftData(){
	
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
	 		 	
	}
	
	
	
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
					getDraftData();
					
				}else{
					alert('<spring:message code="label.invalid_req"/>');
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

	
	 function setOrderByDate(table){
	 
     table.order([[2, 'desc' ]]).draw();
	  $('#myInput').on('keyup', function () {
	        table.search( this.value ).draw();
	  } );
	  
	 }
	
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
		                that
		                    .search( this.value )
		                    .draw();
		            }
		        } );
		    } );
		
	}

</script>


						
						
						