#   Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score %feline o-l.max = %feline o-l.max run scoreboard players set %feline o-l.max 1


#   Store the count of the players that currently have this origin
execute store result score %feline o-l.main if entity @a[nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins:feline"}]}}}]


#   Grant the player an advancement to indicate that the player can choose the origin. Revoke the advancement otherwise
execute if score %feline o-l.main < %feline o-l.max run advancement grant @a only origins-limiter:can_pick/default/feline

execute if score %feline o-l.main >= %feline o-l.max run advancement revoke @a only origins-limiter:can_pick/default/feline