#> origins-limiter:uninstall
#
#   > Remove stuff added by the `origins-limiter` namespace
#
#@user


#   Display an uninstallation message
tellraw @a {"translate": "[- Disabled \"Limiter (Origins)\" @ v%1$s.%2$s.%3$s]", "color": "red", "with": [{"nbt": "root.semver.major", "storage": "origins-limiter:main"}, {"nbt": "root.semver.minor", "storage": "origins-limiter:main"}, {"nbt": "root.semver.patch", "storage": "origins-limiter:main"}]}


#   Clear scheduled function(s)
schedule clear origins-limiter:tick


#   Remove scoreboard objective(s)
scoreboard objectives remove o-l.max

scoreboard objectives remove o-l.cur

scoreboard objectives remove o-l.main


#   Remove storage
data remove storage origins-limiter:main root


#   Disable the datapack
datapack disable "file/origins-limiter_v2.2.0"

datapack disable "file/origins-limiter_v2.2.0.zip"