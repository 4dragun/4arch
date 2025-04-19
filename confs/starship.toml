format = """
[](#FD4985)\
$os\
$username\
[](bg:#FF9A8C fg:#FD4985)\
[](bg:#5577FF fg:#FF9A8C)\
$directory\
[](bg:#4EC1FF fg:#5577FF)\
[](bg:#AD3DFF fg:#4EC1FF)\
$git_branch\
$git_status\
[](bg:#FA7DFF fg:#AD3DFF)\
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
[](bg:#FF9500 fg:#FA7DFF)\
$docker_context\
[ ](bg:#07AE92 fg:#FF9500)\
$time\
[](bg:#53EE84 fg:#07AE92)\
[ ](fg:#53EE84)\
"""

add_newline = false

[username]
show_always = true
style_user = "bold italic bg:#FD4985 fg:#1A1B26"
style_root = "bg:#9A348E"
format = '[$user ]($style)'
disabled = false

[os]
style = "bg:#9A348E"
disabled = true

[directory]
style = "bold italic bg:#5577FF fg:#1A1B26"
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
style = "bold italic bg:#AD3DFF fg:#1A1B26"
format = '[ $symbol $branch ]($style)'

[git_status]
style = "bg:#AD3DFF"
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
style = "bold italic bg:#07AE92 fg:#1A1B26"
format = '[󰥔 $time ]($style)'
