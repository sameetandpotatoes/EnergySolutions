# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require nprogress.js
#= require unslider.js
#= require knob.js
#= require viewport.min.js
#= require xdomainajax.js
#= require scroll

nonEnergyLinks = ->
  window.location.pathname is "/sources/" or window.location.pathname is "/about/"
home = ->
  window.location.pathname is "/"
carouselFix = ->
  $(".imagecarousel ul li").css "width", $(window).width()
  $(".imagecarousel ul li").css "min-height", $(window).height() - 70

$(document).ready ->
  $(".home").css "display", "none"
  $("#content").css "display", "none"
  $(".footer").css "display", "none"

$(window).load ->
  $("#loading").fadeOut 500
  $(".home").fadeIn 1500
  $("#content").fadeIn 1500
  $(".footer").fadeIn 1500
  carouselFix()
  NProgress.configure showSpinner: true
  NProgress.configure
    ease: "ease"
    speed: 1000

  $(".imagecarousel").unslider
    fluid: true
    dots: true
    keys: true
    pause: false

  $("a").click ->
    link_host = @href.split("/")[2]
    document_host = document.location.href.split("/")[2]
    unless link_host is document_host
      window.open @href
      false

  $(window).resize ->
    carouselFix()

  $(".special").click ->
    myLoc = undefined
    $(".home").css "opacity", "0.4"
    NProgress.start()
    NProgress.set 0.99
    YOUR_KEY = "63bec244efb3cba1a6518814444c0595afca5a68035482dd36d5e68f6d4fa5e7"
    theURL = "http://api.ipinfodb.com/v3/ip-city/?key=" + YOUR_KEY + "&format=json&callback=?"
    $.ajax
      type: "POST"
      url: theURL
      contentType: "application/json; charset=utf-8"
      dataType: "json"
      method: "GET"
      success: (data) ->
        myLoc = data

      error: (XMLHttpRequest, textStatus, errorThrown) ->
        myLoc = "We are unable to determine your location at this time."

    setTimeout (->
      NProgress.done()
      window.location.href = "/view?state=" + myLoc.regionName + "&city=" + myLoc.cityName + "&zip=" + myLoc.zipCode + "&lat=" + myLoc.latitude + "&long=" + myLoc.longitude
    ), 500

