format = """
$os\
$username\
$directory\
$git_branch\
$git_status\
$c\
$elixir\
$elm\
$golang\
$gradle\
$haskell\
$java\
$julia\
$nodejs\
$nim\
$rust\
$scala\
$docker_context\
$time   \
"""

add_newline = false

[username]
show_always = true
style_user = "bold italic fg:#FD4985"
style_root = "bg:#9A348E"
format = '[$user ]($style)'
disabled = false

[os]
style = "bg:#9A348E"
disabled = true

[directory]
style = "bold italic fg:#5577FF"
format = "[ $path ]($style)"
truncation_length = 3
truncation_symbol = "…/"

[directory.substitutions]
"~" = " "
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = " "
"Pictures" = " "

[c]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[docker_context]
symbol = " "
style = "bg:#06969A"
format = '[ $symbol $context ]($style)'

[elixir]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[elm]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[git_branch]
symbol = ""
style = "bold italic fg:#AD3DFF"
format = '[ $symbol $branch ]($style)'

[git_status]
style = "fg:#AD3DFF"
format = '[$all_status$ahead_behind ]($style)'

[golang]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[gradle]
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[haskell]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[java]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[julia]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[nodejs]
symbol = ""
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[nim]
symbol = "󰆥 "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[rust]
symbol = ""
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[scala]
symbol = " "
style = "bg:#86BBD8"
format = '[ $symbol ($version) ]($style)'

[time]
disabled = false
time_format = "%R"
style = "bold italic fg:#07AE92"
format = '[󰥔 $time ]($style)'
