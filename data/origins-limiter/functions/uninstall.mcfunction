#> origins-limiter:uninstall
#
#   > Remove stuff added by the `origins-limiter` namespace
#
#@user


#   Display an uninstallation message
tellraw @a {"translate": "[- Disabled \"Limiter (Origins)\" @ v%1$s.%2$s.%3$s]", "color": "red", "with": [{"score": {"name": "#semver.major", "objective": "o-l.main"}}, {"score": {"name": "#semver.minor", "objective": "o-l.main"}}, {"score": {"name": "#semver.patch", "objective": "o-l.main"}}]}


#   Clear scheduled function(s)
schedule clear origins-limiter:private/tick


#   Remove scoreboard objective(s)
scoreboard objectives remove o-l.max

scoreboard objectives remove o-l.cur

scoreboard objectives remove o-l.main


#   Disable the datapack
datapack disable "file/origins-limiter_1.17_v1.1.0"

datapack disable "file/origins-limiter_1.17_v1.1.0.zip"