#> origins-limiter:private/load
#
#@within tag/function minecraft:load


#   Add scoreboard objectives
scoreboard objectives add origins-limiter dummy

scoreboard objectives add o-l.cur dummy

scoreboard objectives add o-l.max dummy


#   Display load/reload message
execute if score #loaded origins-limiter = #loaded origins-limiter run tellraw @a[tag = origins-limiter.debugger] {"text": "[+ Loaded \"Limiter (Origins)\" by eggohito]", "color": "green", "hoverEvent": {"action": "show_text", "contents": {"text": "v4.0.0"}}}

execute unless score #loaded origins-limiter = #loaded origins-limiter run tellraw @a[tag = origins-limiter.debugger] {"text": "[= Reloaded \"Limiter (Origins)\" by eggohito]", "color": "gold", "hoverEvent": {"action": "show_text", "contents": {"text": "v4.0.0"}}}

scoreboard players set $loaded origins-limiter 1


#   Re-initialize the tick function
schedule function origins-limiter:private/tick 1t replace
