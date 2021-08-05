<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="<%=appUrl%>/css/jquery.dataTables.min.css">
<style>
#filename{
margin:0;}
#remove{
    position:absolute;
    top:3px;}
   input:not([type]).valid, input:not([type]):focus.valid, input[type=text].valid, input[type=text]:focus.valid, input[type=password].valid, input[type=password]:focus.valid, input[type=email].valid, input[type=email]:focus.valid, input[type=url].valid, input[type=url]:focus.valid, input[type=time].valid, input[type=time]:focus.valid, input[type=date].valid, input[type=date]:focus.valid, input[type=datetime].valid, input[type=datetime]:focus.valid, input[type=datetime-local].valid, input[type=datetime-local]:focus.valid, input[type=tel].valid, input[type=tel]:focus.valid, input[type=number].valid, input[type=number]:focus.valid, input[type=search].valid, input[type=search]:focus.valid, textarea.materialize-textarea.valid, textarea.materialize-textarea:focus.valid {
   border-bottom: 1px solid #9FB6C1 !important;
   }
   input:not([type]):focus:not([readonly]), input[type="text"]:focus:not([readonly]), input[type="password"]:focus:not([readonly]), input[type="email"]:focus:not([readonly]), input[type="url"]:focus:not([readonly]), input[type="time"]:focus:not([readonly]), input[type="date"]:focus:not([readonly]), input[type="datetime"]:focus:not([readonly]), input[type="datetime-local"]:focus:not([readonly]), input[type="tel"]:focus:not([readonly]), input[type="number"]:focus:not([readonly]), input[type="search"]:focus:not([readonly]), textarea.materialize-textarea:focus:not([readonly]){
   border-bottom:1px solid #9FB6C1 !important;
   }
   #users_filter input:focus {
   border: none !important;
   }
   #openUpload{
   position: absolute;
   top: 1px;
   right:0px;}
</style>
<div id="loader2" class="loader2" style="display: none">
   <div class="loaderdiv">
      <p>
         <img src="<%=appUrl %>/images/drysign_logo_mono.svg">
      </p>
      <p>
         <img src="<%=appUrl %>/images/drysign-logo-line_only.gif">
      </p>
      <p>
         <spring:message code="label.wait" />
      </p>
   </div>
</div>
<a href="#" id="disableMsg" style="visibility: hidden;"></a>
<div class="content-wrapper bg_wrap">
   <div class="container-fluid">
      <label class="label-heading"><spring:message code="label.general_purchase"/></label>
      <!-- breadcrumb -->
      <ol class="breadcrumb" id="admin_breadcrumb">
         <li><spring:message code="label.home_page"/></li>
         <li class="active"><spring:message code="label.addUser"/></li>
      </ol>
   </div>
   <!-- Main content -->
   <section class="container-fluid contentdoc">
      <div class="Content-wh-module">
         <div class="row">
            <div class="table_scroll">
               <div class="col-md-12 col-sm-12 col-xs-12  ">
                  <!-- Sarika UI Code -->
                  <li class="dropdown adminDropdown pull-right">
                     <!-- Menu toggle button --> 
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                        aria-expanded="true">
                     <button class="btn btn-primary" id="addUser"><spring:message code="label.addUser"/></button>
                     </a>
                     <ul class="dropdown-menu" id="drpdwn">
                        <li id="individual"><spring:message code="label.indivisual"/></li>
                        <li id="bulkUser"><spring:message code="label.bulkUser"/></li>
                        <!-- <li id="editAdministrator">Edit Administrator</li> -->
                     </ul>
                     <span class="pull-left excelicon"><i
                        class="fa fa-file-excel-o" id="btnExport" aria-hidden="true"></i></span>
                  </li>
                  <!-- Sarika UI Code -->
                  <!-- Individul form -->
                  <table id="users"
                     class="display table Data_table_heading table-striped table-bordered dataTable"
                     cellspacing="0" width="100%" style="font-size: 16px;">
                     <thead>
                        <tr>
                           <th style="width: 300px">
                              <spring:message code="label.login-fname"/>
                           </th>
                           <th style="width: 300px">
                              <spring:message code="label.login-lname"/>
                           </th>
                           <th style="width: 300px">
                              <spring:message code="label.user_email"/>
                           </th>
                           <th style="width: 300px">
                              <spring:message code="label.login-cname"/>
                           </th>
                           <th style="width: 300px">
                              <spring:message code="label.document_allocation"/>
                           </th>
                           <th style="width: 130px;text-align: center;">
                              <spring:message code="label.out_actn"/>
                           </th>
                        </tr>
                     <tfoot>
                        <tr>
                           <th style="width: 300px">
                              <spring:message code="label.login-fname"/>
                           </th>
                           <th style="width: 300px">
                              <spring:message code="label.login-lname"/>
                           </th>
                           <th style="width: 300px">
                              <spring:message code="label.user_email"/>
                           </th>
                           <th style="width: 300px">
                              <spring:message code="label.login-cname"/>
                           </th>
                           <th style="width: 300px">
                              <spring:message code="label.document_allocation"/>
                           </th>
                           <th style="width: 130px;text-align: center;">
                              <spring:message code="label.out_actn"/>
                           </th>
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
                        </tr>
                        <!-- <tr>
                           <td>ABC</td>
                           <td>PQR</td>
                           <td>Abc@gmail.com</td>
                           <td>Exela</td>
                           <td>Doc Allocation</td>
                           <td id="editAdministrator"><i onclick = "editUser('12241');" class="fa fa-pencil"></i></td>
                           </td>
                           </tr> -->
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
         <!-- sarika UI Code -->
         <div class="Message" id="individualForm">
            <form class="formName" id="indFormValidation">
               <div class="modal-header">
                  <!-- <button type="button" class="close" data-dismiss="modal" onclick="hidePopUp();">×</button> -->
                  <h4 class="model-title"><spring:message code="label.addUser"/></h4>
               </div>
               <div class="modal-body">
                  <div class="row">
                     <div class="col-md-6 col-sm-12 ">
                        <div class="inputfield">
                           <label for="firstname"><spring:message code="label.firstName"/><span class="redstar1">*</span></label>
                           <input id="firstname" name="firstName" type="text"
                              placeholder="<spring:message code="label.fname"/>" maxlength="30" />
                        </div>
                     </div>
                     <div class="col-md-6 col-sm-12 ">
                        <div class="inputfield">
                           <label for="lastname"><spring:message code="label.lastName"/><span class="redstar1">*</span></label>
                           <input id="lastname" name="lastname" type="text"
                              placeholder="<spring:message code="label.lname"/>" maxlength="30" />
                        </div>
                     </div>
                     <div class="col-md-6 col-sm-12 ">
                        <div class="inputfield">
                           <label for="email"><spring:message code="label.emailId"/><span class="redstar1">*</span></label>
                           <input id="email" name="email" type="text" maxlength="70"
                              placeholder="<spring:message code="label.temp_email"/>">
                        </div>
                     </div>
                     <div class="col-md-6 col-sm-12 ">
                        <div class="inputfield">
                           <label for="phone"><spring:message code="label.contactNumber"/></label> <input id="phone"
                              name="phone" type="text" maxlength="12"
                              placeholder="<spring:message code="label.contact"/>">
                        </div>
                     </div>
                     <div class="col-md-6 col-sm-12 ">
                        <div class="inputfield">
                           <label for="company_name"><spring:message code="label.companyName"/></label> <input
                              id="company_name" name="company_name" type="text"
                              maxlength="30" disabled />
                        </div>
                     </div>
                     <div class="col-md-6 col-sm-12 ">
                        <div class="inputfield">
                           <label for="docAllocation"><spring:message code="label.documentAllocation"/><span
                              class="redstar1">*</span></label> <input id="docAllocation"
                              name="docAllocation" type="text"
                              placeholder="<spring:message code="label.docAlocationCount"/>" maxlength="5"
                              oninput="this.value=this.value.replace(/[^0-9]/g,'');" />
                        </div>
                     </div>
                     <div class="col-md-6 col-sm-12 ">
                        <div class="inputfield">
                           <label for="template inputfiled_Template"><spring:message code="label.template"/><span class="redstar1">*</span></label>
                           <input id="template" name="template" type="text" value="10"
                              disabled placeholder="" maxlength="5"
                              oninput="this.value=this.value.replace(/[^0-9]/g,'');" /> <span><spring:message code="label.disclaimer"/>
                           <span id="availableDoc"></span>/<span id="creditedDoc"></span>
                           <spring:message code="label.documentAreUsed"/>
                           </span>
                        </div>
                     </div>
                     <div class="col-md-12">
                        <div class="text-right">
                           <button type="button" class="btn btn-light"
                              onclick="hidePopUp();"><spring:message code="label.cancel"/></button>
                           <button type="button" class="btn btn-blue" id="indForm_Submit"><spring:message code="label.submit"/></button>
                        </div>
                     </div>
                  </div>
               </div>
            </form>
         </div>
         <!-- Bulk user -->
         <div class="Message" id="bulkUserForm">
            <form id="bulktemp">
               <div class="modal-header row">
                  <!-- <button type="button" class="close" data-dismiss="modal" onclick="hidePopUp();">×</button> -->
                  <p class="model-title"><spring:message code="label.uploadList"/></p>
               </div>
               <div class="modal-body">
                  <div class="row">
                     <div class="uploadFile">
                        <label class="btn-bs-file fileadmin"> <input id="upload"
                           type="file" name="files"
                           accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" />
                        <input id="filename" type="text"
                           placeholder="<spring:message code="label.upload_excel"/>" readonly /> <span
                           class="fa fa-times pull-right" id="remove"
                           onclick="myFunction()" hidden></span>
                        <button id="openUpload" type="button"
                           class="file-upload-button" tabindex="-1">
                        <span class="icon-upload"></span>
                        </button>
                        </label>
                     </div>
                     <span id="csverror" class="error"></span>
                  </div>
                  <div class="row">
                     <%--<button type="button" class="btn btn-light downloadTem">Download Template</button>--%>
                     <a href="<%=appUrl %>/CSV File/Bulk User Registration.xlsx"
                        class="btn btn-light downloadTem"><spring:message code="label.downloadTemplate"/></a>
                  </div>
                  <div class="row">
                     <div class="text-right">
                        <button type="button" class="btn btn-light"
                           onclick="hidePopUp();"><spring:message code="label.cancel"/></button>
                        <button type="button" id="sendfile" class="btn btn-blue"
                           disabled><spring:message code="label.submit"/></button>
                     </div>
                  </div>
               </div>
            </form>
         </div>
         <!-- Edit Administrator -->
         <div class="Message" id="editAdministratorForm">
            <form class="formName" id="edit_indFormValidation">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"
                     onclick="hidePopUp();"><spring:message code="label.x"/></button>
                  <h4 class="model-title"><spring:message code="label.editUser"/></h4>
               </div>
               <div class="modal-body">
                  <div class="row">
                     <div class="col-md-6 col-sm-12 ">
                        <div class="inputfield">
                           <label for="edit_firstname"><spring:message code="label.firstName"/> <span
                              class="redstar1"></span></label> <input id="edit_firstname"
                              name="edit_firstname" type="text" placeholder="<spring:message code="label.firstName"/>"
                              maxlength="30" disabled/> 
                           <input type = "hidden" id = "edit_userId"></input><!-- <span class="error">This field is
                              required.</span> -->
                        </div>
                     </div>
                     <div  class="col-md-6 col-sm-12 ">
                        <div class="inputfield">
                           <label for="edit_lastname"><spring:message code="label.lastName"/> <span class="redstar1"></span></label>
                           <input id="edit_lastname" name="edit_lastname" type="text"
                              placeholder="<spring:message code="label.lastName"/>" maxlength="30" disabled /> <!-- <span class="error">This
                              field is required.</span> -->
                        </div>
                     </div>
                     <div  class="col-md-6 col-sm-12 ">
                        <div class="inputfield">
                           <label for="edit_email"><spring:message code="label.emailId"/></label> <input id="edit_email"
                              name="edit_email" type="text" maxlength="70"
                              placeholder="<spring:message code="label.emailFormat"/>" disabled> <!-- <span class="error">This
                              field is required.</span> -->
                        </div>
                     </div>
                     <div  class="col-md-6 col-sm-12 ">
                        <div class="inputfield">
                           <label for="edit_contact"><spring:message code="label.contactNumber"/> <span
                              class="redstar1"></span></label> <input id="edit_contact"
                              name="edit_contact" type="text" maxlength="15"
                              placeholder="<spring:message code="label.enterPhoneNumber"/>" disabled> <!-- <span class="error">This
                              field is required.</span> -->
                        </div>
                     </div>
                     <div  class="col-md-6 col-sm-12 ">
                        <div class="inputfield">
                           <label for="edit_companyname"><spring:message code="label.companyName"/></label> <input
                              id="edit_companyname" name="edit_companyname" type="text"
                              placeholder="<spring:message code="label.companyName"/>" maxlength="30" Disabled />
                           <!-- <span class="error">error</span> -->
                        </div>
                     </div>
                     <div class="col-md-6 col-sm-12 ">
                        <div class="inputfield">
                           <label for="edit_docAllocation"><spring:message code="label.availableDocuments"/><span
                              class="redstar1"></span></label> <input id="edit_docAllocation"
                              name="edit_docAllocation" type="text"
                              placeholder="Document Allocation" maxLength="5" oninput="this.value=this.value.replace(/[^0-9]/g,'');"/> <!-- <span class="error">This
                              field is required.</span> -->
                        </div>
                     </div>
                     <div class="col-md-6 col-sm-12 ">
                        <div class="inputfield">
                           <label for="edit_template"><spring:message code="label.availableTemplates"/><span class="redstar1"></span></label>
                           <input id="edit_template" name="edit_template" type="text"
                              placeholder="Template Allocation" maxLength="5" oninput="this.value=this.value.replace(/[^0-9]/g,'');"/> <!-- <span
                              class="error">This field is required.</span> --> <span><spring:message code="label.disclaimer"/>
                           <span id = "edit_used"></span>/<span id="edit_credit"></span>
                           <spring:message code="label.documentAreUsed"/></span>
                        </div>
                     </div>
                     <div class="col-md-12">
                        <div class="text-right">
                           <button type="button" class="btn btn-light"
                              onclick="hidePopUp();"><spring:message code="label.cancel"/></button>
                           <button type="button" class="btn btn-blue"
                              id="editindForm_Submit"><spring:message code="label.submit"/></button>
                        </div>
                     </div>
                  </div>
               </div>
            </form>
         </div>
         <div class="overlay-bg"></div>
         <!-- sarika UI Code -->
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
<script>
   var appUrl;
   var token;
   var header;
   
   //
   //Pipelining function for DataTables. To be used to the `ajax` option of DataTables
   //
   $.fn.dataTable.pipeline = function ( opts ) {
   
   	
   //Configuration options
   var conf = $.extend( {
   pages: 10, //5,     // number of pages to cache
   url: '',      // script url
   data: null,   // function or object with parameters to send to the server
              // matching how `ajax.data` works in DataTables
   method: 'GET' // Ajax HTTP method
   }, opts );
   
   //Private variables for storing the cache
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
   
   //alert("vvv requestStart "+requestStart+" drawStart"+drawStart+" requestLength:"+requestLength+"  requestEnd:"+requestEnd )
   
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
   
   //Store the request for checking next time around
   cacheLastRequest = $.extend( true, {}, request );
   
   //alert("vvv ajax "+ajax+"  draw "+request.draw);
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
   
   	  function resizeIframe(obj) {
   	    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
   	  }
   	  
   	 
   	$(document).ready(function() {
   		
   		 appUrl="<%=appUrl%>";
   		  token = $("meta[name='_csrf']").attr("content");
   		  header = $("meta[name='_csrf_header']").attr("content");	
   		  
   		var role = "<c:out value="${role}"></c:out>";
   		if("ROLE_CLIENT_ADMIN"== role){
   			$("#clientadmin").show();
   			$("#clientadmin").addClass("active");
   		}else{
   			$("#admindashboard").show();
   			$("#adminuser").show();
   			$("#drysignadminclient").show();
   		}
   		var table = $('#users').DataTable( {
   			 //   "processing": true,
   			    "serverSide": true,
   			 	"responsive":false,	//to make td clickable to expand set to false
   			   // "order": [[ 2, "desc" ]],		//sets default Assigned Date column in DESC order and also removes order icon from 0th column
   			    "ajax": $.fn.dataTable.pipeline({
   			    type : "GET",
   			    url : appUrl+"/app/client/getAdminUsers/",
   			        pages: 10  		
   			       
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
   				    { "data":"firstName" }, 
   					{"data": "lastname"},
   					{"data":"email"},
   					{ "data": "companyName" },
   					{ "data": "creditedDocuments" },
   			        {
   				        "orderable":      false,
   				        "data":           null,
   				      	"targets": 6,	     
   				         "render": function (data, type, row) { 		      
   				            
   				 		  	 
   				 		  	 var anchor="<a href='javascript:void(0)' id='editAdminClient' onclick=editUser("+data.id+")><span class='faIconespan'><i data-toggle='modal' class='fa fa-pencil'></i></span></a>"
   				 			 return anchor;
   				            	
   							 
   				        }   
   				    }
   			     ]
   			   
   			 });
   		 userColumnSearch(table);
   	} );
   	
   	
   function userColumnSearch(table){
   	
   	var i=1;
   	 $('#users tfoot th').each( function () {
   	        var title = $(this).text();
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
   	            	that.search( this.value ).draw();
   	            }
   	        } );
   	    } );
   	
   }
   
   $(document).ready(function() {
   	//
   	$("#individual").on('click', function() {
   		$("#individualForm").show();
   		$('.overlay-bg').show();
   		
   		token = $("meta[name='_csrf']").attr("content");
   		header = $("meta[name='_csrf_header']").attr("content");
   		contextPath=$("#contextPath").val();		
   		
   		$.ajax({
   			type : "GET",
   			url : contextPath+"app/client/availableDocumentCount",
   			beforeSend : function(xhr) {
   				xhr.setRequestHeader(header, token);
   			},
   			complete : function() {
   			},
   			success : function(response) {
   				//console.log(response);
   				$("#availableDoc").html(response.availableDocument);
   				$("#creditedDoc").html(response.creditedDocument);
   				$("#company_name").val(response.company);
   			},
   			error: function(xhr, textStatus, errorThrown)
   			 {
   			 	alert('<spring:message code="label.loading_error"/>');
   			 	return false;
   			}
   		});	
   	})
   	$("#bulkUser").on('click', function() {
   		$("#bulkUserForm").show();
   		$('.overlay-bg').show();
   		$(".icon-upload").show();
   		$("#remove").hide();
   	})
   	/* $("#editAdministrator").on('click',function(){
   		$("#editAdministratorForm").show();
   		$('.overlay-bg').show();
   	}) */
   	$("#editindForm_Submit").on('click',function(){
   		document.body.scrollTop = 0;
   		document.documentElement.scrollTop = 0;
   		var valid = $("#edit_indFormValidation").valid();
   		if(valid == true){
   			var token = $("meta[name='_csrf']").attr("content");
   			var header = $("meta[name='_csrf_header']").attr("content");
   			var contextPath=$("#contextPath").val();
   			var userData = {
   					"noOfDocuments":$("#edit_docAllocation").val(),
   					"template":$("#edit_template").val(),
   					"clientDetailsId":$("#edit_userId").val()
   			}
   			$.ajax({
   				contentType : 'application/json; charset=utf-8',
   				type : "POST",
   				url : contextPath+"/app/client/editUser",
   				dataType : 'json',
   				data : JSON.stringify(userData),
   				beforeSend : function(xhr) {
   					xhr.setRequestHeader(header, token);
   					$("#loader2").show();
   				},
   				complete : function() {
   					$("#loader2").hide();
   				},
   				success : function(response) {
   					//console.log(response);
   					if(response.docStatus == 1 && response.tempStatus == 1){
   						$.confirm({
   						    title: '',
   						    content: '<spring:message code="label.userUpdate"/>',
   						    buttons: {
   						        Ok: function () {
   						            location.reload();
   						        }
   						    }
   						});
   					}else if(response.docStatus == 0 && response.tempStatus == 0){
   						$.alert({
   						    title: '<spring:message code="label.alert1"/>',
   						    content: '<spring:message code="label.documentTemplateCount"/>',
   						});
   					}else if(response.docStatus == 2){
   						$.alert({
   						    title: '<spring:message code="label.alert1"/>',
   						    content: '<spring:message code="label.availableDocCount"/>',
   						});
   					}else if(response.docStatus == 3){
   						$.alert({
   						    title: '<spring:message code="label.alert1"/>',
   						    content: '<spring:message code="label.documentCountUsers"/>',
   						});
   					}else if(response.tempStatus == 2){
   						$.alert({
   						    title: '<spring:message code="label.alert1"/>',
   						    content: '<spring:message code="label.availableTemplateCount"/>',
   						});
   					}else if(response.tempStatus == 3){
   						$.alert({
   						    title: '<spring:message code="label.alert1"/>',
   						    content: '<spring:message code="label.availableTemplateCountUsers"/>',
   						});
   					}else if(response.docStatus == 1 || response.tempStatus == 1){
   						$.confirm({
   						    title: '',
   						    content: '<spring:message code="label.countUpdateSucess"/>',
   						    buttons: {
   						        Ok: function () {
   						            location.reload();
   						        }
   						    }
   						});
   					}
   					
   				},
   				error : function(xhr, textStatus, errorThrown) {
   					alert('<spring:message code="label.loading_error"/>');
   					return false;
   				}
   			});
   		}else{
   			$("#edit_indFormValidation .error").css("display","block");
   		}
   	})
   	
   	var editForm = $("#edit_indFormValidation").validate({
   									rules :{
   										
   										edit_template:{
   											required : true
   										},
   										edit_docAllocation : {
   											required : true
   										}
   									}
   			                 });
   	
   	$(".downloadTem").on('click',function(){
   		window.location.href = "<%=appUrl %>/app/client/bulkregistration";
   	});
   	$("#indForm_Submit").on('click',function(){
   	
   					var valid = $("#indFormValidation").valid();
   					if(valid == true){
   						var token = $("meta[name='_csrf']").attr("content");
   						var header = $("meta[name='_csrf_header']").attr("content");
   						var contextPath=$("#contextPath").val();
   						var userData = {
   								"firstName":$("#firstname").val(),
   								"lastName":$("#lastname").val(),
   								"email":$("#email").val(),
   								"mobile":$("#phone").val(),
   								"clientName":$("#company_name").val(),
   								"noOfDocuments":$("#docAllocation").val(),
   								"template":$("#template").val()
   						}
   						$.ajax({
   							contentType : 'application/json; charset=utf-8',
   							type : "POST",
   							url : contextPath+"/app/client/userregistration",
   							dataType : 'json',
   							data : JSON.stringify(userData),
   							beforeSend : function(xhr) {
   								xhr.setRequestHeader(header, token);
   								$("#loader2").show();
   							},
   							complete : function() {
   								$("#loader2").hide();
   							},
   							success : function(response) {
   								//console.log(response);
   								if(response == "success"){
   									$.confirm({
   									    title: '',
   									    content: '<spring:message code="label.userCreateSucessSentByEmail"/>',
   									    buttons: {
   									        Ok: function () {
   									            location.reload();
   									        }
   									    }
   									});
   								}else if(response == "lessdoc"){
   									$.alert({
   									    title: '<spring:message code="label.alert1"/>',
   									    content: '<spring:message code="label.pleaseChkAvailDocCount"/>',
   									});
   								}else if(response == "lesstemp"){
   									$.alert({
   									    title: '<spring:message code="label.alert1"/>',
   									    content: '<spring:message code="label.pleaseChkAvailTempCount"/>',
   									});
   								}else{
   									$.alert({
   									    title: '<spring:message code="label.alert1"/>',
   									    content: response,
   									});
   								}
   							},
   							error : function(xhr, textStatus, errorThrown) {
   								alert('<spring:message code="label.loading_error"/>');
   								return false;
   							}
   						});
   					}else{
   						$("#indFormValidation .error").css("display","block");
   					}
   				})
   				
   				//validations
   			var registrationForm = $("#indFormValidation").validate({
   									rules :{
   										firstName : { 
   											//lettersonly: true,
   											required : true,
   											checkempty : true
   										},
   										lastname : { 
   											//lettersonly: true,
   											required : true,
   											checkempty : true
   										},
   										email : {
   											required : true,
   											email : true,
   											emailcheck:true
   										//email is required AND must be in the form of a valid email address
   										},
   										template:{
   											required : true
   										},
   										docAllocation : {
   											required : true
   										},
   										phone :{
   											customphone: true,
   											minlength: 10
   										}
   									}
   			                 });
   	
   	$.validator.addClassRules('customphone', {
   	    customphone: true,
   	    required : true
   	});
   	
   	$.validator.addMethod("emailcheck", function(value, element) {
           var re = /^(([^<>(){}[\]\\.,;:\s@\"]+(\.[^<>(){}[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
           return this.optional(element) || re.test(value);
       }, "<spring:message code="label.validEmail_msgrequired"/>");
   	
   	$.validator.addMethod('customphone', function (value, element) {
   		 var valu2=value;
   		  valu2 = valu2.replace(/-/g, "");
   		return this.optional(element) || /^\d{3}\d{3}\d{4}$/.test(valu2);
   	}, "<spring:message code="label.validnumber"/>");
   	
   	 $('#phone').keydown(function (e) {
   		 //alert(e.charCode +"  "+ e.keyCode);
   	       var key = e.charCode || e.keyCode || 0;
   	       $text = $(this); 
   	       if (key !== 8 && key !== 9) {
   	           if ($text.val().length === 3) {
   	               $text.val($text.val() + '-');
   	           }
   	           if ($text.val().length === 7) {
   	               $text.val($text.val() + '-');
   	           }
   
   	       }
   
   	       return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
   	   })
   	
   	   /* $.validator.validator.addMethod("emailcheck", function(value, element) {
   		   var re = /^(([^<>(){}[\]\\.,;:\s@\"]+(\.[^<>(){}[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
   	        return this.optional(element) || re.test(value);
   		 }, 'Please enter a valid email address');
   				 */
   	}); //close
   function hidePopUp(){
   	$('.overlay-bg').hide();
   	$("#individualForm").hide();
   	$("#editAdministratorForm").hide();
   	$('.overlaywhite_bg').hide();
   	$("#bulkUserForm").hide();
   	$("#indFormValidation").validate().resetForm();
   	$('#indFormValidation')[0].reset();
   	$('#bulktemp')[0].reset();
   	$('#csverror').hide();
   	
   }
   
   $('#firstname').on('keypress', function (e) {
   	var keynum;
       var keychar;
       var numcheck;
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
       if (keychar =="!" || keychar =="@" || keychar =="#" || keychar =="$" || keychar =="%" || keychar =="^" || keychar =="&" || keychar =="*" || keychar =="(" || keychar ==")" || keychar =="+" || keychar =="=" || keychar =="/" || keychar =="~" || keychar =="<" || keychar ==">" || keychar =="," || keychar ==";" || keychar ==":" || keychar =="|" || keychar =="?" || keychar =="{" || keychar =="}" || keychar =="[" || keychar =="]" || keychar =="¬" || keychar =="£" || keychar =='"' || keychar =="\\") {	
       	e.preventDefault();
       	return false;
       } else {
           return true;
       }
   });
   $('#lastname').on('keypress', function (e) {
   	var keynum;
       var keychar;
       var numcheck;
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
       if (keychar =="!" || keychar =="@" || keychar =="#" || keychar =="$" || keychar =="%" || keychar =="^" || keychar =="&" || keychar =="*" || keychar =="(" || keychar ==")" || keychar =="+" || keychar =="=" || keychar =="/" || keychar =="~" || keychar =="<" || keychar ==">" || keychar =="," || keychar ==";" || keychar ==":" || keychar =="|" || keychar =="?" || keychar =="{" || keychar =="}" || keychar =="[" || keychar =="]" || keychar =="¬" || keychar =="£" || keychar =='"' || keychar =="\\") {	
       	e.preventDefault();
       	return false;
       } else {
           return true;
       }
   });
   $('#edit_firstname').on('keypress', function (e) {
   	var keynum;
       var keychar;
       var numcheck;
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
       if (keychar =="!" || keychar =="@" || keychar =="#" || keychar =="$" || keychar =="%" || keychar =="^" || keychar =="&" || keychar =="*" || keychar =="(" || keychar ==")" || keychar =="+" || keychar =="=" || keychar =="/" || keychar =="~" || keychar =="<" || keychar ==">" || keychar =="," || keychar ==";" || keychar ==":" || keychar =="|" || keychar =="?" || keychar =="{" || keychar =="}" || keychar =="[" || keychar =="]" || keychar =="¬" || keychar =="£" || keychar =='"' || keychar =="\\") {	
       	e.preventDefault();
       	return false;
       } else {
           return true;
       }
   });
   $('#edit_lastname').on('keypress', function (e) {
   	var keynum;
       var keychar;
       var numcheck;
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
       if (keychar =="!" || keychar =="@" || keychar =="#" || keychar =="$" || keychar =="%" || keychar =="^" || keychar =="&" || keychar =="*" || keychar =="(" || keychar ==")" || keychar =="+" || keychar =="=" || keychar =="/" || keychar =="~" || keychar =="<" || keychar ==">" || keychar =="," || keychar ==";" || keychar ==":" || keychar =="|" || keychar =="?" || keychar =="{" || keychar =="}" || keychar =="[" || keychar =="]" || keychar =="¬" || keychar =="£" || keychar =='"' || keychar =="\\") {	
       	e.preventDefault();
       	return false;
       } else {
           return true;
       }
   });
    jQuery.validator.addMethod("checkempty", function(value) {
   	return $.trim( value );
   	}, "<p>Empty Filed not allowed</p>"); 
   /*$.validator.addMethod("emailcheck", function(value, element) {
   var re = /^(([^<>(){}[\]\\.,;:\s@\"]+(\.[^<>(){}[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
   return this.optional(element) || re.test(value);
   }, "<spring:message code="label.validEmail_msgrequired"/>"); */
   
   //edit functionality
   
   function editUser(value){
   	//alert(value);
   	document.body.scrollTop = 0;
   	document.documentElement.scrollTop = 0;
   	var token = $("meta[name='_csrf']").attr("content");
   	var header = $("meta[name='_csrf_header']").attr("content");
   	var contextPath=$("#contextPath").val();
   
   		var userData = {
   				"clientDetailsId": value
   		}
   		$.ajax({
   			contentType : 'application/json; charset=utf-8',
   			type : "POST",
   			url : contextPath+"/app/client/getUserDetails",
   			dataType : 'json',
   			data : JSON.stringify(userData),
   			beforeSend : function(xhr) {
   				xhr.setRequestHeader(header, token);
   				$("#loader2").show();
   			},
   			complete : function() {
   				$("#loader2").hide();
   			},
   			success : function(response) {
   				//console.log(response);
   					$("#editAdministratorForm").show();
   					$('.overlay-bg').show();
   					$("#edit_firstname").val(response.firstname);
   					$("#edit_lastname").val(response.lastname);
   					$("#edit_email").val(response.email);
   					$("#edit_companyname").val(response.company);
   					$("#edit_userId").val(response.userId);
   					$("#edit_template").val(response.userTemp);
   					$("#edit_docAllocation").val(response.userDoc);
   					
   					$("#edit_used").html(response.usedDocument);
   					$("#edit_credit").html(response.creditedDocument);
   					phoneNumberFormat(response.phone);
   				
   			},
   			error : function(xhr, textStatus, errorThrown) {
   				alert('<spring:message code="label.loading_error"/>');
   				return false;
   			}
   		});
   	
   }//edit user end
   
   function phoneNumberFormat(val){
   	var contct = val.split("-");
   	if (contct[1] == "undefined" || contct[1] == "") {
   		$("#edit_contact").val("");
   	} else {
   		var ph=contct[1];
   		ph=ph.replace(/(\d{3})(\d{3})(\d{4})/, "$1-$2-$3");
   		// adding hyphen to numbers
   		$("#edit_contact").val(ph);
   	}	
   }
   
   $(function () {
       $("#btnExport").click(function () {
       	
       	window.location.href = "<%=appUrl %>/app/admin/exportExcelUser";
       	
          /*  $("#users").table2excel({
               filename: "Table.xls"
           }); */
       });
   });
   
   /* Bulk upload */
   
    $("#upload").click(function(){
   	    $(".icon-upload").show();
   	});
    function myFunction() {
   		$("#remove").hide();
   		document.getElementById('filename').value = "";
   		document.getElementById("bulktemp").reset();
   		$('#csverror').hide();	
   	}
   $('#openUpload').click(function(){ $('#upload').trigger('click'); });
   document.getElementById('upload').onchange = uploadOnChange;
   function uploadOnChange() {
       var filename = this.value;
       var validExts = new Array(".xlsx");
       var fileExt = filename;
       fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
       if(filename != ''){
       	$("#remove").show();
       	 $(".icon-upload").hide();
       	 $("#sendfile").prop("disabled", false);
       }
       if (validExts.indexOf(fileExt) < 0) {
       	$('#csverror').html("<spring:message code="label.blk_validfile"/> " +  validExts.toString() + " <spring:message code="label.blk_validfile_c"/>.");
     	document.getElementById("bulktemp").reset();
     	$('#csverror').show();
     	 $("#remove").hide();
        $(".icon-upload").show(); 
        $("#sendfile").prop("disabled", true);
       }else {
           var lastIndex = filename.lastIndexOf("\\");
           if (lastIndex >= 0) {
               filename = filename.substring(lastIndex + 1);
               $('#csverror').hide();
           }
           document.getElementById('filename').value = filename;
       }
   
   }
   
   $("#sendfile").click(function (event) {
   	$(".icon-upload").show();
   	  $("#remove").hide();
   	var token = $("meta[name='_csrf']").attr("content");
   	var header = $("meta[name='_csrf_header']").attr("content");
   	var contextPath=$("#contextPath").val();
       //stop submit the form, we will post it manually.
       event.preventDefault();
       // Get form
       var form = $('#bulktemp')[0];
   //console.log(form);
   	// Create an FormData object 
       var data = new FormData(form);
   //console.log("data is "+data);
   	
       $("#sendfile").prop("disabled", true);
    /* var docId =${docId};
    var info = "?docId="+docId+"&mailflag="+mailflag; */
       $.ajax({
           type: "POST",
           enctype: 'multipart/form-data',
           url: contextPath+"app/client/bulkUserRegistration",
           data: data,
           processData: false,
           contentType: false,
           cache: false,
           beforeSend : function(xhr) {
           	$("#loader2").show();
   			xhr.setRequestHeader(header, token);
   		},
   		complete : function() {
   			$("#loader2").hide();
   		},
           success: function (response) {
               console.log(response);
               if(response == "subscriptionend"){
               	 $
         			.confirm({
         				title : '',
         				content : '<spring:message code="label.planExpire"/>',
         				buttons : {
         					Ok : function() {
         						location
         								.reload();
         					}
         				}
         			});
               }else if(response == "success"){
               	
               	 $
        			.confirm({
        				title : '',
        				//content : 'User created successfully and sent a mail for verification. If something went wrong will notify on mail.',
        				content:'<spring:message code="label.registrationStatus"/>',
        				buttons : {
        					Ok : function() {
        						location
        								.reload();
        					}
        				}
        			});
               }else{
               	$
        			.confirm({
        				title : '',
        				//content : 'Please enter the valid user details and re-upload the file.',
        				content:'<spring:message code="label.fileNotUpload"/>',
        				buttons : {
        					Ok : function() {
        						location
        								.reload();
        					}
        				}
        			});
               }
              
           },
           error: function (e) {
   
               console.log("ERROR : ", e);
              
           }
       });
     
   });
</script>
<script
   src="//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>