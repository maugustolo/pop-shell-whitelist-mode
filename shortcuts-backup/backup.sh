#!/bin/bash
BACKUP_DIR="$(dirname "$(realpath "$0")")"

echo "Salvando configurações do Pop Shell..."
dconf dump /org/gnome/shell/extensions/pop-shell/ > "$BACKUP_DIR/pop-shell-ext.ini"

echo "Salvando atalhos nativos de gerenciamento de janelas..."
dconf dump /org/gnome/desktop/wm/keybindings/ > "$BACKUP_DIR/gnome-wm.ini"

echo "Salvando atalhos gerais do GNOME Shell..."
dconf dump /org/gnome/shell/keybindings/ > "$BACKUP_DIR/gnome-shell.ini"

echo "Salvando atalhos do Mutter..."
dconf dump /org/gnome/mutter/keybindings/ > "$BACKUP_DIR/gnome-mutter.ini"

echo "Salvando atalhos de mídia e utilitários..."
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > "$BACKUP_DIR/gnome-media.ini"

echo "✅ Backup concluído! Os arquivos .ini foram salvos em: $BACKUP_DIR"
