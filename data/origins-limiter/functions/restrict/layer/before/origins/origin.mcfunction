#> origins-limiter:restrict/layer/before/origins/origin
#
#   >   Check if the `origins:origin` origin layer exists on the player
#
#   -   This is done to validate whether the origin layer should be restricted or not
#
#@within tag/function origins-limiter:api/restrict/layers/before


#   Check if the player has the `origins:origin` origin layer in its NBT
advancement revoke @s from origins-limiter:restrict/layer/origins/origin

execute if data entity @s cardinal_components."origins:origin".OriginLayers[{Layer: "origins:origin"}] run advancement grant @s only origins-limiter:restrict/layer/origins/origin


#   Increment the count of origin layers to restrict (for debugging purposes)
execute if entity @s[advancements = {origins-limiter:restrict/layer/origins/origin = true}] run scoreboard players add #layers_to_restrict origins-limiter 1
