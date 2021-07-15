#> origins-limiter:internal/tick
#
#   > The main tick function for the `origins-limiter` namespace
#
#@within
#   function origins-limiter:internal/load
#   function origins-limiter:internal/tick


#   Count how many players have certain origins
execute store result score #players o-l.main if entity @a

function #origins-limiter:origins


#   Loop this function
schedule function origins-limiter:internal/tick 1t