#> origins-limiter:config/default
#
#   > The default config for `origins-limiter`
#
#@within function *:private/load


scoreboard players set updateInterval o-l.main 10

data modify storage origins-limiter:main root.msg.cancel set value '{"text": "The origin you chose is currently not available.", "color": "red"}'