#> origins-limiter:config/origins-classes/class/cancel_message
#
#   > Set the default cancel message for the `origins-classes:class` layer
#
#@within tag/function origins-limiter:config


execute unless data storage origins-limiter:main root.msg.cancel."origins-classes:class" run data modify storage origins-limiter:main root.msg.cancel."origins-classes:class" set value '{"text": "You\'ve been restricted from choosing a class from the \'origins-classes:class\' layer", "color": "red"}'