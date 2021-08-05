<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
</style>
				<table id="PendingTable" class="display table Data_table_heading table-striped table-bordered dt-responsive nowrap" style="width:100%; display:none">
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
		
		
 <script>
var appUrl;
var token;
var header;
$(document).ready(function(){
	
  appUrl="<%=appUrl%>";
  token = $("meta[name='_csrf']").attr("content");
  header = $("meta[name='_csrf_header']").attr("content");	
  //getPendingData();
  
  $('#PendingTable').dataTable( {
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
	  responsive: false,
	  //scrollX: true,
	     "pagingType": "full_numbers",
	   "columnDefs": [
	    {targets : [4],	orderable: false}
	  ], 	  	           
	}); 

});

function appendtoDatable1(table,response){
	
    var signType="";
	var list= JSON.parse(response.list);
	table.clear().draw();
	 list.forEach(function(value, index, array){
		 var anchor="<a href="+appUrl+"/signDocument?key="+value.envelopeId+"&from=dashboard><spring:message code="label.sign"/></a>";			 
		 table.row.add([value.subject,value.documentName,value.uploadDate,value.requestedBy,anchor]).draw(true); 
	 }); 
	 
}

	function getPendingData(){
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
	 		 	
	}
	 function setOrderByDate1(table){
		 
	     table.order([[2, 'desc' ]]).draw();
		  $('#myInput').on('keyup', function () {
		        table.search( this.value ).draw();
		  } );
		  
		 }
	function pendingColumnSearch(table){
		 var i=0;
		 $('#PendingTable tfoot th').each( function () {
			
		   var title = $(this).text();
		        console.log(title);
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
		                that
		                    .search( this.value )
		                    .draw();
		            }
		        } );
		    } );
		
	}

</script>
