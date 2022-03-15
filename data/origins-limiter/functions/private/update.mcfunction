#> origins-limiter:private/update
#
#   > Check for stuff to be updated
#
#@within function origins-limiter:load


#   Get the current loaded version
function origins-limiter:private/semantic_version/get


#   Remove/re-add cancel messages
execute if score origins-limiter.major load.status matches ..3 unless score origins-limiter.minor load.status matches 1.. run function origins-limiter:private/update/3.1.0