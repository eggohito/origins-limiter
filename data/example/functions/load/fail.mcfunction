#> example:load/fail
#
#@within function example:load/check_dependencies


#   Notify the player about the missing dependency/dependencies
tellraw @a {"translate": "%1$s failed to load! Missing dependency: %2$s \n", "color": "red", "with": [{"text": "example-limiter", "color": "yellow"}, {"text": "origins-limiter_API_1.16_v3.1.0 or newer", "color": "yellow", "clickEvent": {"action": "open_url", "value": "https://github.com/eggohito/origins-limiter/releases"}}]}

function example:uninstall