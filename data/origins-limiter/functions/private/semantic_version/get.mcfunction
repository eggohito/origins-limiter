#> origins-limiter:private/semantic_version/get
#
#   > Get the semantic version
#
#@internal


execute store result score origins-limiter.major load run data get storage origins-limiter:main root.semver.major

execute store result score origins-limiter.minor load run data get storage origins-limiter:main root.semver.minor

execute store result score origins-limiter.patch load run data get storage origins-limiter:main root.semver.patch