#> origins-limiter:.cfg/initial_setup
#
#   > Do an initial setup that only happens once
#
#@within function origins-limiter:load


#
#   Initialize storage
#
data modify storage origins-limiter: root.origins set value []