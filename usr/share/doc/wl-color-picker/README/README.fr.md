wl-color-picker

Un sélecteur de couleurs simple pour Wayland et wlroots, utilisant
grim

et
slurp.

wl-color-picker permet de sélectionner une couleur directement à l'écran,
de la modifier, de la copier dans le presse-papiers et de l'enregistrer
pour une utilisation ultérieure.
Fonctionnalités

    Sélectionner une couleur à l'écran avec slurp et grim.

    Modifier la couleur sélectionnée avec YAD.

    Copier les couleurs directement dans le presse-papiers.

    Enregistrer des couleurs pour une utilisation ultérieure.

    Afficher et modifier les couleurs enregistrées.

    Supprimer des couleurs enregistrées individuellement.

    Supprimer toutes les couleurs enregistrées.

    Éviter les doublons.

    Utiliser ImageMagick ou GraphicsMagick pour extraire la couleur du pixel.

    Afficher des notifications lors de la copie d'une couleur.

    Désactiver les notifications.

    Afficher un menu graphique lorsqu'aucune commande n'est spécifiée.

    Afficher l'aide depuis la ligne de commande.

    Vérifier la session Wayland.

    Utiliser gettext pour l'internationalisation.

    Prendre en charge plusieurs langues.

Utilisation
Sélecteur graphique

wl-color-picker

Sélectionnez une position à l'écran. La couleur sélectionnée sera ouverte
dans l'éditeur de couleurs afin de pouvoir être ajustée avant d'être copiée
dans le presse-papiers et enregistrée.
Mode presse-papiers

wl-color-picker clipboard

La couleur sélectionnée est directement copiée sous forme de valeur RGB
hexadécimale :

#FF5733

Couleurs enregistrées

wl-color-picker saved

Depuis la fenêtre des couleurs enregistrées, vous pouvez :

    ouvrir et modifier une couleur enregistrée ;

    copier la couleur sélectionnée dans le presse-papiers ;

    enregistrer une couleur modifiée ;

    supprimer une couleur ;

    supprimer toutes les couleurs.

Les couleurs sont enregistrées dans :

~/.config/wl-color-picker/colors

La variable $XDG_CONFIG_HOME est utilisée lorsqu'elle est définie.
Options
--no-notify

Désactive la notification du bureau après la copie d'une couleur :

wl-color-picker clipboard --no-notify

--help

wl-color-picker --help

Les variantes suivantes sont également prises en charge :

wl-color-picker -h
wl-color-picker help
wl-color-picker ?

Commandes
Commande	Description
wl-color-picker	Ouvrir le sélecteur de couleurs graphique
wl-color-picker clipboard	Sélectionner une couleur et la copier directement dans le presse-papiers
wl-color-picker saved	Afficher les couleurs enregistrées
wl-color-picker --help	Afficher l'aide
Dépendances

    slurp - Sélection de la position à l'écran.

    grim

    - Capture la zone sélectionnée.

    YAD - Éditeur de couleurs et interface graphique.

    wl-clipboard - Fournit wl-copy.

    libnotify - Fournit notify-send.

    gettext - Internationalisation.

    ImageMagick ou GraphicsMagick - Convertit le pixel capturé en valeur hexadécimale.

Internationalisation

wl-color-picker utilise GNU gettext pour les traductions.

Traductions disponibles :

    Allemand (de)

    Espagnol (es)

    Français (fr)

    Italien (it)

    Japonais (ja)

    Portugais (pt)

    Portugais brésilien (pt_BR)

    Russe (ru)

    Ukrainien (uk)

    Chinois (zh)

Les fichiers de traduction se trouvent dans :

/usr/share/doc/wl-color-picker/po/

Les traductions compilées sont installées dans :

/usr/share/locale/

Pour tester une langue :

LANG=fr_FR.UTF-8 wl-color-picker

Traduction

Le modèle gettext se trouve dans :

/usr/share/doc/wl-color-picker/po/wl-color-picker.pot

Créer une traduction :

msginit \
    --locale=uk \
    --input=po/wl-color-picker.pot \
    --output=po/uk.po

Mettre à jour une traduction :

msgmerge \
    --update \
    po/uk.po \
    po/wl-color-picker.pot

Compiler une traduction :

msgfmt \
    po/uk.po \
    -o /usr/share/locale/uk/LC_MESSAGES/wl-color-picker.mo

Configuration

Les couleurs enregistrées sont stockées dans :

${XDG_CONFIG_HOME:-$HOME/.config}/wl-color-picker/colors

Paquets
Arch Linux

Installer depuis l'
AUR :

yay -S wl-color-picker

Inspiration

Ce script s'appuie sur les informations fournies par :

    https://www.trst.co/simple-colour-picker-in-sway-wayland.html

    https://unix.stackexchange.com/questions/320070/is-there-a-colour-picker-that-works-with-wayland-or-xwayland/523805#523805

Artwork

L'icône provient de l'icône gcolor3 fournie avec le
Papirus Icon Theme.

Tous les crédits reviennent aux concepteurs des icônes Papirus.
Licence

Ce projet est distribué sous licence MIT.
Auteur

Jefferson González

https://github.com/jgmdev

