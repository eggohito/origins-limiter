#> origins-limiter:private/load
#
#   > The main load function for the `origins-limiter` namespace
#
#@within tag/function load:load


#   Add scoreboard objective(s)
scoreboard objectives add o-l.main dummy

scoreboard objectives add o-l.cur dummy

scoreboard objectives add o-l.max dummy


#   Set semantic version
scoreboard players set origins-limiter load.status 130

data modify storage origins-limiter: root.version set value "1.3.0"


    ##   Set variables
    execute unless score #loaded o-l.main = #loaded o-l.main run function origins-limiter:config/default


    ##   Display a load/reload message
    execute unless score #loaded o-l.main = #loaded o-l.main run tellraw @a {"translate": "[+ Loaded \"Limiter (Origins)\" @ v%s]", "color": "green", "with": [{"storage": "origins-limiter:", "nbt": "root.version"}]}

    execute if score #loaded o-l.main = #loaded o-l.main run tellraw @a[tag = origins-limiter.debugger] {"translate": "[+ Reloaded \"Limiter (Origins)\" @ v%s]", "color": "green", "with": [{"storage": "origins-limiter:", "nbt": "root.version"}]}

    scoreboard players set #loaded o-l.main 1


#   Re-initialize tick function
schedule function origins-limiter:private/tick 1t replace