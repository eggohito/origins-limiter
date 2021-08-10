#   Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score %enderian o-l.max = %enderian o-l.max run scoreboard players set %enderian o-l.max 1


#   Store the count of the players that currently have this origin
execute store result score %enderian o-l.main if entity @a[nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins:enderian"}]}}}]


#   Grant the player an advancement to indicate that the player can choose the origin. Revoke the advancement otherwise
execute if score %enderian o-l.main < %enderian o-l.max run advancement grant @a only origins-limiter:can_pick/default/enderian

execute if score %enderian o-l.main >= %enderian o-l.max run advancement revoke @a only origins-limiter:can_pick/default/enderian