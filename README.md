# Limiter (Origins)

This datapack uses [Lantern Load](https://github.com/LanternMC/Load). You can detect if this library is loaded by checking the `origins-limiter` score holder in the `load.status` objective with `execute if score origins-limiter load.status matches <value>`, where `<value>` is a three digit integer.
<br>
e.g: `100` = Version 1.0.0, `110` = Version 1.1.0, etc.
<br>
<br>


## How to use
The limiter system has some adjustable variables one can modify however one can:

* `o-l.max` - scoreboard objective; stores the max count of the players that has a certain origin; all the scores of the score holder in this objective can be modified in-game
  
* `o-l.main` - scoreboard objective; stores the current count of the players that has a certain origin; **read only**

* `#updateInterval` score holder in the `o-l.main` scoreboard objective; determines how many ticks should happen before updating the current count of the players; can be modified **but** can't have a value of less than 1
<br>

In the following steps, we'll be using [this datapack](https://github.com/eggohito/origins-limiter/files/6864726/example_pack.zip) as our reference. Our namespace will be `example` (`data/example`) and our origin will be `example:test_origin` (`data/example/origins/test_origin.json`). We'll be naming the function and advancement to have the same name as the origin JSON for consistency.
<br>


<ol>
<details>

<summary>Create an advancement (a text file with the <code>.json</code> file extension) in the <code>data/origins-limiter/advancements/can_pick/custom</code> folder in your datapack. This advancement will be used for checking if the player can pick the origin you want to restrict</summary>

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
</ol>

<ol>
<details>

<summary>Create a function file (a text file with the <code>.mcfunction</code> file extension) in the <code>data/origins-limiter/functions/custom</code> folder in your datapack. This function will be used for tracking/controlling how many players have the certain origin you want to restrict</summary>

```mcfunction
#   Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score %test_origin o-l.max = %test_origin o-l.max run scoreboard players set %test_origin o-l.max 1


#   Store the count of the players that currently have this origin
execute store result score %test_origin o-l.main if entity @a[nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "example:test_origin"}]}}}]


#   Grant the player an advancement to indicate that the player can choose the origin. Revoke the advancement otherwise
execute if score %test_origin o-l.main < %test_origin o-l.max run advancement grant @a only origins-limiter:can_pick/custom/test_origin

execute if score %test_origin o-l.main >= %test_origin o-l.max run advancement revoke @a only origins-limiter:can_pick/custom/test_origin
```

* `%test_origin` score holder in the `o-l.main` objective is used for tracking how many players have the `example:test_origin` origin

* `%test_origin` score holder in the `o-l.max` objective is the max count of players that can have the `example:test_origin` origin

* `origins-limiter:can_pick/custom/test_origin` (`data/origins-limiter/advancements/custom/test_origin.json`) being the advancement for the `example:test_origin` origin

* `example:test_origin` (`data/example/origins/test_origin.json`) being the origin you want to restrict

</details>
</ol>

<ol>
<details>

<summary>You can then reference your newly created function in the <code>#origins-limiter:custom</code> (<code>data/origins-limiter/tags/functions/custom.json</code>) function tag to run the function per interval</summary>

```json
{
    "values": [
        "origins-limiter:custom/test_origin"
    ]
}
```

* `origins-limiter:custom/test_origin` (`data/origins-limiter/functions/custom/test_origin.mcfunction`) being the function for the `example:test_origin` origin

</details>
</ol>

<ol>
<details>
<summary>Afterwards, you can then reference the custom origin and the advancement for the custom origin in the <code>origins-limiter:confirm</code> (<code>data/origins-limiter/origin_layers/confirm.json</code>) origin layer</summary>

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
                        "advancement": "origins-limiter:can_pick/custom/test_origin"
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

* `origins-limiter:can_pick/custom/test_origin` (`data/origins-limiter/advancements/can_pick/custom/test_origin.json`) being the advancement for the `example:test_origin` origin

* `example:test_origin` (`data/example/origins/test_origin.json`) being the origin you want to restrict

</details>
</ol>
<br>


## Request
You can create an issue using the ['request integration'](https://github.com/eggohito/origins-limiter/issues/new?assignees=&labels=request&template=request-integration.md&title=%5BREQUEST%5D) issue template to this repository if you want to request an Origins datapack to have this system integrated if one can't do it themself. Do note that it may or may not take a while!
