function starship_transient_prompt_func
	tput cuu1
	starship module character
end

function prompt_newline --on-event fish_postexec
	echo
end

if status is-interactive
  set -U fish_greeting
end

alias y     "yazi"
alias ls    "lsd"
alias cat   "bat"
alias gi    "~/4arch/scripts/gi.sh"
alias gc    "~/4arch/scripts/gc.sh"
alias gf    "~/4arch/scripts/gf.sh"
alias s     "~/4arch/scripts/scrpt.sh"
alias clear "command clear; commandline -f clear-screen"

function yay
  echo
  command yay $argv
end

starship init fish | source
