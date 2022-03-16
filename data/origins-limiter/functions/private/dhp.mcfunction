#> origins-limiter:private/dhp
#
#@private


#   Storage
    #>  Used for storing version info.
    #@internal
    #declare storage origins-limiter:main

#   Scoreboard Objectives
    #> Stores the max count of players that can have a certain origin. All the scores of the score holders in this scoreboard objective can be modified.
    #@internal
    #declare objective o-l.max

    #> Stores the current count of players that has a certain origin. All the scores of the score holders in this scoreboard objective is **read only**.
    #@internal
    #declare objective o-l.cur

    #> Stores the `updateInterval` score holder.
    #declare objective o-l.main


#   Score holders
    #> Determines the interval of updating the scores of the score holders in the `o-l.cur` scoreboard objective. Defaults to `10`.
    #@internal
    #declare score_holder updateInterval