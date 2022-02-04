#> origins-limiter:status/cancel/origins-classes/class
#
#   > Set the origin for the `origins-classes:class` and `origins-limiter:confirm/origins-classes/class` origin layers to `origins-limiter:empty`
#
#@within tag/function origins-limiter:status/cancel


origin set @s origins-classes:class origins-limiter:empty

origin set @s origins-limiter:confirm/origins-classes/class origins-limiter:empty

origin set @s origins-limiter:status/origins-classes/class origins-limiter:status/cancel/done


#   Notify the player about the cancellation
tellraw @s {"storage": "origins-limiter:main", "nbt": "root.msg.cancel.\"origins-classes:class\"", "interpret": true}