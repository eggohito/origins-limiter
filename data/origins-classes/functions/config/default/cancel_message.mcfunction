#> origins-classes:config/default/cancel_message
#
#@within function origins-classes:load


data modify storage origins-limiter:main root.msg.cancel."origins-classes:class" set value '{"text": "You\'ve been restricted from picking an origin from the \'origins-classes:class\' layer", "color": "red"}'