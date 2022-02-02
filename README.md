# Limiter (Origins)

A datapack library that can limit how many players can have a certain origin.

If you don't want to (or don't know how to) do the manual work of integrating the datapack library to your datapack, you can create an issue using the ['requesting integration'](https://github.com/eggohito/origins-limiter/issues/new?assignees=eggohito&labels=request&template=requesting-integration.md&title=%5BREQUEST%5D) issue template to this repository's issue tracker.

<br>

## Customizing


### Override
This datapack library allows you to override the limiter system if you don't have the system integrated for some of the origins/origin layers that you may have. It can be done so by granting a certain advancement to a player using the `/advancement` command, like so:

```mcfunction
#   In this example, we will grant the override to ourselves for the `origins:origin` origin layer, the default origin layer
advancement grant @s only origins-limiter:status/override/origins/origin


#   If we want to remove the override we just granted, we can simply revoke the advancement
advancement revoke @s only origins-limiter:status/override/origins/origin
```


### Scoreboard Objectives
This datapack library provides some scoreboard objectives for configuration.

Name       | Description
-----------|------------
`o-l.max`  | Stores the max count of players that can have a certain origin.
`o-l.cur`  | Stores the current count of players that have a certain origin.
`o-l.main` | Stores the `updateInterval` score holder, and other private score holders.


### Score Holders
This datapack library provides some score holders that you can modify or only read the value of from the scoreboard objectives listed above.

Name                                | Description
:----------------------------------:|------------
`updateInterval` in <br> `o-l.main` | Determines how fast the score of the score holders in the `o-l.cur` scoreboard objective is updated in ticks.
Score Holders in <br> `o-l.cur`     | The score of the score holders in the `o-l.cur` scoreboard objective **cannot be modified.**
Score Holders in <br> `o-l.max`     | The score of the score holders in the `o-l.max` scoreboard objective **can be modified.**

<br>

## How to Use

> ### :information_source: These are the steps for integrating the datapack library to your datapack. If you only want to limit the base origins, you don't have to follow these steps!
<br>

In the following steps, we'll be using [this datapack](https://github.com/eggohito/origins-limiter/tree/example/test_origin) as our reference.

<details>
<summary>
<b>1.</b> Create a <code>.json</code> file in the <code>data/origins-limiter/advancements/can_pick</code> folder of <b>your datapack</b>. For consistency, I would suggest naming the <code>.json</code> file after the origin that you want to limit.

<br>
<br>

<i>(In this example, we'll be creating a folder named after the namespace of the origin, and name the <code>.json</code> file after the ID of the origin. The namespace and ID of the origin being <code>example:test_origin</code>):</i>
</summary>

<br>

`data/origins-limiter/advancements/can_pick/example/test_origin.json`

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

<br>

<details>
<summary>
<b>2.</b> Create an <code>.mcfunction</code> file in the <code>data/origins-limiter/functions/can_pick</code> folder in <b>your datapack</b>. This function will be the one responsible for counting how many players currently have the origin that we want to limit.

<br>
<br>

<i>(In this example, we'll be creating a folder named after the namespace of the origin, and name the <code>.mcfunction</code> file after the ID of the origin. The namespace and ID of the origin being <code>example:test_origin</code>):</i>
</summary>

<br>

`data/origins-limiter/functions/can_pick/example/test_origin.mcfunction`

```mcfunction
#   Set the max count for this origin once (can then be changed in-game afterwards)
#
#   - o-l.max     = the scoreboard objective that stores the max count for the origin
#   - example:test_origin = the score holder for the origin that we want to apply the limit to
#
execute unless score example:test_origin o-l.max = example:test_origin o-l.max run scoreboard players set example:test_origin o-l.max 1


#   Store the count of the players that currently have this origin
#
#   - "example:test_origin" = the namespace and ID of the origin that we want to apply the limit to
#
execute store result score example:test_origin o-l.cur if entity @a[nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "example:test_origin"}]}}}]


#   Grant the player an advancement to indicate that the player can choose the origin. Revoke the advancement otherwise
#
#   - origins-limiter:can_pick/example/test_origin = the .json file that we made in the first step
#
execute if score example:test_origin o-l.cur < example:test_origin o-l.max run advancement grant @a only origins-limiter:can_pick/example/test_origin

execute if score example:test_origin o-l.cur >= example:test_origin o-l.max run advancement revoke @a only origins-limiter:can_pick/example/test_origin
```

</details>

<br>

<details>
<summary>
<b>3.</b> Create a <code>tick.json</code> file in the <code>data/origins-limiter/tags/functions</code> folder of <b>your datapack</b>. Afterwards, reference the namespace, path and ID of the function that you've created in step 2 inside the <code>tick.json</code> file's <code>values</code> string array field. 

<br>
<br>

<i>(In this example, we'll be calling the function that was created in the previous step):</i>
</summary>

<br>

`data/origins-limiter/tags/functions/tick.json`

```json
{
    "values": [
        "origins-limiter:can_pick/example/test_origin"
    ]
}
```

</details>

<br>

<details>
<summary>
<b>4.</b> Create an <code>origin.json</code> file inside the <code>data/origins-limiter/origin_layers/confirm/origins</code> folder of <b>your datapack</b>. Inside the <code>origins</code> array field of the <code>origin.json</code> file, you would use <a href = "https://origins.readthedocs.io/en/latest/guides/data/origin_conditions_in_layers/">Origins' entity condition types</a> to check if the player has the origin that we want to limit, and the advancement that we made in step 1.

<br>
<br>

<i>(In this example, we'll be checking if the player has the <code>example:test_origin</code> origin and the <code>origins-limiter:can_pick/example/test_origin</code> advancement):</i>
</summary>

<br>

In this example snippet, we're using the `origins:origin` entity condition type to check if the player has the `example:test_origin` origin, and the `origins:advancement` entity condition type to check if the player has the `origins-limiter:can_pick/example/test_origin` advancement, which is the `.json` file made in step 1.

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
                        "advancement": "origins-limiter:can_pick/example/test_origin"
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
<br>

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
