#   Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score test_origin o-l.max = test_origin o-l.max run scoreboard players set test_origin o-l.max 1


#   Store the count of the players that currently have this origin
execute store result score test_origin o-l.cur if entity @a[nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "example:test_origin"}]}}}]


#   Grant the player an advancement to indicate that the player can choose the origin. Revoke the advancement otherwise
execute if score test_origin o-l.cur < test_origin o-l.max run advancement grant @a only origins-limiter:can_pick/origin/test_origin

execute if score test_origin o-l.cur >= test_origin o-l.max run advancement revoke @a only origins-limiter:can_pick/origin/test_origin