#> origins-limiter:internal/count/add
#
#   > Update the count of the currently selected index in the global listss
#
#@within function origins-limiter:internal/global_list/sort


#
#   Change the `Count` value of the currently selected index
#
execute store result score #tempCount origins-limiter run data get storage origins-limiter: root.origins[-1].Count

execute if score #tempCount origins-limiter matches 0 run data modify storage origins-limiter: root.origins[-1].Count set value 0

scoreboard players add #tempCount origins-limiter 1


execute store result storage origins-limiter: root.origins[-1].Count int 1 run scoreboard players get #tempCount origins-limiter

scoreboard players reset #tempCount origins-limiter