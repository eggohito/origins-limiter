#> origins-limiter:private/tick
#
#   > The main tick function for the `origins-limiter` namespace
#
#@within
#   function origins-limiter:private/load
#   function origins-limiter:private/tick


#   Call the `#origins-limiter:origins` function tag if the interval threshold has been reached
    ##  Check if `#updateInterval` has been changed
    execute unless score #updateInterval o-l.main = #updateInterval.prev o-l.main run function origins-limiter:private/interval/update


    ##  Tick `#currentInterval`, then call `#origins-limiter:origins` function tag if the modulo result between `#currentInterval` and `#updateInterval` is 0
    scoreboard players add #currentInterval o-l.main 1

    scoreboard players operation #currentInterval o-l.main %= #updateInterval o-l.main

    execute if score #currentInterval o-l.main matches 0 run function #origins-limiter:tick


#   Loop this function
schedule function origins-limiter:private/tick 1t