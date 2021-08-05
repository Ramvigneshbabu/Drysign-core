<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<% 
String port = request.getServerPort()+"";
if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
%>



<link rel="stylesheet" href="<%=appUrl %>/css/fonts_icon.css" type="text/css">
<link href="<%=appUrl %>/css/cookie.css" rel="stylesheet" />
<!--/.Footer -->

	<div class="footer">
		
		<div class="">
			<div class="text-center">
				<!-- &copy Copyright 2017 Exela Technologies Inc., All Rights Reserved. -->
			<!-- span class="icon-language"></span> ENGLISH | --> &copy; <script>document.write(new Date().getFullYear())</script> <spring:message code="label.company"/>
			</div>
		</div>
	</div>
	
<%-- <div class="cookies_part fixedClr" style="padding-left:10px">
		<div class="">
			<div class="row">
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<p class="cookie_txt">
						<spring:message code="label.cookie_para" /><a href="#" data-toggle="modal" data-target="#PModal"><spring:message code="label.policy" /></a>.
					</p>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="btnset">
						<a id="accecpt_cookies" class="cookie-btn myBtn"><spring:message code="label.policy_agree" /></a> <a
							data-toggle="modal" data-target="#PModal" class="cookie-btn myBtn"><spring:message code="label.policy_moreinfo" /></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="cookies_part_confirmed fixedClr">
		<div class="">
			<div class="row">
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<p class="cookie_txt"><spring:message code="label.cookie_acceptencess" /></p>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="btnset">
						<a id="hidewindow" class="cookie-btn myBtn"><spring:message code="label.cookie_hide" /></a> <a id="more_info"
							data-toggle="modal" data-target="#PModal" class="cookie-btn myBtn"><spring:message code="label.cookie_more" /></a>
					</div>
				</div>
			</div>
		</div>
	</div> --%> 

<!-- Modal -->
<div class="modal fade" id="PModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog ">
		<!-- Modal content-->
		<div class="modal-content paddforprint">
			<div class="modal-header model-header-background">
				
				<button type="button" class="close no-print" title="close" data-dismiss="modal"><spring:message code="label.x" /></button>
				<div class="logo_pop">
					<img src="<%=appUrl %>/images/logo_inner.png" width="100">
				</div>
			</div>
			<div class="modal-body print_body model-body-custom">
				<p class="boldtxt"><spring:message code="label.1" /><spring:message code="label.introduction" /></p>
				<ul>
					<li><p class="sub-cat-id"><spring:message code="label.1.1" /></p>
						<p class="sub-cat-txt"><spring:message code="label.introduction_1_1" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.1.2" /></p>
						<p class="sub-cat-txt"><spring:message code="label.introduction_1_2" /></p></li>
				</ul>

				<p class="boldtxt"><spring:message code="label.2" /><spring:message code="label.scope" /></p>
				<ul>
					<li><p class="sub-cat-id"><spring:message code="label.2.1" /></p>
						<p class="sub-cat-txt"><spring:message code="label.scope_2_1" /></p></li>
				</ul>
				<ul>
					<li><p class="sub-cat-id"><spring:message code="label.2.2" /></p>
						<p class="sub-cat-txt"><spring:message code="label.scope_2_2" /> (<a href="https://drysign.exelatech.com/"><spring:message code="label.httpDrysignExelatech" /></a>) <spring:message code="label.scope_2_2_continue" /></p></li>
				</ul>
				<p class="boldtxt"><spring:message code="label.3" /><spring:message code="label.cpi" /></p>
				<ul>
					<li><p class="sub-cat-id"><spring:message code="label.3.1" /></p>
						<p class="sub-cat-txt"><spring:message code="label.cpi_3_1" /></p>
						<ul>
							<li><p class="sub-cat-id"><spring:message code="label.a" /></p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_a" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.b" /></p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_b" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.c" /></p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_c" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.d" /></p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_d" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.e" /></p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_e" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.f" /></p>
								<p class="sub-cat-txt"><spring:message code="label.cpi_3_1_f" /></p></li>
						</ul>
					</li>
					<li><p class="sub-cat-id"><spring:message code="label.3.2" /></p>
						<p class="sub-cat-txt"><spring:message code="label.cpi_3_2" /></p></li>
				</ul>
				<p class="boldtxt"><spring:message code="label.4" /><spring:message code="label.upi" /></p>
				<ul>
					<li><p class="sub-cat-id"><spring:message code="label.4.1" /></p>
						<p class="sub-cat-txt"><spring:message code="label.upi_4_1" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.4.2" /></p>
						<p class="sub-cat-txt"><spring:message code="label.upi_4_2" /></p>
						<ul>
							<li><p class="sub-cat-id"><spring:message code="label.a" /></p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_a" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.b" /></p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_b" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.c" /></p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_c" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.d" /></p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_d" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.e" /></p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_e" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.f" /></p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_f" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.g" /></p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_g" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.h" /></p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_h" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.i" /></p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_i" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.j" /></p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_j" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.k" /></p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_k" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.l" /></p>
								<p class="sub-cat-txt"><spring:message code="label.upi_4_2_l" /></p></li>
						</ul></li>
					<li><p class="sub-cat-id"><spring:message code="label.4.3" /></p>
						<p class="sub-cat-txt"><spring:message code="label.upi_4_3" /></p></li>
				</ul>
				<p class="boldtxt"><spring:message code="label.5" /><spring:message code="label.lbp" /></p>
				<ul>
					<li><p class="sub-cat-id"><spring:message code="label.5.1" /></p>
						<p class="sub-cat-txt"><spring:message code="label.lbp_5_1" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.5.2" /></p>
						<p class="sub-cat-txt"><spring:message code="label.lbp_5_2" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.5.3" /></p>
						<p class="sub-cat-txt"><spring:message code="label.lbp_5_3" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.5.4" /></p>
						<p class="sub-cat-txt"><spring:message code="label.lbp_5_4" /></p></li>
				</ul>
				<p class="boldtxt"><spring:message code="label.6" /><spring:message code="label.olbi" /></p>
				<ul>
					<li><p class="sub-cat-id"><spring:message code="label.6.1" /></p>
						<p class="sub-cat-txt"><spring:message code="label.olbi_6_1" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.6.2" /></p>
						<p class="sub-cat-txt"><spring:message code="label.olbi_6_2" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.6.3" /></p>
						<p class="sub-cat-txt"><spring:message code="label.olbi_6_3" /></p></li>
					
				</ul>
				<p class="boldtxt"><spring:message code="label.7" /><spring:message code="label.dpi" /></p>
				<ul>
					<li><p class="sub-cat-id"><spring:message code="label.7.1" /></p>
						<p class="sub-cat-txt"><spring:message code="label.dpi_7_1" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.7.2" /></p>
						<p class="sub-cat-txt"><spring:message code="label.dpi_7_2" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.7.3" /></p>
						<p class="sub-cat-txt"><spring:message code="label.dpi_7_3" /></p>
						<ul>
							<li><p class="sub-cat-id"><spring:message code="label.a" /></p>
								<p class="sub-cat-txt"><spring:message code="label.dpi_7_3_a" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.b" /></p>
								<p class="sub-cat-txt"><spring:message code="label.dpi_7_3_b" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.c" /></p>
								<p class="sub-cat-txt"><spring:message code="label.dpi_7_3_c" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.d" /></p>
								<p class="sub-cat-txt"><spring:message code="label.dpi_7_3_d" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.e" /></p>
								<p class="sub-cat-txt"><spring:message code="label.dpi_7_3_e" /></p></li>
						</ul></li>
					<li><p class="sub-cat-id"><spring:message code="label.7.4" /></p>
						<p class="sub-cat-txt"><spring:message code="label.dpi_7_4" /></p></li>
				</ul>
				<p class="boldtxt"><spring:message code="label.8" /><spring:message code="label.idt" /></p>
				<ul>
					<li><p class="sub-cat-id"><spring:message code="label.8.1" /></p>
						<p class="sub-cat-txt"> <spring:message code="label.idt_8_1" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.8.2" /></p>
						<p class="sub-cat-txt"><spring:message code="label.idt_8_2" /></p></li>
				</ul>
				<p class="boldtxt"><spring:message code="label.9" /><spring:message code="label.rpi" /></p>
				<ul>
					<li><p class="sub-cat-id"><spring:message code="label.9.1" /></p>
						<p class="sub-cat-txt"><spring:message code="label.rpi_9_1" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.9.2" /></p>
						<p class="sub-cat-txt"><spring:message code="label.rpi_9_2" /> <b><spring:message code="label.rpi_9_2_c" /></b></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.9.3" /></p>
						<p class="sub-cat-txt"><spring:message code="label.rpi_9_3" /></p>
						<ul>
							<li><p class="sub-cat-id"><spring:message code="label.a" /></p>
								<p class="sub-cat-txt"><spring:message code="label.rpi_9_3_a" /> <b><spring:message code="label.rpi_9_2_c" /></b></p></li>
						</ul></li>
					<li><p class="sub-cat-id"><spring:message code="label.9.4" /></p>
						<p class="sub-cat-txt"><spring:message code="label.rpi_9_4" /> </p>
						<ul>
							<li><p class="sub-cat-id"><spring:message code="label.a" /></p>
								<p class="sub-cat-txt"><spring:message code="label.rpi_9_4_a" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.b" /></p>
								<p class="sub-cat-txt"><spring:message code="label.rpi_9_4_b" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.c" /></p>
								<p class="sub-cat-txt"><spring:message code="label.rpi_9_4_c" /></p></li>
						</ul></li>
				</ul>
				<p class="boldtxt"><spring:message code="label.10" /><spring:message code="label.spi" /></p>
				<ul>
					<li><p class="sub-cat-id"><spring:message code="label.10.1" /></p>
						<p class="sub-cat-txt"><spring:message code="label.spi_10_1" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.10.2" /></p>
						<p class="sub-cat-txt"><spring:message code="label.spi_10_2" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.10.3" /></p>
						<p class="sub-cat-txt"><spring:message code="label.spi_10_3" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.10.4" /></p>
						<p class="sub-cat-txt"><spring:message code="label.spi_10_4" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.10.5" /></p>
						<p class="sub-cat-txt"><spring:message code="label.spi_10_5" /></p></li>	
				</ul>
				<p class="boldtxt"><spring:message code="label.11" /><spring:message code="label.amendment" /></p>
				<ul>
					<li><p class="sub-cat-id"><spring:message code="label.11.1" /></p>
						<p class="sub-cat-txt"><spring:message code="label.amendment_11_1" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.11.2" /></p>
						<p class="sub-cat-txt"><spring:message code="label.amendment_11_2" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.11.3" /></p>
						<p class="sub-cat-txt"><spring:message code="label.amendment_11_3" /></p></li>
				</ul>
				<p class="boldtxt"><spring:message code="label.12" /><spring:message code="label.uright" /></p>
				<ul>
					<li><p class="sub-cat-id"><spring:message code="label.12.1" /></p>
						<p class="sub-cat-txt"><spring:message code="label.uright_12_1" /> <spring:message code="label.1_844_9352832" /> <spring:message code="label.uright_12_1_c" /> (<a href="mailto:drysign.support@exelatech.com"><spring:message code="label.drysign.support" /></a>)</p></li>
					<li><p class="sub-cat-id"><spring:message code="label.12.2" /></p>
						<p class="sub-cat-txt"><spring:message code="label.uright_12_2" /></p>
					<ul>
							<li><p class="sub-cat-id"><spring:message code="label.a" /></p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_a" /></b> <spring:message code="label.uright_12_2_a_c" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.b" /></p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_b" /></b> <spring:message code="label.uright_12_2_b_c" /></p></li>
							<li><p class="sub-cat-id subcatid_css"><spring:message code="label.c" /></p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_c" /></b> <spring:message code="label.uright_12_2_c_c" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.d" /></p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_d" /></b> <spring:message code="label.uright_12_2_d_c" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.e" /></p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_e" /></b> <spring:message code="label.uright_12_2_e_c" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.f" /></p>
								<p class="sub-cat-txt"><b><spring:message code="label.uright_12_2_f" /></b> <spring:message code="label.uright_12_2_f_c" />  <a href="https://ico.org.uk/concerns/"><spring:message code="label.https.ico_ukconcerns" /></a></p></li>
						</ul></li>	
					<li><p class="sub-cat-id"><spring:message code="label.12.3" /></p>
						<p class="sub-cat-txt"><spring:message code="label.uright_12_3" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.12.4" /></p>
						<p class="sub-cat-txt"><spring:message code="label.uright_12_4" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.12.5" /></p>
						<p class="sub-cat-txt"><spring:message code="label.uright_12_5" /></p></li>	
				</ul>

				<p class="boldtxt"><spring:message code="label.13" /><spring:message code="label.ui" /></p>
				<ul>
					<li>
						<p class="sub-cat-id"><spring:message code="label.13.1" /></p><p class="sub-cat-txt"><spring:message code="label.ui_13_1" /> <spring:message code="label.1_844_9352832" /> <spring:message code="label.uright_12_1_c" /> (<a href="mailto:drysign.support@exelatech.com"><spring:message code="label.drysign.support" /></a>)</p></li>
				</ul>	
				<p class="boldtxt"><spring:message code="label.14" /><spring:message code="label.cookie" /></p>
				<ul>
					<li><p class="sub-cat-id"><spring:message code="label.14.1" /></p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_1" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.14.2" /></p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_2" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.14.3" /></p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_3" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.14.4" /></p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_4" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.14.5" /></p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_5" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.14.6" /></p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_6" /></p>
							<table border="1" align="center" id="cookiestbl">
							<tr><th><spring:message code="label.cookie_name" /></th><th><spring:message code="label.cookie_type" /></th><th><spring:message code="label.cookie_des" /></th></tr>
							<tr><td><spring:message code="label.cookie_name_val" /></td><td><spring:message code="label.cookie_type_val" /></td><td><spring:message code="label.cookie_des_val" /></td></tr>
							</table>
					</li>
					<li><p class="sub-cat-id"><spring:message code="label.14.7" /></p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_7" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.14.8" /></p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_8" /></p>
						<ul>
							<li><p class="sub-cat-id"><spring:message code="label.a" /></p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_8_a" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.b" /></p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_8_b" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.c" /></p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_8_c" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.d" /></p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_8_d" /></p></li>
						</ul>
					</li>
					<li><p class="sub-cat-id"><spring:message code="label.14.9" /></p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_9" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.14.10" /></p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_10" /></p></li>
					<li><p class="sub-cat-id"><spring:message code="label.14.11" /></p>
						<p class="sub-cat-txt"><spring:message code="label.cookie_14_11" /></p>
						<ul>
							<li><p class="sub-cat-id"><spring:message code="label.a" /></p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_11_a" /> <a href="http://windows.microsoft.com/en-gb/internet-explorer/delete-manage-cookies#ie=ie-11"><spring:message code="label.http.windows.microsoft" /></a>).</p></li>
							<li><p class="sub-cat-id"><spring:message code="label.b" /></p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_11_b" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.c" /></p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_11_c" /></p></li>
							<li><p class="sub-cat-id"><spring:message code="label.d" /></p>
								<p class="sub-cat-txt"><spring:message code="label.cookie_14_11_d" /></p></li>
						</ul></li>
				</ul>
				<p class="boldtxt"><spring:message code="label.15" /><spring:message code="label.details" /></p>
				<ul>
					<li><p class="sub-cat-id"><spring:message code="label.15.1" /></p>
						<p class="sub-cat-txt"><spring:message code="label.details_15_1" /></p></li>
				</ul>
					
					
			</div>
			<div class="modal-footer">
				<!--          <a title="Download  Privacy Notice" href="#" class="btn btn-default print_term_link no-print" download="">Download</a> -->

			</div>
		</div>
	</div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 


<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="<%=appUrl %>/js/bootstrap.js"></script>
	<script src="<%=appUrl %>/js/responsive-tabs.js"></script>
	<%-- <script src="<%=appUrl %>/js/jquery.flexisel.js"></script> --%>
	<%-- <script src="<%=appUrl %>/js/materialize.js"></script> --%>
	 <script src="<%=appUrl %>/js/jquery.buttonLoader.js"></script>
	 	<script src="<%=appUrl %>/js/nagging-menu.js"></script>
	
<script type="text/javascript">
	
	$(window).on("load", function() {
    var viewportWidth = $(window).width();
    if (viewportWidth < 768) {
		//alert('hi');
          (function($) {
            $(document).ready(function() {
               $(".flexiselDemo3").flexisel({
		
        visibleItems: 1,
        itemsToScroll: 0,         
       autoPlay: {
           enable: true,
            interval: 5000,
            pauseOnHover: true
        }        
    });
            });
         }) (jQuery);
    }
});
	

	
  (function($) {
      fakewaffle.responsiveTabs(['xs', 'sm']);
	  $('#myTab a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
});
  })(jQuery);
	
  

 
  $(document).ready(function() {
  	// store url for current page as global variable
  	current_page = document.location.href
  	//alert(current_page)
  	// apply selected states depending on current page
   	if (current_page.match(/pricing/) || current_page.match(/plans/)  || current_page.match(/checkout/)) 
   	{
   	$("ul#headernavigation li:eq(2)").addClass('active');
   	
   	}else if(current_page.match(/api/)) {
   		$("ul#headernavigation li:eq(3)").addClass('active');
   	}
  });	
  
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
/* 	var alreadystored = false;
	$(window).on("load", function () {  checkCookie() });
	console.log("doc loaded");
	function checkCookie() {
	    var user = getCookie("drysigncookies");
	   // console.log("User " + user);
	    if (user != "") {
	        alreadystored = true;
	        $(".cookies_part").css("display", "none");
	        $(".cookies_part_confirmed").css("display", "none");
	        console.log("Hiding");
	    }
	    else{
	        $(".cookies_part").css("display", "block");
	        $(".cookies_part_confirmed").css("display", "none");
	        console.log("showing");
	    }
	} */

/* 	$(document).ready(function () {
		console.log("doc ready");
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