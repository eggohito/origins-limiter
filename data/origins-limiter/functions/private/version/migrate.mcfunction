#> origins-limiter:private/version/migrate
#
#   > Do clean up if the old version of the pack is detected
#
#@within function *:private/load


scoreboard players reset * o-l.cur

scoreboard players reset * o-l.max

scoreboard players reset * o-l.main

function origins-limiter:private/constants