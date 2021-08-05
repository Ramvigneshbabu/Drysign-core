<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page import = "java.util.ResourceBundle" %>
<%@ page
	import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.core.Authentication"%>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	Registration registration = (Registration) auth.getPrincipal();
%>
<%
    ResourceBundle resource = ResourceBundle.getBundle("commonsutils");
    String freeTrialIndiaPlan =resource.getString("plan.freetrial.subscription");

	String port = request.getServerPort() + "";
	if (!port.equals(null) || !port.equals("")) {
		port = ":" + port;
	}
	String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>

<%
	if ("ROLE_ADMIN".equals(registration.getRole()) || "ROLE_CLIENT_ADMIN".equals(registration.getRole())) {
%>
<jsp:include page="admin-header.jsp"></jsp:include>
<%
	} else {
%>
<jsp:include page="header.jsp"></jsp:include>
<%
	}
%>
<%-- <link rel="stylesheet" href="<%=appUrl%>/css/style.css" /> 
<%-- <link rel="stylesheet" href="<%=appUrl%>/css/style.min.css" /> --%>
<%-- <link rel="stylesheet" href="<%=appUrl%>/css/inner_page.css" /> --%>
<link href="<%=appUrl%>/css/materialize.css" rel="stylesheet" />
<link class="jsbin" href="<%=appUrl%>/css/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<%-- <script class="jsbin" src="<%=appUrl %>/js/jquery.min.js"></script> --%>
<script class="jsbin" src="<%=appUrl%>/js/jquery-ui.min.js"></script>
<script src="<%=appUrl%>/js/contact/countryCodes.js"></script>

<meta charset=utf-8 />

<style>
.checkbox.checkbox-primary{
margin-left:0}
.checkbox input[type="checkbox"]:checked + label::after {
    font-family: 'FontAwesome';
    content: "\f00c";
}
.checkbox label::after {
    display: inline-block;
    position: absolute;
    width: 16px;
    height: 16px;
    left: 0;
    top: 0 !important;
    margin-left: -21px;
    padding-left: 5px;
    padding-top:4px;
    /*font-size: 11px;*/
    color: #FFF;
    margin-top:0px;
}
input[disabled]{
-webkit-text-fill-color: unset;
}
#removePhoto{
	line-height:1.2;
	cursor:pointer;
}
.user-info-avtar1{
margin-top:72px;
padding:0;
}
@media (max-width: 767px) {

.user-info-avtar1{
margin-top:0px;
text-align:center;}
}
@media (max-width: 991px) {
#removePhoto{
	line-height:1.2;
	display:inline-block;
	margin:0 auto;
}

}
/*Tips & Tricks Page*/
*,
*:before,
*:after {
    -webkit-box-sizing: border-box; 
    -moz-box-sizing: border-box; 
    box-sizing: border-box;
}

#trickslist {

    display: table;
}
/* #trickslist ul {
    padding: 0;
    margin: 20px 0;
    color: #555;
}*/
#trickslist ul > li {
    list-style: none;
    display: block;

    overflow: hidden;
   
} 
/* #trickslist ul:last-child {
    border-bottom: 1px solid #ddd;
}
#trickslist ul > li:hover {
    background: #efefef;
} */
.expand {
    display: block;
    text-decoration: none;
    color: #555;
    cursor: pointer;
}
.tipstricks {
    padding: 5px;
    margin: 0;
    font-size: 17px;
    font-weight: 400;
}
#left,#right{
    display: table;
}


.detail {
    margin: 10px 0 10px 20px;
    display: none;
    line-height: 22px;
   
}
.detail span{
    margin: 0;
}

.card-body{
padding-left:70px;}
.btn-link{
color:#1277D9 ;}

    .accordion .fa{
        margin-right: 0.5rem;
    }
  .btn-link.focus, .btn-link:focus, .btn-link:hover {
    color: #0b4a87 !important;
    text-decoration: none;
}
.radio:hover input ~.checkmark{
background-color:#fff !important;
}
.radio{
display:inline-block;
margin-top:5px;
margin-bottom:5px;}
#myTab li{
margin-bottom:0;}
#cancelSubErrorMsg{
cursor:default;
}
.input_profilecss{
  background-color: #fff;
  border-radius: 1rem;
  margin: 0 auto;
  max-width: 500px;
  padding:1rem 0;
  width: 100%;
}
[type="file"] {
  height: 0;
  overflow: hidden;
  width: 0;
}

[type="file"] + label {
 background: #1277d9 !important;
 border: none;
  border-radius: 5px;
  color: #fff;
  cursor: pointer;
  display: inline-block;
	font-family: 'Poppins', sans-serif;
	font-size: inherit;
  font-weight: 600;
  margin-bottom: 1rem;
  outline: none;
  padding:12px 20px;
  position: relative;
  transition: all 0.3s;
  vertical-align: middle;
  }
  [type="file"] + label:hover {
    background-color: #0b4a87 !important;
  }
.radio {
	position: relative;
}

input[type="radio"] {
	position: absolute;
	opacity: 0;
}

.checkmark {
	position: absolute;
	top: 2px;
	left: 0;
	height: 18px;
	width: 18px;
	border: 1px solid #cfd3d7;
	border-radius: 50%;
}

.radio:hover input ~.checkmark {
	background-color: #ccc;
}

.radio input:checked ~.checkmark {
	border: 2px solid$main;
}

.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

.radio input:checked ~.checkmark:after {
	display: block;
}

.radio .checkmark:after {
	top: 3px;
	left: 3px;
	width: 10px;
	height: 10px;
	border-radius: 50%;
	background: #40505b;
}

.radio label {
	color: #252525;
}

/*.wrapper {
    display: flex;
    justify-content: center;
    padding-top: 5em;
}*/
#picerror {
	margin:10px 10px 10px 22px;
}

.error {
	display: none;
}
.newdashboard .nav-tabs > li > a {
    color: #40505b !important;
    border-bottom:none !important;
}
@media (max-width:800px) {
.newdashboard .nav-tabs > li > a {
    color: #40505b !important;
    border-bottom: 1px solid #d1d1d1 !important;
}
.nav-tabs {
   border-bottom:none;
}
}
@media (max-width:678px) {
.nav-tabs {
    border-bottom:none;
}
#myTab li {
    padding: 5px 0;
}
}

input.secrete{
     /*  -webkit-text-security:disc; */
      font-size:15px;
      }
</style>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper bg_wrap newdashboard">
	<div class="container-fluid">
		<!-- breadcrumb -->
		<ol class="breadcrumb">
		<li class="Groupsignhead"><spring:message code="label.head_profile"/> |</li>
			<li><a href="<%=appUrl%>/app/dashboard"><spring:message
						code="label.cat_home" /></a></li>
			<li class="active"><spring:message code="label.head_profile" /></li>
		</ol>
	</div>

	<!-- Main content -->
	<div class="container-fluid">
		<div class="Content-wh-module">
			<div class="row">
				<div class="col-md-12 col-sm-12 profilepic-container">
					<div class="user-info ">
						<div class="col-lg-2 col-md-3 col-sm-4 col-xs-12">
							<div class="user-info-photo">

								<img style="width: 100%;" id="img"
									src="<c:out value="${mypic}"/>" class="img-responsive" />
							</div>
						</div>
						<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
							<div class="user-info-avtar col-lg-4 col-md-6 col-sm-6 col-xs-12">
								<spring:message code="label.profile_pic" />
								<div class="file-field input-field input_profilecss">
                                	<input type='file' accept="image/*" class="btn btn-primary update_info" name='fileName' id="inp" />  
									<label for="inp"><spring:message code="label.profile_upld"/></label>
              
                                </div>                       
                              </div>
                              <div class="user-info-avtar1 col-lg-4 col-md-4 col-sm-6 col-xs-12">
                              <div>
                               <button id="removePhoto" class="btn btn-link" style = "display:none;" onclick="removePhoto();"><spring:message code="label.removePhoto"/></button>
                              </div>
                              </div>	
                              </div>
                              	
                                        
                                </div>
                            </div>
    
				<div class="alert alert-danger col-md-3 col-sm-6" id="picerror"
					style="display: none">
					<i class="fa fa-times-circle errormessageicon" aria-hidden="true"></i>
				<%-- 	<spring:message code="label.img_file" /> --%>
					<spring:message code="label.img_file_size_error" />
					<a class="close" data-hide="alert" aria-label="close"
						onclick="$(this).parent().hide();">&times;</a>
				</div>
				<div class="container-fluid">
					<div class="Content-wh-module">
						<div class="responsiveTabs">
							<ul id="myTab" class="nav nav-tabs">
								<li class="active col-lg-3 col-md-6 col-xs-12" id="personalInformation"><a data-toggle="tab"
									href="#PersonalInformation"><spring:message code="label.pi" /></a></li>
								<li class="col-lg-3 col-md-6 col-xs-12" id="manageAccount" style="display:none"><a data-toggle="tab" href="#ManagedAccount"> <spring:message
											code="label.mngact" /></a></li>
								<li class="col-lg-3 col-md-6 col-xs-12" id="security"><a data-toggle="tab" href="#Security"> <spring:message code="label.security"/></a></li>
								<li class="col-lg-3 col-md-6 col-xs-12" id="PaymentMethod" style="display:none"><a data-toggle="tab" href="#paymentMethod"><spring:message code="label.paymentMethod"/></a></li>
							</ul>

							<div id="myTabContent" class="tab-content">
								<div id="PersonalInformation" class="tab-pane fade in active">
									<div class="Profile-info">
										<form id="profile-form">
											<div class="row personalinfodv">
												<div class="col-md-4 col-sm-12 basicinfodv">
													<div>
														<strong><spring:message code="label.bas_info" /></strong>
													</div>
													<div class="inputfield">
														<label for="firstname"><spring:message
																code="label.login-fname" /> <span class="redstar1">*</span></label>
														<input id="firstname" name="firstName"
															class="disabledCheckboxes" type="text"
															placeholder="<spring:message code="label.firstName"/>" maxlength="30" 
															value="<c:out value="<%=registration.getFirstName()%>"/>"
															disabled disabled /> <span class="error"><spring:message
																code="label.firstname_required" /></span>
													</div>

													<div class="inputfield">
														<label for="last_name"><spring:message
																code="label.login-lname" /> <span class="redstar1">*</span></label>
														<input id="lastname" name="lastname"
															class="disabledCheckboxes" type="text"
															placeholder="<spring:message code="label.lastName"/>"	maxlength="30" 
															value="<c:out value="<%=registration.getLastname()%>"/>"
															disabled /> <span class="error"><spring:message
																code="label.lastname_required" /></span>
													</div>
														
													
													
												</div>

												<div class="col-md-4 col-sm-12 basicinfodv">
													<div>
														<strong><spring:message code="label.add_det" />
														</strong>
													</div>
													<div class="inputfield">
														<label><spring:message code="label.country" /></label> <input
															id="country" name="country" class="disabledCheckboxes"
															type="text"  maxlength="30" placeholder="<spring:message code="label.country"/>" value="" disabled>
														<!-- <select onchange="print_state('state',this.selectedIndex);" id="country" class="" >
                                                            
                                                             <option value="" disabled selected>Select Country</option>
                                                            </select> -->
													</div>
													<div class="inputfield">
														<label for="State" class="disabledCheckboxes"><spring:message
																code="label.state" /></label>
														<!-- <input id="state" name="state" class="disabledCheckboxes" align="" type="text" value="" disabled /> -->
														<!--  <select name ="state" id ="state" class="disabledCheckboxes">
                                                              <option value="" disabled selected>Select State</option>
                                                              </select> -->

														<input id="state"  maxlength="30" name="state" class="disabledCheckboxes"
															type="text" placeholder="<spring:message code="label.state"/>" value="" disabled>
													</div>
												</div>
												<div class="col-md-4 col-sm-12 basicinfodv">
													<div class="thirddiv">&nbsp;</div>
													<div class="inputfield">
														<label for="street_address"><spring:message
																code="label.str_add" /></label> <input id="address"
															name="address" class="disabledCheckboxes" type="text"
															placeholder="<spring:message code="label.str_add"/>" value="" maxlength="70"  disabled>
													</div>
													<div class="inputfield">
														<label for="last_name"><spring:message
																code="label.zip" /></label> <input id="pincode" name="pincode"
															class="disabledCheckboxes" type="text" maxlength="10" placeholder="<spring:message code="label.zip"/>"
															value="" disabled />
													</div>
												</div>
												<div>
												<div class="col-md-4 col-sm-12 basicinfodv">
												<div class="inputfield">
														<label for="city"  class="disabledCheckboxes"><spring:message
																code="label.city" /></label> <input id="city" name="city"
															class="disabledCheckboxes" maxlength="30" type="text" value=""
															placeholder="<spring:message code="label.city"/>" disabled>
													</div>
													</div>
												<div class="col-md-8 col-sm-12 basicinfodv">
												<div class="inputfield">
														<label for="email"><spring:message
																code="label.login-email" /> <span class="redstar1">*</span></label>
														<input id="email" name="email" class="disabledCheckboxes"
															type="text" maxlength="70" value="" placeholder="<spring:message code="label.emailAddress"/>" disabled
															readonly>
													</div>
													</div>
												</div>
												<div class="col-md-12 col-sm-12">
													<div>
														<strong><spring:message code="label.cont_det" /></strong>
													</div>
													<!-- <div class="inputfield">
                                                                <label for="first_name" >Mobile Number </label>
                                                                 <input id="mobile" name="mobile" class="disabledCheckboxes" align="" type="text" value="" disabled />								
                                                            </div> -->


													<div class="inputfield">
														<div class="row">
															<div class="col-md-12">
																<label for="last_name"><spring:message
																		code="label.mobile_num" /><!-- <span class="redstar1">*</span> --></label>
															</div>
														</div>
														<div class="row">
															<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 arrow extpadding" id="noIndia" style="display: none">
																<div class="flag_select_css_profile">
																	<div class="img_parent">
																		<img id="imgflage" alt="Trulli">
																	</div>
																	<select id="codes"
																		class="form-control disabledCheckboxes pull-right"
																		disabled></select>
																</div>
																
															</div>
															<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 arrow extpadding" id="india" style="display: none;">
																<div class="flag_select_css_profile">
																	<div class="img_parent">
																		<img id="imgflageInd" alt="Trulli" src="https://restcountries.eu/data/ind.svg">
																	</div>
																	<span id="codesInd" style="margin-left:36pt">India (+91)</span>
																</div>
																
															</div>
															<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">

																	<!-- <input id="phone" name="phone"
																	class="disabledCheckboxes profielinput" type="text" placeholder="Phone Number"
																	value="" maxlength=12 disabled> -->
																	
																<input id="phone" name="phone"
																	class="disabledCheckboxes profielinput" type="text" placeholder="<spring:message code="label.mobileNum"/>"
																	value="" maxlength=12 disabled><!--  <span class="error"><spring:message code="label.phonenumber_required" /></span> -->

															</div>
														</div>
													</div>
												</div>
											</div>

											<div class="row">


												<div class="col-md-12 text-right">

													<a href="#" id="editprofile" class="btn btn-blue"><spring:message
															code="label.edit" /></a> <a href="#" id="cancelprofile"
														class="edit_ST btn btn-light" style="display: none"><spring:message
															code="label.cancel" /></a> <a href="#" id="saveprofile"
														style="display: none" onclick="saveProfile('${countryCode}');"
														class="edit_ST  btn btn-primary"><spring:message
															code="label.save" /></a>

													<!-- <button type="button" class="edit_button " value="edit_button">Edit</button>-->
												</div>
											</div>
										</form>
										<div class="alert alert-success"
											id="save_success" style="display: none; margin-top: 15px"></div>
										<div class="alert alert-danger fade in"
											id="save_failure" style="display: none; margin-top: 15px"></div>
											
									</div>
								</div>
								<div id="ManagedAccount" class="tab-pane fade in">
									<div id = "manageButton" class="file-field input-field btnmng_profilecss">
										<button type="button"
											class="btn update_info update_profilecss mngaccount_btn col-md-3 col-sm-4 col-xs-10"
											id="cancelSubscription">
											<spring:message code="label.cncl_subs" />
										</button>
										<button type="button" class="btn update_profilecss btn-blue col-md-3 col-sm-4 col-xs-10" onclick="deleteUser();">
											<spring:message code="label.dlt_accnt1" />
										</button>
										<br> <span id="cancelSubErrorMsg" style="color: red">
										</span>
									</div>
									<!-- secure code  -->
					<div>
<%-- 					<h3>Manage Secure Code</h3>
					
<label><input type="checkbox" id="checkMFAOtpMailId" value="checkMFAOtpMail" style="display:block;"/>Email OTP</label>
<br>
<label><input type="checkbox" id="checkMFASecureCodeId" value="checkMFASecureCode"  style="display:block;" />Secure Code</label>
<br>
  
  
	<div class="container">
    <div class="row" id="accordion1">
        <div id="trickslist">
            <ul>
                <li>
                    <a class="expand" data-parent="#accordion1">
                        
                        <div>
                            <h4 class="btn-link"><i class="fa fa-chevron-right" aria-hidden="true"></i>&nbsp;&nbsp;Setup/Change Secure Code</h4>
                        </div>
                    </a>
                    <div class="detail">
                    	<form id="otpsecure_code" method="get" class="digit-group" data-group-name="digits" data-autosubmit="false" autocomplete="off">
						<div class="inputfield">
							<label>Enter Secure code</label>
					          <!-- <input id="partitioned" type="text" maxlength="6" /> -->
					          <div>
								<input type="password" id="digit-1" name="digit-1" class="digit-VVV secrete" data-next="digit-2" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-2" name="digit-2" class="digit-VVV secrete" data-next="digit-3" maxlength="1" data-previous="digit-1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-3" name="digit-3" class="digit-VVV secrete" data-next="digit-4" maxlength="1" data-previous="digit-2" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								
								<input type="password" id="digit-4" name="digit-4" class="digit-VVV secrete" data-next="digit-5" maxlength="1" data-previous="digit-3" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-5" name="digit-5" class="digit-VVV secrete" data-next="digit-6" maxlength="1" data-previous="digit-4" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-6" name="digit-6" class="digit-VVV secrete" data-previous="digit-5" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
							</div>
							<input type="hidden" class="secureCodeVVV" id="secureCodeVVV" />
						</div>
						<div class="form-group" style="padding:0 3px;">
								<label id="securityCodeSignUpErr" style="display:none;color:#e10543">Please enter 6 digits</label>
						</div>	
						<div class="inputfields">
							<label>Confirm Secure Code</label>
					          <!-- <input id="partitioned" type="text" maxlength="6" /> -->
					          <div>
					           <!-- name="digit-1"name="digit-2"name="digit-3"name="digit-4"name="digit-5" name="digit-6"-->
								<input type="password" id="digit-1" name="digit-1" class="digit-confirmVVV secrete" data-next="digit-2" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-2" name="digit-2" class="digit-confirmVVV secrete" data-next="digit-3" maxlength="1" data-previous="digit-1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-3" name="digit-3" class="digit-confirmVVV secrete" data-next="digit-4" maxlength="1" data-previous="digit-2" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								
								<input type="password" id="digit-4" name="digit-4" class="digit-confirmVVV secrete" data-next="digit-5" maxlength="1" data-previous="digit-3" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-5" name="digit-5" class="digit-confirmVVV secrete" data-next="digit-6" maxlength="1" data-previous="digit-4" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-6" name="digit-6"class="digit-confirmVVV secrete"  data-previous="digit-5" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
							</div>
							<input type="hidden" class="confirmSecureCodeVVV" id="confirmSecureCodeVVV" />
						</div>
						<div class="form-group" style="padding:0 3px;">
							<label id="confirmSecurityCodeSignUpErr" style="display:none;color:#e10543"><spring:message code="label.securecode.error" /></label>
						</div>	

						<div class="row partitionbtn">
							<div class="text-center">
							<!-- <a href="#" class="btn btn-blue" onclick="updateMFA();">Update</a> -->
							 <button type="button" onclick="updateMFA();"
									class="btn btn-primary">Update</button>
							<button type="button" onclick="updateMFAOptions('checkMFASecureCodeId');"
									class="btn btn-primary">UpdateVVV</button>		
								<a href="#" id="cancelBtnMfa" class="btn btn-link">Cancel</a>
							</div>
						
						</div>
						</form>
                    </div>
                    <div class="alert alert-success" id="save_successMfa" style="display: none; margin-top: 15px"></div>
					 <div class="alert alert-danger fade in" id="save_failureMfa" style="display: none; margin-top: 15px"></div>
						
                </li>
                <li>
                	 <button type="button" id = "updateCardDetail" onclick="updateCardDetails();"class="btn btn-primary">Update Payment Method</button>
                </li>
            </ul>
        </div>
    </div>
</div>	 --%>	




	
	<div class="bs-example">
    
</div>
					</div>
								</div>
								<div id="Security" class="tab-pane fade in">
								<h3><spring:message code="label.multiFactorAuth"/></h3>
								<div class="col-md-12">
									<div class="col-md-4 row">
									 <div class="checkbox checkbox-primary"
					id="default_sign_check_upload_show">
					<input type="checkbox" class="checkbox2"
						id="chkEmailOTP" name="chkEmailOTP"><label
						for="chkEmailOTP" style="margin-top: 20px;"><spring:message code="label.emailOtp"/></label>
				</div>
									<!-- <label for="chkPassport">
									    <input type="checkbox" id="chkEmailOTP" />
									    Email OTP
									</label> -->
									<!-- <div class="form-group">
									<div class="radio">
										<label> <input type="radio" name="Multifactorradio"
											id="reasons1" value="2">
											&nbsp;Email OTP<span class="checkmark"></span>
										</label>
									</div>
								</div> -->
										
									</div>
									<div class="col-md-8 row">
									<div class="checkbox checkbox-primary"
					id="default_sign_check_upload_show">
					<input type="checkbox" class="checkbox2"
						id="chkSetupSecureCode" name="chkSetupSecureCode"><label
						for="chkSetupSecureCode" style="margin-top: 20px;"><spring:message code="label.setupSecureCode"/></label>
				</div>
									<!-- <div class="checkbox checkbox-primary"> 
                        <input type="checkbox" class="filled-in" id="chkSetupSecureCode" >
                        <label for="checkbox">Setup Secure Code</label>
                         </div>  --> 
										<!-- <label for="chkPassport">
									    <input type="checkbox" id="chkSetupSecureCode" />
									   Setup Secure Code
									</label> -->
										<div class="detail multifactor" id="multifactorSecureCode">
                    	<form id="otpsecure_code" method="get" class="digit-group" data-group-name="digits" data-autosubmit="false" autocomplete="off">
						<div class="inputfield">
							<label><spring:message code="label.enterSecureCode"/></label>
					          <!-- <input id="partitioned" type="text" maxlength="6" /> -->
					          <div>
								<input type="password" id="digit-1" name="digit-1" class="digit-VVV secrete" data-next="digit-2" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-2" name="digit-2" class="digit-VVV secrete" data-next="digit-3" maxlength="1" data-previous="digit-1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-3" name="digit-3" class="digit-VVV secrete" data-next="digit-4" maxlength="1" data-previous="digit-2" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								
								<input type="password" id="digit-4" name="digit-4" class="digit-VVV secrete" data-next="digit-5" maxlength="1" data-previous="digit-3" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-5" name="digit-5" class="digit-VVV secrete" data-next="digit-6" maxlength="1" data-previous="digit-4" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-6" name="digit-6" class="digit-VVV secrete" data-previous="digit-5" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
							</div>
							<input type="hidden" class="secureCodeVVV" id="secureCodeVVV" />
						</div>
						<div class="form-group" style="padding:0 3px;">
								<label id="securityCodeSignUpErr" style="display:none;color:#e10543"><spring:message code="label.enter6Digit"/></label>
						</div>	
						<div class="inputfields">
							<label><spring:message code="label.confirmSecureCode"/></label>
					          <!-- <input id="partitioned" type="text" maxlength="6" /> -->
					          <div>
					           <!-- name="digit-1"name="digit-2"name="digit-3"name="digit-4"name="digit-5" name="digit-6"-->
								<input type="password" id="digit-1" name="digit-1" class="digit-confirmVVV secrete" data-next="digit-2" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-2" name="digit-2" class="digit-confirmVVV secrete" data-next="digit-3" maxlength="1" data-previous="digit-1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-3" name="digit-3" class="digit-confirmVVV secrete" data-next="digit-4" maxlength="1" data-previous="digit-2" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								
								<input type="password" id="digit-4" name="digit-4" class="digit-confirmVVV secrete" data-next="digit-5" maxlength="1" data-previous="digit-3" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-5" name="digit-5" class="digit-confirmVVV secrete" data-next="digit-6" maxlength="1" data-previous="digit-4" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
								<input type="password" id="digit-6" name="digit-6"class="digit-confirmVVV secrete"  data-previous="digit-5" maxlength="1" onkeypress="return isNumber(event)" tabindex="1" pattern="\d*" inputmode="numeric"/>
							</div>
							<input type="hidden" class="confirmSecureCodeVVV" id="confirmSecureCodeVVV" />
						</div>
						<div class="form-group" style="padding:0 3px;">
							<label id="confirmSecurityCodeSignUpErr" style="display:none;color:#e10543"><spring:message code="label.securecode.error" /></label>
						</div>	

						<div class="row partitionbtn">
							<div class="text-right">
							<!-- <a href="#" class="btn btn-blue" onclick="updateMFA();">Update</a> -->
							<a href="#" id="cancelBtnMfa" class="btn btn-link"><spring:message code="label.cancel"/></a>
							<!--  <button type="button" onclick="updateMFA();"
									class="btn btn-primary">Update</button> -->
							<button type="button" onclick="updateMFAOptions('chkSetupSecureCode');" id="update_MFA"
									class="btn btn-primary"><spring:message code="label.update"/></button>	
							</div>
						
						</div>
						</form>
                    </div>	
									</div>
								</div>
							</div>
							<div id="paymentMethod" class="tab-pane fade in">
							<br/>
							<div class="col-md-12">
							<a href="#"  id = "updateCardDetail" onclick="updateCardDetails();"> <spring:message code="label.updatePaymentMethod"/></a>
							<!-- <button type="button" id = "updateCardDetail" onclick="updateCardDetails();"class="btn btn-primary">Update Payment Method</button> -->
							</div>
							</div>
							</div>
						</div>
					</div>
				
				
				</div>
			</div>
		</div>
	</div>

<div class="Message multifactor" id="emailOTPActivated">	
     <div class="modal-header text-center">
    <img src="<%=appUrl %>/images/message-bg.png"/>	
	   	<a class="close" href="#" onclick="hiderDonePopUp();">
	  		<button type="button" class="close" data-dismiss="modal"></button>
	  	</a>  
	  	
	  	 </div>
  	 <div class="modal-body text-center">  		
		 	<p><spring:message code="label.emailOtpActivate"/></p>		 
	  </div>
		 
	  <div class="text-right">	 
			<button type="button" class="btn btn-blue" onclick="hiderDonePopUp();"><spring:message code="label.ok"/></button>
	  </div> 	
 </div>
	

	
	
	
	 <div class="Message" id="DeleteSecureCode">	
   	
	 <div class="modal-header">
	 <h4 class="modal-title"><spring:message code="label.delete"/></h4>
	  	<!-- <a class="close" href="#"><span class="icon-close"></span></a> -->
	  </div>
		<div class="modal-body">	 	
		 	<p><spring:message code="label.areYouSureDelete"/></p>
		 </div>	
	  <div class="text-right">	  
		<button type="button" class="btn btn-link" onclick="hiderDocumentPopUp();"><spring:message code="label.cancel"/></button>
		<button type="button" class="btn btn-primary" ><spring:message code="label.out_confm"/></button>
		
	  </div> 	
 </div>

	<div id="DeleteAccountModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content modal-content1">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">?</button>
					<h5 class="modal-title"><spring:message code="label.deleteAccount"/></h5>
				</div>
				<div class="modal-body">
					<div class="row basicinfodv">
						<div
							class="inputfield col-md-6 col-sm-6 arrow_cardtype extpadding">
							<label for="last_name"><spring:message code="label.cardType"/></label> <select name="cardtype"
								id=cardtype>
								<!-- <option value="1">DEBIT</option> -->
								<option value="0"><spring:message code="label.credit"/></option>
							</select>

						</div>
						<div class="inputfield col-md-6 col-sm-6">
							<label for="last_name"><spring:message code="label.cardNumber"/></label> <input id="CardNumber"
								name="CardNumber" type="text"> <span class="error">
								<spring:message code="label.pleaseEnterCardNum"/></span>
						</div>
					</div>
					<div class="row basicinfodv">
						<div class="inputfield col-md-6 col-sm-6">
							<label for="last_name"><spring:message code="label.nameOfCard"/></label> <input
								id="NameOnCard" name="NameOnCard" type="text" placeholder="<spring:message code="label.abc"/>">
						</div>
						<div class="inputfield col-md-4 col-sm-4">
							<label for="last_name"><spring:message code="label.expireDate"/></label> <input id="ExpiryDate"
								name="ExpiryDate" type="text" placeholder="<spring:message code="label.mmyy"/>"> <span
								class="error"> <spring:message code="label.pleaseEnterExpiryDate"/></span>
						</div>
						<div class="inputfield col-md-2 col-sm-2">
							<label for="last_name"><spring:message code="label.cvv"/></label> <input id="Cvv" name="Cvv"
								type="password" value="12345">
						</div>
					</div>

					<div class="text-right">
						<button type="button" class="btn btn-blue"><spring:message code="label.submit"/></button>
					</div>
				</div>


			</div>
		</div>
	</div>



	<div id="loader2" class="loader2" style="display: none">
		<div class="loaderdiv">
			<p>
				<img src="<%=appUrl%>/images/drysign_logo_mono.svg">
			</p>
			<p>
				<img src="<%=appUrl%>/images/drysign-logo-line_only.gif">
			</p>
			<p>
				<spring:message code="label.wait" />
			</p>
		</div>
	</div>

</div>

</div>
</div>

<div class="Message" id="deleteaccountconfirm"
	style="width: 500px !important">
	<form action="" class="formName" id="form">
		<div class="modal-header">
			<span class="model-title"><spring:message code="label.resonDeleteAccount"/></span>

		</div>
		<div class="modal-body">
			<div class="deleteaccount">

				<div class="wrapper-inner">
					<div class="form-group">
						<p>
							<spring:message code="label.selectResonDeleteAccount"/><span
								class="redstar">*</span>
						</p>
						<div class="radio">
							<label> <input type="radio" name="radio-input" checked="checked"
								id="reasons2" value="I am not satisfied with the product">
								&nbsp;<spring:message code="label.notSatisfied"/> <span
								class="checkmark"></span>
							</label>
						</div>
						
						
					</div>
					<div class="form-group">
						<div class="radio">
							<label> <input type="radio" name="radio-input"
								id="reasons1" value="Not serving the purpose">
								&nbsp;<spring:message code="label.notServing"/> <span class="checkmark"></span>
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="radio">
							<label> <input type="radio" name="radio-input"
								id="reasons3" value="I found a better alternative">&nbsp;<spring:message code="label.betterAlternative"/>
								 <span class="checkmark"></span>
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="radio">
							<label> <input type="radio" name="radio-input"
								id="reasons4" value="Facing technical issues">&nbsp;<spring:message code="label.technicalIssue"/>
								 <span class="checkmark"></span>
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="radio">
							<label> <input type="radio" name="radio-input"
								id="reasons5" value="No more requirement">&nbsp;<spring:message code="label.noMoreRequirment"/>
								 <span class="checkmark"></span>
							</label>
						</div>
					</div>
					<div class="form-group">
						<div class="radio">
							<label> <input type="radio" name="radio-input"
								id="reasons6" value="Other specify">&nbsp;<spring:message code="label.otherSpecify"/>
								<span class="checkmark"></span>
							</label>
						</div>
					</div>

				</div>
				<p>
					<spring:message code="label.elaborate"/><span class="redstar">*</span>
				</p>
				<textarea id="message" onchange="$('#reasonMessage').hide()" name="message"
					class="form-control messagedelete"></textarea>
				<span id='reasonMessage' class="error" hidden = "hidden"><spring:message code="label.resonForDeleteAccount"/></span>
				<div>
					<div class="text-right">
						<button type="button" class="btn btn-light"
							onclick="hiderReassignPopUp();">
							<spring:message code="label.cancel" />
						</button>
						<button type="button" class="btn btn-blue" id=""
							onclick="deleteUserConfirmation();">
							<spring:message code="label.out_confm" />
						</button>

					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<div class="overlay-bg"></div>


<a href="#" id="disableMsg" style="visibility: hidden;"></a>
<a href="#" id="sessionLogOut" style="visibility: hidden;"></a>
<jsp:include page="footer.jsp"></jsp:include>
<!-- Validation -->


<script src="<%=appUrl%>/js/materialize.js"></script>
<script type="text/javascript" src="<%=appUrl%>/js/countries.js"></script>
<script type="text/javascript" src="<%=appUrl%>/js/Base64.js"></script>


<script>
function hiderDonePopUp(){
	$('.overlay-bg').hide();
	$("#emailOTPActivated").hide();
	$('.overlaywhite_bg').hide();
	//$('#chkEmailOTP').prop('checked', false);
	
	//after sendDiscardConfirm() on click of Done refresh by calling getOutForSignatureData()				
}
$(function () {
    $("#chkEmailOTP").click(function () {
    /* 	$('#chkSetupSecureCode').removeAttr('checked');
        if ($(this).is(":checked")) {
            $("#emailOTPActivated").show();
            $('.overlay-bg').show();
            $('.overlaywhite_bg').show();
        } else {
            $("#emailOTPActivated").hide();
            
        } */
        
        var checked = $(this).is(':checked');
	   // alert("checked"+checked);
	    //if checked or unchecked call saveProfile to add/remove the otp mfa option
	    updateMFAOptions(this.id);
    });
    $("#chkSetupSecureCode").click(function () {
        var checked = $(this).is(':checked');
	  //  alert("checkMFASecureCodeId "+checked);
	    
    	
    //	$('#chkEmailOTP').removeAttr('checked');
        if ($(this).is(":checked") ) {
            $("#multifactorSecureCode").show();
        } else {
            $("#multifactorSecureCode").hide();
            $('#otpsecure_code')[0].reset();
            updateMFAOptions(this.id);  //call from here only if user unchecks the checkbox for secure code 
            
           // $('#chkSetupSecureCode').attr('checked', false);
            $('#otpsecure_code')[0].reset();
            
            //Changes for defect 1488
            $("#confirmSecurityCodeSignUpErr").css("display","none");
            $("#securityCodeSignUpErr").css("display","none");
            // Changes End
            
            /*   $("#save_failureMfa").css("display","none");
            $("#confirmSecurityCodeSignUpErr").css("display","none");
            $("#securityCodeSignUpErr").css("display","none");
            $("#secureCodeVVV").val("");
            $("#confirmSecureCodeVVV").val("");
            $("#save_successMFA").css("display","none"); */
            
        }  
        

	   
    });
});
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

//vvv set securecode in a hidden field
$(document).on("change", ".digit-VVV", function() {
	    var code="";
	    $(".digit-VVV").each(function(){		     
	        code+=$(this).val();
	    });		   		    
	    $("#secureCodeVVV").val(code);
	    
});

$(document).on("change", ".digit-confirmVVV", function() {
	    var codeStr="";
	    $(".digit-confirmVVV").each(function(){		     
	    	codeStr+=$(this).val();
	    });		   		    
	    $("#confirmSecureCodeVVV").val(codeStr);
	   	    
});
/////////////////////////////////////////////////////// 

$('.digit-group').find('input').each(function() {
	$(this).attr('maxlength', 1);
	$(this).on('keyup', function(e) {
		var parent = $($(this).parent());
		
		if(e.keyCode === 8 || e.keyCode === 37) {
			var prev = parent.find('input#' + $(this).data('previous'));
			
			if(prev.length) {
				$(prev).select();
			}
		} //else if((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 65 && e.keyCode <= 90) || (e.keyCode >= 96 && e.keyCode <= 105) || e.keyCode === 39) {
		else if((e.keyCode>31 && e.keyCode < 48 && e.keyCode > 57) || (e.keyCode >= 96 && e.keyCode <= 105) || e.keyCode === 39) {
					
			var next = parent.find('input#' + $(this).data('next'));
			
			if(next.length) {
				$(next).select();
			} else {
				if(parent.data('autosubmit')) {
					parent.submit();
				}
			}
		}
	});
});

function hiderDocumentPopUp(){
	$('#DeleteSecureCode').hide();
	$('.overlay-bg').hide();
	
}
  $(document).ready(function(){
	/*   $("input[name$='Multifactorradio']").click(function() {
	        var test = $(this).val();

	        $("div.multifactor").hide();
	        $("#Multifactorradio" + test).show();
	    }); */
	  $('input').keyup(function(){
	        if($(this).val().length==$(this).attr("maxlength")){
	            $(this).next().focus();
	        }
	    });
	/*vvvNOT IN USE  $("#DeleteSecureCode_btn").click(function(){
		 document.body.scrollTop = 0;
		 document.documentElement.scrollTop = 0;
		 $('.overlay-bg').show();
			$('#DeleteSecureCode').show();
	 }) */
	 
	 
    // Add minus icon for collapse element which is open by default
    $(".collapse.show").each(function(){
    	$(this).prev(".card-header").find(".fa").addClass("fa-chevron-down").removeClass("fa-chevron-right");
    });
    
    // Toggle plus minus icon on show hide of collapse element
    $(".collapse").on('show.bs.collapse', function(){
    	$(this).prev(".card-header").find(".fa").removeClass("fa-chevron-down").addClass("fa-chevron-right");
    }).on('hide.bs.collapse', function(){
    	$(this).prev(".card-header").find(".fa").removeClass("fa-chevron-down").addClass("fa-chevron-right");
    });
});

var mypic="<c:out value="${mypic}"></c:out>";
var role="<c:out value="${role}"></c:out>";
var appUrl="<%=appUrl%>";

var mfaOtpMailFlag="<c:out value="${mfaOtpMailFlag}"></c:out>";
var mfaSecureCodeFlag="<c:out value="${mfaSecureCodeFlag}"></c:out>";

$(document).ready (function(){

	//vvv18dec
	if(mfaOtpMailFlag == "true"){
		$("#chkEmailOTP").prop( "checked", true);
	}else{
		$("#chkEmailOTP").prop( "checked", false);
	}
	
	if(mfaSecureCodeFlag == "true"){
		$("#chkSetupSecureCode").prop( "checked", true);
		$("#multifactorSecureCode").show();
		
	}else{
		$("#chkSetupSecureCode").prop( "checked", false);
		  $("#multifactorSecureCode").hide();
	}
	/////////////////
	
	if(mypic==''){
		$("#img").attr('src',appUrl+'/images/user.png');
	}else{
		$("#removePhoto").css("display","block");
	}
	
	  if(role == "ROLE_CLIENT_ADMIN"){
			$("#clientadmin").show();
			$("#clientadmin").addClass("active");		
		} 
	 if(role == "ROLE_ADMIN"){
			 $("#adminuser").show();
			 $("#drysignadminclient").show();
		}
	
	// $(".Content-wh-module").css({ minHeight: $(window).innerHeight() - '150' });
	  $(window).resize(function() {
	  //  $(".Content-wh-module").css({ minHeight: $(window).innerHeight() - '150' });
	  });
	  
	  //$(".profilepic-container").css({ minHeight: $(window).innerHeight() - '150' });
	  $(window).resize(function() {
	    //$(".profilepic-container").css({ minHeight: $(window).innerHeight() - '150' });
	  });
		
	  var btnShow = "${enableMFA}";
	   if(btnShow == "disabled"){
		   $('#enableMFA').hide();
		   $('#disableMFA').show();
	   }else{
		   $('#enableMFA').show();
		   $('#disableMFA').hide();
	   }
	


//print_country("country");
Materialize.updateTextFields();    

	//$('select').material_select();
	$('#country').prop('disabled', true);
	$('#cancelprofile').hide();
	$('#saveprofile').hide();
	$('#editprofile').click (function(){
		$('#editprofile').hide();
		$('#saveprofile').show();
		$('#cancelprofile').show();
		$('.disabledCheckboxes').prop("disabled", false);
		
		//$('.select-dropdown').prop("disabled", false);	
	});
	
	
	$('#enableMFA').click (function() {
		var qrCode = getQRCode()
		$('#qrCodeChart').html(qrCode);
	});

	$('#disableMFA').click (function() {
		$("#disableMsg").trigger("click");
	});
	
	
	
	function getQRCode(){
		   var xhttpVerify = new XMLHttpRequest();
		   
		   xhttpVerify.open("GET", "<%=appUrl%>/app/qrcode", true);
		   xhttpVerify.send();
	  	   xhttpVerify.onreadystatechange = function(res) {
		 	        if (this.readyState == 4 && this.status == 200) {	
		 	        	//var res = JSON.stringify(xhttpVerify.response);
		 	        	var jsonResponse = JSON.parse(xhttpVerify.responseText);
		 	        	document.getElementById("<c:out value="qrCodeChart"/>").innerHTML = jsonResponse.map.qr_svg;
		 	        	 document.getElementById("mfa-token").focus();
		 	        }
		 	        	if (this.readyState == 4 && this.status == 500) {
		 	       		document.getElementById("Error").innerHTML = "Error.";
		 	       	 }
		 	        } 
	 			}

	
$('.disabledCheckboxes').prop("disabled", true);
$('.select-dropdown').prop("disabled", true);

$('#cancelprofile').click(function(){
	//profileForm.resetForm();
	//getProfile();
	profileForm.resetForm();
	$('#profile-form')[0].reset();
	getProfile();
	$('#editprofile').show();
	$('#saveprofile').hide();
	$('#cancelprofile').hide();
	$('.disabledCheckboxes').prop("disabled", true);
	$('.select-dropdown').prop("disabled", true);
});

document.getElementById("inp").addEventListener("change", readFile);

function readFile() {
	  
	  if (this.files && this.files[0]) {
		  var file = this.files[0];
			var fileType = file["type"];

		var ValidImageTypes = ["image/gif", "image/jpeg", "image/png"];
		//file size upto 5mb = 5245329
		if (file["size"] <= 2097152 && $.inArray(fileType, ValidImageTypes) > 0) {
			  
	    
	    var FR= new FileReader();
	    
	    FR.addEventListener("load", function(e) {
	      document.getElementById("img").src       = e.target.result;
	      document.getElementById("imgHeader").src       = e.target.result;
	      $("#removePhoto").css("display","block");
	      var dataURL=e.target.result;
	      var contextPath=$("#contextPath").val();
	      var token = $("meta[name='_csrf']").attr("content");
		  var header = $("meta[name='_csrf_header']").attr("content");
		  var data = {
		   			 "dataURL" : dataURL
		   		}
		        $.ajax({
		        	type: 'POST',
		        	url: contextPath+'app/picupload',
		            dataType: 'json',
		    	    contentType: "application/json; charset=utf-8",
		    	    data: JSON.stringify(data),
		            beforeSend : function(xhr) {
		    			xhr.setRequestHeader(header, token);
		    			$("#loader2").show();
     	   			},
     	   			complete: function () {
     	   		 		setTimeout(function(){ $("#loader2").hide(); }, 1000);
     	 			},
		            success: function(data){
		            	var x = document.getElementById('picerror');
						 x.style.display = 'none';
		              
		            },
		            error: function(err){
		             //   alert(err);
		          
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
		   });
		  
	     // document.getElementById("b64").innerHTML = e.target.result;
	    }); 
	    
	    FR.readAsDataURL( this.files[0] );
	  }
			else{
				 var x = document.getElementById('picerror');
				 x.style.display = 'block';
			}
	  }
	  
	}


function getpic(){
	
	 $.ajax({
     	type: 'POST',
     	url: contextPath+'app/getpic',
         dataType: 'json',
 	    contentType: "application/json; charset=utf-8",
 	    data: JSON.stringify(data),
         beforeSend : function(xhr) {
 			xhr.setRequestHeader(header, token);
 		},
         success: function(data){
           //  alert(data);
           getpic();
         },
         error: function(err){
             alert(err);
         }
});
	
}

})


	$("#security").click(function(){
		$('#otpsecure_code')[0].reset();
		
		$("#confirmSecurityCodeSignUpErr").css("display","none");
		$("#securityCodeSignUpErr").css("display","none");
		$("#secureCodeVVV").val("");
		$("#confirmSecureCodeVVV").val("");
		
	//	alert(mfaOtpMailFlag+"----security---"+mfaSecureCodeFlag);
		//vvv18dec
		if(mfaOtpMailFlag == "true"){
			$("#chkEmailOTP").prop( "checked", true);
		}else{
			$("#chkEmailOTP").prop( "checked", false);
		}
		
		if(mfaSecureCodeFlag == "true"){
			$("#chkSetupSecureCode").prop( "checked", true);
			$("#multifactorSecureCode").show();
			
		}else{
			$("#chkSetupSecureCode").prop( "checked", false);
			  $("#multifactorSecureCode").hide();
		}
	});
	
</script>

<script src="<%=appUrl%>/js/jquery.validate.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/additional-methods.min.js"></script>
<input type ="hidden" id="freeTrialCount" value=""/>
<input type ="hidden" id="isfreeTrial" value=""/>
<input type ="hidden" id="planName" value=""/>

<script src="<%=appUrl %>/js/config.js"></script>
<script>
$(".expand").on("click", function () {
    $(".right-arrow").text("+");
    $(".detail:visible").slideUp();
    if(!$(this).next().is(":visible")){

        $(this).next().slideDown();
        $(this).find(".right-arrow").text("-");
    }
    
    $('#otpsecure_code')[0].reset();
    $("#save_failureMfa").css("display","none");
    $("#confirmSecurityCodeSignUpErr").css("display","none");
    $("#securityCodeSignUpErr").css("display","none");
    $("#secureCodeVVV").val("");
    $("#confirmSecureCodeVVV").val("");
    $("#save_successMFA").css("display","none");

});
 var isHide = true;
 var isDisable = false;
	$( document ).ready(function() {
		<%-- value="<c:out value="<%=registration.getGoogleRegFlag()%>"/>"
		alert("Google Flag::"+"<%=registration.getGoogleRegFlag()%>");
		var gFlag='${registration.getGoogleRegFlag()}'; --%>
		<%
		if ("Y".equals(registration.getGoogleRegFlag())) {
	    %>
		$("#security").hide();
	    <%
		} else {
	    %>
	    $("#security").show();
	    <%
		}
	    %>
		/* $("#forgotSecureCode_form").hide();
		if(gFlag=="Y"){
			$("#security").hide();
		}
		else{
			$("#security").show();
		} */
		getProfile();
	});
	
	function getProfile(){
		var contextPath=$("#contextPath").val();
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var role="<c:out value="${role}"></c:out>";
		$.ajax({
			type : "GET",
			url : contextPath+"app/getProfile",
			beforeSend : function(xhr) {
				//$('#signupbtn').buttonLoader('start');
				xhr.setRequestHeader(header, token);
			},
			complete : function() {
				//$("#signupbtn").buttonLoader('stop');
			},
			success : function(response) {
				//alert(response.freeTrialCount);
				if(response !=null && response != 'undefined'){
					//$("#firstName").val(response.firstName);
					//$("#profileName").html(response.firstName+' '+response.lastname);
					//$("#lastname").val(response.lastname);
					$("#email").val(response.email);
					//$('#country option:selected').val("sanket")
					//$("#country select").val("val2");
					$("#country").val(response.country);
					$("#state").val(response.state);
					$("#pincode").val(response.pincode);
					$("#city").val(response.city);
					$("#address").val(response.address);
					$("#mobile").val(response.mobile);
					$("#freeTrialCount").val(response.freeTrialCount);
					$("#isfreeTrial").val(response.isFreeTrial);
					$("#planName").val(response.planName);
					
					//vvv16june2020 dialCodeNo(response.phone);
					
					if(response.countryCode !='IN' && (response.clientDetailsId_FK == null || response.clientDetailsId_FK == 0) && role == "ROLE_USER" && $("#isfreeTrial").val() != 48 && !drySignConfiguration.corperatEmailList.includes(response.email.replace(/.*@/, ""))){
						//$("#manageButton").hide();
						$("#manageAccount").show();
						//$("#updateCardDetail").hide();
						$("#PaymentMethod").show();
					}
					//hiding updateCardDetail button for free trial user and domain user
					 if($("#isfreeTrial").val() == 48 || drySignConfiguration.corperatEmailList.includes(response.email.replace(/.*@/, "")) || response.countryCode =='IN'){
						
						//$("#updateCardDetail").hide();
						//$("#PaymentMethod").hide();
						$("#manageAccount").show();
					} 
					dialCodeNo(response.phone, response.countryCode);		//vvv pass countryCode to avoid country name and flag mistmatch issue
					
					if(response.countryCode =='IN'){
						$("#india").show();
					}else{
						$("#noIndia").show();
					}
					//Changes done to resolve DrySign:1695 issue :for India user with free trial plan hidden the Manage account tab
					if(response.countryCode =='IN' && $("#planName").val() == "<%= freeTrialIndiaPlan %>"){
						
					//if(response.countryCode =='IN' && ($("#isfreeTrial").val() == 60 || $("#isfreeTrial").val() == 65 || $("#isfreeTrial").val() == 53)){
						//$("#isfreeTrial").val() == 60 //QA free trial plan id 60
						//$("#isfreeTrial").val() == 60 //UAT free trial plan id 65 
						//$("#isfreeTrial").val() == 60 //Prod free trial plan id 53
						
						$("#manageAccount").hide();
					}
				}
				
				if( $("#freeTrialCount").val() < 1 && !drySignConfiguration.corperatEmailList.includes(response.email.replace(/.*@/, "")) && $("#isfreeTrial").val() != 48 && activeSub == "true"){
					 isHide = false;
					 isDisable = true;
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
	//validation for firstname and lastname with UTF-8 field 9-7-2020
	
				$(function(){

	  /*  $( "#firstname" ).bind( 'paste',function()
	   {
		   var regex = new RegExp("[^\\w-_. ]");
	      	 var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	      		    if (regex.test(key)) {
	      		       event.preventDefault();
	      		       return false;
	      		    }

	    }); */
	    $( "#firstName" ).bind( 'paste',function()
				   {
				       setTimeout(function()
				       { 
				          //get the value of the input text
				          var data= $( '#firstName' ).val() ;
				          //replace the special characters to '' 
				          var dataFull = data.replace(/[^\w\s]/gi, '');
				          //set the new value of the input text without special characters
				          $( '#firstName' ).val(dataFull);
				       });

				    });
	  /*  $( "#lastname" ).bind( 'paste',function(){
		   var regex = new RegExp("[^\\w-_. ]");
	      	 var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	      		    if (regex.test(key)) {
	      		       event.preventDefault();
	      		       return false;
			      		    }

			    }); */
	    $( "#lastname" ).bind( 'paste',function()
				   {
				       setTimeout(function()
				       { 
				          //get the value of the input text
				          var data= $( '#lastname' ).val() ;
				          //replace the special characters to '' 
				          var dataFull = data.replace(/[^\w\s]/gi, '');
				          //set the new value of the input text without special characters
				          $( '#lastname' ).val(dataFull);
				       });

				    });
	}); 
	$('#firstname').on('keypress', function (e) {
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
	    if (keychar =="!" || keychar =="@" || keychar =="#" || keychar =="$" || keychar =="%" || keychar =="^" || keychar =="&" || keychar =="*" || keychar =="(" || keychar ==")" || keychar =="+" || keychar =="=" || keychar =="/" || keychar =="~" || keychar =="<" || keychar ==">" || keychar =="," || keychar ==";" || keychar ==":" || keychar =="|" || keychar =="?" || keychar =="{" || keychar =="}" || keychar =="[" || keychar =="]" || keychar =="?" || keychar =="?" || keychar =='"' || keychar =="\\") {	
	    	e.preventDefault();
	    	return false;
	    } else {
	        return true;
	    }
	});
	
			$('#lastname').on('keypress', function (e) {
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
			    if (keychar =="!" || keychar =="@" || keychar =="#" || keychar =="$" || keychar =="%" || keychar =="^" || keychar =="&" || keychar =="*" || keychar =="(" || keychar ==")" || keychar =="+" || keychar =="=" || keychar =="/" || keychar =="~" || keychar =="<" || keychar ==">" || keychar =="," || keychar ==";" || keychar ==":" || keychar =="|" || keychar =="?" || keychar =="{" || keychar =="}" || keychar =="[" || keychar =="]" || keychar =="?" || keychar =="?" || keychar =='"' || keychar =="\\") {	
			    	e.preventDefault();
			    	return false;
			    } else {
			        return true;
			    }
			}); 
	
	 $.validator.addMethod('mobilephone', function (value, element) {

	        return this.optional(element) || /^(\+91-|\+91|0)?\d{10}$/.test(value);
	    }, "<spring:message code="label.validmob_number"/>");

	
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
	 
	 jQuery.validator.addMethod("lettersonly", function(value, element) {
		//	return this.optional(element) || /^[a-zA-Z ]+(([,._ /-][a-zA-Z 0-9])?[a-zA-Z0-9 ]*)*$/i.test(value);
		//}, 	"<spring:message code="label.allowedchar"/>");  
			return this.optional(element) || /^[a-zA-Z]+$/i.test(value);
		}, 	"<spring:message code="label.allowedCharOnly"/>");  

		
		jQuery.validator.addMethod("checkempty", function(value) {
			return $.trim( value );
			}, "<spring:message code="label.emptyfld"/>");
	
	var profileForm=$("#profile-form").validate({
		//specify the validation rules
		rules: {
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
			email: {
				required: true,
				email: true //email is required AND must be in the form of a valid email address
			},
			phone:{
				customphone:true
				//required: true
			},
			mobile:"mobilephone",
			pincode:{
				alphanumeric: true
			}
		},
		//specify validation error messages
		messages: {
			firstName: "<spring:message code="label.firstname_required"/>",
			lastname: "<spring:message code="label.lastname_required"/>", 
			email: "<spring:message code="label.email_msgrequired"/>",
			mobile:"<spring:message code="label.mod_digit"/>",
			/* phone: {
        		required:"<spring:message code="label.phonenumber_required"/>" ,
			} */
		},
		highlight: function(element) {
            $(element).closest('.inputfield').addClass('has-error');
        },
		unhighlight: function(element){
            $(element).closest('.inputfield').removeClass('has-error');
        },
 });
	
	function saveProfile(val){
		var phValue=$("#phone").val();
		phValue=phValue.replace(/-/g, "");
		var contct ="";
		var countryCodeVar="";
		if(val != 'IN'){
			var con = $("#codes option:selected").val().split(" ");
			///	alert($("#codes option:selected").val()+" con[0]"+con[0]+"   trim:"+con[0].trim()+"  counteyCodeVar:"+con[1].trim());
				con[0] = con[0].trim();  //vvv
				countryCodeVar = con[1].trim();  //vvv 17jun2020
				if(phValue !=""){
					contct ="+"+con[0]+"-"+phValue;
				}
				else{
					contct ="";
				}
		}else{
			contct = "+91-"+phValue;
			countryCodeVar = "IN";
		}
		
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
		var valid = $("#profile-form").valid();
		if(valid == true){
		var data = {
	    	      "firstName" : $("#firstname").val(),
	    	     "lastname" :$("#lastname").val(),
	    	      "mobile" :$("#mobile").val(),
	    	      "phone" :contct,
	    	      "country" :$("#country").val(),
	    	      "state" :$("#state").val(),
	    	      "city" :$("#city").val(),
	    	      "address" :$("#address").val(),
	    	      "pincode" :$("#pincode").val(),
	    	      "countryCode":countryCodeVar
	    	      
	    }
		//alert(contextPath);
		///alert(JSON.stringify(data));
			$.ajax({
				contentType : 'application/json; charset=utf-8',
				type : "POST",
				url : contextPath+"app/saveProfile",
				dataType : 'json',
				data : JSON.stringify(data),
				beforeSend : function(xhr) {
					//$('#editprofile').buttonLoader('start');
					//$("#loader2").show();
					xhr.setRequestHeader(header, token);
				},
				complete : function() {
					//$("#loader2").hide();
					//$("#editprofile").buttonLoader('stop');
				},
				success : function(response) {
				
					if(response=='success'){
						getProfile();
						var fn= $("#firstname").val()+" ";
						var ln= $("#lastname").val() ;
						document.getElementById("profileName").innerHTML= fn + ln ;
						$('#editprofile').show();
						$('#saveprofile').hide();
						$('#cancelprofile').hide();
						$('.disabledCheckboxes').prop("disabled", true);
						$('.select-dropdown').prop("disabled", true);
						$("#save_success").show();
						$("#save_success").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i>'+'<spring:message code="label.prof_saved"/>' +' <a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
					
						$("#save_failure").hide();
					}else if(response=='errorCode_FIELD_ALREADY_EXISTS'){
						//alert('failed')
						$("#save_success").hide();
						$("#save_failure").show();
						
						$("#save_failure").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i><spring:message code="label.mobileNumberRegis"/><a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
					
					}else if(response=='errorCode_INVALID_MOBILE_NUMBER'){
						$("#save_success").hide();
						$("#save_failure").show();
						
						$("#save_failure").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i><spring:message code="label.inv_mob_no"/> <a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
					
					}
					else{
						//alert('failed')
						$("#save_success").hide();
						$("#save_failure").show();
						
						$("#save_failure").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i><spring:message code="label.prb_in_upd_user_details"/> <a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
					
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
	

	
	function deleteUser(){
		  var obj={
		    		 columnClass: 'col-md-6 col-md-offset-3',
			    		title:'<spring:message code="label.deleteYourAccount"/>',
			    	    content: '',
			    		 buttons: {
			 	            '<spring:message code="label.cancel"/>': {
			 			        btnClass: 'btn-light'
			 	            }, 
			 	            button: {
			 	                text: '<spring:message code="label.countinueFreeVersion"/>',
			 	                btnClass: 'btn-upload',
			 	               //isDisabled: true,
			 	               isHidden: isHide,
			 	                action: function(){
			 	                	$('.overlay-bg').show();
			 	                	var token = $("meta[name='_csrf']").attr("content");
					 	     		var header = $("meta[name='_csrf_header']").attr("content");
					 	     		var contextPath=$("#contextPath").val();
					 	     		var data = {
				 	     	    	      "freeTrialCount" : $("#freeTrialCount").val()
				 	     	    			}
				 	     				//alert($("#freeTrialCount").val());
					 	     			$.ajax({
					 	     				contentType : 'application/json; charset=utf-8',
					 	     				type : "POST",
					 	     				url : contextPath+"app/moveToFreeTrial",
					 	     				dataType : 'json',
					 	     				data : JSON.stringify(data),
					 	     				beforeSend : function(xhr) {
					 	     					xhr.setRequestHeader(header, token);
					 	     				},
					 	     				complete : function() {
					 	     				},
					 	     				success : function(response) {
					 	     					if(response=='success'){
					 	     						freeUser();
					 	     					}else{
					 	     						
					 	     						$.confirm({
					 	     	       	    	        title: '',
					 	     	       	    	        content: 'Failed ',
					 	     	       	    	       		 buttons: {
					 	     	       	    	        	
					 	     	       	    	            somethingElse: {
					 	     	       	    	                text: 'OK',
					 	     	       	    	                btnClass: 'btn-primary',
					 	     	       	    	            }
					 	     	       	    	        }
					 	     	       	    	    });
					 	     						//alert('failed')
					 	     					}
					 	     				},
					 	     				error: function(xhr, textStatus, errorThrown)
					 	     				 {
					 	     				 	//alert('<spring:message code="label.loading_error"/>');
					 	     				 	return false;
					 	     				}
					 	     			})
			 	                }
			 	            },  
			 	           somethingElse: {
			 	                text: '<spring:message code="label.deleteAccount"/>',
			 	                btnClass: 'btn-default',
			 	                //isHidden: isDisable,
			 	                action: function(){
			 	                	//debugger;
			 	                //deleteUserConfirmation();
			 	                $('#deleteaccountconfirm').show();
			 	               $('.overlay-bg').show();
			 	                }
			 	            },
			 	        }
			    	};
		  if(isHide){
			  obj.content= '<p><spring:message code="label.areYouSureDeleteAccount"/></p>'
				  + '<p><b><spring:message code="label.note"/></b> <spring:message code="label.pleaseDownload"/> <b>\'My Files\'</b> <spring:message code="label.tabBeforeDelete"/></p>'
		  } else{
			  obj.content= '<p><spring:message code="label.areYouSureDeleteAccount"/></p>'
				  + '<p><b><spring:message code="label.note"/></b> <spring:message code="label.pleaseDownload"/> <b>\'My Files\'</b> <spring:message code="label.tabBeforeDelete"/></p>'
		 } 
		  
	    	$.confirm(obj);	

	}

	function freeUser(){
		
    	$.confirm({
    		columnClass: 'col-md-6 col-md-offset-3',
    		title:'<spring:message code="label.titleNote"/>',
    	    content: '<p><spring:message code="label.freeVersionActive"/>'
    	    + '<spring:message code="label.forAnyQuery"/> <b><spring:message code="label.drysign.support"/></b>.</p>',   
    		 buttons: {
 	            /* Cancel: {
 			        btnClass: 'btn-light',
 			       action: function(){ 
 	 	               $('.overlay-bg').hide();

 	 	                }
 	            }, 
 	        */
 	           somethingElse: {
 	                text: '<spring:message code="label.todash"/>',
 	                btnClass: 'btn-default',
 	                action: function(){
 	                   $('.overlay-bg').hide();
 	                  window.location = $("#contextPath").val()+"app/dashboard"; 	             	 
 	                }
 	            },
 	        }
    	});	

}

	function hiderReassignPopUp(){
		$('.overlay-bg').hide();
		$("#deleteaccountconfirm").hide();
		$("#form")[0].reset();
	}

	
	function deleteUserConfirmation(){
		var message =  document.getElementById('message').value.trim();
		if(message=="" ){
			$("#reasonMessage").show();
		}else{
		var reason;
		if (document.getElementById('reasons1').checked)
		reason = document.getElementById('reasons1').value;
		else if (document.getElementById('reasons2').checked)
		reason  = document.getElementById('reasons2').value;
		else if (document.getElementById('reasons3').checked)
		reason  = document.getElementById('reasons3').value;
		else if (document.getElementById('reasons4').checked)
		reason  = document.getElementById('reasons4').value;
		else if (document.getElementById('reasons5').checked) 
		reason  = document.getElementById('reasons5').value;
		else if (document.getElementById('reasons6').checked)
		reason  = document.getElementById('reasons6').value;
		var user_delete_reason=	reason + "=>" + message;
		$("#deleteaccountconfirm").hide();
		var emailId=$("#email").val();
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
		var valid = $("#profile-form").valid();
		var data = {"user_delete_reason" : user_delete_reason}
		if(valid == true){
		$.ajax({
				contentType : 'application/json; charset=utf-8',
				type : "POST",
				url : contextPath+"/deleteUser",
				data: JSON.stringify(data),
				dataType : 'json',
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
					$("#loader2").show();
				},
				complete : function() {
					$("#loader2").hide();
				},
				success : function(response) {
					$.confirm({
				        title: '<spring:message code="label.checkEmail"/>',
				        content: '<p><spring:message code="label.pleaseCheckInbox"/> <b>\''+emailId+'\'</b> <spring:message code="label.toCompleteProcess"/></p> <p><b><spring:message code="label.note"/></b> <spring:message code="label.downloadIMPDocument"/> <b>\'My Files\'</b> <spring:message code="label.confirmDelete"/></p>',
				       		 buttons: {
				       			'<spring:message code="label.ok1"/>': function () {
				       				window.location = $("#contextPath").val()+"login";
				       			},
				        }
				    });
					},
				error: function(xhr, textStatus, errorThrown)
				 {
					
					$.confirm({
       	    	        title: '',
       	    	        content: '<spring:message code="label.somethingWrong"/>',
       	    	       		 buttons: {
       	    	        	
       	    	            somethingElse: {
       	    	                text: 'OK',
       	    	                btnClass: 'btn-primary',
       	    	            }
       	    	        }
       	    	    });
				 	//alert('Something went wrong.Please try again.');
				 	return false;
				}
			})	
		}
	}
}
	
	
	function validateToken(){
		   var xhttpVerify = new XMLHttpRequest();
		  
		   var token = $('#mfa-token').val();
		   
		   if(token == "") {
			   $.confirm({
  	    	        title: '',
  	    	        content: '<spring:message code="label.enterToken"/>',
  	    	       		 buttons: {
  	    	        	
  	    	            somethingElse: {
  	    	                text: 'OK',
  	    	                btnClass: 'btn-primary',
  	    	            }
  	    	        }
  	    	    });
		   
			   //alert('Please enter token');
			   return;
		   }
		   
		   
		   xhttpVerify.open("GET", "<%=appUrl%>/app/token/validate?token=" + token, true);
		   xhttpVerify.send();
	  	   
		   xhttpVerify.onreadystatechange = function() {
		 	        if (this.readyState == 4 && this.status == 200) {
		 	        	var jsonResponse = JSON.parse(xhttpVerify.responseText);
		 	        	
		 	        	if(jsonResponse.map.isValid == true){
		 	        		//debugger;
		 	        		//alert("Token is valid. You will be logged out now.");
		 	        		$("#sessionLogOut").trigger("click");
		 	        	}else{
		 	        		
		 	        		$.confirm({
		       	    	        title: '',
		       	    	        content: '<spring:message code="label.invalidToken"/>',
		       	    	       		 buttons: {
		       	    	        	
		       	    	            somethingElse: {
		       	    	                text: 'OK',
		       	    	                btnClass: 'btn-primary',
		       	    	            }
		       	    	        }
		       	    	    });
		 	        		//alert("Invalid token");		 	        		
		 	        	}
		 	        }
		 	        	if (this.readyState == 4 && this.status == 500) {
		 	        		$.confirm({
		       	    	        title: '',
		       	    	        content: '<spring:message code="label.errorValidateToken"/> ',
		       	    	       		 buttons: {
		       	    	        	
		       	    	            somethingElse: {
		       	    	                text: 'OK',
		       	    	                btnClass: 'btn-primary',
		       	    	            }
		       	    	        }
		       	    	    });
		 	        	
		 	       		//alert("Error while validationg token");
		 	       	 }
		 	        }; 
	 			}
	
	//DISPLAY MESSAGE DISABLEMFA. 
	$('#disableMsg').on('click', function () {
	    $.confirm({
	        title: '<spring:message code="label.disableMFA"/>',
	        content: '<spring:message code="label.areYouSureDisableMFA"/> ',
	       		 buttons: {
	        	
	            somethingElse: {
	                text: 'CONFIRM',
	                btnClass: 'btn-green',
	               
	                action: function(){
	                	//debugger;
	                	disableMFAauth();
	                	
	                }
	            },
	            cancel: {
			        btnClass: 'btn-red'
	            }, 
	        }
	    });
	});
	
	//SESSION LOGOUT MESSAGE....
	$('#sessionLogOut').on('click', function () {
	    $.confirm({
	        title: '<spring:message code="label.logout"/>',
	        content: '<spring:message code="label.mfaEnalableSucess"/>',
	       		 buttons: {
	        	
	            somethingElse: {
	                text: 'OK',
	                btnClass: 'btn-primary',
	               
	                action: function(){
	                	window.location = $("#contextPath").val()+"logout";
	                }
	            }/* ,
	            cancel: {
			        btnClass: 'btn-red'
	            }, */
	        }
	    });
	});
	
	function disableMFAauth(){
		//debugger;
		var xhttpVerify = new XMLHttpRequest();
		   
		   xhttpVerify.open("GET", "<%=appUrl%>/app/disableMFA", true);
		xhttpVerify.send();
		xhttpVerify.onreadystatechange = function(res) {
			if (this.readyState == 4 && this.status == 200) {
				//$("#disableMsg").trigger("click");
				document.location.reload(true);
			}
			if (this.readyState == 4 && this.status == 500) {
				
				$.confirm({
   	    	        title: '',
   	    	        content: '<spring:message code="label.notDisableMFA"/> ',
   	    	       		 buttons: {
   	    	        	
   	    	            somethingElse: {
   	    	                text: 'OK',
   	    	                btnClass: 'btn-primary',
   	    	            }
   	    	        }
   	    	    });
				//alert("Could not disabled MFA");
			}
		}
	}
</script>

<div class="modal" id="mfaModal" role="dialog" data-backdrop="static">
	<div class="modal-dialog modal-sm modal-dialog-centered">
		<div class="modal-content">
			<div><spring:message code="label.enableMFA"/></div>
			<div id="qrCodeChart" style="text-align: center;"></div>

			<br></br>

			<div class="form-group">
				<label for="token"><spring:message code="label.token"/></label> <input type="text"
					class="form-control" id="mfa-token" onfocus="this.value=''"
					autocomplete="off">
				<button class="btn btn-primary btn-width" onclick="validateToken();"><spring:message code="label.validate"/></button>
				<button class="btn btn-light pull-right" data-dismiss="modal"><spring:message code="label.cancel"/></button>
			</div>


		</div>
	</div>
</div>

<script type="text/javascript">
	$('#mfa-token').keypress(function(event) {
		var keycode = (event.keyCode ? event.keyCode : event.which);
		if (keycode == '13') {
			// alert('You pressed a "enter" key in textbox');
			validateToken();
		}
	});

	/* country code started */

	function dialCodeNo(val,countryCode) {		//function dialCodeNo(val) { vvv16june2020
	///	alert("countryCode:"+countryCode+" val.toString:"+val.toString()); 
		if(countryCode=="undefined" || countryCode==undefined || countryCode==null || countryCode ==""){
			countryCode="US";		
		}
		
		//var val=val.toString();	//vvv22jun val.toString() will not work for undefined/null val
		// for number without country code set by default US contry code
		/*//vvv22jun commented this part as it should check undefined code first to avoid err of trulli
		if (!val.includes("-")) {
			val = "+1-"+val;
		}
		else if(val=="undefined"){
			val = "+1-"+0000000000;
		} */
		 
		//vvv 22jun added undefined check first
		//for number without country code set by default US contry code
		if(val=="undefined" || val==undefined || val==null){
			val = "+1-";
		}
		else if (!val.includes("-")) {
			val = "+1-"+val;
		}
	
		var contct = val.split("-");
	
		if (contct[1] == "undefined" || contct[1] == "") {
			$("#phone").val("");
		} else {
			var ph=contct[1];
			ph=ph.replace(/(\d{3})(\d{3})(\d{4})/, "$1-$2-$3");
			// adding hyphen to numbers
			$("#phone").val(ph);
		}

		var i, options = '';
		var cont = contct[0].substring(1);
		
		if (cont > 6000 || val == 'NULL' || cont == '') {
			cont = 1;
			if (val == 'NULL') {
				$("#phone").val("");
			} else {

				$("#phone").val(val);
			}
		}
		
		for (i = 0; i < countryCodes.length; i++) {
			if (countryCodes[i].callingCodes[0] == cont && countryCode==countryCodes[i].alpha2Code) {
				options += '<option selected value="'+countryCodes[i].callingCodes[0]+" "+countryCodes[i].alpha2Code+'">'
						+ countryCodes[i].name
						+ '&nbsp;(+'
						+ countryCodes[i].callingCodes[0] + ')</option>';
				document.getElementById("imgflage").src = countryCodes[i].flag;
			} else {
				options += '<option value="'+countryCodes[i].callingCodes[0]+" "+countryCodes[i].alpha2Code+'">'
						+ countryCodes[i].name
						+ '&nbsp;(+'
						+ countryCodes[i].callingCodes[0] + ')</option>';
			}
		}
		document.getElementById('codes').innerHTML = options;

	}

	var activeSub = "${activeSubscription}";
	var noOfDaysLeft = "${noOfDaysLeft}";
	var planName = "${noOfDaysLeft}";
	$(document).ready(function() {
						
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
						

						if (activeSub === "true") {
							//$("#cancelSubscription").show();
							$("#cancelSubscription").addClass(
									'btn-light_profile');
							$("#cancelSubscription").removeClass(
									'mngaccount_btn');
						} else if (activeSub === "corperate subscription") {
							$("#cancelSubErrorMsg")
									.html(
											"<spring:message code="label.cncle_subs"/>");
							$("#cancelSubscription").attr('disabled', true);
							$("#cancelSubErrorMsg").css('color', '#40505b');
							$("#cancelSubErrorMsg").css('font-size', '12px');

						} else if (activeSub === "false") {
							$("#updateCardDetail").hide();
							$("#cancelSubErrorMsg")
									.html(
											"<spring:message code="label.dont_active"/>");
							$("#cancelSubscription").attr('disabled', true);

						} else if (activeSub == "already cancelled") {
							$("#updateCardDetail").hide();
							$("#cancelSubscription").attr('disabled', true);
							$("#cancelSubErrorMsg")
									.html(
											"<spring:message code="label.alrd_cancle"/>");

						}

						$("#codes").change(
										function() {
											var a = $("#codes option:selected").val();
											var counntryName = a.split(" ");
											var val = counntryName[1];
											for (i = 0; i < countryCodes.length; i++) {
												if (countryCodes[i].alpha2Code == val) {
										
													document.getElementById("imgflage").src = countryCodes[i].flag;
													return;
												}
											}

										});

						$("#cancelSubscription")
								.click(
										function() {

											if (activeSub === "true") {

												$
														.confirm({
															title : '<spring:message code="label.cncl_subs"/>',
															 content : '<p><spring:message code="label.stll_have"/>&nbsp;'
																	+ noOfDaysLeft
																	+ '&nbsp;<spring:message code="label.noofdays"/></p>', 
																/*content : '<p>Weâre sorry to see you go! Your subscription will be cancelled once you click Confirm. You have days remaining on your subscription.</p>',

															   buttons: {
															       '<spring:message code="label.cnl_sub"/>': function () {
															       	 btnClass: 'btn-light'
															         	
															       },
															      '<spring:message code="label.prcd_sub"/>': function () {
															      	cancelSubscriptionofUser();	
															       }
															   }*/

															buttons : {

																somethingElse : {
																	text : '<spring:message code="label.cancel"/>',
																	btnClass : 'btn-light',

																	action : function() {
																	

																	}
																},
																'<spring:message code="label.out_confm"/>' : function() {
																	// $.alert('Canceled!');
																		cancelSubscriptionofUser();
																}
															}
														});

											} else if (activeSub === "false") {

												$
														.alert("<spring:message code="label.sct_pur"/>");
											} else if (activeSub === "already cancelled") {
												$
														.alert("<spring:message code="label.alrd_cancle"/>");
											}

										});

						//https://craftpip.github.io/jquery-confirm/

						function cancelSubscriptionofUser() {

							var token = $("meta[name='_csrf']").attr("content");
							var header = $("meta[name='_csrf_header']").attr(
									"content");
							var contextPath = $("#contextPath").val();

							$.ajax({
										type : "POST",
										url : contextPath
												+ "cancelSubscription",
										beforeSend : function(xhr) {
											//$('#signupbtn').buttonLoader('start');'
											$("#loader2").show();
											xhr.setRequestHeader(header, token);
										},
										complete : function() {
											//$("#signupbtn").buttonLoader('stop');
											$("#loader2").hide();
										},
										success : function(response) {
											var res = JSON.parse(response);
											if (res.cancelSubscription == true) {
												//$.alert("<spring:message code="label.canclesuccess"/>");
												//$("#cancelSubscription").attr('disabled', true);
												$.confirm({
												    title: '',
												    content: '<spring:message code="label.canclesuccess"/>',
												    buttons: {
												        '<spring:message code="label.ok1"/>': function () {
												        	location.reload();
												        }
												    }
												});

											}else{
												$.alert('<spring:message code="label.subscriptionisFailed"/>');
											}
										},
										error : function(xhr, textStatus,
												errorThrown) {
										}
									})
						}

						
					});/* document ready closed */
	

//vvv UPDATE MFA ===============================================================================
		//vvv validate for sign up
	function validateSecurityCode(securityCode, confirmSecurityCode){
		//	alert("securityCode, confirmSecurityCode-"+securityCode+"   == "+confirmSecurityCode);
			var isNum_securityCode = /^\d+$/.test(securityCode);
			if(!isNum_securityCode){
				$("#securityCodeSignUpErr").css("display", "block");
				$("#confirmSecurityCodeSignUpErr").css("display", "none");
				return false;
			}else if(securityCode =="undefined" || securityCode.length < 6){	
				$("#securityCodeSignUpErr").css("display", "block");
				$("#confirmSecurityCodeSignUpErr").css("display", "none");
				return false;
			}
			else if(confirmSecurityCode =="undefined" || confirmSecurityCode.length < 6 || securityCode != confirmSecurityCode){	
				$("#securityCodeSignUpErr").css("display", "none");			
				$("#confirmSecurityCodeSignUpErr").css("display", "block");
				return false;
			} 
			else{
				//	$("#securityCodeSignUpErr").hide();
				$("#securityCodeSignUpErr").css("display", "none");
				$("#confirmSecurityCodeSignUpErr").css("display", "none");
				return true;
			} 
		
		}

	
/* vvv23Nov 
		function updateMFA(){
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
		
		var validSecureCode = validateSecurityCode($("#secureCodeVVV").val(),$("#confirmSecureCodeVVV").val());
		
		if(validSecureCode == true){
			var data = {
		    	"mfaSecureCode" : $("#secureCodeVVV").val()			//vvvMFA
			}
			
		//	alert("jsondATA: "+JSON.stringify(data));
			
			$.ajax({
				contentType : 'application/json; charset=utf-8',
				type : "POST",
				url : contextPath+"app/saveMFAProfile",
				dataType : 'json',
				data : JSON.stringify(data),
				beforeSend : function(xhr) {
					$("#loader2").show();
					xhr.setRequestHeader(header, token);
				},
				complete : function() {
					//$("#signupbtn").buttonLoader('stop');
					$("#loader2").hide();
				},
				success : function(response) {
					if(response=='success'){
						$("#save_successMfa").show();
						$("#save_successMfa").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i>'+'<spring:message code="label.mfaProfile.success"/>' +' <a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
						
						$('#otpsecure_code')[0].reset();
						$('.detail').css("display","none");
						
						$("#save_failureMfa").hide();
					}
					else if(response=='errorCode_FIELD_ALREADY_EXISTS'){
						//alert('failed')
						$("#save_successMfa").hide();
						$("#save_failureMfa").show();
					//	$("#save_failureMfa").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i>Problem in updating Secure Code. Please update a different Mobile Number.<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
						$("#save_failureMfa").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i>Problem in updating Secure Code.<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
						
					}else if(response=='errorCode_INVALID_MOBILE_NUMBER'){
						$("#save_successMfa").hide();
						$("#save_failureMfa").show();
					//	$("#save_failureMfa").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i>Problem in updating Secure Code. Please update a valid Mobile Number. <a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
						$("#save_failureMfa").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i>Problem in updating Secure Code.<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
						
					}
					else{
						//alert('failed')
						$("#save_successMfa").hide();
						$("#save_failureMfa").show();
						$("#save_failureMfa").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i>Problem in updating Secure Code.<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
					}
					
					
				},
				error: function(xhr, textStatus, errorThrown)
				 {
					
					$.confirm({
       	    	        title: '',
       	    	        content: '<spring:message code="label.loading_error"/> ',
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
	} */
	
	$('#cancelBtnMfa').click(function() {
		$('#chkSetupSecureCode').prop('checked', false);
		$('#multifactorSecureCode').hide();
		$('#otpsecure_code')[0].reset();
		$('.detail').css("display","none");
		$("#secureCodeVVV").val("");
		$("#confirmSecureCodeVVV").val("");
		
	});
	$("#personalInformation").click(function(){
		$('#otpsecure_code')[0].reset();
		$("#save_successMfa").css("display","none");
		$("#save_failureMfa").css("display","none");
		$("#confirmSecurityCodeSignUpErr").css("display","none");
		$("#securityCodeSignUpErr").css("display","none");
		$('.detail').css("display","none");
		$("#secureCodeVVV").val("");
		$("#confirmSecureCodeVVV").val("");
		 $("#save_success").hide();
		 $("#save_failure").hide();
	});
	

	
//===========================================================================================//	
	function removePhoto(){
	
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
		
		 $.confirm({
		        title: '',
		        content: '<spring:message code="label.areYouSurRemovePhoto"/>',
		       		 buttons: {
		       			'<spring:message code="label.cancel"/>': {
					        btnClass: 'btn-light',
					       
			            }, 
		            somethingElse: {
		                text: 'OK',
		                btnClass: 'btn-primary',
		                action: function(){
		                	
		                
		                	$.ajax({  
		               	     type : "GET",   
		               	     url : contextPath+"app/removephoto",  
		               	     dataType: 'json',
		               	     beforeSend : function(xhr) {	                
		               	    	xhr.setRequestHeader(header, token);		
		     	   			},	
		               	    success : function(response) { 
		               	    	if(response){ 
		               	    		 
		               	    		//SET FILE UPLOAD VALUE TO EMPTY SO THAT WHEN USER TRIES TO UPLOAD SAME FILE AGAIN THE EVENT GETS TRIGGERED 
		               	    		$("#inp").val('');
		               	    		//document.getElementById("inp").value = "";
		               	    		
		               	    	 }else{
		               	    		alert('<spring:message code="label.somethingWentWrong"/>');
		               	    	 }
		               	    	 
		               	     },  
		               	     error : function(e) {  
		               	      //alert('Error: ' + e);   
		               	   		alert('<spring:message code="label.somethingWentWrong"/>');
		               	     }  
		               	});  
		                	
		                	 $("#img").attr('src',appUrl+'/images/user.png');
		    		    	 $("#imgHeader").attr('src',appUrl+'/images/user.png');
		    		    	 $("#removePhoto").css("display","none");	
		 	                }
		            }
		        }
		    });
	
}

function updateCardDetails(){
	var contextPath=$("#contextPath").val();
	window.location.href= contextPath+"app/updateCardDetails";
   
}




///vvvMFA_18Dec chkEmailOTP
/* 	$("#checkMFAOtpMailId").click(function() {
	    var checked = $(this).is(':checked');
	    alert("checked"+checked);
	    
	    //if checked or unchecked call saveProfile to add/remove the otp mfa option
	    updateMFAOptions(this.id);


	});


	$("#checkMFASecureCodeId").click(function() {
	    var checked = $(this).is(':checked');
	    alert("checkMFASecureCodeId "+checked);
	    
	    //call from here only if user unchecks the checkbox for secure code 
	    if(!checked) {
	    	 updateMFAOptions(this.id);
	    }
	    
	    
	});  */
	
	// Code for Defect 1489
	$(".digit-confirmVVV").keyup(function(event) {
	    if (event.keyCode === 13) {
	        $("#update_MFA").click();
	    }
	});
	// Code End
	
	function updateMFAOptions(checkBoxId){

		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		var contextPath=$("#contextPath").val();
		
		//===mfa	chkEmailOTP chkSetupSecureCode
		var checkBoxMfaOTPMailValue = $("#chkEmailOTP").is(':checked');
		var checkBoxMfaSecureCodeValue = $("#chkSetupSecureCode").is(':checked');
		//===$(this).is(':checked')
		var alertString="";
		
		var secureCodeVVV = $("#secureCodeVVV").val();
		if(checkBoxId == "chkEmailOTP"){
			alertString="<spring:message code="label.emailOtp"/> ";
			secureCodeVVV="";		//if triggered from emailOTP, securecodeVVV should be set to empty as it should only get updated when clicked on Update button
		}
		else if(checkBoxId == "chkSetupSecureCode"){
			alertString="<spring:message code="label.secu_code"/> ";
		}
		var checked = $("#"+checkBoxId).is(':checked');
		
		//validate securecode/confirm securecode only when security code checkbox is checked
		var validSecureCode = false;
		if(checkBoxId == "chkSetupSecureCode" && checked){
			validSecureCode = validateSecurityCode($("#secureCodeVVV").val(),$("#confirmSecureCodeVVV").val());
		}
		
	//	alert("--checkBoxId---"+$("#"+checkBoxId).is(':checked'));
	//	alert(checkBoxId+"--checkBoxId----checked: "+checked+"--validSecureCode:"+validSecureCode);
		
		

		if(checkBoxId == "chkEmailOTP" || (checkBoxId == "chkSetupSecureCode" && checked && validSecureCode == true) || (checkBoxId == "chkSetupSecureCode" && !checked)){
			var data = {
		    	"mfaSecureCode" : secureCodeVVV,   //$("#secureCodeVVV").val(),
		    	"checkBoxMfaOTPMailValue":checkBoxMfaOTPMailValue,
		    	"checkBoxMfaSecureCodeValue":checkBoxMfaSecureCodeValue
			}
			
			//alert("jsondATA: "+JSON.stringify(data));
			
			$.ajax({
				contentType : 'application/json; charset=utf-8',
				type : "POST",
				url : contextPath+"app/saveMFAProfile",
				dataType : 'json',
				data : JSON.stringify(data),
				beforeSend : function(xhr) {
					$("#loader2").show();
					xhr.setRequestHeader(header, token);
				},
				complete : function() {
					//$("#signupbtn").buttonLoader('stop');
					$("#loader2").hide();
				},
				success : function(response) {
					
				//	alert("response: "+response);
					//mfa check
				
					
/* 				if(checked) {
	     	
	     	
			    	$.confirm({
			    	        title: '',
			    	        content: alertString+'Activated ',
			    	       		 buttons: {
			    	        	
			    	            somethingElse: {
			    	                text: 'OK',
			    	                btnClass: 'btn-primary',
			    	            }
			    	        }
			    	    });
			    }
			    else{
			    	
			    	$.confirm({
		    	        title: '',
		    	        content: alertString+'DeActivated ',
		    	       		 buttons: {
		    	        	
		    	            somethingElse: {
		    	                text: 'OK',
		    	                btnClass: 'btn-primary'
		    	            }
		    	        }
		    	    });
	    		} */
					
					
				///////mfa check/////////////////////////////////	
					
					if(response=='success'){
						//$("#save_successMfa").show();
						//$("#save_successMfa").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i>'+'<spring:message code="label.mfaProfile.success"/>' +' <a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
						//$("#save_failureMfa").hide();
						$('#otpsecure_code')[0].reset();
						$("#secureCodeVVV").val("");
						///$('.detail').css("display","none"); //hide secure code / confirm secure code boxes
						
					
						
						if(checkBoxId == "chkEmailOTP" && checked){
							/* $("#emailOTPActivated").show();
					        $('.overlay-bg').show();
					        $('.overlaywhite_bg').show(); */
					        
					         $.confirm({
				    	        title: '',
				    	        content: alertString+'<spring:message code="label.activated"/> ',
				    	       		 buttons: {
				    	        	
				    	            somethingElse: {
				    	                text: 'OK',
				    	                btnClass: 'btn-primary',
				    	            }
				    	        }
				    	    }); 
					        
					         mfaOtpMailFlag="true";		//will set the current value of checkbox based on this value on tab toggle
					         
						}else if(checkBoxId == "chkEmailOTP" && !checked){
							//$("#emailOTPActivated").hide();
							
							$.confirm({
				    	        title: '',
				    	        content: alertString+'<spring:message code="label.de_activated"/> ',
				    	       		 buttons: {
				    	        	
				    	            somethingElse: {
				    	                text: 'OK',
				    	                btnClass: 'btn-primary'
				    	            }
				    	        }
				    	    });
							
							 mfaOtpMailFlag="false";	//will set the current value of checkbox based on this value on tab toggle
						}
						
						
						if(checkBoxId == "chkSetupSecureCode" && checked){
							  $("#multifactorSecureCode").show();
						
							$.confirm({
				    	        title: '',
				    	        content: alertString+'<spring:message code="label.activated"/> ',
				    	       		 buttons: {
				    	        	
				    	            somethingElse: {
				    	                text: 'OK',
				    	                btnClass: 'btn-primary',
				    	            }
				    	        }
				    	    });
							
							mfaSecureCodeFlag="true";	//will set the current value of checkbox based on this value on tab toggle
							
						}else if(checkBoxId == "chkSetupSecureCode" && !checked){
						      $("#multifactorSecureCode").hide();
						
							$.confirm({
				    	        title: '',
				    	        content: alertString+'<spring:message code="label.de_activated"/> ',
				    	       		 buttons: {
				    	        	
				    	            somethingElse: {
				    	                text: 'OK',
				    	                btnClass: 'btn-primary'
				    	            }
				    	        }
				    	    });
							
							mfaSecureCodeFlag="false";	//will set the current value of checkbox based on this value on tab toggle
						}
						
						
					}
					else{
						//alert('failed')
						//$("#save_successMfa").hide();
						//$("#save_failureMfa").show();
						//$("#save_failureMfa").html('<i class="fa fa-check-circle successmessageicon" aria-hidden="true"></i>Problem in updating Secure Code.<a class="close" data-hide="alert" aria-label="close" onclick="$(this).parent().hide();">&times;</a>');
					
						$.confirm({
	       	    	        title: '',
	       	    	        content: '<spring:message code="label.loading_error"/> ',
	       	    	       		 buttons: {
	       	    	        	
	       	    	            somethingElse: {
	       	    	                text: 'OK',
	       	    	                btnClass: 'btn-primary',
	       	    	            }
	       	    	        }
						});
					}
					
					
				},
				error: function(xhr, textStatus, errorThrown)
				 {
					
					$.confirm({
     	    	        title: '',
     	    	        content: '<spring:message code="label.loading_error"/> ',
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

	
	
	
	
///vvvMFA_18Dec


</script>
</head>


</html>