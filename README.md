# ja-sentence-distiller

* 概要:

  * Webから収集された日本語テキストの整形スクリプト
  * 入力は[ここ](http://statmt.org/ngrams/)で公開されている Deduplicated CommonCrawl Text の日本語版 [ja.deduped.xz](http://web-language-models.s3-website-us-east-1.amazonaws.com/ngrams/ja/deduped/ja.deduped.xz) を想定

* 使い方:

      xzcat ja.deduped.xz | sh ja-sentence-distiller.sh > ja.sentence.txt

  * 1文1行として出力（2017年11月時点で上記コマンドによる出力は約6.6億行）
  * バイナリ文字を含む文を削除するためにMeCabを使っているためインストールが必要
  * バイナリ文字を含む文の削除が不要であれば該当部分を削除すれば動作可能

* 整形ルール:
  * 同一行内で（ただし直前行の末尾が句点の場合はそれも含め）句点「。」に挟まれている部分を文として抽出
  * 長さが200文字を超える文、バイナリ文字を含む文、および、空白は削除
