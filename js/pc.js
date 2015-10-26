(function() {
  var setEvent;

  setEvent = function() {
    $("#PC").on("show.bs.modal", function(e) {
      var button, modal, pcName;
      button = $(e.relatedTarget);
      modal = $(this);
      modal.find("h4.modal-title").text(button.text());
      pcName = button.data("name");
      $.ajax("json/pc/" + pcName + ".json").done((function(_this) {
        return function(pc) {
          var config, configTable, desc, i, img, j, key, len, ref, v, val, winSAT, winSATD, winSATTable;
          modal = $(_this);
          if (!(pc instanceof Object)) {
            pc = JSON.parse(pc);
          }
          desc = '<div class="pc-summary col-md-6"><div class="page-header"><h2 class="h3">概要</h2></div><p>' + pc.desc + '</p></div>';
          configTable = '<table class="table table-striped">';
          ref = pc.config;
          for (key in ref) {
            val = ref[key];
            if (!$.isArray(val)) {
              configTable += "<tr><td>" + key + "</td><td>" + val + "</td></tr>";
            } else {
              configTable += "<tr><td rowspan='" + val.length + "'>" + key + "</td>";
              for (i = j = 0, len = val.length; j < len; i = ++j) {
                v = val[i];
                if (i !== 0) {
                  configTable += "<tr>";
                }
                configTable += "<td>" + v + "</td></tr>";
              }
            }
          }
          configTable += '</table>';
          config = '<div class="pc-config col-md-6"><div class="page-header"><h2 class="h3">マシン構成</h2></div>' + configTable + '</div>';
          winSAT = '';
          winSATD = pc.winsat;
          if (winSATD) {
            winSATTable = "<table class=\"table table-striped\">\n<tr><td>総合評価</td><td>" + winSATD.total + "</td></tr>\n<tr><td>CPU</td><td>" + winSATD.cpu + "</td></tr>\n<tr><td>メモリ</td><td>" + winSATD.mem + "</td></tr>\n<tr><td>グラフィックス</td><td>" + winSATD.graphics + "</td></tr>\n<tr><td>ゲーム用グラフィックス</td><td>" + winSATD.gameGraphics + "</td></tr>\n<tr><td>ハードディスク</td><td>" + winSATD.hardDisc + "</td></tr>\n</table>";
            winSAT += '<div class="pc-winsat col-md-6"><div class="page-header"><h2 class="h3">WinSATスコア</h2></div>' + winSATTable + '</div>';
          }
          img = '';
          if (pc.img != null) {
            img += '<div class="col-md-6"><img src="' + pc.img + '" class="img-responsive img-rounded"></div>';
          }
          modal.find(".modal-body").html('<div class="row">' + desc + config + winSAT + img + "</div>");
        };
      })(this));
    });
  };

  setEvent();

  if ($.support.pjax) {
    $(document).on("pjax:complete", function(e, data) {
      setEvent();
    });
  }

  $(document).on("pjax:popstate", function() {
    $(document).find(".modal-backdrop").remove();
  });

}).call(this);
