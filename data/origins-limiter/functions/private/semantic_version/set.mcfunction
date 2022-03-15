#> origins-limiter:private/semantic_version/set
#
#   > Set the semantic version
#
#@internal


data modify storage origins-limiter:main root.semver.major set value 3

data modify storage origins-limiter:main root.semver.minor set value 1

data modify storage origins-limiter:main root.semver.patch set value 0


function origins-limiter:private/semantic_version/get