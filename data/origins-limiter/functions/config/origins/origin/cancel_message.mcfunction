#> origins-limiter:config/origins/origin/cancel_message
#
#   > Set the default cancel message for the `origins:origin` layer
#
#@within tag/function origins-limiter:config


execute unless data storage origins-limiter:main root.msg.cancel."origins:origin" run data modify storage origins-limiter:main root.msg.cancel."origins:origin" set value '{"text": "You\'ve been restricted from choosing an origin from the \'origins:origin\' layer", "color": "red"}'