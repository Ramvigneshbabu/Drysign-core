<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	String port = request.getServerPort() + "";
if(!port.equals(null) || !port.equals("")) {
		port = ":" + port;
	}
	String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>
<jsp:include page="admin-header.jsp"></jsp:include>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />



<!-- <link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap4.min.css"> 
<link rel="stylesheet" type="text/css"
	href="<%=appUrl%>/css/responsive.bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=appUrl%>/css/responsive.dataTables.css">-->
<link rel="stylesheet" href="<%=appUrl%>/css/jquery.dataTables.min.css">



<%-- <link rel="stylesheet" href="<%=appUrl%>/css/style.css" /> --%>
<link rel="stylesheet" href="<%=appUrl %>/css/login.css">
<%-- <link rel="stylesheet" href="<%=appUrl%>/css/inner_page.css" /> --%>
<%-- <link rel="stylesheet" href="<%=appUrl %>/css/exela_theme.css"/> --%>
<style>
.pdfobject-container {
	height: 500px;
}

.pdfobject {
	border: 1px solid #666;
}

td.details-control {
	background: url('images/details_open.png') no-repeat center center;
	cursor: pointer;
}

tr.shown td.details-control {
	background: url('../images/details_close.png') no-repeat center center;
}

table.dataTable.display tbody tr.odd {
	background-color: #f1f1f1;
}

.error {
	color: red !important;
}
</style>
    
<a href="#"  id="disableMsg" style="visibility: hidden;"></a> 
<div class="content-wrapper bg_wrap">
	<div class="container-fluid">
		<!-- breadcrumb -->
		<ol class="breadcrumb">
			<li><spring:message code="label.home_page"/></li>
			<li class="active"><spring:message code="label.users"/></li>
		</ol>
	</div>
	
	<!-- Main content -->
	<section class="container-fluid contentdoc">
	
		<div class="Content-wh-module">
		<!-- <button type="button" class="btn btn-primary" onclick="createUsersInExelaAuth()">Create Users in Exela-Auth</button>
		<button type="button" class="btn btn-primary" onclick="viewLog()">View Log</button> -->
		<br></br>
		   <section class="div-background">                       
                        <div class="col-md-12 div-background mb-20 p-20">
		                     <div class="ml-15">
								<label class="label-heading"><spring:message code="label.filters"/></label>
							</div>
                            <div>
                                <div class="col-md-3">

											<div class="input-field s6">      
										      <select class="validate" id="user-type">
										       
										     <option value="all"><spring:message code="label.all"/></option>
                                            <option value="ROLE_USER"><spring:message code="label.portalUsers"/></option>
                                            <option value="ROLE_APP"><spring:message code="label.apiUsers"/></option>
                                            <option value="ROLE_ADMIN"><spring:message code="label.admin"/></option>
										      </select>
										      <label ><spring:message code="label.userType"/></label>
										    </div>
                                </div>
                                <div class="col-md-2" >	
                                							
                                     <div class="input-field s6" >   
                                                                    
                                       <select class="validate" id="register-year">
                                       
                                         
                                            
                                       </select>
                                    
                                        <label ><spring:message code="label.registerYear"/></label>
                                    </div>
                                    
                                </div>
                                <div class="col-md-2">                                
                                    <div class="input-field s6">                                       
                                        <select class="validate" id="quarter">
                                            <option value="all"><spring:message code="label.all"/></option>
                                            <option value="1"><spring:message code="label.q1"/></option>
                                            <option value="2"><spring:message code="label.q2New"/></option>
                                            <option value="3"><spring:message code="label.q3New"/></option>
                                            <option value="4"><spring:message code="label.q4New"/></option>
                                        </select>
                                         <label ><spring:message code="label.quarter"/></label>
                                    </div>
                                </div>
                                <div class="col-md-3">                                
                                    <div class="input-field s6">                                       
                                        <select class="validate" id="usage">
                                        	<option value="all"><spring:message code="label.all"/></option>
                                            <option value="1"><spring:message code="label.normal"/></option>
                                            <option value="2"><spring:message code="label.moderate"/></option>
                                            <option value="3"><spring:message code="label.high"/></option>
                                        </select>
                                         <label><spring:message code="label.documentUsage"/></label>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                    <button type="submit" class="btn btn-primary" disabled="disabled" onclick="getUsers()"><spring:message code="label.apply"/></button>
                                </div>
                            </div>
                        </div>

                    </section>
		
			<div class="row">
				<div class="table_scroll">
					<div class="col-md-12 col-sm-12 col-xs-12  ">
						<table id="example"
							class="display table Data_table_heading dataTable no-footer"
							cellspacing="0" width="100%" style="font-size: 16px;">
							<thead>
								<tr>
									<th></th>
									<!-- <th>ENVELOPE ID</th> -->
									<th class="text-center"><spring:message code="label.userName"/></th>
									<th class="text-center"><spring:message code="label.registredDate"/></th>
									<th class="text-center"><spring:message code="label.userType"/></th>
									<th class="text-center"><spring:message code="label.userEmail"/></th>
									<th class="text-center"><spring:message code="label.planPurchased"/></th>
									<th class="text-center"><spring:message code="label.usage"/></th>
									<th class="text-center"><spring:message code="label.action"/></th> 
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Model Popup   -->	
	
</div>

<!-- Button trigger modal -->


<!-- Modal -->


<jsp:include page="footer.jsp"></jsp:include> 
     
<script src="<%=appUrl%>/js/pdfobject.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.10.4/typeahead.bundle.min.js"></script>
 
<script src="<%=appUrl%>/js/jquery.validate.js"></script>
<script src="<%=appUrl%>/js/jquery.buttonLoader.js"></script>
<script src="<%=appUrl%>/js/materialize-tags.js"></script>
<script src="<%=appUrl%>/js/materialize.js"></script>



<div class="modal" id="exampleModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content popup-model">
		<div class="heading2"><spring:message code="label.signDocLimit"/><span class="pull-right" data-dismiss="modal"><spring:message code="label.x"/></span></div>
		<div class="row">		
			 	<div>	
			 	<div class="col-md-12">
			 	 <input id="limited" name="choice_1" class="with-gap"  type="radio"/>
    			 	  				    
					<label for="limited" style="padding-left: 110px;line-height: 30px;" ><spring:message code="label.document"/></label>
    		 	 <input type="text" class="model-input" id="limitValue">
			 	
			 	</div>	
			 	</div>
			  	 <div class="col-md-12 p-15">		  	 
			      <input id="unlimited" name="choice_1" class="with-gap"  type="radio" style="">
			      <label for="unlimited"><spring:message code="label.unlimited"/></label>
			  	 </div>            
		</div>		
		<div class="text-right" style="padding:10px 25px">
		  <button class="btn btn-cancel mr-15" data-dismiss="modal"><spring:message code="label.cancel"/></button>
		  <button class="btn btn-primary btn-width" data-dismiss="modal" onclick="changeLimit();"><spring:message code="label.ok"/></button>
		</div>
		</div>
	</div>
</div>

<div class="modal" id="disableModal" role="dialog" data-backdrop="static">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content popup-model">
		<div class="heading2"><spring:message code="label.disablesMFA"/></div>
		<div class="col-md-12 p-15">	
    		 <spring:message code="label.areYoudisablesMFA"/> <br><span id="userEmail" style="color: #00bc9c"></span>
    		 </div>
		<div class="text-right" style="padding:10px 25px">
		  <button class="btn btn-cancel mr-15" data-dismiss="modal"><spring:message code="label.cancel"/></button>
		  <button class="btn btn-primary btn-width" data-dismiss="modal" onclick="disableMFA();"><spring:message code="label.ok"/></button>
		</div>
		</div>
	</div>
</div>

<script>
	
	  function resizeIframe(obj) {
	    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
	  }
	  
	  
	  
	  function getUsers(){
		  var table = $('#example').DataTable();
		  	table.clear().draw();
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath=$("#contextPath").val();
			$("#fieldshtml").val("");
			var fieldsHTML = "";
			$(".drop > .dragMe").each(function() {
				fieldsHTML += $(this).prop("outerHTML");
			});
			var data={
				//	 "password" :$("#password").val(),
				      
				      "role" : $("#user-type").val(),
				      "year":$('#register-year').val(),
				      "quarter":$('#quarter').val(),
				      "usage":$('#usage').val()
				     
			};
			
			 
			$.ajax({
				type:"POST",
				
				//url:contextPath+"admin/getUsers?role="+role+"&year="+year+"&quarter="+quarter+"&usage="+usage"
				 	url:contextPath+"app/admin/getUsers",
						dataType: 'json',
				 contentType: "application/json; charset=utf-8",
				    data: JSON.stringify(data),
				    
				    beforeSend: function (xhr) {
			   			xhr.setRequestHeader(header, token);			   			
				    },
				    complete: function () {
				    },
				    success : function(response) {
				    	$('#example').DataTable().rows.add(response).draw();				    	
					},
					 error : function(e) { 						
					    alert('Error: ' + e);   
					}  
			});		 
		}
	  
	  function createUsersInExelaAuth(){
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath=$("#contextPath").val();
			$("#fieldshtml").val("");
			var fieldsHTML = "";
			$(".drop > .dragMe").each(function() {
				fieldsHTML += $(this).prop("outerHTML");
			});
			
			 
			$.ajax({
				type:"GET",
				
				//url:contextPath+"admin/getUsers?role="+role+"&year="+year+"&quarter="+quarter+"&usage="+usage"
				 	url:contextPath+"app/admin/createUsersInExelaAuth",
						dataType: 'json',
				 contentType: "application/json; charset=utf-8",
				    
				    beforeSend: function (xhr) {
			   			xhr.setRequestHeader(header, token);			   			
				    },
				    complete: function () {
				    },
				    success : function(response) {
				    	alert(JSON.stringify(response));			    	
					},
					 error : function(e) { 						
					    alert('Error: ' + e);   
					}  
			});		 
		}
	  function changeLimit() {
		  //alert("inside change limit")
		 // alert(currentMail);
		 // alert(currentUserId);
		 	 
			var today = new Date();
			var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
			var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
			var dateTime = date+' '+time;
			
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath=$("#contextPath").val();
			$("#fieldshtml").val("");
			var fieldsHTML = "";
			$(".drop > .dragMe").each(function() {
				fieldsHTML += $(this).prop("outerHTML");
			});
			var value="";
			var limit = 0;
			 $('#example tr').each(function(){
                    if($("input[type='radio']#limited").is(':checked')) {
                    	limit = 0;
                    	value=document.getElementById("limitValue").value;                    	
                	} else { 
                		limit = 1;
                		value=10000;
                	}
                   
   		  });	 
		//	alert(value);
			var data={
					  "updatetime":dateTime,
				      "limit": limit,
				      "limitValue":value,
				       "userId":currentUserId
			};
			
			  $.ajax({
				  type:"POST",
				  url : contextPath+"app/admin/changeLimit",
				  dataType: 'json',
				    contentType: "application/json; charset=utf-8",
				    data: JSON.stringify(data),
				    beforeSend: function (xhr) {
			   			xhr.setRequestHeader(header, token);
				    },
				    complete: function () {
				    },
				    success : function(response) {		
				    
				    	 
                      $('#example tr').each(function(){
                    	 
                    	  
                         if(currentMail == $(this).find("td").eq(4).text()) {
                         	var usage = $(this).find("td").eq(6).text().split('/')[0];
                         	
                         	if($("input[type='radio']#limited").is(':checked')) {
                         		$(this).find("td").eq(6).text(usage + '/' + data.limitValue);
                         	} else { //unlimited
                         		$(this).find("td").eq(6).text(usage + '/Unlimited');
                         	}
                         }   
            		  });	
					},
					 error : function(e) {  
						 console.log(e);
					    //alert('Error: ' + e);   
					}  
			  });
		}
	$('[data-dismiss=modal]').on('click', function (e) {
		//emailForm.resetForm();
	    var $t = $(this),
        target = $t[0].href || $t.data("target") || $t.parents('.modal') || [];

  $(target)
    .find("input,textarea,select")
       .val('')
       .end();
});
	
	
	
	 
	$(document).ready(function() {
		var role = "<c:out value="${role}"></c:out>";
		if("ROLE_ADMIN"== role){
			$("#admindashboard").hide();		//$("#admindashboard").show(); //28Oct - new requirement to hide admin dashboard from menu
			$("#adminuser").show();
			$("#drysignadminclient").show();
		}
		$('#register-year').material_select();

		  // setup listener for custom event to re-initialize on change
		  $('#register-year').on('contentChanged', function() {
		     $(this).material_select();
		  });
		
		
		 $('select').material_select();
		 
		 var years = ${years};
		 for(var year of years) {		
		 var $newOpt = $("<option>").attr("value",year).text(year);
		    $("#register-year").append($newOpt);

		    // fire custom event anytime you've updated select
		    $("#register-year").trigger('contentChanged');
		 }
		  dataSet=${list};
		
		 var table= $('#example').DataTable( {
    		 data: dataSet,
    		 order: [],
    	        columns: [
					 {
					    "className":      'details-control',
					    "orderable":      false,
					    "data":           null,
					    "defaultContent": ''
					},
					
					{ "data": "firstname" }, 
					{"data": "registeredDate"},
	/* 				{ "data": "documentName" }, */
					{"data":"role"},
					{ "data": "email" },
					{ "data": "name" },
					{ "data": "usage" },
					{ "data": function (data, type, dataToSet) {
				        return data
				    } }
				 /*	{ "data": "message" } */
    	      ],
    	      columnDefs : [    	                        	                  
    	                    	 {
    		                    	targets : [7],
    			                      render : function (data, type, row) {
    			                    	//  data = '<td > <a data-toggle="modal" data-target="#exampleModal"><i class="fa fa-ellipsis-v" style="color:#000"></i></a></td>'
    			                    	  
    			                    	  
    			                    	  data = '<td><div class="dropdown mt-2 btn-group btn-group-xs"><i class="fa fa-ellipsis-v fa-2x" style="color:#2c3d4f" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i><div class="dropdown-menu dropdown-menu-right dropdown-menu-attach dropdown-menu-context" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" data-toggle="modal" data-target="#exampleModal" onclick="popup()">Change Limit</a><br><a data-toggle="modal" data-target="#disableModal" onclick="disable()">Disable MFA</a></div></div></td>'
    	    			                    	 return data ;
    			                      }
    			                    },
    	                    	
    	                    	
    	               ]
 	       } );
		
		 
		$('#example ').on( 'click', 'td', function () {
			var data = table.row( $(this).parents('tr') ).data();
			 var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");
				var contextPath=$("#contextPath").val();
			// get limit data		
			$.ajax({
				  type:"GET",
				  async: false,
				  url : contextPath+"app/admin/limit?email=" + data.email,
				  dataType: 'json',
				  Accept : "application/json",
	    		    contentTypex: "application/x-www-form-urlencoded",
				    beforeSend: function (xhr) {
			   			xhr.setRequestHeader(header, token);
				    },
				    complete: function () {
				    },
				    success : function(response) {	
				    	choices = response;
				    	//alert(choices);
				    	if(response.limit == 0) {
				    		$('#limited').prop('checked', true);
				    		$('#limitValue').val(response.limitValue);
				    	} else {
				    		$('#unlimited').prop('checked', true);
				    		$('#limitValue').val('');
				    	}
				    	
				    	
				    	
					},
					 error : function(e) {  
						 console.log(e);
					    //alert('Error: ' + e);   
					}  
			  });
			
			        
					//alert(data.email);
					//alert(data.user_id);
					currentMail = data.email;					
			     	currentUserId=data.user_id;
			        $('#c').modal('show');
			        

			    } );
		
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
		 
		 $('#example tbody').on('click', 'a.email', function() {

			    
			    
			    var row = $('#example').DataTable().row( $(this).parents('tr') ),
			        index = row.index(),
			        data = row.cell(index, 4).data();
					$("#docuID").val(data) ;
			//document.getElementById("docuID").value = data;
			   // alert(data);
			});
		 
		 
	 
	} );
	
	$(document).ready(function() {
		var choices="";
		//console.log("inside year");
		 var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			var contextPath=$("#contextPath").val();
			$("#fieldshtml").val("");
			var fieldsHTML = "";
			$(".drop > .dragMe").each(function() {
				fieldsHTML += $(this).prop("outerHTML");
			});
			var data={
					  
			};
			
			  
			  
		//	  var myStringArray = ["Hello","World"];
			 
			  
			 /*  $('year').material_select();
			 
			  var newDiv = document.createElement('div');
	    	    var selectHTML = "";
	    	    selectHTML="<select>";
	    	    for(i = 0; i < choices.length; i = i + 1) {
	    	        selectHTML += "<option value='" + choices[i] + "'>" + choices[i] + "</option>";
	    	    }
	    	    selectHTML += "</select>";
	    	    newDiv.innerHTML = selectHTML;
	    	    console.log(selectHTML);
	    	    console.log(newDiv);
	    	    document.getElementById("year").appendChild(selectHTML);  */
	});
	function popup(){
		$("#exampleModal").modal('show');
	}
	
	</script>
<script>
function disable(){
	var email = currentMail;
	$("#userEmail").html(email);	
	$("#disableModal").modal('show');

}

//DISPLAY MESSAGE DISABLEMFA. 
$('#disableMsg').on('click', function () {
    $.confirm({
        title: '<spring:message code="label.disablesMFA"/>',
        content: '<spring:message code="label.mfaDisableSucess"/>',
       		 buttons: {
        	
            somethingElse: {
                text: 'OK',
                btnClass: 'btn-primary',
               
                action: function(){
                	
                }
            } 
        }
    });
});
function disableMFA(){
	//debugger;
	var email = currentMail;
    	//alert('APi called');
    		var xhttpVerify = new XMLHttpRequest();
    		   xhttpVerify.open("GET", "<%=appUrl %>/app/disableMFAByAdmin?email="+email, true);
    		   xhttpVerify.send();
    	  	   xhttpVerify.onreadystatechange = function(res) {
    	  		 if (this.readyState == 4 && this.status == 200) {	
    	  			$("#disableMsg").trigger("click");
    	  		 }
    	  		 if (this.readyState == 4 && this.status == 500){
    	  			alert('<spring:message code="label.couldNotDisableMFA"/>');
    	  	   }
    	}
    	
    }
	  

  	
	
</script>

