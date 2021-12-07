#> origins-limiter:private/set_semver
#
#@within
#   *:private/load
#   *:private/load/**


data modify storage origins-limiter:main root.semver.major set value 1

data modify storage origins-limiter:main root.semver.minor set value 4

data modify storage origins-limiter:main root.semver.patch set value 0


execute store result score origins-limiter.major load run data get storage origins-limiter:main root.semver.major

execute store result score origins-limiter.minor load run data get storage origins-limiter:main root.semver.minor

execute store result score origins-limiter.patch load run data get storage origins-limiter:main root.semver.patch