# データ
pc = {
  harris: {
    desc: "2011年3月に購入したPC。(最終は2011年5月)<br>何故か高性能CPUとマザーボードが故障・・・<br>AMD製のPhenomⅡx6のCPUを使用するなど、部の掟を破った殻を打ち破った部分が多く、スペックは過去に類を見ない贅沢なPC…のはずだが故障のため、再び買ったCPUとマザーボードの費用を相当ケチっており、デュアルコアCPUで、microATXサイズのマザーボードとなった。グラフィックはDirectX11対応の高性能すぎるモデルとなっている。よく班長が占領している。<br>今のところマイコン班唯一の7マシンのはずであり、皆7の軽快さに驚いている!(特にインストールにかかる時間)<br>性能はまだ疑問である。<br>ちなみにマシン名はHarrisであるが、最初はPerryになるはずだった。"
    config: {
      "OS": "Windows 7 Professional"
      "CPU": "Core 2 Duo E6600(2.4GHz*2)"
      "M/B": "AOpen 946GZ-DAG"
      "メモリ": "2GB"
      "HDD": "250GB"
      "モニタ": "19inchWIDE"
      "ドライブ": [
        "スーパーマルチドライブx1"
        "FDDx1"
      ]
      "ビデオカード": "GeForce 8500GT"
      "サウンドカード": "M/B付属チップ"
    },
    winsat: {
      total: "4.8"
      cpu: "5.3"
      mem: "5.6"
      graphics: "4.8"
      gameGraphics: "5.0"
      hardDisc: "5.4"
    }
  }
}

$("#PC").on("show.bs.modal", (e) ->
  button = $(e.relatedTarget)
  pcName = button.data("name")
  modal = $(@)
  # タイトルを設定
  modal.find("h4.modal-title").text(pcName)
  desc = '<div class="pc-summary"><div class="page-header"><h2 class="h3">概要</h2></div><p>' + pc[pcName].desc + '</p></div>'

  # マシン構成のパース
  configTable = '<table class="table table-striped">'
  for key, val of pc[pcName].config
    if not $.isArray(val)
      configTable += "<tr><td>#{key}</td><td>#{val}</td></tr>"
    else
      configTable += "<tr><td rowspan='#{val.length}'>#{key}</td>"
      for v, i in val
        if i isnt 0
          configTable += "<tr>"
        configTable += "<td>#{v}</td></tr>"
  configTable += '</table>'
  config = '<div class="pc-config"><div class="page-header"><h2 class="h3">マシン構成</h2></div>' + configTable + '</div>'

  # WinSATのパース
  winSATD = pc[pcName].winsat
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
  winSAT = '<div class="pc-winsat"><div class="page-header"><h2 class="h3">WinSATスコア</h2></div>' + winSATTable + '</div>'

  # 内容を適応
  modal.find(".modal-body").html(desc + config + winSAT)
  return
)
