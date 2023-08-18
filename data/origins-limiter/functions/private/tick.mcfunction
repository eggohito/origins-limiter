#> origins-limiter:private/tick
#
#@within
#   function origins-limiter:private/load
#   function origins-limiter:private/tick


function #origins-limiter:api/restrict/origins

schedule function origins-limiter:private/tick 1t
