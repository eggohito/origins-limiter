#   Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score origins-classes:warrior o-l.max = origins-classes:warrior o-l.max run scoreboard players set origins-classes:warrior o-l.max 1


#   Store the count of the players that currently have this origin
execute store result score origins-classes:warrior o-l.cur if entity @a[nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins-classes:warrior"}]}}}]


#   Grant the player an advancement to indicate that the player can choose the origin. Revoke the advancement otherwise
execute if score origins-classes:warrior o-l.cur < origins-classes:warrior o-l.max run advancement grant @a only origins-limiter:can_pick/origins-classes/warrior

execute if score origins-classes:warrior o-l.cur >= origins-classes:warrior o-l.max run advancement revoke @a only origins-limiter:can_pick/origins-classes/warrior