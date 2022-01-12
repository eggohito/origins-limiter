#> origins-limiter:private/load
#
#   > The main load function for the `origins-limiter` namespace
#
#@within tag/function load:load


#   Add scoreboard objective(s)
scoreboard objectives add o-l.main dummy

scoreboard objectives add o-l.cur dummy

scoreboard objectives add o-l.max dummy


#   Remove old and will-be-unused data from 2.1.0
execute if score origins-limiter.major load.status matches 2 if score origins-limiter.minor load.status matches 1 run scoreboard players reset #loaded o-l.main

execute if score origins-limiter.major load.status matches 2 if score origins-limiter.minor load.status matches 1 run function origins-limiter:config/default/cancel_message


#   Set variables
execute unless score #loaded o-l.main = #loaded o-l.main run function #origins-limiter:config/default


#   Set semantic version
function origins-limiter:private/set_semver


#   Display a load/reload message
execute unless score #loaded o-l.main = #loaded o-l.main run tellraw @a {"translate": "[+ Loaded \"Limiter (Origins)\" @ v%1$s.%2$s.%3$s]", "color": "green", "with": [{"nbt": "root.semver.major", "storage": "origins-limiter:main"}, {"nbt": "root.semver.minor", "storage": "origins-limiter:main"}, {"nbt": "root.semver.patch", "storage": "origins-limiter:main"}]}

execute if score #loaded o-l.main = #loaded o-l.main run tellraw @a[tag = origins-limiter.debugger] {"translate": "[= Reloaded \"Limiter (Origins)\" @ v%1$s.%2$s.%3$s]", "color": "gold", "with": [{"nbt": "root.semver.major", "storage": "origins-limiter:main"}, {"nbt": "root.semver.minor", "storage": "origins-limiter:main"}, {"nbt": "root.semver.patch", "storage": "origins-limiter:main"}]}


scoreboard players set origins-limiter load.status 1

scoreboard players set #loaded o-l.main 1


#   Re-initialize tick function
schedule function origins-limiter:private/tick 1t replace