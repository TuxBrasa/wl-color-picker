wl-color-picker

Um seletor de cores simples para Wayland e wlroots que utiliza
grim e slurp.

O wl-color-picker permite selecionar uma cor diretamente da tela,
editá-la, copiá-la para a área de transferência e salvá-la para uso
posterior.

Recursos

Selecionar cores da tela usando slurp e grim.

Editar a cor selecionada usando YAD.

Copiar cores diretamente para a área de transferência.

Salvar cores para uso posterior.

Visualizar e editar cores salvas.

Excluir cores salvas individualmente.

Excluir todas as cores salvas.

Evitar cores salvas duplicadas.

Usar ImageMagick ou GraphicsMagick para obter a cor do pixel.

Exibir notificações do sistema ao copiar uma cor.

Opção para desativar as notificações.

Menu gráfico quando nenhum comando é especificado.

Ajuda pela linha de comando.

Verificação da sessão do Wayland.

Internacionalização usando gettext.

Suporte a vários idiomas.

Uso
Seletor gráfico
wl-color-picker


Selecione uma posição na tela. A cor selecionada será aberta no editor
de cores, onde poderá ser ajustada antes de ser copiada para a área de
transferência e salva.

Modo área de transferência
wl-color-picker clipboard


A cor selecionada é copiada diretamente como um valor RGB hexadecimal:

#FF5733

Cores salvas
wl-color-picker saved


Na janela de cores salvas, você pode:

abrir e editar uma cor salva;

copiar a cor selecionada para a área de transferência;

salvar uma cor editada;

excluir uma cor salva;

excluir todas as cores salvas.

As cores salvas são armazenadas em:

~/.config/wl-color-picker/colors


A variável $XDG_CONFIG_HOME é respeitada quando estiver disponível.

Opções
--no-notify

Desativa a notificação do sistema após copiar uma cor:

wl-color-picker clipboard --no-notify

--help
wl-color-picker --help


Também são aceitos:

wl-color-picker -h
wl-color-picker help
wl-color-picker ?

Comandos
Comando	Descrição
wl-color-picker	Abrir o seletor gráfico de cores
wl-color-picker clipboard	Selecionar uma cor e copiá-la diretamente para a área de transferência
wl-color-picker saved	Exibir as cores salvas
wl-color-picker --help	Exibir a ajuda
Dependências

slurp — Fornece o seletor de posição na tela.

grim — Captura a área selecionada.

YAD — Fornece o editor de cores e a interface gráfica.

wl-clipboard — Fornece wl-copy.

libnotify — Fornece notify-send.

gettext — Fornece a internacionalização.

ImageMagick ou GraphicsMagick — Converte o pixel capturado em um valor hexadecimal.

Internacionalização

O wl-color-picker utiliza GNU gettext para as traduções.

Idiomas disponíveis:

Alemão (de)

Espanhol (es)

Francês (fr)

Italiano (it)

Japonês (ja)

Português (pt)

Português brasileiro (pt_BR)

Russo (ru)

Ucraniano (uk)

Chinês (zh)

Os arquivos de tradução encontram-se em:

/usr/share/doc/wl-color-picker/po/


As traduções compiladas são instaladas em:

/usr/share/locale/


Para testar um idioma:

LANG=es_ES.UTF-8 wl-color-picker

Tradução

O modelo gettext encontra-se em:

/usr/share/doc/wl-color-picker/po/wl-color-picker.pot

Criar uma tradução
msginit \
    --locale=uk \
    --input=po/wl-color-picker.pot \
    --output=po/uk.po

Atualizar uma tradução
msgmerge \
    --update \
    po/uk.po \
    po/wl-color-picker.pot

Compilar uma tradução
msgfmt \
    po/uk.po \
    -o /usr/share/locale/uk/LC_MESSAGES/wl-color-picker.mo

Configuração

As cores salvas são armazenadas em:

${XDG_CONFIG_HOME:-$HOME/.config}/wl-color-picker/colors

Pacotes
Arch Linux

Instale pelo AUR:

yay -S wl-color-picker

Inspiração

Este script foi possível graças às informações fornecidas em:

https://www.trst.co/simple-colour-picker-in-sway-wayland.html

https://unix.stackexchange.com/questions/320070/is-there-a-colour-picker-that-works-with-wayland-or-xwayland/523805#523805

Artwork

O ícone foi obtido do ícone do gcolor3 incluído no
Papirus Icon Theme.

Todos os créditos pertencem aos designers dos ícones do Papirus.

Licença

Este projeto é distribuído sob a Licença MIT.

Autor

Jefferson González

https://github.com/jgmdev
