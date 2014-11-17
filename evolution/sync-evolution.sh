#!/usr/bin/env bash

rm -rf ~/.local/evolution  ~/.share/evolution ~/.cache/evolution ~/.config/evolution

rsync -avz --stats --progress ~/evolution-ok/ ~/

# cp -r ~/evolution-ok/.cache/evolution ~/.cache/evolution
# cp -r ~/evolution-ok/.local/share/evolution ~/.local/share/evolution
# cp -r ~/evolution-ok/.config/evolution ~/.config/evolution
