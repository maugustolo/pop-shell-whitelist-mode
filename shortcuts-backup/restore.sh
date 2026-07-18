#!/bin/bash
BACKUP_DIR="$(dirname "$(realpath "$0")")"

if [ ! -f "$BACKUP_DIR/pop-shell-ext.ini" ]; then
    echo "Erro: Arquivos de backup não encontrados em $BACKUP_DIR"
    exit 1
fi

echo "Restaurando configurações do Pop Shell..."
dconf load /org/gnome/shell/extensions/pop-shell/ < "$BACKUP_DIR/pop-shell-ext.ini"

echo "Restaurando atalhos nativos de gerenciamento de janelas..."
dconf load /org/gnome/desktop/wm/keybindings/ < "$BACKUP_DIR/gnome-wm.ini"

echo "Restaurando atalhos gerais do GNOME Shell..."
dconf load /org/gnome/shell/keybindings/ < "$BACKUP_DIR/gnome-shell.ini"

echo "Restaurando atalhos do Mutter..."
dconf load /org/gnome/mutter/keybindings/ < "$BACKUP_DIR/gnome-mutter.ini"

echo "Restaurando atalhos de mídia e utilitários..."
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < "$BACKUP_DIR/gnome-media.ini"

echo "✅ Restauração concluída com sucesso!"
