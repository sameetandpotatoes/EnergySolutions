window.Scrolling = {

	links:					null
	sections:				null
	clicked:				false
	coordinateArr:	null

	buildCoordinates: ->
		this.links = $("#nav li")
		this.coordinateArr = []
		this.sections = $('.section')
		for section in this.sections
			this.coordinateArr.push $(section).offset().top

	scrollTo: (top) ->
		$("html, body").stop().animate
			scrollTop: top
		, 700, "swing"

	smoothScroll: (e) ->
		e.preventDefault()
		hash = $($(e.currentTarget).children()[0]).prop("hash")
		target = document.getElementById hash.slice(1)
		Scrolling.scrollTo $(target).offset().top

	click: (e) ->
		this.clicked = true
		$("#nav li.active").removeClass "active"
		$(e.currentTarget).addClass "active"
		this.smoothScroll e
		this.animateSlider()
		this.clicked = false

	slider: ->
		if this.clicked is false
			clearTimeout $.data(window, 'scrollTimer')
			$.data window, 'scrollTimer', setTimeout(->
				Scrolling.activateLink()
				Scrolling.animateSlider()
			, 50)

	activateLink: ->
		links = Scrolling.links
		coordinateArr = Scrolling.coordinateArr
		top = $(window).scrollTop()
		for i in [0..coordinateArr.length-1]
			if top is 0
				$("#nav li.active").removeClass "active"
				$(links[0]).addClass "active"
			if top >= coordinateArr[coordinateArr.length - 1] - 30
				$("#nav li.active").removeClass "active"
				$(links[links.length - 1]).addClass "active"
			if top >= coordinateArr[i] - 20 and top <= coordinateArr[i + 1] - 20
				$("#nav li.active").removeClass "active"
				$(links[i]).addClass "active"

	animateSlider: ->
		$("div.slider").stop().animate
			width: ($("#nav li.active").offset().left + $("#nav li.active").width() / 2 - $("div.slider-holder").offset().left) - 49
			duration: 300
			queue: false
			complete: ->
				this.clicked = false

	keyPress: (e) ->
		this.clicked = true
		$("li.active").next().find(">a").trigger "click"  if e.keyCode is 39
		$("li.active").prev().find(">a").trigger "click"  if e.keyCode is 37
		this.clicked = false
		true

	fadeIn: ->
		y = $(window).scrollTop();
		if y > 500 && $('#top').css('display') is "none" && this.clicked is false
			$("#top").fadeIn 1000
		else if y <= 500 && $('#top').css('display') is "block" || $('#top').css('display') is "inline"
			$("#top").fadeOut 500
		if y > 60
			$(".nav-holder").css "position", "fixed"
			$(".nav-holder").css "top", "0"
			$("#BackToTop").css "top", "10px"
		else
			$(".nav-holder").css "position", "absolute"
			$(".nav-holder").css "top", "60px"
			$("#BackToTop").css "top", "70px"

}

$ ->
	$(window).load ->
		Scrolling.buildCoordinates()

		$(window).resize ->
			Scrolling.buildCoordinates()

		$(document).keydown (e) ->
			Scrolling.keyPress e

		Scrolling.links.click (e) ->
			Scrolling.click e

		$(window).scroll ->
			Scrolling.slider()
			Scrolling.fadeIn()

		$('span a.smoothScroll').on "click", (e) ->
			Scrolling.clicked = true
			$("html, body").stop().animate
			  scrollTop: 0, 700, "swing"
			Scrolling.clicked = false
