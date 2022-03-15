#   Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score origins:phantom o-l.max = origins:phantom o-l.max run scoreboard players set origins:phantom o-l.max 1


#   Store the count of the players that currently have this origin
execute store result score origins:phantom o-l.cur if entity @a[tag = !origins-limiter.ignore, nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins:phantom"}]}}}]


#   Grant the player an advancement to indicate that the player can choose the origin. Revoke the advancement otherwise
execute if score origins:phantom o-l.cur < origins:phantom o-l.max run advancement grant @a only origins-limiter:can_pick/origins/phantom

execute if score origins:phantom o-l.cur >= origins:phantom o-l.max run advancement revoke @a only origins-limiter:can_pick/origins/phantom