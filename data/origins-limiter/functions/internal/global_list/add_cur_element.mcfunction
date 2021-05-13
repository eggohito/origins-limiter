#> origins-limiter:internal/global_list/add_cur_element
#
#   Add the currently selected entry to the main list (and store its current count)
#
#@within
#   function origins-limiter:internal/init
#   function origins-limiter:internal/global_list/sort


#
#   Add the entry to the main list
#
data modify storage origins-limiter: root.origins append from storage origins-limiter: root.ccapi.origins_check[-1]


execute store result score #tempCount origins-limiter run data get storage origins-limiter: root.origins[-1].Count

execute if score #tempCount origins-limiter matches 0 run data modify storage origins-limiter: root.origins[-1].Count set value 0

scoreboard players add #tempCount origins-limiter 1


execute store result storage origins-limiter: root.origins[-1].Count int 1 run scoreboard players get #tempCount origins-limiter

scoreboard players reset #tempCount origins-limiter