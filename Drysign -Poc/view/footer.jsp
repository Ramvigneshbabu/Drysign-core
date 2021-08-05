<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<% 
String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>
<!-- /.content-wrapper -->
<!-- Main Footer -->
<link href="<%=appUrl %>/css/cookie.min.css" rel="stylesheet" />
<!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<footer class="main-footer">


	<!-- To the right -->
	<div class="social footer_div text-center">
		<ul class="footer_ul">
			<!-- <li style="padding-right: 10px;"><span class="icon-language"></span>
				ENGLISH</li> -->
			<!--  <li><a href="#">Contact Us</a></li>
        <li><a href="#">Terms of Use</a></li>
        <li><a href="#">Privacy</a></li> -->
			<li>&copy; Copyright <script>document.write(new Date().getFullYear())</script>,
				<spring:message code="label.company"/>
			</li>
		</ul>
	</div>


	<!-- Default to the left -->
</footer>
<%-- <div class="cookies_new">
	<div class="cookies_part_confirmed fixedClr" style="display:none">
		
			<div class="row">
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<p class="cookie_txt"><spring:message code="label.cookie_acceptencess" /></p>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="btnset">
						<a href="#" id="hidewindow" class="cookie-btn" style="text-transform: uppercase"><spring:message code="label.cookie_hide" /></a> <a href="#" id="more_info1"
							data-toggle="modal" data-target="#PModal" class="cookie-btn" style="text-transform: uppercase"><spring:message code="label.cookie_more" /></a>
					</div>
				</div>
			</div>
</div>
</div>
<div class="cookies_new">
	<div class="cookies_part fixedClr" style="display:none">
	
			<div class="row">
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<p class="cookie_txt">
						<spring:message code="label.cookie_para" /><a href="#" data-toggle="modal" data-target="#PModal"><spring:message code="label.policy" /></a>.
					</p>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="btnset">
						<a href="#" id="accecpt_cookies" class="cookie-btn" style="text-transform: uppercase"> <spring:message code="label.policy_agree" /></a> <a href="#"
							data-toggle="modal" data-target="#PModal" class="cookie-btn" style="text-transform: uppercase"> <spring:message code="label.policy_moreinfo" /></a>
					</div>
				</div>
			</div>
	</div>
</div> --%>


<div class="modal fade" id="PModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog ">
		<!-- Modal content-->
		<div class="modal-content" style="padding:0px">
			<div class="modal-header model-header-background">
				
				<button type="button" class="cookie-close closeiconcss" title="close" data-dismiss="modal">X</button>
				
				<div class="logo_pop">
					<img src="<%=appUrl %>/images/logo_inner.png" width="100">
				</div>
			</div>
			<div class="cookies-modal-body print_body model-body-custom" style="max-height: auto">
				<p class="boldtxt">1. <spring:message code="label.introduction" /></p>
				<ul>
					<li><p class="sub-cat-id">1.1</p>
						<p class="sub-cat-txt"><spring:message code="label.introduction_1_1" /></p></li>
					<li><p class="sub-cat-id">1.2</p>
						<p class="sub-cat-txt"><spring:message code="label.introduction_1_2" /></p></li>
				</ul>

				<p class="boldtxt">2. <spring:message code="label.scope" /></p>
				<ul>
					<li><p class="sub-cat-id">2.1</p>
						<p class="sub-cat-txt"><spring:message code="label.scope_2_1" /></p></li>
				</ul>
				<ul>
					<li><p class="sub-cat-id">2.2</p>
						<p class="sub-cat-txt"><spring:message code="label.scope_2_2" /> (<a href="https://drysign.exelatech.com/"><spring:message code="label.dry_exelatech"/></a>) <spring:message code="label.scope_2_2_continue" /></p></li>
				</ul>
				<p class="boldtxt">3. <spring:message code="label.cpi" /></p>
				<ul>
					<li><p class="sub-cat-id">3.1</p>
						<p class="sub-cat-txt"><spring:message code="label.cpi_3_1" /></p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_a" /></p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_b" /></p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_c" /></p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_d" /></p></li>
							<li><p class="sub-cat-id">(e)</p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_e" /></p></li>
							<li><p class="sub-cat-id">(f)</p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_f" /></p></li>
						</ul>
					</li>
					<li><p class="sub-cat-id">3.2</p>
						<p class="sub-cat-txt"><spring:message code="label.cpi_3_2" /></p></li>
				</ul>
				<p class="boldtxt">4.	<spring:message code="label.upi" /></p>
				<ul>
					<li><p class="sub-cat-id">4.1</p>
						<p class="sub-cat-txt"><spring:message code="label.upi_4_1" /></p></li>
					<li><p class="sub-cat-id">4.2</p>
						<p class="sub-cat-txt"><spring:message code="label.upi_4_2" /></p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_a" /></p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_b" /></p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_c" /></p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_d" /></p></li>
							<li><p class="sub-cat-id">(e)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_e" /></p></li>
							<li><p class="sub-cat-id">(f)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_f" /></p></li>
							<li><p class="sub-cat-id">(g)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_g" /></p></li>
							<li><p class="sub-cat-id">(h)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_h" /></p></li>
							<li><p class="sub-cat-id">(i)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_i" /></p></li>
							<li><p class="sub-cat-id">(j)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_j" /></p></li>
							<li><p class="sub-cat-id">(k)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_k" /></p></li>
							<li><p class="sub-cat-id">(l)</p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_l" /></p></li>
						</ul></li>
					<li><p class="sub-cat-id">4.3</p>
						<p class="sub-cat-txt"><spring:message code="label.upi_4_3" /></p></li>
				</ul>
				<p class="boldtxt">5.   <spring:message code="label.lbp" /></p>
				<ul>
					<li><p class="sub-cat-id">5.1</p>
						<p class="sub-cat-txt"><spring:message code="label.lbp_5_1" /></p></li>
					<li><p class="sub-cat-id">5.2</p>
						<p class="sub-cat-txt"><spring:message code="label.lbp_5_2" /></p></li>
					<li><p class="sub-cat-id">5.3</p>
						<p class="sub-cat-txt"><spring:message code="label.lbp_5_3" /></p></li>
					<li><p class="sub-cat-id">5.4</p>
						<p class="sub-cat-txt"><spring:message code="label.lbp_5_4" /></p></li>
				</ul>
				<p class="boldtxt">6.   <spring:message code="label.olbi" /></p>
				<ul>
					<li><p class="sub-cat-id">6.1</p>
						<p class="sub-cat-txt"><spring:message code="label.olbi_6_1" /></p></li>
					<li><p class="sub-cat-id">6.2</p>
						<p class="sub-cat-txt"><spring:message code="label.olbi_6_2" /></p></li>
					<li><p class="sub-cat-id">6.3</p>
						<p class="sub-cat-txt"><spring:message code="label.olbi_6_3" /></p></li>
					
				</ul>
				<p class="boldtxt">7. <spring:message code="label.dpi" /></p>
				<ul>
					<li><p class="sub-cat-id">7.1</p>
						<p class="sub-cat-txt"><spring:message code="label.dpi_7_1" /></p></li>
					<li><p class="sub-cat-id">7.2</p>
						<p class="sub-cat-txt"><spring:message code="label.dpi_7_2" /></p></li>
					<li><p class="sub-cat-id">7.3</p>
						<p class="sub-cat-txt"><spring:message code="label.dpi_7_3" /></p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><spring:message code="label.dpi_7_3_a" /></p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt"><spring:message code="label.dpi_7_3_b" /></p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt"><spring:message code="label.dpi_7_3_c" /></p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt"><spring:message code="label.dpi_7_3_d" /></p></li>
							<li><p class="sub-cat-id">(e)</p>
								<p class="sub-cat-txt"><spring:message code="label.dpi_7_3_e" /></p></li>
						</ul></li>
					<li><p class="sub-cat-id">7.4</p>
						<p class="sub-cat-txt"><spring:message code="label.dpi_7_4" /></p></li>
				</ul>
				<p class="boldtxt">8. <spring:message code="label.idt" /></p>
				<ul>
					<li><p class="sub-cat-id">8.1</p>
						<p class="sub-cat-txt"> <spring:message code="label.idt_8_1" /></p></li>
					<li><p class="sub-cat-id">8.2</p>
						<p class="sub-cat-txt"><spring:message code="label.idt_8_2" /></p></li>
				</ul>
				<p class="boldtxt">9. <spring:message code="label.rpi" /></p>
				<ul>
					<li><p class="sub-cat-id">9.1</p>
						<p class="sub-cat-txt"><spring:message code="label.rpi_9_1" /></p></li>
					<li><p class="sub-cat-id">9.2</p>
						<p class="sub-cat-txt"><spring:message code="label.rpi_9_2" /> <b><spring:message code="label.rpi_9_2_c" /></b></p></li>
					<li><p class="sub-cat-id">9.3</p>
						<p class="sub-cat-txt"><spring:message code="label.rpi_9_3" /></p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><spring:message code="label.rpi_9_3_a" /> <b><spring:message code="label.rpi_9_2_c" /></b></p></li>
						</ul></li>
					<li><p class="sub-cat-id">9.4</p>
						<p class="sub-cat-txt"><spring:message code="label.rpi_9_4" /> </p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><spring:message code="label.rpi_9_4_a" /></p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt"><spring:message code="label.rpi_9_4_b" /></p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt"><spring:message code="label.rpi_9_4_c" /></p></li>
						</ul></li>
				</ul>
				<p class="boldtxt">10. <spring:message code="label.spi" /></p>
				<ul>
					<li><p class="sub-cat-id">10.1</p>
						<p class="sub-cat-txt"><spring:message code="label.spi_10_1" /></p></li>
					<li><p class="sub-cat-id">10.2</p>
						<p class="sub-cat-txt"><spring:message code="label.spi_10_2" /></p></li>
					<li><p class="sub-cat-id">10.3</p>
						<p class="sub-cat-txt"><spring:message code="label.spi_10_3" /></p></li>
					<li><p class="sub-cat-id">10.4</p>
						<p class="sub-cat-txt"><spring:message code="label.spi_10_4" /></p></li>
					<li><p class="sub-cat-id">10.5</p>
						<p class="sub-cat-txt"><spring:message code="label.spi_10_5" /></p></li>	
				</ul>
				<p class="boldtxt">11. <spring:message code="label.amendment" /></p>
				<ul>
					<li><p class="sub-cat-id">11.1</p>
						<p class="sub-cat-txt"><spring:message code="label.amendment_11_1" /></p></li>
					<li><p class="sub-cat-id">11.2</p>
						<p class="sub-cat-txt"><spring:message code="label.amendment_11_2" /></p></li>
					<li><p class="sub-cat-id">11.3</p>
						<p class="sub-cat-txt"><spring:message code="label.amendment_11_3" /></p></li>
				</ul>
				<p class="boldtxt">12. <spring:message code="label.uright" /></p>
				<ul>
					<li><p class="sub-cat-id">12.1</p>
						<p class="sub-cat-txt"><spring:message code="label.uright_12_1" /> 1-844-9352832 <spring:message code="label.uright_12_1_c" /> (<a href="mailto:drysign.support@exelatech.com"><spring:message code="label.drysign_emailId"/></a>)</p></li>
					<li><p class="sub-cat-id">12.2</p>
						<p class="sub-cat-txt"><spring:message code="label.uright_12_2" /></p>
					<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_a" /></b> <spring:message code="label.uright_12_2_a_c" /></p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_b" /></b> <spring:message code="label.uright_12_2_b_c" /></p></li>
							<li><p class="sub-cat-id subcatid_css">(c)</p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_c" /></b> <spring:message code="label.uright_12_2_c_c" /></p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_d" /></b> <spring:message code="label.uright_12_2_d_c" /></p></li>
							<li><p class="sub-cat-id">(e)</p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_e" /></b> <spring:message code="label.uright_12_2_e_c" /></p></li>
							<li><p class="sub-cat-id">(f)</p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_f" /></b> <spring:message code="label.uright_12_2_f_c" />  <a href="https://ico.org.uk/concerns/"><spring:message code="label.uk_concerns"/></a></p></li>
						</ul></li>	
					<li><p class="sub-cat-id">12.3</p>
						<p class="sub-cat-txt"><spring:message code="label.uright_12_3" /></p></li>
					<li><p class="sub-cat-id">12.4</p>
						<p class="sub-cat-txt"><spring:message code="label.uright_12_4" /></p></li>
					<li><p class="sub-cat-id">12.5</p>
						<p class="sub-cat-txt"><spring:message code="label.uright_12_5" /></p></li>	
				</ul>

				<p class="boldtxt">13. <spring:message code="label.ui" /></p>
				<ul>
					<li>
						<p class="sub-cat-id">13.1</p><p class="sub-cat-txt"><spring:message code="label.ui_13_1" /> 1-844-9352832 <spring:message code="label.uright_12_1_c" /> (<a href="mailto:drysign.support@exelatech.com"><spring:message code="label.drysign_emailId"/></a>)</p></li>
				</ul>	
				<p class="boldtxt">14. <spring:message code="label.cookie" /></p>
				<ul>
					<li><p class="sub-cat-id">14.1</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_1" /></p></li>
					<li><p class="sub-cat-id">14.2</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_2" /></p></li>
					<li><p class="sub-cat-id">14.3</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_3" /></p></li>
					<li><p class="sub-cat-id">14.4</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_4" /></p></li>
					<li><p class="sub-cat-id">14.5</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_5" /></p></li>
					<li><p class="sub-cat-id">14.6</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_6" /></p>
							<table border="1" align="center" id="cookiestbl">
							<tr><th><spring:message code="label.cookie_name" /></th><th><spring:message code="label.cookie_type" /></th><th><spring:message code="label.cookie_des" /></th></tr>
							<tr><td><spring:message code="label.cookie_name_val" /></td><td><spring:message code="label.cookie_type_val" /></td><td><spring:message code="label.cookie_des_val" /></td></tr>
							</table>
					</li>
					<li><p class="sub-cat-id">14.7</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_7" /></p></li>
					<li><p class="sub-cat-id">14.8</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_8" /></p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_8_a" /></p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_8_b" /></p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_8_c" /></p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_8_d" /></p></li>
						</ul>
					</li>
					<li><p class="sub-cat-id">14.9</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_9" /></p></li>
					<li><p class="sub-cat-id">14.10</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_10" /></p></li>
					<li><p class="sub-cat-id">14.11</p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_11" /></p>
						<ul>
							<li><p class="sub-cat-id">(a)</p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_11_a" /> <a href="http://windows.microsoft.com/en-gb/internet-explorer/delete-manage-cookies#ie=ie-11"><spring:message code="label.del_manage_cookies"/></a>).</p></li>
							<li><p class="sub-cat-id">(b)</p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_11_b" /></p></li>
							<li><p class="sub-cat-id">(c)</p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_11_c" /></p></li>
							<li><p class="sub-cat-id">(d)</p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_11_d" /></p></li>
						</ul></li>
				</ul>
				<p class="boldtxt">15. <spring:message code="label.details" /></p>
				<ul>
					<li><p class="sub-cat-id">15.1</p>
						<p class="sub-cat-txt"><spring:message code="label.details_15_1" /></p></li>
				</ul>
					
					
			</div>
			<div class="modal-footer">
				<!--          <a title="Download  Privacy Notice" href="#" class="btn btn-default print_term_link no-print" download="">Download</a> -->

			</div>
		</div>
	</div>
</div>
<div id="myLougoutModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <!-- button type="button" class="close" data-dismiss="modal">&times;</button -->
        <h4 class="modal-title"><spring:message code="label.logout"/></h4>
      </div>
      <div class="modal-body">
        <p><spring:message code="label.confirmlogout"/></p>
      </div>
     <div class="text-right" style="padding-right: 18px">
                <button type="button" class="btn btn-light" data-dismiss="modal"><spring:message code="label.cancel"/></button>
        <button type="button" onclick="logoutyes();" class="btn btn-blue" data-dismiss="modal"><spring:message code="label.out_confm"/></button>

        </div>
      
    </div>

  </div>
</div>
	
	<input type="hidden" id="contextPath" value="<%=appUrl %>/" />
	<!-- ./wrapper -->
	<!-- REQUIRED JS SCRIPTS -->

	
	
	<script src="<%=appUrl %>/js/jquery-ui.min.js"></script>
	<script src="<%=appUrl %>/js/bootstrap.min.js"></script>
	<script src="<%=appUrl %>/js/jquery-confirm.min.js"></script>
	<script src="<%=appUrl %>/js/app.min.js"></script>
	<script src="<%=appUrl %>/js/jquery.browser.js"></script>
	<script src="<%=appUrl %>/js/jquery.dataTables.min.js"></script>
	<script src="<%=appUrl %>/js/dataTables.bootstrap4.min.js"></script>
	<script src="<%=appUrl %>/js/dataTables.responsive.js"></script>
	<script src="<%=appUrl %>/js/responsive.bootstrap.js"></script>
	<script src="<%=appUrl %>/js/nagging-menu.js"></script>

	<script>

$(document).ready(function() {
	
	
	  if($(window).width() < 835) {
		  $('.skin-blue.sidebar-mini').addClass('sidebar-collapse');
         // $('.main-sidebar').css({" -webkit-transition": "none", "-moz-transition": "none" ,"-o-transition":"none", "transition":"none"});
       } 
	 	  
	 $(".content-wrapper").css({ minHeight: $(window).innerHeight() - '102' });
	  $(window).resize(function() {
	    $(".content-wrapper").css({ minHeight: $(window).innerHeight() - '102' });
	  });
	  
	 
	// store url for current page as global variable
	current_page = document.location.href
	//alert(current_page)
	// apply selected states depending on current page
 	if (current_page.match(/dashboard/)) {
 	$("ul#headernavigation li:eq(0)").addClass('active');
 	} else if (current_page.match(/document/) || current_page.match(/selfsign/)|| current_page.match(/groupsign/)) {
 		$("ul#headernavigation li:eq(1)").addClass('active');
 	}else if (current_page.match(/outforSignature/) || current_page.match(/completedDocuments/) || current_page.match(/draft/))  {
 		$("ul#headernavigation li:eq(3)").addClass('active');
 		
 		if(current_page.match(/outforSignature/)){
 			$("ul#headersubnavigation li:eq(1)").addClass('active');
 		}else if(current_page.match(/completedDocuments/)){
 			$("ul#headersubnavigation li:eq(0)").addClass('active');
 		}else if(current_page.match(/draft/)){
 			$("ul#headersubnavigation li:eq(2)").addClass('active');
 		}
 		
 	}else { // don't mark any nav links as selected
 	$("ul#headernavigation li").removeClass('active');
 	};
});	
var timerId;
$( document ).ready(function() {
	document.onmousedown= resetTimer

	timerId = window.setTimeout(timeOut,1800000);		//1799000
	
	

	
//test();
});


function resetTimer() {
	window.clearTimeout(timerId);
	timerId = window.setTimeout(timeOut,1800000);	//1799000  
	}

function timeOut(){
    // do something here	
	$.confirm({
	    title: '<spring:message code="label.session"/>',
	    //btnClass: 'btn-green',
	    content: ' ',
	    buttons: {
	        somethingElse: {
	            text: '<spring:message code="label.ok"/>',
	            keys: ['enter', 'shift'],
	            action: function(){
	            	/*var locale = localStorage.getItem("langCode");
	            	localStorage.clear();
	            	window.location = $("#contextPath").val()+"logout?locale="+locale;*/
	            	logoutyes();
	            	
	            }
	        }
	    }
	});
	$('#videoclip').get(0).pause();
	//localStorage.clear();
	//window.location = $("#contextPath").val()+"logout";
}

</script>
	<script>	
$(window).on("load resize", function() {
    //var viewportWidth = $(window).width();
    //if (viewportWidth < 768) {
		//alert('hi')
		
        //  (function($) {
           
				//alert('hi');
             // $( ".m-view" ).prependTo( ".dropdown-menu li.bottom" );
 				//$( ".m-view.user" ).prependTo( "#drpdwn" );  
          
         //}) (jQuery);
   // }
});	
function logoutyes(){
	var locale = localStorage.getItem("langCode");
	//var region = sessionStorage.getItem("region");
	var region = localStorage.getItem("region");
	//alert("Footer.jsp locale:"+locale);
	sessionStorage.removeItem("mobileUpdated");
	sessionStorage.removeItem("region");
	localStorage.clear();
	window.location = $("#contextPath").val()+"logout?locale="+locale+"&region="+region;
}
/*$('.logout').on('click', function () {
    $.confirm({
        title: 'Logout!',
        content: 'Are you sure you want to logout?',
       		 buttons: {
        	  
        	/* confirm: function () {
        	 btnClass: 'btn-red'
          	  window.location = $("#contextPath").val()+"logout";
            }, */
         /*   somethingElse: {
                text: 'Confirm',
                btnClass: 'btn-blue',
               
                action: function(){
                	 window.location = $("#contextPath").val()+"logout";
                }
            },
            cancel: {
		        btnClass: 'btn-light'
            },
        }
    });
});*/
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
       }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}
/* var alreadystored = false;
$(window).on("load", function () {  checkCookie() });
function checkCookie() {
    var user = getCookie("drysigncookies");
    if (user != "") {
        alreadystored = true;
        $(".cookies_part").css("display", "none");
    }
    if (user == "") {
        $(".cookies_part").css("display", "block");
    }
}

$(document).ready(function () {
    $("#accecpt_cookies").click(function () {
        setCookie("drysigncookies", "stored", 30);
        $(".cookies_part").css("display", "none");
        $(".cookies_part_confirmed").css("display", "block");
    });

    $("#no_give_me_more").click(function () {
        $("#cookiesModal").modal("show");
    });

    $("#more_info").click(function () {
        $("#cookiesModal").modal("show");
    });
    $("#privacypolicywindow").click(function () {
        $("#cookiesModal").modal("show");
    });

    $("#hidewindow").click(function () {
        $(".cookies_part_confirmed").css("display", "none");
    });
}) */
</script>
	</body>
	</html>