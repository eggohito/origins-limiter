#> origins-classes:load
#
#@within tag/function minecraft:load
#declare storage origins-classes:class


execute unless data storage origins-classes:class root.loaded run function origins-limiter:config/origins-classes/cancel_message

data modify storage origins-classes:class root.loaded set value true