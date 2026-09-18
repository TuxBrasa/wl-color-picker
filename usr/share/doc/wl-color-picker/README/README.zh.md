wl-color-picker

一个简单的 Wayland 和 wlroots 取色器，使用
grim 和 slurp。

wl-color-picker 可以直接从屏幕上选择颜色、编辑颜色、将颜色复制到剪贴板，并保存颜色以供以后使用。

功能

使用 slurp 和 grim 从屏幕上选择颜色。

使用 YAD 编辑选中的颜色。

直接将颜色复制到剪贴板。

保存颜色以供以后使用。

查看和编辑已保存的颜色。

单独删除已保存的颜色。

删除所有已保存的颜色。

避免保存重复的颜色。

使用 ImageMagick 或 GraphicsMagick 获取像素颜色。

复制颜色时显示系统通知。

提供禁用通知的选项。

未指定命令时显示图形菜单。

提供命令行帮助。

检查 Wayland 会话。

使用 gettext 实现国际化。

支持多种语言。

使用方法
图形取色器
wl-color-picker


在屏幕上选择一个位置。选中的颜色将会在颜色编辑器中打开，您可以在复制到剪贴板并保存之前对其进行调整。

剪贴板模式
wl-color-picker clipboard


选中的颜色会直接以十六进制 RGB 值复制到剪贴板：

#FF5733

已保存的颜色
wl-color-picker saved


在已保存颜色窗口中，您可以：

打开并编辑已保存的颜色；

将选中的颜色复制到剪贴板；

保存编辑后的颜色；

删除已保存的颜色；

删除所有已保存的颜色。

已保存的颜色存储在：

~/.config/wl-color-picker/colors


如果 $XDG_CONFIG_HOME 可用，则会使用该变量指定的配置目录。

选项
--no-notify

禁用复制颜色后显示的系统通知：

wl-color-picker clipboard --no-notify

--help
wl-color-picker --help


同时支持：

wl-color-picker -h
wl-color-picker help
wl-color-picker ?

命令
命令	描述
wl-color-picker	打开图形颜色取色器
wl-color-picker clipboard	选择颜色并直接复制到剪贴板
wl-color-picker saved	显示已保存的颜色
wl-color-picker --help	显示帮助信息
依赖

slurp — 提供屏幕位置选择器。

grim — 捕获选定的区域。

YAD — 提供颜色编辑器和图形界面。

wl-clipboard — 提供 wl-copy。

libnotify — 提供 notify-send。

gettext — 提供国际化支持。

ImageMagick 或 GraphicsMagick — 将捕获的像素转换为十六进制颜色值。

国际化

wl-color-picker 使用 GNU gettext 进行翻译。

可用语言：

德语 (de)

西班牙语 (es)

法语 (fr)

意大利语 (it)

日语 (ja)

葡萄牙语 (pt)

巴西葡萄牙语 (pt_BR)

俄语 (ru)

乌克兰语 (uk)

中文 (zh)

翻译文件位于：

/usr/share/doc/wl-color-picker/po/


编译后的翻译文件安装在：

/usr/share/locale/


测试某种语言：

LANG=es_ES.UTF-8 wl-color-picker

翻译

gettext 模板位于：

/usr/share/doc/wl-color-picker/po/wl-color-picker.pot

创建翻译
msginit \
    --locale=uk \
    --input=po/wl-color-picker.pot \
    --output=po/uk.po

更新翻译
msgmerge \
    --update \
    po/uk.po \
    po/wl-color-picker.pot

编译翻译
msgfmt \
    po/uk.po \
    -o /usr/share/locale/uk/LC_MESSAGES/wl-color-picker.mo

配置

已保存的颜色存储在：

${XDG_CONFIG_HOME:-$HOME/.config}/wl-color-picker/colors

软件包
Arch Linux

从 AUR 安装：

yay -S wl-color-picker

灵感来源

本脚本的实现参考了以下资料：

https://www.trst.co/simple-colour-picker-in-sway-wayland.html

https://unix.stackexchange.com/questions/320070/is-there-a-colour-picker-that-works-with-wayland-or-xwayland/523805#523805

Artwork

图标取自 Papirus Icon Theme 中包含的 gcolor3 图标。

所有版权及致谢归属于 Papirus 图标的设计者。

许可证

本项目根据 MIT 许可证发布。

作者

Jefferson González

https://github.com/jgmdev
