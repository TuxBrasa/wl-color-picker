wl-color-picker

Un semplice selettore di colori per Wayland e wlroots che utilizza
grim

e
slurp.

wl-color-picker consente di selezionare un colore direttamente dallo
schermo, modificarlo, copiarlo negli appunti e salvarlo per un utilizzo
successivo.
Funzionalità

    Selezione di un colore dallo schermo tramite slurp e grim.

    Modifica del colore selezionato tramite YAD.

    Copia dei colori direttamente negli appunti.

    Salvataggio dei colori per un utilizzo successivo.

    Visualizzazione e modifica dei colori salvati.

    Eliminazione dei singoli colori salvati.

    Eliminazione di tutti i colori salvati.

    Prevenzione dei colori duplicati.

    Utilizzo di ImageMagick o GraphicsMagick per ottenere il colore del pixel.

    Notifiche desktop durante la copia di un colore.

    Opzione per disabilitare le notifiche.

    Menu grafico quando non viene specificato alcun comando.

    Guida dalla riga di comando.

    Verifica della sessione Wayland.

    Internazionalizzazione tramite gettext.

    Supporto per più lingue.

Utilizzo
Selettore grafico

wl-color-picker

Seleziona una posizione sullo schermo. Il colore selezionato verrà aperto
nell'editor dei colori e potrà essere modificato prima di essere copiato
negli appunti e salvato.
Modalità appunti

wl-color-picker clipboard

Il colore selezionato viene copiato direttamente come valore RGB esadecimale:

#FF5733

Colori salvati

wl-color-picker saved

Dalla finestra dei colori salvati puoi:

    aprire e modificare un colore salvato;

    copiare il colore selezionato negli appunti;

    salvare un colore modificato;

    eliminare un colore salvato;

    eliminare tutti i colori salvati.

I colori salvati vengono memorizzati in:

~/.config/wl-color-picker/colors

La variabile $XDG_CONFIG_HOME viene utilizzata quando disponibile.
Opzioni
--no-notify

Disabilita la notifica desktop dopo la copia di un colore:

wl-color-picker clipboard --no-notify

--help

wl-color-picker --help

Sono supportate anche:

wl-color-picker -h
wl-color-picker help
wl-color-picker ?

Comandi
Comando	Descrizione
wl-color-picker	Aprire il selettore grafico dei colori
wl-color-picker clipboard	Selezionare un colore e copiarlo direttamente negli appunti
wl-color-picker saved	Mostrare i colori salvati
wl-color-picker --help	Mostrare la guida
Dipendenze

    slurp - Seleziona la posizione sullo schermo.

    grim

    - Cattura l'area selezionata.

    YAD - Editor dei colori e interfaccia grafica.

    wl-clipboard - Fornisce wl-copy.

    libnotify - Fornisce notify-send.

    gettext - Internazionalizzazione.

    ImageMagick o GraphicsMagick - Converte il pixel acquisito in un valore esadecimale.

Internazionalizzazione

wl-color-picker utilizza GNU gettext per le traduzioni.

Traduzioni disponibili:

    Tedesco (de)

    Spagnolo (es)

    Francese (fr)

    Italiano (it)

    Giapponese (ja)

    Portoghese (pt)

    Portoghese brasiliano (pt_BR)

    Russo (ru)

    Ucraino (uk)

    Cinese (zh)

I file di traduzione si trovano in:

/usr/share/doc/wl-color-picker/po/

Le traduzioni compilate vengono installate in:

/usr/share/locale/

Per testare una lingua:

LANG=it_IT.UTF-8 wl-color-picker

Traduzione

Il modello gettext si trova in:

/usr/share/doc/wl-color-picker/po/wl-color-picker.pot

Creare una traduzione:

msginit \
    --locale=uk \
    --input=po/wl-color-picker.pot \
    --output=po/uk.po

Aggiornare una traduzione:

msgmerge \
    --update \
    po/uk.po \
    po/wl-color-picker.pot

Compilare una traduzione:

msgfmt \
    po/uk.po \
    -o /usr/share/locale/uk/LC_MESSAGES/wl-color-picker.mo

Configurazione

I colori salvati vengono memorizzati in:

${XDG_CONFIG_HOME:-$HOME/.config}/wl-color-picker/colors

Pacchetti
Arch Linux

Installazione dall'
AUR:

yay -S wl-color-picker

Ispirazione

Questo script è stato realizzato grazie alle informazioni fornite da:

    https://www.trst.co/simple-colour-picker-in-sway-wayland.html

    https://unix.stackexchange.com/questions/320070/is-there-a-colour-picker-that-works-with-wayland-or-xwayland/523805#523805

Artwork

L'icona è stata presa dall'icona gcolor3 inclusa nel
Papirus Icon Theme.

Tutti i crediti vanno ai designer delle icone Papirus.
Licenza

Questo progetto è distribuito con licenza MIT.
Autore

Jefferson González

https://github.com/jgmdev
