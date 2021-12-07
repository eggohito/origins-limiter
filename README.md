# Limiter (Origins)

A datapack library that can limit how many players can have a certain origin.

If you don't want to (or don't know how to) do the manual work of integrating the datapack library to your datapck, you can create an issue using the ['requesting integration'] issue template to this repository's issue tracker.

<br>

## Customizability
This datapack library provides some scoreboard objectives that you can either modify the scores of the score holders in it, or just read the value of with `/scoreboard`:

Name | Type | Default | Description
-----|------|---------|------------
`o-l.max` | Scoreboard Objective | `1` | Stores the max count of players that can have a certain origin. The score of the score holders in this objective **can be modified**.
`o-l.cur` | Scoreboard Objective | _dynamic_ | Stores the current count of players that have a certain origin. The score of the score holders in this objective **cannot be modified**.
`o-l.main` | Scoreboard Objective | | Stores the `updateInterval` score holder, and other private score holders.
`updateInterval` | Score Holder | `10` | Determines how fast the score of the score holders in the `o-l.cur` objective updates in ticks.

<br>

## How to Use

> ### :information_source: These are the steps for integrating the datapack library to your datapack. If you only want to limit the base origins, this is unnecessary.
<br>

In the following steps, we'll be using [this datapack](https://github.com/eggohito/origins-limiter/tree/example) as our reference.

<details>
<summary>
<b>1.</b> Create a <code>.json</code> file in the <code>data/origins-limiter/advancements/can_pick/origin</code> folder of your datapack. For consistency in this example, we'll be naming the <code>.json</code> file the same name as the example origin. 
<br>
<i>(The namespace and ID of the example origin being <code>example:test_origin</code>):</i>
</summary>

```json
{
    "criteria": {
        "dummy": {
            "trigger": "minecraft:impossible"
        }
    }
}
```

</details>

<details>
<summary>
<b>2.</b> Create an <code>.mcfunction</code> file in the <code>data/origins-limiter/functions/can_pick/origin</code> folder in your datapack. This function will be responsible for counting how many players will have the origin that we want to limit.
<br>
<i>(Which will be <code>example:test_origin</code> in the example's case):</i>
</summary>

```mcfunction
#   Set the max count for this origin once (can then be changed in-game afterwards)
#
#   - o-l.max     = the scoreboard objective that stores the max count for the origin
#   - test_origin = the score holder for the origin that we want to apply the limit to
#
execute unless score test_origin o-l.max = test_origin o-l.max run scoreboard players set test_origin o-l.max 1


#   Store the count of the players that currently have this origin
#
#   - "example:test_origin" = the namespace and ID of the origin that we want to apply the limit to
#
execute store result score test_origin o-l.cur if entity @a[nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "example:test_origin"}]}}}]


#   Grant the player an advancement to indicate that the player can choose the origin. Revoke the advancement otherwise
#
#   - origins-limiter:can_pick/origin/test_origin = the .json file that we made in the first step
#
execute if score test_origin o-l.cur < test_origin o-l.max run advancement grant @a only origins-limiter:can_pick/origin/test_origin

execute if score test_origin o-l.cur >= test_origin o-l.max run advancement revoke @a only origins-limiter:can_pick/origin/test_origin
```

</details>

<details>
<summary>
<b>3.</b> Create an <code>origin.json</code> file in the <code>data/origins-limiter/tags/functions/can_pick</code> folder of your datapack. Afterwards, reference the namespace, path and ID of the function that you've created in step 2 inside the <code>origin.json</code> file's <code>values</code> string array field. 
<br>
<i>(In this example, we'll be calling the <code>test_origin</code> function that was created in the <code>origins-limiter:can_pick/origin</code> folder previously):</i>
</summary>

```json
{
    "values": [
        "origins-limiter:can_pick/origin/test_origin"
    ]
}
```

</details>

<details>
<summary>
<b>4.</b> Create an <code>origin.json</code> file inside the <code>data/origins-limiter/origin_layers/confirm</code> folder of your datapack. Inside the <code>origins</code> array field of the <code>origin.json</code> file, you would use <a href = "https://origins.readthedocs.io/en/latest/guides/data/origin_conditions_in_layers/">Origins entity condition types</a> to check if the player has the origin that we want to limit, and the advancement that we made in step 1. 
<br>
<i>(In this example, we'll be checking if the player has the <code>example:test_origin</code> origin and the <code>origins-limiter:can_pick/origin/test_origin</code> advancement):</i>
</summary>

<br>

In this example snippet, we're using the `origins:origin` entity condition type to check if the player has the `example:test_origin` origin, and the `origins:advancement` entity condition type to check if the player has the `origins-limiter:can_pick/origin/test_origin` advancement, which is the `.json` file made in step 1.

```json
{
    "origins": [
        {
            "condition": {
                "type": "origins:and",
                "conditions": [
                    {
                        "type": "origins:origin",
                        "origin": "example:test_origin"
                    },
                    {
                        "type": "origins:advancement",
                        "advancement": "origins-limiter:can_pick/origin/test_origin"
                    }
                ]
            },
            "origins": [
                "example:test_origin"
            ]
        }
    ]
}
```

</details>

<br>

## Using as a Dependency
### Soft-dependency

This datapack library uses [Lantern Load](https://github.com/LanternMC/Load) in order to sort the load order for datapacks that may depend on the datapack library.

<details>
<summary>
In order to ensure that your datapack will load <i>after</i> the datapack library, you can put your load function in the <code>#load:post_load</code> (<code>data/load/tags/functions/post_load.json</code>) function tag after you've copied and pasted the <code>load</code> and <code>minecraft</code> folders from the <a href="https://github.com/LanternMC/Load">Lantern Load</a> GitHub repository to your datapack:
</summary>

```json
{
    "values": [
        "namespace:path/to/function"
    ]
}
```
* `namespace` being the name of the folder that you're using in your datapack's `data` folder. <br>
(e.g: in `data/example`, `example` will be the 'namespace' folder.)
* `path/to/function` being the function that you're using to load stuff. <br>
(e.g: in `data/example/functions/load.mcfunction`, `example:load` will be the full namespace, path and ID of the function.)

</details>

### Hard-dependency

If you want to check if a specific version of the datapack library is loaded, you can check for the `origins-limiter.major`, `origins-limiter.minor` and `origins-limiter.patch` score holders from the `load.status` scoreboard objective. There is also the `root.semver.major`, `root.semver.minor` and `root.semver.patch` NBT paths from the `origins-limiter:main` that you can check for.


<details>
<summary>
Here's an example that would check if v1.4.0 of the datapack library or greater is loaded:
</summary>

```mcfunction
#   Check if v1.4.0 of origins-limiter is loaded
execute if score origins-limiter.major load.status matches 1.. if score origins-limiter.minor load.status matches 4.. run say Datapack loaded! :D


#   Check if v1.4.0 of origins-limiter is NOT loaded
execute unless score origins-limiter.major load.status matches 1.. if score origins-limiter.minor load.status matches 4.. run say Missing origins-limiter_v1.4.0 dependency! D:
```

</details>