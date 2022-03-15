#> example:load/success
#
#@within function example:load/check_dependencies


#   Add scoreboard objective(s)
scoreboard objectives add example dummy


#   Display load/reload message
execute unless score #loaded example = #loaded example run tellraw @a {"text": "[+ Loaded \"Limiter (Origins/Example)\"]", "color": "green"}

execute if score #loaded example = #loaded example run tellraw @a[tag = origins-limiter.debugger] {"text": "[= Reloaded \"Limiter (Origins/Example)\"]", "color": "gold"}

scoreboard players set #loaded example 1