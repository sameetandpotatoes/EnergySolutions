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
//= require bootstrap.min.js

$(document).ready(function()
{
	$('#carousel').carousel({
		interval: 5000,
		pause: "false"
	});
	$('.carouselimg').css("width", $(window).width());
	$('.carouselimg').css("height", ($(window).height() - $('header').height()) - $('#cssmenu').height());
	$(".smoothScroll").on("click", function(e) {
	  var $target, target;
	  e.preventDefault();
	  target = this.hash;
	  $target = $(target);
	  return $("html, body").stop().animate({
	    scrollTop: $target.offset().top
	  }, 1000, "swing");
	});
	$(window).scroll(function(){
	// get the height of #wrap
	var y = $(window).scrollTop();
	if( y > 500)
	{
	 $('#top').fadeIn("slow");
	}
	else{
		$('#top').fadeOut("fast");
	}
	});
	$(document).scroll(function()
	{
		if ($(this).scrollTop() > $('#firstPage').innerHeight())
		{

		}
	});
	$(window).resize(function(){
		$('.carouselimg').css("width", $(window).width());
		$('.carouselimg').css("height", $(window).height() - $('header').height() - $('#cssmenu').height());
	})
	if (window.location.pathname == "/")
	{
		$('body').css("overflow", "auto");
	}
	if (window.location.pathname == "/contact/" || window.location.pathname =="/about/" || window.location.pathname == "/compare/")
	{
		$('.menu').css("display", "none");
	}
})
