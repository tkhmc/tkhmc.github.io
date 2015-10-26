setEvent = ->
  $("#PC").on("show.bs.modal", (e) ->
    button = $(e.relatedTarget)
    modal = $(@)
    # タイトルを設定
    modal.find("h4.modal-title").text(button.text())

    pcName = button.data("name")
    $.ajax("json/pc/#{pcName}.json").done( (pc) =>
      modal = $(@)
      pc = JSON.parse(pc) unless pc instanceof Object

      # 説明
      desc = '<div class="pc-summary col-md-6"><div class="page-header"><h2 class="h3">概要</h2></div><p>' + pc.desc + '</p></div>'

      # マシン構成のパース
      configTable = '<table class="table table-striped">'
      for key, val of pc.config
        if not $.isArray(val)
          configTable += "<tr><td>#{key}</td><td>#{val}</td></tr>"
        else
          configTable += "<tr><td rowspan='#{val.length}'>#{key}</td>"
          for v, i in val
            if i isnt 0
              configTable += "<tr>"
            configTable += "<td>#{v}</td></tr>"
      configTable += '</table>'
      config = '<div class="pc-config col-md-6"><div class="page-header"><h2 class="h3">マシン構成</h2></div>' + configTable + '</div>'

      # WinSATのパース
      winSAT = ''
      winSATD = pc.winsat
      if winSATD
        winSATTable = """
                      <table class="table table-striped">
                      <tr><td>総合評価</td><td>#{winSATD.total}</td></tr>
                      <tr><td>CPU</td><td>#{winSATD.cpu}</td></tr>
                      <tr><td>メモリ</td><td>#{winSATD.mem}</td></tr>
                      <tr><td>グラフィックス</td><td>#{winSATD.graphics}</td></tr>
                      <tr><td>ゲーム用グラフィックス</td><td>#{winSATD.gameGraphics}</td></tr>
                      <tr><td>ハードディスク</td><td>#{winSATD.hardDisc}</td></tr>
                      </table>
                      """
        winSAT += '<div class="pc-winsat col-md-6"><div class="page-header"><h2 class="h3">WinSATスコア</h2></div>' + winSATTable + '</div>'

      # 画像のパース
      img = ''
      if pc.img?
        img += '<div class="col-md-6"><img src="' + pc.img + '" class="img-responsive img-rounded"></div>'

      # 内容を適応
      modal.find(".modal-body").html('<div class="row">' + desc + config + winSAT + img + "</div>")
      return
    )
    return
  )
  return

setEvent()

if $.support.pjax
  $(document).on("pjax:complete", (e, data) ->
    setEvent()
    return
  )

# 戻る/進む時にモーダルを非表示
$(document).on("pjax:popstate", ->
  $(document).find(".modal-backdrop").remove()
  return
)
