#> origins-limiter:uninstall
#
#   > Remove stuff added by the `origins-limiter` namespace
#
#@user


#   Display an uninstallation message
tellraw @a {"text": "[- Disabled \"Limiter (Origins)\"]", "color": "red"}


#   Clear scheduled function(s)
schedule clear origins-limiter:internal/tick


#   Remove scoreboard objective(s)
scoreboard objectives remove o-l.max

scoreboard objectives remove o-l.main


#   Disable the datapack
datapack disable "file/origins-limiter_v1.0.0"

datapack disable "file/origins-limiter_v1.0.0.zip"