#> origins-limiter:tick
#
#   > The main tick function for the `origins-limiter` namespace
#
#@within
#   function origins-limiter:load
#   function origins-limiter:tick


#
#   Update the global list constantly
#
#   - (experimental and temporary solution)
#
data modify storage origins-limiter: root.origins set value []

execute as @a[nbt = !{cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins:empty", Layer: "origins:origin"}]}}}] run function origins-limiter:internal/init


#
#   Schedule-loop this function
#
schedule function origins-limiter:tick 20t