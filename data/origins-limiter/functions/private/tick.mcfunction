#> origins-limiter:private/tick
#
#   > The main tick function for the `origins-limiter` namespace
#
#@within
#   function origins-limiter:private/load
#   function origins-limiter:private/tick


#   Tick the `#currentInterval` score holder, then call the `#origins-limiter:tick` function tag if the modulo result from `#currentInterval %= updateInterval` is 0
scoreboard players add #currentInterval o-l.main 1

scoreboard players operation #currentInterval o-l.main %= updateInterval o-l.main

execute if score #currentInterval o-l.main matches 0 run function #origins-limiter:tick


#   Determine if a player can override the limiter system
advancement grant @a[tag = origins-limiter.override, advancements = {origins-limiter:private/override = false}] only origins-limiter:private/override

advancement revoke @a[tag = !origins-limiter.override, advancements = {origins-limiter:private/override = true}] only origins-limiter:private/override


#   `/schedule`-loop this function
schedule function origins-limiter:private/tick 1t