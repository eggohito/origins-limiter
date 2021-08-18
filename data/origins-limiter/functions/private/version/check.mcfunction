#> origins-limiter:private/version/check
#
#   > Check if there's an older version of the pack installed before setting constants/variables/global data
#
#@within function *:private/load


#   Reset MAJOR, MINOR, and PATCH
scoreboard players reset #semver.major o-l.main

scoreboard players reset #semver.minor o-l.main

scoreboard players reset #semver.patch o-l.main


#   Migrate score holders if `#semver` doesn't match `origins-limiter`, and re-synchronize their values afterwards
execute unless score #semver o-l.main = origins-limiter load.status run function origins-limiter:private/version/migrate

scoreboard players operation #semver o-l.main = origins-limiter load.status


#   Store the semver as three separate values
execute store result storage eggohito:origins-limiter temp.semver int 1 run scoreboard players get origins-limiter load.status


    ##  Get MAJOR
    execute store result score #semver.major o-l.main run data get storage eggohito:origins-limiter temp.semver 0.01

    scoreboard players operation #semver.major o-l.main *= #100 o-l.main


    ## Get MINOR
    execute store result score #semver.minor o-l.main run data get storage eggohito:origins-limiter temp.semver 0.1

    scoreboard players operation #semver.minor o-l.main *= #10 o-l.main

    scoreboard players operation #semver.minor o-l.main -= #semver.major o-l.main


    ## Get PATCH
    execute store result score #semver.patch o-l.main run data get storage eggohito:origins-limiter temp.semver 1

    scoreboard players operation #semver.patch o-l.main -= #semver.major o-l.main

    scoreboard players operation #semver.patch o-l.main -= #semver.minor o-l.main


    ##  Finalize values
    scoreboard players operation #semver.major o-l.main /= #100 o-l.main

    scoreboard players operation #semver.minor o-l.main /= #10 o-l.main