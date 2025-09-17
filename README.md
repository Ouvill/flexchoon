# FlexChoon & FlexWave パッケージ

LaTeX で長音記号（ー）と波線（〜）を任意の長さで表示するためのパッケージです。

[English README](README_en.md)

## 概要

このプロジェクトは2つのパッケージを提供します：

- **flexchoon**: 長音記号「ー」を任意の長さに伸縮できるパッケージ
- **flexwave**: 波線「〜」を任意の長さで描画できるパッケージ

どちらも縦書き・横書きの両方に対応し、様々な日本語フォントで使用できます。

## 特徴

### flexchoon パッケージ
- 長音記号を自然な形で任意の長さに伸縮
- フォント固有の文字形状を保持
- 行頭禁則処理に対応
- 縦書き・横書き両対応

### flexwave パッケージ
- 滑らかな波線を任意の長さで描画
- TikZを使用した高品質な描画
- 縦書き・横書き両対応

## 動作環境

- LuaLaTeX
- 必要なパッケージ：
  - `trimclip`
  - `graphicx`
  - `luacode`
  - `luatexja-adjust`
  - `tikz`
  - `xcolor`

## インストール

1. `flexchoon.sty` と `flexwave.sty` をプロジェクトディレクトリにダウンロード
2. LaTeX文書のプリアンブルで読み込み：

```latex
\usepackage{flexchoon}  % 長音記号パッケージ
\usepackage{flexwave}   % 波線パッケージ
```

## 使用方法

### flexchoon の使用例

```latex
\documentclass{jlreq}
\usepackage{flexchoon}

\begin{document}

% 基本的な使用方法
「うおぉ\flexchoon{1}っ！」 % 長音1文字分
「うおぉ\flexchoon{2}っ！」 % 長音2文字分
「うおぉ\flexchoon{3}っ！」 % 長音3文字分
「うおぉ\flexchoon{5}っ！」 % 長音5文字分

% 同義語コマンド
「うおぉ\expandchoon{3}っ！」 % \flexchoonと同じ

\end{document}
```

### flexwave の使用例

```latex
\documentclass{jlreq}
\usepackage{flexwave}

\begin{document}

% 基本的な使用方法
「うわ\flexwave{1}っ！」 % 波線1文字分
「うわ\flexwave{2}っ！」 % 波線2文字分
「うわ\flexwave{3}っ！」 % 波線3文字分

% 線の太さを指定
「うわ\flexwavewidth{3}{0.1\zw}っ！」 % 太い波線

\end{document}
```

### 完全なサンプル

`sample/main.tex` にある完全なサンプルコードを参考にしてください：

```latex
\documentclass[tate,book,paper=a6paper,fontsize=9pt]{jlreq}
\usepackage{flexchoon}
\usepackage{flexwave}
\usepackage{luatexja-fontspec}

\setmainjfont{GenEi Koburi Mincho v6}

\begin{document}

\section{長音記号の例}
「うおぉ\flexchoon{3}っ」

\section{波線の例}
「うわ\flexwave{3}っ」

\end{document}
```

## コマンドリファレンス

### flexchoon パッケージ

| コマンド | 説明 |
|---------|------|
| `\flexchoon{倍率}` | 長音記号を指定した倍率で表示 |
| `\expandchoon{倍率}` | `\flexchoon` の同義語 |

**パラメータ：**
- `倍率`: 長音の長さ（整数または小数）
  - 1未満の場合は通常の「ー」が表示されます
  - 2以上で伸縮効果が適用されます

### flexwave パッケージ

| コマンド | 説明 |
|---------|------|
| `\flexwave{長さ}` | 標準の太さで波線を表示 |
| `\flexwavewidth{長さ}{線幅}` | 線幅を指定して波線を表示 |

**パラメータ：**
- `長さ`: 波線の長さ（文字数単位）
- `線幅`: 線の太さ（例：`0.05\zw`、`1pt`など）

## 技術仕様

### flexchoon の動作原理

1. 長音記号「ー」を3等分（左端・中央・右端）
2. 左端と右端は元の形状を保持
3. 中央部分のみを指定倍率に応じて伸縮
4. 結果として自然な見た目の長音記号を生成

### flexwave の動作原理

1. TikZを使用して数学的に波形を計算
2. 指定された長さに応じてサンプリング点数を調整
3. 滑らかな曲線で波線を描画
4. 読み上げソフト対応のため透明な〜文字を配置

## フォント対応

以下のフォントでテスト済みです：

- 源暎こぶり明朝（GenEi Koburi Mincho）
- 源暎筑紫明朝（GenEi Chikugo Mincho）
- しっぽり明朝（Shippori Mincho）
- IPAexゴシック

## 注意事項

- LuaLaTeX でのコンパイルが必要です
- pLaTeX や XeLaTeX では動作しません
- 縦書きモードでは自動的に最適化された配置になります
- 行頭禁則処理により、長音記号や波線が行頭に来ることを防ぎます

## ライセンス

MIT License

## 作者

Ouvill

## 貢献

バグ報告や機能要求は GitHub Issues にお願いします。プルリクエストも歓迎します。

## 関連リンク

- [サンプル文書](sample/main.tex)
- [長音パッケージソースコード](flexchoon.sty)
- [波線パッケージソースコード](flexwave.sty)
