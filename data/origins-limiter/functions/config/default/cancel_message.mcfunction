#> origins-limiter:config/default/cancel_message
#
#   > Set the default cancel message
#
#@within function *:private/load


data modify storage origins-limiter:main root.msg.cancel set value '{"text": "The origin picking process has been cancelled due to one or all of the chosen origins reaching their max player count.", "color": "red"}'