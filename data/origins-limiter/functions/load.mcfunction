#> origins-limiter:load
#
#   > The main load function for the `origins-limiter` namespace
#
#@within tag/function load:load


#   Remove old and will-be-unused data from 2.x.x
function origins-limiter:private/semantic_version/get

execute if score origins-limiter.major load.status matches 2 run function origins-limiter:private/clear_prev_data


#   Add scoreboard objective(s)
scoreboard objectives add o-l.main dummy

scoreboard objectives add o-l.cur dummy

scoreboard objectives add o-l.max dummy


#   Set variables
execute unless score #loaded o-l.main = #loaded o-l.main run function #origins-limiter:config/default


#   Set semantic version
function origins-limiter:private/semantic_version/set


#   Display a load/reload message
execute unless score #loaded o-l.main = #loaded o-l.main run tellraw @a {"translate": "[+ Loaded \"Limiter (Origins)\" @ v%1$s.%2$s.%3$s]", "color": "green", "with": [{"nbt": "root.semver.major", "storage": "origins-limiter:main"}, {"nbt": "root.semver.minor", "storage": "origins-limiter:main"}, {"nbt": "root.semver.patch", "storage": "origins-limiter:main"}]}

execute if score #loaded o-l.main = #loaded o-l.main run tellraw @a[tag = origins-limiter.debugger] {"translate": "[= Reloaded \"Limiter (Origins)\" @ v%1$s.%2$s.%3$s]", "color": "gold", "with": [{"nbt": "root.semver.major", "storage": "origins-limiter:main"}, {"nbt": "root.semver.minor", "storage": "origins-limiter:main"}, {"nbt": "root.semver.patch", "storage": "origins-limiter:main"}]}


scoreboard players set origins-limiter load.status 1

scoreboard players set #loaded o-l.main 1


#   Re-initialize tick function
schedule function origins-limiter:tick 1t replace