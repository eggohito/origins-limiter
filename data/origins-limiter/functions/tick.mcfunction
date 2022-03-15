#> origins-limiter:tick
#
#   > The main tick function for the `origins-limiter` namespace
#
#@within
#   function origins-limiter:load
#   function origins-limiter:tick


#  Check if the score of the `updateInterval` variable has been changed
execute unless score updateInterval o-l.main = #updateInterval o-l.main run function origins-limiter:private/sync/update_interval


#   Call the `#origins-limiter:tick` function tag if the specified interval value has been reached
scoreboard players add #currentInterval o-l.main 1

scoreboard players operation #currentInterval o-l.main %= updateInterval o-l.main

execute if score #currentInterval o-l.main matches 0 run function #origins-limiter:tick


#   Determine if a player should be ignored by the limiter system or not
function origins-limiter:private/player/ignore


#   `/schedule`-loop this function
schedule function origins-limiter:tick 1t