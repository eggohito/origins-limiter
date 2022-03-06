#> origins-limiter:config/default/cancel_message
#
#   > Set the default cancel message
#
#@within function *:private/load


data modify storage origins-limiter:main root.msg.cancel."origins:origin" set value '{"text": "You\'ve been restricted from choosing an origin from the \'origins:origin\' layer", "color": "red"}'