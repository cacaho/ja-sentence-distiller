#!/bin/sh

# 入力: 標準入力から入力された日本語を含むファイル
# 出力: 句点に挟まれた部分を文として標準出力に出力
[ $# -ne 0 ] && echo "Usage: $0 < input.txt > output.txt" && exit 1

# 句点に挟まれた部分を抽出
perl -pe 's/。\n/。/' < /dev/stdin | grep -ao "。.*。" | uniq | sed 's/^。//' | \
\
# 句点ごとに改行、空白を削除
sed 's/。/。\n/g' | sed 's/\s//g' | \
\
# 句点以外含まない行、200文字を越える行を削除
grep -a "[^。]" | uniq | awk 'length()<201' | \
\
# MeCabで文末まで解析できる行のみ抽出
mecab -Owakati | tr -d ' ' | grep "。"
