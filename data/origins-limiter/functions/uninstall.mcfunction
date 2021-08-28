#> origins-limiter:uninstall
#
#   > Remove stuff added by the `origins-limiter` namespace
#
#@user


#   Display an uninstallation message
tellraw @a {"translate": "[- Disabled \"Limiter (Origins)\" @ v%s]", "color": "red", "with": [{"storage": "origins-limiter:", "nbt": "root.version"}]}


#   Clear scheduled function(s)
schedule clear origins-limiter:private/tick


#   Remove scoreboard objective(s)
scoreboard objectives remove o-l.max

scoreboard objectives remove o-l.cur

scoreboard objectives remove o-l.main


#   Remove storage
data remove storage origins-limiter: root


#   Disable the datapack
datapack disable "file/origins-limiter_1.17_v1.1.1"

datapack disable "file/origins-limiter_1.17_v1.1.1.zip"