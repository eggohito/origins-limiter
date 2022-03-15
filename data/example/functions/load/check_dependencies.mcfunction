#> example:load/check_dependencies
#
#   > Check for dependencies before fully loading the datapack
#
#@within tag/function load:post_load


#   Check if `origins-limiter_v3.1.0` or newer is loaded
execute if score origins-limiter.major load matches 3 if score origins-limiter.minor load matches 1.. run function example:load/success

execute unless score origins-limiter.major load matches 3 unless score origins-limiter.minor load matches 1.. run function example:load/fail