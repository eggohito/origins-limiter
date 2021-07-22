#   Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score %phantom o-l.max = %phantom o-l.max run scoreboard players set %phantom o-l.max 1


#   Store the count of the players that currently have this origin
execute store result score %phantom o-l.main if entity @a[nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins:phantom"}]}}}]


#   Grant the player an advancement to indicate that the player can choose the origin. Revoke the origin otherwise
execute if score %phantom o-l.main < %phantom o-l.max run advancement grant @a only origins-limiter:can_pick/default/phantom

execute if score %phantom o-l.main >= %phantom o-l.max run advancement revoke @a only origins-limiter:can_pick/default/phantom