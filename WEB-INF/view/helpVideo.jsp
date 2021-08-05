<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page import="com.drysign.model.Registration,org.springframework.security.core.context.SecurityContextHolder,org.springframework.security.core.Authentication" %>
<% Authentication auth = SecurityContextHolder.getContext().getAuthentication(); %>
<% Registration registration = (Registration)auth.getPrincipal(); %>
<% 
String port = request.getServerPort()+"";
 if(!port.equals(null) || !port.equals(""))
{
	port = ":" + port;
}
String appUrl = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
String videoPath = request.getScheme() + "://" + request.getServerName() + port + "/DrySign/videos";
%>
<jsp:include page="header.jsp"></jsp:include>
<script src="<%=appUrl %>/js/jsapi.js"></script>
<div id="loader2" class="loader2" style="display:none">
<!-- <img src="route-to-images/blim.gif" class="blimover"> -->
	<div class="loaderdiv">
		 <p><img src="<%=appUrl %>/images/drysign_logo_mono.svg"></p>
		<p><img src="<%=appUrl %>/images/drysign-logo-line_only.gif" ></p> 		
		<p><spring:message code="label.wait"/></p>
	</div>
</div>


  <!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper bg_wrap help_videocss">
	  <div class="container-fluid">
                <!-- breadcrumb -->
                <ol class="breadcrumb">
                <li class="Groupsignhead"><spring:message code="label.help"/> |</li>
                    <li><a href="<%=appUrl %>/app/dashboard"><spring:message code="label.cat_home"/></a></li>
                     <!-- <li><a href="<%=appUrl %>/app/helpTraining">help</a></li>-->
                      <li class="active"><spring:message code="label.training_vid"/> </li>
                </ol>
            </div>
	<!-- Main content -->
		 <div class="container-fluid">
                     		
	            <div class="Content-wh-module col-md-12">
					<div class="responsiveTabs help_restab">
						<ul id="myTab" class="nav nav-tabs help_nav  col-lg-4">
							<li  id="selfsigntab" class="videotab active"><a data-toggle="tab" href="#selfsign" onclick="Change(this,'<%=videoPath %>/DrySign_Self_Sign_New_VO.mp4')"><spring:message code="label.selfsign"/></a></li>
                            <li id="groupsigntab" class="videotab"><a data-toggle="tab"  href="#groupsign" onclick="Change(this,'<%=videoPath %>/DrySign_Group_Sign_New_VO.mp4?preview=true')"><spring:message code="label.grp_sgn"/></a></li>
                            <li id="createtemplatetab" class="videotab"><a data-toggle="tab"  href="#createtemplate" onclick="Change(this,'<%=videoPath %>/DrySign_Template_New_VO.mp4?preview=true')"><spring:message code="label.create_temp"/></a></li>
						</ul>
	
						<div id="myTabContent" class="tab-content col-lg-8 help_nav_tab">
							<div class="tab-pane fade in active">
								 <video id="videoclip" width="100%" controls="true" controlsList="nodownload" oncontextmenu="return false;" autoplay playsinline>
									  <source id="mp4video"  src="<%=videoPath %>/DrySign_Self_Sign_New_VO.mp4?preview=true" type="video/mp4">
									</video> 
									
									<!-- <video id="videoclip" width="100%" controls="true" controlsList="nodownload" oncontextmenu="return false;" autoplay playsinline>
									  <source id="mp4video"  src="https://demo.exelatech.com/sites/default/files/DrySign_Self_Sign_New_V.mp4" type="video/mp4">
									 <source src="https://demo.exelatech.com/sites/default/files/DrySign_Self_Sign_New_V.mp4" type="video/gg">
									</video>  --> 
									
									<!-- <video id="videoclip" width="100%" controls="true" controlsList="nodownload" oncontextmenu="return false;" autoplay playsinline>
									  <source id="mp4video"  src="https://drysign.exelatech.com/videos/DrySign_Template_New_VO.mp4" type="video/mp4">
									 <source src="https://drysign.exelatech.com/videos/DrySign_Template_New_VO.mp4" type="video/gg">
									</video> 
									
									<video id="videoclip" width="100%" controls="true" controlsList="nodownload" oncontextmenu="return false;" autoplay playsinline>
									  <source id="mp4video"  src="<%=appUrl%>/images/videos/DrySign_Template_New_VO.mp4" type="video/mp4">
									 <source src="<%=appUrl%>/images/videos/DrySign_Template_New_VO.mp4"" type="video/gg">
									</video>  --> 
									
												 
							</div>
						</div>
								
					</div>
	        		</div>
	        </div>
 </div>
<jsp:include page="footer.jsp"></jsp:include>
<canvas id='blank' style='display:none'></canvas>
 <div class="overlay-bg"></div>
    <script src="<%=appUrl %>/js/highcharts.js"></script>
    <script src="<%=appUrl %>/js/highcharts-more.js"></script>
    <script src="<%=appUrl %>/js/solid-gauge.js"></script>
    
<script src="<%=appUrl %>/js/custom-file-input.js"></script> 
<script src="<%=appUrl %>/js/jquery.validate.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.12/d3.min.js"></script> 
    <script src="<%=appUrl %>/js/videoPlugin.js"></script>
<script>
function Change(elem, url) {
    var id = $(elem).attr("id");
    $(".videotab").removeClass("active");
    $("#" + id).addClass("active");
    $('#videoclip').get(0).pause();
    $('#mp4video').attr('src', url);
    $('#videoclip').get(0).load();
    $('#videoclip').get(0).play();
}


$(document).ready(function(){
	
	
	var title='${title}';
	if(title=='Help'){
		
		$("#helpSidebar").addClass('active');
	}
	   $('#videoclip').get(0).load();
	    $('#videoclip').get(0).play();
	    var vid=document.getElementById("videoclip")
	    vid.disablePictureInPicture = true
	    //vid.paused = true
  	 	
});

    $(".open-button").click(function() {
	    //alert("timo Pause Video");
	    $('#videoclip').get(0).pause();
	});
	
    function resetForm(){
		//alert("timo Play Video");
		$('#videoclip').get(0).play();
	} 
	
	
	$(".btn.cancel.closeSupport").click(function() {
		//alert("timo Play Video on Close Button");
		$('#videoclip').get(0).play();
	});
	
	$(".fa-info-circle").click(function() {
		//alert("info Pause Video");
		$('#videoclip').get(0).pause();
	});
	
	 $(".close").click(function() {
	     //alert("info Play Video");
	     $('#videoclip').get(0).play();
	 }); 
	 
	 /* function reset(){
		alert("info 2 time play video"); 
		$('#videoclip').get(0).play();
	} */

	 /* $(".closeBtnDiv").click(function() {
		alert("Play Video");
		 $('#videoclip').get(0).play();
		}); */
		
	/* $(".closePopup.closeSupport").click(function() {
		alert("timo Play Video");
		 $('#videoclip').get(0).play();
		}); */ 
		
	 //$( "#googleBtn" ).trigger( "click" );  btn cancel closeSupport
	 
/* function timoIconClick(){
	  debugger
	  console.log('helpVideo::timoptimoScriptPath: On Tiom Icon Click ::Start');
	  //window.open("helpVideo.jsp","_self");
	  $('#videoclip').get(0).pause();
	  console.log('helpVideo::timoptimoScriptPath: On Tiom Icon Click ::Finish');
} */

</script>
    



