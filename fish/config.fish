# color
export LSCOLORS=gxfxcxdxbxegedabagacad

# vi
# fish_vi_key_bindings

# balias
balias gs "git status"
balias ... "cd ../../"
balias .... "cd ../../../"

# peco
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

# fzf
#set -U FZF_LEGACY_KEYBINDINGS 0
#set -U FZF_DISABLE_KEYBINDINGS 1
