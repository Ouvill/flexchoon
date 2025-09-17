# .latexmkrc - latexmk configuration file
# このファイルはlatexmkの動作を設定します

# エンジンの設定
$pdf_mode = 4;          # LuaLaTeXを使用
$lualatex = 'lualatex %O %S';
$pdflatex = 'lualatex %O %S';  # -pdfオプション使用時もLuaLaTeXを強制

# 出力ディレクトリの設定
$out_dir = 'build';     # 出力先をbuildディレクトリに

# 中間ファイルの設定
$aux_dir = 'build';     # 中間ファイルもbuildディレクトリに

# 自動再実行の設定
$max_repeat = 5;        # 最大再実行回数
$pdf_update_method = 0; # PDFビューアーの更新方法（0=なし）

# 継続監視モードの設定（make watchで使用可能）
$preview_continuous_mode = 0;  # 通常ビルドでは無効
$sleep_time = 2;        # ファイル変更チェック間隔（秒）

# クリーンアップ対象ファイルの追加
$clean_ext = "synctex.gz fdb_latexmk fls";

# 日本語フォント警告の抑制
$latex_silent_switch = "-interaction=batchmode";
$lualatex_silent_switch = "-interaction=batchmode";

# デバッグモード（必要に応じてコメントアウト）
# $verbose = 1;
