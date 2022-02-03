#> origins-limiter:status/override/origins/origin
#
#   > Set the origin for the `origins-limiter:confirm/origins/origin` origin layer to `origins-limiter:empty`
#
#@within function origins-limiter:status/check/origins/origin


origin set @s origins-limiter:confirm/origins/origin origins-limiter:empty

origin set @s origins-limiter:status/origins/origin origins-limiter:status/override/done