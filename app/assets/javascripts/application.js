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
//= require bootstrap

$(document).ready(function()
{
  $('.carousel').carousel({
    interval: 5000
  });

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
	   //$('#top').css("display", "block");
	   $('#top').fadeIn("slow");
	  } else{
	  	$('#top').fadeOut("fast");
	  }
	 });
	 $(document).scroll(function()
	 {
    if ($(this).scrollTop() > $('#firstPage').innerHeight())
    {

    }
		});
	if (window.location.pathname == "/contact/" || window.location.pathname =="/about/" || window.location.pathname == "/compare/")
	{
		$('.menu').css("display", "none");
	}
	function temp(form)
	{
		var Energy = parseFloat(form.KWHM.value);
		var Percentage = parseFloat(form.PercentageSolar.value);
		var SunHours = parseFloat(form.PeakSunHours.value);
		var SystemRaw=0;
		var System = 0;
		var FirstStep=0
		FirstStep=((Energy*1000)*(.01*Percentage))/30;
		SystemRaw = (FirstStep/SunHours);
		System=parseInt(SystemRaw);
		form.SystemSize.value = System;
	}
})
