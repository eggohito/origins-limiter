#> origins-limiter:internal/global_list/sort
#
#   > Sort and clean the storage list
#
#@within
#   function origins-limiter:internal/init
#   function origins-limiter:internal/global_list/sort


#
#   Check if there are any entries in the main storage that has the same ID as the 
#   currently selected entry
#
data modify storage origins-limiter: root.ccapi.origins_check_id set from storage origins-limiter: root.ccapi.origins_check[-1].Origin

execute store success score .doesntExist o-l.verbose run data modify storage origins-limiter: root.ccapi.origins_check_id set from storage origins-limiter: root.ccapi.origins_main[-1].Origin


execute if score .doesntExist o-l.verbose matches 0 run function origins-limiter:internal/count/add

execute if score .doesntExist o-l.verbose matches 1 run function origins-limiter:internal/global_list/add_cur_element


#
#   Recurse this function unless the `.iterations.B` score holder 
#   has the same score as the `.maxIterations.B` score holder
#
execute if score .iterations.B o-l.verbose >= .maxIterations.B o-l.verbose run scoreboard players set .iterations.B o-l.verbose 0

scoreboard players add .iterations.B o-l.verbose 1

data remove storage origins-limiter: root.ccapi.origins_check[-1]


execute if score .iterations.B o-l.verbose >= .maxIterations.B o-l.verbose run scoreboard players remove .maxIterations.B o-l.verbose 1

execute unless score .iterations.B o-l.verbose >= .maxIterations.B o-l.verbose run function origins-limiter:internal/global_list/sort