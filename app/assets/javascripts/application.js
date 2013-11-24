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
//= require bootstrap-slider.js
//= require unslider.js
//= require knob.js
//= require xdomainajax.js

$(document).ready(function()
{
	$('.home').css("display", "none");
	$('#content').css("display", "none");
	$('.footer').css("display", "none");
});
$(window).load(function(){
	$('#loading').css("display","none");
	$('.home').fadeIn(1500);
	$('#content').fadeIn(1500);
	$('.footer').fadeIn(1500);

	NProgress.configure({ showSpinner: true });
	NProgress.configure({ ease: 'ease', speed: 1000 });
	$('.imagecarousel').unslider({
		fluid: true,
		dots: true,
		keys: true,
		speed: 500
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
			}, 4000);
	});
	//End Location Script
	$(document).scroll(function()
	{
		if (isScrolledIntoView('#secondPage'))
		{
		}
	});

	if (nonEnergyLinks())
		$('.menu').css("display", "none");
});
function isScrolledIntoView(elem)
{
    var docViewTop = $(window).scrollTop();
    var docViewBottom = docViewTop + $(window).height();

    var elemTop = $(elem).offset().top;
    var elemBottom = elemTop + $(elem).height();

    return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));

}
function nonEnergyLinks()
{
	return window.location.pathname == "/contact/" || window.location.pathname =="/about/" || window.location.pathname == "/compare/";
}
