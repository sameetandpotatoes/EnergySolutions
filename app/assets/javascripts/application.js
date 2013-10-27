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
//= require turbolinks
//= require_tree .
$(document).ready(function()
{
  $('.carousel').carousel({
    interval: 5000
  });
	var $test2 = $(".test2");
	$(window).scroll(function ()
	{
	  if ($(this).scrollTop() > 300)
	  {
	  		$test2.css("display", "inline");
	      $test2.stop().animate({left: "200px"}, 300);
	  }
	  else
	  {
	      $test2.stop().animate({left: "-90px"}, 300);
	  }
	});
});
