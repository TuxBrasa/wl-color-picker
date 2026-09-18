wl-color-picker

Un sencillo selector de color para Wayland y wlroots que utiliza
grim

y
slurp.

wl-color-picker permite seleccionar un color directamente de la pantalla,
editarlo, copiarlo al portapapeles y guardarlo para utilizarlo posteriormente.
Características

    Seleccionar colores de la pantalla mediante slurp y grim.

    Editar el color seleccionado mediante YAD.

    Copiar colores directamente al portapapeles.

    Guardar colores para utilizarlos posteriormente.

    Ver y editar colores guardados.

    Eliminar colores guardados individualmente.

    Eliminar todos los colores guardados.

    Evitar colores guardados duplicados.

    Utilizar ImageMagick o GraphicsMagick para obtener el color del píxel.

    Mostrar notificaciones del sistema al copiar un color.

    Opción para desactivar las notificaciones.

    Menú gráfico cuando no se especifica ningún comando.

    Ayuda desde la línea de comandos.

    Comprobación de la sesión de Wayland.

    Internacionalización mediante gettext.

    Soporte para varios idiomas.

Uso
Selector gráfico

wl-color-picker

Selecciona una posición en la pantalla. El color seleccionado se abrirá en
el editor de colores, donde podrá ajustarse antes de copiarlo al
portapapeles y guardarlo.
Modo portapapeles

wl-color-picker clipboard

El color seleccionado se copia directamente como un valor RGB hexadecimal:

#FF5733

Colores guardados

wl-color-picker saved

Desde la ventana de colores guardados puedes:

    abrir y editar un color guardado;

    copiar el color seleccionado al portapapeles;

    guardar un color editado;

    eliminar un color guardado;

    eliminar todos los colores guardados.

Los colores guardados se almacenan en:

~/.config/wl-color-picker/colors

Se respeta la variable $XDG_CONFIG_HOME cuando está disponible.
Opciones
--no-notify

Desactiva la notificación del sistema después de copiar un color:

wl-color-picker clipboard --no-notify

--help

wl-color-picker --help

También se admiten:

wl-color-picker -h
wl-color-picker help
wl-color-picker ?

Comandos
Comando	Descripción
wl-color-picker	Abrir el selector gráfico de colores
wl-color-picker clipboard	Seleccionar un color y copiarlo directamente al portapapeles
wl-color-picker saved	Mostrar los colores guardados
wl-color-picker --help	Mostrar la ayuda
Dependencias

    slurp - Proporciona el selector de posición en pantalla.

    grim

    - Captura el área seleccionada.

    YAD - Proporciona el editor de colores y la interfaz gráfica.

    wl-clipboard - Proporciona wl-copy.

    libnotify - Proporciona notify-send.

    gettext - Proporciona la internacionalización.

    ImageMagick o GraphicsMagick - Convierte el píxel capturado en un valor hexadecimal.

Internacionalización

wl-color-picker utiliza GNU gettext para las traducciones.

Idiomas disponibles:

    Alemán (de)

    Español (es)

    Francés (fr)

    Italiano (it)

    Japonés (ja)

    Portugués (pt)

    Portugués brasileño (pt_BR)

    Ruso (ru)

    Ucraniano (uk)

    Chino (zh)

Los archivos de traducción se encuentran en:

/usr/share/doc/wl-color-picker/po/

Las traducciones compiladas se instalan en:

/usr/share/locale/

Para probar un idioma:

LANG=es_ES.UTF-8 wl-color-picker

Traducción

La plantilla gettext se encuentra en:

/usr/share/doc/wl-color-picker/po/wl-color-picker.pot

Crear una traducción:

msginit \
    --locale=uk \
    --input=po/wl-color-picker.pot \
    --output=po/uk.po

Actualizar una traducción:

msgmerge \
    --update \
    po/uk.po \
    po/wl-color-picker.pot

Compilar una traducción:

msgfmt \
    po/uk.po \
    -o /usr/share/locale/uk/LC_MESSAGES/wl-color-picker.mo

Configuración

Los colores guardados se almacenan en:

${XDG_CONFIG_HOME:-$HOME/.config}/wl-color-picker/colors

Paquetes
Arch Linux

Instalar desde el
AUR:

yay -S wl-color-picker

Inspiración

Este script fue posible gracias a la información proporcionada en:

    https://www.trst.co/simple-colour-picker-in-sway-wayland.html

    https://unix.stackexchange.com/questions/320070/is-there-a-colour-picker-that-works-with-wayland-or-xwayland/523805#523805

Artwork

El icono fue tomado del icono de gcolor3 incluido en el
Papirus Icon Theme.

Todos los créditos corresponden a los diseñadores de los iconos de Papirus.
Licencia

Este proyecto se distribuye bajo la Licencia MIT.
Autor

Jefferson González

https://github.com/jgmdev
