#> origins-limiter:private/interval/update
#
#   > Update the value of `#updateInterval` if it doesn't match `#updateInterval.prev`
#
#@within function *:private/tick


#   Check if the current value is less than 0. If so: revert the changes
execute if score updateInterval o-l.main matches ..0 run scoreboard players operation updateInterval o-l.main = #updateInterval o-l.main


#   Assign #updateInterval's score to #updateInterval.prev
scoreboard players operation #updateInterval o-l.main = updateInterval o-l.main