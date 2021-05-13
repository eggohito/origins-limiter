#> origins-limiter:load
#
#   > The main load function for the `origins-limiter` namespace
#
#@within tag/function load:load


#
#   Add scoreboard objective(s)
#
scoreboard objectives add origins-limiter dummy

scoreboard objectives add o-l.verbose dummy


#
#   Set constant(s)/variable(s)
#
execute unless score #load origins-limiter = #load origins-limiter run function origins-limiter:.cfg/initial_setup

scoreboard players set #load origins-limiter 1

scoreboard players set #origins-limiter load 1


#
#   Display a message for debuggers
#
tellraw @a[tag = o-l.debugger] {"text": "[+ Loaded \"Limiter (Origins)\"]", "color": "green"}


#
#   Re-initialize tick function
#
schedule function origins-limiter:tick 1t replace