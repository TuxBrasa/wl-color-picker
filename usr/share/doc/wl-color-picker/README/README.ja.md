wl-color-picker

grim

と
slurp を利用した、
Wayland と wlroots 用のシンプルなカラーピッカーです。

wl-color-picker を使用すると、画面上から直接色を選択し、
色を編集してクリップボードへコピーしたり、後で使用するために保存したりできます。
機能

    slurp と grim を使用して画面から色を選択。

    YAD を使用して選択した色を編集。

    色を直接クリップボードへコピー。

    色を保存して後から使用。

    保存した色の表示と編集。

    保存した色を個別に削除。

    保存したすべての色を削除。

    重複した色の保存を防止。

    ImageMagick または GraphicsMagick によるピクセル色の取得。

    色をコピーしたときのデスクトップ通知。

    通知を無効にするオプション。

    コマンドを指定しない場合のグラフィカルメニュー。

    コマンドラインヘルプ。

    Wayland セッションの確認。

    gettext による国際化。

    複数言語への対応。

使用方法
グラフィカルカラーピッカー

wl-color-picker

画面上の位置を選択します。選択した色がカラ―エディターで開かれ、
クリップボードへコピーして保存する前に調整できます。
クリップボードモード

wl-color-picker clipboard

選択した色を16進数のRGB値として直接コピーします。

#FF5733

保存した色

wl-color-picker saved

保存した色の画面では、次の操作ができます。

    保存した色を開いて編集。

    選択した色をクリップボードへコピー。

    編集した色を保存。

    保存した色を削除。

    保存したすべての色を削除。

保存した色は次の場所に保存されます。

~/.config/wl-color-picker/colors

$XDG_CONFIG_HOME が設定されている場合は、その値が使用されます。
オプション
--no-notify

色をコピーした後のデスクトップ通知を無効にします。

wl-color-picker clipboard --no-notify

--help

wl-color-picker --help

以下の形式も使用できます。

wl-color-picker -h
wl-color-picker help
wl-color-picker ?

コマンド
コマンド	説明
wl-color-picker	グラフィカルカラーピッカーを開く
wl-color-picker clipboard	色を選択して直接クリップボードへコピー
wl-color-picker saved	保存した色を表示
wl-color-picker --help	ヘルプを表示
依存関係

    slurp - 画面上の位置を選択。

    grim

    - 選択した画面領域をキャプチャ。

    YAD - カラーエディターとGUIを提供。

    wl-clipboard - wl-copy を提供。

    libnotify - notify-send を提供。

    gettext - 国際化を提供。

    ImageMagick または GraphicsMagick - キャプチャしたピクセルを16進数の色値に変換。

国際化

wl-color-picker は GNU gettext を使用して翻訳を提供します。

利用可能な翻訳：

    ドイツ語 (de)

    スペイン語 (es)

    フランス語 (fr)

    イタリア語 (it)

    日本語 (ja)

    ポルトガル語 (pt)

    ブラジルポルトガル語 (pt_BR)

    ロシア語 (ru)

    ウクライナ語 (uk)

    中国語 (zh)

翻訳ファイル：

/usr/share/doc/wl-color-picker/po/

コンパイル済みの翻訳：

/usr/share/locale/

言語を指定してテストできます。

LANG=ja_JP.UTF-8 wl-color-picker

翻訳

gettext テンプレート：

/usr/share/doc/wl-color-picker/po/wl-color-picker.pot

新しい翻訳を作成：

msginit \
    --locale=uk \
    --input=po/wl-color-picker.pot \
    --output=po/uk.po

既存の翻訳を更新：

msgmerge \
    --update \
    po/uk.po \
    po/wl-color-picker.pot

翻訳をコンパイル：

msgfmt \
    po/uk.po \
    -o /usr/share/locale/uk/LC_MESSAGES/wl-color-picker.mo

設定

保存した色は次の場所に保存されます。

${XDG_CONFIG_HOME:-$HOME/.config}/wl-color-picker/colors

パッケージ
Arch Linux

AUR からインストール：

yay -S wl-color-picker

インスピレーション

このスクリプトは以下の情報を参考に作成されています。

    https://www.trst.co/simple-colour-picker-in-sway-wayland.html

    https://unix.stackexchange.com/questions/320070/is-there-a-colour-picker-that-works-with-wayland-or-xwayland/523805#523805

アートワーク

アイコンは
Papirus Icon Theme
に含まれる gcolor3 のアイコンを使用しています。

Papirus アイコンデザイナーの皆様に感謝します。
ライセンス

このプロジェクトは MIT License の下で公開されています。
作者

Jefferson González

https://github.com/jgmdev

