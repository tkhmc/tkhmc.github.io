setEvent = ->
  $("#Person").on("show.bs.modal", (e) ->
    button = $(e.relatedTarget)
    modal = $(@)
    modal.find(".loading").removeClass("hidden")
    modal.find(".modal-body").addClass("hidden")
    # タイトルを設定
    modal.find("h4.modal-title").text(button.text())

    name = button.data("name")
    $.ajax("json/person/#{name}.json").done( (person) =>
      modal = $(@)
      modal.find(".loading").addClass("hidden")
      modal.find(".modal-body").removeClass("hidden")
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
