#   Set the initial max. player limit for the origin
execute unless score origins-classes:rogue o-l.max = origins-classes:rogue o-l.max run scoreboard players set origins-classes:rogue o-l.max 1


#   Count how many players have the origin currently
execute store result score origins-classes:rogue o-l.cur if entity @a[tag = origins-limiter.selection.done, tag = !origins-limiter.ignored, nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins-classes:rogue"}]}}}]


#   If the current count of players that have the origin is greater than the max. player limit for the origin,
#   restrict any future players from choosing the origin. Otherwise, lift the restriction
execute if score origins-classes:rogue o-l.cur >= origins-classes:rogue o-l.max run advancement grant @a only origins-limiter:restrict/origin/origins-classes/rogue

execute if score origins-classes:rogue o-l.cur < origins-classes:rogue o-l.max run advancement revoke @a only origins-limiter:restrict/origin/origins-classes/rogue
