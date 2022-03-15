#   Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score origins:feline o-l.max = origins:feline o-l.max run scoreboard players set origins:feline o-l.max 1


#   Store the count of the players that currently have this origin
execute store result score origins:feline o-l.cur if entity @a[tag = !origins-limiter.ignore, nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins:feline"}]}}}]


#   Grant the player an advancement to indicate that the player can choose the origin. Revoke the advancement otherwise
execute if score origins:feline o-l.cur < origins:feline o-l.max run advancement grant @a only origins-limiter:can_pick/origins/feline

execute if score origins:feline o-l.cur >= origins:feline o-l.max run advancement revoke @a only origins-limiter:can_pick/origins/feline