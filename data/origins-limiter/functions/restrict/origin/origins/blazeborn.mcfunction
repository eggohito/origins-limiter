#   Set the initial max. player limit for the origin
execute unless score origins:blazeborn o-l.max = origins:blazeborn o-l.max run scoreboard players set origins:blazeborn o-l.max 1


#   Count how many players have the origin currently
execute store result score origins:blazeborn o-l.cur if entity @a[tag = origins-limiter.selection.done, advancements = {origins-limiter:ignored = false}, nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins:blazeborn"}]}}}]


#   If the current count of players that have the origin is greater than the max. player limit for the origin,
#   restrict any future players from choosing the origin. Otherwise, lift the restriction
execute if score origins:blazeborn o-l.cur >= origins:blazeborn o-l.max run advancement grant @a only origins-limiter:restrict/origin/origins/blazeborn

execute if score origins:blazeborn o-l.cur < origins:blazeborn o-l.max run advancement revoke @a only origins-limiter:restrict/origin/origins/blazeborn
