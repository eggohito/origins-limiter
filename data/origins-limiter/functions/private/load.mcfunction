#> origins-limiter:private/load
#
#   > The main load function for the `origins-limiter` namespace
#
#@within tag/function load:load


#   Add scoreboard objective(s)
scoreboard objectives add o-l.main dummy

scoreboard objectives add o-l.cur dummy

scoreboard objectives add o-l.max dummy


#   Set constants
function origins-limiter:private/constants


#   Check if there's an older version of the pack installed before setting constants/variables/global data
scoreboard players set origins-limiter load.status 110

function origins-limiter:private/version/check


    ##   Set variables
    execute unless score #loaded o-l.main = #loaded o-l.main run function origins-limiter:.cfg/default


    ##   Display a load/reload message
    execute unless score #loaded o-l.main = #loaded o-l.main run tellraw @a {"translate": "[+ Loaded \"Limiter (Origins)\" @ v%1$s.%2$s.%3$s]", "color": "green", "with": [{"score": {"name": "#semver.major", "objective": "o-l.main"}}, {"score": {"name": "#semver.minor", "objective": "o-l.main"}}, {"score": {"name": "#semver.patch", "objective": "o-l.main"}}]}

    execute if score #loaded o-l.main = #loaded o-l.main run tellraw @a[tag = origins-limiter.debugger] {"translate": "[+ Reloaded \"Limiter (Origins)\" @ v%1$s.%2$s.%3$s]", "color": "green", "with": [{"score": {"name": "#semver.major", "objective": "o-l.main"}}, {"score": {"name": "#semver.minor", "objective": "o-l.main"}}, {"score": {"name": "#semver.patch", "objective": "o-l.main"}}]}

    scoreboard players set #loaded o-l.main 1


#   Re-initialize tick function
schedule function origins-limiter:private/tick 1t replace