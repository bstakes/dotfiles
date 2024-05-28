show_kubetmux() {
  local index=$1
  local icon="$(get_tmux_option "@catppuccin_kubetmux_icon" "#[fg="$thm_blue"]⎈")"
  local color="$(get_tmux_option "@catppuccin_kubetmux_color" "$thm_black")"
  local text="$(get_tmux_option "@catppuccin_kubetmux_text" "#(KUBE_TMUX_SYMBOL_ENABLE=false /bin/bash $HOME/.tmux/plugins/kube-tmux/kube.tmux black red green)")"

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )
	
  echo "$module"
}
