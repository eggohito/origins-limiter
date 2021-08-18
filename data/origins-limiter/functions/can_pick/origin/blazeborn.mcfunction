#   Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score blazeborn o-l.max = blazeborn o-l.max run scoreboard players set blazeborn o-l.max 1


#   Store the count of the players that currently have this origin
execute store result score blazeborn o-l.cur if entity @a[nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins:blazeborn"}]}}}]


#   Grant the player an advancement to indicate that the player can choose the origin. Revoke the advancement otherwise
execute if score blazeborn o-l.cur < blazeborn o-l.max run advancement grant @a only origins-limiter:can_pick/origin/blazeborn

execute if score blazeborn o-l.cur >= blazeborn o-l.max run advancement revoke @a only origins-limiter:can_pick/origin/blazeborn