<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page
   import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.core.Authentication"%>
<%
   Authentication auth = SecurityContextHolder.getContext().getAuthentication();
   %>
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
<%-- <link href="<%=appUrl%>/css/materialize.min.css" rel="stylesheet" />  --%>
<%--  <link rel="stylesheet" href="<%=appUrl%>/css/style.css" />  --%>
<%-- <link rel="stylesheet" href="<%=appUrl%>/css/inner_page.css" /> --%>
<%-- <link rel="stylesheet" href="<%=appUrl %>/css/exela_theme.css"/> --%>
<style>

   .flag_select_css_profile{
   height: 24px !important;
   }
   #addClientForm .form-control{
   padding: 0px 0px;
   height:25px !important;
   }
   input:not([type]).valid, input:not([type]):focus.valid, input[type=text].valid, input[type=text]:focus.valid, input[type=password].valid, input[type=password]:focus.valid, input[type=email].valid, input[type=email]:focus.valid, input[type=url].valid, input[type=url]:focus.valid, input[type=time].valid, input[type=time]:focus.valid, input[type=date].valid, input[type=date]:focus.valid, input[type=datetime].valid, input[type=datetime]:focus.valid, input[type=datetime-local].valid, input[type=datetime-local]:focus.valid, input[type=tel].valid, input[type=tel]:focus.valid, input[type=number].valid, input[type=number]:focus.valid, input[type=search].valid, input[type=search]:focus.valid, textarea.materialize-textarea.valid, textarea.materialize-textarea:focus.valid {
   border-bottom: 1px solid #9FB6C1 !important;
   }
   input:not([type]):focus:not([readonly]), input[type="text"]:focus:not([readonly]), input[type="password"]:focus:not([readonly]), input[type="email"]:focus:not([readonly]), input[type="url"]:focus:not([readonly]), input[type="time"]:focus:not([readonly]), input[type="date"]:focus:not([readonly]), input[type="datetime"]:focus:not([readonly]), input[type="datetime-local"]:focus:not([readonly]), input[type="tel"]:focus:not([readonly]), input[type="number"]:focus:not([readonly]), input[type="search"]:focus:not([readonly]), textarea.materialize-textarea:focus:not([readonly]){
   border-bottom:1px solid #9FB6C1 !important;
   }
   #client_filter input:focus {
   border: none !important;
   }
   /* .pdfobject-container {
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
   } */
</style>
<a href="#"  id="disableMsg" style="visibility: hidden;"></a> 
<div class="content-wrapper bg_wrap">
   <div class="container-fluid">
      <!-- breadcrumb -->
      <label class="label-heading"><spring:message code="label.admin"/></label>
      <ol class="breadcrumb" id="admin_breadcrumb">
         <li><spring:message code="label.cat_home"/></li>
         <li class="active"><spring:message code="label.admin"/></li>
      </ol>
   </div>
   <!-- Main content -->
   <section class="container-fluid contentdoc">
      <div class="Content-wh-module">
         <div class="row">
            <div class="table_scroll">
               <div class="col-md-12 col-sm-12 col-xs-12  ">
                  <!-- Sarika UI Code -->
                  <button class="btn btn-primary pull-right" id="addClient"><spring:message code="label.add_client"/></button>
                  <span class="pull-right excelicon"><i class="fa fa-file-excel-o" id="btnExport" aria-hidden="true"></i></span>
                  <table id="client"
                     class="display table Data_table_heading table-striped table-bordered dataTable"
                     cellspacing="0" width="100%" style="font-size: 16px;">
                     <thead>
                        <tr>
                           <th style="width: 300px">
                              <spring:message code="label.client_code"/>
                           </th>
                           <th style="width: 300px">
                              <spring:message code="label.client_name"/>
                           </th>
                           <th style="width: 300px">
                              <spring:message code="label.address"/>
                           </th>
                           <th style="width: 300px">
                              <spring:message code="label.country"/>
                           </th>
                           <th style="width: 300px">
                              <spring:message code="label.city"/>
                           </th>
                           <th style="width: 130px;text-align: center;">
                              <spring:message code="label.out_actn"/>
                           </th>
                        </tr>
                     </thead>
                     <tfoot>
                        <tr>
                           <th style="width: 300px">
                              <spring:message code="label.client_code"/>
                           </th>
                           <th style="width: 300px">
                              <spring:message code="label.client_name"/>
                           </th>
                           <th style="width: 300px">
                              <spring:message code="label.address"/>
                           </th>
                           <th style="width: 300px">
                              <spring:message code="label.country"/>
                           </th>
                           <th style="width: 300px">
                              <spring:message code="label.city"/>
                           </th>
                           <th style="width: 300px">
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
                           <td id="editClient"></td>
                           <!-- <td id="editClient"><i class="fa fa-pencil"></i></td> -->
                        </tr>
                        <!-- <tr>
                           <td>001</td>
                           <td>Abc</td>
                           <td>Abc</td>
                           <td>India</td>
                           <td>Pune</td>
                           <td id="editClient"><i class="fa fa-pencil"></i>
                           <a href="javascript:void(0)" data-toggle="tooltip" title="Edit" onclick="getClientDetailsWithAdmin(1,'dsn001@mailinator.com');"><span class="faIconespan"><i data-toggle="modal" data-target="#addEditClientPopUp" class="fa fa-pencil"> </i></span></a>
                           </td>
                           </tr> -->
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
         <!-- sarika UI Code -->
         <div class="Message" id="addClientForm">
            <div class="alert alert-success"
               style="display: none; text-align: center; margin: 0px;"
               id="clientSuccessModelalert">
               <i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>
               <div id="clientSuccessMessage"></div>
               <a class="close" data-hide="alert" aria-label="close"
                  onclick="$(this).parent().hide();">&times;</a>
            </div>
            <div class="alert alert-danger fade in"
               style="display: none; text-align: center; margin: 0px;"
               id="clientFailureModelalert">
               <i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>
               <div id="clientFailureMessage"></div>
               <a class="close" data-hide="alert" aria-label="close"
                  onclick="$(this).parent().hide();">&times;</a>
            </div>
            <form class="formName" id="clientFormValidate" autocomplete="off">
               <div class="modal-header">
                  <!--  <button type="button" class="close" data-dismiss="modal" onclick="hidePopUp();">×</button> -->
                  <h4 class="model-title addClientClass" id="addClientTitle" style="display:none;">Add Client</h4>
                  <h4 class="model-title editClientClass" id="editClientTitle" style="display:none;">Edit Client</h4>
               </div>
               <div class="modal-body">
                  <div class="row">
                     <div class="col-md-4 col-sm-12 ">
                        <input type="hidden" id="clientDetailsId" value=""/>
                        <div class="inputfield">
                           <label for="clientName"><spring:message code="label.client_name"/> <span class="redstar1">*</span></label>
                           <input id="clientName" name="clientName"
                              type="text" placeholder="Enter Client Name" maxlength="50" />
                        </div>
                     </div>
                     <div class="col-md-4 col-sm-12 ">
                        <div class="inputfield">
                           <label for="sbPlansId"><spring:message code="label.plan_type"/> <span class="redstar1">*</span></label>
                           <!-- <input id="sbPlansId" name="sbPlansId" 
                              type="text" placeholder="Enterprice Plan" disabled/> -->
                           <div class="flag_select_css_profile">
                              <select id="sbPlansId" data-size="5" class="form-control" data-live-search="true" name="planType" tabindex="0" >
                                 <c:forEach items="${customPlansList}" var="plan" varStatus="i">
                                    <option id="customPlansList_${i.index}" value= <c:out value="${plan.id}"/>><c:out value="${plan.name}"/></option>
                                 </c:forEach>
                              </select>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-4 col-sm-12 ">
                        <div class="inputfield">
                           <label for="countryCode"><spring:message code="label.country_code"/></label>
                           <input id="countryCode" name="countryCode" type="text" maxlength="4"  
                              placeholder="Country Code" disabled />
                        </div>
                     </div>
                     <div class="col-md-4 col-sm-12 ">
                        <div class="inputfield">
                           <label for="country"><spring:message code="label.country"/></label><span class="redstar1">*</span>
                           <div class="flag_select_css_profile" id="adminCountry">
                              <select id="countryId" data-size="5" class="form-control" data-live-search="true" name="country">
                                 <option value="">--Select Country--</option>
                                 <c:forEach items="${countryList}" var="country" varStatus="i">
                                    <option id="countrySet_${i.index}" value="${country.countryId}"><c:out value=" ${country.countryName}"/><c:out value=" (+${country.phoneCode})"/></option>
                                 </c:forEach>
                              </select>
                           </div>
                           <!-- <span class="error">error</span> -->
                        </div>
                     </div>
                     <div class="col-md-4 col-sm-12 ">
                        <div class="inputfield">
                           <label for="phone"><spring:message code="label.state"/></label><span class="redstar1">*</span>
                           <div class="flag_select_css_profile">
                              <select class="form-control"  data-size="5" data-live-search="true"  id="stateId" name="state">
                                 <option value="">--Select State--</option>
                              </select>
                           </div>
                           <!-- <span class="error">Error</span> -->
                        </div>
                     </div>
                     <div class="col-md-4 col-sm-12 ">
                        <div class="inputfield">
                           <label for="phone"><spring:message code="label.city"/></label><!-- <span class="redstar1">*</span> -->
                           <div class="flag_select_css_profile">
                              <select class="form-control"  data-size="5" data-live-search="true"  id="cityId" name="city" >
                                 <option value="">--Select City--</option>
                              </select>
                           </div>
                           <!-- <span class="error">Error</span> -->
                        </div>
                     </div>
                     <div class="col-md-4 col-sm-12 ">
                        <div class="inputfield">
                           <label for="address"><spring:message code="label.address"/></label><span class="redstar1">*</span>
                           <input id="address" name="address" type="text" maxlength="70" placeholder="Enter Address">
                        </div>
                     </div>
                     <div class="col-md-4 col-sm-12 ">
                        <div class="inputfield">
                           <label for="zipcode"><spring:message code="label.zip"/></label><span class="redstar1">*</span>
                           <input id="zipcode" name="zipcode" type="text" maxlength="10" placeholder="Enter ZIP Code">	
                        </div>
                     </div>
                     <div class="col-md-4 col-sm-12 ">
                        <div class="inputfield">
                           <label for="contactNumber"><spring:message code="label.contactNumber"/><span class="redstar1">*</span></label>
                           <input id="contactNumber" name="contactNumber"type="text" maxlength="12"
                              placeholder="Enter Contact Number" /> 
                        </div>
                     </div>
                     <div class="col-md-4 col-sm-12 ">
                        <div class="inputfield" id="clientCodeDiv" style="display:none;">
                           <label for="clientCode"><spring:message code="label.client_code"/><span class="redstar1">*</span></label>
                           <input id="clientCode" name="clientCode"
                              type="text" placeholder="" disabled />
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-12">
                        <p><b><spring:message code="label.client_admin_det"/></b></p>
                     </div>
                     <div class="col-md-4 col-sm-12 ">
                        <div class="inputfield">
                           <label for="firstName"><spring:message code="label.login-fname"/> <span class="redstar1">*</span></label>
                           <input id="firstName" name="firstName"
                              type="text" placeholder="Enter First Name" maxlength="30" />
                        </div>
                     </div>
                     <div class="col-md-4 col-sm-12 ">
                        <div class="inputfield">
                           <label for="lastname"><spring:message code="label.login-lname"/> <span class="redstar1">*</span></label>
                           <input id="lastName" name="lastName"
                              type="text" placeholder="Enter Last Name" maxlength="30" />
                        </div>
                     </div>
                     <div class="col-md-4 col-sm-12 ">
                        <div class="inputfield">
                           <label for="email"><spring:message code="label.emailId"/> <span class="redstar1">*</span></label>
                           <input id="email" name="email"
                              type="email" placeholder="Enter Email" maxlength="70"/>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-12 text-right">
                        <button type="button" class="btn btn-light" onclick="hidePopUp();"><spring:message code="label.cancel"/></button>
                        <!-- Either Add or Edit button will be displayed based on which option user selects - Add Client / Edit -->
                        <button type="button" class="btn btn-blue submitInfo addClientClass" id="clientSubmit" onclick="saveClientDetailsWithAdmin()"><spring:message code="label.submit"/></button>
                        <button type="button" class="btn btn-blue edit_submitInfo editClientClass" id="edit_clientSubmit" onclick="updateClientDetailsWithAdmin()"><spring:message code="label.submit"/></button>
                     </div>
                  </div>
               </div>
            </form>
         </div>
         <%--  <div class="Message" id="editClientForm">	
            <form class="formName" id="edit_clientFormValidate" autocomplete="off">
              <div class="modal-header">
              <!-- <button type="button" class="close" data-dismiss="modal" onclick="hidePopUp();">×</button> -->
              	<h4 class="model-title">Edit Client</h4>
            </div>
            	<div class="modal-body">
             	<div class="row">
              	<div class="col-md-4 col-sm-12 ">	
            								<div class="inputfield">
            									<label for="clientname">Client Name <span class="redstar1">*</span></label>
            									<input id="edit_clientname" name="clientname"
            										type="text" placeholder="Client Name" maxlength="30" />
            								  
            								</div>
            								<div class="inputfield">
            									<label for="address">Address</label>
            									<input id="edit_address" name="address" type="text"placeholder="Enter Address">
            								
            								</div>
            								<div class="inputfield">
            									<label for="phone">City </label>
            									<div class="flag_select_css_profile" id="edit_adminCountry">
            								<select class="form-control" name="city" id="codes">
            								  <option value="A">A</option>
            								  <option value="B">B</option>
            								  <option value="C">C</option>
            								  <option value="D">D</option>
            								</select>
            								</div>	
            									<span class="error">Error</span>
            								</div>
            							</div>
            							<div class="col-md-4 col-sm-12 ">	
            								<div class="inputfield">
            									<label for="client_code">Client Code <span class="redstar1">*</span></label>
            									<input id="edit_client_code" name="client_code"
            										type="text" placeholder="001" disabled />
            								  
            								</div>
            								<div class="inputfield">
            									<label for="country">Country</label>
            								<div class="flag_select_css_profile" id="edit_adminCountry">
            								<select class="form-control" name="country" id="codes">
            								  <option value="A">A</option>
            								  <option value="B">B</option>
            								  <option value="C">C</option>
            								  <option value="D">D</option>
            								</select>
            								</div>	
            									<span class="error">error</span>
            								</div>
            								<div class="inputfield">
            									<label for="countryCode">Country Code</label>
            									<input id="edit_countryCode" name="countryCode" type="text"
            										placeholder="Enter Country Code" />
            								</div>
            							</div>
            							<div class="col-md-4 col-sm-12 ">	
            								<div class="inputfield">
            									<label for="plantype">Plan Type <span class="redstar1">*</span></label>
            									<input id="edit_plantype" name="plantype" 
            										type="text" placeholder="Enterprice Plan" disabled/>
            							
            								</div>
            								<div class="inputfield">
            									<label for="phone">State </label>
            									<div class="flag_select_css_profile" id="edit_adminCountry">
            								<select class="form-control" name="city" id="codes" name="state">
            								  <option value="A">A</option>
            								  <option value="B">B</option>
            								  <option value="C">C</option>
            								  <option value="D">D</option>
            								</select>
            								</div>	
            									<span class="error">Error</span>
            								</div>
            								<div class="inputfield">
            									<label for="zipcode">ZIP Code</label>
            									<input id="edit_zipcode" name="zipcode" type="text" maxlength="10" placeholder="Enter ZIP Code">
            									
            								</div>	
            							</div>
            							<div class="col-md-4 col-sm-12 ">
            							<div class="inputfield">
            									<label for="contactNumber">Contact Number<span class="redstar1">*</span></label>
            									<input id="edit_contactNumber" name="edit_contactNumber"type="text" maxlength="15"
            										placeholder="Enter Contact Number"	 
            								 />  
            								</div>
            							</div>
            		</div>
            		<div class="row">
            		<div class="col-md-12">
            		<p><b>Client Admin Details</b></p>
            		</div>
            		<div class="col-md-4 col-sm-12 ">
            		<div class="inputfield">
            									<label for="firstname">First Name <span class="redstar1">*</span></label>
            									<input id="edit_firstname" name="firstname"
            										type="text" placeholder="Enter First Name" maxlength="30" />
            								 <span class="error">This field is required.</span>
            			</div>
            		</div>
            		<div class="col-md-4 col-sm-12 ">
            		<div class="inputfield">
            									<label for="lastname">Last Name <span class="redstar1">*</span></label>
            									<input id="edit_lastName" name="lastname"
            										type="text" placeholder="Enter last Name" maxlength="30" />
            								 <span class="error">This field is required.</span>
            			</div>
            		</div>
            		<div class="col-md-4 col-sm-12 ">
            		<div class="inputfield">
            									<label for="email">Email <span class="redstar1">*</span></label>
            									<input id="edit_email" name="email"
            										type="email" placeholder="Abc@gmail.com" maxlength="70" disabled/>
            								
            			</div>
            		</div>
            		</div>					
            	
            	<div class="row">
            		<div class="col-md-12 text-right">	  
            			<button type="button" class="btn btn-light" onclick="hidePopUp();">Cancel</button>
            			<button type="button" class="btn btn-blue" id="edit_clienSubmit">Submit</button>
            			
            		</div>
            	</div>
            
            </div> 
            </form>	
            </div>  --%>
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
<div class="modal" id="exampleModal" role="dialog">
   <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content popup-model">
         <div class="heading2"><spring:message code="label.set_sign_doc_limit"/><span class="pull-right" data-dismiss="modal">X</span></div>
         <div class="row">
            <div>
               <div class="col-md-12">
                  <input id="limited" name="choice_1" class="with-gap"  type="radio"/>
                  <label for="limited" style="padding-left: 110px;line-height: 30px;" ><spring:message code="label.documents"/></label>
                  <input type="text" class="model-input" id="limitValue">
               </div>
            </div>
            <div class="col-md-12 p-15">		  	 
               <input id="unlimited" name="choice_1" class="with-gap"  type="radio" style="">
               <label for="unlimited"><spring:message code="label.unlimited"/></label>
            </div>
         </div>
         <div class="text-right" style="padding:10px 25px">
            <button class="btn btn-cancel mr-15" data-dismiss="modal"><spring:message code="label.terms.para85"/></button>
            <button class="btn btn-primary btn-width" data-dismiss="modal" onclick="changeLimit();"><spring:message code="label.ok"/></button> 
         </div>
      </div>
   </div>
</div>
<div class="modal" id="disableModal" role="dialog" data-backdrop="static">
   <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content popup-model">
         <div class="heading2"><spring:message code="label.disable_mfa"/></div>
         <div class="col-md-12 p-15">	
            <spring:message code="label.disable_mfa_user"/> <br><span id="userEmail" style="color: #00bc9c"></span>
         </div>
         <div class="text-right" style="padding:10px 25px">
            <button class="btn btn-cancel mr-15" data-dismiss="modal"><spring:message code="label.terms.para85"/></button>
            <button class="btn btn-primary btn-width" data-dismiss="modal" onclick="disableMFA();"><spring:message code="label.ok"/></button>
         </div>
      </div>
   </div>
</div>
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
   
   // Store the request for checking next time around
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
   
   
   var clientDetailsIdLoad = '';
   var stateIdOnLoad = '';
   var cityIdOnLoad = '';
   	  
   $(document).ready(function() {
   	$('select').change(function(){
           $(this).attr("size",1).css('z-index','1');
       });	
   			
   		  appUrl="<%=appUrl%>";
   		  token = $("meta[name='_csrf']").attr("content");
   		  header = $("meta[name='_csrf_header']").attr("content");				
   		  var role = "<c:out value="${role}"></c:out>";
   			if("ROLE_ADMIN"== role){
   				//$("#admindashboard").show();
   				$("#adminuser").show();
   				$("#drysignadminclient").show();
   			}
   		var table = $('#client').DataTable( {
   			 //   "processing": true,
   			    "serverSide": true,
   			 	"responsive":false,	//to make td clickable to expand set to false
   			    //"order": [[ 0, "desc" ]],		//sets default Assigned Date column in DESC order and also removes order icon from 0th column
   			    "ajax": $.fn.dataTable.pipeline({
   			    type : "GET",
   			    url : appUrl+"/app/admin/getClientDetails/",
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
   			     {"data": "clientCode"}, 
   			     
   			     {"data": "clientName"},
   			     
   			     {"data": "address"},
   			     
   			     {"data": "country"},
   			    
   			     {"data": "city"},
   			     {
   				        "orderable":      false,
   				        "data":           null,
   				      	"targets": 6,	     
   				         "render": function (data, type, row) {  					      
   				            
   				 		  	 var anchor="<a href='javascript:void(0)' id='editClient' onclick=getClientDetailsWithAdmin("+data.clientDetailsId+",'"+data.email+"')><span class='faIconespan'><i data-toggle='modal' data-target='#addEditClientPopUp' class='fa fa-pencil'></i></span></a>"
   				 			 return anchor;
   				            	
   							 
   				        }   
   				    }
   			     ]
   			   
   			 });	
   		clientColumnSearch(table);
   		
   		
   		
   	/////////////////////////////////////////////////////////////////	
   		
   	
   		/*search enteries datatable code*/
   /* 	var table = $('#client').DataTable();  
       // Event listener to the two range filtering inputs to redraw on input
       $('#min, #max').keyup( function() {
           table.draw();
       } ); */
       
   	$("#addClient").on('click',function(){
   		
   		$("#addClientForm").show();
   		$('.overlay-bg').show();
   		
   		$(".addClientClass").show();
   		$(".editClientClass").hide();
   		$("#clientCodeDiv").hide();		//hide clientCode
   		
   		$("#clientFailureModelalert").hide();
   		$("#clientSuccessModelalert").hide();
   		$("#clientSuccessMessage").val('');
   		$("#clientFailureMessage").val('');
   		
   		//clear form
   		//$("input:text").val("");
   		$('#clientFormValidate')[0].reset();
   		$("#clientFormValidate label.error").css("display","none");
   		$('input').removeClass("valid");
   		
   		$("#firstName").removeAttr('disabled');
   		$("#lastName").removeAttr('disabled');
   		$("#email").removeAttr('disabled');
   		stateIdOnLoad = '';
   		cityIdOnLoad = '';
   		$("#countryId").val("");
   		$("#stateId").val("");
   		$("#cityId").val("");
   		
   	
   		
   		
   		
   	})
   	
   	$("#editClient").on('click',function(){
   		
   		document.body.scrollTop = 0;
   		document.documentElement.scrollTop = 0;
   		$("#addClientForm").show();
   		$('.overlay-bg').show();
   		
   		$(".addClientClass").hide();
   		$(".editClientClass").show();
   		$("#clientCodeDiv").show();		//show clientCode
   		
   		$("#clientFailureModelalert").hide();
   		$("#clientSuccessModelalert").hide();
   		$("#clientSuccessMessage").val('');
   		$("#clientFailureMessage").val('');
   		
   		stateIdOnLoad = '';
   		cityIdOnLoad = '';
   	})
   		
   		
   		
   	 
   	} );
   
   	
   	function clientColumnSearch(table){
   		var i=1;
   		 $('#client tfoot th').each( function () {
   		    var title = $(this).text();
   		     //   console.log(title);
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
   		        });
   		    });
   
   	}
   	
   	
</script>
<script src= "//cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"> </script> 
<script>
   //$(document).ready(function() {
   	//alert("clientDetailsIdLoad:"+clientDetailsIdLoad+"----hidden:"+$('#clientDetailsId').val());
   
   	
   	/*Excel download code*/
   /* 	$('#client').DataTable({
           dom: 'Bfrtip',
           buttons: [{
               extend: 'excelHtml5',
               customize: function(xlsx) {
                   var sheet = xlsx.xl.worksheets['sheet1.xml'];
    
                   // Loop over the cells in column `C`
                   $('row c[r^="C"]', sheet).each( function () {
                       // Get the value
                       if ( $('is t', this).text() == 'New York' ) {
                           $(this).attr( 's', '20' );
                       }
                   });
               }
           }]
       }); */
   
   
   
   /* $("#edit_clienSubmit").on('click', function() {
   	var valid = $("#edit_clientFormValidate").valid();
   	if(valid == true){
   		$("#edit_clientFormValidate .error").css("display","block");
   	}
   })	 */	
   
   /* $("#edit_clientSubmit").on('click', function() {
   	var valid = $("#clientFormValidate").valid();
   	if(valid == true){
   		$("#clientFormValidate .error").css("display","block");
   	}
   })	 */
   
   /* 	$('#clientSubmit').on('click', function() {
   		var valid = $("#clientFormValidate").valid();
   		if(valid == true){
   			$("#clientFormValidate .error").css("display","block");
   		}	
   		
   		$(".addClientClass").show();
   		$(".editClientClass").hide();
   		$("#clientCodeDiv").hide();		//hide clientCode
   	})	 */
   	
   
   				
   //});
   
   function hidePopUp(){
   	$('.overlay-bg').hide();
   	$('.overlaywhite_bg').hide();
   	$("input:text").val("");
   	$("#addClientForm").hide();
   	//$("#editClientForm").hide();
   	$("#clientFormValidate label.error").css("display","none");
   	
   	$('input').removeClass("valid");
   	var statlist = document.getElementById("stateId");
   	statlist.options.length = 1;
       //return false;
       var citylist = document.getElementById("cityId");
   	citylist.options.length = 1;
       //return false;
   	//$('#stateId').empty();	
   	/* var table=$('#client').DataTable();
   	 table.search('').draw(); */
   	window.location.reload(true);
   
   	
   }
   $('#firstName').on('keypress', function (e) {
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
   $('#lastName').on('keypress', function (e) {
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
   $('#clientName').on('keypress', function (e) {
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
   /* $('#edit_firstname').on('keypress', function (e) {
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
   $('#edit_lastName').on('keypress', function (e) {g
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
   $('#edit_clientname').on('keypress', function (e) {
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
   	}, "<p>Empty Field not allowed</p>"); 
   $(function () {
       $("#btnExport").click(function () {
           $("#client").table2excel({
               filename: "Table.xls"
           });
       });
   }); */
   
   $(function () {
       $("#btnExport").click(function () {
       	
       	window.location.href = "<%=appUrl %>/app/client/exportExcelClient";
       	
           /* $("#client").table2excel({
               filename: "Table.xls"
           }); */
       });
   });
   
   $.validator.addMethod('customphone', function (value, element) {
   	 
   	 var valu2=value;
   	  valu2 = valu2.replace(/-/g, "");
          return this.optional(element) || /^(\+91-|\+91|0)?\d{10}$/.test(valu2);
      }, "<spring:message code="label.validmob_number"/>");
   
   $.validator.addClassRules('customphone', {
   	    customphone: true,
   	    required : true
   	});
   
   jQuery.validator.addMethod("zipcode", function(value, element) {
   	  return this.optional(element) || /^\d{5}(?:-\d{4})?$/.test(value);
   	}, "<spring:message code="label.validzip"/>");
   
   jQuery.validator.addMethod("checkempty", function(value) {
   	return $.trim( value );
   	}, "<spring:message code="label.emptyfld"/>"); 	
   
   
   		//<!--sarika UI Code-->
   
   
   		 	var clientFormValidate = $("#clientFormValidate")
   				.validate(
   						{
   							//specify the validation rules
   							rules : {
   								clientName : { 
   									//lettersonly: true,
   									required : true,
   									checkempty : true
   								},
   								address:{
   									required : true,
   									checkempty : true
   								},
   								/* city:{
   									required : true,
   									checkempty : true
   								}, */
   								/* clientCode:{
   									required : true,
   									checkempty : true
   								}, */
   								country:{
   									required : true,
   									checkempty : true
   								},
   								/* countryCode:{
   									required : true,
   									checkempty : true
   								}, */
   								planType:{
   									required : true,
   									checkempty : true
   								},
   								state:{
   									required : true,
   									checkempty : true
   								},
   								zipcode:{
   									required : true,
   									checkempty : true
   								},
   								contactNumber : {
   								    	required : true,	//not mandatory for exelaAuth
   								    	customphone: true,
   										minlength: 10,
   										
   									},
   								firstName : { 
   									//lettersonly: true,
   									required : true,
   									checkempty : true
   								},
   								lastName : { 
   									//lettersonly: true,
   									required : true,
   									checkempty : true
   								},	
   								email : {
   									required : true,
   									email : true,
   									emailcheck:true
   								}
   								
   							}
   						
   							
   						}); 
   		
   
   ////////////////////////////////////////////////////////
   $.validator.addMethod("emailcheck", function(value, element) {
           var re = /^(([^<>(){}[\]\\.,;:\s@\"]+(\.[^<>(){}[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
           return this.optional(element) || re.test(value);
       }, "<spring:message code="label.validEmail_msgrequired"/>");
   $('#contactNumber').keydown(function (e) {
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
   $.validator.addMethod('customphone', function (value, element) {
   	 
   	 var valu2=value;
   	  valu2 = valu2.replace(/-/g, "");
          return this.optional(element) || /^(\+91-|\+91|0)?\d{10}$/.test(valu2);
      }, "<spring:message code="label.validmob_number"/>");
   
   $.validator.addClassRules('customphone', {
   	    customphone: true,
   	    required : true
   	});
   	
   $("#countryId").change(function(event) {
   //	alert("countryId "+$("#countryId").val()+"---stateIdOnLoad:"+stateIdOnLoad);
   	//"This is (0) simple text".match(/\(([^)]+)\)/)[1]
   	var countryText = $("#countryId option:selected").text();
   	
   	var phoneCode= countryText.match(/\(([^)]+)\)/)[1];	//take value from inside () eg. (91) = 91
   	
   	if(phoneCode != "+")	{
   		$("#countryCode").val("");
   		$("#countryCode").val(phoneCode);
   	}else{
   		$("#countryCode").val("");
   	}
   	
   		
   	getStateSet();
   	getCitySet();
   	/* if($("#countryId").val() == "" && $("#countryId").val() == null) 
   	{
   		alert("hi");
   		var statlist = document.getElementById("stateId");
   		statlist.options.length = 1;
   	}  */
   	
   });
    
   
   						
   $("#stateId").change(function(event) {
   	getCitySet();
   });
   
   						
   						
   function getStateSet() {
   	var contextPath=$("#contextPath").val();
   	var token = $("meta[name='_csrf']").attr("content");
   	var header = $("meta[name='_csrf_header']").attr("content");
   	
   //	alert("countryId "+$("#countryId").val()+"---stateIdOnLoad:"+stateIdOnLoad);
   	//$("#stateId").val("");	//clear selected stateId for city
   	$("#cityId").val("");
   	$("#cityId option").remove();
   	
   
   	var stateOptions = "<option value=''>--Select State--</option>";	
   	if($("#countryId").val() != "") {
   		
   		///alert("inside state countryId: "+$("#countryId").val());		
   		var data = {
   	    	 "countryId" : $("#countryId").val()
   		}
   	    	      
   		$.ajax({
   			contentType : 'application/json; charset=utf-8',
   			type : "POST",
   			dataType : 'json',
   			data : JSON.stringify(data),
   			url: contextPath+"app/getStateListByAJAX",
   			beforeSend : function(xhr) {
   				xhr.setRequestHeader(header, token);
   			},
   			complete : function() {
   				///	alert
   			},
   			success: function (response) {
   			//	alert("response:"+response);
   			
   				stateOptions += response;
   				$("#stateId option").remove();
   				$("#stateId").append(stateOptions);
   				//$(".selectpicker").selectpicker('refresh');
   			//	alert(stateIdOnLoad+"-----1-inside state ajax-stateOptions:");
   				
   					
   			//below is for Edit. set stateid and call getCitySet() from here to use populated $("#stateId").val() to fetch city list and cityid
   				if(stateIdOnLoad != ''){
   					$("#stateId").val(stateIdOnLoad);
   					getCitySet();
   				
   				}
   				
   		  	},
   	  	    error: function() {
   	  	    	alert('<spring:message code="label.unable_retrive_state_list"/>');
   	  	    }
   		});
   	}else{
   		$("#stateId").val("");
   		$("#stateId option").remove();
   		$("#stateId").append(stateOptions);
   		getCitySet();
   	}
   	//$("#stateId").selectpicker('refresh');
   } 
   
   function getCitySet() {
   	
   	var contextPath=$("#contextPath").val();
   	var token = $("meta[name='_csrf']").attr("content");
   	var header = $("meta[name='_csrf_header']").attr("content");
   
   	var cityOptions = "<option value=''>--Select City--</option>";	
   	if($("#stateId").val() != "" && $("#stateId").val() != null) {
   		
   		var data = {
   	   		"stateId" : $("#stateId").val()
   		}
   	    	      
   		$.ajax({
   			contentType : 'application/json; charset=utf-8',
   			type : "POST",
   			dataType : 'json',
   			data : JSON.stringify(data),
   			url: contextPath+"app/getCityListByAJAX",
   			beforeSend : function(xhr) {
   				xhr.setRequestHeader(header, token);
   			},
   			complete : function() {
   				//alert
   			},
   			success: function (response) {
   				
   				cityOptions += response;
   				$("#cityId option").remove();
   				$("#cityId").append(cityOptions);
   				//$(".selectpicker").selectpicker('refresh');
   				
   				  $('#cityId').trigger("chosen:updated");
   					
   				if(cityIdOnLoad != '' ){
   				//	alert("inside cityIdOnLoad:"+cityIdOnLoad);
   					$("#cityId").val(cityIdOnLoad);
   				}
   		  	},
   	  	    error: function() {
   	  	    	alert('<spring:message code="label.unable_retrive_state_list"/>');
   	  	    }
   		});
   	}else{
   		$("#cityId").val("");
   		$("#cityId option").remove();
   		$("#cityId").append(cityOptions);
   	
   	}
   	//$("#stateId").selectpicker('refresh');
   } 
   
   
   function saveClientDetailsWithAdmin(){
   
   /* 	var con = $("#codes option:selected").val().split(" ");
   	con[0] = con[0].trim();  //vvv
   	var countryCodeVar = con[1].trim();  */
   //	var valid = $("#clientFormValidate").valid();
   	var countryCodeVar = "";//$("#hidden_CountryAbbr").val();
   	var con = $("#countryCode").val();
   	var phValue=$("#contactNumber").val();
   	phValue=phValue.replace(/-/g, "");
   //	var contct ="+"+con[0]+"-"+phValue;
   	//alert(contct);
   	var contct ="";
   	if(phValue !=""){
   		contct ="+"+con+"-"+phValue;
   	}
   	else{
   		contct ="";
   	}
   	
   	var token = $("meta[name='_csrf']").attr("content");
   	var header = $("meta[name='_csrf_header']").attr("content");
   	var contextPath=$("#contextPath").val();
   	
   	var valid = $("#clientFormValidate").valid();
   	
   	if(valid == true){
   		$("#clientFormValidate .error").css("display","block");
   		
   	var data = {
   				"clientName" : $("#clientName").val(),
   				"sbPlansId":$("#sbPlansId").val(), 
   				"address" :$("#address").val(),
   	    	    "countryCode" :$("#countryCode").val(),
   	    	    "contactNumber" :$("#contactNumber").val(),
   	    	    "zipCode" :$("#zipcode").val(),
   	    	    "countryId" :$("#countryId").val(),
   	    	    "stateId" :$("#stateId").val(),
   	    	    "cityId" :$("#cityId").val(),
   				"firstName" : $("#firstName").val(),		//firstname
   	    	    "lastName" :$("#lastName").val(),
   	    	    "email" : $("#email").val() 
       		}
   
   	//alert("contct "+contct+"--------------"+contextPath+"---header:"+header+"--------"+JSON.stringify(data));
   	
   		$.ajax({
   			contentType : 'application/json; charset=utf-8',
   			type : "POST",
   			url : contextPath+"app/admin/saveClientDetailsWithAdmin",
   			dataType : 'json',
   			crossDomain : true,
   			data : JSON.stringify(data),
   			beforeSend : function(xhr) {
   				xhr.setRequestHeader(header, token);
   				$('.submitInfo').buttonLoader('start');
   				
   				$("#clientSubmit").attr('disabled',true);	//disable Save btn
   				
   			},
   			success : function(response) {
   			
   				$("#clientSuccessMessage").val('');
   				$("#clientFailureMessage").val('');
   				
   				$("#clientSubmit").attr('disabled',true);	//disable Save btn
   				
   				if (response.msg == 1 || response.msg == "1") {
   					
   					$("#clientFailureModelalert").hide();
   					$("#clientSuccessModelalert").hide();	//hide success tab as showing success message in popup
   					$("#clientSuccessMessage").val('');
   					//$("#clientSuccessMessage").html("Client and Client Admin details added successfully.");
   					
   					$.confirm({
       	    	        title: '',
       	    	        content: '<spring:message code="label.client_admin_add_success"/>',
       	    	       buttons: {
       	    	            somethingElse: {
       	    	                text: 'OK',
       	    	                btnClass: 'btn-primary',
       	    	                action: function(){ 
       	    	                	hidePopUp();
                   				}
       	    	            }
       	    	        }
       	    	    });
   					
   					//var newClientDetailsId = response.newClientDetailsId;
   					
   					
   				}
   				else{
   					$("#clientSuccessModelalert").hide();
   					$("#clientFailureModelalert").show();
   					$("#clientFailureMessage").val('');
   					$("#clientFailureMessage").html(<c:out value="response.msg"></c:out>);
   					
   					$("#clientSubmit").removeAttr('disabled');		//if error Save btn should stay enabled
   				}
   				
   			},
   			complete : function() {
   				$('.submitInfo').buttonLoader('stop');
   			//	$("#clientSubmit").attr('disabled',true);
   				
   			},
   			error: function(xhr, textStatus, errorThrown)
   			 {
   				$.confirm({
      	    	        title: '',
      	    	        content: '<spring:message code="label.loading_error"/>',
      	    	       		 buttons: {
      	    	        	
      	    	            somethingElse: {
      	    	                text: 'OK',
      	    	                btnClass: 'btn-primary',
      	    	            }
      	    	        }
      	    	    });
   			 
   			 	//alert('<spring:message code="label.loading_error"/>');
   			 	return false;
   			}
   		})
   	}
   	
   
   }
   
   
   
   function getClientDetailsWithAdmin(clientDetailsId, userEmail){	
   	document.body.scrollTop = 0;
   	document.documentElement.scrollTop = 0;
   //	alert(clientDetailsId+"----"+userEmail+"---"+$("#countryId").val());
   	var contextPath=$("#contextPath").val();			
   	var token = $("meta[name='_csrf']").attr("content");			
   	var header = $("meta[name='_csrf_header']").attr("content");	
   				
   	
   	$("#addClientForm").show();
   	$('.overlay-bg').show();
   	
   	$(".addClientClass").hide();
   	$(".editClientClass").show();
   	$("#clientCodeDiv").show();		//show clientCode
   	
   	$("#clientFailureModelalert").hide();
   	$("#clientSuccessModelalert").hide();
   	$("#clientSuccessMessage").val('');
   	$("#clientFailureMessage").val('');
   	
   	stateIdOnLoad = '';
   	cityIdOnLoad = '';
   	
   	$("#clientSubmit").hide();		//show Update button
   	$("#edit_clientSubmit").show();	//hide Save button
   
   	
   	var data = {			
   			"clientDetailsId" : clientDetailsId,	
   			"email" :userEmail	
   	}	
   
   				
   	$.ajax({
   		contentType : 'application/json; charset=utf-8',
   		type : "POST",
   		url : contextPath+"app/admin/getClientDetailsWithAdmin",
   		dataType : 'json',
   		crossDomain : true,
   		data : JSON.stringify(data),
   		beforeSend : function(xhr) {		
   			xhr.setRequestHeader(header, token);	
   		},		
   		complete : function() {		
   			//$("#signupbtn").buttonLoader('stop');	
   		},		
   		success : function(response) {		
   			
   			if(response !=null && response != 'undefined'){	
   				//$("#firstName").val(response.firstName);
   				//$("#profileName").html(response.firstName+' '+response.lastname);
   				//$("#lastname").val(response.lastname);
   				
   				//$('#country option:selected').val("sanket")
   				//$("#country select").val("val2");
   				
   				
   				$("#clientDetailsId").val(response.clientDetailsId);
   				clientDetailsIdLoad=response.clientDetailsId;
   				
   				$("#clientName").val(response.clientName);
   				
   				
   			//	$("#clientCodeDiv").show();	//show clientCode
   				$("#clientCode").val(response.clientCode);
   				
   				$("#sbPlansId").val(response.sbPlansId);
   				$("#countryId").val(response.countryId);
   			
   				
   				$("#countryCode").val(response.countryCode);
   				$("#zipcode").val(response.zipCode);
   				$("#address").val(response.address);
   				$("#contactNumber").val(response.contactNumber);
   			
   			//get values for client admin but keep them in disabled state.
   				$("#firstName").val(response.firstName);
   				$("#lastName").val(response.lastName);
   				$("#email").val(response.email);
   				
   	     		$("#firstName").attr('disabled',true);
   				$("#lastName").attr('disabled',true);
   				$("#email").attr('disabled',true);
   				
   				
   				stateIdOnLoad = response.stateId;
   				cityIdOnLoad = response.cityId;
   				
   			//	alert($("#countryId").val()+"-----------stateIdOnLoad:"+stateIdOnLoad+"----cityIdOnLoad:"+cityIdOnLoad);
   				
   				if($("#countryId").val() != "") {
   					getStateSet();
   				}
   
   				/* if(stateIdOnLoad != "") {
   					//alert("call to getcity stateIdOnLoad: "+stateIdOnLoad+"---stateId:-"+$("#stateId").val());
   					//getCitySet();
   				} */
   				
   			}		
   				
   				
   		},		
   		error: function(xhr, textStatus, errorThrown)		
   		 {		
   				
   			$.confirm({	
   	    	        title: '',		
   	    	        content: '<spring:message code="label.loading_error"/>',		
   	    	       		 buttons: {
   	    	        		
   	    	            somethingElse: {		
   	    	                text: 'OK',		
   	    	                btnClass: 'btn-primary',		
   	    	            }		
   	    	        }		
   	    	    });		
   		 	//alert('<spring:message code="label.loading_error"/>');	
   		 	return false;	
   		}		
   	})	
   	
   	
   
   }				
   
   function updateClientDetailsWithAdmin(){
   
   		var valid = $("#clientFormValidate").valid();	
   		var token = $("meta[name='_csrf']").attr("content");
   		var header = $("meta[name='_csrf_header']").attr("content");
   		var contextPath=$("#contextPath").val();
   		
   		var clientDetailsId =  $("#clientDetailsId").val();
   		var email = $("#email").val();
   		//var valid = $("#clientFormValidate").valid();
   		//if(valid == true){
   		if(valid == true){
   		var data = {
   					"clientDetailsId" : $("#clientDetailsId").val(),
   					"clientName" : $("#clientName").val(),
   					 "clientCode" :$("#clientCode").val(),
   					"sbPlansId":$("#sbPlansId").val(), 
   					"address" :$("#address").val(),
   		    	    "countryCode" :$("#countryCode").val(),
   		    	    "contactNumber" :$("#contactNumber").val(),
   		    	    "zipCode" :$("#zipcode").val(),
   		    	    "countryId" :$("#countryId").val(),
   		    	    "stateId" :$("#stateId").val(),
   		    	    "cityId" :$("#cityId").val(),
   					"firstName" : $("#firstName").val(),		//firstname
   		    	    "lastName" :$("#lastName").val(),
   		    	    "email" : $("#email").val() 
   	    		}
   
   		//alert("contct "+contct+"--------------"+contextPath+"---header:"+header+"--------"+JSON.stringify(data));
   		
   			$.ajax({
   				contentType : 'application/json; charset=utf-8',
   				type : "POST",
   				url : contextPath+"app/admin/updateClientDetailsWithAdmin",
   				dataType : 'json',
   				crossDomain : true,
   				data : JSON.stringify(data),
   				beforeSend : function(xhr) {
   					//$("#loader2").show();
   					xhr.setRequestHeader(header, token);
   					$('.edit_submitInfo').buttonLoader('start');
   				},
   				complete : function() {
   					//$("#loader2").hide();
   					$(".edit_submitInfo").buttonLoader('stop');
   				},
   				success : function(response) {
   					//alert("response;"+response);
   					//getClientDetailsWithAdmin(clientDetailsId, userEmail);
   					
   					$("#clientSuccessMessage").val('');
   					$("#clientFailureMessage").val('');
   					
   					if(response=='success'){
   						
   						$("#clientFailureModelalert").hide();
   						$("#clientSuccessModelalert").show();
   						$("#clientSuccessMessage").val('');
   						$("#clientSuccessMessage").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i>'+'<spring:message code="label.clientDetails.success"/>');
   						
   					}
   					else{
   						$("#clientSuccessModelalert").hide();
   						$("#clientFailureModelalert").show();
   						$("#clientFailureMessage").val('');
   						$("#clientFailureMessage").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i>'+'<spring:message code="label.clientDetails.failure"/>');
   						
   					}
   					
   				},
   				error: function(xhr, textStatus, errorThrown)
   				 {
   					$.confirm({
   	   	    	        title: '',
   	   	    	        content: '<spring:message code="label.loading_error"/>',
   	   	    	       		 buttons: {
   	   	    	        	
   	   	    	            somethingElse: {
   	   	    	                text: 'OK',
   	   	    	                btnClass: 'btn-primary',
   	   	    	            }
   	   	    	        }
   	   	    	    });
   				 
   				 	//alert('<spring:message code="label.loading_error"/>');
   				 	return false;
   				}
   			})
   		}
   	}
   
</script>
<!-- /*Excel download code*/
   <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
   <script src="https://cdn.datatables.net/buttons/1.6.4/js/dataTables.buttons.min.js"></script>
   <script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.html5.min.js"></script>  -->