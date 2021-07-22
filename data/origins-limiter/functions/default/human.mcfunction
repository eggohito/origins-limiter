#   Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score %human o-l.max = %human o-l.max run scoreboard players set %human o-l.max 1


#   Store the count of the players that currently have this origin
execute store result score %human o-l.main if entity @a[nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins:human"}]}}}]


#   Grant the player an advancement to indicate that the player can choose the origin. Revoke the origin otherwise
execute if score %human o-l.main < %human o-l.max run advancement grant @a only origins-limiter:can_pick/default/human

execute if score %human o-l.main >= %human o-l.max run advancement revoke @a only origins-limiter:can_pick/default/human