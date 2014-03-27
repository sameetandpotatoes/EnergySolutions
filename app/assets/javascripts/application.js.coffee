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
#= require scroll.coffee
#= require jquery.easytabs.min.js
home = ->
  window.location.pathname is "/"
energyPage = ->
  (window.location.pathname != "/") && window.location.pathname != "/about" && window.location.pathname != "/sources" && window.location.pathname != "/all" && window.location.pathname != "/maps"
imageFix = ->
  $(".imagecarousel").css "max-height", (($(window).height() / 2) + 100)
  $(".imagecarousel").css "width", (($('.imagecarousel').width()))
  listItems = $(".imagecarousel ul li")
  listItems.each (index, li) ->
    $(li).css "height", $(".imagecarousel").height()
homeFix = ->
  $('.home').css "height", $(window).height() - 121
  if $(window).width > 700
    $('.content').css "left", "0"
    $('.content').addClass "slideRight"
  else
    $('.home').css "height", $(window).height() - 121
contentFix = ->
  children = $("#content").children()
  index = 0
  while index < children.length
    child = children[index]
    index++
    $(child).css "min-height", $(window).height()
sidebarFix = ->
  if ($(window).width() > 1024)
    $('.content').css "left", "0"
    $('.content').addClass "slideRight"
equalHeight = ->
  biggestHeight = 0
  $(".equal-height").each ->
    biggestHeight = $(this).height() + 45  if $(this).height() > biggestHeight
  $(".equal-height").height biggestHeight
$(document).ready ->
  $('#loading').css "visibility", "hidden"
  $(".home").css "opacity", "0"
  $("#content").css "opacity", "0"
  $(".footer").css "opacity", "0"
  $(".imagecarousel").css "opacity", "0"
  $(".nav-holder").css "opacity", "0"
  $('#loading').css "opacity", "1"
  $('#content').animate
    opacity: '1'
  , 1000
$(window).load ->
  $ ->
    if (!!energyPage)
      $('#loading').css "visibility", "visible"
      $('#loading').animate
        opacity: '0'
      , 500
      $('.home').animate
        opacity: '1'
      , 1000
        $('.imagecarousel').animate
          opacity: '1'
          , 500
    if (energyPage)
      $('.nav-holder').animate
        opacity: '1'
      , 500
    $('.footer').animate
      opacity: '1'
    , 1000
  $("#loading img").css "top", "-9999px"
  $("#loading img").css "left", "-9999px"
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
    delay: 5000
    fluid: true
    dots: true
    keys: true
    pause: false

  $(window).resize ->
    homeFix()
    contentFix()
    imageFix()
    sidebarFix()
