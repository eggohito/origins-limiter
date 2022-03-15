#> origins-limiter:config/update_interval
#
#   > Set the default value for the `updateInterval` score holder
#
#@within tag/function origins-limiter:config


execute unless score updateInterval o-l.main = updateInterval o-l.main run scoreboard players set updateInterval o-l.main 10