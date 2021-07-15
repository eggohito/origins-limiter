#> origins-limiter:internal/load
#
#   > The main load function for the `origins-limiter` namespace
#
#@within tag/function load:load


#   Display load message for debuggers
tellraw @a[tag = o-l.debugger] {"text": "[+ Loaded \"Limiter (Origins)\"]", "color": "green"}


#   Add scoreboard objective(s)
scoreboard objectives add o-l.main dummy

scoreboard objectives add o-l.max dummy


#   Re-initialize tick function
schedule function origins-limiter:internal/tick 1t replace