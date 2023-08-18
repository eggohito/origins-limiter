#> origins-limiter:restrict/layer/after/origins/origin
#
#   >   Check if the player has canceled origin selection in the `origins:origin` origin layer
#
#   -   Cancelled can either mean that the player has deliberately cancelled the process of picking an
#       origin, or that the process of picking an origin was automatically cancelled
#       (because the max player limit for the origin they have chosen has been reached)
#
#@within tag/function origins-limiter:api/restrict/layers/after


#   Add a temporary tag if the player has the `origins-limiter:cancel` origin
#   in the `origins-limiter:restrict/origins/origin` origin layer
execute if data entity @s cardinal_components."origins:origin".OriginLayers[{Origin: "origins-limiter:cancel", Layer: "origins-limiter:restrict/origins/origin"}] run tag @s add origins-limiter.canceled.tmp


#   Display a message and set the origin of the player in the `origins:origin` 
#   origin layer to `origins-limiter:empty`
#
#   `origins-limiter:empty` is used in this case to prevent the player from choosing an
#   origin for the `origins:origin` origin layer
execute if entity @s[tag = origins-limiter.canceled.tmp] run tellraw @s {"text": "Origin selection on 'origins:origin' origin layer has been canceled.", "color": "red"}

execute if entity @s[tag = origins-limiter.canceled.tmp] run origin set @s origins:origin origins-limiter:empty


#   Remove the temporary tag
tag @s remove origins-limiter.canceled.tmp
