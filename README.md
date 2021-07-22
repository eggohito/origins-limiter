# Limiter (Origins)

This datapack uses [Lantern Load](https://github.com/LanternMC/Load). You can detect if this library is loaded by checking the `origins-limiter` score holder in the `load.status` objective with `execute if score origins-limiter load.status matches <value>`, where `<value>` is a three digit integer.
<br>
e.g: `100` = Version 1.0.0, `110` = Version 1.1.0, etc.
<br>


### How to use
The limiter system has some adjustable variables one can modify however one can, with `/scoreboard players set`:

* `o-l.max` - scoreboard objective; stores the max count of the players that has a certain origin; all the scores of the score holder in this objective can be modified in-game
  
* `o-l.main` - scoreboard objective; stores the current count of the players that has a certain origin; **read only**

* `#updateInterval` score holder in the `o-l.main` scoreboard objective; determines how many ticks should happen before updating the current count of the players; can be modified **but** can't have a value of less than 1
<br> 

In order to use this library, you must create an advancement (`.json` file), and a function (`.mcfunction` file) inside the `data/origins-limiter/advancements/can_pick/custom` and the `data/origins-limiter/functions/custom` folders respectively. You can name them however you want, but it must follow the namespacing rules. I recommend naming them after the origin you want to restrict.
<br>
<br>

<ol>
<details>

<summary>You can set the contents of the advancement to this, as we will be only using it as a condition in the <code>origins-limiter:confirm</code> (<code>data/origins-limiter/origin_layers/confirm.json</code>) origin layer.</summary>

```json
{
    "criteria": {
        "restrict": {
            "trigger": "minecraft:impossible"
        }
    }
}
```

* This advancement being in the `data/origins-limiter/advancements/can_pick/custom` folder

</details>
</ol>

<ol>
<details>

<summary>You can then set the contents of your function to this; the function is essential to keeping track of how many players have the origin, and if players should be able to choose the origin.</summary>

```mcfunction
#   Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score %example o-l.max = %example o-l.max run scoreboard players set %example o-l.max 1


#   Store the count of the players that currently have this origin
execute store result score %example o-l.main if entity @a[nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins:example"}]}}}]


#   Grant the player an advancement to indicate that the max count for this origin has been reached; used to restricting players from choosing the origin in the `origins:origin` origin layer
execute if score %example o-l.main < %example o-l.max run advancement grant @a only origins-limiter:can_pick/custom/example

execute if score %example o-l.main >= %example o-l.max run advancement revoke @a only origins-limiter:can_pick/custom/example
```

* This function being in the `data/origins-limiter/functions/custom` folder

* `%example` is a score holder in both the `o-l.main` and `o-l.max` scoreboard objectives for the `origins:example` origin

* `origins-limiter:can_pick/custom/example` being the advancement for the `origins:example` origin

</details>
</ol>

<ol>
<details>

<summary>Then, you can reference your function in the <code>#origins-limiter:custom</code> (<code>data/origins-limiter/tags/functions/custom.json</code>) function tag for it to be run per set interval</summary>

```json
{
    "values": [
        "origins-limiter:custom/example"
    ]
}
```

* `origins-limiter:custom/example` (`data/origins-limiter/functions/custom/example.mcfunction`) being the function for the `origins:example` origin

</details>
</ol>

<ol>
<details>
<summary>Afterwards, you can then reference the custom origin and the advancement for the custom origin in the <code>origins-limiter:confirm</code> (<code>data/origins-limiter/origin_layers/confirm.json</code>) origin layer.</summary>

```json
{
    "origins": [
        {
            "condition": {
                "type": "origins:and",
                "conditions": [
                    {
                        "type": "origins:origin",
                        "origin": "origins:example"
                    },
                    {
                        "type": "origins:advancement",
                        "advancement": "origins-limiter:can_pick/custom/example"
                    }
                ]
            },
            "origins": [
                "origins:example"
            ]
        }
    ]
}
```

* `origins-limiter:can_pick/custom/example` being the advancement you made in `data/origins-limiter/advancements/custom`
* `origins:example` being the origin JSON

</details>
</ol>
<br>


### Request
You can create an issue using the ['request integration'](https://github.com/eggohito/origins-limiter/issues/new?assignees=&labels=request&template=request-integration.md&title=%5BREQUEST%5D) issue template to this repository if you want to request an Origins datapack to have this system integrated if one can't do it themself. Do note that it may or may not take a while!