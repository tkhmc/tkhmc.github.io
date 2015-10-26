(function() {
  var setEvent;

  setEvent = function() {
    $("#Person").on("show.bs.modal", function(e) {
      var button, modal, name;
      button = $(e.relatedTarget);
      modal = $(this);
      modal.find("h4.modal-title").text(button.text());
      name = button.data("name");
      $.ajax("json/person/" + name + ".json").done((function(_this) {
        return function(person) {
          var desc;
          modal = $(_this);
          if (!(person instanceof Object)) {
            person = JSON.parse(person);
          }
          desc = person.desc;
          modal.find(".modal-body").html('<div class="row">' + desc + "</div>");
        };
      })(this));
    });
  };

  setEvent();

  if ($.support.pjax) {
    $(document).on("pjax:complete", function(e, data) {
      return setEvent();
    });
  }

  $(document).on("pjax:popstate", function() {
    return $(document).find(".modal-backdrop").remove();
  });

}).call(this);
