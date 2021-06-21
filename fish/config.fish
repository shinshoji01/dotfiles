# color
set -U fish_color_normal normal
set -U fish_color_command FF9400
set -U fish_color_quote BF9C30
set -U fish_color_redirection BF5B30
set -U fish_color_end FF4C00
set -U fish_color_error FFDD73
set -U fish_color_param FFC000
set -U fish_color_comment A63100
set -U fish_color_match --background=brblue
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion FFC473
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan
set -x LS_COLORS 'tw=0;107:ow=0;107'

# vi
# fish_vi_key_bindings

# balias
balias gs "git status"
balias ... "cd ../../"
balias .... "cd ../../../"
balias drun "docker run --rm -it -v ~:/work"

# peco
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

# fzf
#set -U FZF_LEGACY_KEYBINDINGS 0
#set -U FZF_DISABLE_KEYBINDINGS 1

export LSCOLORS=gxfxcxdxbxegedabagacad
