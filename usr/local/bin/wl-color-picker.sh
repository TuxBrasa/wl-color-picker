#!/usr/bin/env bash
#
# Jefferson González - https://github.com/jgmdev
#
# Version: v1.5
# License: MIT
#
# A script to easily pick a color on a wayland session by using:
# slurp to select the location, grim to get the pixel, convert
# to make the pixel a hex number and zenity to display a nice color
# selector dialog where the picked color can be tweaked further.
#
# The script was possible thanks to the useful information on:
#
#
# A simple color picker for Wayland/wlroots using:
#
# slurp, grim, ImageMagick/GraphicsMagick, yad and wl-copy.
#
# Selected colors can be saved and reused later.
#
# Colors are stored in:
#
# ~/.config/wl-color-picker/colors
#
#
# https://www.trst.co/simple-colour-picker-in-sway-wayland.html
# https://unix.stackexchange.com/questions/320070/is-there-a-colour-picker-that-works-with-wayland-or-xwayland/523805#523805
#
# ----------------------------------------------------------------------------------------

export TEXTDOMAIN="wl-color-picker"
export TEXTDOMAINDIR="/usr/share/locale"

# ----------------------------------------------------------------------------------------
# Initial configuration
# ----------------------------------------------------------------------------------------

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/wl-color-picker"
COLORS_FILE="$CONFIG_DIR/colors"

mkdir -p "$CONFIG_DIR" || exit 1
touch "$COLORS_FILE" || exit 1

CLIPBOARD=0
NO_NOTIFY=0
COMMAND=""

logo="/usr/share/icons/hicolor/512x512/apps/wl-color-picker.png"

# ----------------------------------------------------------------------------------------
# gettext
# ----------------------------------------------------------------------------------------

if ! command -v gettext >/dev/null 2>&1; then

case "${LANG:-en}" in
    pt_BR*|pt_PT*|pt*)
        msg="O programa gettext não está instalado. Por favor, instale-o para continuar."
        ;;
    es*)
        msg="El programa gettext no está instalado. Por favor, instálelo para continuar."
        ;;
    fr*)
        msg="Le programme gettext n'est pas installé. Veuillez l'installer pour continuer."
        ;;
    de*)
        msg="Das Programm gettext ist nicht installiert. Bitte installieren Sie es, um fortzufahren."
        ;;
    it*)
        msg="Il programma gettext non è installato. Per favore, installalo per continuare."
        ;;
    ja*)
        msg="gettext プログラムがインストールされていません。続行するにはインストールしてください。"
        ;;
    ru*)
        msg="Программа gettext не установлена. Пожалуйста, установите её, чтобы продолжить."
        ;;
    uk*)
        msg="Програму gettext не встановлено. Будь ласка, встановіть її, щоб продовжити."
        ;;

    zh*)
        msg="未安装 gettext 程序。请安装后再继续。"
        ;;
    *)
        msg="The gettext program is not installed. Please install it to continue."
        ;;
esac

printf '\n%s\n\n' "$msg"
exit 1


fi

# ----------------------------------------------------------------------------------------
# Helper: show error
# ----------------------------------------------------------------------------------------

show_error()
{
local title="$1"
local message="$2"

if command -v yad >/dev/null 2>&1; then

    yad --center \
        --error \
        --window-icon "$logo" \
        --title="$title" \
        --text="$message" \
        --buttons-layout=center \
        --button="OK"  \
        --width="450"
else

    printf '%s\n' "$message" >&2

fi


}

# ----------------------------------------------------------------------------------------
# Dependencies
# ----------------------------------------------------------------------------------------

check_dependencies()
{
local missing=""

if ! command -v yad >/dev/null 2>&1; then
    missing="$missing yad"
fi

if ! command -v wl-copy >/dev/null 2>&1; then
    missing="$missing wl-copy"
fi

if ! command -v notify-send >/dev/null 2>&1; then
    missing="$missing notify-send"
fi

if ! command -v slurp >/dev/null 2>&1; then
    missing="$missing slurp"
fi

if ! command -v grim >/dev/null 2>&1; then
    missing="$missing grim"
fi

if ! command -v gm >/dev/null 2>&1 &&
   ! command -v magick >/dev/null 2>&1; then
    missing="$missing ImageMagick/GraphicsMagick"
fi

if [ -n "$missing" ]; then

    show_error \
        "$(gettext "Missing dependencies")" \
        "$(printf '%s\n\n%s\n\n%s' \
            "$(gettext "The following programs are not installed:")" \
            "$missing" \
            "$(gettext "Please install them before running wl-color-picker.")")"

    return 1
fi

return 0


}

# ----------------------------------------------------------------------------------------
# Check Wayland
# ----------------------------------------------------------------------------------------

check_wayland()
{
if [ -z "${WAYLAND_DISPLAY:-}" ]; then

    show_error \
        "$(gettext "No Wayland session found.")" \
        "$(gettext "This color picker must be run under a valid Wayland session.")"

    return 1
fi

return 0


}

# ----------------------------------------------------------------------------------------
# Validate hexadecimal color
# ----------------------------------------------------------------------------------------

is_valid_color()
{
[[ "$1" =~ ^#[0-9A-Fa-f]{6}$ ]]
}

# ----------------------------------------------------------------------------------------
# Normalize color
# ----------------------------------------------------------------------------------------

normalize_color()
{
local color="$1"

if is_valid_color "$color"; then
    printf '%s\n' "${color^^}"
    return 0
fi

return 1


}

# ----------------------------------------------------------------------------------------
# Save color
# ----------------------------------------------------------------------------------------

save_color()
{
local color="$1"
local normalized

normalized=$(normalize_color "$color") || return 1

if ! grep -Fxq "$normalized" "$COLORS_FILE" 2>/dev/null; then
    printf '%s\n' "$normalized" >> "$COLORS_FILE"
fi


}

# ----------------------------------------------------------------------------------------
# Delete color
# ----------------------------------------------------------------------------------------

delete_color()
{
local color="$1"
local tmp

[ -z "$color" ] && return 0

tmp=$(mktemp) || return 1

if grep -Fxv "$color" "$COLORS_FILE" > "$tmp"; then
    :
fi

if ! mv "$tmp" "$COLORS_FILE"; then
    rm -f "$tmp"
    return 1
fi

return 0


}

# ----------------------------------------------------------------------------------------
# Clear saved colors
# ----------------------------------------------------------------------------------------

clear_colors()
{
: > "$COLORS_FILE"
}

# ----------------------------------------------------------------------------------------
# Get selected color
# ----------------------------------------------------------------------------------------

get_color()
{
local position
local result
local image

position=$(slurp -b 00000000 -p 2>/dev/null)

# User cancelled slurp
if [ -z "$position" ]; then
    return 1
fi

image=$(mktemp --suffix=.png) || return 1

# Capture selected pixel/area.
if ! grim -g "$position" "$image" 2>/dev/null; then
    rm -f "$image"
    return 1
fi

result=""

# GraphicsMagick
if command -v gm >/dev/null 2>&1; then

    result=$(
        gm convert "$image" \
            -depth 8 \
            -format '#%[pixel:p{0,0}]' \
            info: 2>/dev/null
    )

# ImageMagick
elif command -v magick >/dev/null 2>&1; then

    result=$(
        magick "$image" \
            -depth 8 \
            -format '#%[hex:p{0,0}]' \
            info: 2>/dev/null
    )

fi

rm -f "$image"

# Normalize possible output.
result="${result%%$'\n'*}"

if is_valid_color "$result"; then
    printf '%s\n' "${result^^}"
    return 0
fi

return 1


}

# ----------------------------------------------------------------------------------------
# Open YAD color editor
# ----------------------------------------------------------------------------------------

edit_color()
{
local initial_color="$1"
local rgb_color

rgb_color=$(
    yad --center \
        --color \
        --window-icon "$logo" \
        --title="$(gettext "Select color")" \
        --init-color="$initial_color" \
        --buttons-layout=center \
        --button="$(gettext "Cancel"):1" \
        --button="$(gettext "OK"):0"
)

# User cancelled
[ -z "$rgb_color" ] && return 1

# YAD normally returns #RRGGBB.
# Normalize it before using it.
if is_valid_color "$rgb_color"; then
    printf '%s\n' "${rgb_color^^}"
    return 0
fi

return 1


}

# ----------------------------------------------------------------------------------------
# Copy color
# ----------------------------------------------------------------------------------------

copy_color()
{
local color="$1"

printf '%s' "$color" | wl-copy -n

if [ "$NO_NOTIFY" -ne 1 ]; then
    notify-send \
        "$(gettext "Color copied to clipboard.")" \
        "$color"
fi


}

# ----------------------------------------------------------------------------------------
# Pick color normally
# ----------------------------------------------------------------------------------------

pick_color()
{
local color
local edited_color

check_wayland || return 1

color=$(get_color)

# User cancelled or failed
if [ -z "$color" ]; then
    return 0
fi

edited_color=$(edit_color "$color")

# User cancelled YAD color dialog
if [ -z "$edited_color" ]; then
    return 0
fi

copy_color "$edited_color"
save_color "$edited_color"

return 0


}

# ----------------------------------------------------------------------------------------
# Pick color directly to clipboard
# ----------------------------------------------------------------------------------------

pick_color_clipboard()
{
local color

check_wayland || return 1

color=$(get_color)

# User cancelled or failed
if [ -z "$color" ]; then
    return 0
fi

copy_color "$color"
save_color "$color"

return 0


}

# ----------------------------------------------------------------------------------------
# Show saved colors
# ----------------------------------------------------------------------------------------

show_saved_colors()
{
local selected
local status
local edited_color

while true; do

    # No saved colors
    if [ ! -s "$COLORS_FILE" ]; then

        yad --center \
            --window-icon "$logo" \
            --info \
            --title="$(gettext "Saved colors")" \
            --text="$(gettext "No saved colors.")" \
            --buttons-layout=center \
            --button="$(gettext "OK"):0" \
            --width="300"

        return 0
    fi

    selected=$(
        yad --center \
            --list \
            --window-icon "$logo" \
            --title="$(gettext "Saved colors")" \
            --text="$(gettext "Select a saved color.")" \
            --width=380 \
            --height=400 \
            --column="$(gettext "Color")" \
            --print-column=1 \
            --separator="" \
            --buttons-layout=center \
            --button="$(gettext "Open"):0" \
            --button="$(gettext "Delete"):2" \
            --button="$(gettext "Clear all"):3" \
            --button="$(gettext "Close"):1" \
            < "$COLORS_FILE"
    )

    status=$?

    case "$status" in

        0)
            [ -z "$selected" ] && continue

            edited_color=$(edit_color "$selected")

            if [ -n "$edited_color" ]; then

                copy_color "$edited_color"

                # Save the new color.
                save_color "$edited_color"
            fi
            ;;

        2)
            [ -n "$selected" ] && delete_color "$selected"
            ;;

        3)
            clear_colors
            ;;

        *)
            return 0
            ;;

    esac

done


}

# ----------------------------------------------------------------------------------------
# Help
# ----------------------------------------------------------------------------------------

showhelp()
{
echo "$(gettext "A simple color picker for Wayland/wlroots.")"
echo
echo "$(gettext "Usage"):"
echo " wl-color-picker [command] [options]"
echo
echo "$(gettext "Commands"):"
echo " clipboard $(gettext "Select a color and copy it directly to the clipboard")"
echo " saved $(gettext "Show saved colors")"
echo
echo "$(gettext "Options"):"
echo " --no-notify $(gettext "Don't show a system notification of copied color")"
echo " -h, --help $(gettext "Show this help message")"
}

# ----------------------------------------------------------------------------------------
# Main menu
# ----------------------------------------------------------------------------------------

show_menu()
{
local choice
local status

choice=$(
    yad --center \
        --window-icon "$logo" \
        --list \
        --radiolist \
        --title="$(gettext "WL Color Picker")" \
        --text="$(gettext "Choose an option:")" \
        --width=400 \
        --height=250 \
        --column="" \
        --column="$(gettext "Option")" \
        TRUE "$(gettext "Pick a color")" \
        FALSE "$(gettext "Saved colors")" \
        --print-column=2 \
        --separator="" \
        --buttons-layout=center \
        --button="$(gettext "Cancel"):1" \
        --button="$(gettext "Select"):0"
)

status=$?

[ "$status" -ne 0 ] && return 1

case "$choice" in

    "$(gettext "Pick a color")")
        COMMAND="pick"
        ;;

    "$(gettext "Saved colors")")
        COMMAND="saved"
        ;;

    *)
        return 1
        ;;

esac

return 0


}

# ----------------------------------------------------------------------------------------
# Parse options
# ----------------------------------------------------------------------------------------

while [ "$#" -gt 0 ]; do

case "$1" in

    -h|--help|help|\?)
        showhelp
        exit 0
        ;;

    clipboard)
        if [ -n "$COMMAND" ] && [ "$COMMAND" != "clipboard" ]; then
            show_error \
                "$(gettext "Invalid command")" \
                "$(gettext "Only one command can be specified.")"
            exit 1
        fi

        COMMAND="clipboard"
        ;;

    saved)
        if [ -n "$COMMAND" ] && [ "$COMMAND" != "saved" ]; then
            show_error \
                "$(gettext "Invalid command")" \
                "$(gettext "Only one command can be specified.")"
            exit 1
        fi

        COMMAND="saved"
        ;;

    --no-notify)
        NO_NOTIFY=1
        ;;

    *)
        show_error \
            "$(gettext "Invalid option")" \
            "$(printf '%s\n\n%s' \
                "$(gettext "Unknown option:") $1" \
                "$(gettext "Use --help to see available options.")")"
        exit 1
        ;;

esac

shift


done

# ----------------------------------------------------------------------------------------
# No command: show menu
# ----------------------------------------------------------------------------------------

if [ -z "$COMMAND" ]; then

show_menu || exit 0


fi

# ----------------------------------------------------------------------------------------
# Execute command
# ----------------------------------------------------------------------------------------

case "$COMMAND" in

pick)
    check_dependencies || exit 1
    pick_color
    ;;

clipboard)
    check_dependencies || exit 1
    pick_color_clipboard
    ;;

saved)

    # Saved colors only need wl-copy and notify-send.
    # They don't need slurp/grim/ImageMagick.

    if ! command -v wl-copy >/dev/null 2>&1 ||
       ! command -v notify-send >/dev/null 2>&1; then

        show_error \
            "$(gettext "Missing dependencies")" \
            "$(gettext "wl-copy and notify-send are required to manage saved colors.")"

        exit 1
    fi

    show_saved_colors
    ;;

*)
    exit 1
    ;;


esac

exit 0

