#!/usr/bin/env bash

# Terminal name
TERMINAL="$1"

# Call the helper script with each setting
bash $HOME/nix/modules/home/programs/plasma_helpers/add_to_kdeglobals.sh "General" "TerminalService=$TERMINAL.desktop"
bash $HOME/nix/modules/home/programs/plasma_helpers/add_to_kdeglobals.sh "General" "TerminalApplication=$TERMINAL"

echo "Terminal settings updated in ~/.config/kdeglobals"