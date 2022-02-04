#> origins-limiter:private/player
#
#   > Execute as all players to check for stuff
#
#@within function origins-limiter:tick


#   Determine if the player has cancelled or overriden the origin picking process
data modify storage origins-limiter:main component.origins set from entity @s cardinal_components."origins:origin".OriginLayers

function #origins-limiter:status/check

data remove storage origins-limiter:main component