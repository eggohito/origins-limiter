#> origins-limiter:status/cancel/origins/origin
#
#   > Set the origin for the `origins:origin` and `origins-limiter:confirm/origins/origin` origin layers to `origins-limiter:empty`
#
#@within tag/function origins-limiter:status/cancel


origin set @s origins:origin origins-limiter:empty

origin set @s origins-limiter:confirm/origins/origin origins-limiter:empty

origin set @s origins-limiter:status/origins/origin origins-limiter:status/cancel/done