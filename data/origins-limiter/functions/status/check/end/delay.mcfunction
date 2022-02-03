#> origins-limiter:status/check/end/delay
#
#@internal


execute store result score #currentGameTime o-l.main run time query gametime

scoreboard players remove #currentGameTime o-l.main 1

execute as @a[tag = origins-limiter.status.cancel] if score @s o-l.main = #currentGameTime o-l.main run function origins-limiter:status/check/end/init