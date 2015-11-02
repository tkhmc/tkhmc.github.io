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

pageMenu = ->
  filename = window.location.href.match(".+/(.+?)\.[a-z]+([\?#;].*)?$")
  menuBrand = $(".menu-brand")
  # .menu-brandのリンクをindex.htmlならひっぺがす
  if !filename? or filename[1] is "index"
    menuBrand.attr("href", "#")
    filename = []
    filename[1] = "index"
  else
    menuBrand.attr("href", "index.html")
  # メニューのspan.sr-onlyをすべてとる
  removeActiveTag()
  # メニューの.activeをすべてとる
  removeActiveAll()
  # ついたページのところに.activeとspan.sr-onlyをつける
  setActive( $(".menu-" + filename[1]) )
  return

$ ->
  pageMenu()
  return

if $.support.pjax
  # pjaxによる移動(アニメーション付き)
  $(document).on("click", "a:not(.out)", (e) ->
    e.preventDefault()
    href = $(@).attr("href")
    $("#pjax").animate({
      opacity: 0
    }, 300, ->
      $(".loading").removeClass("hidden")
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
    $(".loading").addClass("hidden")
    # 完了アニメーション
    $("#pjax").animate({
      opacity : 1
    }, 300)

    # メニューの変更
    pageMenu()
  )

  $(document).on("pjax:popstate", ->
    pageMenu()
  )

# bootstrapのtooltipの有効化
$ ->
  $('[data-toggle="tooltip"]').tooltip()
  return
