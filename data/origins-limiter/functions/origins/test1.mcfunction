#   Set the max count for this origin ONCE (can then be changed in-game afterwards)
execute unless score %test1 o-l.max = %test1 o-l.max run scoreboard players set %test1 o-l.max 1


#   Count how many players currently have this origin

    ##  Add one to the %test1 score holder if this player has the origin
    execute store result score %test1 o-l.main if entity @a[nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins-limiter:test1"}]}}}]


    ##  Grant the player an advancement to indicate that the max count for this origin has been reached; used to restrict players from choosing the origin in the `origins:origin` origin layer
    execute if score %test1 o-l.main < %test1 o-l.max run advancement revoke @a only origins-limiter:origins/test1

    execute if score %test1 o-l.main >= %test1 o-l.max run advancement grant @a only origins-limiter:origins/test1
