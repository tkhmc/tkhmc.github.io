###
 Util
###
removeActiveAll = ->
  $(".menu-index").removeClass("active")
  $(".menu-summary").removeClass("active")
  $(".menu-activity").removeClass("active")
  $(".menu-products").removeClass("active")
  $(".menu-links").removeClass("active")
  return
removeActiveTag = ->
  $("li.active > a > span.sr-only").remove()
  return
addActiveTag = (activeList) ->
  activeList.children("a").append('<span class="sr-only">(current)</span>')
  return
setLinks = ->
  $(".menu-index").children("a").attr("href", "index.html")
  $(".menu-summary").children("a").attr("href", "summary.html")
  $(".menu-activity").children("a").attr("href", "activity.html")
  $(".menu-products").children("a").attr("href", "products.html")
  $(".menu-links").children("a").attr("href", "links.html")
  return
setActive = (activeList) ->
  setLinks()
  activeList.addClass("active")
  activeList.children("a").attr("href", "#")
  addActiveTag(activeList)
  return
pageMenu = -># メニューのリンク
  filename = window.location.href.match(".+/(.+?)\.[a-z]+([\?#;].*)?$")[1]
  menuBrand = $(".menu-brand")
  if filename isnt "index"
    menuBrand.attr("href", "index.html")
  else
    menuBrand.attr("href", "#")
  removeActiveTag()
  removeActiveAll()
  setActive( $(".menu-" + filename) )
  return

$ ->
  pageMenu()
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

    pageMenu()
  )
