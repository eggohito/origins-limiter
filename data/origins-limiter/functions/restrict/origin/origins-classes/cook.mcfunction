#   Set the initial max. player limit for the origin
execute unless score origins-classes:cook o-l.max = origins-classes:cook o-l.max run scoreboard players set origins-classes:cook o-l.max 1


#   Count how many players have the origin currently
execute store result score origins-classes:cook o-l.cur if entity @a[tag = origins-limiter.selection.done, advancements = {origins-limiter:ignored = false}, nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins-classes:cook"}]}}}]


#   If the current count of players that have the origin is greater than the max. player limit for the origin,
#   restrict any future players from choosing the origin. Otherwise, lift the restriction
execute if score origins-classes:cook o-l.cur >= origins-classes:cook o-l.max run advancement grant @a only origins-limiter:restrict/origin/origins-classes/cook

execute if score origins-classes:cook o-l.cur < origins-classes:cook o-l.max run advancement revoke @a only origins-limiter:restrict/origin/origins-classes/cook
