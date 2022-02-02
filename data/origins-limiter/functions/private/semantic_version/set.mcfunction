#> origins-limiter:private/semantic_version/set
#
#   > Set the semantic version
#
#@within function origins-limiter:load


data modify storage origins-limiter:main root.semver.major set value 2

data modify storage origins-limiter:main root.semver.minor set value 2

data modify storage origins-limiter:main root.semver.patch set value 0


execute store result score origins-limiter.major load.status run data get storage origins-limiter:main root.semver.major

execute store result score origins-limiter.minor load.status run data get storage origins-limiter:main root.semver.minor

execute store result score origins-limiter.patch load.status run data get storage origins-limiter:main root.semver.patch