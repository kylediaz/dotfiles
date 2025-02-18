if status is-interactive
	if [ $TERM = "xterm-kitty" ]
		fish_vi_key_bindings
	else
		fish_default_key_bindings
	end
end


pyenv init - | source

zoxide init fish | source

fzf --fish | source
bind -M insert "ç" fzf-cd-widget
bind -M insert \cf accept-autosuggestion

set -x PATH $PATH /Users/kylediaz/.cargo/bin

# Created by `pipx` on 2024-09-15 06:40:57
set PATH $PATH /Users/kylediaz/.local/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kylediaz/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/kylediaz/Downloads/google-cloud-sdk/path.fish.inc'; end
