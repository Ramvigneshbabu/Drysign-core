<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page
	import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.core.Authentication"%>
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
<link rel="stylesheet" href="<%=appUrl %>/css/jquery-ui.css">
<link rel="stylesheet" href="<%=appUrl %>/css/materialize-tags.min.css">
<!--<link rel="stylesheet" href="<%=appUrl %>/css/style.css">
 <link rel="stylesheet" href="<%=appUrl %>/css/inner_page.css"/>-->
<link href="<%=appUrl %>/css/materialize.css" rel="stylesheet"/> 
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="<%=appUrl %>/css/responsive.bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=appUrl %>/css/responsive.dataTables.css"> -->
<link rel="stylesheet" href="<%=appUrl %>/css/jquery.dataTables.min.css">
<style>
table.dataTable thead th.sorting::after, table.dataTable thead th.sorting_asc::after, table.dataTable thead th.sorting_desc::after {
    position: relative;
    top: 0;
    right: 0;
    display: inline-table;
    font-family: FontAwesome;
    left: 10px;
}
.checkbox.checkbox-primary {
    margin-left: 13px !important;
}
.checkbox label::after{
padding-left:5px !important;
padding-top: 3px !important;
margin-top:0 !important;
}
.fa-cloud-upload{
color: #124e73 !important;
font-size:12px;
}
i.fa-upload,i.fa-cloud-upload,i.fa-trash{
padding:4px;
} 
.fa-upload{
color: #124e73 !important;
font-size:12px;

}
.fixedwidthaction{
width:90px !important;}
#fixedwidth{
width:300px !important;}

.imgbulk{
margin-right:45px;
cursor:pointer !important;
}
.fa-trash {
	color:#124e73 !important;
	font-size:12px;
}

span#remove-icon {
	/* text-align: right; */
	float: right;
}
@media screen and (max-width: 370px) {
		.child ul li{
float:left;}

}

@media screen and (max-width: 640px) {
	.dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter
		{
		float: none;
		/*text-align: left !important;*/
	}

}

@media screen and (max-width: 520px) {
	#example_wrapper {
		margin-top: 50px;
	}

	.createbutton {
		/* float: right; */
	/*	position: absolute;*/
		float: right;
		right: 0;
		top: 5px;
		z-index: 1;
		cursor: pointer;
		left: 0;
		/*width: 50%;*/
		margin: 0 auto;
	}
}
@media screen and (max-width: 768px) {
.imgbulk{
margin-right:15px;
}
}
@media only screen and (min-width: 768px) and (max-width: 768px) {

	.pagination {
		position: relative;
		right: 25px;
	}
	select.form-control.input-sm {
		margin: 0 !important;
	}
}

.dataTables_wrapper .dataTables_length {
	margin-right: 10px;
}

.dataTables_filter {
	text-align: left !important;
}

.dataTables_filter {
	float: left !important;
}

table.table.padding0 td {
	padding: 0 !important;
}

/*.loader2 {
    position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 99999;
	background: url('<%=appUrl %>/images/ajax-loader_1.gif') 50% 50% no-repeat rgba(43, 40, 40, 0.37);
 }*/
</style>

<div id="loader2" class="loader2" style="display: none">
	<div class="loaderdiv">
		<p>
			<img src="<%=appUrl %>/images/drysign_logo_mono.svg">
		</p>
		<p>
			<img src="<%=appUrl %>/images/drysign-logo-line_only.gif">
		</p>
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
		<div class="row margB20">
			<div class="col-xs-12">
				<div class="Content-wh-module" id="templateContainer">
					<!-- <button type="button" class="btn btn-primary createbutton" >Create New Template</button> -->
					<a href="<%=appUrl %>/app/document/template"
						class="btn btn-primary createbutton"><spring:message code="label.uploadtemp"/></a>

					<h4 id="alrt" style="text-align: center; display: none"><spring:message code="label.nodatavail"/></h4>
					<table id="example"
						class="display responsive table Data_table_heading dataTable no-footer"
						style="width: 100%">
						<thead>
							<tr>
								<th></th>
								<th id="fixedwidth"><spring:message code="label.draft_title"/></th>
								<th><spring:message code="label.dft_sgn_type"/></th>
								<th><spring:message code="label.succ_date"/></th>
								<th class="fixedwidthaction"><spring:message code="label.out_actn"/></th>
								<th></th>
							</tr>
						</thead>

						<%--          <table class="table padding0">
                <tr>
                	<td style="width:4px"> 
                	<img type="button" data-toggle="modal" data-target="#exampleModal" data-placement="top" title="Manual" src="<%=appUrl%>/images/manual.png">
                	</td>
                	<td style="width:4px"> 
                	<img type="button" data-toggle="tooltip" data-placement="top" title="Bulk" src="<%=appUrl%>/images/bulk.png">
                	</td>
                	<td style="width:4px"> 
                	<img type="button" data-toggle="tooltip" data-placement="top" title="Delete" src="<%=appUrl%>/images/delete.png">                	
                	</td>
                </tr>                
                </table>   --%>

					</table>


				</div>
			</div>
		</div>
		
				<div class="Content-wh-module text-center container-fluid" id="success-group-message" style="display:none">
		 	<div class="col-xs-12">
   	<img src="<%=appUrl %>/images/message-bg.png"/>		   	
	   <!-- <h4 class="message-text text-color-burmoda"><spring:message code="label.msg_succ"/></h4>
	   <p style="margin-top: 50px; font-size: 16px; width: 850px; max-width: 90%; margin: 0 auto"><spring:message code="label.msg_em_succ_signatory"/> > <a href="<%=appUrl %>/app/myfiles?tab=outforsign"> <spring:message code="label.dash_outdoc"/></a>
				   <spring:message code="label.msg_em_succ_c1_signatory"/> > <a href="<%=appUrl %>/app/myfiles?tab=completed"><spring:message code="label.cmplt_doc"/>.</a> <spring:message code="label.msg_em_succ_c2_signatory"/>
		</p> -->
		<h4 class="message-text text-color-burmoda"><spring:message code="label.msg_succ"/></h4>
	  <!--  Changes done to resolve DrySign: 1471 by Rupali.Shinde.
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
		
	</div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document" id="centeralignModel">
		<div class="modal-content" id="emailpop">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<label class="model-label"><spring:message code="label.sgntory"/> </label>
			</div>
			<form id="testfor" autocomplete="off">
				<div class="modal-body boder0" id="demo">
					<div class="row">

						<div class="col-md-6 col-sm-6">
							<input type="text" maxlength="30" class="form-control full-width" name="name"
								id="signname1" placeholder="<spring:message code="label.temp_name"/>" />
						</div>
						<div class="col-md-6 col-sm-6">
							<input type="text" class="form-control1 form-control full-width" maxlength="70" name="email"
								id="signemail1" placeholder="<spring:message code="label.temp_email"/>" />
						</div>
					</div>
				</div>
				<p id="emailerror"></p>

				<div class="modal-footer" style="border-top: 0">

					<div>
						<div class="col-md-7 col-sm-7 text-left m-t">
							<div class="checkbox checkbox-primary">
							<input type="checkbox" class="filled-in" id="checkbox" checked>
							<label for="checkbox"><spring:message code="label.send-tem"/></label>
							</div>
						</div>
						<div class="col-md-5 col-sm-5 text-right">
							<button type="button" onclick="sendtemplate();"
								class="btn btn-primary"><spring:message code="label.submit"/></button>
						</div>
					</div>

				</div>
			</form>
			<input type='hidden' class="form-control" id="docid" />
		</div>
	</div>
</div>


<div class="Message" id="deleteDocument">
	<div class="modal-header">
		<h4 class="modal-title"><spring:message code="label.comp_delete"/></h4>
		<!-- <a class="close" href="#" onclick="hiderDocumentPopUp();">
	  		<button type="button" class="close" data-dismiss="modal">×</button>
	  	</a>
	  	 -->
	</div>
	<div class="modal-body">

		<p><spring:message code="label.delte-confirm"/></p>

	</div>

	<div class="text-right">
		<button type="button" class="btn btn-light"
			onclick="hiderDocumentPopUp();"><spring:message code="label.cancel"/></button>
		<button type="button" class="btn btn-blue"
			onclick="deleteDocumentPopUp();"><spring:message code="label.out_confm"/></button>
		
	</div>
</div>


<div class="overlay-bg"></div>
<input type="hidden" id="docId" value="" />

<jsp:include page="footer.jsp"></jsp:include>
<%--  <script src="<%=appUrl%>/js/materialize.js"></script> --%>
<script src="<%=appUrl %>/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=appUrl%>/js/jquery.validate.js"></script>

<style>
</style>
<script>

var appUrl;
$(document).ready(function() {
	
	var dataSet=${list};
	
	 appUrl="<%=appUrl %>";
	
			
    if(dataSet.length==0){
		$('#example').css('display','none');
		$('#alrt').css('display','block');
	}else{
	var table= $('#example').DataTable( {
		language: {
            "info": "<spring:message code="label.tmp_display"/> _START_ - _END_  <spring:message code="label.tmp_off"/> _MAX_",
	    	 },
	     pagingType: "full_numbers",
		 data: dataSet,
		 bSortable: true,
		 order: [[ 3, "desc" ]],
		 aoColumns : [
				 { "data": "docId"},
				{ "data": "docname" },
				{ "data": "signeeno" },
				{ "data": "uploaddate" },
				{ "data": function (data, type, dataToSet) {
			        return data.signeeno + "," + data.docId;
			    } },
				{"data": "docId"}
		
				
	      ],
	   
	      columnDefs : [
	                    {  
	                    targets : [4],
	                       render : function (data, type, row) {
		                    	  var res = data.split(",");
		                    	  if(res[0]=='1'){
		                    	  data = '<i class="fa fa-upload" onclick="popup(\''+res[0]+'\');" rel="tooltip" data-toggle="modal" data-target="#exampleModal" data-placement="top" data-backdrop="static" title="<spring:message code="label.manual"/>" data-keyboard="false"/></i>';
		                    	  data  =data + '<i  onclick="redirecttoBulkUpload(\''+res[1]+'\');" class="fa fa-cloud-upload" title="<spring:message code="label.bulk"/>" data-toggle="tooltip" data-placement="top" id="testb"></i>'; 
		                    	  data = data + '<i class="fa fa-trash"  onclick="deletetemp(\''+res[1]+'\');" title="<spring:message code="label.comp_delete"/>" data-toggle="tooltip" data-placement="top" id="delete"></i>';
		                    	  }
		                    	  else {
		                    		data = '<td><img type="button" rel="tooltip" data-toggle="modal"  data-placement="top" title="<spring:message code="label.manual"/>" data-target="#exampleModal" onclick="popup(\''+res[0]+'\');"><i class="fa fa-cloud-upload"></i></img></td>';
																}//'<a class="text-green" href="'+contextPath+'app/document/redirect/'+data+'">Edit</a><a href="#" data-target="#exampleModal" class="text-red" onclick="deleteDocument(\''+data+'\');"">Delete</a>';
																return data;
								}
														
	                    },
														{
															targets : [ 0 ],
															"visible" : false,
															render : function(
																	data, type,
																	row) {

																data = '<td style="width:4px"> <a  data-toggle="tooltip" data-placement="top" title="<spring:message code="label.comp_delete"/>" value="\''+data+'\'" data-original-title="Delete"><i class="fa fa-trash" aria-hidden="true"></i></a></td>';

																//'<a class="text-green" href="'+contextPath+'app/document/redirect/'+data+'">Edit</a><a href="#" data-target="#exampleModal" class="text-red" onclick="deleteDocument(\''+data+'\');"">Delete</a>';
																return data;
															}
														},
														{
															targets : [ 5 ],
															orderable : false,
															visible:false,
															render : function(
																	data, type,
																	row) {

																data = '<td style="width:4px"> <a data-toggle="tooltip" data-placement="top" title="<spring:message code="label.comp_delete"/>" onclick="deletetemp(\''
																		+ data
																		+ '\');" data-original-title="<spring:message code="label.comp_delete"/>"><i class="fa fa-trash" aria-hidden="true"></i></a></td>';

																//'<a class="text-green" href="'+contextPath+'app/document/redirect/'+data+'">Edit</a><a href="#" data-target="#exampleModal" class="text-red" onclick="deleteDocument(\''+data+'\');"">Delete</a>';
																return data;

															}
														}, {
															targets : [ 4 ],
															orderable : false,
															"visible" : true,

														},

												]

											});
						}
						$('#example tbody')
								.on(
										'click',
										'tr',
										function() {

											var selectedIndex = table.row(this)
													.data();
											console.log("ho"
													+ selectedIndex['docId']);// JSON.stringify(selectedIndex));
											document.getElementById("docid").value = selectedIndex['docId'];
										});

					});

	$("#example").on("click", "tr", function() {
		var a = console.log($(this).children(":first").text());
		// document.getElementById("docid").value = $(this).children(":first").text();

	});
	
	function redirecttoBulkUpload(docId){
	
		location.href=appUrl+"/app/templatebulk?docId="+docId;
	}
	
	function popup(num) {

		$("#demo").empty();
		var html =
		// ' <h1>Signee</h1>'+
		'	<div class="col-sm-6">'
				+ '	<input type="text" maxlength="30" class="form-control namevalidation" placeholder="<spring:message code="label.temp_name"/>"/>'
				+ '	</div>'
				+ '	<div class="col-sm-6">'
				+ '	<input type="text" maxlength="70"  class="form-control1 form-control" placeholder="<spring:message code="label.temp_email"/>"/>'
				+ '	</div>';
		var i;
		for (i = 1; i <= num; i++) {
			var p = document.getElementById('demo');
			var newElement = document.createElement('div');
			newElement.setAttribute('id', 'file-' + i);
			newElement.setAttribute('class', 'row');
			newElement.innerHTML = //' <h1>Signee</h1>'+
			'	<div class="col-sm-6">'
					+ '	<input type="text" maxlength="30" class="form-control namevalidation " name="name" id="signname'+i+'" placeholder="<spring:message code="label.temp_name"/>"/>'
					+ '	</div>'
					+ '	<div class="col-sm-6">'
					+ '	<input type="text" maxlength="70" class="form-control1 form-control" name="email" id="signemail'+i+'" placeholder="<spring:message code="label.temp_email"/>"/>'
					+ '	</div>';
			p.appendChild(newElement);

			//  addElement('demo', 'div', 'file-'+i, html,'row');
		}
		//Accept UTF 8 character only firstname lastname validations
		   
		$('#signname1').on('keypress', function (e) {
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

			   /* $( ".namevalidation" ).bind( 'paste',function()
			   {
				   var regex = new RegExp("[^\\w-_. ]");
			      	 var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
			      		    if (regex.test(key)) {
			      		       event.preventDefault();
			      		       return false;
			      		    }

			    }); */
			 $( ".namevalidation" ).bind( 'paste',function()
					   {
					       setTimeout(function()
					       { 
					          //get the value of the input text
					          var data= $( '.namevalidation' ).val() ;
					          //replace the special characters to '' 
					          var dataFull = data.replace(/[^\w\s]/gi, '');
					          //set the new value of the input text without special characters
					          $( '.namevalidation' ).val(dataFull);
					       });

					    });
			}); 

	}

	function bulktemp(bulkid) {

		console.log("bulk test" + bulkid)

		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath = $("#contextPath").val();

		$.ajax({
			//contentType : 'application/json; charset=utf-8',
			type : "GET",
			url : contextPath + "app/templatebulk?docId=" + bulkid,
			beforeSend : function(xhr) {
				//$('#signupbtn').buttonLoader('start');
				xhr.setRequestHeader(header, token);
			},
			complete : function() {
				//$("#signupbtn").buttonLoader('stop');
			},
			success : function(response) {
				//alert(response);
			},
			error : function(xhr, textStatus, errorThrown) {
				alert('<spring:message code="label.loading_error"/>');
				return false;
			}
		})

	}

	function deletetempold(docid) {
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath = $("#contextPath").val();
		$.confirm({
			title : '<spring:message code="label.dlt_tep"/>',
			content : '<spring:message code="label.tep_dlte"/>',
			buttons : {

				confirm : {
					btnClass : 'btn-default',
					action : function() {

						$.ajax({
							//contentType : 'application/json; charset=utf-8',
							type : "GET",
							url : contextPath + "app/deleteTemplate?docId="
									+ docid,
							beforeSend : function(xhr) {
								//$('#signupbtn').buttonLoader('start');
								xhr.setRequestHeader(header, token);
							},
							complete : function() {
								//$("#signupbtn").buttonLoader('stop');
							},
							success : function(response) {
								//alert(response);
								if (response == "success") {

									location.reload();
								} else {
									alert('<spring:message code="label.tep_dlte"/>');
								}
							},
							error : function(xhr, textStatus, errorThrown) {
								alert('<spring:message code="label.temp_err"/>');
								return false;
							}
						})

					},
				},
				cancel : {
					btnClass : 'btn btn-light',
					action : function() {

					}
				}
			}
		});

	}

	function addElement(parentId, elementTag, elementId, html, elementclass) {
		// Adds an element to the document
		var p = document.getElementById(parentId);
		var newElement = document.createElement(elementTag);
		newElement.setAttribute('id', elementId);
		newElement.setAttribute('class', elementclass);
		newElement.innerHTML = html;
		p.appendChild(newElement);
	}

	jQuery.validator.addMethod("validate_email", function(value, element) {

		if (/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
				.test(value)) {
			return true;
		} else {
			return false;
		}
	}, "<spring:message code="label.email_msgrequired"/>");
	$.validator.addMethod("emailcheck", function(value, element) {
	    var re = /^(([^<>(){}[\]\\.,;:\s@\"]+(\.[^<>(){}[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	    return this.optional(element) || re.test(value);      
	}, "<spring:message code="label.validEmail_msgrequired"/>");
	
	jQuery.validator.addMethod("checkempty", function(value) {
		return $.trim( value );
		}, "<spring:message code="label.emptyfld"/>");
	
	var formvalid = $("#testfor").validate({
		//specify the validation rules
		errorElement : 'div',
		errorClass : 'error',
		rules : {
			name : {
				required : true,
				checkempty:true
				//lettersonly: true
			},
			email : {
				required : true,
				//validate_email : true
				emailcheck:true,
				checkempty:true
			}
		},
		//specify validation error messages
		messages : {
			subject : "<spring:message code="label.temp_namemsg"/>",
			message : "<spring:message code="label.temp_email_msg"/>",
			name :{
				required: "<spring:message code="label.name_msg"/>"
				},
			email :{
			    required: "<spring:message code="label.enter_email_addr"/>"
			    }
		}
	});

	function checkDuplicates() {
		// get all input elements
		var $elems = $('.form-control1');

		// we store the inputs value inside this array
		var values = [];
		// return this
		var isDuplicated = false;
		// loop through elements
		$elems.each(function() {
			//If value is empty then move to the next iteration.
			if (!this.value)
				return true;
			//If the stored array has this value, break from the each method
			if (values.indexOf(this.value) !== -1) {
				isDuplicated = true;
				return false;
			}
			// store the value
			values.push(this.value);
		});

		return isDuplicated;
	}

	function sendtemplate() {
		var valid = $("#testfor").valid();
		//alert(valid);
		if (valid == true) {
			if (checkDuplicates()) {
				$('#emailerror').html('<spring:message code="label.dup_email"/>');
			} else {
				var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");
				var contextPath = $("#contextPath").val();
				var ckbox2 = $('#checkbox');
				var mailflag = "1";
				if (ckbox2.is(':checked')) {
					var mailflag = "1";
				} else {
					var mailflag = "0";
				}

				var e = $('#demo input').length;
				console.log(e);
				var docId = $('#docid').val();
				console.log(docId);
				var a = e / 2;
				console.log(a);
				var jasonArray = [];

				for (var i = 1; i <= a; i++) {
					console.log(document.getElementById('signname' + i).value);
					console.log(document.getElementById('signemail' + i).value);
					var item = {};
					item['name'] = document.getElementById('signname' + i).value;
					item['email'] = document.getElementById('signemail' + i).value;
					jasonArray.push(item);
				}
				var info = "?docId=" + docId + "&mailflag=" + mailflag;
				$
						.ajax({
							type : "POST",
							url : contextPath + "app/sendTemplate" + info,
							dataType : 'json',
							contentType : "application/json; charset=utf-8",
							data : JSON.stringify(jasonArray),
							beforeSend : function(xhr) {
								// 	$(btn).buttonLoader('start');
								$("#loader2").show();
								xhr.setRequestHeader(header, token);
							},
							complete : function() {
								// 	$(btn).buttonLoader('stop');
								$("#loader2").hide();
							},
							success : function(response) {
								console.log(response);
								if (response == 'success') {
									$("#myModal").removeClass("in");
									$(".modal-backdrop").remove();
									$("#exampleModal").hide();
									/*$.alert({
										title : '<spring:message code="label.temp_sntemail"/>',
										content : '',
									});*/
									$("#templateContainer").hide();
									$("#success-group-message").show();
									//alert("success");
									//	$("#show-groupsign-steps").hide();
									//	$("#success-group-messgae").show();
								} else if (response == 'subscriptionend') {
									$("#myModal").removeClass("in");
									$(".modal-backdrop").remove();
									$("#exampleModal").hide();
									$
											.alert({
												title : '<spring:message code="label.subsend"/>',
												content : '<spring:message code="label.crd_limit"/>',
											});
								} else {
									$
											.alert({
												content : '<spring:message code="label.err_mail"/>',
											});
								}
							},
							error : function(e) {
								alert('<spring:message code="label.slf_error"/>: ' + e);
							}
						});
			}
		}
	}
	function deletetemp(docId) {

		$("#docId").val(docId);
		$('#deleteDocument').show();
		$('.overlay-bg').show();
		$('.overlaywhite_bg').show();
	}
	function hiderDocumentPopUp() {

		$('#deleteDocument').hide();
		$('.overlay-bg').hide();
		$('.overlaywhite_bg').hide();

	}

	function deleteDocumentPopUp() {
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath = $("#contextPath").val();
		var docid = $("#docId").val();

		$.ajax({
			type : "GET",
			url : contextPath + "app/deleteTemplate?docId=" + docid,

			beforeSend : function(xhr) {

				xhr.setRequestHeader(header, token);
			},
			complete : function() {

			},

			success : function(response) {
				location.reload();
			},
			error : function(xhr, textStatus, errorThrown) {
				alert('<spring:message code="label.loading_error"/>' + errorThrown);
				console.log(errorThrown);
				return false;
			}
		});
	}

	$(document).ready(function() {
		$('[rel="tooltip"]').tooltip({
			trigger : "hover"
		});
		var title = '${title}';
		if (title == 'Template View') {
			$("#documentSidebar").removeClass('active');
			$("#templateSidebar").addClass('active');
		}
		  jQuery.validator.addMethod("lettersonly", function(value, element) {
		    	return this.optional(element) || /^[a-zA-Z ]+(([,._ -/][a-zA-Z 0-9])?[a-zA-Z0-9 ]*)*$/i.test(value);
			}, "<spring:message code="label.allowedchar"/>"); 
	});
</script>