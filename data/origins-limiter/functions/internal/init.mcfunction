#> origins-limiter:internal/init
#
#   > Save the player's `cardinal_components."origins:origin".OriginLayers` NBT to storage
#
#@within
#   function origins-limiter:tick
#   function origins-limiter:internal/init
#   advancement origins-limiter:internal/init
#declare storage origins-limiter:


#
#   Copy the main list to a temporary storage path
#
data modify storage origins-limiter: root.ccapi.origins_main set from storage origins-limiter: root.origins

execute store result score .maxIterations.A o-l.verbose run data get storage origins-limiter: root.origins


#
#   Copy the origins-related data from the player, and store 
#   in to a temporary storage path
#
data modify storage origins-limiter: root.ccapi.origins_check set from entity @s cardinal_components."origins:origin".OriginLayers

data remove storage origins-limiter: root.ccapi.origins_check[{Layer: "origins-limiter:root"}]

execute store result score .maxIterations.B o-l.verbose run data get storage origins-limiter: root.ccapi.origins_check


execute if score .maxIterations.A o-l.verbose matches 0 run function origins-limiter:internal/global_list/add_cur_element

execute if score .maxIterations.A o-l.verbose matches 1.. run function origins-limiter:internal/global_list/sort


#
#   Loop this function if `.maxIterations.A` has a score of 1 or more
#
execute if score .iterations.A o-l.verbose >= .maxIterations.A o-l.verbose run scoreboard players set .iterations.A o-l.verbose 0

scoreboard players add .iterations.A o-l.verbose 1

data remove storage origins-limiter: root.ccapi.origins_main[-1]


execute if score .iterations.A o-l.verbose >= .maxIterations.A o-l.verbose run scoreboard players remove .maxIterations.A o-l.verbose 1

execute unless score .iterations.A o-l.verbose >= .maxIterations.A o-l.verbose run function origins-limiter:internal/init


#
#   Clear the temporary storage path
#
data remove storage origins-limiter: root.ccapi