#   Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score origins:human o-l.max = origins:human o-l.max run scoreboard players set origins:human o-l.max 1


#   Store the count of the players that currently have this origin
execute store result score origins:human o-l.cur if entity @a[tag = !origins-limiter.ignore, nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins:human"}]}}}]


#   Grant the player an advancement to indicate that the player can choose the origin. Revoke the advancement otherwise
execute if score origins:human o-l.cur < origins:human o-l.max run advancement grant @a only origins-limiter:can_pick/origins/human

execute if score origins:human o-l.cur >= origins:human o-l.max run advancement revoke @a only origins-limiter:can_pick/origins/human