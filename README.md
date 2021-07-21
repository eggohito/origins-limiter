# Limiter (Origins)

This datapack uses [Lantern Load](https://github.com/LanternMC/Load) to ensure that this datapack will load before your datapack. You can detect if this library is loaded by checking the `#origins-limiter` score holder in the `load.status` objective.

<ol>
<details>

<summary>To ensure that this library loads before your datapack, you would add your load function inside the <code>#load:post_load</code> (<code>data/load/tags/functions/post_load.json</code>) function tag after copying the <code>minecraft</code> and <code>load</code> folders from the Lantern Load repository, like so:</summary>

```json
{
    "values": [
        "<namespace>:path/to/function"
    ]
}
```
* `<namespace>` being the namespace you're using <br>
(e.g: `data/example` --> `example:...`)

* `path/to/function` being your load function <br>
(e.g: `data/example/functions/load.mcfunction` --> `example:load`)

</details>
</ol>

### How to use:
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

<summary>You can then set the contents of the advancement to this, as we will be only using it as a condition in the <code>origins-limiter:confirm</code> (<code>data/origins-limiter/origin_layers/confirm.json</code>) origin layer.
<br>
<br>

In this example, the name of the advancement is <code>example.json</code> in <code>data/origins-limiter/advancements/can_pick/custom</code>:</summary>
```json
{
    "criteria": {
        "restrict": {
            "trigger": "minecraft:impossible"
        }
    }
}
```

</details>
</ol>
<br>

<ol>
<details>

<summary>Then, you can set the contents of your function to this; this function is essential to keeping track of how many players have the origin , and if players should be able to choose the origin.
<br>
<br>

In this example, the name of the function is <code>example.mcfunction</code> in <code>data/origins-limiter/functions/custom</code>:</summary>
```mcfunction
#   Set the max count for this origin once (can then be changed in-game afterwards)
execute unless score %example o-l.max = %example o-l.max run scoreboard players set %example o-l.max 1


#   Store the count of the players that currently have this origin
execute store result score %example o-l.main if entity @a[nbt = {cardinal_components: {"origins:origin": {OriginLayers: [{Origin: "origins:example"}]}}}]


#   Grant the player an advancement to indicate that the max count for this origin has been reached; used to restricting players from choosing the origin in the `origins:origin` origin layer
execute if score %example o-l.main < %example o-l.max run advancement grant @a only origins-limiter:can_pick/custom/example

execute if score %example o-l.main >= %example o-l.max run advancement revoke @a only origins-limiter:can_pick/custom/example
```

* `%example` is a score holder in both the `o-l.main` and `o-l.max` scoreboard objectives for the `origins:example` origin

* `origins-limiter:can_pick/custom/example` being the advancement for the `origins:example` origin

</details>
</ol>
<br>

<ol>
<details>

<summary>Afterwards, you can reference your function in the <code>#origins-limiter:custom</code> (<code>data/origins-limiter/tags/functions/custom.json</code>) function tag for it to be run per set interval, like so:</summary>

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
