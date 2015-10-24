(function() {
  var person, setEvent;

  person = {
    ProgA: {
      desc: '<div class="profile col-md-6"><div class="page-header"><h2 class="h3">プロフィール</h2></div><table class="table"><tr><td>年齢</td><td>だいたい、今の西暦 - 1988</td></tr><tr><td>クラス</d><td>だいがくせい</td></tr><tr><td>趣味</td><td style="background=brown;color=white">禁則事項です</td></tr></table><p>諸事情により、大幅に削除させていただきました。<br>私への連絡は、<s>http://dempainsi.de/</s>(2015/10/24 リンク切れ)からメールアドレスをみてね。</p></div><div class="project col-md-6"><div class="page-header"><h2 class="h3">担当プロジェクト</h2></div><ul class="list-group"><li class="list-group-item">回るんです(終了)</li><li class="list-group-item">回すんです</li><li class="list-group-item">学校探検プログラム</li></ul></div>'
    },
    yappy: {
      desc: '<div class="profile col-md-6"><div class="page-header"><h2 class="h3">プロフィール</h2></div><p>KDVに潜伏中</p><table class="table"><tr><td>年齢</td><td>20</td></tr><tr><td>クラス</d><td>R(卒業しました)</td></tr><tr><td>好きなアニメ</td><td>遊戯王デュエルモンスターズ5D\'s</td></tr><tr><td>好きな部活</td><td>電波科学研究部マイコン班</td></tr><tr><td rowspan=10>好きな言葉</td><td>ゴルェンダァ!!!</td></tr><tr><td>迷いを吹っ切ってやろう!</td></tr><tr><td>させるかよー!</td></tr><tr><td>残念だな</td></tr><tr><td>ところがそうはいかないんだよな</td></tr><tr><td>いやだ・・・オレは・・・負けたくないーーーーー!!!!!</td></tr><tr><td>よくやった、亮</td></tr><tr><td>なぜだー！りょー！</td></tr><tr><td>相手をリスペクトするということは、相手の心となって自分を見るということ・・・</td></tr><tr><td>勝つのはオレだ!消えろ、敗者は!</td></tr><tr><td>嫌いな教科</td><td>地理・日本史・世界史</td></tr><tr><td>特技(本職)</td><td>プログラミング</td></tr><tr><td>持ち技</td><td>Java(C#) C/C++ >> BASICの処理系 Delphi Javascript Perl</td></tr><tr><td>特技(副職)</td><td>折り紙</td></tr><tr><td rowspan="3">お知らせ</td><td>東方始めました</td></tr><tr><td>MUGEN始めました</td></tr><tr><td>もうだめだな</td></tr></table><p>TopCoderはじめました。<br><a href="http://www.topcoder.com/tc?module=MemberProfile&cr=22732902">http://www.topcoder.com/tc?module=MemberProfile&cr=22732902</a><br>TopCoder全然やってません。</p></div><div class="project col-md-6"><div class="page-header"><h2 class="h3">担当プロジェクト</h2></div><ul class="list-group"><li class="list-group-item">スーパーうにょうにょ</li><li class="list-group-item">スーパーうにょうにょ2</li><li class="list-group-item">車道ゲート</li><li class="list-group-item">ビデオタイピング(仮称)</li></ul></div><div class="contest col-md-6"><div class="page-header"><h2 class="h3">出場大会</h2></div><ul class="list-group"><li class="list-group-item">情報オリンピック</li><li class="list-group-item">スパコン</li><li class="list-group-item">パソコン甲子園</li><li class="list-group-item">U20プログラミングコンテスト</li></ul></div><div class="contact col-md-6"><div class="page-header"><h2 class="h3">コンタクト<s>(融合！)</s></h2></div><p>ホームページ(旧)<br><a href="http://hp.vector.co.jp/authors/VA039760/">http://hp.vector.co.jp/authors/VA039760/</a><br>ブログ<br><a href="http://d.hatena.ne.jp/yappy_t/">http://d.hatena.ne.jp/yappy_t/</a><br>メールアドレス<br>superunyo<br>yahoo.co.jp<br>(迷惑メール収集用なので返事が遅れたり、最悪の場合削除も考えられます)<br>(さすがにちょっと・・・@はやめてみるか?)</p></div>'
    },
    atmonad: {
      desc: '<div class="profile col-md-6"><div class="page-header"><h2 class="h3">プロフィール</h2></div><table class="table"><tr><td>クラス</d><td>T18</td></tr><tr><td>性格</td><td><a href="http://enjo.eek.jp/aa/index.php?%A4%D3(ry">ｂ（ｒｙ</a></td></tr><tr><td>好きなもの</td><td>野球</td></tr></table><p><s>最近は、ほぼ人生終了に陥っています。</s>現在KMCに所属。</p></div><div class="project col-md-6"><div class="page-header"><h2 class="h3">担当プロジェクト</h2></div><ul class="list-group"><li class="list-group-item">奇怪撮影(終了)</li><li class="list-group-item">写真AA化(終了)</li></ul></div>'
    },
    tsutcho: {
      desc: '<div class="profile col-md-6"><div class="page-header"><h2 class="h3">プロフィール</h2></div><table class="table"><tr><td>年齢</d><td>17</td></tr><tr><td>クラス</td><td>2年H組</td></tr></table></div><div class="project col-md-6"><div class="page-header"><h2 class="h3">担当プロジェクト</h2></div><ul class="list-group"><li class="list-group-item">ころころころりん</li><li class="list-group-item">フラクタル</li><li class="list-group-item">座標検知master</li><li class="list-group-item">ウイルスもどき</li><li class="list-group-item">誰かどこで…</li><li class="list-group-item">The evader</li></ul></div><div class="sayin col-md-6"><div class="page-header"><h2 class="h3">名言</h2></div><ul class="list-group"><li class="list-group-item">ゴミが人のようだ</li><li class="list-group-item">がんばりません勝つまでは</li></ul></div>'
    },
    noname: {
      desc: '<div class="profile col-md-6"><div class="page-header"><h2 class="h3">プロフィール</h2></div><table class="table"><tr><td>年齢</d><td>19</td></tr><tr><td>使用言語</td><td>ActionScript(3.0除く)・VisualBasic(5.0～9.0)・C#・C(勉強中)</td></tr></table></div><div class="project col-md-6"><div class="page-header"><h2 class="h3">担当プロジェクト</h2></div><ul class="list-group"><li class="list-group-item">筆跡鑑定</li><li class="list-group-item">BeePlayerDX</li><li class="list-group-item">HR講座のプログラミング講座(C#)</li><li class="list-group-item">rsim</li></ul></div><div class="sayin col-md-6"><div class="page-header"><h2 class="h3">名言</h2></div><ul class="list-group"><li class="list-group-item">えーりんはドS</li></ul></div>'
    },
    x: {
      desc: '<div class="profile col-md-6"><div class="page-header"><h2 class="h3">プロフィール</h2></div><table class="table"><tr><td>年齢</d><td>16</td></tr><tr><td>クラス</d><td>1年G組</td></tr><tr><td>使用言語</td><td>C#・C/C++・なでしこ</td></tr></table></div><div class="project col-md-6"><div class="page-header"><h2 class="h3">担当プロジェクト</h2></div><ul class="list-group"><li class="list-group-item">学校探検</li><li class="list-group-item">Linux</li></ul></div><div class="sayin col-md-6"><div class="page-header"><h2 class="h3">名言</h2></div><ul class="list-group"><li class="list-group-item">俺はドS</li></ul></div>'
    },
    sowori: {
      desc: '<div class="profile col-md-6"><div class="page-header"><h2 class="h3">プロフィール</h2></div><table class="table"><tr><td>年齢</d><td>17</td></tr><tr><td>クラス</d><td>1年B組</td></tr><tr><td>趣味</d><td>ピアノとか・コスプレ(女装)</td></tr><tr><td>使用言語</td><td>C#</td></tr></table></div><div class="project col-md-6"><div class="page-header"><h2 class="h3">担当プロジェクト</h2></div><ul class="list-group"><li class="list-group-item">痛イピング</li></ul></div><div class="sayin col-md-6"><div class="page-header"><h2 class="h3">名言</h2></div><ul class="list-group"><li class="list-group-item">物理的に泣きそう</li><li class="list-group-item">妹はロリじゃない</li><li class="list-group-item">コスプレは最高に楽しい</li><li class="list-group-item">自分で見ても可愛い</li></ul></div>'
    },
    emoji: {
      desc: '<div class="profile col-md-6"><div class="page-header"><h2 class="h3">プロフィール</h2></div><table class="table"><tr><td>年齢</d><td>16</td></tr><tr><td>クラス</d><td>1年A組</td></tr><tr><td>使用言語</td><td>C/C++(ちょっとね) C#(ちょい) Go(勉強中) Java JavaScript CoffeeScript TypeScript(ちょっと) HTML/CSS/HAML/SCSS/Markdown(マークアップ言語だけれど)</td></tr></table><p>初めての外来かもしれない<br>このHPを作っていたりする</p></div><div class="project col-md-6"><div class="page-header"><h2 class="h3">担当プロジェクト</h2></div><ul class="list-group"><li class="list-group-item">shooting!</li><li class="list-group-item">WikiToHP</li></ul></div>'
    }
  };

  setEvent = function() {
    $(document).find("#Person").on("show.bs.modal", function(e) {
      var button, desc, modal, name;
      button = $(e.relatedTarget);
      console.log(button);
      console.log(person);
      console.log(this);
      name = button.data("name");
      modal = $(this);
      modal.find("h4.modal-title").text(button.text());
      desc = person[name].desc;
      modal.find(".modal-body").html('<div class="row">' + desc + "</div>");
    });
  };

  setEvent();

  if ($.support.pjax) {
    $(document).on("pjax:complete", function(e, data) {
      return setEvent();
    });
  }

}).call(this);
