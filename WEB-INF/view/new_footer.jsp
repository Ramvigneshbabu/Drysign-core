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
<style>
.footer-links{
float:right;
margin-bottom:10px}
</style>
 <footer class="container-fluid site-footer">

            <div class="row">
                <div class="layout-container">
                    <div>
                        <div class="col-md-12 col-sm-12 top">
                            <div>
                                <span class="footerlinks">
                                <div class="region region-footer">
                                    <section class="footermap footermap--footermap_block col-md-7 col-sm-12 col-xs-12 block block-footermap block-footermap-block clearfix"
                                        id="block-footermap">
                                        <nav class="footermap-col footermap-col--1 footermap-col--sitemap">                                            
                                            <ul class="footermap-header footermap-header--sitemap">
                                                <li
                                                    class="footermap-item footermap-item--depth-1 footermap-item--haschildren">
                                                    <a href="https://www.exelatech.com/"  target="_blank" title="Discover"><spring:message code="label.discover" /></a>
                                                    <ul>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/digital-now"  target="_blank" title="Digital Now"><spring:message code="label.digital" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/smart-office" target="_blank" title="Exela Smart office"><spring:message code="label.soffice" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/innovation-centers" title="" target="_blank" ><spring:message code="label.innovation" /></a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li
                                                    class="footermap-item footermap-item--depth-1 footermap-item--haschildren">
                                                    <a href="https://www.exelatech.com/"  target="_blank" title="RESOURCES"><spring:message code="label.resources" /></a>
                                                    <ul>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/press-releases" target="_blank" title="News"><spring:message code="label.news" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/case-studies"  target="_blank" title="Case Studies"><spring:message code="label.cstudes" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/whitepapers" title="Whitepapers" target="_blank" ><spring:message code="label.wpapper" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/events" title="Events" target="_blank" ><spring:message code="label.event" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/faq" title="FAQ" target="_blank"><spring:message code="label.faq" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/blog" title="Blog" target="_blank" ><spring:message code="label.blg" /></a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li
                                                    class="footermap-item footermap-item--depth-1 footermap-item--haschildren">
                                                    <a href="https://www.exelatech.com/" title="Company" target="_blank" ><spring:message code="label.cmp" /></a>
                                                    <ul>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/about-us" title="About Us" target="_blank"  ><spring:message code="label.abt" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/contact-us" title="contact Us" target="_blank" ><spring:message code="label.contus" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/leadership-team" title="Leadership" target="_blank" ><spring:message code="label.leadership" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://investors.exelatech.com/"
                                                                title="Investors" target="_blank" ><spring:message code="label.investors" /></a>
                                                        </li>
                                                        <li class="footermap-item--depth-2">
                                                            <a href="https://www.exelatech.com/careers" title="Careers" target="_blank" ><spring:message code="label.crier" /></a>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </nav>
                                    </section>
                                    <section class="simplenews-subscriptions-block-61ace98f-d6b1-4aaa-8590-84bdaec6e04e simplenews-subscriber-form col-md-4 col-sm-12 col-xs-12 block block-simplenews block-simplenews-subscription-block clearfix"
                                        data-drupal-selector="simplenews-subscriptions-block-61ace98f-d6b1-4aaa-8590-84bdaec6e04e"
                                        id="block-simplenewssubscription">
                                        <form >
                                            <div class="form-wrapper"
                                                
                                                id="edit-subscriptions-wrapper"></div>
                                            <div id="edit-message--2"
                                                class="form-item js-form-item form-type-item js-form-type-item form-item-message js-form-item-message form-no-label form-group">
                                               <spring:message code="label.subs-para" />
                                            </div>
                                            <div class="text-left bottom-20">
                            					<a href="https://www.exelatech.com/pluggedin" target="_blank"><button type="button" class="btn btn-primary subscribeclass"><spring:message code="label.subs-now" /></button></a>
                        					</div>                                            
                        					
                        					<!-- <input autocomplete="off"
                                               
                                                type="hidden" name="form_build_id"
                                                value="form-L5v2clsmeI6xwKE0isO7mcTcYkvG2o8kaZWVArtEQsI" />
                                            <input
                                             
                                                type="hidden" name="form_id"
                                                value="simplenews_subscriptions_block_61ace98f-d6b1-4aaa-8590-84bdaec6e04e" />
                                            <div class="field--type-email field--name-mail field--widget-email-default form-group js-form-wrapper form-wrapper"
                                               >-->
                                                <div class="form-item js-form-item form-type-email js-form-type-email form-item-mail-0-value js-form-item-mail-0-value form-group">
                                                    
                                                   <!--  <input 
                                                        class="form-email required form-control" type="email"
                                                        id="edit-mail-0-value" name="mail[0][value]" value="" size="60"
                                                        maxlength="254" placeholder="Enter your email address..."
                                                        required="required" aria-required="true"
                                                        title=""
                                                        data-toggle="tooltip" / > -->
                                                </div>
                                                <!--  <input class="form-email required form-control subscribeEmail" type="email" id="subscribeEmail" value="" size="60" maxlength="254" placeholder="Enter your email address..." required="required" aria-required="true" title="" data-toggle="tooltip" data-original-title="The subscriber's email address.">
                                                <button class="button js-form-submit form-submit btn-default btn" type="submit" id="edit-subscribe" name="op" value="Subscribe">Subscribe</button>-->
                                            </div>
                                        </form>
                                    </section>
                                </div>
                            </span>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 bottom">
                            <div>
                                <span class="copy-right-block">
                                <div class="region region-footer-second">
                                    <section id="block-copyrightblock"
                                        class="pull-left col-md-4 col-sm-12 col-xs-12 block block-block-content block-block-contentdc2e2dce-7814-4126-8b6d-0e700bd17b9d clearfix">
                                        <div
                                            class="field field--name-body field--type-text-with-summary field--label-hidden field--item">
                                                                              <div class="copyright">
		&copy; <script>document.write(new Date().getFullYear())</script> <spring:message code="label.company"/>
	</div>
                                        </div>
                                    </section>
                                    <section id="block-socialmediablock-4"
                                        class="pull-right col-md-8 col-sm-12 col-xs-12 block block-block-content block-block-content85f48d65-eb86-406c-a8de-2ed07e5d73ec clearfix">
                                        <div
                                            class="field field--name-body field--type-text-with-summary field--label-hidden field--item">
                                            <div class="footer-text">
                                                <div class="social">
                                                    <div class="social-share">
                                                        <section class="social-share-block">
                                                            <a class="social-share-instagram"
                                                                href="https://www.instagram.com/exelatechnologies/"  target="_blank" title="Instagram"><spring:message code="label.insta"/></a>
                                                            <a class="social-share-twitter"
                                                                href="https://twitter.com/exelatech" target="_blank"
                                                                title="Twitter"><spring:message code="label.Twitter"/></a>
                                                            <a class="social-share-linkedin"
                                                                href="https://www.linkedin.com/company/11174620" target="_blank" title="LinkedIn"><spring:message code="label.linkedIn"/></a>
                                                              <a class="social-share-facebook"
                                                                href="https://www.facebook.com/exelatechnologies" target="_blank" title="FaceBook"><spring:message code="label.fb"/></a>
                                                            <a class="social-share-youtube"
                                                                href="https://www.youtube.com/channel/UCAzeSD5qZ-5gXotIQxkHWDg" target="_blank" title="Youtube"><spring:message code="label.uTube"/></a>
                                                        </section>
                                                    </div>
                                                </div>
                                                <div class="footer-links">
                                                    <a href="https://www.exelatech.com/sitemap" target="_blank"><spring:message code="label.sitemap" /></a>
                                                    <a href="https://www.exelatech.com/privacy-policy" target="_blank"><spring:message code="label.policy" /></a>
                                                    <a href="https://www.exelatech.com/terms" target="_blank"><spring:message code="label.tems" /></a>
                                                    <a href="https://www.exelatech.com/security-compliance" target="_blank"><spring:message code="label.security" /></a>
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
         

		
			<div class="cookies_part fixedClr" style="padding-left:10px;display:none">
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
	
	

			
			<div class="cookies_part_confirmed fixedClr" style="display:none">
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
	

<!-- Modal -->
<div class="modal fade" id="PModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog ">
		<!-- Modal content-->
		<div class="modal-content paddforprint">
			<div class="modal-header model-header-background">
				
				<button type="button" class="close no-print" title="close" data-dismiss="modal">x</button>
				<div class="logo_pop">
					<img src="<%=appUrl %>/images/logo_inner.png" width="100">
				</div>
			</div>
			<div class="modal-body print_body model-body-custom">
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

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 


<!-- Include all compiled plugins (below), or include individual files as needed --> 

	<script src="<%=appUrl %>/js/responsive-tabs.js"></script>
	<%-- <script src="<%=appUrl %>/js/jquery.flexisel.js"></script> --%>
	<%-- <script src="<%=appUrl %>/js/materialize.js"></script> --%>
	
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
	var alreadystored = false;
	$(window).on("load", function () {  checkCookie() });
	console.log("doc loaded");
	function checkCookie() {
	    var user = getCookie("drysigncookies");
	    //console.log("User " + user);
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
	}

	$(document).ready(function () {
		checkCookie();
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
	})


</script>
</body>
</html>