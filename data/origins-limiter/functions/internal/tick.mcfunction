#> origins-limiter:internal/tick
#
#   > The main tick function for the `origins-limiter` namespace
#
#@within
#   function origins-limiter:internal/load
#   function origins-limiter:internal/tick


#   Call the `#origins-limiter:origins` function tag if the interval threshold has been reached
execute if score #updateInterval o-l.main matches ..0 run scoreboard players set #updateInterval o-l.main 1


scoreboard players add #currentInterval o-l.main 1

scoreboard players operation #currentInterval o-l.main %= #updateInterval o-l.main

execute if score #currentInterval o-l.main matches 0 run function #origins-limiter:origins


#   Loop this function
schedule function origins-limiter:internal/tick 1t