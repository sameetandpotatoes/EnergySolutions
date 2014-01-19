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
#= require viewport.min.js
#= require xdomainajax.js
#= require scroll
#= require maps.js
nonEnergyLinks = ->
  window.location.pathname is "/sources/" or window.location.pathname is "/about/"
home = ->
  window.location.pathname is "/"
carouselFix = ->
  $(".imagecarousel ul li").css "width", $(window).width()
  $(".imagecarousel ul li").css "min-height", $(window).height() - 70
  $(".home").css "height", $(window).height() - 101
contentFix = ->
  children = $("#content").children()
  index = 0
  while index < children.length
    child = children[index]
    index++
    $(child).css "min-height", $(window).height()
$(document).ready ->
  $(".home").css "display", "none"
  $("#content").css "display", "none"
  $(".footer").css "display", "none"

$(window).load ->
  $("#loading").fadeOut 500
  $(".home").fadeIn 1500
  $("#content").fadeIn 1500
  $(".footer").fadeIn 1500
  $('.results').css "display", "block"
  $('header > i').click ->
    if $('.content').hasClass "slideRight"
      $('.content').animate ->
        left: '113px'
      , 5000, ->
        $('.content').removeClass "slideRight"
    else
      $('.content').animate ->
        left: '0px'
      , 5000, ->
        $('.content').addClass "slideRight"
    # $('.content').toggleClass "slideRight" , 5000

  carouselFix()
  contentFix()
  NProgress.configure showSpinner: true
  NProgress.configure
    ease: "ease"
    speed: 2

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

  $("#cssmenu ul:first").click ->
    $("ul:first", this).toggle()


  $(window).resize ->
    carouselFix()
    contentFix()
