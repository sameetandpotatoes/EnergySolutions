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

	smoothScroll: (e) ->
		e.preventDefault()
		hash = $($(e.currentTarget).children()[0]).prop("hash")
		target = document.getElementById hash.slice(1)
		$("html, body").stop().animate
			scrollTop: $(target).offset().top
		, 700, "swing"

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
			if top >= coordinateArr[coordinateArr.length - 1] - 30
				$("#nav li.active").removeClass "active"
				$(links[links.length - 1]).addClass "active"
			if top >= coordinateArr[i] - 20 and top <= coordinateArr[i + 1] - 20
				$("#nav li.active").removeClass "active"
				$(links[i]).addClass "active"

	animateSlider: ->
		$("div.slider").stop().animate
			width: ($("#nav li.active").offset().left + $("#nav li.active").width() / 2 - $("div.slider-holder").offset().left) - 55
			duration: 300
			queue: false
			complete: ->
				this.clicked = false

	keyPress: (e) ->
		this.clicked = true
		$("li.active").next().find(">a").trigger "click"  if e.keyCode is 39
		$("li.active").prev().find(">a").trigger "click"  if e.keyCode is 37
		this.clicked = false

	fadeIn: ->
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
