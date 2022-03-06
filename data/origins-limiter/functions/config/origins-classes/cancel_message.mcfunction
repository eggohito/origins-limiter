#> origins-limiter:config/origins-classes/cancel_message
#
#   > Set the default cancel message for Origins Classes
#
#@within function *:private/load


data modify storage origins-limiter:main root.msg.cancel."origins-classes:class" set value '{"text": "You\'ve been restricted from choosing an origin from the \'origins-classes:class\' layer", "color": "red"}'