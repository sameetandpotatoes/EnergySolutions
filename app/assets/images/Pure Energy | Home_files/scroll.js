(function() {
  window.Scrolling = {
    links: null,
    sections: null,
    clicked: false,
    coordinateArr: null,
    buildCoordinates: function() {
      var section, _i, _len, _ref, _results;
      this.links = $("#nav li");
      this.coordinateArr = [];
      this.sections = $('.section');
      _ref = this.sections;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        section = _ref[_i];
        _results.push(this.coordinateArr.push($(section).offset().top));
      }
      return _results;
    },
    scrollTo: function(top) {
      return $("html, body").stop().animate({
        scrollTop: top
      }, 700, "swing");
    },
    smoothScroll: function(e) {
      var hash, target;
      e.preventDefault();
      hash = $($(e.currentTarget).children()[0]).prop("hash");
      target = document.getElementById(hash.slice(1));
      return Scrolling.scrollTo($(target).offset().top);
    },
    click: function(e) {
      this.clicked = true;
      this.smoothScroll(e);
      $("#nav li.active").removeClass("active");
      $(e.currentTarget).addClass("active");
      this.animateSlider();
      return this.clicked = false;
    },
    slider: function() {
      if (this.clicked === false) {
        clearTimeout($.data(window, 'scrollTimer'));
        return $.data(window, 'scrollTimer', setTimeout(function() {
          Scrolling.activateLink();
          return Scrolling.animateSlider();
        }, 100));
      }
    },
    activateLink: function() {
      var coordinateArr, i, links, top, _i, _ref, _results;
      links = Scrolling.links;
      coordinateArr = Scrolling.coordinateArr;
      top = $(window).scrollTop();
      _results = [];
      for (i = _i = 0, _ref = coordinateArr.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        if (top === 0) {
          $("#nav li.active").removeClass("active");
          $(links[0]).addClass("active");
        }
        if (top >= coordinateArr[coordinateArr.length - 1] - 30) {
          $("#nav li.active").removeClass("active");
          $(links[links.length - 1]).addClass("active");
        }
        if (top >= coordinateArr[i] - 20 && top <= coordinateArr[i + 1] - 20) {
          $("#nav li.active").removeClass("active");
          _results.push($(links[i]).addClass("active"));
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    },
    animateSlider: function() {
      if ($.find("#nav").toString() !== "") {
        return $("div.slider").stop().animate({
          width: ($("#nav li.active").offset().left + $("#nav li.active").width() / 2 - $("div.slider-holder").offset().left) - 49,
          duration: 300,
          queue: false,
          complete: function() {
            return this.clicked = false;
          }
        });
      }
    },
    keyPress: function(e) {
      this.clicked = true;
      if (e.keyCode === 39) {
        $("li.active").next().find(">a").trigger("click");
      }
      if (e.keyCode === 37) {
        $("li.active").prev().find(">a").trigger("click");
      }
      this.clicked = false;
      return true;
    },
    fadeIn: function() {
      var y;
      y = $(window).scrollTop();
      if (y > 500 && $('#top').css('display') === "none" && this.clicked === false) {
        $("#top").fadeIn(1000);
      } else if (y <= 500 && ($('#top').css('display') === "block" || $('#top').css('display') === "inline")) {
        $("#top").fadeOut(500);
      }
      if (y > 60) {
        $(".nav-holder").css("position", "fixed");
        $('.nav-holder').css("top", "0px");
        return $("#BackToTop").css("top", "10px");
      } else {
        $(".nav-holder").css("position", "absolute");
        $(".nav-holder").css("top", $('#header').height() + 24);
        return $("#BackToTop").css("top", "70px");
      }
    }
  };

  $(function() {
    return $(window).load(function() {
      Scrolling.buildCoordinates();
      $(window).resize(function() {
        return Scrolling.buildCoordinates();
      });
      $(document).keydown(function(e) {
        return Scrolling.keyPress(e);
      });
      Scrolling.links.click(function(e) {
        return Scrolling.click(e);
      });
      $(window).scroll(function() {
        Scrolling.slider();
        return Scrolling.fadeIn();
      });
      return $('span a.smoothScroll').on("click", function(e) {
        Scrolling.clicked = true;
        $("html, body").stop().animate({
          scrollTop: 0
        }, 700, "swing");
        return Scrolling.clicked = false;
      });
    });
  });

}).call(this);
