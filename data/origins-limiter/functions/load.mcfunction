#> origins-limiter:load
#
#   > The main load function for the `origins-limiter` namespace
#
#@within tag/function origins-limiter:load


#   Call the `origins-limiter:private/update` function just in case updating stuff is needed
function origins-limiter:private/update


#   Add scoreboard objective(s)
scoreboard objectives add o-l.main dummy

scoreboard objectives add o-l.cur dummy

scoreboard objectives add o-l.max dummy


#   Set semantic version
function origins-limiter:private/semantic_version/set


#   Display a load/reload message
execute unless score #loaded o-l.main = #loaded o-l.main run tellraw @a {"translate": "[+ Loaded \"Limiter (Origins) API\" @ v%1$s.%2$s.%3$s]", "color": "green", "with": [{"nbt": "root.semver.major", "storage": "origins-limiter:main"}, {"nbt": "root.semver.minor", "storage": "origins-limiter:main"}, {"nbt": "root.semver.patch", "storage": "origins-limiter:main"}]}

execute if score #loaded o-l.main = #loaded o-l.main run tellraw @a[tag = origins-limiter.debugger] {"translate": "[= Reloaded \"Limiter (Origins) API\" @ v%1$s.%2$s.%3$s]", "color": "gold", "with": [{"nbt": "root.semver.major", "storage": "origins-limiter:main"}, {"nbt": "root.semver.minor", "storage": "origins-limiter:main"}, {"nbt": "root.semver.patch", "storage": "origins-limiter:main"}]}


scoreboard players set origins-limiter load.status 1

scoreboard players set #loaded o-l.main 1


#   Re-initialize tick function
schedule function origins-limiter:tick 1t replace
