#> origins-classes:load
#
#@within tag/function minecraft:load


execute unless data storage origins-classes:class root.loaded run function origins-classes:config/default/cancel_message

data modify storage origins-classes:class root.loaded set value true