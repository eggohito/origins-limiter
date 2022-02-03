#> origins-limiter:status/cancel/origins/origin
#
#   > Set the origin for the `origins:origin` and `origins-limiter:confirm/origins/origin` origin layers to `origins-limiter:empty`
#
#@within function origins-limiter:status/check/origins/origin


origin set @s origins:origin origins-limiter:empty

origin set @s origins-limiter:confirm/origins/origin origins-limiter:empty

origin set @s origins-limiter:status/origins/origin origins-limiter:status/cancel/done


#   Give the orb back, and notify the player about the cancellation
execute store success score #orbGiven o-l.main run give @s[tag = !origins-limiter.status.cancel] origins:orb_of_origin

tellraw @s {"storage": "origins-limiter:main", "nbt": "root.msg.cancel.\"origins:origin\"", "interpret": true}


execute if score #orbGiven o-l.main matches 1 run tag @s add origins-limiter.status.cancel

execute store result score @s o-l.main run time query gametime

schedule function origins-limiter:status/check/end/delay 1t replace