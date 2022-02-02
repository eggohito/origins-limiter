#> origins-limiter:status/check
#
#   > Checks if the player has either cancelled or overridden the origin choosing process
#
#@within function origins-limiter:private/player


#   Copy the player's `cardinal_components."origins:origin"` NBT path to a temporary NBT path
data modify storage origins-limiter:main temp.component.origins set from entity @s cardinal_components."origins:origin".OriginLayers


#   Check if the player has the `origins-limiter:status/cancel` or `origins-limiter:status/override` origins
execute if data storage origins-limiter:main temp.component.origins[{Origin: "origins-limiter:status/cancel"}] run function origins-limiter:status/cancel

execute if data storage origins-limiter:main temp.component.origins[{Origin: "origins-limiter:status/override"}] run function origins-limiter:status/override


#   Delete the temporary NBT path
data remove storage origins-limiter:main temp