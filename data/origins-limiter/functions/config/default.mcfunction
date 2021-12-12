#> origins-limiter:config/default
#
#   > The default config for `origins-limiter`
#
#@within function *:private/load


scoreboard players set updateInterval o-l.main 10

data modify storage origins-limiter:main root.msg.cancel."origins:origin" set value '{"text": "The origin picking process has been cancelled.", "color": "red"}'