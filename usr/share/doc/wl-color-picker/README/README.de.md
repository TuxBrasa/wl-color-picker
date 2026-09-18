wl-color-picker

Ein einfacher Farbwähler für Wayland und wlroots, der
grim

und
slurp verwendet.

wl-color-picker ermöglicht es, eine Farbe direkt vom Bildschirm auszuwählen,
die ausgewählte Farbe zu bearbeiten, in die Zwischenablage zu kopieren und
Farben für eine spätere Verwendung zu speichern.
Funktionen

    Farbe mit slurp und grim vom Bildschirm auswählen.

    Ausgewählte Farbe mit YAD bearbeiten.

    Farben direkt in die Zwischenablage kopieren.

    Farben zur späteren Verwendung speichern.

    Gespeicherte Farben anzeigen und bearbeiten.

    Einzelne gespeicherte Farben löschen.

    Alle gespeicherten Farben löschen.

    Doppelte gespeicherte Farben vermeiden.

    ImageMagick oder GraphicsMagick zur Farbauswertung verwenden.

    Desktop-Benachrichtigungen beim Kopieren einer Farbe.

    Option zum Deaktivieren von Benachrichtigungen.

    Grafisches Menü, wenn kein Befehl angegeben wird.

    Hilfe über die Kommandozeile.

    Überprüfung der Wayland-Sitzung.

    Internationalisierung mit gettext.

    Unterstützung mehrerer Sprachen.

Verwendung
Grafischer Farbwähler

wl-color-picker

Wählen Sie eine Position auf dem Bildschirm. Die ausgewählte Farbe wird im
Farbeditor geöffnet und kann angepasst werden, bevor sie in die
Zwischenablage kopiert und gespeichert wird.
Zwischenablage-Modus

wl-color-picker clipboard

Die ausgewählte Farbe wird direkt als hexadezimaler RGB-Wert kopiert:

#FF5733

Gespeicherte Farben

wl-color-picker saved

Im Fenster für gespeicherte Farben können Sie:

    eine gespeicherte Farbe öffnen und bearbeiten;

    die ausgewählte Farbe in die Zwischenablage kopieren;

    eine bearbeitete Farbe speichern;

    eine gespeicherte Farbe löschen;

    alle gespeicherten Farben löschen.

Gespeicherte Farben befinden sich in:

~/.config/wl-color-picker/colors

$XDG_CONFIG_HOME wird berücksichtigt, wenn es gesetzt ist.
Optionen
--no-notify

Deaktiviert die Desktop-Benachrichtigung nach dem Kopieren einer Farbe:

wl-color-picker clipboard --no-notify

--help

wl-color-picker --help

Auch folgende Varianten werden unterstützt:

wl-color-picker -h
wl-color-picker help
wl-color-picker ?

Befehle
Befehl	Beschreibung
wl-color-picker	Grafischen Farbwähler öffnen
wl-color-picker clipboard	Farbe auswählen und direkt in die Zwischenablage kopieren
wl-color-picker saved	Gespeicherte Farben anzeigen
wl-color-picker --help	Hilfe anzeigen
Abhängigkeiten

    slurp - Auswahl der Bildschirmposition.

    grim

    - Erfasst den ausgewählten Bildschirmbereich.

    YAD - Farbeditor und grafische Benutzeroberfläche.

    wl-clipboard - Stellt wl-copy bereit.

    libnotify - Stellt notify-send bereit.

    gettext - Internationalisierung.

    ImageMagick oder GraphicsMagick - Konvertiert den erfassten Pixel in einen hexadezimalen Farbwert.

Internationalisierung

wl-color-picker verwendet GNU gettext für Übersetzungen.

Verfügbare Übersetzungen:

    Deutsch (de)

    Spanisch (es)

    Französisch (fr)

    Italienisch (it)

    Japanisch (ja)

    Portugiesisch (pt)

    Brasilianisches Portugiesisch (pt_BR)

    Russisch (ru)

    Ukrainisch (uk)

    Chinesisch (zh)

Die Übersetzungsdateien befinden sich in:

/usr/share/doc/wl-color-picker/po/

Kompilierte Übersetzungen werden installiert unter:

/usr/share/locale/

Eine bestimmte Sprache kann getestet werden mit:

LANG=de_DE.UTF-8 wl-color-picker

Übersetzung

Die gettext-Vorlage befindet sich unter:

/usr/share/doc/wl-color-picker/po/wl-color-picker.pot

Eine neue Übersetzung erstellen:

msginit \
    --locale=uk \
    --input=po/wl-color-picker.pot \
    --output=po/uk.po

Eine Übersetzung aktualisieren:

msgmerge \
    --update \
    po/uk.po \
    po/wl-color-picker.pot

Eine Übersetzung kompilieren:

msgfmt \
    po/uk.po \
    -o /usr/share/locale/uk/LC_MESSAGES/wl-color-picker.mo

Konfiguration

Gespeicherte Farben befinden sich in:

${XDG_CONFIG_HOME:-$HOME/.config}/wl-color-picker/colors

Pakete
Arch Linux

Installation über das
AUR:

yay -S wl-color-picker

Inspiration

Dieses Skript basiert auf Informationen aus:

    https://www.trst.co/simple-colour-picker-in-sway-wayland.html

    https://unix.stackexchange.com/questions/320070/is-there-a-colour-picker-that-works-with-wayland-or-xwayland/523805#523805

Artwork

Das Symbol stammt aus dem gcolor3-Symbol des
Papirus Icon Theme.

Alle Rechte und Danksagungen gehen an die Designer des Papirus-Icon-Themes.
Lizenz

Dieses Projekt steht unter der MIT-Lizenz.
Autor

Jefferson González

https://github.com/jgmdev
