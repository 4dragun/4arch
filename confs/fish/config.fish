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
alias gc    "~/4arch/scripts/git/commit.sh"
alias gf    "~/4arch/scripts/git/force.sh"
alias s     "~/4arch/scripts/misc/create.sh"
alias clear "command clear; commandline -f clear-screen"

starship init fish | source
