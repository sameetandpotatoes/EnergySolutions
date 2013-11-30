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

nonEnergyLinks = ->
  window.location.pathname is "/contact/" or window.location.pathname is "/about/"
home = ->
  window.location.pathname is "/"
carouselFix = ->
  $(".imagecarousel ul li").css "width", $(window).width()
  $(".imagecarousel ul li").css "min-height", $(window).height() - 70

$(document).ready ->
  $(".home").css "display", "none"
  $(".special").css "display", "none"
  $("#content").css "display", "none"
  $(".footer").css "display", "none"

$(window).load ->
  $("#loading").fadeOut 500
  $(".home").fadeIn 1000
  $("#special").fadeIn 1000
  $("#content").fadeIn 1000
  $(".footer").fadeIn 1000
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

  links = $("#nav li")
  sections = $(".section")
  clicked = false
  $(".smoothScroll").on "click", (e) ->
    $target = undefined
    target = undefined
    e.preventDefault()
    target = @hash
    $target = $(target)
    $("html, body").stop().animate
      scrollTop: $target.offset().top
    , 700, "swing"

  links.click ->
    clicked = true
    $("#nav li.active").removeClass "active"
    $(this).addClass "active"
    $("div.slider").stop().animate
      width: ($("#nav li.active").offset().left + $("#nav li.active").width() / 2 - $("div.slider-holder").offset().left) - 55
    ,
      duration: 700
      queue: false
      complete: ->
        clicked = false


  coordinateArr = []
  i = 0

  while i < sections.length
    coordinateArr.push $(sections[i]).offset().top
    i++
  $(window).scroll ->
    if clicked is true
      return
    else
      top = $(window).scrollTop()
      i = 0

      while i < coordinateArr.length
        if top >= coordinateArr[coordinateArr.length - 1] - 30
          $("#nav li.active").removeClass "active"
          $(links[links.length - 1]).addClass "active"
        if top >= coordinateArr[i] - 20 and top <= coordinateArr[i + 1] - 20
          $("#nav li.active").removeClass "active"
          $(links[i]).addClass "active"
        i++
      $("div.slider").stop().animate
        width: ($("#nav li.active").offset().left + $("#nav li.active").width() / 2 - $("div.slider-holder").offset().left) - 55
      ,
        duration: 700
        queue: false
        complete: ->
          clicked = false


  $(document).keydown (e) ->
    evt = window.event  unless e
    $("li.active").next().find(">a").trigger "click"  if e.keyCode is 39
    $("li.active").prev().find(">a").trigger "click"  if e.keyCode is 37

  $(window).scroll ->
    y = $(window).scrollTop()
    if y > 500
      $("#top").fadeIn "slow"
    else
      $("#top").fadeOut "fast"
    if y > 60
      $(".nav-holder").css "position", "fixed"
      $(".nav-holder").css "top", "0"
    else
      $(".nav-holder").css "position", "absolute"
      $(".nav-holder").css "top", "60px"

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
        myLoc = "We are unable to determine your location at this time"

    setTimeout (->
      NProgress.done()
      window.location.href = "/view?state=" + myLoc.regionName + "&city=" + myLoc.cityName + "&zip=" + myLoc.zipCode + "&lat=" + myLoc.latitude + "&long=" + myLoc.longitude
    ), 1000

