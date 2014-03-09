(function() {
  var contentFix, equalHeight, home, homeFix, imageFix;

  home = function() {
    return window.location.pathname === "/";
  };

  imageFix = function() {
    var listItems;
    $(".imagecarousel").css("max-height", ($(window).height() / 2) + 100);
    listItems = $(".imagecarousel ul li");
    return listItems.each(function(index, li) {
      return $(li).css("height", $(".imagecarousel").height());
    });
  };

  homeFix = function() {
    $(".home").css("height", $(window).height() - 121);
    if ($(window).width > 700) {
      $('.content').css("left", "0");
      return $('.content').addClass("slideRight");
    }
  };

  contentFix = function() {
    var child, children, index, _results;
    children = $("#content").children();
    index = 0;
    _results = [];
    while (index < children.length) {
      child = children[index];
      index++;
      _results.push($(child).css("min-height", $(window).height()));
    }
    return _results;
  };

  equalHeight = function() {
    var biggestHeight;
    biggestHeight = 0;
    $(".equal-height").each(function() {
      if ($(this).height() > biggestHeight) {
        return biggestHeight = $(this).height() + 30;
      }
    });
    return $(".equal-height").height(biggestHeight);
  };

  $(document).ready(function() {
    $(".home").css("opacity", "0");
    $("#content").css("opacity", "0");
    return $(".footer").css("opacity", "0");
  });

  $(window).load(function() {
    $(function() {
      $('#loading').animate({
        opacity: '0'
      }, 2000);
      $('.home').animate({
        opacity: '1'
      }, 2000);
      $('#content').animate({
        opacity: '1'
      }, 2000);
      return $('.footer').animate({
        opacity: '1'
      }, 2000);
    });
    $('#loading').css("display", "none");
    $('.results').css("display", "block");
    $('header > i').click(function() {
      if ($('.content').hasClass("slideRight")) {
        $(".content").animate({
          left: "200px"
        }, 300);
        return $('.content').removeClass("slideRight");
      } else {
        $(".content").animate({
          left: "0"
        }, 300);
        return $('.content').addClass("slideRight");
      }
    });
    homeFix();
    contentFix();
    equalHeight();
    NProgress.configure({
      showSpinner: true
    });
    NProgress.configure({
      ease: "ease",
      speed: 2
    });
    $(".imagecarousel").unslider({
      fluid: true,
      dots: true,
      keys: true,
      pause: false
    });
    return $(window).resize(function() {
      homeFix();
      contentFix();
      return imageFix();
    });
  });

}).call(this);
