#   Set the initial max. player limit for the origin
execute unless score origins:phantom o-l.max = origins:phantom o-l.max run scoreboard players set origins:phantom o-l.max 1


#   Count how many players have the origin currently
execute store result score origins:phantom o-l.cur if entity @a[tag = origins-limiter.selection.done, tag = !origins-limiter.ignored, nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins:phantom"}]}}}]


#   If the current count of players that have the origin is greater than the max. player limit for the origin,
#   restrict any future players from choosing the origin. Otherwise, lift the restriction
execute if score origins:phantom o-l.cur >= origins:phantom o-l.max run advancement grant @a only origins-limiter:restrict/origin/origins/phantom

execute if score origins:phantom o-l.cur < origins:phantom o-l.max run advancement revoke @a only origins-limiter:restrict/origin/origins/phantom
