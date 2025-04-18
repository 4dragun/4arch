if status is-interactive
  set -U fish_greeting
end

alias y="yazi"
alias ls="lsd"
alias cat="bat"
alias gi="~/4arch/scripts/gi.sh"
alias gc="~/4arch/scripts/gc.sh"
alias gp="~/4arch/scripts/gp.sh"

starship init fish | source
