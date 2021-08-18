#   Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score avian o-l.max = avian o-l.max run scoreboard players set avian o-l.max 1


#   Store the count of the players that currently have this origin
execute store result score avian o-l.cur if entity @a[nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins:avian"}]}}}]


#   Grant the player an advancement to indicate that the player can choose the origin. Revoke the advancement otherwise
execute if score avian o-l.cur < avian o-l.max run advancement grant @a only origins-limiter:can_pick/origin/avian

execute if score avian o-l.cur >= avian o-l.max run advancement revoke @a only origins-limiter:can_pick/origin/avian