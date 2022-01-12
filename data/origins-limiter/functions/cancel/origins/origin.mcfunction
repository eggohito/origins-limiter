#> origins-limiter:cancel/origins/origin
#
#   > Set the origin for the `origins:origin` and `origins-limiter:confirm/origins/origin` origin layers to `origins-limiter:empty`
#
#@within tag/function origins-limiter:cancel


origin set @s origins:origin origins-limiter:empty

origin set @s origins-limiter:confirm/origins/origin origins-limiter:empty