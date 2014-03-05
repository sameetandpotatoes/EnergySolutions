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
#= require jquery.easytabs.min.js
home = ->
  window.location.pathname is "/"
homeFix = ->
  $(".home").css "height", $(window).height() - 121
  if $(window).width > 700
    $('.content').css "left", "0"
    $('.content').addClass "slideRight"
contentFix = ->
  children = $("#content").children()
  index = 0
  while index < children.length
    child = children[index]
    index++
    $(child).css "min-height", $(window).height()
equalHeight = ->
  biggestHeight = 0
  $(".equal-height").each ->
    biggestHeight = $(this).height() + 30  if $(this).height() > biggestHeight
  $(".equal-height").height biggestHeight
$(document).ready ->
  $(".home").css "display", "none"
  $("#content").css "display", "none"
  $(".footer").css "display", "none"

$(window).load ->
  $("#loading").fadeOut 1000
  $(".home").fadeIn 1500
  $("#content").fadeIn 1500
  $(".footer").fadeIn 1500
  $('.results').css "display", "block"
  $('header > i').click ->
    if $('.content').hasClass "slideRight"
      $(".content").animate
        left: "200px"
      , 300
      $('.content').removeClass "slideRight"
    else
      $(".content").animate
        left: "0"
      , 300
      $('.content').addClass "slideRight"

  homeFix()
  contentFix()
  equalHeight()

  NProgress.configure showSpinner: true
  NProgress.configure
    ease: "ease"
    speed: 2

  $(".imagecarousel").unslider
    fluid: true
    dots: true
    keys: true
    pause: false

  $("#cssmenu ul:first").click ->
    $("ul:first", this).toggle()


  $(window).resize ->
    homeFix()
    contentFix()
