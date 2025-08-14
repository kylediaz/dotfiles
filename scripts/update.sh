# Updates repository with current dotfiles

dots=$(pwd)/dotfiles

copy_config() {
    local source="$1"
    local dest="$2"
    
    if [ -d "$source" ]; then
        cp -R "$source" "$dest"
    fi
}

copy_file() {
    local source="$1"
    local dest="$2"
    
    if [ -f "$source" ]; then
        mkdir -p "$(dirname "$dest")"
        cp "$source" "$dest"
    fi
}

# Warp
if [ -d ~/.warp ]; then
    mkdir -p $dots/warp
    cp -R ~/.warp/* $dots/warp
fi

# Config directories
copy_config ~/.config/aerospace $dots
copy_config ~/.config/fish $dots
copy_config ~/.config/gh $dots
copy_file ~/.config/karabiner/karabiner.json $dots/karabiner/karabiner.json
copy_config ~/.config/nvim $dots
copy_config ~/.config/fastfetch $dots
copy_config ~/.config/ghostty $dots
copy_config ~/.config/posting $dots

# Zed
mkdir -p $dots/zed
copy_file ~/.config/zed/settings.json $dots/zed/settings.json
copy_file ~/.config/zed/keymap.json $dots/zed/keymap.json
copy_config ~/.config/zed/themes $dots/zed/themes
