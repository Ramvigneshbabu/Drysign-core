$(function(){
	$(".cookies_part_confirmed").css("display","none");
})

$(function(){	
	function loadCookies() {
	    alert("Cookies is loaded");
	}
	
	$(".btn-buy").on("click",function(event) {
		window.location.href="bill_payment.html";
	});	

	$('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
		$('html, body').stop().animate({
			scrollTop: ($($anchor.attr('href')).offset().top-70)
		}, 1000, 'easeInOutExpo');
		event.preventDefault();
		$(".nav li a").removeClass("selected");
		$(this).addClass("selected");
    });
		
	$('.solgan-window').addClass("animated fadeInLeft");
	$('.top-right-img').addClass("animated zoomIn");	
	
	function setCookie(cname,cvalue,exdays) {
		var d = new Date();
		d.setTime(d.getTime() + (exdays*24*60*60*1000));
		var expires = "expires=" + d.toGMTString();
		document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
	}

	function getCookie(cname) {
		var name = cname + "=";
		var decodedCookie = decodeURIComponent(document.cookie);
		var ca = decodedCookie.split(';');
		for(var i = 0; i < ca.length; i++) {
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
	
	function checkCookie() {
		var user=getCookie("drysigncookies");
		if (user != "") {			
			alreadystored = true;			
		}
		if (!user) {
	        $(".cookies_part").css("display", "block");
	    }		
		var hidecookie =getCookie("drysigncookieshide");			
		if (!hidecookie && user) {
			$(".cookies_part_confirmed").css("display", "block");
		}	
	}	
	
	window.onload = checkCookie;
	
	$("#accecpt_cookies").click(function(){
		setCookie("drysigncookies", "true", 30);
		$(".cookies_part").css("display","none");
		$(".cookies_part_confirmed").css("display", "block");
	//	$(".cookies_part_confirmed").slideToggle();
	});
	
	$("#no_give_me_more").click(function(){
		window.location.href="#";
	});
	
	$("#more_info").click(function(){
		window.location.href="#";
	});
	
	$("#hidewindow").click(function(){
		setCookie("drysigncookieshide", "true", 30);
		$(".cookies_part_confirmed").css("display","none");
	});
	
	
	/*$('.scrollup').click(function(){
		$("html, body").animate({ scrollTop: 0 }, 600);
			return false;
	});
	
	$('.scrollup').fadeOut();
	$(window).scroll(function(){
		if ($(this).scrollTop() > 100) {
			$('.scrollup').fadeIn();
			} else {
			$('.scrollup').fadeOut();
		}
	});
	*/
	$(window).scroll(function() {
		if($(window).scrollTop() + $(window).height() > $(document).height() - 100 && scrollStatus) {
			$(".cookies_part").css("display","none");
		}else{
			var user=getCookie("drysigncookies");
			if (!user) {			
				$(".cookies_part").css("display","block");		
			}
		}
		
		if ($(window).scrollTop() + $(window).height() > $(document).height() - 100 && scrollStatus) {			
	     //  $(".cookies_part_confirmed").css("display", "none");
	    } else {
			var accecpt =getCookie("drysigncookies");
	        var hidecookie =getCookie("drysigncookieshide");			
	        if (!hidecookie && accecpt) {
	            $(".cookies_part_confirmed").css("display", "block");
	        }
	    }
			
		if($(this).width()<768){
			$("#custom_carousel .controls").niceScroll();
			//$("#custom_carousel .img-holders").niceScroll();
		}else {
			$("#custom_carousel .controls").getNiceScroll().remove();
			//$("#custom_carousel .img-holders").getNiceScroll().remove();
		}
		/*if($(this).scrollTop()< ($("#topnav").height()+$("#intro").height()+$("#option").height())) {
			$(".navigation li").removeClass("current");
		}
		if($(this).scrollTop()>= $("#option").offset().top || $(this).scrollTop()> $("#topnav").offset().top || $(this).scrollTop()==0) {
			$(".nav li a").removeClass("selected");
		}
		if($(this).scrollTop()>= $("#services").offset().top-100) {
			$(".nav li a").removeClass("selected");
			$("#features_id").addClass("selected");
		}
		if($(this).scrollTop()>= $("#support").offset().top-100) {
			$(".nav li a").removeClass("selected");
			$("#support_id").addClass("selected");
		}
		if($(this).scrollTop()>= $("#about").offset().top-250) {
			$(".nav li a").removeClass("selected");
			$("#about_id").addClass("selected");
		}
		*/		
		if($(this).scrollTop()> 0) {
			$("#custom_carousel").carousel("pause");
			$("#topnav").addClass('fixedClr').fadeIn('slow');
			//$("#topnav").addClass('fixed').fadeIn('slow');
			$(".fixed").animate(function(){$(this).css("opacity","1");},500);
			//$(".breadcram-loc").css("padding-top", $("#topnav").height()+90);
		} else {
			$( "#topnav").removeClass('fixedClr').fadeIn('slow');
			//$( "#topnav").removeClass('fixed').fadeIn('slow');
			$(".fixed").animate(function(){$(this).css("opacity","0");},500);
			//$(".breadcram-loc").css("padding-top", "");
		}
		
		if(($("#overview").offset().top-600) < $(this).scrollTop()){
			$("#custom_carousel").carousel("pause");
			if(!$("#overview").hasClass("animate")){
				$("#overview").find(".headtitle").addClass("animated fadeInUp");
				$("#overview").find(".subtext").addClass("animated fadeInLeft");
				$("#pmc").find("img").addClass("animated zoomIn");
			}
		}
		
		if(($("#features").offset().top-550) < $(this).scrollTop()){
			$("#custom_carousel").carousel("cycle");
			if(!$("#features").hasClass("animate")){
				$("#features").find(".headtitle").addClass("animated fadeInUp");
				$("#features").find(".subheader").addClass("animated fadeInRight");
				$("#features").find(".subtext").addClass("animated fadeInLeft");
			}
		}
		
		if(($("#pmc").offset().top-450) < $(this).scrollTop()){
			$("#custom_carousel").carousel("pause");
			if(!$("#pmc").hasClass("animate")){
				$("#pmc").find(".subheader").addClass("animated fadeInRight");
				$("#pmc").find("img").addClass("animated zoomIn");				
				$("#pmc").find(".pmc-ul").addClass("animated fadeInUp");				
			}
		}
		
		if(($("#timetracking").offset().top-600) < $(this).scrollTop()){
			$("#custom_carousel").carousel("pause");
			if(!$("#timetracking").hasClass("animate")){
				$("#timetracking").find(".subheader").addClass("animated fadeInRight");
				$("#timetracking").find(".subtext").addClass("animated fadeInUp");
				$("#timetracking").find("img").addClass("animated zoomIn");				
				$("#timetracking").find(".timetracking-ul").addClass("animated fadeInLeft");				
			}
		}
		
		if(($("#intergration").offset().top-600) < $(this).scrollTop()){
			$("#custom_carousel").carousel("pause");
			if(!$("#intergration").hasClass("animate")){
				$("#intergration").find(".subheader").addClass("animated fadeInUp");
				$("#intergration").find(".subtext").addClass("animated fadeInUp");
				$("#intergration").find("img").addClass("animated zoomIn");				
			}
		}
		
		if(($("#aboutus").offset().top-500) < $(this).scrollTop()){
			$("#custom_carousel").carousel("pause");
			if(!$("#aboutus").hasClass("animate")){
				$("#aboutus").find(".headtitle").addClass("animated fadeInUp");
				$("#aboutus").find(".subtext").addClass("animated fadeInRight");
			}
		}
		
		if(($("#adminsec").offset().top-500) < $(this).scrollTop()){
			$("#custom_carousel").carousel("pause");
			if(!$("#adminsec").hasClass("animate")){
				$("#adminsec").find(".subheader").addClass("animated fadeInUp");
				$("#adminsec").find(".block1").addClass("animated zoomIn");
			}
		}
		
		if(($("#contact").offset().top-400) < $(this).scrollTop()){
			$("#custom_carousel").carousel("pause");
			if(!$("#contact").hasClass("animate")){
				$("#contact").find(".subheader").addClass("animated fadeInUp");
				$("#contact").find(".contact-txtbox").addClass("animated fadeInUp");
				$("#contact").find(".btn-send").addClass("animated fadeInRight");
			}
		}
		/*
		if(($("#join").offset().top-450) < $(this).scrollTop()){
			if(!$("#join").hasClass("animate")){
				$("#join").find(".beats_txt6_head").addClass("animated fadeInUp");
				$("#join").find(".email-signup").addClass("animated fadeInUp");				
			}
		}
		*/
		if(($(".verybottom").offset().top-600) < $(this).scrollTop()){
			$("#custom_carousel").carousel("pause");
			if(!$(".verybottom").hasClass("animate")){
				$(".verybottom").find(".beats-black").addClass("animated fadeIn");
				$(".verybottom").find(".bottommenu").addClass("animated fadeIn");
				$(".verybottom").find(".social").addClass("animated rubberBand");
			}
		}
	});
});