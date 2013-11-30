// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require nprogress.js
//= require unslider.js
//= require knob.js
//= require viewport.min.js
//= require xdomainajax.js

$(document).ready(function()
{
	$('.home').css("display", "none");
	$('.special').css("display", "none");
	$('#content').css("display", "none");
	$('.footer').css("display", "none");
});
$(window).load(function(){
	$('#loading').fadeOut(500);
	$('.home').fadeIn(1000);
	$('#special').fadeIn(1000);
	$('#content').fadeIn(1000);
	$('.footer').fadeIn(1000);
	NProgress.configure({ showSpinner: true });
	NProgress.configure({ ease: 'ease', speed: 1000 });

	$('.imagecarousel').unslider({
		fluid: true,
		dots: true,
		keys: true,
		pause: false
	});
	//End Carousel Scripts

	//Open links in new window
	$("a").click(function() {
    link_host = this.href.split("/")[2];
    document_host = document.location.href.split("/")[2];
    if (link_host != document_host) {
      window.open(this.href);
      return false;
    }
  });
  //End links script
  var links = $('#nav li');
	var sections = $('.section');
	var clicked = false;

  $(".smoothScroll").on("click", function(e) {
	  var $target, target;
	  e.preventDefault();
	  target = this.hash;
	  $target = $(target);
	  return $("html, body").stop().animate({
	    scrollTop: $target.offset().top
	  }, 700, "swing");
	});

	links.click(function() {
		clicked = true;
		$('#nav li.active').removeClass('active');
		$(this).addClass('active');
		$('div.slider').stop().animate({width:($('#nav li.active').offset().left + $('#nav li.active').width()/2 - $('div.slider-holder').offset().left)-50},{duration: 700, queue: false,complete:function(){
			clicked = false;
		}})
	});

	var coordinateArr = [];
  for(var i = 0; i < sections.length; i++){
  	coordinateArr.push($(sections[i]).offset().top);
  };

  $(window).scroll(function(){
  	if (clicked == true){
  		return;
  	}
  	else{
	  	var top = $(window).scrollTop();
	  	for(var i = 0;  i < coordinateArr.length; i++){
	  		if(top >= coordinateArr[coordinateArr.length - 1] - 30){
	  			$('#nav li.active').removeClass('active');
	  			$(links[links.length -1]).addClass('active');
	  		}
	  		if(top >= coordinateArr[i] - 30 && top <= coordinateArr[i+1] + 30){
	  			$('#nav li.active').removeClass('active');
	  			$(links[i]).addClass('active');
	  		};
	  	};
	  	$('div.slider').stop().animate({width:($('#nav li.active').offset().left + $('#nav li.active').width()/2 - $('div.slider-holder').offset().left)-50},{duration: 700, queue: false, complete:function(){
				clicked = false;
			}})
  	}
  });

	$(document).keydown(function(e) {
		if (!e) evt = window.event;
		if (e.keyCode == 39) {
			$('li.active').next().find('>a').trigger('click');
		}
		if (e.keyCode == 37) {
			$('li.active').prev().find('>a').trigger('click');
		}
	})

	//Scroll To Top Script
	$(window).scroll(function(){
		var y = $(window).scrollTop();
		if( y > 500)
			$('#top').fadeIn("slow");
		else
			$('#top').fadeOut("fast");
		if (y > 60)
		{
			$('.nav-holder').css("position", "fixed");
			$('.nav-holder').css("top", "0");
		}
		else
		{
			$('.nav-holder').css("position", "absolute");
			$('.nav-holder').css("top", "60px");
		}
	});


	//End Scroll To Top Script
	$(window).resize(function(){
		carouselFix();
	});

	//Location Script
	$('.special').click(function(){
		var myLoc;
		$('.home').css('opacity', '0.4');
		NProgress.start();
		NProgress.set(0.99);
		var YOUR_KEY = "63bec244efb3cba1a6518814444c0595afca5a68035482dd36d5e68f6d4fa5e7";
		var theURL = "http://api.ipinfodb.com/v3/ip-city/?key=" + YOUR_KEY + "&format=json&callback=?";
		$.ajax({
			type: "POST",
			url: theURL,
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			method: 'GET',

			success: function (data) {
				myLoc = data;
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				myLoc = 'We are unable to determine your location at this time';
			}
		});
		setTimeout(function() {
				NProgress.done();
				window.location.href = "/view?state="+myLoc.regionName+"&city="+myLoc.cityName+"&zip="+myLoc.zipCode+"&lat="+myLoc.latitude+"&long="+myLoc.longitude;
			}, 1000);
	});
});
function nonEnergyLinks(){
	return window.location.pathname == "/contact/" || window.location.pathname =="/about/";
}

function home(){
	return window.location.pathname =="/";
}
function carouselFix(){
	$('.imagecarousel ul li').css("width",$(window).width());
	$('.imagecarousel ul li').css("min-height",$(window).height());
}
