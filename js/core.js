
/*
 Util
 */

(function() {
  var addActiveTag, pageMenu, removeActiveAll, removeActiveTag, setActive, setLinks;

  removeActiveAll = function() {
    $(".menu-index").removeClass("active");
    $(".menu-summary").removeClass("active");
    $(".menu-activity").removeClass("active");
    $(".menu-products").removeClass("active");
    $(".menu-links").removeClass("active");
  };

  removeActiveTag = function() {
    $("li.active > a > span.sr-only").remove();
  };

  addActiveTag = function(activeList) {
    activeList.children("a").append('<span class="sr-only">(current)</span>');
  };

  setLinks = function() {
    $(".menu-index").children("a").attr("href", "index.html");
    $(".menu-summary").children("a").attr("href", "summary.html");
    $(".menu-activity").children("a").attr("href", "activity.html");
    $(".menu-products").children("a").attr("href", "products.html");
    $(".menu-links").children("a").attr("href", "links.html");
  };

  setActive = function(activeList) {
    setLinks();
    activeList.addClass("active");
    activeList.children("a").attr("href", "#");
    addActiveTag(activeList);
  };

  pageMenu = function() {
    var filename, menuBrand;
    filename = window.location.href.match(".+/(.+?)\.[a-z]+([\?#;].*)?$")[1];
    menuBrand = $(".menu-brand");
    if ((filename == null) && filename !== "index") {
      menuBrand.attr("href", "index.html");
    } else {
      menuBrand.attr("href", "#");
    }
    removeActiveTag();
    removeActiveAll();
    setActive($(".menu-" + filename));
  };

  $(function() {
    pageMenu();
  });

  if ($.support.pjax) {
    $(document).on("click", "a:not(.out)", function(e) {
      var href;
      e.preventDefault();
      href = $(this).attr("href");
      return $("#pjax").animate({
        opacity: 0
      }, 300, function() {
        return $.pjax({
          url: href,
          container: "#pjax",
          fragment: "#pjax",
          timeout: 2000
        });
      });
    });
    $(document).on("pjax:complete", function(e, data) {
      $("#pjax").animate({
        opacity: 1
      }, 300);
      return pageMenu();
    });
    $(document).on("pjax:popstate", function() {
      return pageMenu();
    });
  }

  $(function() {
    $('[data-toggle="tooltip"]').tooltip();
  });

}).call(this);
