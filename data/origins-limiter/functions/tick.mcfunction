#> origins-limiter:tick
#
#   > The main tick function for the `origins-limiter` namespace
#
#@within
#   function origins-limiter:load
#   function origins-limiter:tick


#   o-l.cur Update Interval
    ##  Check if the score of the `updateInterval` variable has been changed
    execute unless score updateInterval o-l.main = #updateInterval o-l.main run function origins-limiter:private/interval/sync


    ##   Call the `#origins-limiter:tick` function tag if the specified interval value has been reached
    scoreboard players add #currentInterval o-l.main 1

    scoreboard players operation #currentInterval o-l.main %= updateInterval o-l.main

    execute if score #currentInterval o-l.main matches 0 run function #origins-limiter:tick


#   Execute as all players to check for stuff
execute as @a run function origins-limiter:private/player


#   `/schedule`-loop this function
schedule function origins-limiter:tick 1t