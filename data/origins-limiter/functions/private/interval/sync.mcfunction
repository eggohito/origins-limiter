#> origins-limiter:private/interval/sync
#
#   > Synchronize the score of the `updateInterval` variable to its hidden counterpart
#
#@within function origins-limiter:tick


#   If the score of the `updateInterval` variable is <= 0, use its previous value
execute if score updateInterval o-l.main matches ..0 run scoreboard players operation updateInterval o-l.main = #updateInterval o-l.main


#   Synchronize the score of the `#updateInterval` variable to the `updateInterval` variable
scoreboard players operation #updateInterval o-l.main = updateInterval o-l.main