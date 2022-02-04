#> origins-limiter:status/check/origins/origin
#
#   > Checks if the player has either cancelled or overridden the origin choosing process
#
#@within tag/function origins-limiter:status/check


#   Check if the player has the `origins-limiter:status/cancel` or `origins-limiter:status/override` origins
execute if data storage origins-limiter:main component.origins[{Origin: "origins-limiter:status/cancel", Layer: "origins-limiter:status/origins/origin"}] run function origins-limiter:status/cancel/origins/origin

execute if data storage origins-limiter:main component.origins[{Origin: "origins-limiter:status/override", Layer: "origins-limiter:status/origins/origin"}] run function origins-limiter:status/override/origins/origin