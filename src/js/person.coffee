setEvent = ->
  $("#Person").on("show.bs.modal", (e) ->
    button = $(e.relatedTarget)
    modal = $(@)
    # タイトルを設定
    modal.find("h4.modal-title").text(button.text())

    name = button.data("name")
    $.ajax("json/person/#{name}.json").done( (person) =>
      modal = $(@)
      person = JSON.parse(person) unless person instanceof Object

      # 説明
      desc = person.desc

      # 内容を適応
      modal.find(".modal-body").html('<div class="row">' + desc + "</div>")
      return
    )
    return
  )
  return

setEvent()

if $.support.pjax
  $(document).on("pjax:complete", (e, data) ->
    setEvent()
  )

# 戻る/進む時にモーダルを非表示
$(document).on("pjax:popstate", ->
  $(document).find(".modal-backdrop").remove()
)
