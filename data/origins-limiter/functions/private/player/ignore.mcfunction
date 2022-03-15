#> origins-limiter:private/player/ignore
#
#   > Determine if a player should be ignored by the limiter system or not
#
#@within function origins-limiter:tick


advancement grant @a[tag = origins-limiter.ignore, advancements = {origins-limiter:status/ignore = false}] only origins-limiter:status/ignore

advancement revoke @a[tag = !origins-limiter.ignore, advancements = {origins-limiter:status/ignore = true}] only origins-limiter:status/ignore