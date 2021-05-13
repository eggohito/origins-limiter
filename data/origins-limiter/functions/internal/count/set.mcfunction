#> origins-limiter:internal/count/set


#
#   Change the `Count` value of the currently selected index
#
data modify storage origins-limiter: root.origins[-1].Count set value 0

scoreboard players add #tempCount origins-limiter 1


execute store result storage origins-limiter: root.origins[-1].Count int 1 run scoreboard players get #tempCount origins-limiter

scoreboard players reset #tempCount origins-limiter