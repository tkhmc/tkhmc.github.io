###
 Util
###
removeActiveAll = ->
  $(".menu-index").removeClass("active")
  $(".menu-summary").removeClass("active")
  $(".menu-activity").removeClass("active")
  $(".menu-downloads").removeClass("active")
  $(".menu-links").removeClass("active")
  return
removeActiveTag = ->
  $("li.active > a > span.sr-only").remove()
  return
addActiveTag = (activeList) ->
  activeList.children("a").append('<span class="sr-only">(current)</span>')
  return
setActive = (activeList) ->
  activeList.addClass("active")
  addActiveTag(activeList)
  return

# pjaxのロード
if $.support.pjax
  $(document).on("click", "a", (e) ->
    e.preventDefault()
    href = $(@).attr("href")
    $("#pjax").animate({
      opacity: 0
    }, 300, ->
      $.pjax({
        url: href
        container: "#pjax"
        fragment: "#pjax"
        timeout: 2000
      })
    )
  )

  # submitでも行う場合
  #$(document).on("submit", "form[data-pjax]", (e) ->
  #  $.pjax.submit(e, "#pjax")
  #)

  # 移動処理
  #$(document).on("pjax:send", (e) ->
  #)

  # 完了処理
  $(document).on("pjax:complete", (e, data) ->
    $("#pjax").animate({
      opacity : 1
    }, 300)

    # メニューのリンク
    filename = window.location.href.match(".+/(.+?)\.[a-z]+([\?#;].*)?$")[1]
    menuBrand = $(".menu-brand")
    if filename isnt "index"
      menuBrand.attr("href", "index.html")
    else
      menuBrand.attr("href", "#")
    removeActiveTag()
    removeActiveAll()
    setActive( $(".menu-" + filename) )
  )
