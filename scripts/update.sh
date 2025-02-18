# Updates repository with current dotfiles

dots=$(pwd)/dotfiles

mkdir -p $dots/warp
cp -R ~/.warp/* $dots/warp

cp -R ~/.config/aerospace $dots
cp -R ~/.config/fish $dots
cp -R ~/.config/gh $dots
cp -R ~/.config/karabiner $dots
cp -R ~/.config/nvim $dots
cp -R ~/.config/fastfetch $dots

mkdir -p $dots/zed
cp ~/.config/zed/settings.json $dots/zed/
cp ~/.config/zed/keymap.json $dots/zed/
cp -R ~/.config/zed/themes $dots/zed/themes
