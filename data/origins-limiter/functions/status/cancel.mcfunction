#> origins-limiter:status/cancel
#
#@within function origins-limiter:status/check


#   Call the `#origins-limiter:status/cancel` function tag
function #origins-limiter:status/cancel


#   Give the orb back, and notify the player about the cancellation
give @s origins:orb_of_origin

tellraw @s {"storage": "origins-limiter:main", "nbt": "root.msg.cancel", "interpret": true}