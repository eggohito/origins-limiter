#   Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score %shulk o-l.max = %shulk o-l.max run scoreboard players set %shulk o-l.max 1


#   Store the count of the players that currently have this origin
execute store result score %shulk o-l.main if entity @a[nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins:shulk"}]}}}]


#   Grant the player an advancement to indicate that the max count for this origin has been reached; used to restricting players from choosing the origin in the `origins:origin` origin layer
execute if score %shulk o-l.main < %shulk o-l.max run advancement grant @a only origins-limiter:can_pick/default/shulk

execute if score %shulk o-l.main >= %shulk o-l.max run advancement revoke @a only origins-limiter:can_pick/default/shulk