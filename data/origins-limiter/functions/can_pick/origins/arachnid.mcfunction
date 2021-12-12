#   Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score origins:arachnid o-l.max = origins:arachnid o-l.max run scoreboard players set origins:arachnid o-l.max 1


#   Store the count of the players that currently have this origin
execute store result score origins:arachnid o-l.cur if entity @a[nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins:arachnid"}]}}}]


#   Grant the player an advancement to indicate that the player can choose the origin. Revoke the advancement otherwise
execute if score origins:arachnid o-l.cur < origins:arachnid o-l.max run advancement grant @a only origins-limiter:can_pick/origins/arachnid

execute if score origins:arachnid o-l.cur >= origins:arachnid o-l.max run advancement revoke @a only origins-limiter:can_pick/origins/arachnid