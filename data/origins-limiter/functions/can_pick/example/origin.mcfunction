#    Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score example:origin o-l.max = example:origin o-l.max run scoreboard players set example:origin o-l.max 1


#    Store the count of the players that currently have this origin
execute store result score example:origin o-l.cur if entity @a[tag = !origins-limiter.ignore, nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "example:origin"}]}}}]


#    Grant the player an advancement to indicate that the player can choose the origin. Revoke the advancement otherwise
execute if score example:origin o-l.cur < example:origin o-l.max run advancement grant @a only origins-limiter:can_pick/example/origin

execute if score example:origin o-l.cur >= example:origin o-l.max run advancement revoke @a only origins-limiter:can_pick/example/origin