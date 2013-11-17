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
	//Range Slider
	// $('#slider').editRangeSlider();
	//End Range Slider
	//Carousel Scripts
	$('#carousel').carousel({
		interval: 5000,
		pause: "false"
	});
	homePageCheck();
	$(window).resize(function(){
		homePageCheck();
	})
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

  //Pagination Script
	$(".smoothScroll").on("click", function(e) {
	  var $target, target;
	  e.preventDefault();
	  target = this.hash;
	  $target = $(target);
	  return $("html, body").stop().animate({
	    scrollTop: $target.offset().top
	  }, 1000, "swing");
	});
	//End Pagination Script

	//Scroll To Top Script
	$(window).scroll(function(){
		var y = $(window).scrollTop();
		if( y > 500)
			$('#top').fadeIn("slow");
		else
			$('#top').fadeOut("fast");
	});
	//End Scroll To Top Script
	//Location Script
	$('.special').click(function(){
		var myLoc;
		$('.home').css('opacity', '0.4');
		$('.gif').css("display", "block");
		$('.carousel').carousel('pause');
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
				$('.gif').css("display", "none");
				$('.home').css('opacity', '1.0');
				var url ='/view_personalized_results/';
				$.ajax({
						type: "POST",
						url: "/view_personalized_results/",
						data: myLoc,
				});
				window.location.href = url;
			}, 4000);
	});
	//End Location Script
	$(document).scroll(function()
	{
		if ($(this).scrollTop() > $('#firstPage').innerHeight())
		{

		}
	});

	if (nonEnergyLinks())
		$('.menu').css("display", "none");
})
function nonEnergyLinks()
{
	return window.location.pathname == "/contact/" || window.location.pathname =="/about/" || window.location.pathname == "/compare/";
}
function homePageCheck()
{
	$('.carouselimg').css("width", $(window).width());
	var height = $(window).height() - $('header').height() - $('#cssmenu').height();
	if ($(window).height() < 150)
	{
		height = $(document).height() + $('header').height();
	}
	$('.carouselimg').css("height", height);
	if (window.location.pathname == "/" && $(window).height() > 400)
		$('body').css("overflow", "hidden");
	else
	{
		$('body').css("overflow-x", "hidden");
		$('body').css("overflow-y", "auto");
	}
}
