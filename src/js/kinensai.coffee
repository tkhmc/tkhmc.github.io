setEvent = ->
  $("#Kinensai").on("show.bs.modal", (e) ->
    button = $(e.relatedTarget)
    modal = $(@)
    modal.find(".loading").removeClass("hidden")
    modal.find(".modal-body").addClass("hidden")

    # タイトルを設定
    modal.find("h4.modal-title").text(button.text())

    year = button.data("name")
    $.ajax("json/kinensai/#{year}.json").done( (kinensai) =>
      modal = $(@)
      modal.find(".loading").addClass("hidden")
      modal.find(".modal-body").removeClass("hidden")
      kinensai = JSON.parse(kinensai) unless kinensai instanceof Object

      # 説明
      desc = '<div class="kinensai-summary col-md-6"><div class="page-header"><h2 class="h3">概要</h2></div>'
      desc += "<p>日程: #{kinensai.date}\n#{kinensai.time}</p><p>公式サイト: <a href=\"#{kinensai.url}\">#{kinensai.url}</a></p>"
      if kinensai.desc?
        desc += "<p>#{kinensai.desc}</p>"
      desc += '</div>'

      # 場所
      place = '<div class="kinensai-place col-md-6"><div class="page-header"><h2 class="h3">発表場所</h2></div>'
      place += "<p>#{kinensai.place}</p></div>"

      # 内容
      content = '<div class="kinensai-content col-md-6"><div class="page-header"><h2 class="h3">発表内容</h2></div>'
      content += '<ul class="list-group">'
      for con in kinensai.content
        content += "<li class=\"list-group-item\">#{con}</li>"
      content += '</ul></div>'

      # パンフレット
      pamphlet = ""
      if kinensai.pamphlet?
        pamphlet += '<div class="kinensai-dl col-md-6"><div class="page-header"><h2 class="h3">パンフレット</h2></div>'
        pamphlet += "<p><a href=\"#{kinensai.pamphlet}\">第#{year}回記念祭</a></p></div>"

      # ダウンロード
      dl = '<div class="kinensai-dl col-md-6"><div class="page-header"><h2 class="h3">ダウンロード</h2></div>'
      dl += '<p><a href="products.html">発表したソフトはこちらからダウンロードできます</a></p></div>'

      # 内容を適応
      modal.find(".modal-body").html('<div class="row">' + desc + place + content + pamphlet + dl + '</div>')
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
